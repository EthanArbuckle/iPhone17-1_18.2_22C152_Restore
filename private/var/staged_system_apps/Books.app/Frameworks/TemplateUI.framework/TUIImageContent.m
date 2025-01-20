@interface TUIImageContent
- (CGSize)intrinsicSize;
- (TUIImageContent)initWithImage:(id)a3;
- (TUIImageContent)initWithImage:(id)a3 insets:(UIEdgeInsets)a4;
- (TUIImageContent)initWithImage:(id)a3 insets:(UIEdgeInsets)a4 intrinsicSize:(CGSize)a5 flags:(unint64_t)a6;
- (TUIImageContent)initWithIntrinsicSize:(CGSize)a3 flags:(unint64_t)a4;
- (TUIPurgeableImage)image;
- (UIEdgeInsets)insets;
- (unint64_t)flags;
@end

@implementation TUIImageContent

- (TUIImageContent)initWithImage:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIImageContent;
  v6 = [(TUIImageContent *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    long long v8 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v7->_insets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v7->_insets.bottom = v8;
    [v5 size];
    v7->_intrinsicSize.width = v9;
    v7->_intrinsicSize.height = v10;
    v7->_flags = 0;
  }

  return v7;
}

- (TUIImageContent)initWithImage:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIImageContent;
  v11 = [(TUIImageContent *)&v16 init];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_image, a3);
    v12->_insets.CGFloat top = top;
    v12->_insets.CGFloat left = left;
    v12->_insets.CGFloat bottom = bottom;
    v12->_insets.CGFloat right = right;
    [v10 size];
    v12->_intrinsicSize.width = v13;
    v12->_intrinsicSize.height = v14;
    v12->_flags = 0;
  }

  return v12;
}

- (TUIImageContent)initWithImage:(id)a3 insets:(UIEdgeInsets)a4 intrinsicSize:(CGSize)a5 flags:(unint64_t)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIImageContent;
  objc_super v16 = [(TUIImageContent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a3);
    v17->_insets.CGFloat top = top;
    v17->_insets.CGFloat left = left;
    v17->_insets.CGFloat bottom = bottom;
    v17->_insets.CGFloat right = right;
    v17->_intrinsicSize.CGFloat width = width;
    v17->_intrinsicSize.CGFloat height = height;
    v17->_flags = a6;
  }

  return v17;
}

- (TUIImageContent)initWithIntrinsicSize:(CGSize)a3 flags:(unint64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)TUIImageContent;
  v7 = [(TUIImageContent *)&v12 init];
  long long v8 = v7;
  if (v7)
  {
    image = v7->_image;
    v7->_image = 0;

    long long v10 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v8->_insets.CGFloat top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v8->_insets.CGFloat bottom = v10;
    v8->_intrinsicSize.CGFloat width = width;
    v8->_intrinsicSize.CGFloat height = height;
    v8->_flags = a4;
  }
  return v8;
}

- (TUIPurgeableImage)image
{
  return self->_image;
}

- (CGSize)intrinsicSize
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
}

@end