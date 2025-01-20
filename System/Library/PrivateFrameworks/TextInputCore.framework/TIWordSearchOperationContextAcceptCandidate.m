@interface TIWordSearchOperationContextAcceptCandidate
- (BOOL)isPartialCandidate;
- (BOOL)isPrediction;
- (TIMecabraEnvironment)mecabraEnvironment;
- (TIWordSearchOperationContextAcceptCandidate)initWithWordSearch:(id)a3 mecabraCandidate:(void *)a4 isPartial:(BOOL)a5 isPrediction:(BOOL)a6;
- (void)dealloc;
- (void)perform;
- (void)setMecabraEnvironment:(id)a3;
- (void)setPartialCandidate:(BOOL)a3;
- (void)setPrediction:(BOOL)a3;
@end

@implementation TIWordSearchOperationContextAcceptCandidate

- (void).cxx_destruct
{
}

- (void)setPrediction:(BOOL)a3
{
  self->_prediction = a3;
}

- (BOOL)isPrediction
{
  return self->_prediction;
}

- (void)setPartialCandidate:(BOOL)a3
{
  self->_partialCandidate = a3;
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (void)setMecabraEnvironment:(id)a3
{
}

- (TIMecabraEnvironment)mecabraEnvironment
{
  return self->_mecabraEnvironment;
}

- (void)perform
{
  if (self->_mecabraCandidate)
  {
    if ([(TIWordSearchOperationContextAcceptCandidate *)self isPrediction])
    {
      id v6 = [(TIWordSearchOperationContextAcceptCandidate *)self mecabraEnvironment];
      [v6 commitPredictionCandidate:self->_mecabraCandidate];
    }
    else
    {
      BOOL v3 = [(TIWordSearchOperationContextAcceptCandidate *)self isPartialCandidate];
      v4 = [(TIWordSearchOperationContextAcceptCandidate *)self mecabraEnvironment];
      mecabraCandidate = self->_mecabraCandidate;
      id v6 = v4;
      if (v3) {
        [v4 partiallyCommitInlineCandidate:mecabraCandidate];
      }
      else {
        [v4 completelyCommitInlineCandidate:mecabraCandidate];
      }
    }
  }
}

- (void)dealloc
{
  mecabraCandidate = self->_mecabraCandidate;
  if (mecabraCandidate) {

  }
  v4.receiver = self;
  v4.super_class = (Class)TIWordSearchOperationContextAcceptCandidate;
  [(TIWordSearchOperationContextAcceptCandidate *)&v4 dealloc];
}

- (TIWordSearchOperationContextAcceptCandidate)initWithWordSearch:(id)a3 mecabraCandidate:(void *)a4 isPartial:(BOOL)a5 isPrediction:(BOOL)a6
{
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TIWordSearchOperationContextAcceptCandidate;
  v11 = [(TIWordSearchOperationContextAcceptCandidate *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v10 mecabraEnvironment];
    mecabraEnvironment = v11->_mecabraEnvironment;
    v11->_mecabraEnvironment = (TIMecabraEnvironment *)v12;

    if (a4) {
      v14 = a4;
    }
    else {
      v14 = 0;
    }
    v11->_mecabraCandidate = v14;
    v11->_partialCandidate = a5;
    v11->_prediction = a6;
  }

  return v11;
}

@end