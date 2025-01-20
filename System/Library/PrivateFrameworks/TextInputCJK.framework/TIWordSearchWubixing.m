@interface TIWordSearchWubixing
- (id)autoconvertWubiXingPrefixes:(id)a3 option:(unint64_t)a4 candidateResultSet:(id)a5 autoconvertedCandidateArray:(id *)a6;
- (id)mecabraCreationOptionsDictionary;
- (id)uncachedCandidatesForOperation:(id)a3;
- (int)mecabraInputMethodType;
- (int)wubiStandard;
- (int)wubiStandardPreference;
- (unsigned)nameReadingPairGenerationMode;
- (void)checkWubiStandard;
- (void)dealloc;
- (void)setWubiStandard:(int)a3;
- (void)shouldAutoCommitCode:(id)a3 withOption:(unint64_t)a4;
- (void)updateMecabraState;
@end

@implementation TIWordSearchWubixing

- (void)setWubiStandard:(int)a3
{
  self->_wubiStandard = a3;
}

- (int)wubiStandard
{
  return self->_wubiStandard;
}

- (void)shouldAutoCommitCode:(id)a3 withOption:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(TIWordSearch *)self mecabraEnvironment];
  LODWORD(a4) = [v7 analyzeString:v6 options:a4];

  if (!a4) {
    return 0;
  }
  [(TIWordSearch *)self mecabra];
  NextCandidate = (void *)MecabraGetNextCandidate();
  char WubixingType = MecabraCandidateGetWubixingType();
  if (!NextCandidate || (WubixingType & 2) != 0 || MecabraCandidateIsBilingualCandidate()) {
    return 0;
  }
  return NextCandidate;
}

- (id)autoconvertWubiXingPrefixes:(id)a3 option:(unint64_t)a4 candidateResultSet:(id)a5 autoconvertedCandidateArray:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [MEMORY[0x263EFF980] array];
  v13 = [MEMORY[0x263EFF9A0] dictionary];
  if ((unint64_t)[v10 length] < 5) {
    goto LABEL_11;
  }
  v26 = a6;
  v27 = v11;
  uint64_t v14 = 0;
  while (1)
  {
    v15 = objc_msgSend(v10, "substringWithRange:", v14, 4, v26);
    v16 = [(TIWordSearchWubixing *)self shouldAutoCommitCode:v15 withOption:a4];
    if (!v16) {
      break;
    }
    v17 = v16;
    v18 = (void *)[objc_alloc(MEMORY[0x263F7E6A0]) initWithMecabraCandidate:v16];
    [v12 addObject:v18];
    v19 = [v18 mecabraCandidatePointerValue];
    [v13 setObject:v17 forKeyedSubscript:v19];

    unint64_t v20 = [v10 length];
    uint64_t v21 = v14 + 4;
    unint64_t v22 = v14 + 8;
    v14 += 4;
    if (v22 >= v20) {
      goto LABEL_7;
    }
  }

  uint64_t v21 = v14;
