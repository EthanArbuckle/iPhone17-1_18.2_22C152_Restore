@interface FCPublisherVideoContentFeature
- (FCPublisherVideoContentFeature)init;
- (FCPublisherVideoContentFeature)initWithPersonalizationIdentifier:(id)a3;
- (FCPublisherVideoContentFeature)initWithPublisherTagID:(id)a3;
@end

@implementation FCPublisherVideoContentFeature

- (FCPublisherVideoContentFeature)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(FCPublisherVideoContentFeature *)self initWithPublisherTagID:&stru_1EF8299B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPublisherVideoContentFeature init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    __int16 v11 = 1024;
    int v12 = 593;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPublisherVideoContentFeature init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPublisherVideoContentFeature)initWithPublisherTagID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPublisherVideoContentFeature;
  id v6 = [(FCPersonalizationFeature *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._tagID, a3);
    uint64_t v8 = [NSString stringWithFormat:@"%@%@%@", @"f9", @"+", v5];
    personalizationIdentifier = v7->super._personalizationIdentifier;
    v7->super._personalizationIdentifier = (NSString *)v8;
  }
  return v7;
}

- (FCPublisherVideoContentFeature)initWithPersonalizationIdentifier:(id)a3
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
    self = [(FCPublisherVideoContentFeature *)self initWithPublisherTagID:v8];

    v7 = self;
  }

  return v7;
}

@end