@interface JSSettingsItem
- (NSString)description;
@end

@implementation JSSettingsItem

- (NSString)description
{
  v2 = self;
  JSSettingsItem.description.getter();

  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__title;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB48);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__detailText, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__kind;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE6B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__artwork;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFD4B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__usesApplicationTintColor;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_DE0398);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__hasChevron, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__hasEditButton, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__isDeletable, v11);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__followRequestsCount;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE6F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__accessoryItem;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE708);
  v17 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);

  v17(v15, v16);
}

@end