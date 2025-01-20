@interface FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration
- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)init;
- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)initWithDictionary:(id)a3;
- (NSString)contextFeatureKey;
- (NSString)generalChannelSuggestionsOutputName;
- (NSString)generalChannelSuggestionsScoreOutputName;
- (NSString)newsPlusChannelSuggestionsOutputName;
- (NSString)newsPlusChannelSuggestionsScoreOutputName;
- (id)description;
- (void)setContextFeatureKey:(id)a3;
- (void)setGeneralChannelSuggestionsOutputName:(id)a3;
- (void)setGeneralChannelSuggestionsScoreOutputName:(id)a3;
- (void)setNewsPlusChannelSuggestionsOutputName:(id)a3;
- (void)setNewsPlusChannelSuggestionsScoreOutputName:(id)a3;
@end

@implementation FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)self contextFeatureKey];
  [v3 appendFormat:@"\n\tcontextFeatureKey: %@;", v4];

  v5 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)self generalChannelSuggestionsOutputName];
  [v3 appendFormat:@"\n\tgeneralChannelSuggestionsOutputName: %@;", v5];

  v6 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)self generalChannelSuggestionsScoreOutputName];
  [v3 appendFormat:@"\n\tgeneralChannelSuggestionsScoreOutputName: %@;", v6];

  v7 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)self newsPlusChannelSuggestionsOutputName];
  [v3 appendFormat:@"\n\tnewsPlusChannelSuggestionsOutputName: %@;", v7];

  v8 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)self newsPlusChannelSuggestionsScoreOutputName];
  [v3 appendFormat:@"\n\tnewsPlusChannelSuggestionsScoreOutputName: %@;", v8];

  [v3 appendString:@"\n>"];
  return v3;
}

- (NSString)newsPlusChannelSuggestionsScoreOutputName
{
  return self->_newsPlusChannelSuggestionsScoreOutputName;
}

- (NSString)newsPlusChannelSuggestionsOutputName
{
  return self->_newsPlusChannelSuggestionsOutputName;
}

- (NSString)generalChannelSuggestionsScoreOutputName
{
  return self->_generalChannelSuggestionsScoreOutputName;
}

- (NSString)generalChannelSuggestionsOutputName
{
  return self->_generalChannelSuggestionsOutputName;
}

- (NSString)contextFeatureKey
{
  return self->_contextFeatureKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsPlusChannelSuggestionsScoreOutputName, 0);
  objc_storeStrong((id *)&self->_newsPlusChannelSuggestionsOutputName, 0);
  objc_storeStrong((id *)&self->_generalChannelSuggestionsScoreOutputName, 0);
  objc_storeStrong((id *)&self->_generalChannelSuggestionsOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"contextFeatureKey", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = FCAppConfigurationStringValue(v4, @"generalChannelSuggestionsOutputName", 0);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = FCAppConfigurationStringValue(v4, @"generalChannelSuggestionsScoreOutputName", 0);
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
        v14 = FCAppConfigurationStringValue(v4, @"newsPlusChannelSuggestionsOutputName", 0);
        v15 = v14;
        if (v14)
        {
          id v24 = v13;
          id v23 = v14;
          v16 = FCAppConfigurationStringValue(v4, @"newsPlusChannelSuggestionsScoreOutputName", 0);
          v17 = v16;
          if (v16)
          {
            id v18 = v16;
            v25.receiver = self;
            v25.super_class = (Class)FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration;
            v19 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)&v25 init];
            p_isa = (id *)&v19->super.isa;
            if (v19)
            {
              objc_storeStrong((id *)&v19->_contextFeatureKey, v6);
              objc_storeStrong(p_isa + 2, v9);
              objc_storeStrong(p_isa + 3, v12);
              objc_storeStrong(p_isa + 4, v15);
              objc_storeStrong(p_isa + 5, v17);
            }
            self = p_isa;

            v21 = self;
          }
          else
          {
            v21 = 0;
          }

          id v13 = v24;
        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)init
{
  return [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)self initWithDictionary:0];
}

- (void)setContextFeatureKey:(id)a3
{
}

- (void)setGeneralChannelSuggestionsOutputName:(id)a3
{
}

- (void)setGeneralChannelSuggestionsScoreOutputName:(id)a3
{
}

- (void)setNewsPlusChannelSuggestionsOutputName:(id)a3
{
}

- (void)setNewsPlusChannelSuggestionsScoreOutputName:(id)a3
{
}

@end