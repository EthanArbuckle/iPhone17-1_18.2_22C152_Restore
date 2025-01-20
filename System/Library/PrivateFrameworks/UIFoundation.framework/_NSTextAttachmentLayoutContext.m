@interface _NSTextAttachmentLayoutContext
- (BOOL)allowsFontOverridingTextAttachmentVerticalMetrics;
- (BOOL)hasResolvedAttachmentFrame;
- (BOOL)hasViewProvider;
- (BOOL)usesFontLeading;
- (CGRect)proposedLineFragmentRectForLocation:(id)a3 attributes:(id)a4 baselineOffset:(double *)a5;
- (NSArray)textAttachmentViewProviders;
- (NSTextContainer)textContainer;
- (NSTextLayoutFragment)textLayoutFragment;
- (NSTextLocation)baseLocation;
- (_NSTextAttachmentLayoutContext)init;
- (_NSTextAttachmentLayoutContext)initWithDelegate:(id)a3;
- (_NSTextLayoutAttachmentLayoutContextDelegate)delegate;
- (id)_sortedKeys;
- (id)textAttachmentLayoutInfoForLocation:(id)a3 attributes:(id)a4;
- (id)textContainerForLocation:(id)a3;
- (int64_t)applicationFrameworkContext;
- (void)_adjustLocations;
- (void)_flushCachedInfo;
- (void)dealloc;
- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (void)invalidateAttachmentFrames;
- (void)reset;
- (void)setAllowsFontOverridingTextAttachmentVerticalMetrics:(BOOL)a3;
- (void)setApplicationFrameworkContext:(int64_t)a3;
- (void)setHasResolvedAttachmentFrame:(BOOL)a3;
- (void)setHasViewProvider:(BOOL)a3;
- (void)setTextContainer:(id)a3;
- (void)setTextLayoutFragment:(id)a3;
- (void)setUsesFontLeading:(BOOL)a3;
@end

@implementation _NSTextAttachmentLayoutContext

- (void)setUsesFontLeading:(BOOL)a3
{
  self->_usesFontLeading = a3;
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  self->_applicationFrameworkContext = a3;
}

- (void)setAllowsFontOverridingTextAttachmentVerticalMetrics:(BOOL)a3
{
  self->_allowsFontOverridingTextAttachmentVerticalMetrics = a3;
}

