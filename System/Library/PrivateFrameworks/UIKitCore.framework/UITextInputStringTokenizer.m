@interface UITextInputStringTokenizer
- (BOOL)_isDownstreamForDirection:(int64_t)a3 atPosition:(id)a4;
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (UITextInputStringTokenizer)initWithTextInput:(UIResponder *)textInput;
- (id)_closestTokenSubrangeForPosition:(id)a3 granularity:(int64_t)a4 downstream:(BOOL)a5;
- (id)_positionFromPosition:(id)a3 offset:(unint64_t)a4 affinity:(int64_t)a5;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
- (int64_t)_distanceForTokenizerWithGranularity:(int64_t)a3;
- (int64_t)_indexForTextPosition:(id)a3;
@end

@implementation UITextInputStringTokenizer

- (UITextInputStringTokenizer)initWithTextInput:(UIResponder *)textInput
{
  v4 = textInput;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputStringTokenizer;
  v5 = [(UITextInputStringTokenizer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textInput, v4);
    v7 = v6;
  }

  return v6;
}

- (int64_t)_indexForTextPosition:(id)a3
{
  p_textInput = &self->_textInput;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textInput);
  int v6 = [WeakRetained _indexForTextPosition:v4];

  return v6;
}

- (int64_t)_distanceForTokenizerWithGranularity:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return qword_186B9AFA0[a3];
  }
}

- (id)_closestTokenSubrangeForPosition:(id)a3 granularity:(int64_t)a4 downstream:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(UITextInputStringTokenizer *)self _distanceForTokenizerWithGranularity:a4];
  if (v9 < 1) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  v12 = [WeakRetained positionFromPosition:v8 offset:-v10];

  id v13 = objc_loadWeakRetained((id *)&self->_textInput);
  v14 = [v13 positionFromPosition:v8 offset:v10];

  if (v12)
  {
    if (v14) {
      goto LABEL_4;
    }
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&self->_textInput);
    v12 = [v15 beginningOfDocument];

    if (v14)
    {
LABEL_4:
      if (!v12) {
        goto LABEL_11;
      }
LABEL_8:
      if (v14)
      {
        id v17 = objc_loadWeakRetained((id *)&self->_textInput);
        v18 = [v17 textRangeFromPosition:v12 toPosition:v14];

        if (v18)
        {
          id v19 = objc_loadWeakRetained((id *)&self->_textInput);
          v20 = [v19 textInRange:v18];

          id v21 = objc_loadWeakRetained((id *)&self->_textInput);
          int v22 = [v21 offsetFromPosition:v12 toPosition:v8];
        }
        else
        {
          v20 = 0;
          int v22 = 0;
        }

        if (v20) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  id v16 = objc_loadWeakRetained((id *)&self->_textInput);
  v14 = [v16 endOfDocument];

  if (v12) {
    goto LABEL_8;
  }
LABEL_11:

LABEL_14:
  id v23 = objc_loadWeakRetained((id *)&self->_textInput);
  v20 = [v23 _fullText];

  int v22 = 0;
LABEL_15:
  v24 = +[_UITextInputStringTokenizerSubrange subrangeWithSubstring:v20 basePosition:v8];
  CFIndex v25 = v22;
  [v24 setIndexOfBase:v22];
  CFOptionFlags v26 = 0x2000000;
  switch(a4)
  {
    case 0:
      CFIndex length = 0;
      int v28 = v22 - 1;
      if (v5) {
        int v28 = v22 + 1;
      }
      uint64_t v29 = v28;
      goto LABEL_37;
    case 1:
      goto LABEL_23;
    case 2:
      CFOptionFlags v26 = 1;
      goto LABEL_23;
    case 3:
      CFOptionFlags v26 = 2;
      goto LABEL_23;
    case 4:
      CFOptionFlags v26 = 3;
LABEL_23:
      v38.CFIndex length = [(__CFString *)v20 length];
      v38.CFIndex location = 0;
      v30 = CFStringTokenizerCreate(0, v20, v38, v26, 0);
      if (v5)
      {
        if ([(__CFString *)v20 length] > (unint64_t)v22)
        {
          while (1)
          {
            CFStringTokenizerGoToTokenAtIndex(v30, v25);
            CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
            CFIndex location = CurrentTokenRange.location;
            CFIndex length = CurrentTokenRange.length;
            if (CurrentTokenRange.location != -1) {
              goto LABEL_35;
            }
            if ([(__CFString *)v20 length] <= (unint64_t)++v25) {
              goto LABEL_34;
            }
          }
        }
LABEL_33:
        CFIndex length = 0;
LABEL_34:
        uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_36;
      }
      if (v22 < 1) {
        goto LABEL_33;
      }
      uint64_t v33 = v22 - 1;
      while (1)
      {
        CFStringTokenizerGoToTokenAtIndex(v30, v33);
        CFRange v34 = CFStringTokenizerGetCurrentTokenRange(v30);
        CFIndex location = v34.location;
        CFIndex length = v34.length;
        if (v34.location != -1) {
          break;
        }
        unint64_t v35 = v33-- + 1;
        if (v35 < 2) {
          goto LABEL_34;
        }
      }
LABEL_35:
      uint64_t v29 = location;
LABEL_36:
      CFRelease(v30);
LABEL_37:
      objc_msgSend(v24, "setRelevantRange:", v29, length);

      return v24;
    default:
      CFIndex length = 0;
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_37;
  }
}

- (BOOL)_isDownstreamForDirection:(int64_t)a3 atPosition:(id)a4
{
  return a3 == 0;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  BOOL v9 = [(UITextInputStringTokenizer *)self _isDownstreamForDirection:a5 atPosition:v8];
  uint64_t v10 = [(UITextInputStringTokenizer *)self _closestTokenSubrangeForPosition:v8 granularity:a4 downstream:!v9];
  uint64_t v11 = [v10 relevantRange];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4 == 5 || a4 == 3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
      v14 = WeakRetained;
      if (a5 == 1) {
        [WeakRetained beginningOfDocument];
      }
      else {
      id v19 = [WeakRetained endOfDocument];
      }
      char v18 = [v8 isEqual:v19];
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    int v17 = [v10 indexOfBase];
    if (v9) {
      char v18 = v17 == v15 + v16;
    }
    else {
      char v18 = v17 == v15;
    }
  }

  return v18;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  BOOL v9 = [(UITextInputStringTokenizer *)self _isDownstreamForDirection:a5 atPosition:v8];
  uint64_t v10 = [(UITextInputStringTokenizer *)self _closestTokenSubrangeForPosition:v8 granularity:a4 downstream:v9];
  uint64_t v11 = [v10 relevantRange];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = 0;
  }
  else
  {
    unint64_t v14 = v11;
    uint64_t v15 = v12;
    int v16 = [v10 indexOfBase];
    int v17 = v14 + v15;
    if (v16 <= v14 + v15) {
      int v17 = v14;
    }
    if (v16 >= v14) {
      int v18 = v15;
    }
    else {
      int v18 = 0;
    }
    int v19 = v18 + v14;
    if (!v9) {
      int v19 = v17;
    }
    id v13 = [(UITextInputStringTokenizer *)self _positionFromPosition:v8 offset:v19 - v16 affinity:v9];
  }

  return v13;
}

