@interface WebDatabaseQuotaManager
- (WebDatabaseQuotaManager)initWithOrigin:(id)a3;
- (id)origin;
- (unint64_t)quota;
- (unint64_t)usage;
- (void)setQuota:(unint64_t)a3;
@end

@implementation WebDatabaseQuotaManager

- (WebDatabaseQuotaManager)initWithOrigin:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WebDatabaseQuotaManager;
    result = [(WebDatabaseQuotaManager *)&v5 init];
    if (result) {
      result->_origin = (WebSecurityOrigin *)a3;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (id)origin
{
  return self->_origin;
}

- (unint64_t)usage
{
  uint64_t v3 = WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  v4 = [(WebSecurityOrigin *)self->_origin _core] + 8;
  return MEMORY[0x1F416E090](v3, v4);
}

- (unint64_t)quota
{
  uint64_t v3 = WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  v4 = [(WebSecurityOrigin *)self->_origin _core] + 8;
  return MEMORY[0x1F416E088](v3, v4);
}

- (void)setQuota:(unint64_t)a3
{
  uint64_t v5 = WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  v6 = [(WebSecurityOrigin *)self->_origin _core] + 8;
  MEMORY[0x1F416E0A0](v5, v6, a3);
}

@end