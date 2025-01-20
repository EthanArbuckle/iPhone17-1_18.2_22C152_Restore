@interface TSUProgressStage
- (TSUProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 inContext:(id)a5;
- (double)currentPosition;
- (double)nextSubStageParentSize;
- (double)overallProgress;
- (id)description;
- (id)initRootStageInContext:(id)a3;
- (id)parentStage;
- (void)advanceProgress:(double)a3;
- (void)dealloc;
- (void)end;
- (void)setNextSubStageParentSize:(double)a3;
- (void)setProgress:(double)a3;
- (void)setProgressPercentage:(double)a3;
@end

@implementation TSUProgressStage

- (id)initRootStageInContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSUProgressStage;
  id result = [(TSUProgressStage *)&v5 init];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_222874DA0;
    *((void *)result + 5) = 0x3FF0000000000000;
    *((void *)result + 6) = 0;
    *((void *)result + 7) = a3;
  }
  return result;
}

- (TSUProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 inContext:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TSUProgressStage;
  v8 = [(TSUProgressStage *)&v12 init];
  if (v8)
  {
    v9 = (TSUProgressStage *)(id)[a5 currentStage];
    v8->m_parentStage = v9;
    v8->m_currentPosition = 0.0;
    v8->m_totalSteps = a3;
    v8->m_stepsInParent = a4;
    [(TSUProgressStage *)v9 currentPosition];
    v8->m_startInParent = v10;
    v8->m_nextSubStageParentSize = 1.0;
    v8->m_context = (TSUProgressContext *)a5;
  }
  return v8;
}

- (void)dealloc
{
  self->m_parentStage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUProgressStage;
  [(TSUProgressStage *)&v3 dealloc];
}

- (void)advanceProgress:(double)a3
{
}

- (void)setProgress:(double)a3
{
  objc_super v3 = self;
  double m_totalSteps = self->m_totalSteps;
  if (a3 - m_totalSteps <= 0.0000001)
  {
    if (a3 - m_totalSteps <= 0.0) {
      goto LABEL_6;
    }
  }
  else
  {
    do
      self = [(TSUProgressStage *)self parentStage];
    while (self);
    double m_totalSteps = v3->m_totalSteps;
  }
  a3 = m_totalSteps;
LABEL_6:
  double m_currentPosition = v3->m_currentPosition;
  if (m_currentPosition - a3 <= 0.0 || m_currentPosition - a3 > 0.0000001) {
    double v7 = a3;
  }
  else {
    double v7 = v3->m_currentPosition;
  }
  if (m_currentPosition != v7)
  {
    v3->double m_currentPosition = v7;
    m_parentStage = v3->m_parentStage;
    if (m_parentStage)
    {
      double v9 = v3->m_startInParent + v7 / m_totalSteps * v3->m_stepsInParent;
      [(TSUProgressStage *)m_parentStage setProgress:v9];
    }
    else
    {
      m_context = v3->m_context;
      [(TSUProgressStage *)v3 overallProgress];
      [(TSUProgressContext *)m_context reportProgress:v7 overallProgress:v11];
    }
  }
}

- (void)setProgressPercentage:(double)a3
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

- (double)overallProgress
{
  if (!self->m_parentStage) {
    return self->m_currentPosition / self->m_totalSteps;
  }
  [(TSUProgressStage *)self->m_parentStage overallProgress];
  return result;
}

- (double)nextSubStageParentSize
{
  return self->m_nextSubStageParentSize;
}

- (void)setNextSubStageParentSize:(double)a3
{
  self->m_nextSubStageParentSize = a3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"TSUProgressStage %p: At %g of %g steps. Takes %g steps in parent stage %p starting at %g", self, *(void *)&self->m_currentPosition, *(void *)&self->m_totalSteps, *(void *)&self->m_stepsInParent, self->m_parentStage, *(void *)&self->m_startInParent);
}

@end