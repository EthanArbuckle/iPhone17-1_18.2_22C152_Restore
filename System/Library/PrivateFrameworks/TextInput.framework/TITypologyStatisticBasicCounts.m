@interface TITypologyStatisticBasicCounts
- (BOOL)backspacedIntoAutocorrection;
- (NSMutableArray)recentAutocorrectionLocations;
- (NSMutableString)recentText;
- (NSMutableString)recentTextAfterBackspace;
- (NSMutableString)recentTextBeforeBackspace;
- (TITypologyStatisticBasicCounts)init;
- (id)aggregateReport;
- (id)structuredReport;
- (int64_t)autocorrectionCount;
- (int64_t)backspaceCount;
- (int64_t)backspaceIntoAutocorrectionCount;
- (int64_t)characterCount;
- (int64_t)falseBackspaceCount;
- (int64_t)falseBackspaceIntoAutocorrectionCount;
- (int64_t)predictedCharacterCount;
- (int64_t)predictiveSelectionCount;
- (int64_t)rejectedCandidateCount;
- (int64_t)touchCount;
- (void)handleTouch:(id)a3;
- (void)setBackspacedIntoAutocorrection:(BOOL)a3;
- (void)updateTextWithAcceptedCandidate:(id)a3;
- (void)visitRecordCandidateRejected:(id)a3;
- (void)visitRecordHitTest:(id)a3;
- (void)visitRecordKeyboardInput:(id)a3;
- (void)visitRecordSkipHitTest:(id)a3;
- (void)visitRecordSync:(id)a3;
- (void)visitRecordTextAccepted:(id)a3;
@end

@implementation TITypologyStatisticBasicCounts

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentTextAfterBackspace, 0);
  objc_storeStrong((id *)&self->_recentTextBeforeBackspace, 0);
  objc_storeStrong((id *)&self->_recentAutocorrectionLocations, 0);

  objc_storeStrong((id *)&self->_recentText, 0);
}

- (void)setBackspacedIntoAutocorrection:(BOOL)a3
{
  self->_backspacedIntoAutocorrection = a3;
}

- (BOOL)backspacedIntoAutocorrection
{
  return self->_backspacedIntoAutocorrection;
}

- (NSMutableString)recentTextAfterBackspace
{
  return self->_recentTextAfterBackspace;
}

- (NSMutableString)recentTextBeforeBackspace
{
  return self->_recentTextBeforeBackspace;
}

- (NSMutableArray)recentAutocorrectionLocations
{
  return self->_recentAutocorrectionLocations;
}

- (NSMutableString)recentText
{
  return self->_recentText;
}

- (int64_t)falseBackspaceIntoAutocorrectionCount
{
  return self->_falseBackspaceIntoAutocorrectionCount;
}

- (int64_t)falseBackspaceCount
{
  return self->_falseBackspaceCount;
}

- (int64_t)predictiveSelectionCount
{
  return self->_predictiveSelectionCount;
}

- (int64_t)backspaceIntoAutocorrectionCount
{
  return self->_backspaceIntoAutocorrectionCount;
}

- (int64_t)rejectedCandidateCount
{
  return self->_rejectedCandidateCount;
}

- (int64_t)autocorrectionCount
{
  return self->_autocorrectionCount;
}

- (int64_t)backspaceCount
{
  return self->_backspaceCount;
}

- (int64_t)predictedCharacterCount
{
  return self->_predictedCharacterCount;
}

- (int64_t)characterCount
{
  return self->_characterCount;
}

- (int64_t)touchCount
{
  return self->_touchCount;
}

- (void)visitRecordCandidateRejected:(id)a3
{
}

- (void)visitRecordTextAccepted:(id)a3
{
  id v4 = [a3 candidate];
  if ([v4 isAutocorrection]) {
    ++self->_autocorrectionCount;
  }
  [(TITypologyStatisticBasicCounts *)self updateTextWithAcceptedCandidate:v4];
}

- (void)visitRecordSkipHitTest:(id)a3
{
  id v4 = [a3 touchEvent];
  [(TITypologyStatisticBasicCounts *)self handleTouch:v4];
}

- (void)visitRecordHitTest:(id)a3
{
  id v4 = [a3 touchEvent];
  [(TITypologyStatisticBasicCounts *)self handleTouch:v4];
}

