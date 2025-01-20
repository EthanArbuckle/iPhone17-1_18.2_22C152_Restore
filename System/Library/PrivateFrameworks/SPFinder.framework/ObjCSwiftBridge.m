@interface ObjCSwiftBridge
+ (void)bootstrapWithContext:(NSString *)a3 completionHandler:(id)a4;
- (_TtC8SPFinder15ObjCSwiftBridge)init;
@end

@implementation ObjCSwiftBridge

+ (void)bootstrapWithContext:(NSString *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F47AB8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  uint64_t v11 = sub_2211ED040();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267F47AC8;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267F47AD8;
  v13[5] = v12;
  v14 = a3;
  sub_2211EC454((uint64_t)v8, (uint64_t)&unk_267F47AE8, (uint64_t)v13);
  swift_release();
}

- (_TtC8SPFinder15ObjCSwiftBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return [(ObjCSwiftBridge *)&v3 init];
}

@end