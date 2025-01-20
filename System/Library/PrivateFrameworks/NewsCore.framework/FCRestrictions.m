@interface FCRestrictions
+ (id)sharedInstance;
+ (int64_t)integerRepresentationOfShortVersionString:(id)a3;
- (BOOL)isContentAllowedInStorefrontID:(id)a3 withAllowedStorefrontIDs:(id)a4 blockedStorefrontIDs:(id)a5;
- (BOOL)isContentBlockedInStorefrontID:(id)a3 withAllowedStorefrontIDs:(id)a4 blockedStorefrontIDs:(id)a5;
- (BOOL)isExplicitContentAllowed;
- (BOOL)isNewsVersionAllowed:(int64_t)a3;
- (BOOL)isNewsVersionAllowedWithMinNewsVersion:(int64_t)a3 maxNewsVersion:(int64_t)a4;
- (BOOL)testing;
- (FCRestrictions)init;
- (int64_t)buildVersionNumber;
- (int64_t)isExplicitContentAllowedOverride;
- (void)setBuildVersionNumber:(int64_t)a3;
- (void)setIsExplicitContentAllowedOverride:(int64_t)a3;
- (void)setTesting:(BOOL)a3;
- (void)t_startForcingExplicitContentDisallowed;
- (void)t_stopForcingExplicitContentDisallowed;
@end

@implementation FCRestrictions

- (BOOL)isNewsVersionAllowed:(int64_t)a3
{
  if (a3 < 1) {
    return 1;
  }
  if ([(FCRestrictions *)self buildVersionNumber] < 1) {
    return 1;
  }
  return [(FCRestrictions *)self buildVersionNumber] >= a3;
}

+ (id)sharedInstance
{
  if (qword_1EB5D10B8 != -1) {
    dispatch_once(&qword_1EB5D10B8, &__block_literal_global_18);
  }
  v2 = (void *)_MergedGlobals_147;
  return v2;
}

uint64_t __32__FCRestrictions_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FCRestrictions);
  uint64_t v1 = _MergedGlobals_147;
  _MergedGlobals_147 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCRestrictions)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)FCRestrictions;
  v2 = [(FCRestrictions *)&v8 init];
  if (v2)
  {
    v2->_testing = NSClassFromString(&cfstr_Xctest.isa) != 0;
    v3 = FCBundle();
    v4 = [v3 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

    uint64_t v5 = +[FCRestrictions integerRepresentationOfShortVersionString:v4];
    if (v5 <= 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)[[NSString alloc] initWithFormat:@"Build version string is missing or not valid (current value: %@)", v4];
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCRestrictions init]";
      __int16 v11 = 2080;
      v12 = "FCRestrictions.m";
      __int16 v13 = 1024;
      int v14 = 49;
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v2->_buildVersionNumber = v5;
  }
  return v2;
}

+ (int64_t)integerRepresentationOfShortVersionString:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"."];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    unint64_t v5 = v4;
    v6 = [v3 objectAtIndexedSubscript:0];
    int64_t v7 = 1000000 * [v6 integerValue];

    if (v5 != 1)
    {
      objc_super v8 = [v3 objectAtIndexedSubscript:1];
      v7 += 1000 * [v8 integerValue];

      if (v5 >= 3)
      {
        v9 = [v3 objectAtIndexedSubscript:2];
        v7 += [v9 integerValue];
      }
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isExplicitContentAllowed
{
  if ([(FCRestrictions *)self testing]
    && [(FCRestrictions *)self isExplicitContentAllowedOverride] != -1)
  {
    return [(FCRestrictions *)self isExplicitContentAllowedOverride] == 1;
  }
  uint64_t v4 = [MEMORY[0x1E4F74230] sharedConnection];
  char v5 = [v4 isExplicitContentAllowedOutAsk:0];

  return v5;
}

- (void)t_startForcingExplicitContentDisallowed
{
}

- (void)t_stopForcingExplicitContentDisallowed
{
}

- (BOOL)isNewsVersionAllowedWithMinNewsVersion:(int64_t)a3 maxNewsVersion:(int64_t)a4
{
  if ([(FCRestrictions *)self buildVersionNumber] < 1) {
    return 1;
  }
  if ([(FCRestrictions *)self buildVersionNumber] >= a3) {
    return [(FCRestrictions *)self buildVersionNumber] <= a4;
  }
  return 0;
}

- (BOOL)isContentAllowedInStorefrontID:(id)a3 withAllowedStorefrontIDs:(id)a4 blockedStorefrontIDs:(id)a5
{
  return ![(FCRestrictions *)self isContentBlockedInStorefrontID:a3 withAllowedStorefrontIDs:a4 blockedStorefrontIDs:a5];
}

- (BOOL)isContentBlockedInStorefrontID:(id)a3 withAllowedStorefrontIDs:(id)a4 blockedStorefrontIDs:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([a5 containsObject:v7])
  {
    LOBYTE(v9) = 1;
  }
  else if ([v8 count])
  {
    int v9 = [v8 containsObject:v7] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (int64_t)buildVersionNumber
{
  return self->_buildVersionNumber;
}

- (void)setBuildVersionNumber:(int64_t)a3
{
  self->_buildVersionNumber = a3;
}

- (BOOL)testing
{
  return self->_testing;
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (int64_t)isExplicitContentAllowedOverride
{
  return self->_isExplicitContentAllowedOverride;
}

- (void)setIsExplicitContentAllowedOverride:(int64_t)a3
{
  self->_isExplicitContentAllowedOverride = a3;
}

@end