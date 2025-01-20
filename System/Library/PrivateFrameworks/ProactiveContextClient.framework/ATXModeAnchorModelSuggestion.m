@interface ATXModeAnchorModelSuggestion
+ (BOOL)supportsSecureCoding;
- (ATXModeAnchorModelSuggestion)initWithCoder:(id)a3;
- (ATXModeAnchorModelSuggestion)initWithModeUUID:(id)a3 isStart:(BOOL)a4 anchorType:(id)a5 score:(double)a6 numUniqueOccurrencesAfterAnchor:(unint64_t)a7 posteriorProbability:(double)a8 classConditionalProbability:(double)a9 serializedTriggers:(id)a10;
- (BOOL)isStart;
- (NSArray)serializedTriggers;
- (NSString)anchorType;
- (NSString)modeUUID;
- (double)classConditionalProbability;
- (double)posteriorProbability;
- (double)score;
- (unint64_t)numUniqueOccurrencesAfterAnchor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXModeAnchorModelSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXModeAnchorModelSuggestion)initWithModeUUID:(id)a3 isStart:(BOOL)a4 anchorType:(id)a5 score:(double)a6 numUniqueOccurrencesAfterAnchor:(unint64_t)a7 posteriorProbability:(double)a8 classConditionalProbability:(double)a9 serializedTriggers:(id)a10
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)ATXModeAnchorModelSuggestion;
  v21 = [(ATXModeAnchorModelSuggestion *)&v25 init];
  if (v21)
  {
    uint64_t v22 = [v18 copy];
    modeUUID = v21->_modeUUID;
    v21->_modeUUID = (NSString *)v22;

    v21->_isStart = a4;
    objc_storeStrong((id *)&v21->_anchorType, a5);
    v21->_score = a6;
    v21->_numUniqueOccurrencesAfterAnchor = a7;
    v21->_posteriorProbability = a8;
    v21->_classConditionalProbability = a9;
    objc_storeStrong((id *)&v21->_serializedTriggers, a10);
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  modeUUID = self->_modeUUID;
  id v5 = a3;
  [v5 encodeObject:modeUUID forKey:@"modeUUID"];
  [v5 encodeObject:self->_anchorType forKey:@"anchorType"];
  [v5 encodeBool:self->_isStart forKey:@"isStart"];
  [v5 encodeDouble:@"score" forKey:self->_score];
  [v5 encodeInteger:self->_numUniqueOccurrencesAfterAnchor forKey:@"numUniqueOccurrencesAfterAnchor"];
  [v5 encodeDouble:@"posteriorProbability" forKey:self->_posteriorProbability];
  [v5 encodeDouble:@"classConditionalProbability" forKey:self->_classConditionalProbability];
  [v5 encodeObject:self->_serializedTriggers forKey:@"triggers"];
}

- (ATXModeAnchorModelSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeUUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchorType"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isStart"];
  [v4 decodeDoubleForKey:@"score"];
  double v9 = v8;
  uint64_t v10 = [v4 decodeIntegerForKey:@"numUniqueOccurrencesAfterAnchor"];
  [v4 decodeDoubleForKey:@"classConditionalProbability"];
  double v12 = v11;
  [v4 decodeDoubleForKey:@"classConditionalProbability"];
  double v14 = v13;
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  id v18 = [v4 decodeObjectOfClasses:v17 forKey:@"triggers"];

  id v19 = [(ATXModeAnchorModelSuggestion *)self initWithModeUUID:v5 isStart:v7 anchorType:v6 score:v10 numUniqueOccurrencesAfterAnchor:v18 posteriorProbability:v9 classConditionalProbability:v12 serializedTriggers:v14];
  return v19;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)numUniqueOccurrencesAfterAnchor
{
  return self->_numUniqueOccurrencesAfterAnchor;
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (NSArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);

  objc_storeStrong((id *)&self->_modeUUID, 0);
}

@end