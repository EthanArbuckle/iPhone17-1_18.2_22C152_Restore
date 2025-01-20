@interface _BSUIAudiobookControlRenderModel
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (BSUIDynamicAudiobookProgress)dynamicAudiobookProgress;
- (CGSize)size;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIDynamicProviding)dynamicState;
- (TUIIdentifier)identifier;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setDynamicAudiobookProgress:(id)a3;
- (void)setDynamicState:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation _BSUIAudiobookControlRenderModel

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = TUIDynamicCast();

  if (TUIRenderModelIsEqualToRenderModel())
  {
    v6 = [(_BSUIAudiobookControlRenderModel *)self dynamicAudiobookProgress];
    v7 = [v5 dynamicAudiobookProgress];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
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
  v2 = [(_BSUIAudiobookControlRenderModel *)self identifier];
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

- (BSUIDynamicAudiobookProgress)dynamicAudiobookProgress
{
  return self->_dynamicAudiobookProgress;
}

- (void)setDynamicAudiobookProgress:(id)a3
{
}

- (TUIDynamicProviding)dynamicState
{
  return self->_dynamicState;
}

- (void)setDynamicState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicState, 0);
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end