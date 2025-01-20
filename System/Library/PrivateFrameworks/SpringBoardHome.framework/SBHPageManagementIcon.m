@interface SBHPageManagementIcon
- (BOOL)canBeAddedToMultiItemDrag;
- (BOOL)canBeAddedToSubfolder;
- (BOOL)canBeReceivedByIcon;
- (BOOL)canReceiveGrabbedIcon;
- (SBHPageManagementIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4;
- (SBHPageManagementIcon)initWithListModel:(id)a3;
- (SBIconListModel)listModel;
@end

@implementation SBHPageManagementIcon

- (SBIconListModel)listModel
{
  return (SBIconListModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR___SBHPageManagementIcon_listModel));
}

- (SBHPageManagementIcon)initWithListModel:(id)a3
{
  uint64_t v5 = sub_1D81B1F08();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SBHPageManagementIcon_listModel) = (Class)a3;
  id v9 = a3;
  sub_1D81B1EF8();
  sub_1D81B1EE8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = (void *)sub_1D81B1F58();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = (Class)SBHPageManagementIcon;
  v11 = [(SBLeafIcon *)&v13 initWithLeafIdentifier:v10 applicationBundleID:0];

  return v11;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 0;
}

- (BOOL)canBeReceivedByIcon
{
  return 0;
}

- (BOOL)canBeAddedToSubfolder
{
  return 0;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 0;
}

- (SBHPageManagementIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  result = (SBHPageManagementIcon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end