@interface TIZhuyinInputManager
- (BOOL)addNonZhuyinInput:(id)a3;
- (BOOL)addZhuyinInput:(id)a3;
- (BOOL)addZhuyinInput:(id)a3 withUpdatingComposedTextToClient:(BOOL)a4;
- (BOOL)deleteFromInput;
- (BOOL)forwardDeleteFromInput;
- (BOOL)isCursorAtEnd;
- (BOOL)leftDoubleQuotationMarkInserted;
- (BOOL)leftSingleQuotationMarkInserted;
- (BOOL)revertCurrentCharacterToTonelessZhuyin;
- (BOOL)shouldDirectlyCommitInput:(id)a3;
- (BOOL)syllableBuffersOccupied;
- (BOOL)syllableBuffersValid;
- (NSMutableArray)composedBufferSplittingLengths;
- (NSMutableArray)inputBufferSplittingLengths;
- (NSMutableString)composedBuffer;
- (NSMutableString)inputBuffer;
- (NSString)composedText;
- (NSString)syllableBuffersAggregateString;
- (TIZhuyinInputManager)init;
- (id)convertToFullWidth:(id)a3;
- (id)inputStringForCharacters:(id)a3;
- (id)readingsLengths:(id)a3;
- (unint64_t)bufferSplittingLengthsIndex;
- (unint64_t)composedBufferCursorLocation;
- (unint64_t)cursorLocation;
- (unint64_t)inputBufferIndexOf:(unint64_t)a3;
- (unint64_t)inputCursorLocation;
- (unint64_t)syllableBuffersAggregateLength;
- (unsigned)syllableConsonantBuffer;
- (unsigned)syllableMedialBuffer;
- (unsigned)syllableToneBuffer;
- (unsigned)syllableVowelBuffer;
- (void)moveCursorBackward;
- (void)moveCursorForward;
- (void)reset;
- (void)resetSyllableBuffers;
- (void)setComposedBuffer:(id)a3;
- (void)setComposedBufferSplittingLengths:(id)a3;
- (void)setInputBuffer:(id)a3;
- (void)setInputBufferSplittingLengths:(id)a3;
- (void)setInputCursorLocation:(unint64_t)a3;
- (void)setLeftDoubleQuotationMarkInserted:(BOOL)a3;
- (void)setLeftSingleQuotationMarkInserted:(BOOL)a3;
- (void)setSyllableConsonantBuffer:(unsigned __int16)a3;
- (void)setSyllableMedialBuffer:(unsigned __int16)a3;
- (void)setSyllableToneBuffer:(unsigned __int16)a3;
- (void)setSyllableVowelBuffer:(unsigned __int16)a3;
- (void)updateWithCandidate:(id)a3 isWholeInputCandidate:(BOOL)a4;
@end

@implementation TIZhuyinInputManager

- (TIZhuyinInputManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)TIZhuyinInputManager;
  v2 = [(TIZhuyinInputManager *)&v13 init];
  v3 = (TIZhuyinInputManager *)v2;
  if (v2)
  {
    *((void *)v2 + 4) = 0;
    *(void *)(v2 + 10) = 0;
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    inputBuffer = v3->_inputBuffer;
    v3->_inputBuffer = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    inputBufferSplittingLengths = v3->_inputBufferSplittingLengths;
    v3->_inputBufferSplittingLengths = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    composedBufferSplittingLengths = v3->_composedBufferSplittingLengths;
    v3->_composedBufferSplittingLengths = v8;

    v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    composedBuffer = v3->_composedBuffer;
    v3->_composedBuffer = v10;
  }
  return v3;
}

- (BOOL)addZhuyinInput:(id)a3
{
  return [(TIZhuyinInputManager *)self addZhuyinInput:a3 withUpdatingComposedTextToClient:1];
}

