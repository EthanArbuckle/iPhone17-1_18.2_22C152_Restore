@interface TIConvertedCandidate
- (NSArray)geometryData;
- (NSArray)replacedAmbiguousPinyinSyllables;
- (NSArray)replacementUnambiguousPinyinSyllables;
- (NSArray)touchData;
- (NSString)convertedInput;
- (NSString)revertedInput;
- (TIConvertedCandidate)initWithCandidate:(id)a3;
- (TIConvertedCandidate)initWithCandidate:(id)a3 replacedAmbiguousPinyinSyllables:(id)a4 replacementUnambiguousPinyinSyllables:(id)a5 convertedInput:(id)a6;
- (TIKeyboardCandidate)candidate;
- (void)setCandidate:(id)a3;
- (void)setConvertedInput:(id)a3;
- (void)setGeometryData:(id)a3;
- (void)setReplacedAmbiguousPinyinSyllables:(id)a3;
- (void)setReplacementUnambiguousPinyinSyllables:(id)a3;
- (void)setTouchData:(id)a3;
@end

@implementation TIConvertedCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchData, 0);
  objc_storeStrong((id *)&self->_geometryData, 0);
  objc_storeStrong((id *)&self->_replacementUnambiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_replacedAmbiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_convertedInput, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setTouchData:(id)a3
{
}

- (NSArray)touchData
{
  return self->_touchData;
}

- (void)setGeometryData:(id)a3
{
}

- (NSArray)geometryData
{
  return self->_geometryData;
}

- (void)setReplacementUnambiguousPinyinSyllables:(id)a3
{
}

- (NSArray)replacementUnambiguousPinyinSyllables
{
  return self->_replacementUnambiguousPinyinSyllables;
}

- (void)setReplacedAmbiguousPinyinSyllables:(id)a3
{
}

- (NSArray)replacedAmbiguousPinyinSyllables
{
  return self->_replacedAmbiguousPinyinSyllables;
}

- (void)setConvertedInput:(id)a3
{
}

- (NSString)convertedInput
{
  return self->_convertedInput;
}

- (void)setCandidate:(id)a3
{
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (NSString)revertedInput
{
  v2 = [(TIConvertedCandidate *)self candidate];
  v3 = [v2 input];

  return (NSString *)v3;
}

- (TIConvertedCandidate)initWithCandidate:(id)a3 replacedAmbiguousPinyinSyllables:(id)a4 replacementUnambiguousPinyinSyllables:(id)a5 convertedInput:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TIConvertedCandidate;
  v15 = [(TIConvertedCandidate *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_candidate, a3);
    uint64_t v17 = [v12 copy];
    replacedAmbiguousPinyinSyllables = v16->_replacedAmbiguousPinyinSyllables;
    v16->_replacedAmbiguousPinyinSyllables = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    replacementUnambiguousPinyinSyllables = v16->_replacementUnambiguousPinyinSyllables;
    v16->_replacementUnambiguousPinyinSyllables = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    convertedInput = v16->_convertedInput;
    v16->_convertedInput = (NSString *)v21;
  }
  return v16;
}

- (TIConvertedCandidate)initWithCandidate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIConvertedCandidate;
  v6 = [(TIConvertedCandidate *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_candidate, a3);
    v8 = [v5 input];
    uint64_t v9 = [v8 copy];
    convertedInput = v7->_convertedInput;
    v7->_convertedInput = (NSString *)v9;
  }
  return v7;
}

@end