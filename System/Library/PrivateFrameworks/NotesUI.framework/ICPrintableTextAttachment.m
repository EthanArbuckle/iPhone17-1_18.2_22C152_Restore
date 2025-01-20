@interface ICPrintableTextAttachment
- (CGPoint)frameOffset;
- (CGRect)adjustedBounds:(CGRect)a3 forProposedLineFragment:(CGRect)a4;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (void)setFrameOffset:(CGPoint)a3;
@end

@implementation ICPrintableTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)ICPrintableTextAttachment;
  -[ICPrintableTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v11, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  -[ICPrintableTextAttachment adjustedBounds:forProposedLineFragment:](self, "adjustedBounds:forProposedLineFragment:");
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  v12.receiver = self;
  v12.super_class = (Class)ICPrintableTextAttachment;
  -[ICPrintableTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v12, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  -[ICPrintableTextAttachment adjustedBounds:forProposedLineFragment:](self, "adjustedBounds:forProposedLineFragment:");
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)adjustedBounds:(CGRect)a3 forProposedLineFragment:(CGRect)a4
{
  double width = a4.size.width;
  CGFloat height = a3.size.height;
  CGFloat v6 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(ICPrintableTextAttachment *)self frameOffset];
  CGFloat v11 = v10;
  [(ICPrintableTextAttachment *)self frameOffset];
  CGFloat v13 = v12;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.double width = v6;
  v24.size.CGFloat height = height;
  CGRect v25 = CGRectOffset(v24, v11, v13);
  CGFloat v14 = v25.origin.x;
  CGFloat v15 = v25.origin.y;
  CGFloat v16 = v25.size.width;
  CGFloat v17 = v25.size.height;
  if (width / v25.size.width < 1.0)
  {
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, width / v25.size.width, width / v25.size.width);
    CGAffineTransform v22 = v23;
    v26.origin.CGFloat x = v14;
    v26.origin.CGFloat y = v15;
    v26.size.double width = v16;
    v26.size.CGFloat height = v17;
    CGRect v27 = CGRectApplyAffineTransform(v26, &v22);
    CGFloat v14 = v27.origin.x;
    CGFloat v15 = v27.origin.y;
    CGFloat v16 = v27.size.width;
    CGFloat v17 = v27.size.height;
  }
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGPoint)frameOffset
{
  double x = self->_frameOffset.x;
  double y = self->_frameOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFrameOffset:(CGPoint)a3
{
  self->_frameOffset = a3;
}

@end