- (BOOL)addZhuyinInput:(id)a3 withUpdatingComposedTextToClient:(BOOL)a4
{
  id v6 = a3;
  if (![v6 length])
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"TIZhuyinInputManager.m", 73, @"Should not happen, we are expecting Zhuyin input to be non-empty string." object file lineNumber description];
  }
  uint64_t v7 = [v6 characterAtIndex:0];
  unint64_t v8 = [(TIZhuyinInputManager *)self inputCursorLocation];
  unint64_t v9 = [(TIZhuyinInputManager *)self syllableBuffersAggregateLength];
  v10 = [MEMORY[0x263F08708] zhuyinPhonemeCharacterSet];
  uint64_t v11 = [v6 rangeOfCharacterFromSet:v10];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [MEMORY[0x263F08708] zhuyinConsonantCharacterSet];
    uint64_t v15 = [v6 rangeOfCharacterFromSet:v14];

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = [MEMORY[0x263F08708] zhuyinMedialCharacterSet];
      uint64_t v17 = [v6 rangeOfCharacterFromSet:v16];

      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = [MEMORY[0x263F08708] zhuyinVowelCharacterSet];
        uint64_t v19 = [v6 rangeOfCharacterFromSet:v18];

        if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
          [(TIZhuyinInputManager *)self setSyllableVowelBuffer:v7];
        }
      }
      else
      {
        [(TIZhuyinInputManager *)self setSyllableMedialBuffer:v7];
      }
    }
    else
    {
      [(TIZhuyinInputManager *)self setSyllableConsonantBuffer:v7];
    }
    BOOL v23 = [(TIZhuyinInputManager *)self syllableBuffersOccupied];
    v12 = [(TIZhuyinInputManager *)self inputBuffer];
    v24 = [(TIZhuyinInputManager *)self syllableBuffersAggregateString];
    if (v23) {
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v8, v9, v24);
    }
    else {
      objc_msgSend(v12, "insertString:atIndex:", v24, -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"));
    }

    goto LABEL_21;
  }
  if ([(TIZhuyinInputManager *)self syllableBuffersOccupied])
  {
    if ([v6 isEqualToString:@" "]) {
      uint64_t v7 = [@"ˉ" characterAtIndex:0];
    }
    [(TIZhuyinInputManager *)self setSyllableToneBuffer:v7];
    v12 = [(TIZhuyinInputManager *)self inputBuffer];
    objc_super v13 = [(TIZhuyinInputManager *)self syllableBuffersAggregateString];
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v8, v9, v13);

LABEL_21:
LABEL_22:
    LOBYTE(v22) = 1;
    goto LABEL_23;
  }
  v20 = [(TIZhuyinInputManager *)self inputBuffer];
  uint64_t v21 = [v20 length];

  if (v21 && ([v6 isEqualToString:@" "] & 1) == 0)
  {
    unint64_t v26 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
    v27 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
    v28 = [v27 objectAtIndex:v26];
    uint64_t v29 = [v28 unsignedIntegerValue];

    if ([(TIZhuyinInputManager *)self inputCursorLocation]) {
      unint64_t v30 = [(TIZhuyinInputManager *)self inputCursorLocation] - v29;
    }
    else {
      unint64_t v30 = 0;
    }
    v31 = [(TIZhuyinInputManager *)self inputBuffer];
    v32 = objc_msgSend(v31, "substringWithRange:", v30, v29);

    v33 = [MEMORY[0x263F08708] zhuyinPhonemeCharacterSet];
    uint64_t v34 = [v32 rangeOfCharacterFromSet:v33];

    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(TIZhuyinInputManager *)self inputCursorLocation]) {
        [(TIZhuyinInputManager *)self deleteFromInput];
      }
      else {
        [(TIZhuyinInputManager *)self forwardDeleteFromInput];
      }
      objc_initWeak(&location, self);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __72__TIZhuyinInputManager_addZhuyinInput_withUpdatingComposedTextToClient___block_invoke;
      v38[3] = &unk_2650FE5F0;
      objc_copyWeak(&v39, &location);
      __int16 v40 = v7;
      objc_msgSend(v32, "enumerateSubstringsInRange:options:usingBlock:", 0, v29, 2, v38);
      v35 = [(TIZhuyinInputManager *)self inputBuffer];
      v36 = [(TIZhuyinInputManager *)self syllableBuffersAggregateString];
      objc_msgSend(v35, "insertString:atIndex:", v36, -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"));

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }

    goto LABEL_22;
  }
  BOOL v22 = ![(TIZhuyinInputManager *)self shouldDirectlyCommitInput:v6];
LABEL_23:

  return v22;
}

void __72__TIZhuyinInputManager_addZhuyinInput_withUpdatingComposedTextToClient___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [v13 characterAtIndex:0];
  v5 = [MEMORY[0x263F08708] zhuyinConsonantCharacterSet];
  uint64_t v6 = [v13 rangeOfCharacterFromSet:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [MEMORY[0x263F08708] zhuyinMedialCharacterSet];
    uint64_t v8 = [v13 rangeOfCharacterFromSet:v7];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = [MEMORY[0x263F08708] zhuyinVowelCharacterSet];
      uint64_t v10 = [v13 rangeOfCharacterFromSet:v9];

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = [MEMORY[0x263F08708] zhuyinToneCharacterSet];
        uint64_t v12 = [v13 rangeOfCharacterFromSet:v11];

        if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
          [WeakRetained setSyllableToneBuffer:*(unsigned __int16 *)(a1 + 40)];
        }
      }
      else
      {
        [WeakRetained setSyllableVowelBuffer:v4];
      }
    }
    else
    {
      [WeakRetained setSyllableMedialBuffer:v4];
    }
  }
  else
  {
    [WeakRetained setSyllableConsonantBuffer:v4];
  }
}

