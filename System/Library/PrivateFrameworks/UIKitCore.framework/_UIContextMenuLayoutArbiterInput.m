@interface _UIContextMenuLayoutArbiterInput
- ($9638EFF0CCCAFE90921E224CC361F7AC)preferredAnchor;
- (BOOL)_hasVisibleMenu;
- (BOOL)shouldAvoidInputViews;
- (BOOL)shouldConcealMenu;
- (BOOL)shouldUpdateAttachment;
- (CGPoint)preferredMenuAttachmentPoint;
- (CGSize)preferredMenuSize;
- (CGSize)preferredPreviewSize;
- (NSArray)accessoryViews;
- (UIEdgeInsets)preferredEdgeInsets;
- (UITargetedPreview)sourcePreview;
- (_UIContextMenuLayoutArbiterInput)init;
- (double)maximumMenuHeight;
- (double)preferredContentSpacing;
- (id)computePreferredScrollTruncationDetentForHeight;
- (unint64_t)preferredPreviewFittingStrategy;
- (void)setAccessoryViews:(id)a3;
- (void)setComputePreferredScrollTruncationDetentForHeight:(id)a3;
- (void)setMaximumMenuHeight:(double)a3;
- (void)setPreferredAnchor:(id *)a3;
- (void)setPreferredContentSpacing:(double)a3;
- (void)setPreferredEdgeInsets:(UIEdgeInsets)a3;
- (void)setPreferredMenuAttachmentPoint:(CGPoint)a3;
- (void)setPreferredMenuSize:(CGSize)a3;
- (void)setPreferredPreviewFittingStrategy:(unint64_t)a3;
- (void)setPreferredPreviewSize:(CGSize)a3;
- (void)setShouldAvoidInputViews:(BOOL)a3;
- (void)setShouldConcealMenu:(BOOL)a3;
- (void)setShouldUpdateAttachment:(BOOL)a3;
- (void)setSourcePreview:(id)a3;
@end

@implementation _UIContextMenuLayoutArbiterInput

- (_UIContextMenuLayoutArbiterInput)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuLayoutArbiterInput;
  v2 = [(_UIContextMenuLayoutArbiterInput *)&v5 init];
  v3 = v2;
  if (v2)
  {
    -[_UIContextMenuLayoutArbiterInput setPreferredMenuAttachmentPoint:](v2, "setPreferredMenuAttachmentPoint:", 1.79769313e308, 1.79769313e308);
    [(_UIContextMenuLayoutArbiterInput *)v3 setMaximumMenuHeight:1.79769313e308];
  }
  return v3;
}

- (BOOL)_hasVisibleMenu
{
  [(_UIContextMenuLayoutArbiterInput *)self preferredMenuSize];
  if (v3 <= 0.00000011920929) {
    return 0;
  }
  [(_UIContextMenuLayoutArbiterInput *)self preferredMenuSize];
  return v4 > 0.00000011920929;
}

- (BOOL)shouldUpdateAttachment
{
  return self->_shouldUpdateAttachment;
}

- (void)setShouldUpdateAttachment:(BOOL)a3
{
  self->_shouldUpdateAttachment = a3;
}

- (BOOL)shouldAvoidInputViews
{
  return self->_shouldAvoidInputViews;
}

- (void)setShouldAvoidInputViews:(BOOL)a3
{
  self->_shouldAvoidInputViews = a3;
}

- (BOOL)shouldConcealMenu
{
  return self->_shouldConcealMenu;
}

- (void)setShouldConcealMenu:(BOOL)a3
{
  self->_shouldConcealMenu = a3;
}

- (CGSize)preferredPreviewSize
{
  double width = self->_preferredPreviewSize.width;
  double height = self->_preferredPreviewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredPreviewSize:(CGSize)a3
{
  self->_preferredPreviewSize = a3;
}

- (CGSize)preferredMenuSize
{
  double width = self->_preferredMenuSize.width;
  double height = self->_preferredMenuSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredMenuSize:(CGSize)a3
{
  self->_preferredMenuSize = a3;
}

- (double)maximumMenuHeight
{
  return self->_maximumMenuHeight;
}

- (void)setMaximumMenuHeight:(double)a3
{
  self->_maximumMenuHeight = a3;
}

- (CGPoint)preferredMenuAttachmentPoint
{
  double x = self->_preferredMenuAttachmentPoint.x;
  double y = self->_preferredMenuAttachmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreferredMenuAttachmentPoint:(CGPoint)a3
{
  self->_preferredMenuAttachmentPoint = a3;
}

- (UIEdgeInsets)preferredEdgeInsets
{
  double top = self->_preferredEdgeInsets.top;
  double left = self->_preferredEdgeInsets.left;
  double bottom = self->_preferredEdgeInsets.bottom;
  double right = self->_preferredEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPreferredEdgeInsets:(UIEdgeInsets)a3
{
  self->_preferredEdgeInsets = a3;
}

- (double)preferredContentSpacing
{
  return self->_preferredContentSpacing;
}

- (void)setPreferredContentSpacing:(double)a3
{
  self->_preferredContentSpacing = a3;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)preferredAnchor
{
  long long v3 = *(_OWORD *)&self[4].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = *(void *)&self[4].var2;
  return self;
}

- (void)setPreferredAnchor:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  self->_preferredAnchor.gravitdouble y = a3->var4;
  *(_OWORD *)&self->_preferredAnchor.attachment = v3;
  *(_OWORD *)&self->_preferredAnchor.attachmentOffset = v4;
}

- (unint64_t)preferredPreviewFittingStrategy
{
  return self->_preferredPreviewFittingStrategy;
}

- (void)setPreferredPreviewFittingStrategy:(unint64_t)a3
{
  self->_preferredPreviewFittingStrategdouble y = a3;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
}

- (NSArray)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
}

- (id)computePreferredScrollTruncationDetentForHeight
{
  return self->_computePreferredScrollTruncationDetentForHeight;
}

- (void)setComputePreferredScrollTruncationDetentForHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_computePreferredScrollTruncationDetentForHeight, 0);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
}

@end