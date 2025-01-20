@interface PDAnimationTextTarget
- (BOOL)isEqual:(id)a3;
- (PDAnimationTextTarget)init;
- (_NSRange)range;
- (int)type;
- (unint64_t)hash;
- (void)setRange:(_NSRange)a3;
- (void)setType:(int)a3;
@end

@implementation PDAnimationTextTarget

- (PDAnimationTextTarget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimationTextTarget;
  return [(PDAnimationShapeTarget *)&v3 init];
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setRange:(_NSRange)a3
{
  self->mRange = a3;
}

- (int)type
{
  return self->mType;
}

- (_NSRange)range
{
  p_mRange = &self->mRange;
  NSUInteger location = self->mRange.location;
  NSUInteger length = p_mRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)PDAnimationTextTarget;
  objc_super v3 = [(PDAnimationShapeTarget *)&v8 hash];
  v4 = &v3[[(PDAnimationTextTarget *)self type]];
  v5 = &v4[16 * [(PDAnimationTextTarget *)self range]];
  [(PDAnimationTextTarget *)self range];
  return (unint64_t)&v5[v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v12.receiver = self,
        v12.super_class = (Class)PDAnimationTextTarget,
        [(PDAnimationShapeTarget *)&v12 isEqual:v4])
    && (int v5 = -[PDAnimationTextTarget type](self, "type"), v5 == [v4 type])
    && (uint64_t v6 = -[PDAnimationTextTarget range](self, "range"), v6 == [v4 range]))
  {
    [(PDAnimationTextTarget *)self range];
    uint64_t v8 = v7;
    [v4 range];
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end