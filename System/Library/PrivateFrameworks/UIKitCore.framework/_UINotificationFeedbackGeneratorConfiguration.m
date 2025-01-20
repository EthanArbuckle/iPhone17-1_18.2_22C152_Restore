@interface _UINotificationFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
+ (id)privateConfiguration;
+ (id)privateConfigurationForTypes:(id)a3;
- (BOOL)defaultEnabled;
- (BOOL)includePrivateEvents;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)feedbacks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)feedbackKeyPaths;
- (void)setFeedbacks:(id)a3;
- (void)setIncludePrivateEvents:(BOOL)a3;
@end

@implementation _UINotificationFeedbackGeneratorConfiguration

+ (id)privateConfigurationForTypes:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78___UINotificationFeedbackGeneratorConfiguration_privateConfigurationForTypes___block_invoke;
  v8[3] = &unk_1E52ECD30;
  id v9 = v4;
  id v5 = v4;
  v6 = [a1 _configurationWithKey:@"private" requiredSupportLevel:0 preparationBlock:v8];
  [v6 setIncludePrivateEvents:1];

  return v6;
}

- (void)setIncludePrivateEvents:(BOOL)a3
{
  self->_includePrivateEvents = a3;
}

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"default" requiredSupportLevel:2 preparationBlock:&__block_literal_global_184];
}

+ (id)privateConfiguration
{
  v2 = [a1 defaultConfiguration];
  objc_msgSend(v2, "set_stats_key:", @"private");
  [v2 setIncludePrivateEvents:1];
  [v2 setRequiredSupportLevel:0];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
  id v4 = [(_UIFeedbackGeneratorConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_feedbacks copy];
  v6 = (void *)v4[12];
  v4[12] = v5;

  *((unsigned char *)v4 + 88) = self->_includePrivateEvents;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
  if ([(_UIFeedbackGeneratorConfiguration *)&v13 isEqual:v4])
  {
    uint64_t v5 = v4;
    v6 = (void *)v5[12];
    v7 = self->_feedbacks;
    objc_super v8 = v6;
    id v9 = v8;
    if (v7 == v8)
    {
      char v11 = 1;
    }
    else
    {
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        char v11 = 0;
      }
      else {
        char v11 = [(NSDictionary *)v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)defaultEnabled
{
  if (self->_includePrivateEvents)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
    if ([(_UIFeedbackGeneratorConfiguration *)&v6 defaultEnabled])
    {
      return 1;
    }
    else
    {
      v3 = +[_UIFeedbackPreferences sharedPreferences];
      BOOL v2 = [v3 enabledFeedbackTypesForCategory:0x1ED11D4E0] != 0;
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
    return [(_UIFeedbackGeneratorConfiguration *)&v5 defaultEnabled];
  }
  return v2;
}

- (id)feedbackKeyPaths
{
  v6.receiver = self;
  v6.super_class = (Class)_UINotificationFeedbackGeneratorConfiguration;
  BOOL v2 = [(_UIFeedbackGeneratorConfiguration *)&v6 feedbackKeyPaths];
  v3 = NSStringFromSelector(sel_feedbacks);
  id v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (void)setFeedbacks:(id)a3
{
  id v4 = (NSDictionary *)a3;
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedbacks = self->_feedbacks;
  self->_feedbacks = v4;
}

- (NSDictionary)feedbacks
{
  [(_UIFeedbackGeneratorConfiguration *)self _setupIfNecessary];
  feedbacks = self->_feedbacks;
  return feedbacks;
}

- (BOOL)includePrivateEvents
{
  return self->_includePrivateEvents;
}

- (void).cxx_destruct
{
}

@end