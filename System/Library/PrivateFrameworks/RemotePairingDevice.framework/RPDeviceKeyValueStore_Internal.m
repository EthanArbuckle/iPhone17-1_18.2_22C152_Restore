@interface RPDeviceKeyValueStore_Internal
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (RPDeviceKeyValueStore_Internal)init;
- (id)getKeyValuePairsWithDomain:(id)a3;
- (id)getValueWithDomain:(id)a3 key:(id)a4;
- (id)isValueSensitiveWithDomain:(id)a3 key:(id)a4;
@end

@implementation RPDeviceKeyValueStore_Internal

- (RPDeviceKeyValueStore_Internal)init
{
  return (RPDeviceKeyValueStore_Internal *)DeviceKeyValueStore.init()();
}

- (NSString)description
{
  v2 = self;
  sub_1D75B4F04();

  v3 = (void *)sub_1D7660AE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)getValueWithDomain:(id)a3 key:(id)a4
{
  return sub_1D75B5BD0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1D75B54AC);
}

- (id)getKeyValuePairsWithDomain:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D7660B10();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  uint64_t v8 = sub_1D75B55D4(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_1D7660A10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)isValueSensitiveWithDomain:(id)a3 key:(id)a4
{
  return sub_1D75B5BD0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))sub_1D75B5A98);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1D7661070();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1D75B697C((uint64_t)v8);

  sub_1D758C650((uint64_t)v8, &qword_1EBDEC4D0);
  return v6 & 1;
}

- (void).cxx_destruct
{
}

@end