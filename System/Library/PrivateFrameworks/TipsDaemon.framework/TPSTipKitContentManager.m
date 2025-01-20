@interface TPSTipKitContentManager
+ (void)updateContentWithMeta:(NSDictionary *)a3 documents:(NSDictionary *)a4 clientConditions:(NSSet *)a5 completionHandler:(id)a6;
- (TPSTipKitContentManager)init;
@end

@implementation TPSTipKitContentManager

+ (void)updateContentWithMeta:(NSDictionary *)a3 documents:(NSDictionary *)a4 clientConditions:(NSSet *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFF5898);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  uint64_t v16 = sub_1E451BA28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EAE48898;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EAE48568;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_1E4513D84((uint64_t)v13, (uint64_t)&unk_1EAE48570, (uint64_t)v18);
  swift_release();
}

- (TPSTipKitContentManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TPSTipKitContentManager *)&v3 init];
}

@end