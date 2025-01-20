@interface _NSTextAttachmentLayoutInfo
- (CGPoint)attachmentFrameOrigin;
- (CGRect)resolvedAttachmentFrame;
- (NSDictionary)attributes;
- (NSTextAttachment)textAttachment;
- (NSTextAttachmentViewProvider)textAttachmentViewProvider;
- (NSTextLocation)location;
- (_NSTextAttachmentLayoutContext)layoutContext;
- (_NSTextAttachmentLayoutInfo)initWithContext:(id)a3 location:(id)a4 attributes:(id)a5;
- (__CTRunDelegate)runDelegate;
- (id)textLayoutFragment;
- (void)_invalidateLocations;
- (void)_queryLayout;
- (void)_queryLayoutWithHorizontalOffset:(double)a3;
- (void)dealloc;
- (void)invalidateAttachmentMeasurements;
- (void)setAttachmentFrameOrigin:(CGPoint)a3;
- (void)setTextAttachmentViewProvider:(id)a3;
@end

@implementation _NSTextAttachmentLayoutInfo

- (void)_queryLayout
{
  if (self->_isLineFragmentLayout && !self->_isBoundsValid)
  {
    v3 = [(_NSTextAttachmentLayoutInfo *)self location];
    int64_t v4 = [(_NSTextAttachmentLayoutContext *)self->_layoutContext applicationFrameworkContext];
    [(_NSTextAttachmentLayoutContext *)self->_layoutContext proposedLineFragmentRectForLocation:v3 attributes:self->_attributes baselineOffset:&self->_baselineOffset];
    self->_proposedLineFragment.origin.x = v5;
    self->_proposedLineFragment.origin.y = v6;
    self->_proposedLineFragment.size.width = v7;
    self->_proposedLineFragment.size.height = v8;
    double baselineOffset = self->_baselineOffset;
    double horizontalOffset = self->_horizontalOffset;
    id v11 = [(_NSTextAttachmentLayoutContext *)self->_layoutContext textContainerForLocation:v3];
    -[NSTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](self->_textAttachment, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", self->_attributes, v3, v11, self->_proposedLineFragment.origin.x, self->_proposedLineFragment.origin.y, self->_proposedLineFragment.size.width, self->_proposedLineFragment.size.height, horizontalOffset, baselineOffset);
    self->_bounds.origin.x = v12;
    self->_bounds.origin.y = v13;
    self->_bounds.size.width = v14;
    self->_bounds.size.height = v15;
    if (v4 == 2)
    {
      [(NSTextAttachment *)self->_textAttachment bounds];
      if (CGRectIsEmpty(v23))
      {
        v16 = [(NSTextAttachment *)self->_textAttachment image];
        if ([(UIImage *)v16 conformsToProtocol:&unk_1EDD8B9A8])
        {
          [(UIImage *)v16 size];
          v24.size.width = v17;
          v24.size.height = v18;
          v24.origin.x = 0.0;
          v24.origin.y = 0.0;
          if (CGRectEqualToRect(self->_bounds, v24))
          {
            if ([(UIImage *)v16 willProvideAdaptedImageForPresentation])
            {
              -[UIImage attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](v16, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", self->_attributes, v3, v11, self->_proposedLineFragment.origin.x, self->_proposedLineFragment.origin.y, self->_proposedLineFragment.size.width, self->_proposedLineFragment.size.height, horizontalOffset, baselineOffset);
              self->_bounds.origin.x = v19;
              self->_bounds.origin.y = v20;
              self->_bounds.size.width = v21;
              self->_bounds.size.height = v22;
            }
          }
        }
      }
    }
    self->_isBoundsValid = 1;
  }
}

- (void)_queryLayoutWithHorizontalOffset:(double)a3
{
  if (self->_horizontalOffset != a3)
  {
    self->_double horizontalOffset = a3;
    self->_isBoundsValid = 0;
  }
  [(_NSTextAttachmentLayoutInfo *)self _queryLayout];
}

- (NSTextLocation)location
{
  objc_sync_enter(self);
  location = self->_location;
  if (!location)
  {
    int64_t v4 = [(_NSTextAttachmentLayoutContext *)self->_layoutContext baseLocation];
    CGFloat v5 = objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](self, "textLayoutFragment"), "textParagraph");
    if (v5)
    {
      CGFloat v6 = (NSTextLocation *)(id)[v5 locationForCharacterIndex:self->_locationOffsetFromBase dataSourceLocationsOnly:0 actualRange:0];
      self->_location = v6;
      if (!v6) {
        goto LABEL_6;
      }
    }
    else
    {
      CGFloat v6 = self->_location;
      if (!v6)
      {
LABEL_6:
        CGFloat v6 = (NSTextLocation *)(id)objc_msgSend((id)objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](self, "textLayoutFragment"), "textLayoutManager"), "locationFromLocation:withOffset:", v4, self->_locationOffsetFromBase);
        self->_location = v6;
      }
    }
    [(NSTextAttachmentViewProvider *)[(_NSTextAttachmentLayoutInfo *)self textAttachmentViewProvider] setLocation:v6];
    location = self->_location;
  }
  objc_sync_exit(self);
  return location;
}

