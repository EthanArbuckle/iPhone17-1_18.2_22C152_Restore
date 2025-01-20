@interface PXTilingChangeEvent
- (CGSize)referenceSize;
- (PXTilingChangeEvent)init;
- (PXTilingChangeEvent)initWithChangeToContentInset:(UIEdgeInsets)a3;
- (PXTilingChangeEvent)initWithChangeToLayout:(id)a3;
- (PXTilingChangeEvent)initWithChangeToReferenceSize:(CGSize)a3;
- (PXTilingChangeEvent)initWithCoordinateSpaceChange;
- (PXTilingChangeEvent)initWithLayoutInvalidationContext:(id)a3;
- (PXTilingLayout)layout;
- (PXTilingLayoutInvalidationContext)context;
- (UIEdgeInsets)contentInset;
- (id)description;
- (int64_t)type;
@end

@implementation PXTilingChangeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (PXTilingLayoutInvalidationContext)context
{
  return self->_context;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXTilingLayout)layout
{
  return self->_layout;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = v3;
  switch(self->_type)
  {
    case 0:
      v5 = @", type=?";
      goto LABEL_8;
    case 1:
      [v3 appendFormat:@", type=layoutChange, layout=%@", self->_layout];
      break;
    case 2:
      v6 = NSStringFromCGSize(self->_referenceSize);
      [v4 appendFormat:@", type=referenceSizeChange, referenceSize=%@", v6];
      goto LABEL_6;
    case 3:
      v6 = NSStringFromUIEdgeInsets(self->_contentInset);
      [v4 appendFormat:@", type=contentInsetChange, contentInset=%@", v6];
LABEL_6:

      break;
    case 4:
      v5 = @", type=coordinateSpaceChange";
LABEL_8:
      [v3 appendString:v5];
      break;
    case 5:
      [v3 appendFormat:@", type=layoutInvalidation, context=%@", self->_context];
      break;
    default:
      break;
  }
  [v4 appendString:@">"];
  return v4;
}

- (PXTilingChangeEvent)initWithLayoutInvalidationContext:(id)a3
{
  id v5 = a3;
  v6 = [(PXTilingChangeEvent *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 5;
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (PXTilingChangeEvent)initWithCoordinateSpaceChange
{
  CGSize result = [(PXTilingChangeEvent *)self init];
  if (result) {
    result->_type = 4;
  }
  return result;
}

- (PXTilingChangeEvent)initWithChangeToContentInset:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  CGSize result = [(PXTilingChangeEvent *)self init];
  if (result)
  {
    result->_type = 3;
    result->_contentInset.CGFloat top = top;
    result->_contentInset.CGFloat left = left;
    result->_contentInset.CGFloat bottom = bottom;
    result->_contentInset.CGFloat right = right;
  }
  return result;
}

- (PXTilingChangeEvent)initWithChangeToReferenceSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  CGSize result = [(PXTilingChangeEvent *)self init];
  if (result)
  {
    result->_type = 2;
    result->_referenceSize.CGFloat width = width;
    result->_referenceSize.CGFloat height = height;
  }
  return result;
}

- (PXTilingChangeEvent)initWithChangeToLayout:(id)a3
{
  id v5 = a3;
  v6 = [(PXTilingChangeEvent *)self init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_layout, a3);
  }

  return v7;
}

- (PXTilingChangeEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXTilingChangeEvent;
  CGSize result = [(PXTilingChangeEvent *)&v3 init];
  if (result) {
    result->_type = 0;
  }
  return result;
}

@end