- (void)updateWithCandidate:(id)a3 isWholeInputCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v64 = a3;
  if ([(TIZhuyinInputManager *)self syllableBuffersValid])
  {
    uint64_t v6 = [(TIZhuyinInputManager *)self composedBuffer];
    uint64_t v7 = [v64 candidate];
    if (v4) {
      [v6 setString:v7];
    }
    else {
      objc_msgSend(v6, "insertString:atIndex:", v7, -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation"));
    }

    unint64_t v8 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
    if ([(TIZhuyinInputManager *)self composedBufferCursorLocation]) {
      unint64_t v9 = v8 + 1;
    }
    else {
      unint64_t v9 = 0;
    }
    unint64_t v10 = [(TIZhuyinInputManager *)self syllableBuffersAggregateLength];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v10];
    uint64_t v12 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
    id v13 = v12;
    if (v4)
    {
      unint64_t v57 = v10;
      v58 = v11;
      [v12 removeAllObjects];

      v60 = self;
      v14 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
      [v14 removeAllObjects];

      uint64_t v15 = [v64 mecabraCandidatePointerValue];
      [v15 unsignedLongLongValue];

      int WordCount = MecabraCandidateGetWordCount();
      context = (void *)MEMORY[0x24563E750]();
      if (WordCount)
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v59 = WordCount;
        do
        {
          unsigned int WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex();
          unint64_t v21 = WordLengthAtIndex;
          uint64_t WordReadingLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex();
          [v64 candidate];
          v24 = uint64_t v23 = v19;
          uint64_t v63 = v18;
          v25 = objc_msgSend(v24, "substringWithRange:", v18, WordLengthAtIndex);

          unint64_t v26 = [v64 input];
          uint64_t v61 = v23;
          uint64_t v62 = objc_msgSend(v26, "substringWithRange:", v23, WordReadingLengthAtIndex);

          v27 = [MEMORY[0x263EFF980] array];
          if (WordLengthAtIndex)
          {
            unint64_t v28 = 0;
            do
            {
              [v25 rangeOfComposedCharacterSequenceAtIndex:v28];
              uint64_t v30 = v29;
              v31 = [NSNumber numberWithUnsignedInteger:v29];
              [v27 addObject:v31];

              v28 += v30;
            }
            while (v28 < v21);
          }
          if (MecabraCandidateWordAtIndexIsFromSystemDictionary())
          {
            v32 = [(TIZhuyinInputManager *)v60 inputBufferSplittingLengths];
            v33 = (void *)v62;
            uint64_t v34 = [(TIZhuyinInputManager *)v60 readingsLengths:v62];
            [v32 addObjectsFromArray:v34];

            v35 = [(TIZhuyinInputManager *)v60 composedBufferSplittingLengths];
            [v35 addObjectsFromArray:v27];
            uint64_t v36 = v63;
            uint64_t v37 = v61;
          }
          else
          {
            v38 = (void *)MecabraCandidateCopySyllableLengthArrayForWordAtIndex();
            v35 = v38;
            if (v38 && (uint64_t v39 = [v38 count], v39 != objc_msgSend(v27, "count")))
            {
              v43 = [(TIZhuyinInputManager *)v60 inputBufferSplittingLengths];
              v44 = [NSNumber numberWithUnsignedInteger:WordReadingLengthAtIndex];
              [v43 addObject:v44];

              v42 = [(TIZhuyinInputManager *)v60 composedBufferSplittingLengths];
              v45 = [NSNumber numberWithUnsignedInteger:v21];
              [v42 addObject:v45];

              v33 = (void *)v62;
            }
            else
            {
              __int16 v40 = [(TIZhuyinInputManager *)v60 inputBufferSplittingLengths];
              v33 = (void *)v62;
              v41 = [(TIZhuyinInputManager *)v60 readingsLengths:v62];
              [v40 addObjectsFromArray:v41];

              v42 = [(TIZhuyinInputManager *)v60 composedBufferSplittingLengths];
              [v42 addObjectsFromArray:v27];
            }
            uint64_t v37 = v61;

            uint64_t v36 = v63;
          }

          uint64_t v18 = v36 + v21;
          uint64_t v19 = v37 + WordReadingLengthAtIndex;
          ++v17;
        }
        while (v17 != v59);
      }
      self = v60;
      unint64_t v10 = v57;
      uint64_t v11 = v58;
    }
    else
    {
      unint64_t v46 = [v12 count];

      v47 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
      v48 = v47;
      if (v46 >= v9) {
        [v47 insertObject:v11 atIndex:v9];
      }
      else {
        [v47 addObject:v11];
      }

      v49 = NSNumber;
      v50 = [v64 candidate];
      v51 = objc_msgSend(v49, "numberWithUnsignedInteger:", objc_msgSend(v50, "length"));

      v52 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
      unint64_t v53 = [v52 count];

      v54 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
      v55 = v54;
      if (v53 >= v9) {
        [v54 insertObject:v51 atIndex:v9];
      }
      else {
        [v54 addObject:v51];
      }
    }
    [(TIZhuyinInputManager *)self setInputCursorLocation:[(TIZhuyinInputManager *)self inputCursorLocation] + v10];
    [(TIZhuyinInputManager *)self resetSyllableBuffers];
  }
}

