@interface TVAppBag
+ (TVAppBag)app;
- (TVAppBag)init;
- (id)BOOLeanForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)cachedArrayForKey:(id)a3;
- (id)cachedBooleanForKey:(id)a3;
- (id)cachedDictionaryForKey:(id)a3;
- (id)cachedDoubleForKey:(id)a3;
- (id)cachedIntegerForKey:(id)a3;
- (id)cachedStringForKey:(id)a3;
- (id)cachedURLForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)urlForKey:(id)a3;
- (void)prewarm;
@end

@implementation TVAppBag

- (id)cachedURLForKey:(id)a3
{
  return sub_25E7D907C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_sSo8TVAppBagC0A8ServicesE9cachedURL3for10Foundation0E0VSgSS_tF_0);
}

- (id)cachedBooleanForKey:(id)a3
{
  return sub_25E7D4B48(self, (uint64_t)a2, (uint64_t)a3, sub_25E7DAD0C);
}

+ (TVAppBag)app
{
  if (qword_26B3909A0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B3909C0;
  return (TVAppBag *)v2;
}

- (id)cachedIntegerForKey:(id)a3
{
  uint64_t v4 = sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_25E7D4094(v4, v6, sub_25E819FF8, (uint64_t)nullsub_1, (uint64_t)&unk_270B60DD8, (uint64_t)sub_25E7DFEAC, (uint64_t)&block_descriptor_22, MEMORY[0x263F8D6C8], (uint64_t)nullsub_1, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))sub_25E821574);
  if (v9) {
    id v10 = 0;
  }
  else {
    id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

- (id)arrayForKey:(id)a3
{
  uint64_t v4 = sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = _sSo8TVAppBagC0A8ServicesE5array3forSayypGSgSS_tF_0(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    char v9 = (void *)sub_25E885758();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  return v9;
}

- (id)stringForKey:(id)a3
{
  return sub_25E7D7D8C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_sSo8TVAppBagC0A8ServicesE6string3forSSSgSS_tF_0);
}

- (void)prewarm
{
  v2 = self;
  TVAppBag.prewarm()();
}

- (id)urlForKey:(id)a3
{
  return sub_25E7D907C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_sSo8TVAppBagC0A8ServicesE3url3for10Foundation3URLVSgSS_tF_0);
}

- (id)dictionaryForKey:(id)a3
{
  uint64_t v4 = sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = _sSo8TVAppBagC0A8ServicesE10dictionary3forSDys11AnyHashableVypGSgSS_tF_0(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    char v9 = (void *)sub_25E885538();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  return v9;
}

- (id)BOOLeanForKey:(id)a3
{
  return sub_25E7D4B48(self, (uint64_t)a2, (uint64_t)a3, sub_25E819AC8);
}

- (id)integerForKey:(id)a3
{
  uint64_t v4 = sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_25E819FF8(v4, v6);
  if (v9) {
    id v10 = 0;
  }
  else {
    id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

- (id)doubleForKey:(id)a3
{
  uint64_t v4 = sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_25E81A538(v4, v6);
  if (v9) {
    id v10 = 0;
  }
  else {
    id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)&v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

- (id)cachedStringForKey:(id)a3
{
  return sub_25E7D7D8C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_25E81B8A4);
}

- (id)cachedDictionaryForKey:(id)a3
{
  uint64_t v4 = (uint64_t (*)(void, void))sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_25E81C330(v4, v6, _sSo8TVAppBagC0A8ServicesE10dictionary3forSDys11AnyHashableVypGSgSS_tF_0, (uint64_t)nullsub_1, (uint64_t)&unk_270B60EC8, (uint64_t)sub_25E8222E8, (uint64_t)&block_descriptor_43, &qword_26B3909E0, (uint64_t)nullsub_1);

  swift_bridgeObjectRelease();
  if (v8)
  {
    char v9 = (void *)sub_25E885538();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  return v9;
}

- (id)cachedArrayForKey:(id)a3
{
  uint64_t v4 = (uint64_t (*)(void, void))sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_25E81C330(v4, v6, _sSo8TVAppBagC0A8ServicesE5array3forSayypGSgSS_tF_0, (uint64_t)nullsub_1, (uint64_t)&unk_270B60E78, (uint64_t)sub_25E8222C4, (uint64_t)&block_descriptor_36, &qword_26B390B30, (uint64_t)nullsub_1);

  swift_bridgeObjectRelease();
  if (v8)
  {
    char v9 = (void *)sub_25E885758();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  return v9;
}

- (id)cachedDoubleForKey:(id)a3
{
  uint64_t v4 = sub_25E8855C8();
  uint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_25E7D4094(v4, v6, sub_25E81A538, (uint64_t)nullsub_1, (uint64_t)&unk_270B60D38, (uint64_t)sub_25E822240, (uint64_t)&block_descriptor_2, MEMORY[0x263F8D538], (uint64_t)nullsub_1, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))sub_25E821BBC);
  if (v9) {
    id v10 = 0;
  }
  else {
    id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)&v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

- (TVAppBag)init
{
  result = (TVAppBag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TVAppBag_cacheStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end