- (void)visitRecordKeyboardInput:(id)a3
{
  id v93 = a3;
  id v4 = [v93 input];
  v5 = [v4 touchEvent];
  [(TITypologyStatisticBasicCounts *)self handleTouch:v5];

  v6 = [v93 input];
  v7 = [v6 acceptedCandidate];

  v8 = [v93 input];
  char v9 = [v8 isSynthesizedByAcceptingCandidate];

  if (v9)
  {
    v10 = &OBJC_IVAR___TITypologyStatisticBasicCounts__predictiveSelectionCount;
  }
  else
  {
    if (![v7 isAutocorrection]) {
      goto LABEL_6;
    }
    v10 = &OBJC_IVAR___TITypologyStatisticBasicCounts__autocorrectionCount;
  }
  ++*(Class *)((char *)&self->super.super.super.isa + *v10);
LABEL_6:
  [(TITypologyStatisticBasicCounts *)self updateTextWithAcceptedCandidate:v7];
  v11 = [v93 input];
  int v12 = [v11 isBackspace];

  if (v12) {
    ++self->_backspaceCount;
  }
  v13 = [v93 output];
  uint64_t v14 = [v13 deletionCount];

  if (!v14) {
    goto LABEL_26;
  }
  v15 = [(TITypologyStatisticBasicCounts *)self recentText];
  if ([v15 hasSuffix:@" "])
  {

LABEL_12:
    v18 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
    v19 = [(TITypologyStatisticBasicCounts *)self recentText];
    [v18 setString:v19];
    goto LABEL_13;
  }
  v16 = [(TITypologyStatisticBasicCounts *)self recentText];
  int v17 = [v16 hasSuffix:@"."];

  if (v17) {
    goto LABEL_12;
  }
  v89 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
  uint64_t v90 = [v89 length];

  if (v90) {
    goto LABEL_14;
  }
  v18 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
  v19 = [(TITypologyStatisticBasicCounts *)self recentText];
  [v18 appendString:v19];
LABEL_13:

LABEL_14:
  v20 = [v93 output];
  unint64_t v21 = 0;
  if ([v20 deletionCount])
  {
    unint64_t v22 = 0;
    while (1)
    {
      v23 = [(TITypologyStatisticBasicCounts *)self recentText];
      uint64_t v24 = [v23 length];

      if (!v24) {
        break;
      }
      v25 = [(TITypologyStatisticBasicCounts *)self recentText];
      v26 = [(TITypologyStatisticBasicCounts *)self recentText];
      uint64_t v27 = objc_msgSend(v25, "_rangeOfBackwardDeletionClusterAtIndex:", objc_msgSend(v26, "length") - 1);
      uint64_t v29 = v28;

      v30 = [(TITypologyStatisticBasicCounts *)self recentText];
      objc_msgSend(v30, "deleteCharactersInRange:", v27, v29);

      v21 += v29;
      ++v22;
      v20 = [v93 output];
      if (v22 >= [v20 deletionCount]) {
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
  }
  v31 = [v93 output];
  unint64_t v32 = [v31 deletionCount];

  if (v21 <= v32) {
    unint64_t v33 = v32;
  }
  else {
    unint64_t v33 = v21;
  }
  self->_characterCount -= v33;
  v34 = [(TITypologyStatisticBasicCounts *)self recentAutocorrectionLocations];
  if ([v34 count])
  {
    while (1)
    {
      int64_t characterCount = self->_characterCount;
      v36 = [(TITypologyStatisticBasicCounts *)self recentAutocorrectionLocations];
      v37 = [v36 lastObject];
      uint64_t v38 = [v37 integerValue];

      if (characterCount >= v38) {
        break;
      }
      ++self->_backspaceIntoAutocorrectionCount;
      [(TITypologyStatisticBasicCounts *)self setBackspacedIntoAutocorrection:1];
      v39 = [(TITypologyStatisticBasicCounts *)self recentAutocorrectionLocations];
      [v39 removeLastObject];

      v34 = [(TITypologyStatisticBasicCounts *)self recentAutocorrectionLocations];
      if (![v34 count]) {
        goto LABEL_25;
      }
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  v40 = [v93 output];
  v41 = [v40 insertionText];

  if (v41)
  {
    v42 = [v93 output];
    v43 = [v42 insertionText];
    self->_characterCount += [v43 length];

    v44 = [(TITypologyStatisticBasicCounts *)self recentText];
    v45 = [v93 output];
    v46 = [v45 insertionText];
    [v44 appendString:v46];
  }
  v47 = [v93 output];
  v48 = [v47 insertionText];
  int v49 = [v48 _isSpace];

  if (v49)
  {
    v50 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
    uint64_t v51 = [v50 length];

    if (v51)
    {
      v52 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
      v53 = [(TITypologyStatisticBasicCounts *)self recentText];
      [v52 appendString:v53];

      v54 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
      unint64_t v55 = [v54 length];

      v56 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
      unint64_t v57 = [v56 length];

      if (v55 >= v57) {
        unint64_t v58 = v57;
      }
      else {
        unint64_t v58 = v55;
      }
      v59 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
      if ((unint64_t)[v59 length] > 0x64) {
        goto LABEL_51;
      }
      v60 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
      unint64_t v61 = [v60 length];

      if (v61 <= 0x64)
      {
        unint64_t v62 = 0;
        if (v58)
        {
          while (1)
          {
            v63 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
            int v64 = [v63 characterAtIndex:v62];
            v65 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
            int v66 = [v65 characterAtIndex:v62];

            if (v64 != v66) {
              break;
            }
            if (v58 == ++v62)
            {
              unint64_t v62 = v58;
              break;
            }
          }
        }
        v67 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
        v68 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
        v69 = [v68 substringFromIndex:v62];
        [v67 setString:v69];

        v70 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
        v71 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
        v72 = [v71 substringFromIndex:v62];
        [v70 setString:v72];

        v73 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
        v74 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v75 = (id)[v73 stringByTrimmingCharactersInSet:v74];

        v76 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
        v77 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v78 = (id)[v76 stringByTrimmingCharactersInSet:v77];

        v59 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
        if ((unint64_t)[v59 length] > 0x18) {
          goto LABEL_51;
        }
        v79 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
        unint64_t v80 = [v79 length];

        if (v80 > 0x18) {
          goto LABEL_52;
        }
        v81 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
        v82 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
        unint64_t v83 = [v81 _editDistanceFrom:v82];

        v84 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
        unint64_t v85 = [v84 length];

        v86 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
        unint64_t v87 = [v86 length];

        unint64_t v88 = v85 >= v87 ? v87 : v85;
        if (v83 < v88 >> 1) {
          goto LABEL_52;
        }
        if ([(TITypologyStatisticBasicCounts *)self backspacedIntoAutocorrection])
        {
          ++self->_falseBackspaceIntoAutocorrectionCount;
LABEL_50:
          v59 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
          self->_falseBackspaceCount += [v59 length];
LABEL_51:

          goto LABEL_52;
        }
        if (self->_backspaceCount >= 1) {
          goto LABEL_50;
        }
      }
LABEL_52:
      v91 = [(TITypologyStatisticBasicCounts *)self recentTextBeforeBackspace];
      [v91 setString:&stru_1EDBDCE38];

      v92 = [(TITypologyStatisticBasicCounts *)self recentTextAfterBackspace];
      [v92 setString:&stru_1EDBDCE38];

      [(TITypologyStatisticBasicCounts *)self setBackspacedIntoAutocorrection:0];
    }
  }
}

- (void)visitRecordSync:(id)a3
{
  id v4 = a3;
  v5 = [v4 keyboardState];
  v6 = [v5 documentState];
  unint64_t v22 = [v6 contextBeforeInput];

  v7 = [v4 keyboardState];

  v8 = [v7 documentState];
  char v9 = [v8 selectedText];

  if ([v9 length] || !-[__CFString length](v22, "length")) {
    goto LABEL_2;
  }
  v13 = [(TITypologyStatisticBasicCounts *)self recentText];
  unint64_t v14 = [v13 length];

  unint64_t v15 = [(__CFString *)v22 length];
  unint64_t v16 = v14 >= v15 ? v15 : v14;
  int v17 = [(TITypologyStatisticBasicCounts *)self recentText];
  uint64_t v18 = [v17 length];

  if (!v16
    || ([(TITypologyStatisticBasicCounts *)self recentText],
        v19 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "substringWithRange:", v18 - v16, v16),
        v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = [(__CFString *)v22 hasSuffix:v20],
        v20,
        v19,
        (v21 & 1) == 0))
  {
LABEL_2:
    v10 = [(TITypologyStatisticBasicCounts *)self recentText];
    if (v22) {
      v11 = v22;
    }
    else {
      v11 = &stru_1EDBDCE38;
    }
    [v10 setString:v11];

    int v12 = [(TITypologyStatisticBasicCounts *)self recentAutocorrectionLocations];
    [v12 removeAllObjects];
  }
}

- (void)updateTextWithAcceptedCandidate:(id)a3
{
  id v27 = a3;
  uint64_t v4 = [v27 candidate];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v27 candidate];
    v7 = [v27 input];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      char v9 = [v27 candidate];
      uint64_t v10 = [v9 length];
      v11 = [v27 input];
      uint64_t v12 = v10 - [v11 length];

      self->_characterCount += v12;
      self->_predictedCharacterCount += v12 & ~(v12 >> 63);
      v13 = [(TITypologyStatisticBasicCounts *)self recentAutocorrectionLocations];
      unint64_t v14 = [NSNumber numberWithInteger:self->_characterCount];
      [v13 addObject:v14];

      unint64_t v15 = [v27 input];
      uint64_t v16 = [v15 length];

      int v17 = [(TITypologyStatisticBasicCounts *)self recentText];
      if (v16)
      {
        uint64_t v18 = [v27 input];
        int v19 = [v17 hasSuffix:v18];

        v20 = [(TITypologyStatisticBasicCounts *)self recentText];
        int v17 = v20;
        if (v19)
        {
          uint64_t v21 = [v20 length];
          unint64_t v22 = [v27 input];
          uint64_t v23 = v21 - [v22 length];
          uint64_t v24 = [v27 input];
          uint64_t v25 = [v24 length];

          int v17 = [(TITypologyStatisticBasicCounts *)self recentText];
          v26 = [v27 candidate];
          objc_msgSend(v17, "replaceCharactersInRange:withString:", v23, v25, v26);
        }
        else
        {
          v26 = [v27 candidate];
          [v17 setString:v26];
        }
      }
      else
      {
        v26 = [v27 candidate];
        [v17 appendString:v26];
      }
    }
  }
}

