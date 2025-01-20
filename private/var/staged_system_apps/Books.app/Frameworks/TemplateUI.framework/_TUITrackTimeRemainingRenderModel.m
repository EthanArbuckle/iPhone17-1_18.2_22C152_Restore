@interface _TUITrackTimeRemainingRenderModel
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIDynamicProgress)dynamicProgress;
- (TUIIdentifier)identifier;
- (TUITextContentStyler)style;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setDynamicProgress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setStyle:(id)a3;
@end

@implementation _TUITrackTimeRemainingRenderModel

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (TUIRenderModelIsEqualToRenderModel(self, v6))
  {
    v7 = [(_TUITrackTimeRemainingRenderModel *)self style];
    v8 = [v6 style];
    if (v7 == v8 || [v7 isEqual:v8])
    {
      v9 = [(_TUITrackTimeRemainingRenderModel *)self dynamicProgress];
      v10 = [v6 dynamicProgress];
      BOOL v11 = v9 == v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
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
  v2 = [(_TUITrackTimeRemainingRenderModel *)self identifier];
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

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (TUITextContentStyler)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end