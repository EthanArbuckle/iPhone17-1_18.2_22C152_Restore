@interface TSDTextInputTokenizer
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (TSDTextInput)editor;
- (TSDTextInputTokenizer)initWithTextInput:(id)a3;
- (id)p_moveToEndOfWordFromPosition:(id)a3;
- (id)p_moveToStartOfWordFromPosition:(id)a3;
- (id)p_positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
@end

@implementation TSDTextInputTokenizer

- (TSDTextInputTokenizer)initWithTextInput:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputTokenizer;
  v3 = -[UITextInputStringTokenizer initWithTextInput:](&v5, sel_initWithTextInput_);
  if (v3)
  {
    objc_opt_class();
    v3->_textInputResponder = (TSDTextInputResponder *)TSUDynamicCast();
  }
  return v3;
}

- (TSDTextInput)editor
{
  return [(TSDTextInputResponder *)self->_textInputResponder editor];
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  if (!v8)
  {
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDTextInputTokenizer isPosition:atBoundary:inDirection:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2208, @"bad text position");
  }
  v11 = [(TSDTextInputResponder *)self->_textInputResponder editor];
  uint64_t v12 = [v8 charIndex];
  uint64_t v13 = [v8 endOfLineAffinity];

  return [(TSDTextInput *)v11 isCharIndex:v12 withEolAffinity:v13 atBoundary:a4 inDirection:a5];
}

- (id)p_positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  if (!v9)
  {
    v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2227, @"invalid nil value for '%s'", "tsdPosition");
    [(TSDTextInputTokenizer *)self editor];
    return 0;
  }
  uint64_t v10 = (void *)v9;
  id result = [(TSDTextInputTokenizer *)self editor];
  if (!result) {
    return result;
  }
  if ((unint64_t)a4 > 4 || ((1 << a4) & 0x1A) == 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)TSDTextInputTokenizer;
    return [(UITextInputStringTokenizer *)&v25 positionFromPosition:a3 toBoundary:a4 inDirection:a5];
  }
  id v12 = result;
  unint64_t v13 = [v10 charIndex];
  if (v13 > [v12 editRange]) {
    [v10 endOfLineAffinity];
  }
  [v10 preferredPosition];
  double v26 = v14;
  uint64_t v15 = [v12 charIndexByMovingPosition:v10 toBoundary:a4 inDirection:a5 preferPosition:&v26];
  int v16 = [v10 isPreferredStart];
  HIDWORD(v17) = HIDWORD(v26);
  *(float *)&double v17 = v26;
  textInputResponder = self->_textInputResponder;
  if (v16) {
    [(TSDTextInputResponder *)textInputResponder setPreferredStartPosition:v17];
  }
  else {
    [(TSDTextInputResponder *)textInputResponder setPreferredEndPosition:v17];
  }
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4 != 4) {
      goto LABEL_21;
    }
    if ((unint64_t)(a5 - 4) < 2)
    {
      uint64_t v21 = [v10 endOfLineAffinity];
      goto LABEL_23;
    }
    if (a5 == 2 || !a5) {
      uint64_t v21 = 1;
    }
    else {
LABEL_21:
    }
      uint64_t v21 = 0;
LABEL_23:
    float v22 = v26;
    uint64_t v23 = [v10 isPreferredStart];
    *(float *)&double v24 = v22;
    return +[TSDTextPosition textPositionWithCharIndex:v15 eolAffinity:v21 preferredPosition:v23 isPreferredStart:v24];
  }
  if ([(TSDTextInputTokenizer *)self isPosition:a3 atBoundary:a4 inDirection:a5])
  {
    return a3;
  }
  else
  {
    return 0;
  }
}

