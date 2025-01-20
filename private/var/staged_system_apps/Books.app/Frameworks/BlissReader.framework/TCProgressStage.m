@interface TCProgressStage
- (TCProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6;
- (double)currentPosition;
- (id)initBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6;
- (id)initRootStageInContext:(id)a3;
- (id)parentStage;
- (void)advanceProgress:(double)a3;
- (void)dealloc;
- (void)end;
- (void)setProgress:(double)a3;
@end

@implementation TCProgressStage

- (id)initRootStageInContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TCProgressStage;
  id result = [(TCProgressStage *)&v5 init];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_345B60;
    *((void *)result + 5) = 0;
    *((void *)result + 6) = a3;
  }
  return result;
}

- (TCProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)TCProgressStage;
  v10 = [(TCProgressStage *)&v12 init];
  if (v10)
  {
    v10->m_parentStage = (TCProgressStage *)[a6 currentStage];
    v10->m_currentPosition = 0.0;
    v10->m_totalSteps = a3;
    v10->m_stepsInParent = a4;
    v10->m_name = (NSString *)a5;
    v10->m_context = (TCProgressContext *)a6;
  }
  return v10;
}

- (id)initBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5 inContext:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)TCProgressStage;
  v10 = [(TCProgressStage *)&v12 init];
  if (v10)
  {
    v10->m_parentStage = (TCProgressStage *)[a6 rootStage];
    v10->m_currentPosition = 0.0;
    v10->m_totalSteps = a3;
    v10->m_stepsInParent = a4;
    v10->m_name = (NSString *)a5;
    v10->m_context = (TCProgressContext *)a6;
  }
  return v10;
}

- (void)dealloc
{
  self->m_parentStage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TCProgressStage;
  [(TCProgressStage *)&v3 dealloc];
}

- (void)advanceProgress:(double)a3
{
  double m_currentPosition = self->m_currentPosition;
  double v4 = m_currentPosition + a3;
  if (m_currentPosition != v4)
  {
    self->double m_currentPosition = v4;
    if (self->m_parentStage) {
      [(TCProgressStage *)self->m_parentStage advanceProgress:(v4 - m_currentPosition) / self->m_totalSteps * self->m_stepsInParent];
    }
    else {
      [(TCProgressContext *)self->m_context reportProgress:v4];
    }
  }
}

- (void)setProgress:(double)a3
{
}

- (void)end
{
}

- (id)parentStage
{
  return self->m_parentStage;
}

- (double)currentPosition
{
  return self->m_currentPosition;
}

@end