@interface QuickLookProvider
- (BOOL)previewController:(id)a3 canShareItem:(id)a4;
- (_TtC13iCloudQuotaUI17QuickLookProvider)init;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (void)previewControllerDidDismiss:(id)a3;
@end

@implementation QuickLookProvider

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x60);
  id v6 = a3;
  v7 = self;
  v8 = (void *)v5();
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F16090]), sel_initWithFPItem_, v8);

  return v9;
}

- (BOOL)previewController:(id)a3 canShareItem:(id)a4
{
  return 0;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 0;
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22C995DBC();
}

- (_TtC13iCloudQuotaUI17QuickLookProvider)init
{
  result = (_TtC13iCloudQuotaUI17QuickLookProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI17QuickLookProvider_didUpdateItem);
  sub_22C8CD4A0(v3);
}

@end