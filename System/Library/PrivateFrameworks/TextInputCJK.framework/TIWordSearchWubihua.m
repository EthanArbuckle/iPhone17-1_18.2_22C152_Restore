@interface TIWordSearchWubihua
- (id)uncachedCandidatesForOperation:(id)a3;
- (int)mecabraInputMethodType;
- (void)dealloc;
@end

@implementation TIWordSearchWubihua

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F7EB68]);
  v6 = [v4 inputString];
  v7 = (void *)MEMORY[0x2611ED640]();
  if (![v6 length])
  {
    id v8 = 0;
LABEL_6:
    while (1)
    {
      [(TIWordSearch *)self mecabra];
      uint64_t NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate) {
        break;
      }
      uint64_t v13 = NextCandidate;
      v14 = [MEMORY[0x263F7E6A0] mecabraCandidateWithCandidateRef:NextCandidate autoconvertedCandidates:v8];
      [v5 addMecabraCandidate:v14 mecabraCandidateRef:v13];
    }
    goto LABEL_8;
  }
  if ([(TIWordSearch *)self addFacemarkCandidatesToResultSet:v5 forInput:v6])
  {
    id v8 = 0;
    goto LABEL_8;
  }
  id v16 = 0;
  v9 = [(TIWordSearchShapeBased *)self autoconvertLongestValidPrefixes:v6 option:512 candidateResultSet:v5 autoconvertedCandidateArray:&v16];
  id v8 = v16;
  v10 = [(TIWordSearch *)self mecabraEnvironment];
  int v11 = [v10 analyzeString:v9 options:512];

  if (v11) {
    goto LABEL_6;
  }
LABEL_8:

  return v5;
}

- (void)dealloc
{
  [(TIWordSearch *)self completeOperationsInQueue];
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchWubihua;
  [(TIWordSearch *)&v3 dealloc];
}

- (int)mecabraInputMethodType
{
  return 0;
}

@end