- (BOOL)addNonZhuyinInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIZhuyinInputManager *)self shouldDirectlyCommitInput:v4];
  if (!v5 && ![(TIZhuyinInputManager *)self syllableBuffersOccupied])
  {
    uint64_t v6 = [(TIZhuyinInputManager *)self convertToFullWidth:v4];
    uint64_t v7 = [(TIZhuyinInputManager *)self inputBuffer];
    objc_msgSend(v7, "insertString:atIndex:", v6, -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"));

    unint64_t v8 = [(TIZhuyinInputManager *)self composedBuffer];
    objc_msgSend(v8, "insertString:atIndex:", v6, -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation"));

    uint64_t v9 = [v6 length];
    unint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
    unint64_t v11 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
    if ([(TIZhuyinInputManager *)self composedBufferCursorLocation]) {
      unint64_t v12 = v11 + 1;
    }
    else {
      unint64_t v12 = 0;
    }
    id v13 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
    unint64_t v14 = [v13 count];

    uint64_t v15 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
    v16 = v15;
    if (v14 >= v12)
    {
      [v15 insertObject:v10 atIndex:v12];

      uint64_t v17 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
      [v17 insertObject:v10 atIndex:v12];
    }
    else
    {
      [v15 addObject:v10];

      uint64_t v17 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
      [v17 addObject:v10];
    }

    [(TIZhuyinInputManager *)self setInputCursorLocation:[(TIZhuyinInputManager *)self inputCursorLocation] + v9];
  }

  return !v5;
}

- (BOOL)deleteFromInput
{
  v3 = [(TIZhuyinInputManager *)self inputBuffer];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    BOOL v5 = [(TIZhuyinInputManager *)self syllableBuffersOccupied];
    unint64_t v6 = [(TIZhuyinInputManager *)self inputCursorLocation];
    if (v5)
    {
      unint64_t v7 = v6 + [(TIZhuyinInputManager *)self syllableBuffersAggregateLength] - 1;
      unint64_t v8 = [(TIZhuyinInputManager *)self inputBuffer];
      objc_msgSend(v8, "deleteCharactersInRange:", v7, 1);

      if ([(TIZhuyinInputManager *)self syllableToneBuffer])
      {
        [(TIZhuyinInputManager *)self setSyllableToneBuffer:0];
      }
      else if ([(TIZhuyinInputManager *)self syllableVowelBuffer])
      {
        [(TIZhuyinInputManager *)self setSyllableVowelBuffer:0];
      }
      else if ([(TIZhuyinInputManager *)self syllableMedialBuffer])
      {
        [(TIZhuyinInputManager *)self setSyllableMedialBuffer:0];
      }
      else if ([(TIZhuyinInputManager *)self syllableConsonantBuffer])
      {
        [(TIZhuyinInputManager *)self setSyllableConsonantBuffer:0];
      }
    }
    else if (v6)
    {
      unint64_t v9 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
      unint64_t v10 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
      unint64_t v11 = [v10 objectAtIndex:v9];
      uint64_t v12 = [v11 unsignedIntegerValue];

      unint64_t v13 = [(TIZhuyinInputManager *)self inputCursorLocation] - v12;
      unint64_t v14 = [(TIZhuyinInputManager *)self inputBuffer];
      objc_msgSend(v14, "deleteCharactersInRange:", v13, v12);

      uint64_t v15 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
      v16 = [v15 objectAtIndex:v9];
      uint64_t v17 = [v16 unsignedIntegerValue];

      unint64_t v18 = [(TIZhuyinInputManager *)self composedBufferCursorLocation] - v17;
      uint64_t v19 = [(TIZhuyinInputManager *)self composedBuffer];
      objc_msgSend(v19, "deleteCharactersInRange:", v18, v17);

      v20 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
      [v20 removeObjectAtIndex:v9];

      unint64_t v21 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
      [v21 removeObjectAtIndex:v9];

      [(TIZhuyinInputManager *)self setInputCursorLocation:[(TIZhuyinInputManager *)self inputCursorLocation] - v12];
    }
  }
  return v4 != 0;
}

