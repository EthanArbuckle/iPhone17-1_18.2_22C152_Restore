@interface PFDispatchingFairPlayValidationManaging
+ (id)receiveOn:(id)a3 manager:(id)a4;
- (PFDispatchingFairPlayValidationManaging)init;
- (void)validateDownloadedEpisodesWithCompletion:(id)a3;
@end

@implementation PFDispatchingFairPlayValidationManaging

+ (id)receiveOn:(id)a3 manager:(id)a4
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v7 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v7[OBJC_IVAR___PFDispatchingFairPlayValidationManaging_wrappedInstance] = a4;
  *(void *)&v7[OBJC_IVAR___PFDispatchingFairPlayValidationManaging_responseQueue] = a3;
  v11.receiver = v7;
  v11.super_class = ObjCClassMetadata;
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  return v9;
}

- (void)validateDownloadedEpisodesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1ACA50AB0;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  id v8 = self;
  DispatchingFairPlayValidationManaging.validateDownloadedEpisodes(completion:)((uint64_t)v7, v6);
  sub_1ACA76F34((uint64_t)v7);
}

- (PFDispatchingFairPlayValidationManaging)init
{
  result = (PFDispatchingFairPlayValidationManaging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDispatchingFairPlayValidationManaging_responseQueue);
}

@end