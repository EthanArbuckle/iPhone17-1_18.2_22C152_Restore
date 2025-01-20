@interface TIWordSearchShapeBased
- (BOOL)addTopCandidateForCode:(id)a3 option:(unint64_t)a4 autoconvertedCandidates:(id)a5 candidateRefsDictionary:(id)a6;
- (BOOL)canHandleKeyHitTest;
- (BOOL)validateCode:(id)a3 withOption:(unint64_t)a4;
- (id)autoconvertLongestValidPrefixes:(id)a3 option:(unint64_t)a4 candidateResultSet:(id)a5 autoconvertedCandidateArray:(id *)a6;
- (void)updateMecabraState;
@end

@implementation TIWordSearchShapeBased

- (void)updateMecabraState
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchShapeBased;
  [(TIWordSearch *)&v3 updateMecabraState];
  [(TIWordSearch *)self updateDictionaryPaths];
}

- (BOOL)canHandleKeyHitTest
{
  return 0;
}

- (BOOL)validateCode:(id)a3 withOption:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(TIWordSearch *)self mecabraEnvironment];
  LODWORD(a4) = [v7 analyzeString:v6 options:a4];

  if (!a4) {
    return 0;
  }
  [(TIWordSearch *)self mecabra];
  return MecabraGetNextCandidate() != 0;
}

- (BOOL)addTopCandidateForCode:(id)a3 option:(unint64_t)a4 autoconvertedCandidates:(id)a5 candidateRefsDictionary:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  v13 = [(TIWordSearch *)self mecabraEnvironment];
  LODWORD(a4) = [v13 analyzeString:v12 options:a4];

  if (!a4) {
    goto LABEL_4;
  }
  [(TIWordSearch *)self mecabra];
  uint64_t NextCandidate = MecabraGetNextCandidate();
  if (NextCandidate)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F7E6A0]) initWithMecabraCandidate:NextCandidate];
    [v10 addObject:v15];
    v16 = [v15 mecabraCandidatePointerValue];
    [v11 setObject:NextCandidate forKeyedSubscript:v16];

LABEL_4:
    LOBYTE(NextCandidate) = 1;
  }

  return NextCandidate;
}

- (id)autoconvertLongestValidPrefixes:(id)a3 option:(unint64_t)a4 candidateResultSet:(id)a5 autoconvertedCandidateArray:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [v10 length];
  if (v12)
  {
    unint64_t v13 = v12;
    v30 = a6;
    v31 = v11;
    uint64_t v14 = 0;
    v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 1;
    uint64_t v32 = v12;
    do
    {
      v18 = objc_msgSend(v10, "substringWithRange:", v16, v17);
      if ([(TIWordSearchShapeBased *)self validateCode:v18 withOption:a4])
      {
        ++v17;
      }
      else
      {
        uint64_t v19 = v17 - 1;
        if (!v19)
        {
          v21 = v10;
          v23 = (void *)v14;
          v25 = v15;
LABEL_17:
          id v28 = v21;

          id v11 = v31;
          goto LABEL_21;
        }
        if (!v14)
        {
          uint64_t v14 = [MEMORY[0x263EFF980] array];
          uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];

          v15 = (void *)v20;
        }
        v21 = v10;
        v22 = objc_msgSend(v10, "substringWithRange:", v16, v19);
        v23 = (void *)v14;
        uint64_t v24 = v14;
        v25 = v15;
        BOOL v26 = [(TIWordSearchShapeBased *)self addTopCandidateForCode:v22 option:a4 autoconvertedCandidates:v24 candidateRefsDictionary:v15];

        if (!v26) {
          goto LABEL_17;
        }
        v16 += v19;
        uint64_t v17 = 1;
        v15 = v25;
        uint64_t v14 = (uint64_t)v23;
        id v10 = v21;
        unint64_t v13 = v32;
      }
    }
    while (v17 + v16 <= v13);
    v21 = v10;
    v23 = (void *)v14;
    v25 = v15;
    if (v16)
    {
      id v11 = v31;
      if (v30) {
        id *v30 = v23;
      }
      [v31 setAutoconvertedMecabraCandidates:v23 candidateRefsDictionary:v25];
      id v27 = [v21 substringFromIndex:v16];
      goto LABEL_20;
    }
    id v11 = v31;
  }
  else
  {
    v21 = v10;
    v23 = 0;
    v25 = 0;
  }
  id v27 = v21;
LABEL_20:
  id v28 = v27;
LABEL_21:

  return v28;
}

@end