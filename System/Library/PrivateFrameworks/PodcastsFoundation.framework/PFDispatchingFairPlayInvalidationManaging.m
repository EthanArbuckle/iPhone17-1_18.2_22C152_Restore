@interface PFDispatchingFairPlayInvalidationManaging
+ (id)invalidationManager:(id)a3 receivingCallbacksOnQueue:(id)a4;
- (PFDispatchingFairPlayInvalidationManaging)init;
- (id)removeKeyFor:(id)a3;
- (void)invalidateFairPlayKeyFor:(int64_t)a3 completion:(id)a4;
- (void)markAllFairPlayKeysForInvalidationWithShouldRemove:(BOOL)a3 completion:(id)a4;
- (void)markKeyForInvalidationAt:(id)a3 shouldRemove:(BOOL)a4;
- (void)removalAllFairPlayKeysWithCompletion:(id)a3;
- (void)removeKeyFor:(int64_t)a3 completion:(id)a4;
@end

@implementation PFDispatchingFairPlayInvalidationManaging

+ (id)invalidationManager:(id)a3 receivingCallbacksOnQueue:(id)a4
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v7 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v7[OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_wrappedInstance] = a3;
  *(void *)&v7[OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_responseQueue] = a4;
  v11.receiver = v7;
  v11.super_class = ObjCClassMetadata;
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  return v9;
}

- (void)invalidateFairPlayKeyFor:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  DispatchingFairPlayInvalidationManaging.invalidateFairPlayKey(for:completion:)(a3, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)markKeyForInvalidationAt:(id)a3 shouldRemove:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = sub_1ACE74F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE74E98();
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_wrappedInstance);
  objc_super v11 = self;
  v12 = (void *)sub_1ACE74E18();
  objc_msgSend(v10, sel_markKeyForInvalidationAt_shouldRemove_, v12, v4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)markAllFairPlayKeysForInvalidationWithShouldRemove:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1ACA83FF0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  DispatchingFairPlayInvalidationManaging.markAllFairPlayKeysForInvalidation(shouldRemove:completion:)(a3, (uint64_t)v6, v7);
  sub_1ACA76F34((uint64_t)v6);
}

- (void)removeKeyFor:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  DispatchingFairPlayInvalidationManaging.removeKey(for:completion:)(a3, (uint64_t)sub_1ACA83FF0, v7);

  swift_release();
}

- (id)removeKeyFor:(id)a3
{
  BOOL v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDispatchingFairPlayInvalidationManaging_wrappedInstance);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = objc_msgSend(v4, sel_removeKeyFor_, v5);

  if (v7)
  {
    uint64_t v8 = (void *)sub_1ACE74D68();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (void)removalAllFairPlayKeysWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_1ACA3A598;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  DispatchingFairPlayInvalidationManaging.removalAllFairPlayKeys(completion:)((uint64_t)v7, v6);
  sub_1ACA76F34((uint64_t)v7);
}

- (PFDispatchingFairPlayInvalidationManaging)init
{
  result = (PFDispatchingFairPlayInvalidationManaging *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end