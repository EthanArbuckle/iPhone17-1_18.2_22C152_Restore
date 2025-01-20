@interface SFBrowsingAssistantCollection
- (BOOL)canBecomeFirstResponder;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (SFBrowsingAssistantCollection)initWithCoder:(id)a3;
- (SFBrowsingAssistantCollection)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (void)cardItemDidUpdate:(id)a3;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)listCellDidDeleteCell:(id)a3;
- (void)listCellDidInsertCell:(id)a3;
- (void)menuItemDidUpdate:(id)a3;
- (void)perSiteSettingDidUpdate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SFBrowsingAssistantCollection

- (void)listCellDidDeleteCell:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C358FD4((uint64_t)v4);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_18C6F8478();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_18C6F9848();
  uint64_t v15 = v14;
  sub_18C6F8438();
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  sub_18C57B2FC(v13, v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (SFBrowsingAssistantCollection)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C57A294();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18C4594D8();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_18C4587F0();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_18C5763B8(a3, a4);
}

- (SFBrowsingAssistantCollection)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (SFBrowsingAssistantCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18C57B508((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection_dataSource);
  sub_18C57B508((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection_delegate);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___listCellRegistration, &qword_1E9177B10);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___popUpCellRegistration, &qword_1E9177B08);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___switchCellRegistration, (uint64_t *)&unk_1E9177AF8);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___consentCardCellRegistration, &qword_1E9177AF0);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___entityCardCellRegistration, &qword_1E9177AE8);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___listenToPageCardCellRegistration, &qword_1E9177AE0);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___readerCardCellRegistration, &qword_1E9177AD8);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___readerOptionsCardCellRegistration, &qword_1E9177AD0);
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sectionHeaderRegistration, &qword_1E9177AC0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection_globalHeaderFooter));
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___globalHeaderFooterRegistration, &qword_1E9177AB8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___collectionDataSource));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingListCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingPopUpCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingSwitchCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingConsentCardCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingListenToPageCardCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingReaderCardCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingReaderOptionsCardCell));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___SFBrowsingAssistantCollection____lazy_storage___sizingHeader);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_18C6F8478();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8438();
  id v10 = a3;
  uint64_t v11 = self;
  v12 = (void *)sub_18C6F8418();
  unsigned __int8 v13 = [(SFBrowsingAssistantCollection *)v11 collectionView:v10 canPerformPrimaryActionForItemAtIndexPath:v12];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_18C6F8478();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8438();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_18C578114(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_18C6F8478();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8438();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_18C6F8478();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8438();
  id v10 = a3;
  uint64_t v11 = self;
  sub_18C5783E0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  v26 = self;
  uint64_t v7 = sub_18C6F8478();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v25 - v12;
  MEMORY[0x1F4188790](v14);
  id v16 = (char *)&v25 - v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v25 - v18;
  sub_18C6F8438();
  sub_18C6F8438();
  sub_18C6F8438();
  id v20 = a3;
  v21 = v26;
  sub_18C578730((uint64_t)v16, (uint64_t)v10, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23 = (void *)sub_18C6F8418();
  v22(v19, v7);

  return v23;
}

- (void)menuItemDidUpdate:(id)a3
{
}

- (void)cardItemDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18C36F2E4(v4);
}

- (void)perSiteSettingDidUpdate:(id)a3
{
}

- (void)listCellDidInsertCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_18C578EF4((uint64_t)v4);
}

@end