- (BOOL)forwardDeleteFromInput
{
  v3 = [(TIZhuyinInputManager *)self inputBuffer];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    if (![(TIZhuyinInputManager *)self syllableBuffersOccupied])
    {
      unint64_t v5 = [(TIZhuyinInputManager *)self inputCursorLocation];
      unint64_t v6 = [(TIZhuyinInputManager *)self inputBuffer];
      unint64_t v7 = [v6 length];

      if (v5 < v7)
      {
        unint64_t v8 = [(TIZhuyinInputManager *)self inputCursorLocation];
        unint64_t v9 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
        if (v8) {
          unint64_t v10 = v9 + 1;
        }
        else {
          unint64_t v10 = v9;
        }
        unint64_t v11 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
        uint64_t v12 = [v11 objectAtIndex:v10];
        uint64_t v13 = [v12 unsignedIntegerValue];

        unint64_t v14 = [(TIZhuyinInputManager *)self inputCursorLocation];
        uint64_t v15 = [(TIZhuyinInputManager *)self inputBuffer];
        objc_msgSend(v15, "deleteCharactersInRange:", v14, v13);

        v16 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
        uint64_t v17 = [v16 objectAtIndex:v10];
        uint64_t v18 = [v17 unsignedIntegerValue];

        unint64_t v19 = [(TIZhuyinInputManager *)self composedBufferCursorLocation];
        v20 = [(TIZhuyinInputManager *)self composedBuffer];
        objc_msgSend(v20, "deleteCharactersInRange:", v19, v18);

        unint64_t v21 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
        [v21 removeObjectAtIndex:v10];

        BOOL v22 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
        [v22 removeObjectAtIndex:v10];
      }
    }
  }
  return v4 != 0;
}

- (unint64_t)cursorLocation
{
  unint64_t v3 = [(TIZhuyinInputManager *)self composedBufferCursorLocation];
  return [(TIZhuyinInputManager *)self syllableBuffersAggregateLength] + v3;
}

- (unint64_t)inputBufferIndexOf:(unint64_t)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  unint64_t v15 = 0;
  unint64_t v5 = [(TIZhuyinInputManager *)self composedBuffer];
  unint64_t v6 = 0;
  if ([v5 length] <= a3)
  {
    unint64_t v7 = [(TIZhuyinInputManager *)self composedBuffer];
    unint64_t v6 = a3 - [v7 length];
  }
  unint64_t v15 = v6;
  unint64_t v8 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__TIZhuyinInputManager_inputBufferIndexOf___block_invoke;
  v11[3] = &unk_2650FE618;
  v11[4] = &v12;
  v11[5] = a3;
  [v8 enumerateObjectsUsingBlock:v11];

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __43__TIZhuyinInputManager_inputBufferIndexOf___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) == a3)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v4 = result;
    result = [a2 unsignedIntegerValue];
    *(void *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) += result;
  }
  return result;
}

- (BOOL)isCursorAtEnd
{
  v2 = self;
  unint64_t v3 = [(TIZhuyinInputManager *)self composedText];
  uint64_t v4 = [v3 length];
  LOBYTE(v2) = v4 == [(TIZhuyinInputManager *)v2 cursorLocation];

  return (char)v2;
}

- (id)readingsLengths:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  unint64_t v15 = __Block_byref_object_dispose_;
  unint64_t v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v16 = [v3 array];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  uint64_t v5 = [v4 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__TIZhuyinInputManager_readingsLengths___block_invoke;
  v8[3] = &unk_2650FE640;
  v8[4] = v9;
  v8[5] = v10;
  v8[6] = &v11;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);

  id v6 = (id)v12[5];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __40__TIZhuyinInputManager_readingsLengths___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  unint64_t v3 = [MEMORY[0x263F08708] zhuyinToneCharacterSet];
  if ([v8 rangeOfCharacterFromSet:v3] != 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_5;
  }
  id v4 = [MEMORY[0x263F08708] zhuyinCharacterSet];
  uint64_t v5 = [v8 rangeOfCharacterFromSet:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
    id v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
    unint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[4] + 8) + 24)];
    [v6 addObject:v7];

    *(void *)(*(void *)(a1[4] + 8) + 24) = 0;
  }
}

