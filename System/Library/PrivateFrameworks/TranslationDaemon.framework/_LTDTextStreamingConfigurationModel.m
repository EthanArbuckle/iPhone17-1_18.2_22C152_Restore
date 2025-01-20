@interface _LTDTextStreamingConfigurationModel
- (_LTDTextStreamingConfigurationModel)initWithDictionary:(id)a3;
- (double)maxTimeBetweenTranslations;
- (double)minTimeBetweenTranslations;
- (double)userIdleTime;
- (int64_t)maxPartialTranslationAttempts;
- (int64_t)minNumberOfCharactersForTranslation;
@end

@implementation _LTDTextStreamingConfigurationModel

- (_LTDTextStreamingConfigurationModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_LTDTextStreamingConfigurationModel;
  v5 = [(_LTDTextStreamingConfigurationModel *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"TextStreaming"];
    v7 = [v6 objectForKeyedSubscript:@"MinTimeBetweenTranslations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v6 objectForKeyedSubscript:@"MinTimeBetweenTranslations"];
    }
    else
    {
      v8 = objc_opt_new();
    }
    v9 = v8;
    [v8 doubleValue];
    v5->_minTimeBetweenTranslations = v10;

    v11 = [v6 objectForKeyedSubscript:@"MaxTimeBetweenTranslations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v6 objectForKeyedSubscript:@"MaxTimeBetweenTranslations"];
    }
    else
    {
      v12 = objc_opt_new();
    }
    v13 = v12;
    [v12 doubleValue];
    v5->_maxTimeBetweenTranslations = v14;

    v15 = [v6 objectForKeyedSubscript:@"UserIdleTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v6 objectForKeyedSubscript:@"UserIdleTime"];
    }
    else
    {
      v16 = objc_opt_new();
    }
    v17 = v16;
    [v16 doubleValue];
    v5->_userIdleTime = v18;

    v19 = [v6 objectForKeyedSubscript:@"MaxPartialTranslationAttempts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [v6 objectForKeyedSubscript:@"MaxPartialTranslationAttempts"];
    }
    else
    {
      v20 = objc_opt_new();
    }
    v21 = v20;
    v5->_maxPartialTranslationAttempts = [v20 integerValue];

    v22 = [v6 objectForKeyedSubscript:@"MinNumberOfCharactersForTranslation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [v6 objectForKeyedSubscript:@"MinNumberOfCharactersForTranslation"];
    }
    else
    {
      v23 = objc_opt_new();
    }
    v24 = v23;
    v5->_minNumberOfCharactersForTranslation = [v23 integerValue];

    v25 = v5;
  }

  return v5;
}

- (double)minTimeBetweenTranslations
{
  return self->_minTimeBetweenTranslations;
}

- (double)maxTimeBetweenTranslations
{
  return self->_maxTimeBetweenTranslations;
}

- (double)userIdleTime
{
  return self->_userIdleTime;
}

- (int64_t)maxPartialTranslationAttempts
{
  return self->_maxPartialTranslationAttempts;
}

- (int64_t)minNumberOfCharactersForTranslation
{
  return self->_minNumberOfCharactersForTranslation;
}

@end