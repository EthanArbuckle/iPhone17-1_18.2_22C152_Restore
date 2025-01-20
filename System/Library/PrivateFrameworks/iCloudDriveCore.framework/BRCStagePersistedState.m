@interface BRCStagePersistedState
+ (BOOL)supportsSecureCoding;
+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4;
- (BRCStagePersistedState)init;
- (BRCStagePersistedState)initWithCoder:(id)a3;
- (BRCStagePersistedState)initWithLatestGCStartTime:(int64_t)a3;
- (id)description;
- (int64_t)timeSinceLatestGCStartTime;
- (void)encodeWithCoder:(id)a3;
- (void)timeSinceLatestGCStartTime;
@end

@implementation BRCStagePersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  v4 = [a3 clientState];
  v5 = [v4 objectForKeyedSubscript:@"stage"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = objc_opt_new();

    [v4 setObject:v7 forKeyedSubscript:@"stage"];
    v5 = (void *)v7;
  }

  return v5;
}

- (BRCStagePersistedState)init
{
  time_t v3 = time(0);
  return [(BRCStagePersistedState *)self initWithLatestGCStartTime:v3];
}

- (BRCStagePersistedState)initWithLatestGCStartTime:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCStagePersistedState;
  result = [(BRCStagePersistedState *)&v5 init];
  if (result) {
    result->_latestGCStartTime = a3;
  }
  return result;
}

- (int64_t)timeSinceLatestGCStartTime
{
  uint64_t v2 = time(0) - self->_latestGCStartTime;
  if (v2 < 0)
  {
    time_t v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      -[BRCStagePersistedState timeSinceLatestGCStartTime](v2);
    }

    return 0;
  }
  return v2;
}

- (BRCStagePersistedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCStagePersistedState;
  objc_super v5 = [(BRCPersistedState *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_latestGCStartTime = [v4 decodeInt64ForKey:@"gc"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCStagePersistedState;
  id v4 = a3;
  [(BRCPersistedState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_latestGCStartTime, @"gc", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"gc:%ld", self->_latestGCStartTime);
}

- (void)timeSinceLatestGCStartTime
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = -a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] latest GC started %lld seconds in the future%@", (void)v3, DWORD2(v3));
}

@end