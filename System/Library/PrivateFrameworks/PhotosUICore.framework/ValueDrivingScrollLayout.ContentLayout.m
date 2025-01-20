@interface ValueDrivingScrollLayout.ContentLayout
- (NSIndexSet)axSpriteIndexes;
- (_TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout)init;
- (void)referenceSizeDidChange;
- (void)update;
- (void)updateContent;
- (void)visibleRectDidChange;
@end

@implementation ValueDrivingScrollLayout.ContentLayout

- (_TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout)init
{
  return (_TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout *)sub_1AA36AA80();
}

- (void)update
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout_updater);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_updateIfNeeded);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for ValueDrivingScrollLayout.ContentLayout();
    [(PXGLayout *)&v4 update];
  }
  else
  {
    __break(1u);
  }
}

- (void)referenceSizeDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ValueDrivingScrollLayout.ContentLayout();
  v2 = (char *)v4.receiver;
  [(PXGLayout *)&v4 referenceSizeDidChange];
  v3 = *(void **)&v2[OBJC_IVAR____TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout_updater];
  if (v3)
  {
    objc_msgSend(v3, sel_setNeedsUpdateOf_, sel_updateContent, v4.receiver, v4.super_class);
  }
  else
  {
    __break(1u);
  }
}

- (void)visibleRectDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ValueDrivingScrollLayout.ContentLayout();
  [(PXGLayout *)&v2 visibleRectDidChange];
}

- (NSIndexSet)axSpriteIndexes
{
  uint64_t v2 = sub_1AB230A8C();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB230A7C();
  v7 = (void *)sub_1AB2309CC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (NSIndexSet *)v7;
}

- (void)updateContent
{
  uint64_t v2 = self;
  PXGLayout.configureSprites(_:)((void (*)(void))sub_1AA36B068);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore24ValueDrivingScrollLayoutP33_47CE02453974CF9C45460F69EF777CFA13ContentLayout_updater));
}

@end