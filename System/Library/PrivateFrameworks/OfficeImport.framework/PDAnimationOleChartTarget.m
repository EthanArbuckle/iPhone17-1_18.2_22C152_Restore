@interface PDAnimationOleChartTarget
- (BOOL)isEqual:(id)a3;
- (PDAnimationOleChartTarget)init;
- (int)chartSubElementType;
- (int)level;
- (unint64_t)hash;
- (void)setChartSubElementType:(int)a3;
- (void)setLevel:(int)a3;
@end

@implementation PDAnimationOleChartTarget

- (PDAnimationOleChartTarget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimationOleChartTarget;
  return [(PDAnimationShapeTarget *)&v3 init];
}

- (int)level
{
  return self->mLevel;
}

- (void)setLevel:(int)a3
{
  self->mLevel = a3;
}

- (int)chartSubElementType
{
  return self->mChartSubElementType;
}

- (void)setChartSubElementType:(int)a3
{
  self->mChartSubElementType = a3;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PDAnimationOleChartTarget;
  objc_super v3 = [(PDAnimationShapeTarget *)&v6 hash];
  v4 = &v3[[(PDAnimationOleChartTarget *)self level]];
  return (unint64_t)&v4[[(PDAnimationOleChartTarget *)self chartSubElementType]];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)PDAnimationOleChartTarget,
        [(PDAnimationShapeTarget *)&v9 isEqual:v4])
    && (int v5 = -[PDAnimationOleChartTarget level](self, "level"), v5 == [v4 level]))
  {
    int v6 = [(PDAnimationOleChartTarget *)self chartSubElementType];
    BOOL v7 = v6 == [v4 chartSubElementType];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end