@interface FCImageOnTopPremiumHeadlineTemplate
+ (id)debug_templateForHash:(unint64_t)a3;
- (FCImageOnTopPremiumHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5;
- (FCImageOnTopPremiumHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5 allowNil:(BOOL)a6;
@end

@implementation FCImageOnTopPremiumHeadlineTemplate

- (FCImageOnTopPremiumHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5
{
  return [(FCImageOnTopPremiumHeadlineTemplate *)self initWithJSONDictionary:a3 versionNumber:a4 URLGenerator:a5 allowNil:1];
}

- (FCImageOnTopPremiumHeadlineTemplate)initWithJSONDictionary:(id)a3 versionNumber:(int64_t)a4 URLGenerator:(id)a5 allowNil:(BOOL)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCImageOnTopPremiumHeadlineTemplate;
  v11 = [(FCHeadlineTemplate *)&v20 initWithJSONDictionary:v10 versionNumber:a4 URLGenerator:a5];
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      if (a4 == 2)
      {
        v17 = [v10 objectForKeyedSubscript:@"templateType"];
        char v18 = [v17 isEqualToString:@"Image On Top"];

        if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "type == FCHeadlineTemplateTypeImageOnTopPremium");
          *(_DWORD *)buf = 136315906;
          v22 = "-[FCImageOnTopPremiumHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:allowNil:]";
          __int16 v23 = 2080;
          v24 = "FCHeadlineTemplate.m";
          __int16 v25 = 1024;
          int v26 = 320;
          __int16 v27 = 2114;
          v28 = v15;
          v16 = MEMORY[0x1E4F14500];
          goto LABEL_14;
        }
      }
      else if (a4 == 1)
      {
        v13 = [v10 objectForKeyedSubscript:@"templateType"];
        char v14 = [v13 isEqualToString:@"Image On Top"];

        if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "type == FCHeadlineTemplateTypeImageOnTopPremium");
          *(_DWORD *)buf = 136315906;
          v22 = "-[FCImageOnTopPremiumHeadlineTemplate initWithJSONDictionary:versionNumber:URLGenerator:allowNil:]";
          __int16 v23 = 2080;
          v24 = "FCHeadlineTemplate.m";
          __int16 v25 = 1024;
          int v26 = 314;
          __int16 v27 = 2114;
          v28 = v15;
          v16 = MEMORY[0x1E4F14500];
LABEL_14:
          _os_log_error_impl(&dword_1A460D000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
    }
    else if (!a6)
    {

      v12 = 0;
    }
  }

  return v12;
}

+ (id)debug_templateForHash:(unint64_t)a3
{
  return 0;
}

@end