- (id)p_moveToStartOfWordFromPosition:(id)a3
{
  BOOL v5 = [(TSDTextInputTokenizer *)self isPosition:a3 withinTextUnit:1 inDirection:1];
  id result = [(TSDTextInputTokenizer *)self p_positionFromPosition:a3 toBoundary:1 inDirection:1];
  id v7 = result;
  if (!v5)
  {
    if (!result)
    {
      id v7 = a3;
      do
      {
        objc_opt_class();
        v8 = (void *)TSUDynamicCast();
        if (!v8)
        {
          uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v10 = [NSString stringWithUTF8String:"-[TSDTextInputTokenizer p_moveToStartOfWordFromPosition:]"];
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2302, @"Bad text position.");
        }
        if (![v8 charIndex]) {
          break;
        }
        id v7 = [(TSDTextInputTokenizer *)self p_positionFromPosition:v7 toBoundary:3 inDirection:1];
      }
      while ([(TSDTextInputTokenizer *)self isPosition:v7 atBoundary:3 inDirection:1]);
    }
    return [(TSDTextInputTokenizer *)self p_positionFromPosition:v7 toBoundary:1 inDirection:1];
  }
  return result;
}

- (id)p_moveToEndOfWordFromPosition:(id)a3
{
  id v3 = a3;
  if (![(TSDTextInputTokenizer *)self isPosition:a3 withinTextUnit:1 inDirection:0])
  {
    id v5 = [(TSDTextInputTokenizer *)self p_positionFromPosition:v3 toBoundary:1 inDirection:0];
    if (v5) {
      id v3 = v5;
    }
  }

  return [(TSDTextInputTokenizer *)self p_positionFromPosition:v3 toBoundary:1 inDirection:0];
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  objc_opt_class();
  uint64_t v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDTextInputTokenizer positionFromPosition:toBoundary:inDirection:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2343, @"invalid nil value for '%s'", "tsdPosition");
  }
  if (!-[TSDTextInput textIsVerticalAtCharIndex:](-[TSDTextInputTokenizer editor](self, "editor"), "textIsVerticalAtCharIndex:", [v9 charIndex])|| (unint64_t)(a4 - 6) > 0xFFFFFFFFFFFFFFFDLL)
  {
    goto LABEL_8;
  }
  if (a4 != 3)
  {
    if (a4 == 1)
    {
      id v12 = self;
      id v13 = a3;
      int64_t v14 = 3;
      int64_t v15 = a5 == 0;
LABEL_9:
      return [(TSDTextInputTokenizer *)v12 p_positionFromPosition:v13 toBoundary:v14 inDirection:v15];
    }
LABEL_8:
    id v12 = self;
    id v13 = a3;
    int64_t v14 = a4;
    int64_t v15 = a5;
    goto LABEL_9;
  }
  if (a5)
  {
    return [(TSDTextInputTokenizer *)self p_moveToStartOfWordFromPosition:a3];
  }
  else
  {
    return [(TSDTextInputTokenizer *)self p_moveToEndOfWordFromPosition:a3];
  }
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  if (a4 == 1 && (uint64_t v10 = (void *)v9) != 0)
  {
    uint64_t v11 = [(TSDTextInputResponder *)self->_textInputResponder editor];
    uint64_t v12 = [v10 charIndex];
    return [(TSDTextInput *)v11 isCharIndex:v12 withinTextUnit:1 inDirection:a5];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TSDTextInputTokenizer;
    return [(UITextInputStringTokenizer *)&v14 isPosition:a3 withinTextUnit:a4 inDirection:a5];
  }
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  if (a4 == 1 && (unint64_t)a5 <= 1)
  {
    objc_opt_class();
    id v7 = (void *)TSUDynamicCast();
    if (!v7)
    {
      v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSDTextInputTokenizer rangeEnclosingPosition:withGranularity:inDirection:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2421, @"bad text position");
    }
    uint64_t v10 = -[TSDTextInput rangeOfWordEnclosingCharIndex:backward:](-[TSDTextInputTokenizer editor](self, "editor"), "rangeOfWordEnclosingCharIndex:backward:", [v7 charIndex], a5 == 1);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      return +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v10, v11);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSDTextInputTokenizer;
    return -[UITextInputStringTokenizer rangeEnclosingPosition:withGranularity:inDirection:](&v13, sel_rangeEnclosingPosition_withGranularity_inDirection_, a3);
  }
}

@end