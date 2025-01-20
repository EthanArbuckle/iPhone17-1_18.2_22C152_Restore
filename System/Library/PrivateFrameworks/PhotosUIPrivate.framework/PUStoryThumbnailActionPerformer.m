@interface PUStoryThumbnailActionPerformer
- (PUStoryThumbnailActionPerformer)init;
- (PUStoryThumbnailActionPerformer)initWithModel:(id)a3;
- (id)presentDetailsViewAction;
- (id)presentPlayerAction;
- (void)deleteMemory;
- (void)featureLess:(id)a3;
- (void)fileRadar;
- (void)presentShareSheet;
- (void)presentTitleEditor;
- (void)setFavorite:(BOOL)a3 completionHandler:(id)a4;
- (void)setPresentDetailsViewAction:(id)a3;
- (void)setPresentPlayerAction:(id)a3;
- (void)showVisualDiagnostics;
@end

@implementation PUStoryThumbnailActionPerformer

- (PUStoryThumbnailActionPerformer)initWithModel:(id)a3
{
  return (PUStoryThumbnailActionPerformer *)StoryThumbnailActionPerformer.init(model:)(a3);
}

- (id)presentPlayerAction
{
  return sub_1AEB79490((uint64_t)self, (uint64_t)a2, sub_1AEB79268, (uint64_t)&block_descriptor_24);
}

- (void)setPresentPlayerAction:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AEB7B5A0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1AEB7931C((uint64_t)v4, v5);
}

- (id)presentDetailsViewAction
{
  return sub_1AEB79490((uint64_t)self, (uint64_t)a2, sub_1AEB79538, (uint64_t)&block_descriptor_51);
}

- (void)setPresentDetailsViewAction:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AEB7B3C4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1AEB79644((uint64_t)v4, v5);
}

- (void)setFavorite:(BOOL)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1AEB7B3B8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1AEB797F4(a3, (uint64_t)v6, v7);
  sub_1AEA1FDC4((uint64_t)v6);
}

- (void)presentShareSheet
{
  v2 = self;
  sub_1AEB79AF4();
}

- (void)presentTitleEditor
{
  v2 = self;
  sub_1AEB79D74();
}

- (void)deleteMemory
{
  v2 = self;
  sub_1AEB79DC8();
}

- (void)featureLess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AEB79E64();
}

- (void)fileRadar
{
  v2 = self;
  sub_1AEB79F44();
}

- (void)showVisualDiagnostics
{
  v2 = self;
  sub_1AEB7A63C();
}

- (PUStoryThumbnailActionPerformer)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  sub_1AEB7B3E4((uint64_t)self + OBJC_IVAR___PUStoryThumbnailActionPerformer_currentAssetCollection);
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PUStoryThumbnailActionPerformer_presentPlayerAction));
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___PUStoryThumbnailActionPerformer_presentDetailsViewAction));
  swift_release();
}

@end