@interface NTTodayResults
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)expirationDate;
- (NSObject)assetsHoldToken;
- (NSObject)recordsHoldToken;
- (NSOrderedSet)sections;
- (NSString)sourceIdentifier;
- (NTTodayBanner)banner;
- (NTTodayResults)init;
- (NTTodayResults)initWithCoder:(id)a3;
- (NTTodayResults)initWithSourceIdentifier:(id)a3 sections:(id)a4 expirationDate:(id)a5 headlineScale:(double)a6;
- (NTTodayResults)initWithSourceIdentifier:(id)a3 sections:(id)a4 promotionCriterion:(int)a5 expirationDate:(id)a6 headlineScale:(double)a7 assetsHoldToken:(id)a8 recordsHoldToken:(id)a9 banner:(id)a10;
- (double)headlineScale;
- (id)description;
- (int)promotionCriterion;
- (unint64_t)hash;
- (unint64_t)itemCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTTodayResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTTodayResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"si"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"banner"];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sections"];

  uint64_t v11 = [v4 decodeInt32ForKey:@"promotionCriterion"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  [v4 decodeDoubleForKey:@"headlineScale"];
  double v14 = v13;

  v15 = [(NTTodayResults *)self initWithSourceIdentifier:v5 sections:v10 promotionCriterion:v11 expirationDate:v12 headlineScale:0 assetsHoldToken:0 recordsHoldToken:v14 banner:v6];
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_recordsHoldToken, 0);
  objc_storeStrong((id *)&self->_assetsHoldToken, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(NTTodayResults *)self sourceIdentifier];
  [v8 encodeObject:v4 forKey:@"si"];

  v5 = [(NTTodayResults *)self banner];
  [v8 encodeObject:v5 forKey:@"banner"];

  v6 = [(NTTodayResults *)self sections];
  [v8 encodeObject:v6 forKey:@"sections"];

  objc_msgSend(v8, "encodeInt32:forKey:", -[NTTodayResults promotionCriterion](self, "promotionCriterion"), @"promotionCriterion");
  v7 = [(NTTodayResults *)self expirationDate];
  [v8 encodeObject:v7 forKey:@"expirationDate"];

  [(NTTodayResults *)self headlineScale];
  objc_msgSend(v8, "encodeDouble:forKey:", @"headlineScale");
}

- (double)headlineScale
{
  return self->_headlineScale;
}

- (NTTodayResults)initWithSourceIdentifier:(id)a3 sections:(id)a4 expirationDate:(id)a5 headlineScale:(double)a6
{
  return [(NTTodayResults *)self initWithSourceIdentifier:a3 sections:a4 promotionCriterion:0 expirationDate:a5 headlineScale:0 assetsHoldToken:0 recordsHoldToken:a6 banner:0];
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (int)promotionCriterion
{
  return self->_promotionCriterion;
}

- (NTTodayResults)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[NTTodayResults init]";
    __int16 v9 = 2080;
    v10 = "NTTodayResults.m";
    __int16 v11 = 1024;
    int v12 = 455;
    __int16 v13 = 2114;
    double v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTTodayResults init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTTodayResults)initWithSourceIdentifier:(id)a3 sections:(id)a4 promotionCriterion:(int)a5 expirationDate:(id)a6 headlineScale:(double)a7 assetsHoldToken:(id)a8 recordsHoldToken:(id)a9 banner:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v35 = a10;
  if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:banner:]();
    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:banner:]();
  }
LABEL_6:
  if (!v19 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTodayResults initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:banner:]();
  }
  v36.receiver = self;
  v36.super_class = (Class)NTTodayResults;
  v22 = [(NTTodayResults *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v17 copy];
    id v24 = a9;
    int v25 = a5;
    id v26 = v21;
    id v27 = v20;
    v28 = (void *)v23;
    if (v23) {
      v29 = (__CFString *)v23;
    }
    else {
      v29 = @"unknown";
    }
    objc_storeStrong((id *)&v22->_sourceIdentifier, v29);

    id v20 = v27;
    id v21 = v26;
    uint64_t v30 = [v18 copy];
    sections = v22->_sections;
    v22->_sections = (NSOrderedSet *)v30;

    v22->_promotionCriterion = v25;
    uint64_t v32 = [v19 copy];
    expirationDate = v22->_expirationDate;
    v22->_expirationDate = (NSDate *)v32;

    v22->_headlineScale = a7;
    objc_storeStrong((id *)&v22->_assetsHoldToken, a8);
    objc_storeStrong((id *)&v22->_recordsHoldToken, v24);
    objc_storeStrong((id *)&v22->_banner, a10);
  }

  return v22;
}

- (unint64_t)itemCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(NTTodayResults *)self sections];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__NTTodayResults_itemCount__block_invoke;
  v5[3] = &unk_26475C5E8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __27__NTTodayResults_itemCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 items];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    uint64_t v6 = [(NTTodayResults *)self sections];
    v7 = [v5 sections];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(NTTodayResults *)self expirationDate];
      uint64_t v9 = [v5 expirationDate];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(NTTodayResults *)self sections];
  uint64_t v4 = [v3 hash];
  v5 = [(NTTodayResults *)self expirationDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x263F59420] descriptionWithObject:self];
  uint64_t v4 = [(NTTodayResults *)self sections];
  [v3 addField:@"sections" object:v4];

  v5 = [v3 descriptionString];

  return v5;
}

- (NSObject)assetsHoldToken
{
  return self->_assetsHoldToken;
}

- (NSObject)recordsHoldToken
{
  return self->_recordsHoldToken;
}

- (NTTodayBanner)banner
{
  return self->_banner;
}

- (void)initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:banner:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"expirationDate", v6, 2u);
}

- (void)initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:banner:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sections", v6, 2u);
}

- (void)initWithSourceIdentifier:sections:promotionCriterion:expirationDate:headlineScale:assetsHoldToken:recordsHoldToken:banner:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceIdentifier", v6, 2u);
}

@end