LABEL_7:
  id v11 = v27;
  if (v21)
  {
    if (v26) {
      id *v26 = v12;
    }
    [v27 setAutoconvertedMecabraCandidates:v12 candidateRefsDictionary:v13];
    id v23 = [v10 substringFromIndex:v21];
  }
  else
  {
LABEL_11:
    id v23 = v10;
  }
  v24 = v23;

  return v24;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F7EB68]);
  id v6 = [v4 inputString];
  v7 = (void *)MEMORY[0x2611ED640]();
  if (![v6 length])
  {
    id v38 = 0;
    v8 = 0;
LABEL_6:
    v35 = v7;
    id v36 = v4;
    v37 = v8;
    int v11 = [v8 containsString:@"z"];
    char v12 = 0;
    unint64_t v13 = 0x263F7E000uLL;
    while (1)
    {
      [(TIWordSearch *)self mecabra];
      uint64_t NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate) {
        break;
      }
      uint64_t v15 = NextCandidate;
      v16 = [*(id *)(v13 + 1696) mecabraCandidateWithCandidateRef:NextCandidate autoconvertedCandidates:v38];
      if (([v16 isWubixingConvertedByPinyin] | v11) == 1)
      {
        v17 = [(TIWordSearch *)self mecabraEnvironment];
        v18 = [v16 label];
        v19 = [v17 wubiAnnotationForCandidate:v18];
        [v16 setAlternativeText:v19];

        unint64_t v13 = 0x263F7E000;
      }
      [v5 addMecabraCandidate:v16 mecabraCandidateRef:v15];
      unint64_t v20 = [v16 candidate];
      char v21 = [v20 isEqualToString:v6];

      v12 |= v21;
    }
    if (([v6 isEqualToString:v37] & 1) == 0)
    {
      v25 = [v5 candidates];
      uint64_t v26 = [v25 indexOfObjectPassingTest:&__block_literal_global_936];

      v27 = [(TIWordSearch *)self mecabraEnvironment];
      [v27 analyzeString:v6 options:0];
      while (1)
      {

        [(TIWordSearch *)self mecabra];
        uint64_t v28 = MecabraGetNextCandidate();
        if (!v28) {
          break;
        }
        uint64_t v29 = v28;
        v27 = [*(id *)(v13 + 1696) mecabraCandidateWithCandidateRef:v28 autoconvertedCandidates:0];
        if ([v27 isWubixingConvertedByPinyin])
        {
          v30 = [(TIWordSearch *)self mecabraEnvironment];
          v31 = [v27 candidate];
          v32 = [v30 wubiAnnotationForCandidate:v31];
          [v27 setAlternativeText:v32];

          unint64_t v13 = 0x263F7E000;
        }
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v5 addMecabraCandidate:v27 mecabraCandidateRef:v29];
          uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          [v5 insertMecabraCandidate:v27 mecabraCandidateRef:v29 atIndex:v26++];
        }
        v33 = [v27 candidate];
        char v34 = [v33 isEqualToString:v6];

        v12 |= v34;
      }
    }
    v7 = v35;
    id v4 = v36;
    unint64_t v22 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
    uint64_t v23 = [v6 rangeOfCharacterFromSet:v22];

    if (v23 != 0x7FFFFFFFFFFFFFFFLL && (v12 & 1) == 0) {
      [v5 addSyntheticMecabraCandidateWithSurface:v6 input:v6 isExtension:1];
    }
    v8 = v37;
    goto LABEL_16;
  }
  if ([(TIWordSearch *)self addFacemarkCandidatesToResultSet:v5 forInput:v6])
  {
    id v38 = 0;
    v8 = 0;
    goto LABEL_16;
  }
  [(TIWordSearchWubixing *)self checkWubiStandard];
  id v39 = 0;
  v8 = [(TIWordSearchWubixing *)self autoconvertWubiXingPrefixes:v6 option:0 candidateResultSet:v5 autoconvertedCandidateArray:&v39];
  id v38 = v39;
  v9 = [(TIWordSearch *)self mecabraEnvironment];
  int v10 = [v9 analyzeString:v8 options:0];

  if (v10) {
    goto LABEL_6;
  }
LABEL_16:

  return v5;
}

uint64_t __55__TIWordSearchWubixing_uncachedCandidatesForOperation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isWubixingConvertedByPinyin]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isPrefixMatched];
  }

  return v3;
}

- (unsigned)nameReadingPairGenerationMode
{
  return 2;
}

- (void)checkWubiStandard
{
  int v3 = [(TIWordSearchWubixing *)self wubiStandardPreference];
  if (v3 != [(TIWordSearchWubixing *)self wubiStandard])
  {
    [(TIWordSearchWubixing *)self setWubiStandard:[(TIWordSearchWubixing *)self wubiStandardPreference]];
    [(TIWordSearch *)self mecabra];
    [(TIWordSearchWubixing *)self wubiStandard];
    MecabraSetWubixingStandard();
    [(TIWordSearch *)self updateAddressBook];
  }
}

- (int)wubiStandardPreference
{
  id v2 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v3 = [v2 valueForPreferenceKey:*MEMORY[0x263F7E950]];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v4 = [v3 integerValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (void)updateMecabraState
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchWubixing;
  [(TIWordSearchShapeBased *)&v3 updateMecabraState];
  [(TIWordSearch *)self updateUserWordEntries];
}

- (void)dealloc
{
  [(TIWordSearch *)self completeOperationsInQueue];
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchWubixing;
  [(TIWordSearch *)&v3 dealloc];
}

- (id)mecabraCreationOptionsDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)TIWordSearchWubixing;
  objc_super v3 = [(TIWordSearch *)&v7 mecabraCreationOptionsDictionary];
  int v4 = (void *)[v3 mutableCopy];

  [(TIWordSearchWubixing *)self setWubiStandard:[(TIWordSearchWubixing *)self wubiStandardPreference]];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TIWordSearchWubixing wubiStandard](self, "wubiStandard"));
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F8C540]];

  return v4;
}

- (int)mecabraInputMethodType
{
  return 10;
}

@end