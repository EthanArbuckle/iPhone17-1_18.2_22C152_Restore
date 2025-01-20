@interface TIWordSearch50onKana
- (id)uncachedCandidatesForOperation:(id)a3;
@end

@implementation TIWordSearch50onKana

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4 = a3;
  v5 = [v4 inputString];
  v6 = [v4 keyboardInput];
  uint64_t v7 = [v4 segmentBreakIndex];
  uint64_t v8 = [v4 predictionEnabled];
  uint64_t v9 = [v4 reanalysisMode];
  id v10 = objc_alloc_init(MEMORY[0x263F7EB68]);
  if ([(TIWordSearch *)self addFacemarkCandidatesToResultSet:v10 forInput:v5])
  {
    [(TIWordSearchKana *)self setCandidateResultSet:v10];
    goto LABEL_20;
  }
  v51 = v6;
  id v49 = v10;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v52 = 0;
  }
  else
  {
    v52 = [v5 substringFromIndex:v7];
    uint64_t v11 = [v5 substringToIndex:v7];

    uint64_t v8 = 0;
    uint64_t v9 = 1;
    v5 = (void *)v11;
  }
  uint64_t v12 = [v4 contextString];
  char v13 = [v4 flickUsed];
  v14 = [v4 geometryModelData];
  char v15 = [v4 hardwareKeyboardMode];
  char v16 = [v4 referenceMode];
  BYTE3(v47) = [v4 singlePhrase];
  BYTE2(v47) = v16;
  BYTE1(v47) = v15;
  LOBYTE(v47) = v13;
  v6 = v51;
  v50 = (void *)v12;
  HIDWORD(v47) = v9;
  v17 = -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v5, v51, v12, v8, v9, 0, v14, v47);
  [(TIWordSearchKana *)self setCandidateResultSet:v17];

  v18 = [(TIWordSearchKana *)self candidateResultSet];
  v19 = [v18 candidates];
  if ([v19 count])
  {

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v20 = [v5 length];

  if (v20)
  {
    v18 = [(TIWordSearchKana *)self candidateResultSet];
    [v18 addSyntheticMecabraCandidateWithSurface:v5 input:v5];
    goto LABEL_10;
  }
LABEL_11:
  if ([v52 length])
  {
    if ([v4 hardwareKeyboardMode])
    {
      v21 = [(TIWordSearchKana *)self candidateResultSet];
      v22 = [v21 candidates];
      v23 = [v22 objectAtIndexedSubscript:0];

      v24 = [v23 candidate];
      LOBYTE(v21) = [v4 referenceMode];
      BYTE3(v48) = [v4 singlePhrase];
      BYTE2(v48) = (_BYTE)v21;
      LOWORD(v48) = 256;
      v46 = 0;
      v25 = self;
      v26 = v52;
      v27 = v51;
      v28 = v24;
      uint64_t v29 = v8;
      uint64_t v30 = HIDWORD(v48);
      v31 = 0;
    }
    else
    {
      v23 = [v4 target];
      v24 = [v4 geometryModelData];
      char v32 = [v4 referenceMode];
      BYTE3(v48) = [v4 singlePhrase];
      BYTE2(v48) = v32;
      LOWORD(v48) = 0;
      v46 = v24;
      v25 = self;
      v26 = v52;
      v27 = v51;
      v28 = v5;
      uint64_t v29 = v8;
      uint64_t v30 = HIDWORD(v48);
      v31 = v23;
    }
    v33 = -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](v25, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v26, v27, v28, v29, v30, v31, v46, v48);

    v34 = [v33 candidates];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      v36 = [v33 candidates];
      v37 = [v36 objectAtIndexedSubscript:0];
      [v4 setCandidateAfterSegmentBreak:v37];

      v38 = [v33 candidates];
      v39 = [v38 objectAtIndexedSubscript:0];
      v40 = [(TIWordSearchKana *)self candidateResultSet];
      [v40 setCandidateAfterSegmentBreak:v39];

      v41 = [(TIWordSearchKana *)self candidateResultSet];
      v42 = [v41 candidateRefsDictionary];
      v43 = [v33 candidateRefsDictionary];
      [v42 addEntriesFromDictionary:v43];
    }
    else
    {
      [v4 setCandidateAfterSegmentBreak:0];
      v41 = [(TIWordSearchKana *)self candidateResultSet];
      [v41 setCandidateAfterSegmentBreak:0];
    }

    v6 = v51;
  }

  id v10 = v49;
LABEL_20:
  v44 = [(TIWordSearchKana *)self candidateResultSet];

  return v44;
}

@end