@interface FCNewsPersonalizationTrainingBias
+ (id)identifierForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5;
- (FCNewsPersonalizationTrainingBias)initWithDictionary:(id)a3;
- (NSString)eventType;
- (NSString)feedType;
- (NSString)groupType;
- (NSString)identifier;
- (double)bias;
- (id)description;
- (void)setBias:(double)a3;
- (void)setEventType:(id)a3;
- (void)setFeedType:(id)a3;
- (void)setGroupType:(id)a3;
@end

@implementation FCNewsPersonalizationTrainingBias

- (FCNewsPersonalizationTrainingBias)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCNewsPersonalizationTrainingBias;
  v5 = [(FCNewsPersonalizationTrainingBias *)&v17 init];
  if (!v5) {
    goto LABEL_15;
  }
  v6 = FCAppConfigurationStringValue(v4, @"eventType", 0);
  v7 = FCAppConfigurationStringValue(v4, @"feedType", 0);
  uint64_t v8 = FCAppConfigurationStringValue(v4, @"groupType", 0);
  v9 = (void *)v8;
  if (v6 || v7 || v8)
  {
    v11 = FCAppConfigurationNumberValue(v4, @"bias", 0);
    if (v11)
    {
      objc_storeStrong((id *)&v5->_eventType, v6);
      objc_storeStrong((id *)&v5->_feedType, v7);
      objc_storeStrong((id *)&v5->_groupType, v9);
      [v11 doubleValue];
      int v10 = 0;
      v5->_bias = v12;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        v16 = (void *)[[NSString alloc] initWithFormat:@"Was supplied a group bias with no bias"];
        *(_DWORD *)buf = 136315906;
        v19 = "-[FCNewsPersonalizationTrainingBias initWithDictionary:]";
        __int16 v20 = 2080;
        v21 = "FCNewsPersonalizationTrainingBias.m";
        __int16 v22 = 1024;
        int v23 = 44;
        __int16 v24 = 2114;
        v25 = v16;
        _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidGroupBias) : %s %s:%d %{public}@", buf, 0x26u);
      }
      v5 = 0;
      int v10 = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v15 = (void *)[[NSString alloc] initWithFormat:@"Was supplied a group bias with no event, feed or group type"];
      *(_DWORD *)buf = 136315906;
      v19 = "-[FCNewsPersonalizationTrainingBias initWithDictionary:]";
      __int16 v20 = 2080;
      v21 = "FCNewsPersonalizationTrainingBias.m";
      __int16 v22 = 1024;
      int v23 = 37;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidGroupBias) : %s %s:%d %{public}@", buf, 0x26u);
    }
    int v10 = 1;
    v11 = v5;
    v5 = 0;
  }

  if (v10)
  {
    v13 = 0;
  }
  else
  {
LABEL_15:
    v5 = v5;
    v13 = v5;
  }

  return v13;
}

- (NSString)identifier
{
  v3 = [(FCNewsPersonalizationTrainingBias *)self eventType];
  id v4 = [(FCNewsPersonalizationTrainingBias *)self feedType];
  v5 = [(FCNewsPersonalizationTrainingBias *)self groupType];
  v6 = +[FCNewsPersonalizationTrainingBias identifierForEventType:v3 feedType:v4 groupType:v5];

  return (NSString *)v6;
}

+ (id)identifierForEventType:(id)a3 feedType:(id)a4 groupType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [MEMORY[0x1E4F28E78] string];
  if (v7)
  {
    v11 = [v7 stringByAppendingString:@"-"];
    [v10 appendString:v11];
  }
  if (v8)
  {
    double v12 = [v8 stringByAppendingString:@"-"];
    [v10 appendString:v12];
  }
  if (v9)
  {
    v13 = [v9 stringByAppendingString:@"-"];
    [v10 appendString:v13];
  }
  if ([v10 length]) {
    objc_msgSend(v10, "deleteCharactersInRange:", objc_msgSend(v10, "length") - 1, 1);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationTrainingBias *)self eventType];
  [v3 appendFormat:@"; eventType: %@", v4];

  v5 = [(FCNewsPersonalizationTrainingBias *)self feedType];
  [v3 appendFormat:@"; feedType: %@", v5];

  v6 = [(FCNewsPersonalizationTrainingBias *)self groupType];
  [v3 appendFormat:@"; groupType: %@", v6];

  [(FCNewsPersonalizationTrainingBias *)self bias];
  objc_msgSend(v3, "appendFormat:", @"; bias: %f", v7);
  [v3 appendString:@">"];
  return v3;
}

- (double)bias
{
  return self->_bias;
}

- (void)setBias:(double)a3
{
  self->_bias = a3;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (NSString)feedType
{
  return self->_feedType;
}

- (void)setFeedType:(id)a3
{
}

- (NSString)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupType, 0);
  objc_storeStrong((id *)&self->_feedType, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end