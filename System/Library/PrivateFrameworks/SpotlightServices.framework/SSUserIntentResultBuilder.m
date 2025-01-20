@interface SSUserIntentResultBuilder
+ (BOOL)supportsResult:(id)a3;
- (BOOL)isBackgroundRunnable;
- (NSData)userActivityData;
- (NSDate)startDate;
- (NSString)appBundleId;
- (NSString)intentName;
- (NSString)punchoutLabel;
- (NSString)userActivityRequiredString;
- (SSUserIntentResultBuilder)initWithResult:(id)a3;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildResult;
- (id)buildThumbnail;
- (void)buildCommand;
- (void)setAppBundleId:(id)a3;
- (void)setIntentName:(id)a3;
- (void)setIsBackgroundRunnable:(BOOL)a3;
- (void)setPunchoutLabel:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setUserActivityData:(id)a3;
- (void)setUserActivityRequiredString:(id)a3;
@end

@implementation SSUserIntentResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  v3 = [a3 contentType];
  char v4 = [v3 hasPrefix:*MEMORY[0x1E4F30100]];

  return v4;
}

- (SSUserIntentResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSUserIntentResultBuilder;
  v5 = [(SSResultBuilder *)&v15 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 applicationBundleIdentifier];
    [(SSUserIntentResultBuilder *)v5 setAppBundleId:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22B40] withType:objc_opt_class()];
    -[SSUserIntentResultBuilder setIsBackgroundRunnable:](v5, "setIsBackgroundRunnable:", [v7 BOOLValue]);

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F235A8] withType:objc_opt_class()];
    [(SSUserIntentResultBuilder *)v5 setStartDate:v8];

    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    [(SSUserIntentResultBuilder *)v5 setIntentName:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F23408] withType:objc_opt_class()];
    [(SSUserIntentResultBuilder *)v5 setPunchoutLabel:v10];

    v11 = [(SSResultBuilder *)v5 result];
    v12 = [v11 valueForAttribute:*MEMORY[0x1E4F23688] withType:objc_opt_class()];
    [(SSUserIntentResultBuilder *)v5 setUserActivityData:v12];

    v13 = [v4 valueForAttribute:*MEMORY[0x1E4F236A0] withType:objc_opt_class()];
    if (!v13)
    {
      v13 = [v4 valueForAttribute:*MEMORY[0x1E4F23020] withType:objc_opt_class()];
    }
    [(SSUserIntentResultBuilder *)v5 setUserActivityRequiredString:v13];
  }
  return v5;
}

- (id)buildResult
{
  v6.receiver = self;
  v6.super_class = (Class)SSUserIntentResultBuilder;
  v3 = [(SSResultBuilder *)&v6 buildResult];
  id v4 = [(SSUserIntentResultBuilder *)self userActivityRequiredString];
  [v3 setUserActivityRequiredString:v4];

  [v3 setType:20];
  return v3;
}

- (id)buildCommand
{
  v3 = (void *)MEMORY[0x1C1885190](self, a2);
  id v4 = [(SSResultBuilder *)self result];
  uint64_t v5 = [v4 userActivityRequiredString];
  if (v5)
  {
    objc_super v6 = (void *)v5;
  }
  else
  {
    objc_super v6 = [(SSUserIntentResultBuilder *)self userActivityRequiredString];

    if (!v6)
    {
      v8 = 0;
      v7 = 0;
      goto LABEL_8;
    }
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  if (v7)
  {
    v8 = [MEMORY[0x1E4FB4528] donationWithUUID:v7];
  }
  else
  {
    v8 = 0;
  }
LABEL_8:
  v9 = [v8 interaction];
  v10 = [v9 intent];

  if (v10)
  {
    id v18 = 0;
    v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:0 error:&v18];
    v12 = v18;
    if (v12)
    {
      v13 = SSGeneralLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(SSUserIntentResultBuilder *)(uint64_t)v12 buildCommand];
      }
    }
  }
  else
  {
    v12 = SSGeneralLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SSUserIntentResultBuilder buildCommand](v12);
    }
    v11 = 0;
  }

  v14 = objc_opt_new();
  objc_super v15 = v14;
  if (v11)
  {
    [v14 setIntentMessageData:v11];
  }
  else
  {
    v16 = [(SSUserIntentResultBuilder *)self userActivityData];
    [v15 setIntentMessageData:v16];
  }
  return v15;
}

- (id)buildThumbnail
{
  v6.receiver = self;
  v6.super_class = (Class)SSUserIntentResultBuilder;
  v3 = [(SSResultBuilder *)&v6 buildThumbnail];
  if (!v3)
  {
    v3 = objc_opt_new();
    id v4 = [(SSUserIntentResultBuilder *)self appBundleId];
    [v3 setBundleIdentifier:v4];
  }
  return v3;
}

- (id)buildDescriptions
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSResultBuilder *)self result];
  id v4 = [v3 contentTypeTree];
  if ([v4 containsObject:*MEMORY[0x1E4F300F8]])
  {
    uint64_t v5 = [(SSUserIntentResultBuilder *)self startDate];

    if (v5)
    {
      objc_super v6 = +[SSDateFormatManager shortDateTimeFormatter];
      v7 = [(SSUserIntentResultBuilder *)self startDate];
      v8 = [v6 stringFromDate:v7];

      v9 = NSString;
      v10 = +[SSDateFormatManager dateLastCalledStringFormat];
      v11 = objc_msgSend(v9, "stringWithFormat:", v10, v8);

      v12 = [MEMORY[0x1E4F9A378] textWithString:v11];
      v15[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

      goto LABEL_6;
    }
  }
  else
  {
  }
  v13 = 0;
LABEL_6:
  return v13;
}

- (BOOL)isBackgroundRunnable
{
  return self->_isBackgroundRunnable;
}

- (void)setIsBackgroundRunnable:(BOOL)a3
{
  self->_isBackgroundRunnable = a3;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)intentName
{
  return self->_intentName;
}

- (void)setIntentName:(id)a3
{
}

- (NSString)punchoutLabel
{
  return self->_punchoutLabel;
}

- (void)setPunchoutLabel:(id)a3
{
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (void)setUserActivityRequiredString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_punchoutLabel, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (void)buildCommand
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "SSUserIntentResultBuilder: eror when converting intent to data: %@", (uint8_t *)&v2, 0xCu);
}

@end