- (id)convertToFullWidth:(id)a3
{
  id v4 = a3;
  int v5 = [v4 characterAtIndex:0];
  if (v5 <= 90)
  {
    if (v5 > 59)
    {
      if (v5 == 60)
      {

        id v6 = @"《";
        goto LABEL_26;
      }
      if (v5 == 62)
      {

        id v6 = @"》";
        goto LABEL_26;
      }
      goto LABEL_23;
    }
    if (v5 == 34)
    {
      BOOL v8 = [(TIZhuyinInputManager *)self leftDoubleQuotationMarkInserted];

      if (v8)
      {
        [(TIZhuyinInputManager *)self setLeftDoubleQuotationMarkInserted:0];
        id v6 = @"”";
      }
      else
      {
        [(TIZhuyinInputManager *)self setLeftDoubleQuotationMarkInserted:1];
        id v6 = @"“";
      }
    }
    else
    {
      if (v5 != 39)
      {
LABEL_23:
        id v6 = (__CFString *)[v4 mutableCopy];
        CFStringTransform(v6, 0, (CFStringRef)*MEMORY[0x263EFFEF0], 1u);

        goto LABEL_26;
      }
      BOOL v7 = [(TIZhuyinInputManager *)self leftSingleQuotationMarkInserted];

      if (v7)
      {
        [(TIZhuyinInputManager *)self setLeftSingleQuotationMarkInserted:0];
        id v6 = @"’";
      }
      else
      {
        [(TIZhuyinInputManager *)self setLeftSingleQuotationMarkInserted:1];
        id v6 = @"‘";
      }
    }
  }
  else
  {
    if (v5 > 92)
    {
      switch(v5)
      {
        case ']':

          id v6 = @"」";
          goto LABEL_26;
        case '{':

          id v6 = @"『";
          goto LABEL_26;
        case '}':

          id v6 = @"』";
          goto LABEL_26;
      }
      goto LABEL_23;
    }
    if (v5 == 91)
    {

      id v6 = @"「";
    }
    else
    {

      id v6 = @"、";
    }
  }
LABEL_26:

  return v6;
}

- (BOOL)shouldDirectlyCommitInput:(id)a3
{
  id v4 = a3;
  if ([(TIZhuyinInputManager *)self syllableBuffersOccupied]) {
    goto LABEL_3;
  }
  int v5 = [(TIZhuyinInputManager *)self inputBuffer];
  uint64_t v6 = [v5 length];

  if (v6
    || ([v4 isEqualToString:@" "] & 1) == 0
    && ([MEMORY[0x263F08708] zhuyinToneCharacterSet],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v4 rangeOfCharacterFromSet:v9],
        v9,
        v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_3:
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)revertCurrentCharacterToTonelessZhuyin
{
  unint64_t v3 = [(TIZhuyinInputManager *)self inputBuffer];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    if ([(TIZhuyinInputManager *)self syllableBuffersOccupied])
    {
      unint64_t v5 = [(TIZhuyinInputManager *)self syllableBuffersAggregateLength];
      if (v5)
      {
        unint64_t v6 = v5;
        do
        {
          [(TIZhuyinInputManager *)self deleteFromInput];
          --v6;
        }
        while (v6);
      }
    }
    else
    {
      unint64_t v7 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
      BOOL v8 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
      unint64_t v9 = [v8 objectAtIndex:v7];
      uint64_t v10 = [v9 unsignedIntegerValue];

      if ([(TIZhuyinInputManager *)self inputCursorLocation]) {
        unint64_t v11 = [(TIZhuyinInputManager *)self inputCursorLocation] - v10;
      }
      else {
        unint64_t v11 = 0;
      }
      uint64_t v12 = [(TIZhuyinInputManager *)self inputBuffer];
      uint64_t v13 = objc_msgSend(v12, "substringWithRange:", v11, v10);

      if ([(TIZhuyinInputManager *)self inputCursorLocation]) {
        [(TIZhuyinInputManager *)self deleteFromInput];
      }
      else {
        [(TIZhuyinInputManager *)self forwardDeleteFromInput];
      }
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __62__TIZhuyinInputManager_revertCurrentCharacterToTonelessZhuyin__block_invoke;
      v15[3] = &unk_2650FE668;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v10 - 1, 2, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  return v4 != 0;
}

void __62__TIZhuyinInputManager_revertCurrentCharacterToTonelessZhuyin__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addZhuyinInput:v3 withUpdatingComposedTextToClient:0];
}

- (void)resetSyllableBuffers
{
  [(TIZhuyinInputManager *)self setSyllableConsonantBuffer:0];
  [(TIZhuyinInputManager *)self setSyllableMedialBuffer:0];
  [(TIZhuyinInputManager *)self setSyllableVowelBuffer:0];
  [(TIZhuyinInputManager *)self setSyllableToneBuffer:0];
}

