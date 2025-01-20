@interface PMDeviceProvider
+ (void)fetchListsOfSharingDevicesSeparatedByAvailability:(id)a3;
- (PMDeviceProvider)init;
@end

@implementation PMDeviceProvider

+ (void)fetchListsOfSharingDevicesSeparatedByAvailability:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0A9790);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_258D6F798();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A0ADF98;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A0AD458;
  v12[5] = v11;
  sub_258B034A4((uint64_t)v7, (uint64_t)&unk_26A0AD460, (uint64_t)v12);
  swift_release();
}

- (PMDeviceProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)PMDeviceProvider;
  return [(PMDeviceProvider *)&v3 init];
}

@end