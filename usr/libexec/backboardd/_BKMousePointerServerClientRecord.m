@interface _BKMousePointerServerClientRecord
- (BOOL)hasEntitlement:(id)a3;
- (NSMutableDictionary)perDisplayUUIDInfo;
- (NSSet)entitlements;
- (_BKMousePointerServerClientRecord)init;
- (id)infoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4;
- (int)pid;
- (void)setEntitlements:(id)a3;
- (void)setPID:(int)a3;
- (void)setPerDisplayUUIDInfo:(id)a3;
@end

@implementation _BKMousePointerServerClientRecord

- (_BKMousePointerServerClientRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)_BKMousePointerServerClientRecord;
  v2 = [(_BKMousePointerServerClientRecord *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    perDisplayUUIDInfo = v2->_perDisplayUUIDInfo;
    v2->_perDisplayUUIDInfo = v3;
  }
  return v2;
}

- (void)setPID:(int)a3
{
  self->_pid = a3;
}

- (void)setEntitlements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);

  objc_storeStrong((id *)&self->_perDisplayUUIDInfo, 0);
}

- (int)pid
{
  return self->_pid;
}

- (NSSet)entitlements
{
  return self->_entitlements;
}

- (void)setPerDisplayUUIDInfo:(id)a3
{
}

- (NSMutableDictionary)perDisplayUUIDInfo
{
  return self->_perDisplayUUIDInfo;
}

- (BOOL)hasEntitlement:(id)a3
{
  return [(NSSet *)self->_entitlements containsObject:a3];
}

- (id)infoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_perDisplayUUIDInfo objectForKeyedSubscript:v6];
  v8 = (_BKMousePointerServerClientPerDisplay *)v7;
  if (v4 && !v7)
  {
    v8 = objc_alloc_init(_BKMousePointerServerClientPerDisplay);
    [(NSMutableDictionary *)self->_perDisplayUUIDInfo setObject:v8 forKeyedSubscript:v6];
  }

  return v8;
}

@end