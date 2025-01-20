@interface TPSAppIntentsHelper
- (TPSAppIntentsHelper)init;
- (void)fetchReturnValueFromEntityNamed:(NSString *)a3 inBundleId:(NSString *)a4 withParameters:(NSDictionary *)a5 completionHandler:(id)a6;
- (void)fetchReturnValueFromIntentNamed:(NSString *)a3 inBundleId:(NSString *)a4 withParameters:(NSDictionary *)a5 completionHandler:(id)a6;
@end

@implementation TPSAppIntentsHelper

- (void)fetchReturnValueFromIntentNamed:(NSString *)a3 inBundleId:(NSString *)a4 withParameters:(NSDictionary *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1E451BA28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE48840;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EAE48848;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_1E4513D84((uint64_t)v13, (uint64_t)&unk_1EAE48850, (uint64_t)v18);
  swift_release();
}

- (void)fetchReturnValueFromEntityNamed:(NSString *)a3 inBundleId:(NSString *)a4 withParameters:(NSDictionary *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1E451BA28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE48818;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EAE48568;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_1E4513D84((uint64_t)v13, (uint64_t)&unk_1EAE48570, (uint64_t)v18);
  swift_release();
}

- (TPSAppIntentsHelper)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSAppIntentsHelper_clientLabel);
  void *v4 = 0xD000000000000019;
  v4[1] = 0x80000001E45286D0;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___TPSAppIntentsHelper_source) = 3;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(TPSAppIntentsHelper *)&v6 init];
}

- (void).cxx_destruct
{
}

@end