@interface UIDictationInterpretationGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isLowConfidence;
- (NSArray)interpretations;
- (UIDictationInterpretation)bestInterpretation;
- (UIDictationInterpretationGroup)initWithCoder:(id)a3;
- (UIDictationInterpretationGroup)initWithInterpretations:(id)a3;
- (UIDictationInterpretationGroup)initWithInterpretations:(id)a3 isLowConfidence:(BOOL)a4;
- (double)bestConfidenceScore;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIDictationInterpretationGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationInterpretationGroup)initWithInterpretations:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationInterpretationGroup;
  v5 = [(UIDictationInterpretationGroup *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    interpretations = v5->_interpretations;
    v5->_interpretations = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (UIDictationInterpretationGroup)initWithInterpretations:(id)a3 isLowConfidence:(BOOL)a4
{
  result = [(UIDictationInterpretationGroup *)self initWithInterpretations:a3];
  if (result) {
    result->_isLowConfidence = a4;
  }
  return result;
}

- (UIDictationInterpretationGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIDictationInterpretationGroup;
  v5 = [(UIDictationInterpretationGroup *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"interpretations"];
    interpretations = v5->_interpretations;
    v5->_interpretations = (NSArray *)v9;

    v5->_isLowConfidence = [v4 decodeBoolForKey:@"isLowConfidence"];
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  interpretations = self->_interpretations;
  id v5 = a3;
  [v5 encodeObject:interpretations forKey:@"interpretations"];
  [v5 encodeBool:self->_isLowConfidence forKey:@"isLowConfidence"];
}

- (double)bestConfidenceScore
{
  v2 = [(NSArray *)self->_interpretations firstObject];
  [v2 averageConfidenceScore];
  double v4 = v3;

  return v4;
}

- (UIDictationInterpretation)bestInterpretation
{
  return (UIDictationInterpretation *)[(NSArray *)self->_interpretations firstObject];
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSArray *)self->_interpretations firstObject];
  uint64_t v7 = [v6 serializedInterpretationWithTransform:0];
  v8 = [v3 stringWithFormat:@"<%@ best=\"%@\">", v5, v7];

  return v8;
}

- (NSArray)interpretations
{
  return self->_interpretations;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void).cxx_destruct
{
}

@end