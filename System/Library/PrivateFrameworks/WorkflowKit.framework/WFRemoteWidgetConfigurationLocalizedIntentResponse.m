@interface WFRemoteWidgetConfigurationLocalizedIntentResponse
+ (BOOL)supportsSecureCoding;
- (INIntent)localizedIntent;
- (NSData)localizedIntentData;
- (NSString)languageCode;
- (WFRemoteWidgetConfigurationLocalizedIntentResponse)initWithCoder:(id)a3;
- (WFRemoteWidgetConfigurationLocalizedIntentResponse)initWithLocalizedIntentRepresentation:(id)a3 languageCode:(id)a4 error:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedIntentData:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationLocalizedIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedIntentData, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_localizedIntent, 0);
}

- (void)setLocalizedIntentData:(id)a3
{
}

- (NSData)localizedIntentData
{
  return self->_localizedIntentData;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (WFRemoteWidgetConfigurationLocalizedIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFRemoteWidgetConfigurationLocalizedIntentResponse;
  v5 = [(WFRemoteWidgetConfigurationResponse *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedIntentData"];
    localizedIntentData = v5->_localizedIntentData;
    v5->_localizedIntentData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"languageCode"];
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedIntentData = self->_localizedIntentData;
  id v5 = a3;
  [v5 encodeObject:localizedIntentData forKey:@"localizedIntentData"];
  [v5 encodeObject:self->_languageCode forKey:@"languageCode"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WFRemoteWidgetConfigurationLocalizedIntentResponse *)self localizedIntent];
  id v5 = [(WFRemoteWidgetConfigurationResponse *)self error];
  uint64_t v6 = [v3 stringWithFormat:@"localizedIntent: %@, error: %@", v4, v5];

  return v6;
}

- (INIntent)localizedIntent
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  localizedIntent = self->_localizedIntent;
  if (localizedIntent)
  {
LABEL_12:
    v13 = localizedIntent;
    goto LABEL_13;
  }
  id v4 = [(WFRemoteWidgetConfigurationLocalizedIntentResponse *)self localizedIntentData];

  if (v4)
  {
    unsigned int v17 = 0;
    id v5 = [(WFRemoteWidgetConfigurationLocalizedIntentResponse *)self localizedIntentData];
    uint64_t v6 = (void *)OPACKDecodeData();

    id v16 = 0;
    v7 = [MEMORY[0x1E4F304D0] makeFromWidgetPlistableRepresentation:v6 error:&v16];
    id v8 = v16;
    v9 = self->_localizedIntent;
    self->_localizedIntent = v7;

    if (v17)
    {
      v10 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [NSNumber numberWithInt:v17];
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntent]";
        __int16 v20 = 2114;
        id v21 = v11;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Error making localized intent from intent data. Status: %{public}@", buf, 0x16u);
      }
    }
    if (v8)
    {
      objc_super v12 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntent]";
        __int16 v20 = 2114;
        id v21 = v8;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Error making localized intent from intent data. Error: %{public}@", buf, 0x16u);
      }
    }
    localizedIntent = self->_localizedIntent;
    goto LABEL_12;
  }
  v15 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse localizedIntent]";
    _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Error making localized intent from intent data: intent data is nil", buf, 0xCu);
  }

  v13 = 0;
LABEL_13:
  return v13;
}

- (WFRemoteWidgetConfigurationLocalizedIntentResponse)initWithLocalizedIntentRepresentation:(id)a3 languageCode:(id)a4 error:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WFRemoteWidgetConfigurationLocalizedIntentResponse;
  v10 = [(WFRemoteWidgetConfigurationResponse *)&v20 initWithError:a5];
  if (v10)
  {
    if (v8)
    {
      unsigned int v19 = 0;
      uint64_t v11 = MEMORY[0x1C87C9450](v8, 0, &v19);
      localizedIntentData = v10->_localizedIntentData;
      v10->_localizedIntentData = (NSData *)v11;

      if (v19)
      {
        v13 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = [NSNumber numberWithInt:v19];
          *(_DWORD *)buf = 136315394;
          uint64_t v22 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse initWithLocalizedIntentRepresentation:languageCode:error:]";
          __int16 v23 = 2114;
          v24 = v14;
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Error encoding localized intent representation: %{public}@", buf, 0x16u);
        }
        goto LABEL_7;
      }
    }
    else
    {
      id v16 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v22 = "-[WFRemoteWidgetConfigurationLocalizedIntentResponse initWithLocalizedIntentRepresentation:languageCode:error:]";
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s Error encoding localized intent representation: localized intent representation is nil", buf, 0xCu);
      }

      unsigned int v17 = v10->_localizedIntentData;
      v10->_localizedIntentData = 0;
    }
    objc_storeStrong((id *)&v10->_languageCode, a4);
    v15 = v10;
    goto LABEL_12;
  }
LABEL_7:
  v15 = 0;
LABEL_12:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end