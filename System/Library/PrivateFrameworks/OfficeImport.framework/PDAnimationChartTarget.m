@interface PDAnimationChartTarget
- (BOOL)hasBuildStep;
- (BOOL)hasCatagoryIndex;
- (BOOL)hasSeriesIndex;
- (BOOL)isEqual:(id)a3;
- (PDAnimationChartTarget)init;
- (int)buildStep;
- (int)catagoryIndex;
- (int)chartSubElementType;
- (int)seriesIndex;
- (unint64_t)hash;
- (void)setBuildStep:(int)a3;
- (void)setCatagoryIndex:(int)a3;
- (void)setChartSubElementType:(int)a3;
- (void)setSeriesIndex:(int)a3;
@end

@implementation PDAnimationChartTarget

- (PDAnimationChartTarget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimationChartTarget;
  return [(PDAnimationShapeTarget *)&v3 init];
}

- (void)setCatagoryIndex:(int)a3
{
  self->mHasCatagoryIndex = 1;
  self->mCatagoryIndex = a3;
}

- (void)setSeriesIndex:(int)a3
{
  self->mHasSeriesIndex = 1;
  self->mSeriesIndex = a3;
}

- (BOOL)hasCatagoryIndex
{
  return self->mHasCatagoryIndex;
}

- (int)catagoryIndex
{
  return self->mCatagoryIndex;
}

- (BOOL)hasSeriesIndex
{
  return self->mHasSeriesIndex;
}

- (int)seriesIndex
{
  return self->mSeriesIndex;
}

- (BOOL)hasBuildStep
{
  return self->mHasBuildStep;
}

- (int)buildStep
{
  return self->mBuildStep;
}

- (void)setBuildStep:(int)a3
{
  self->mHasBuildStep = 1;
  self->mBuildStep = a3;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PDAnimationChartTarget;
  objc_super v3 = [(PDAnimationShapeTarget *)&v7 hash];
  v4 = &v3[[(PDAnimationChartTarget *)self catagoryIndex]];
  v5 = &v4[[(PDAnimationChartTarget *)self seriesIndex]];
  return (unint64_t)&v5[[(PDAnimationChartTarget *)self buildStep]];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)PDAnimationChartTarget,
        [(PDAnimationShapeTarget *)&v10 isEqual:v4])
    && (int v5 = [(PDAnimationChartTarget *)self catagoryIndex],
        v5 == [v4 catagoryIndex])
    && (int v6 = [(PDAnimationChartTarget *)self seriesIndex],
        v6 == [v4 seriesIndex]))
  {
    int v7 = [(PDAnimationChartTarget *)self buildStep];
    BOOL v8 = v7 == [v4 buildStep];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int)chartSubElementType
{
  return self->mChartSubElementType;
}

- (void)setChartSubElementType:(int)a3
{
  self->mChartSubElementType = a3;
}

@end