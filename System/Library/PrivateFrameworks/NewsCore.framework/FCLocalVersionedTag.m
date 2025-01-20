@interface FCLocalVersionedTag
- (FCLocalVersionedTag)init;
- (FCLocalVersionedTag)initWithDictionary:(id)a3;
- (NSString)identifier;
- (int64_t)maxVersion;
- (int64_t)minVersion;
- (void)setIdentifier:(id)a3;
- (void)setMaxVersion:(int64_t)a3;
- (void)setMinVersion:(int64_t)a3;
@end

@implementation FCLocalVersionedTag

- (FCLocalVersionedTag)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLocalVersionedTag init]";
    __int16 v9 = 2080;
    v10 = "FCLocalVersionedTag.m";
    __int16 v11 = 1024;
    int v12 = 21;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCLocalVersionedTag init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCLocalVersionedTag)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCLocalVersionedTag;
  v5 = [(FCLocalVersionedTag *)&v13 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"identifier", 0);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationStringValue(v4, @"minNewsVersion", 0);
    __int16 v9 = (void *)v8;
    if (v8) {
      uint64_t v8 = +[FCRestrictions integerRepresentationOfShortVersionString:v8];
    }
    v5->_minVersion = v8;
    v10 = FCAppConfigurationStringValue(v4, @"maxNewsVersion", 0);
    if (v10) {
      int64_t v11 = +[FCRestrictions integerRepresentationOfShortVersionString:v10];
    }
    else {
      int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_maxVersion = v11;
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(int64_t)a3
{
  self->_minVersion = a3;
}

- (int64_t)maxVersion
{
  return self->_maxVersion;
}

- (void)setMaxVersion:(int64_t)a3
{
  self->_maxVersion = a3;
}

- (void).cxx_destruct
{
}

@end