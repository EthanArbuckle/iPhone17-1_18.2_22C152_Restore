@interface TIWordSearchCangjie
- (BOOL)suchengEnabled;
- (BOOL)supportsEnglish;
- (BOOL)validateCode:(id)a3 withOption:(unint64_t)a4;
- (id)initTIWordSearchWithInputMode:(id)a3;
- (id)uncachedCandidatesForOperation:(id)a3;
- (int)mecabraInputMethodType;
- (void)setSuchengEnabled:(BOOL)a3;
- (void)setSupportsEnglish:(BOOL)a3;
@end

@implementation TIWordSearchCangjie

- (void)setSupportsEnglish:(BOOL)a3
{
  self->_supportsEnglish = a3;
}

- (BOOL)supportsEnglish
{
  return self->_supportsEnglish;
}

- (void)setSuchengEnabled:(BOOL)a3
{
  self->_suchengEnabled = a3;
}

- (BOOL)suchengEnabled
{
  return self->_suchengEnabled;
}

- (BOOL)validateCode:(id)a3 withOption:(unint64_t)a4
{
  ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();
  if ([(TIWordSearchCangjie *)self suchengEnabled])
  {
    unsigned __int8 v7 = (unint64_t)[ASCIIFromInputKeyString length] <= 2
      && ([ASCIIFromInputKeyString length] != 2
       || [ASCIIFromInputKeyString characterAtIndex:1] != 122
       && ([ASCIIFromInputKeyString isEqualToString:@"ux"] & 1) == 0);
  }
  else if ([ASCIIFromInputKeyString containsCangjieWildcard])
  {
    v10.receiver = self;
    v10.super_class = (Class)TIWordSearchCangjie;
    unsigned __int8 v7 = [(TIWordSearchShapeBased *)&v10 validateCode:ASCIIFromInputKeyString withOption:a4];
  }
  else
  {
    id v8 = ASCIIFromInputKeyString;
    [v8 UTF8String];
    [v8 length];
    unsigned __int8 v7 = MecabraCangjieCodeIsValid() != 0;
  }

  return v7;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F7EB68]);
  id v42 = v4;
  v6 = [v4 inputString];
  uint64_t v41 = MEMORY[0x2611ED640]();
  BOOL v7 = [(TIWordSearchCangjie *)self supportsEnglish];
  BOOL v8 = [(TIWordSearchCangjie *)self suchengEnabled];
  if ([v6 length])
  {
    if ([(TIWordSearch *)self addFacemarkCandidatesToResultSet:v5 forInput:v6])
    {
      id v9 = 0;
      BOOL v40 = 0;
      int v10 = 0;
      if (!v7) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v12 = 2048;
      if (!v8) {
        uint64_t v12 = 0;
      }
      uint64_t v13 = v12 | 0x200000;
      if (v7) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = v12 | 0x200000;
      }
      id v44 = 0;
      v15 = [(TIWordSearchShapeBased *)self autoconvertLongestValidPrefixes:v6 option:v12 | 0x200000 candidateResultSet:v5 autoconvertedCandidateArray:&v44];
      id v9 = v44;
      BOOL v40 = v9 != 0;
      if (!v9) {
        uint64_t v13 = v14;
      }
      v16 = [(TIWordSearch *)self mecabraEnvironment];
      int v10 = [v16 analyzeString:v15 options:v13];

      if (!v7) {
        goto LABEL_15;
      }
    }
LABEL_6:
    ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();
    goto LABEL_16;
  }
  id v9 = 0;
  BOOL v40 = 0;
  int v10 = 1;
  if (v7) {
    goto LABEL_6;
  }
LABEL_15:
  ASCIIFromInputKeyString = 0;
LABEL_16:
  v43 = v6;
  if (v10)
  {
    char v17 = 0;
    while (1)
    {
      [(TIWordSearch *)self mecabra];
      uint64_t NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate) {
        break;
      }
      uint64_t v19 = NextCandidate;
      v20 = [MEMORY[0x263F7E6A0] mecabraCandidateWithCandidateRef:NextCandidate autoconvertedCandidates:v9];
      [v5 addMecabraCandidate:v20 mecabraCandidateRef:v19];
      if ((v17 & 1) == 0)
      {
        v21 = [v20 candidate];
        int v22 = [ASCIIFromInputKeyString isEqualToString:v21];

        if (v22) {
          char v17 = 1;
        }
      }
    }
    char v23 = v17 & 1;
    if (v7)
    {
LABEL_27:
      if (v40
        && (!v8 ? (uint64_t v27 = 0) : (uint64_t v27 = 2048),
            [(TIWordSearch *)self mecabraEnvironment],
            v28 = objc_claimAutoreleasedReturnValue(),
            int v29 = [v28 analyzeString:v43 options:v27],
            v28,
            v29))
      {
        uint64_t v30 = 0;
        unint64_t v31 = 0x263F7E000uLL;
        while (1)
        {
          [(TIWordSearch *)self mecabra];
          uint64_t v32 = MecabraGetNextCandidate();
          if (!v32) {
            break;
          }
          uint64_t v33 = v32;
          if (!v30) {
            uint64_t v30 = [v5 nthIndexIgnoringExtensionCandidates:1];
          }
          v34 = (void *)[objc_alloc(*(Class *)(v31 + 1696)) initWithMecabraCandidate:v33];
          [v5 insertMecabraCandidate:v34 mecabraCandidateRef:v33 atIndex:v30];
          if (v23)
          {
            char v35 = 0;
          }
          else
          {
            [v34 candidate];
            v37 = unint64_t v36 = v31;
            char v35 = [ASCIIFromInputKeyString isEqualToString:v37];

            unint64_t v31 = v36;
          }
          ++v30;
          v23 |= v35;
        }
      }
      else
      {
        uint64_t v30 = 0;
      }
      v26 = (void *)v41;
      v25 = v42;
      if ((v23 & 1) == 0)
      {
        if (!v30) {
          uint64_t v30 = [v5 nthIndexIgnoringExtensionCandidates:4];
        }
        [v5 insertSyntheticMecabraCandidateWithSurface:ASCIIFromInputKeyString input:v43 atIndex:v30];
      }
      goto LABEL_47;
    }
  }
  else
  {
    char v23 = 0;
    if (v7) {
      goto LABEL_27;
    }
  }
  v24 = [v5 candidates];
  if ([v24 count])
  {

    v26 = (void *)v41;
    v25 = v42;
  }
  else
  {
    uint64_t v38 = [v43 length];

    v26 = (void *)v41;
    v25 = v42;
    if (v38) {
      [v5 addSyntheticMecabraCandidateWithSurface:v43 input:v43];
    }
  }
LABEL_47:

  return v5;
}

- (id)initTIWordSearchWithInputMode:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIWordSearchCangjie;
  id v3 = [(TIWordSearch *)&v6 initTIWordSearchWithInputMode:a3];
  id v4 = v3;
  if (v3) {
    [v3 setAutoCorrects:0];
  }
  return v4;
}

- (int)mecabraInputMethodType
{
  return 9;
}

@end