- (CGRect)proposedLineFragmentRectForLocation:(id)a3 attributes:(id)a4 baselineOffset:(double *)a5
{
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v28 = *MEMORY[0x1E4F1DB28];
  long long v29 = v8;
  uint64_t v27 = 0;
  delegate = self->_delegate;
  if (delegate)
  {
    -[_NSTextLayoutAttachmentLayoutContextDelegate proposedLineFragmentRectForLocation:](delegate, "proposedLineFragmentRectForLocation:", a3, a4);
    double v11 = v10;
    *(void *)&long long v28 = v12;
    *((void *)&v28 + 1) = v13;
    *((void *)&v29 + 1) = v14;
    [(_NSTextLayoutAttachmentLayoutContextDelegate *)self->_delegate baselineOffsetForLocation:a3];
    uint64_t v27 = v15;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v17 = [a4 objectForKeyedSubscript:@"NSParagraphStyle"];
  id v18 = [(_NSTextAttachmentLayoutContext *)self textContainerForLocation:a3];
  +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", a4, [NSString typesetterBehavior], -[_NSTextAttachmentLayoutContext usesFontLeading](self, "usesFontLeading"), v17 != 0, 0, 0, objc_msgSend(v18, "layoutOrientation"), (char *)&v29 + 8, &v27, 0);
  if (!v18)
  {
    double v11 = 40000.0;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [v18 lineFragmentPadding];
  double v20 = v19;
  [v18 size];
  double v22 = v21 + v20 * -2.0;
  if (v22 >= 0.0) {
    double v11 = v22;
  }
  else {
    double v11 = 0.0;
  }
  if (a5) {
LABEL_9:
  }
    *(void *)a5 = v27;
LABEL_10:
  double v24 = *((double *)&v28 + 1);
  double v23 = *(double *)&v28;
  double v25 = *((double *)&v29 + 1);
  double v26 = v11;
  result.size.height = v25;
  result.size.width = v26;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)textContainerForLocation:(id)a3
{
  id result = (id)[(_NSTextLayoutAttachmentLayoutContextDelegate *)self->_delegate textContainerForLocation:a3];
  if (!result) {
    return self->_textContainer;
  }
  return result;
}

- (BOOL)usesFontLeading
{
  return self->_usesFontLeading;
}

- (int64_t)applicationFrameworkContext
{
  return self->_applicationFrameworkContext;
}

- (NSTextLocation)baseLocation
{
  return self->_baseLocation;
}

- (void)_adjustLocations
{
  v3 = [(_NSTextAttachmentLayoutContext *)self textLayoutFragment];
  if ([(NSTextLayoutFragment *)v3 textLayoutManager])
  {
    id v4 = [(NSTextRange *)[(NSTextLayoutFragment *)v3 rangeInElement] location];
    if (([v4 isEqual:self->_baseLocation] & 1) == 0)
    {
      v5 = [(NSMapTable *)self->_textAttachmentInfoTable objectEnumerator];
      [(_NSTextAttachmentLayoutContext *)self _flushCachedInfo];

      self->_baseLocation = (NSTextLocation *)v4;
      while (1)
      {
        id v6 = [(NSEnumerator *)v5 nextObject];
        if (!v6) {
          break;
        }
        [v6 _invalidateLocations];
      }
    }
  }
}

- (NSTextLayoutFragment)textLayoutFragment
{
  return self->_textLayoutFragment;
}

- (id)textAttachmentLayoutInfoForLocation:(id)a3 attributes:(id)a4
{
  objc_sync_enter(self);
  v7 = [(_NSTextAttachmentLayoutContext *)self baseLocation];
  id v8 = a3;
  if (v7)
  {
    v9 = [(_NSTextAttachmentLayoutContext *)self textLayoutFragment];
    double v10 = [(NSTextLayoutFragment *)v9 textParagraph];
    if (!v10
      || (uint64_t v11 = [(NSTextParagraph *)v10 rangeForLocation:a3 allowsTrailingEdge:0], v11 == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v11 = [(NSTextLayoutManager *)[(NSTextLayoutFragment *)v9 textLayoutManager] offsetFromLocation:v7 toLocation:a3];
    }
    id v8 = (id)[NSNumber numberWithInteger:v11];
  }
  uint64_t v12 = [(NSMapTable *)self->_textAttachmentInfoTable objectForKey:v8];
  if (!v12)
  {
    uint64_t v12 = [[_NSTextAttachmentLayoutInfo alloc] initWithContext:self location:a3 attributes:a4];
    if (v12)
    {
      textAttachmentInfoTable = self->_textAttachmentInfoTable;
      if (!textAttachmentInfoTable)
      {
        textAttachmentInfoTable = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        self->_textAttachmentInfoTable = textAttachmentInfoTable;
      }
      [(NSMapTable *)textAttachmentInfoTable setObject:v12 forKey:v8];

      [(_NSTextAttachmentLayoutContext *)self _flushCachedInfo];
    }
  }
  objc_sync_exit(self);
  return v12;
}

- (void)_flushCachedInfo
{
  self->_sortedKeys = 0;
  self->_textAttachmentViewProviders = 0;
}

- (void)setTextContainer:(id)a3
{
  self->_textContainer = (NSTextContainer *)a3;
}

- (void)setHasResolvedAttachmentFrame:(BOOL)a3
{
  self->_hasResolvedAttachmentFrame = a3;
}

- (void)invalidateAttachmentFrames
{
}

- (void)reset
{
  objc_sync_enter(self);
  v3 = [(NSMapTable *)self->_textAttachmentInfoTable objectEnumerator];
  while (1)
  {
    id v4 = [(NSEnumerator *)v3 nextObject];
    if (!v4) {
      break;
    }
    [v4 invalidateAttachmentMeasurements];
  }
  self->_textContainer = 0;
  [(_NSTextAttachmentLayoutContext *)self _flushCachedInfo];
  [(_NSTextAttachmentLayoutContext *)self invalidateAttachmentFrames];

  objc_sync_exit(self);
}

- (NSArray)textAttachmentViewProviders
{
  objc_sync_enter(self);
  [(_NSTextAttachmentLayoutContext *)self _adjustLocations];
  if (!self->_sortedKeys && [(NSMapTable *)self->_textAttachmentInfoTable count])
  {
    v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMapTable count](self->_textAttachmentInfoTable, "count"));
    id v6 = [(NSMapTable *)self->_textAttachmentInfoTable objectEnumerator];
    for (id i = [(NSEnumerator *)v6 nextObject]; i; id i = [(NSEnumerator *)v6 nextObject])
    {
      uint64_t v8 = [i textAttachmentViewProvider];
      if (v8) {
        [(NSArray *)v5 addObject:v8];
      }
    }
    if ([(NSArray *)v5 count])
    {

      self->_textAttachmentViewProviders = v5;
    }
    else
    {
    }
  }
  textAttachmentViewProviders = self->_textAttachmentViewProviders;
  objc_sync_exit(self);
  return textAttachmentViewProviders;
}

- (void)setHasViewProvider:(BOOL)a3
{
  self->_hasViewProvider = a3;
}

- (BOOL)hasResolvedAttachmentFrame
{
  return self->_hasResolvedAttachmentFrame;
}

- (_NSTextAttachmentLayoutContext)init
{
  return [(_NSTextAttachmentLayoutContext *)self initWithDelegate:0];
}

- (_NSTextAttachmentLayoutContext)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NSTextAttachmentLayoutContext;
  id v4 = [(_NSTextAttachmentLayoutContext *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (_NSTextLayoutAttachmentLayoutContextDelegate *)a3;
    v4->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
    v5->_allowsFontOverridingTextAttachmentVerticalMetrics = 1;
  }
  return v5;
}

- (void)setTextLayoutFragment:(id)a3
{
  self->_textLayoutFragment = (NSTextLayoutFragment *)a3;
}

- (void)dealloc
{
  [(_NSTextAttachmentLayoutContext *)self _flushCachedInfo];
  v3.receiver = self;
  v3.super_class = (Class)_NSTextAttachmentLayoutContext;
  [(_NSTextAttachmentLayoutContext *)&v3 dealloc];
}

- (id)_sortedKeys
{
  objc_sync_enter(self);
  sortedKeys = self->_sortedKeys;
  if (!sortedKeys)
  {
    if ([(NSMapTable *)self->_textAttachmentInfoTable count])
    {
      sortedKeys = [(NSArray *)NSAllMapTableKeys(self->_textAttachmentInfoTable) sortedArrayUsingSelector:sel_compare_];
      self->_sortedKeys = sortedKeys;
    }
    else
    {
      sortedKeys = self->_sortedKeys;
    }
  }
  objc_sync_exit(self);
  return sortedKeys;
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  if ([(_NSTextAttachmentLayoutContext *)self hasViewProvider])
  {
    id v7 = [(_NSTextAttachmentLayoutContext *)self _sortedKeys];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91___NSTextAttachmentLayoutContext_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
    v8[3] = &unk_1E55CE050;
    v8[4] = self;
    v8[5] = a5;
    [v7 enumerateObjectsWithOptions:0 usingBlock:v8];
  }
}

- (_NSTextLayoutAttachmentLayoutContextDelegate)delegate
{
  return self->_delegate;
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (BOOL)hasViewProvider
{
  return self->_hasViewProvider;
}

- (BOOL)allowsFontOverridingTextAttachmentVerticalMetrics
{
  return self->_allowsFontOverridingTextAttachmentVerticalMetrics;
}

@end