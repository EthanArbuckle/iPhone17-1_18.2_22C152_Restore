@interface EndpointStore
+ (BOOL)containsWithFilter:(id)a3;
+ (void)insertWithEndpoint:(id)a3;
+ (void)removeWithEndpoint:(id)a3;
+ (void)updateWithEndpoint:(id)a3;
- (_TtC10seserviced13EndpointStore)init;
@end

@implementation EndpointStore

- (_TtC10seserviced13EndpointStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(EndpointStore *)&v3 init];
}

+ (void)insertWithEndpoint:(id)a3
{
  id v4 = a3;
  sub_10012AEEC((uint64_t)v4, v3);
}

+ (void)updateWithEndpoint:(id)a3
{
  id v4 = a3;
  sub_10012AFDC((uint64_t)v4, v3);
}

+ (void)removeWithEndpoint:(id)a3
{
  id v4 = a3;
  sub_10012B0CC((uint64_t)v4, v3);
}

+ (BOOL)containsWithFilter:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  v6[2] = v3;
  char v4 = sub_10012ACFC((uint64_t)sub_10012AEC4, (uint64_t)v6);
  _Block_release(v3);
  return v4 & 1;
}

@end