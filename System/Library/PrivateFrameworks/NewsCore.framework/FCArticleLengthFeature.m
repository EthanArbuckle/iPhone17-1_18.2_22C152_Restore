@interface FCArticleLengthFeature
+ (id)longLengthFeature;
+ (id)mediumLengthFeature;
+ (id)shortLengthFeature;
- (FCArticleLengthFeature)init;
- (FCArticleLengthFeature)initWithLengthIdentifier:(id)a3;
- (FCArticleLengthFeature)initWithPersonalizationIdentifier:(id)a3;
- (NSString)lengthID;
- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4;
- (void)setLengthID:(id)a3;
@end

@implementation FCArticleLengthFeature

+ (id)shortLengthFeature
{
  if (qword_1EB5D0688 != -1) {
    dispatch_once(&qword_1EB5D0688, &__block_literal_global_173);
  }
  v2 = (void *)qword_1EB5D0680;
  return v2;
}

uint64_t __44__FCArticleLengthFeature_shortLengthFeature__block_invoke()
{
  v0 = [[FCArticleLengthFeature alloc] initWithLengthIdentifier:@"s"];
  uint64_t v1 = qword_1EB5D0680;
  qword_1EB5D0680 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)mediumLengthFeature
{
  if (qword_1EB5D0698 != -1) {
    dispatch_once(&qword_1EB5D0698, &__block_literal_global_178);
  }
  v2 = (void *)qword_1EB5D0690;
  return v2;
}

uint64_t __45__FCArticleLengthFeature_mediumLengthFeature__block_invoke()
{
  v0 = [[FCArticleLengthFeature alloc] initWithLengthIdentifier:@"m"];
  uint64_t v1 = qword_1EB5D0690;
  qword_1EB5D0690 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)longLengthFeature
{
  if (qword_1EB5D06A8 != -1) {
    dispatch_once(&qword_1EB5D06A8, &__block_literal_global_183);
  }
  v2 = (void *)qword_1EB5D06A0;
  return v2;
}

uint64_t __43__FCArticleLengthFeature_longLengthFeature__block_invoke()
{
  v0 = [[FCArticleLengthFeature alloc] initWithLengthIdentifier:@"l"];
  uint64_t v1 = qword_1EB5D06A0;
  qword_1EB5D06A0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCArticleLengthFeature)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(FCArticleLengthFeature *)self initWithLengthIdentifier:&stru_1EF8299B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleLengthFeature init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    __int16 v11 = 1024;
    int v12 = 506;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCArticleLengthFeature init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCArticleLengthFeature)initWithLengthIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCArticleLengthFeature;
  v5 = [(FCPersonalizationFeature *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    [(FCArticleLengthFeature *)v5 setLengthID:v4];
    uint64_t v7 = [NSString stringWithFormat:@"%@%@%@", @"fa0", @"+", v4];
    personalizationIdentifier = v6->super._personalizationIdentifier;
    v6->super._personalizationIdentifier = (NSString *)v7;
  }
  return v6;
}

- (FCArticleLengthFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"+"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "substringWithRange:", v5 + v6, objc_msgSend(v4, "length") - (v5 + v6));
    self = [(FCArticleLengthFeature *)self initWithLengthIdentifier:v8];

    uint64_t v7 = self;
  }

  return v7;
}

- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4
{
  [a3 articleLengthAggregateWeight];
  return result;
}

- (NSString)lengthID
{
  return self->_lengthID;
}

- (void)setLengthID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end