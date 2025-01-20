@interface _BSUIRenderModelBooksUIComponent
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSDictionary)rawComponentModel;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (_BSUIRenderModelBooksUIComponent)initWithRawComponentModel:(id)a3 identifier:(id)a4;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation _BSUIRenderModelBooksUIComponent

- (_BSUIRenderModelBooksUIComponent)initWithRawComponentModel:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BSUIRenderModelBooksUIComponent;
  v9 = [(_BSUIRenderModelBooksUIComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawComponentModel, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = BUDynamicCast();

  char IsEqualToRenderModel = TUIRenderModelIsEqualToRenderModel();
  return IsEqualToRenderModel;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(_BSUIRenderModelBooksUIComponent *)self identifier];
  unint64_t v3 = TUIIdentifierHash();

  return v3;
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

- (NSDictionary)rawComponentModel
{
  return self->_rawComponentModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawComponentModel, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end