@interface CRLProgressStage
- (CRLProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 inContext:(id)a5;
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
- (void)setProgress:(double)m_totalSteps;
- (void)setProgressPercentage:(double)a3;
@end

@implementation CRLProgressStage

- (id)initRootStageInContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLProgressStage;
  v6 = [(CRLProgressStage *)&v10 init];
  v7 = (id *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_101176280;
    v8 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 5) = 0x3FF0000000000000;
    *((void *)v6 + 6) = 0;

    objc_storeStrong(v7 + 7, a3);
  }

  return v7;
}

- (CRLProgressStage)initWithSteps:(double)a3 takingSteps:(double)a4 inContext:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRLProgressStage;
  objc_super v10 = [(CRLProgressStage *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v9 currentStage];
    m_parentStage = v10->m_parentStage;
    v10->m_parentStage = (CRLProgressStage *)v11;

    v10->m_currentPosition = 0.0;
    v10->m_totalSteps = a3;
    v10->m_stepsInParent = a4;
    [(CRLProgressStage *)v10->m_parentStage currentPosition];
    v10->m_startInParent = v13;
    v10->m_nextSubStageParentSize = 1.0;
    objc_storeStrong((id *)&v10->m_context, a5);
  }

  return v10;
}

- (void)dealloc
{
  m_parentStage = self->m_parentStage;
  self->m_parentStage = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLProgressStage;
  [(CRLProgressStage *)&v4 dealloc];
}

- (void)advanceProgress:(double)a3
{
}

- (void)setProgress:(double)m_totalSteps
{
  double v4 = m_totalSteps - self->m_totalSteps;
  if (v4 <= 0.0000001)
  {
    if (v4 > 0.0) {
      m_totalSteps = self->m_totalSteps;
    }
  }
  else
  {
    id v5 = self;
    do
    {
      uint64_t v6 = [(CRLProgressStage *)v5 parentStage];

      id v5 = (CRLProgressStage *)v6;
    }
    while (v6);
    m_totalSteps = self->m_totalSteps;
  }
  double m_currentPosition = self->m_currentPosition;
  if (m_currentPosition - m_totalSteps <= 0.0 || m_currentPosition - m_totalSteps > 0.0000001) {
    double v9 = m_totalSteps;
  }
  else {
    double v9 = self->m_currentPosition;
  }
  if (m_currentPosition != v9)
  {
    self->double m_currentPosition = v9;
    m_parentStage = self->m_parentStage;
    if (m_parentStage)
    {
      double v11 = self->m_startInParent + v9 / self->m_totalSteps * self->m_stepsInParent;
      [(CRLProgressStage *)m_parentStage setProgress:v11];
    }
    else
    {
      m_context = self->m_context;
      [(CRLProgressStage *)self overallProgress];
      [(CRLProgressContext *)m_context reportProgress:v9 overallProgress:v13];
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
  [(CRLProgressStage *)self->m_parentStage overallProgress];
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
  return +[NSString stringWithFormat:@"CRLProgressStage %p: At %g of %g steps. Takes %g steps in parent stage %p starting at %g", self, *(void *)&self->m_currentPosition, *(void *)&self->m_totalSteps, *(void *)&self->m_stepsInParent, self->m_parentStage, *(void *)&self->m_startInParent];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_context, 0);

  objc_storeStrong((id *)&self->m_parentStage, 0);
}

@end