- (void)dealloc
{
  runDelegate = self->_runDelegate;
  if (runDelegate) {
    CFRelease(runDelegate);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSTextAttachmentLayoutInfo;
  [(_NSTextAttachmentLayoutInfo *)&v4 dealloc];
}

- (__CTRunDelegate)runDelegate
{
  objc_sync_enter(self);
  runDelegate = self->_runDelegate;
  if (!runDelegate)
  {
    CTRunDelegateCallbacks v5 = *(CTRunDelegateCallbacks *)byte_1EDD49A48;
    runDelegate = CTRunDelegateCreate(&v5, self);
    self->_runDelegate = runDelegate;
  }
  objc_sync_exit(self);
  return runDelegate;
}

- (_NSTextAttachmentLayoutInfo)initWithContext:(id)a3 location:(id)a4 attributes:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)_NSTextAttachmentLayoutInfo;
  CGFloat v8 = [(_NSTextAttachmentLayoutInfo *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_layoutContext = (_NSTextAttachmentLayoutContext *)a3;
    uint64_t v10 = [a5 objectForKeyedSubscript:@"NSAttachment"];
    v9->_textAttachment = (NSTextAttachment *)v10;
    if (v10)
    {
      v9->_location = (NSTextLocation *)a4;
      v9->_attributes = (NSDictionary *)a5;
      v9->_isLineFragmentLayout = 1;
      uint64_t v11 = [(_NSTextAttachmentLayoutContext *)v9->_layoutContext baseLocation];
      if (v11)
      {
        uint64_t v12 = v11;
        CGFloat v13 = objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](v9, "textLayoutFragment"), "textParagraph");
        if (!v13
          || (uint64_t v14 = [v13 rangeForLocation:a4 allowsTrailingEdge:0], v14 == 0x7FFFFFFFFFFFFFFFLL))
        {
          uint64_t v14 = objc_msgSend((id)objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](v9, "textLayoutFragment"), "textLayoutManager"), "offsetFromLocation:toLocation:", v12, v9->_location);
        }
        v9->_locationOffsetFromBase = v14;
      }
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (id)textLayoutFragment
{
  return [(_NSTextAttachmentLayoutContext *)self->_layoutContext textLayoutFragment];
}

- (NSTextAttachmentViewProvider)textAttachmentViewProvider
{
  objc_sync_enter(self);
  textAttachmentViewProvider = self->_textAttachmentViewProvider;
  if (textAttachmentViewProvider && !self->_location)
  {
    [(_NSTextAttachmentLayoutInfo *)self location];
    textAttachmentViewProvider = self->_textAttachmentViewProvider;
  }
  objc_super v4 = textAttachmentViewProvider;
  objc_sync_exit(self);
  return v4;
}

- (void)invalidateAttachmentMeasurements
{
  self->_isBoundsValid = 0;
}

- (void)setTextAttachmentViewProvider:(id)a3
{
  objc_sync_enter(self);
  textAttachmentViewProvider = self->_textAttachmentViewProvider;
  if (textAttachmentViewProvider != a3)
  {

    a3 = a3;
    self->_textAttachmentViewProvider = (NSTextAttachmentViewProvider *)a3;
  }
  if (a3) {
    [(_NSTextAttachmentLayoutContext *)self->_layoutContext setHasViewProvider:1];
  }

  objc_sync_exit(self);
}

- (CGRect)resolvedAttachmentFrame
{
  objc_copyStruct(v6, &self->_resolvedAttachmentFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAttachmentFrameOrigin:(CGPoint)a3
{
  self->_resolvedAttachmentFrame.origin = a3;
  self->_resolvedAttachmentFrame.size = self->_bounds.size;
  [(_NSTextAttachmentLayoutContext *)self->_layoutContext setHasResolvedAttachmentFrame:1];
}

- (CGPoint)attachmentFrameOrigin
{
  BOOL v3 = [(_NSTextAttachmentLayoutContext *)self->_layoutContext hasResolvedAttachmentFrame];
  p_resolvedAttachmentFrame = &self->_resolvedAttachmentFrame;
  p_y = &self->_resolvedAttachmentFrame.origin.y;
  if (!v3)
  {
    p_resolvedAttachmentFrame = (CGRect *)MEMORY[0x1E4F1DAD8];
    p_y = (CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v6 = *p_y;
  double x = p_resolvedAttachmentFrame->origin.x;
  result.y = v6;
  result.double x = x;
  return result;
}

- (void)_invalidateLocations
{
  self->_location = 0;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSTextAttachment)textAttachment
{
  return self->_textAttachment;
}

- (_NSTextAttachmentLayoutContext)layoutContext
{
  return self->_layoutContext;
}

@end