- (void)reset
{
  [(TIZhuyinInputManager *)self resetSyllableBuffers];
  id v3 = [(TIZhuyinInputManager *)self inputBuffer];
  [v3 setString:&stru_26F5E6580];

  [(TIZhuyinInputManager *)self setInputCursorLocation:0];
  uint64_t v4 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
  [v4 removeAllObjects];

  unint64_t v5 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
  [v5 removeAllObjects];

  id v6 = [(TIZhuyinInputManager *)self composedBuffer];
  [v6 setString:&stru_26F5E6580];
}

- (NSString)composedText
{
  unint64_t v3 = [(TIZhuyinInputManager *)self composedBufferCursorLocation];
  uint64_t v4 = [(TIZhuyinInputManager *)self composedBuffer];
  unint64_t v5 = [v4 substringToIndex:v3];

  id v6 = [(TIZhuyinInputManager *)self syllableBuffersAggregateString];
  unint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"ˉ" withString:@" "];

  BOOL v8 = [(TIZhuyinInputManager *)self composedBuffer];
  unint64_t v9 = [v8 substringFromIndex:v3];

  uint64_t v10 = [v7 stringByAppendingString:v9];
  unint64_t v11 = [v5 stringByAppendingString:v10];

  return (NSString *)v11;
}

- (unint64_t)bufferSplittingLengthsIndex
{
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  unint64_t v3 = [(TIZhuyinInputManager *)self inputCursorLocation];
  if (v3)
  {
    unint64_t v4 = v3;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    unint64_t v5 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__TIZhuyinInputManager_bufferSplittingLengthsIndex__block_invoke;
    v8[3] = &unk_2650FE690;
    v8[5] = &v10;
    v8[6] = v4;
    v8[4] = v9;
    [v5 enumerateObjectsUsingBlock:v8];

    _Block_object_dispose(v9, 8);
  }
  unint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __51__TIZhuyinInputManager_bufferSplittingLengthsIndex__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 unsignedIntegerValue];
  *(void *)(*(void *)(a1[4] + 8) + 24) += result;
  if (*(void *)(*(void *)(a1[4] + 8) + 24) == a1[6])
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)composedBufferCursorLocation
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  if ([(TIZhuyinInputManager *)self inputCursorLocation])
  {
    unint64_t v3 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
    unint64_t v4 = [(TIZhuyinInputManager *)self composedBufferSplittingLengths];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__TIZhuyinInputManager_composedBufferCursorLocation__block_invoke;
    v7[3] = &unk_2650FE6B8;
    v7[4] = &v8;
    v7[5] = v3;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __52__TIZhuyinInputManager_composedBufferCursorLocation__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 unsignedIntegerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  if (*(void *)(a1 + 40) == a3) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)syllableBuffersValid
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(TIZhuyinInputManager *)v2 syllableToneBuffer]) {
    BOOL v3 = [(TIZhuyinInputManager *)v2 syllableConsonantBuffer]
  }
      || [(TIZhuyinInputManager *)v2 syllableMedialBuffer]
      || [(TIZhuyinInputManager *)v2 syllableVowelBuffer] != 0;
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)syllableBuffersOccupied
{
  return [(TIZhuyinInputManager *)self syllableBuffersAggregateLength] != 0;
}

- (unint64_t)syllableBuffersAggregateLength
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(TIZhuyinInputManager *)v2 syllableConsonantBuffer];
  int v4 = [(TIZhuyinInputManager *)v2 syllableMedialBuffer];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  if (v4) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v3 != 0;
  }
  if ([(TIZhuyinInputManager *)v2 syllableVowelBuffer]) {
    ++v6;
  }
  if ([(TIZhuyinInputManager *)v2 syllableToneBuffer]) {
    ++v6;
  }
  objc_sync_exit(v2);

  return v6;
}

- (NSString)syllableBuffersAggregateString
{
  int v3 = [MEMORY[0x263F089D8] string];
  int v4 = self;
  objc_sync_enter(v4);
  if ([(TIZhuyinInputManager *)v4 syllableConsonantBuffer]) {
    objc_msgSend(v3, "appendFormat:", @"%C", -[TIZhuyinInputManager syllableConsonantBuffer](v4, "syllableConsonantBuffer"));
  }
  if ([(TIZhuyinInputManager *)v4 syllableMedialBuffer]) {
    objc_msgSend(v3, "appendFormat:", @"%C", -[TIZhuyinInputManager syllableMedialBuffer](v4, "syllableMedialBuffer"));
  }
  if ([(TIZhuyinInputManager *)v4 syllableVowelBuffer]) {
    objc_msgSend(v3, "appendFormat:", @"%C", -[TIZhuyinInputManager syllableVowelBuffer](v4, "syllableVowelBuffer"));
  }
  if ([(TIZhuyinInputManager *)v4 syllableToneBuffer]) {
    objc_msgSend(v3, "appendFormat:", @"%C", -[TIZhuyinInputManager syllableToneBuffer](v4, "syllableToneBuffer"));
  }
  objc_sync_exit(v4);

  return (NSString *)v3;
}

