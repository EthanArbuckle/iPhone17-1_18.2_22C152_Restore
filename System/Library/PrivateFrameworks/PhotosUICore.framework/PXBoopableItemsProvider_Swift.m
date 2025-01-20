@interface PXBoopableItemsProvider_Swift
- (NSArray)assets;
- (NSArray)itemProvidersForActivityItemsConfiguration;
- (PXBoopableItemsProvider_Swift)init;
- (PXMediaProvider)imagePreviewMediaProvider;
- (PXSectionedSelectionManager)selectionManager;
- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4;
- (id)activityItemsConfigurationMetadataForKey:(id)a3;
- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAssets:(id)a3;
- (void)setImagePreviewMediaProvider:(id)a3;
- (void)setSelectionManager:(id)a3;
@end

@implementation PXBoopableItemsProvider_Swift

- (PXBoopableItemsProvider_Swift)init
{
  return (PXBoopableItemsProvider_Swift *)BoopableItemsProvider.init()();
}

- (void)dealloc
{
  uint64_t v2 = qword_1E98C6A40;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1AB23576C();
  __swift_project_value_buffer(v4, (uint64_t)qword_1E98C6A48);
  v5 = sub_1AB23574C();
  os_log_type_t v6 = sub_1AB23B25C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A9AE7000, v5, v6, "-= Boop activity items configuration deinit =-", v7, 2u);
    MEMORY[0x1AD10D8E0](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for BoopableItemsProvider();
  [(PXBoopableItemsProvider_Swift *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXBoopableItemsProvider_Swift_cachedItemProvidersByAsset);
}

- (PXSectionedSelectionManager)selectionManager
{
  return (PXSectionedSelectionManager *)sub_1AA8E54EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXBoopableItemsProvider_Swift_selectionManager);
}

- (void)setSelectionManager:(id)a3
{
  id v5 = a3;
  os_log_type_t v6 = self;
  sub_1AA8E7B78();
  v7 = (void **)((char *)&v6->super.isa + OBJC_IVAR___PXBoopableItemsProvider_Swift_selectionManager);
  swift_beginAccess();
  objc_super v8 = *v7;
  uint8_t *v7 = a3;
  id v9 = v5;

  sub_1AA8E45E0();
}

- (NSArray)assets
{
}

- (void)setAssets:(id)a3
{
  sub_1A9B21070(0, (unint64_t *)&qword_1E981C730);
  unint64_t v4 = sub_1AB23AADC();
  id v5 = self;
  sub_1AA8E4BC0(v4);
  os_log_type_t v6 = (unint64_t *)((char *)v5 + OBJC_IVAR___PXBoopableItemsProvider_Swift_assets);
  swift_beginAccess();
  *os_log_type_t v6 = v4;

  swift_bridgeObjectRelease();
}

- (PXMediaProvider)imagePreviewMediaProvider
{
  return (PXMediaProvider *)sub_1AA8E54EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXBoopableItemsProvider_Swift_imagePreviewMediaProvider);
}

- (void)setImagePreviewMediaProvider:(id)a3
{
  unint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXBoopableItemsProvider_Swift_imagePreviewMediaProvider);
  swift_beginAccess();
  id v5 = *v4;
  *unint64_t v4 = a3;
  id v6 = a3;
}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  uint64_t v2 = self;
  sub_1AA8E57CC();

  sub_1A9B21070(0, &qword_1E983C1B0);
  v3 = (void *)sub_1AB23AABC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AA8E5ED0();
}

- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4
{
  void (*v5)(void *__return_ptr, id);
  id v6;
  PXBoopableItemsProvider_Swift *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void v16[3];
  uint64_t v17;
  uint64_t vars8;

  id v5 = *(void (**)(void *__return_ptr, id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0xC0);
  id v6 = a4;
  v7 = self;
  v5(v16, v6);

  objc_super v8 = v17;
  if (v17)
  {
    id v9 = __swift_project_boxed_opaque_existential_1(v16, v17);
    v10 = *(void *)(v8 - 8);
    v11 = MEMORY[0x1F4188790](v9, v9);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    v14 = (void *)sub_1AB23C58C();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  v10 = self;
  id v11 = sub_1AA8E7DA4(a3, width, height);

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5 = a4;
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    if (v5)
    {
      id v9 = (void *)v8;
      id v10 = a3;
      id v11 = self;
      sub_1AA8E6704(objc_msgSend(v9, sel_selectionSnapshot));
    }
  }
  else
  {
    sub_1AB23C1FC();
    __break(1u);
  }
}

@end