- (id)_positionFromPosition:(id)a3 offset:(unint64_t)a4 affinity:(int64_t)a5
{
  p_textInput = &self->_textInput;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textInput);
  BOOL v9 = [WeakRetained positionFromPosition:v7 offset:a4];

  return v9;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  BOOL v9 = [(UITextInputStringTokenizer *)self _closestTokenSubrangeForPosition:v8 granularity:a4 downstream:[(UITextInputStringTokenizer *)self _isDownstreamForDirection:a5 atPosition:v8]];

  uint64_t v10 = [v9 relevantRange];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v12 = 0;
  }
  else
  {
    unint64_t v13 = v10;
    uint64_t v14 = v11;
    int v15 = [v9 indexOfBase];
    BOOL v12 = v15 >= v13 && v15 <= v13 + v14;
  }

  return v12;
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  BOOL v9 = [(UITextInputStringTokenizer *)self _closestTokenSubrangeForPosition:v8 granularity:a4 downstream:[(UITextInputStringTokenizer *)self _isDownstreamForDirection:a5 atPosition:v8]];
  uint64_t v10 = [v9 relevantRange];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    || (v12 = v10, uint64_t v13 = v11, v14 = [v9 indexOfBase], v14 < v12)
    || (int v15 = v12 + v13, v14 > v12 + v13))
  {
    int v16 = 0;
  }
  else
  {
    int v18 = v12 - v14;
    int v19 = v15 - v14;
    p_textInput = &self->_textInput;
    id WeakRetained = objc_loadWeakRetained((id *)p_textInput);
    int v22 = [WeakRetained positionFromPosition:v8 offset:v18];

    id v23 = objc_loadWeakRetained((id *)p_textInput);
    v24 = [v23 positionFromPosition:v8 offset:v19];

    id v25 = objc_loadWeakRetained((id *)p_textInput);
    int v16 = [v25 textRangeFromPosition:v22 toPosition:v24];
  }
  return v16;
}

- (void).cxx_destruct
{
}

@end