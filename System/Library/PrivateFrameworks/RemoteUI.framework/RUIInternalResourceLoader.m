@interface RUIInternalResourceLoader
+ (RUIInternalResourceLoader)shared;
- (RUIInternalResourceLoader)init;
- (void)loadWithCompletionHandler:(id)a3;
@end

@implementation RUIInternalResourceLoader

- (void)loadWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26780DD18);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_214603138();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26780DD28;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26780DD38;
  v12[5] = v11;
  v13 = self;
  sub_21457746C((uint64_t)v7, (uint64_t)&unk_26780DD48, (uint64_t)v12);
  swift_release();
}

+ (RUIInternalResourceLoader)shared
{
  if (qword_267811970 != -1) {
    swift_once();
  }
  v2 = (void *)qword_267811978;
  return (RUIInternalResourceLoader *)v2;
}

- (RUIInternalResourceLoader)init
{
  return (RUIInternalResourceLoader *)InternalResourceLoader.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR___RUIInternalResourceLoader___observationRegistrar;
  uint64_t v4 = sub_2146021B8();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end