- (void)handleTouch:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [v4 stage] == 2;
    id v4 = v6;
    if (v5) {
      ++self->_touchCount;
    }
  }
}

- (id)aggregateReport
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(TITypologyStatisticBasicCounts *)self characterCount];
  if (v4 >= 1)
  {
    *(float *)&double v5 = (float)v4;
    id v6 = [NSNumber numberWithFloat:v5];
    [v3 setObject:v6 forKey:@"characterCount"];
  }
  int64_t v7 = [(TITypologyStatisticBasicCounts *)self touchCount];
  uint64_t v8 = [(TITypologyStatisticBasicCounts *)self predictiveSelectionCount] + v7;
  if (v8 >= 1)
  {
    *(float *)&double v9 = (float)v8;
    uint64_t v10 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v10 forKey:@"keysTappedCount"];
  }
  uint64_t v11 = [(TITypologyStatisticBasicCounts *)self falseBackspaceCount];
  if (v11 >= 1)
  {
    *(float *)&double v12 = (float)v11;
    v13 = [NSNumber numberWithFloat:v12];
    [v3 setObject:v13 forKey:@"falseBackspaceTotalCount"];
  }
  uint64_t v14 = [(TITypologyStatisticBasicCounts *)self falseBackspaceIntoAutocorrectionCount];
  if (v14 >= 1)
  {
    *(float *)&double v15 = (float)v14;
    uint64_t v16 = [NSNumber numberWithFloat:v15];
    [v3 setObject:v16 forKey:@"falseBackspaceIntoAutocorrection"];
  }

  return v3;
}

