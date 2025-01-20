@interface VKTextInputStringTokenizer
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (VKCTextRecognitionResult)recognitionResult;
- (VKTextInputStringTokenizer)initWithTextInput:(id)a3 recognitionResult:(id)a4;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
- (void)setRecognitionResult:(id)a3;
@end

@implementation VKTextInputStringTokenizer

- (VKTextInputStringTokenizer)initWithTextInput:(id)a3 recognitionResult:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKTextInputStringTokenizer;
  v8 = [(UITextInputStringTokenizer *)&v11 initWithTextInput:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_recognitionResult, a4);
  }

  return v9;
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)VKTextInputStringTokenizer;
  v10 = [(UITextInputStringTokenizer *)&v15 rangeEnclosingPosition:v8 withGranularity:a4 inDirection:a5];

  objc_super v11 = VKDynamicCast(v9, (uint64_t)v10);

  if (v11)
  {
    v12 = [(VKTextInputStringTokenizer *)self recognitionResult];
    id v13 = [v12 adjustTextRangeToSelectableRange:v11];

    if (v13)
    {
      id v13 = v13;

      objc_super v11 = v13;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v11;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)VKTextInputStringTokenizer;
  v10 = [(UITextInputStringTokenizer *)&v13 positionFromPosition:v8 toBoundary:a4 inDirection:a5];

  objc_super v11 = VKDynamicCast(v9, (uint64_t)v10);

  return v11;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)VKTextInputStringTokenizer;
  return [(UITextInputStringTokenizer *)&v6 isPosition:a3 atBoundary:a4 inDirection:a5];
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)VKTextInputStringTokenizer;
  return [(UITextInputStringTokenizer *)&v6 isPosition:a3 withinTextUnit:a4 inDirection:a5];
}

- (VKCTextRecognitionResult)recognitionResult
{
  return self->_recognitionResult;
}

- (void)setRecognitionResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end