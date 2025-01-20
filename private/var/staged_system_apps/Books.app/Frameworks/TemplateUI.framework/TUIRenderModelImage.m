@interface TUIRenderModelImage
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIRenderModelImage)initWithSubmodels:(id)a3;
- (UIEdgeInsets)eraseableInsets;
- (UIImage)image;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setEraseableInsets:(UIEdgeInsets)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIRenderModelImage

- (unint64_t)kind
{
  return 2;
}

- (TUIRenderModelImage)initWithSubmodels:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIRenderModelImage;
  v5 = [(TUIRenderModelImage *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    submodels = v5->_submodels;
    v5->_submodels = v6;

    v5->_size = CGSizeZero;
  }

  return v5;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (!TUIRenderModelIsEqualToRenderModel(self, v6)) {
    goto LABEL_12;
  }
  [(TUIRenderModelImage *)self eraseableInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v6 eraseableInsets];
  BOOL v19 = v10 == v18 && v8 == v15;
  BOOL v20 = v19 && v14 == v17;
  if (v20 && v12 == v16)
  {
    v23 = [(TUIRenderModelImage *)self image];
    v24 = [v6 image];
    BOOL v22 = v23 == v24 || [v23 isEqual:v24];
  }
  else
  {
LABEL_12:
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelImage *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (UIEdgeInsets)eraseableInsets
{
  double top = self->_eraseableInsets.top;
  double left = self->_eraseableInsets.left;
  double bottom = self->_eraseableInsets.bottom;
  double right = self->_eraseableInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEraseableInsets:(UIEdgeInsets)a3
{
  self->_eraseableInsets = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_submodels, 0);
}

@end