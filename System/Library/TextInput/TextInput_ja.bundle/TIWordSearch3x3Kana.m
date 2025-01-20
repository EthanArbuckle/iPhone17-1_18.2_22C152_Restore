@interface TIWordSearch3x3Kana
- (id)uncachedCandidatesForOperation:(id)a3;
@end

@implementation TIWordSearch3x3Kana

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4 = a3;
  v5 = [v4 inputString];
  v6 = [v4 keyboardInput];
  id v7 = v4;
  id v8 = objc_alloc_init(MEMORY[0x263F7EB68]);
  if ([(TIWordSearch *)self addFacemarkCandidatesToResultSet:v8 forInput:v5])
  {
    [(TIWordSearchKana *)self setCandidateResultSet:v8];
    goto LABEL_26;
  }
  id v30 = v8;
  v34 = [v7 contextString];
  char v33 = [v7 flickUsed];
  v31 = v5;
  id v9 = v5;
  if (!getNumericStringForTapsOnNumberPlane(NSString *)::symbolToNumberDictionary)
  {
    CFDictionaryKeyCallBacks keyCallBacks = *(CFDictionaryKeyCallBacks *)byte_26F5DD380;
    getNumericStringForTapsOnNumberPlane(NSString *)::symbolToNumberDictionary = (uint64_t)CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&getNumericStringForTapsOnNumberPlane(NSString *)::keys, (const void **)getNumericStringForTapsOnNumberPlane(NSString *)::values, 29, &keyCallBacks, MEMORY[0x263EFFF90]);
  }
  v10 = [MEMORY[0x263F089D8] stringWithCapacity:10];
  uint64_t v11 = [v9 length];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t i = 0; i != v12; ++i)
    {
      LOWORD(keyCallBacks.version) = 0;
      unsigned int v14 = [v9 characterAtIndex:i];
      LOWORD(keyCallBacks.version) = v14;
      v15 = CFDictionaryGetValue((CFDictionaryRef)getNumericStringForTapsOnNumberPlane(NSString *)::symbolToNumberDictionary, (const void *)v14);
      if (v15)
      {
        [v10 appendString:v15];
      }
      else
      {
        v16 = [NSString stringWithCharacters:&keyCallBacks length:1];
        [v10 appendString:v16];
      }
    }
  }
  if ([v10 isEqualToString:v9]) {
    id v32 = 0;
  }
  else {
    id v32 = v10;
  }

  uint64_t v17 = [v7 predictionEnabled];
  uint64_t v18 = [v7 reanalysisMode];
  v19 = [v7 geometryModelData];
  char v20 = [v7 hardwareKeyboardMode];
  char v21 = [v7 referenceMode];
  BYTE3(v29) = [v7 singlePhrase];
  BYTE2(v29) = v21;
  BYTE1(v29) = v20;
  LOBYTE(v29) = v33;
  v22 = -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v9, v6, v34, v17, v18, 0, v19, v29);
  [(TIWordSearchKana *)self setCandidateResultSet:v22];

  if (v32)
  {
    char v23 = [v9 length] == 1 ? v33 : 1;
    if ((v23 & 1) == 0) {
      [(TIWordSearchKana *)self _insertString:v32 input:v9 at:2 force:1];
    }
  }
  v24 = [(TIWordSearchKana *)self candidateResultSet];
  v25 = [v24 candidates];
  if ([v25 count])
  {

    id v8 = v30;
    v5 = v31;
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v26 = [v9 length];

  id v8 = v30;
  v5 = v31;
  if (v26)
  {
    v24 = [(TIWordSearchKana *)self candidateResultSet];
    [v24 addSyntheticMecabraCandidateWithSurface:v9 input:v9];
    goto LABEL_24;
  }
LABEL_25:

LABEL_26:
  v27 = [(TIWordSearchKana *)self candidateResultSet];

  return v27;
}

@end