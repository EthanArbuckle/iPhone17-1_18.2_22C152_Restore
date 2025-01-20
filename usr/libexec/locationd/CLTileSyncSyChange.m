@interface CLTileSyncSyChange
- (NSDictionary)properties;
- (NSString)sequencer;
- (NSString)syncKey;
- (int64_t)changeType;
- (void)dealloc;
- (void)setChangeType:(int64_t)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSyncKey:(id)a3;
@end

@implementation CLTileSyncSyChange

- (void)setObjectIdentifier:(id)a3
{
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 1;
}

- (void)setChangeType:(int64_t)a3
{
  if (a3 != 1)
  {
    if (qword_1024193B0 != -1) {
      dispatch_once(&qword_1024193B0, &stru_1022B2480);
    }
    v4 = qword_1024193B8;
    if (os_log_type_enabled((os_log_t)qword_1024193B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      int64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "@GtsSync, Unexpected change type, %{public}ld, set, #CloneMe", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193B0 != -1) {
        dispatch_once(&qword_1024193B0, &stru_1022B2480);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileSyncSyChange setChangeType:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLTileSyncSyChange;
  [(CLTileSyncSyChange *)&v3 dealloc];
}

- (NSString)syncKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSyncKey:(id)a3
{
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProperties:(id)a3
{
}

@end