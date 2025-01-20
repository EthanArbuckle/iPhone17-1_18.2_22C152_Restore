@interface _TUIProgressRenderModel
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (BOOL)paused;
- (CGSize)size;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIDynamicProgress)dynamicProgress;
- (TUIIdentifier)identifier;
- (UIColor)color;
- (double)value;
- (unint64_t)hash;
- (unint64_t)kind;
- (unint64_t)mode;
- (void)setAnimationGroups:(id)a3;
- (void)setColor:(id)a3;
- (void)setDynamicProgress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setValue:(double)a3;
@end

@implementation _TUIProgressRenderModel

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (TUIRenderModelIsEqualToRenderModel(self, v6)
    && (id v7 = -[_TUIProgressRenderModel mode](self, "mode"), v7 == [v6 mode])
    && (-[_TUIProgressRenderModel value](self, "value"), double v9 = v8, [v6 value], v9 == v10)
    && (unsigned int v11 = -[_TUIProgressRenderModel paused](self, "paused"), v11 == [v6 paused]))
  {
    v14 = [(_TUIProgressRenderModel *)self color];
    v15 = [v6 color];
    BOOL v12 = v14 == v15 || [v14 isEqual:v15];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
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
  v2 = [(_TUIProgressRenderModel *)self identifier];
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

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end