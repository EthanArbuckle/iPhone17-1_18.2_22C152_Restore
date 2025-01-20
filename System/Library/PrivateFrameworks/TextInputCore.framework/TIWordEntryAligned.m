@interface TIWordEntryAligned
+ (BOOL)supportsSecureCoding;
- (BOOL)isContinuousPathConversion;
- (NSArray)alignedKeyboardInputs;
- (NSArray)alignedTouches;
- (NSString)completeString;
- (NSString)expectedString;
- (TIWordEntry)originalWord;
- (TIWordEntryAligned)init;
- (TIWordEntryAligned)initWithCoder:(id)a3;
- (int)inSessionAlignmentConfidence;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignedKeyboardInputs:(id)a3;
- (void)setAlignedTouches:(id)a3;
- (void)setCompleteString:(id)a3;
- (void)setExpectedString:(id)a3;
- (void)setInSessionAlignmentConfidence:(int)a3;
- (void)setIsContinuousPathConversion:(BOOL)a3;
- (void)setOriginalWord:(id)a3;
@end

@implementation TIWordEntryAligned

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeString, 0);
  objc_storeStrong((id *)&self->_originalWord, 0);
  objc_storeStrong((id *)&self->_expectedString, 0);
  objc_storeStrong((id *)&self->_alignedKeyboardInputs, 0);

  objc_storeStrong((id *)&self->_alignedTouches, 0);
}

- (void)setCompleteString:(id)a3
{
}

- (NSString)completeString
{
  return self->_completeString;
}

- (void)setInSessionAlignmentConfidence:(int)a3
{
  self->_inSessionAlignmentConfidence = a3;
}

- (int)inSessionAlignmentConfidence
{
  return self->_inSessionAlignmentConfidence;
}

- (void)setIsContinuousPathConversion:(BOOL)a3
{
  self->_isContinuousPathConversion = a3;
}

- (BOOL)isContinuousPathConversion
{
  return self->_isContinuousPathConversion;
}

- (void)setOriginalWord:(id)a3
{
}

- (TIWordEntry)originalWord
{
  return self->_originalWord;
}

- (void)setExpectedString:(id)a3
{
}

- (NSString)expectedString
{
  return self->_expectedString;
}

- (void)setAlignedKeyboardInputs:(id)a3
{
}

- (NSArray)alignedKeyboardInputs
{
  return self->_alignedKeyboardInputs;
}

- (void)setAlignedTouches:(id)a3
{
}

- (NSArray)alignedTouches
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  alignedTouches = self->_alignedTouches;
  if (!alignedTouches)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(TIWordEntryAligned *)self alignedKeyboardInputs];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) touchEvent];
          [(NSArray *)v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = self->_alignedTouches;
    self->_alignedTouches = v4;

    alignedTouches = self->_alignedTouches;
  }
  v12 = alignedTouches;

  return v12;
}

- (TIWordEntryAligned)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordEntryAligned;
  return [(TIWordEntryAligned *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  alignedTouches = self->_alignedTouches;
  id v5 = a3;
  [v5 encodeObject:alignedTouches forKey:@"alignedTouches"];
  [v5 encodeObject:self->_alignedKeyboardInputs forKey:@"alignedKeyboardInputs"];
  [v5 encodeObject:self->_expectedString forKey:@"expectedString"];
  [v5 encodeObject:self->_originalWord forKey:@"originalWord"];
  [v5 encodeBool:self->_isContinuousPathConversion forKey:@"isContinuousPathConversion"];
  [v5 encodeInt:self->_inSessionAlignmentConfidence forKey:@"inSessionAlignmentConfidence"];
}

- (TIWordEntryAligned)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TIWordEntryAligned;
  id v5 = [(TIWordEntryAligned *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"alignedTouches"];
    alignedTouches = v5->_alignedTouches;
    v5->_alignedTouches = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"alignedKeyboardInputs"];
    alignedKeyboardInputs = v5->_alignedKeyboardInputs;
    v5->_alignedKeyboardInputs = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedString"];
    expectedString = v5->_expectedString;
    v5->_expectedString = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalWord"];
    originalWord = v5->_originalWord;
    v5->_originalWord = (TIWordEntry *)v18;

    v5->_isContinuousPathConversion = [v4 decodeBoolForKey:@"isContinuousPathConversion"];
    v5->_inSessionAlignmentConfidence = [v4 decodeIntForKey:@"inSessionAlignmentConfidence"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end