- (id)inputStringForCharacters:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v3 = [a3 stringByApplyingTransform:@"Han-Latin; Latin-Bopomofo" reverse:0];
  int v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v3 componentsSeparatedByString:@" "];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 length])
        {
          uint64_t v11 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v10, "length") - 1);
          uint64_t v12 = [@"ˉˊˇˋ˙" rangeOfString:v11];

          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v13 = [v10 stringByAppendingString:@"ˉ"];
            [v4 addObject:v13];
          }
          else
          {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = [v4 componentsJoinedByString:&stru_26F5E6580];

  return v14;
}

- (void)moveCursorBackward
{
  int v3 = [(TIZhuyinInputManager *)self inputBuffer];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    if (![(TIZhuyinInputManager *)self syllableBuffersOccupied])
    {
      if ([(TIZhuyinInputManager *)self inputCursorLocation])
      {
        unint64_t v5 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
        uint64_t v6 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
        unint64_t v7 = [v6 count];

        if (v5 < v7)
        {
          id v9 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
          uint64_t v8 = [v9 objectAtIndex:v5];
          -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation")- [v8 unsignedIntegerValue]);
        }
      }
    }
  }
}

- (void)moveCursorForward
{
  int v3 = [(TIZhuyinInputManager *)self inputBuffer];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    if (![(TIZhuyinInputManager *)self syllableBuffersOccupied])
    {
      unint64_t v5 = [(TIZhuyinInputManager *)self inputCursorLocation];
      uint64_t v6 = [(TIZhuyinInputManager *)self inputBuffer];
      unint64_t v7 = [v6 length];

      if (v5 < v7)
      {
        unint64_t v8 = [(TIZhuyinInputManager *)self bufferSplittingLengthsIndex];
        if ([(TIZhuyinInputManager *)self inputCursorLocation]) {
          ++v8;
        }
        id v9 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
        unint64_t v10 = [v9 count];

        if (v8 < v10)
        {
          id v12 = [(TIZhuyinInputManager *)self inputBufferSplittingLengths];
          uint64_t v11 = [v12 objectAtIndex:v8];
          -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation")+ [v11 unsignedIntegerValue]);
        }
      }
    }
  }
}

- (NSMutableString)inputBuffer
{
  return (NSMutableString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInputBuffer:(id)a3
{
}

- (unint64_t)inputCursorLocation
{
  return self->_inputCursorLocation;
}

- (void)setInputCursorLocation:(unint64_t)a3
{
  self->_inputCursorLocation = a3;
}

- (unsigned)syllableConsonantBuffer
{
  return self->_syllableConsonantBuffer;
}

- (void)setSyllableConsonantBuffer:(unsigned __int16)a3
{
  self->_syllableConsonantBuffer = a3;
}

- (unsigned)syllableMedialBuffer
{
  return self->_syllableMedialBuffer;
}

- (void)setSyllableMedialBuffer:(unsigned __int16)a3
{
  self->_syllableMedialBuffer = a3;
}

- (unsigned)syllableVowelBuffer
{
  return self->_syllableVowelBuffer;
}

- (void)setSyllableVowelBuffer:(unsigned __int16)a3
{
  self->_syllableVowelBuffer = a3;
}

- (unsigned)syllableToneBuffer
{
  return self->_syllableToneBuffer;
}

- (void)setSyllableToneBuffer:(unsigned __int16)a3
{
  self->_syllableToneBuffer = a3;
}

- (NSMutableArray)inputBufferSplittingLengths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInputBufferSplittingLengths:(id)a3
{
}

- (NSMutableArray)composedBufferSplittingLengths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setComposedBufferSplittingLengths:(id)a3
{
}

- (NSMutableString)composedBuffer
{
  return (NSMutableString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setComposedBuffer:(id)a3
{
}

- (BOOL)leftSingleQuotationMarkInserted
{
  return self->_leftSingleQuotationMarkInserted;
}

- (void)setLeftSingleQuotationMarkInserted:(BOOL)a3
{
  self->_leftSingleQuotationMarkInserted = a3;
}

- (BOOL)leftDoubleQuotationMarkInserted
{
  return self->_leftDoubleQuotationMarkInserted;
}

- (void)setLeftDoubleQuotationMarkInserted:(BOOL)a3
{
  self->_leftDoubleQuotationMarkInserted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedBuffer, 0);
  objc_storeStrong((id *)&self->_composedBufferSplittingLengths, 0);
  objc_storeStrong((id *)&self->_inputBufferSplittingLengths, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
}

@end