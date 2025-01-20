@interface TIWordSearchOperationCancelLastAcceptedCandidate
- (TIMecabraWrapper)mecabraWrapper;
- (TIWordSearchOperationCancelLastAcceptedCandidate)initWithWordSearch:(id)a3;
- (void)perform;
- (void)setMecabraWrapper:(id)a3;
@end

@implementation TIWordSearchOperationCancelLastAcceptedCandidate

- (void).cxx_destruct
{
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
  v2 = [(TIWordSearchOperationCancelLastAcceptedCandidate *)self mecabraWrapper];
  uint64_t v3 = [v2 mecabraRef];

  if (v3)
  {
    MEMORY[0x1F4180AC0](v3);
  }
}

- (TIWordSearchOperationCancelLastAcceptedCandidate)initWithWordSearch:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIWordSearchOperationCancelLastAcceptedCandidate;
  v5 = [(TIWordSearchOperationCancelLastAcceptedCandidate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mecabraWrapper];
    mecabraWrapper = v5->_mecabraWrapper;
    v5->_mecabraWrapper = (TIMecabraWrapper *)v6;
  }
  return v5;
}

@end