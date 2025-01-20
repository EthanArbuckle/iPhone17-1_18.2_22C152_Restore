@interface _UITextInputControllerTokenizer
- (BOOL)_isDownstreamForDirection:(int64_t)a3 atPosition:(id)a4;
- (_UITextInputControllerTokenizer)initWithTextInputController:(id)a3;
- (id)_closestTokenSubrangeForPosition:(id)a3 granularity:(int64_t)a4 downstream:(BOOL)a5;
- (id)_positionFromPosition:(id)a3 offset:(unint64_t)a4 affinity:(int64_t)a5;
- (int64_t)_indexForTextPosition:(id)a3;
- (void)dealloc;
- (void)invalidateTokenizer;
- (void)setTokenizer:(uint64_t)a3 forGranularity:;
@end

@implementation _UITextInputControllerTokenizer

- (_UITextInputControllerTokenizer)initWithTextInputController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITextInputControllerTokenizer;
  v5 = [(UITextInputStringTokenizer *)&v9 initWithTextInput:v4];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textInput, v4);
    v6->_tokenizerRange = ($5CFEE62CA76FAE445C6F9DBCEE669C70)xmmword_186B93450;
    v6->_wordTokenizerRange = ($5CFEE62CA76FAE445C6F9DBCEE669C70)xmmword_186B93450;
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  wordTokenizer = self->_wordTokenizer;
  if (wordTokenizer) {
    CFRelease(wordTokenizer);
  }
  v5.receiver = self;
  v5.super_class = (Class)_UITextInputControllerTokenizer;
  [(_UITextInputControllerTokenizer *)&v5 dealloc];
}

- (void)invalidateTokenizer
{
  self->_wordTokenizerIsInvalid = 1;
  self->_tokenizerIsInvalid = 1;
}

- (void)setTokenizer:(uint64_t)a3 forGranularity:
{
  if (a1)
  {
    if (a3 == 1) {
      objc_super v5 = &OBJC_IVAR____UITextInputControllerTokenizer__wordTokenizer;
    }
    else {
      objc_super v5 = &OBJC_IVAR____UITextInputControllerTokenizer__tokenizer;
    }
    uint64_t v6 = *v5;
    v7 = *(const void **)(a1 + v6);
    if (v7)
    {
      CFRelease(v7);
      uint64_t v6 = *v5;
    }
    *(void *)(a1 + v6) = a2;
  }
}

- (BOOL)_isDownstreamForDirection:(int64_t)a3 atPosition:(id)a4
{
  id v6 = a4;
  if ((unint64_t)(a3 - 3) < 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    BOOL v8 = [WeakRetained writingDirectionAtPosition:v6] == 1;
  }
  else
  {
    if (a3 != 5 && a3 != 2)
    {
      v11.receiver = self;
      v11.super_class = (Class)_UITextInputControllerTokenizer;
      BOOL v9 = [(UITextInputStringTokenizer *)&v11 _isDownstreamForDirection:a3 atPosition:v6];
      goto LABEL_11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    BOOL v8 = [WeakRetained writingDirectionAtPosition:v6] == 0;
  }
  BOOL v9 = v8;

LABEL_11:
  return v9;
}

- (id)_positionFromPosition:(id)a3 offset:(unint64_t)a4 affinity:(int64_t)a5
{
  p_textInput = &self->_textInput;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textInput);
  v10 = [WeakRetained textLayoutController];
  objc_super v11 = [v10 positionFromPosition:v8 offset:a4 affinity:a5];

  return v11;
}

- (int64_t)_indexForTextPosition:(id)a3
{
  p_textInput = &self->_textInput;
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)p_textInput);
  id v6 = [v5 beginningOfDocument];
  int64_t v7 = [v5 offsetFromPosition:v6 toPosition:v4];

  return v7;
}

- (id)_closestTokenSubrangeForPosition:(id)a3 granularity:(int64_t)a4 downstream:(BOOL)a5
{
  id v8 = a3;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3010000000;
  v50 = &unk_186D7DBA7;
  long long v51 = xmmword_186B93450;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__212;
  v45 = __Block_byref_object_dispose__212;
  id v46 = 0;
  p_textInput = &self->_textInput;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  objc_super v11 = WeakRetained;
  int64_t v12 = a4;
  if (!a4) {
    goto LABEL_6;
  }
  if (a4 != 4)
  {
    int64_t v12 = [(UITextInputStringTokenizer *)self _distanceForTokenizerWithGranularity:a4];
LABEL_6:
    v15 = [v11 _textStorage];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __91___UITextInputControllerTokenizer__closestTokenSubrangeForPosition_granularity_downstream___block_invoke;
    v34[3] = &unk_1E530BC40;
    v36 = &v41;
    v34[4] = self;
    int64_t v38 = v12;
    int64_t v39 = a4;
    id v35 = v8;
    v37 = &v47;
    BOOL v40 = a5;
    [v15 coordinateReading:v34];

    goto LABEL_14;
  }
  v13 = [WeakRetained textLayoutController];
  if (dyld_program_sdk_at_least())
  {
    uint64_t v14 = [v13 affinityForPosition:v8];
  }
  else if (a5)
  {
    uint64_t v14 = 0;
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)&self->_textInput);
    uint64_t v14 = [v16 selectionAffinity] == 1;
  }
  v17 = [v13 textRangeForLineEnclosingPosition:v8 effectiveAffinity:v14];
  uint64_t v18 = [v13 characterRangeForTextRange:v17];
  v19 = v48;
  v48[4] = v18;
  v19[5] = v20;
  v21 = [v13 attributedTextInRange:v17];
  uint64_t v22 = [v21 string];
  v23 = (void *)v42[5];
  v42[5] = v22;

  if (v48[5])
  {
    v24 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    int v25 = objc_msgSend(v24, "longCharacterIsMember:", objc_msgSend((id)v42[5], "_lastLongCharacter"));

    if (v25)
    {
      uint64_t v26 = v48[5];
      objc_msgSend((id)v42[5], "_rangeOfLongCharacterAtIndex:", objc_msgSend((id)v42[5], "length") - 1);
      v48[5] = v26 - v27;
      uint64_t v28 = [(id)v42[5] _stringByTrimmingLastCharacter];
      v29 = (void *)v42[5];
      v42[5] = v28;
    }
  }

LABEL_14:
  v30 = +[_UITextInputStringTokenizerSubrange subrangeWithSubstring:v42[5] basePosition:v8];
  id v31 = objc_loadWeakRetained((id *)p_textInput);
  v32 = [v31 beginningOfDocument];
  objc_msgSend(v30, "setIndexOfBase:", objc_msgSend(v31, "offsetFromPosition:toPosition:", v32, v8));

  objc_msgSend(v30, "setRelevantRange:", v48[4], v48[5]);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v30;
}

- (void).cxx_destruct
{
}

@end