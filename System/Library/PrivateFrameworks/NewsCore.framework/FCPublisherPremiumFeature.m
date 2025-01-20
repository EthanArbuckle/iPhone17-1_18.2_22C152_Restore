@interface FCPublisherPremiumFeature
- (FCPublisherPremiumFeature)init;
- (FCPublisherPremiumFeature)initWithPersonalizationIdentifier:(id)a3;
- (FCPublisherPremiumFeature)initWithTagID:(id)a3;
@end

@implementation FCPublisherPremiumFeature

- (FCPublisherPremiumFeature)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(FCPublisherPremiumFeature *)self initWithTagID:0];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPublisherPremiumFeature init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    __int16 v11 = 1024;
    int v12 = 813;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPublisherPremiumFeature init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPublisherPremiumFeature)initWithTagID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPublisherPremiumFeature;
  id v6 = [(FCPersonalizationFeature *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (v5) {
      objc_storeStrong((id *)&v6->super._tagID, a3);
    }
    uint64_t v8 = [NSString stringWithFormat:@"%@%@%@", @"f5", @"+", v5];
    personalizationIdentifier = v7->super._personalizationIdentifier;
    v7->super._personalizationIdentifier = (NSString *)v8;
  }
  return v7;
}

- (FCPublisherPremiumFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"+"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend(v4, "substringWithRange:", v5 + v6, objc_msgSend(v4, "length") - (v5 + v6));
    self = [(FCPublisherPremiumFeature *)self initWithTagID:v8];

    v7 = self;
  }

  return v7;
}

@end