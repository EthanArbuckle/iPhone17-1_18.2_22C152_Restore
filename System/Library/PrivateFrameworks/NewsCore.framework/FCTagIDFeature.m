@interface FCTagIDFeature
- (BOOL)shouldBeBoosted;
- (FCTagIDFeature)init;
- (FCTagIDFeature)initWithPersonalizationIdentifier:(id)a3;
- (FCTagIDFeature)initWithTagID:(id)a3;
- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4;
@end

@implementation FCTagIDFeature

- (FCTagIDFeature)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(FCTagIDFeature *)self initWithTagID:&stru_1EF8299B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagIDFeature init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    __int16 v11 = 1024;
    int v12 = 700;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTagIDFeature init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCTagIDFeature)initWithTagID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCTagIDFeature;
  id v6 = [(FCPersonalizationFeature *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._tagID, a3);
    uint64_t v8 = [NSString stringWithFormat:@"%@%@%@", @"f3", @"+", v5];
    personalizationIdentifier = v7->super._personalizationIdentifier;
    v7->super._personalizationIdentifier = (NSString *)v8;
  }
  return v7;
}

- (FCTagIDFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  uint64_t v6 = [@"f3" length];
  if (v5 <= [@"+" length] + v6)
  {
    uint64_t v8 = 0;
  }
  else
  {
    v7 = [v4 substringFromIndex:objc_msgSend(@"+", "length") + objc_msgSend(@"f3", "length")];
    self = [(FCTagIDFeature *)self initWithTagID:v7];

    uint64_t v8 = self;
  }

  return v8;
}

- (BOOL)shouldBeBoosted
{
  return 1;
}

- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FCPersonalizationFeature *)self tagID];
  int v9 = [v8 isEqualToString:v7];

  double v10 = 1.0;
  if (v9)
  {
    [v6 publisherAggregateWeight];
    double v10 = v11;
  }

  return v10;
}

@end