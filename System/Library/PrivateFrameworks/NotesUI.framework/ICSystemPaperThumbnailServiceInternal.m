@interface ICSystemPaperThumbnailServiceInternal
+ (ICSystemPaperThumbnailServiceInternal)sharedService;
- (ICSystemPaperThumbnailServiceInternal)init;
- (ICThumbnailService)thumbnailService;
- (UITraitCollection)traitCollection;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateForNote:(id)a3;
- (void)invalidateForNoteIDs:(id)a3;
- (void)invalidateForNotes:(id)a3;
- (void)observe;
- (void)setTraitCollection:(id)a3;
- (void)updateIfNeededForNote:(id)a3 completion:(id)a4;
- (void)updateIfNeededForNoteIDs:(id)a3 completion:(id)a4;
- (void)updateIfNeededForNotes:(id)a3 completion:(id)a4;
- (void)updateIfNeededWithCompletion:(id)a3;
- (void)updateRecentSystemPaperNote;
@end

@implementation ICSystemPaperThumbnailServiceInternal

+ (ICSystemPaperThumbnailServiceInternal)sharedService
{
  if (qword_1EBBB4870 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBBB4470;
  return (ICSystemPaperThumbnailServiceInternal *)v2;
}

- (ICThumbnailService)thumbnailService
{
  return (ICThumbnailService *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService));
}

- (UITraitCollection)traitCollection
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
  swift_beginAccess();
  return (UITraitCollection *)*v2;
}

- (void)setTraitCollection:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  SystemPaperThumbnailService.cancel()();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(ICSystemPaperThumbnailServiceInternal *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidUpdateObject, &qword_1EBBB4690);
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___cacheDidInvalidateObject, &qword_1EBBB4548);
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didUpdateSystemPaperNotes, &qword_1EBBB4610);
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidDeleteObject, &qword_1EBBB4690);
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didDeleteSystemPaperNotes, &qword_1E9B4CC70);
  sub_1B0A2E21C((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___accessibilityAppearanceDidChange, &qword_1EBBB45F8);
}

- (void)updateIfNeededForNote:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_1B0B5AF14;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(a3, (uint64_t)v6, v7);
  sub_1B0A2508C((uint64_t)v6);
}

- (void)updateIfNeededForNotes:(id)a3 completion:(id)a4
{
  objc_super v5 = _Block_copy(a4);
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
  sub_1B0A7AB50((unint64_t *)&qword_1EBBB49D8, (unint64_t *)&qword_1EBBB49D0);
  uint64_t v6 = sub_1B0B8273C();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    id v8 = sub_1B0B5AF14;
  }
  else
  {
    id v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(v6, (uint64_t)v8, v7);
  sub_1B0A2508C((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)updateIfNeededForNoteIDs:(id)a3 completion:(id)a4
{
  objc_super v5 = _Block_copy(a4);
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB4960);
  sub_1B0A7AB50((unint64_t *)&qword_1EBBB5098, (unint64_t *)&qword_1EBBB4960);
  uint64_t v6 = sub_1B0B8273C();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    id v8 = sub_1B0B5AF14;
  }
  else
  {
    id v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(v6, (uint64_t)v8, v7);
  sub_1B0A2508C((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)updateIfNeededWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1B0B5AC50;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService);
  uint64_t v7 = self;
  id v8 = objc_msgSend(v6, sel_workerContext);
  v9 = (void *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v4;
  v9[4] = v5;
  v12[4] = sub_1B0B5B01C;
  v12[5] = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1B0A965E8;
  v12[3] = &block_descriptor_101;
  v10 = _Block_copy(v12);
  v11 = v7;
  sub_1B0A46460((uint64_t)v4);
  swift_release();
  objc_msgSend(v8, sel_performBlock_, v10);
  _Block_release(v10);

  sub_1B0A2508C((uint64_t)v4);
}

- (void)updateRecentSystemPaperNote
{
}

- (void)invalidateForNote:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  SystemPaperThumbnailService.invalidate(for:)(a3);
}

- (void)invalidateForNotes:(id)a3
{
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB49D0);
  sub_1B0A7AB50((unint64_t *)&qword_1EBBB49D8, (unint64_t *)&qword_1EBBB49D0);
  uint64_t v4 = sub_1B0B8273C();
  id v5 = self;
  sub_1B0B51CC4(v4, (char *)v5);

  swift_bridgeObjectRelease();
}

- (void)invalidateForNoteIDs:(id)a3
{
  sub_1B0A2E124(0, (unint64_t *)&qword_1EBBB4960);
  sub_1B0A7AB50((unint64_t *)&qword_1EBBB5098, (unint64_t *)&qword_1EBBB4960);
  uint64_t v4 = sub_1B0B8273C();
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService);
  uint64_t v6 = self;
  id v7 = objc_msgSend(v5, sel_workerContext);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v6;
  v11[4] = sub_1B0B5AF0C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B0A965E8;
  v11[3] = &block_descriptor_87;
  v9 = _Block_copy(v11);
  v10 = v6;
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v7, sel_performBlock_, v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)invalidate
{
}

- (void)observe
{
  v2 = self;
  SystemPaperThumbnailService.observe()();
}

- (void)cancel
{
  v2 = self;
  SystemPaperThumbnailService.cancel()();
}

- (ICSystemPaperThumbnailServiceInternal)init
{
  result = (ICSystemPaperThumbnailServiceInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end