- (id)structuredReport
{
  v15[9] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts touchCount](self, "touchCount", @"Touch Count"));
  v15[0] = v3;
  v14[1] = @"Character Count";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts characterCount](self, "characterCount"));
  v15[1] = v4;
  v14[2] = @"Predicted Character Count";
  double v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts predictedCharacterCount](self, "predictedCharacterCount"));
  v15[2] = v5;
  v14[3] = @"Backspace Count";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts backspaceCount](self, "backspaceCount"));
  v15[3] = v6;
  v14[4] = @"Autocorrections";
  int64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts autocorrectionCount](self, "autocorrectionCount"));
  v15[4] = v7;
  v14[5] = @"Rejected Candidates";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts rejectedCandidateCount](self, "rejectedCandidateCount"));
  v15[5] = v8;
  v14[6] = @"Backspace Into Autocorrection";
  double v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts backspaceIntoAutocorrectionCount](self, "backspaceIntoAutocorrectionCount"));
  v15[6] = v9;
  v14[7] = @"False Backspace Total Count";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts falseBackspaceCount](self, "falseBackspaceCount"));
  v15[7] = v10;
  v14[8] = @"False Backspace Into Autocorrection";
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[TITypologyStatisticBasicCounts falseBackspaceIntoAutocorrectionCount](self, "falseBackspaceIntoAutocorrectionCount"));
  v15[8] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (TITypologyStatisticBasicCounts)init
{
  v12.receiver = self;
  v12.super_class = (Class)TITypologyStatisticBasicCounts;
  v2 = [(TITypologyStatisticBasicCounts *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    recentText = v2->_recentText;
    v2->_recentText = v3;

    double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recentAutocorrectionLocations = v2->_recentAutocorrectionLocations;
    v2->_recentAutocorrectionLocations = v5;

    int64_t v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    recentTextAfterBackspace = v2->_recentTextAfterBackspace;
    v2->_recentTextAfterBackspace = v7;

    double v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    recentTextBeforeBackspace = v2->_recentTextBeforeBackspace;
    v2->_recentTextBeforeBackspace = v9;
  }
  return v2;
}

@end