@interface MFUIDSet
- (MFUIDSet)init;
- (MFUIDSet)initWithUIDs:(id)a3;
- (MFUIDSet)initWithWrapper:(id)a3;
- (NSArray)uids;
- (int64_t)count;
@end

@implementation MFUIDSet

- (void).cxx_destruct
{
}

- (NSArray)uids
{
  swift_getObjectType();
  v3 = self;
  sub_1A837317C();

  sub_1A80CB84C();
  id v6 = (id)sub_1A8A76C58();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (int64_t)count
{
  swift_getObjectType();
  v3 = self;
  int64_t v6 = sub_1A8373354();

  return v6;
}

- (MFUIDSet)init
{
  return (MFUIDSet *)sub_1A8373404();
}

- (MFUIDSet)initWithWrapper:(id)a3
{
  swift_getObjectType();
  id v3 = a3;
  return (MFUIDSet *)sub_1A8373548(a3);
}

- (MFUIDSet)initWithUIDs:(id)a3
{
  swift_getObjectType();
  id v3 = a3;
  sub_1A80CB84C();
  uint64_t v4 = sub_1A8A76C68();
  v7 = (MFUIDSet *)sub_1A8373704(v4);

  return v7;
}

@end