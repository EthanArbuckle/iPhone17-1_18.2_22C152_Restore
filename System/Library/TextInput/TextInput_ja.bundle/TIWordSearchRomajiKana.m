@interface TIWordSearchRomajiKana
- (BOOL)isAnalyzingJapaneseRomaji;
- (id)uncachedCandidatesForOperation:(id)a3;
@end

@implementation TIWordSearchRomajiKana

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 inputString];
  v6 = [v4 keyboardInput];
  v59 = [v4 contextString];
  uint64_t v7 = [v4 segmentBreakIndex];
  int v57 = [v4 hardwareKeyboardMode];
  uint64_t v8 = [v4 predictionEnabled];
  uint64_t v9 = [v4 reanalysisMode];
  [(TIWordSearchKana *)self setCandidateResultSet:0];
  [v4 setCandidateAfterSegmentBreak:0];
  if (![v5 length])
  {
    v10 = [v6 inputs];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      uint64_t v50 = [v4 predictionEnabled];
      uint64_t v51 = [v4 reanalysisMode];
      char v52 = [v4 referenceMode];
      BYTE3(v53) = [v4 singlePhrase];
      BYTE2(v53) = v52;
      BYTE1(v53) = v57;
      LOBYTE(v53) = 0;
      v17 = -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", &stru_26F5DD710, v6, v59, v50, v51, 0, 0, v53);
      [(TIWordSearchKana *)self setCandidateResultSet:v17];
      goto LABEL_33;
    }
  }
  v12 = [v6 inputs];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    uint64_t v14 = [v6 asSearchString];

    id v5 = (id)v14;
  }
  if (!self->_romakana)
  {
    v15 = objc_alloc_init(Romakana);
    romakana = self->_romakana;
    self->_romakana = v15;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    v17 = [v5 substringFromIndex:v7];
    uint64_t v18 = [v5 substringToIndex:v7];

    uint64_t v8 = 0;
    uint64_t v9 = 1;
    id v5 = (id)v18;
  }
  id v5 = v5;
  v19 = v5;
  if (([v4 allowIncompleteRomaji] & 1) == 0)
  {
    v19 = v5;
    if (([v4 predictionEnabled] & 1) == 0)
    {
      v19 = v5;
      if (!v17)
      {
        v19 = [(Romakana *)self->_romakana adjustIncompleteRomaji:v5];
      }
    }
  }
  id v20 = objc_alloc_init(MEMORY[0x263F7EB68]);
  v58 = v6;
  unsigned int v55 = v8;
  v56 = v20;
  if ([(TIWordSearch *)self addFacemarkCandidatesToResultSet:v20 forInput:v5])
  {
    [(TIWordSearchKana *)self setCandidateResultSet:v20];
  }
  else
  {
    if (v57)
    {
      char v21 = [v4 referenceMode];
      BYTE3(v53) = [v4 singlePhrase];
      BYTE2(v53) = v21;
      LOWORD(v53) = 256;
      v22 = -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v19, v6, v59, v8, v9, 0, 0, v53);
      [(TIWordSearchKana *)self setCandidateResultSet:v22];
    }
    else
    {
      v22 = [v4 target];
      [v4 geometryModelData];
      v54 = v17;
      v24 = uint64_t v23 = v9;
      char v25 = [v4 referenceMode];
      BYTE3(v53) = [v4 singlePhrase];
      BYTE2(v53) = v25;
      LOWORD(v53) = 0;
      v26 = -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v19, v58, v59, v8, v23, v22, v24, v53);
      [(TIWordSearchKana *)self setCandidateResultSet:v26];

      uint64_t v9 = v23;
      v17 = v54;
    }
  }
  v27 = [(TIWordSearchKana *)self candidateResultSet];
  v28 = [v27 candidates];
  if ([v28 count])
  {

LABEL_24:
    goto LABEL_25;
  }
  uint64_t v29 = [v19 length];

  if (v29)
  {
    v27 = [(TIWordSearchKana *)self candidateResultSet];
    [v27 addSyntheticMecabraCandidateWithSurface:v19 input:v19];
    goto LABEL_24;
  }
LABEL_25:
  if ([v17 length])
  {
    v30 = [(Romakana *)self->_romakana adjustIncompleteRomaji:v17];
    if (v57)
    {
      v31 = [(TIWordSearchKana *)self candidateResultSet];
      v32 = [v31 candidates];
      v33 = [v32 objectAtIndexedSubscript:0];

      v34 = [v33 candidate];
      LOBYTE(v32) = [v4 referenceMode];
      BYTE3(v53) = [v4 singlePhrase];
      BYTE2(v53) = (_BYTE)v32;
      LOWORD(v53) = 256;
      -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v30, v58, v34, v55, v9, 0, 0, v53);
    }
    else
    {
      v33 = [v4 target];
      v34 = [v4 geometryModelData];
      char v35 = [v4 referenceMode];
      BYTE3(v53) = [v4 singlePhrase];
      BYTE2(v53) = v35;
      LOWORD(v53) = 0;
      -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v30, v58, v5, v55, v9, v33, v34, v53);
    v36 = };

    v37 = [v36 candidates];
    uint64_t v38 = [v37 count];

    if (v38)
    {
      v39 = [v36 candidates];
      v40 = [v39 objectAtIndexedSubscript:0];
      [v4 setCandidateAfterSegmentBreak:v40];

      v41 = [v36 candidates];
      v42 = [v41 objectAtIndexedSubscript:0];
      [(TIWordSearchKana *)self candidateResultSet];
      v44 = v43 = v30;
      [v44 setCandidateAfterSegmentBreak:v42];

      v45 = [(TIWordSearchKana *)self candidateResultSet];
      v46 = [v45 candidateRefsDictionary];
      v47 = [v36 candidateRefsDictionary];
      [v46 addEntriesFromDictionary:v47];

      v30 = v43;
    }
  }
  v6 = v58;
LABEL_33:

  v48 = [(TIWordSearchKana *)self candidateResultSet];

  return v48;
}

- (BOOL)isAnalyzingJapaneseRomaji
{
  return 1;
}

- (void).cxx_destruct
{
}

@end