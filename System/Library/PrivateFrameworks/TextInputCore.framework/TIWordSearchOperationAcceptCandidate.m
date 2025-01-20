@interface TIWordSearchOperationAcceptCandidate
- (BOOL)isPartialCandidate;
- (TIMecabraWrapper)mecabraWrapper;
- (TIWordSearchOperationAcceptCandidate)initWithWordSearch:(id)a3 mecabraCandidate:(void *)a4 isPartial:(BOOL)a5;
- (void)dealloc;
- (void)perform;
- (void)setMecabraWrapper:(id)a3;
- (void)setPartialCandidate:(BOOL)a3;
@end

@implementation TIWordSearchOperationAcceptCandidate

- (void).cxx_destruct
{
}

- (void)setPartialCandidate:(BOOL)a3
{
  self->_partialCandidate = a3;
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (void)setMecabraWrapper:(id)a3
{
}

- (TIMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)perform
{
  v3 = [(TIWordSearchOperationAcceptCandidate *)self mecabraWrapper];
  uint64_t v4 = [v3 mecabraRef];

  if (v4)
  {
    mecabraCandidate = self->_mecabraCandidate;
    if (mecabraCandidate)
    {
      BOOL v6 = [(TIWordSearchOperationAcceptCandidate *)self isPartialCandidate];
      uint64_t v7 = v4;
      v8 = mecabraCandidate;
    }
    else
    {
      uint64_t v7 = v4;
      v8 = 0;
      BOOL v6 = 0;
    }
    MEMORY[0x1F4180A90](v7, v8, v6);
  }
}

- (void)dealloc
{
  mecabraCandidate = self->_mecabraCandidate;
  if (mecabraCandidate) {

  }
  v4.receiver = self;
  v4.super_class = (Class)TIWordSearchOperationAcceptCandidate;
  [(TIWordSearchOperationAcceptCandidate *)&v4 dealloc];
}

- (TIWordSearchOperationAcceptCandidate)initWithWordSearch:(id)a3 mecabraCandidate:(void *)a4 isPartial:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIWordSearchOperationAcceptCandidate;
  v9 = [(TIWordSearchOperationAcceptCandidate *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 mecabraWrapper];
    mecabraWrapper = v9->_mecabraWrapper;
    v9->_mecabraWrapper = (TIMecabraWrapper *)v10;

    if (a4) {
      v12 = a4;
    }
    else {
      v12 = 0;
    }
    v9->_mecabraCandidate = v12;
    v9->_partialCandidate = a5;
  }

  return v9;
}

@end