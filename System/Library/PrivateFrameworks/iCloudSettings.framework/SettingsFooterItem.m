@interface SettingsFooterItem
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (_TtC14iCloudSettings18SettingsFooterItem)init;
- (_TtC14iCloudSettings18SettingsFooterItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 action:(id)a6;
- (_TtC14iCloudSettings6Action)action;
- (id)init:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SettingsFooterItem

- (NSString)title
{
  return (NSString *)sub_262ADA1A0();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_262ADA1A0();
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings18SettingsFooterItem_identifier);
}

- (_TtC14iCloudSettings6Action)action
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC14iCloudSettings18SettingsFooterItem_action));
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return SettingsFooterItem.init(_:)(v3);
}

- (_TtC14iCloudSettings18SettingsFooterItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 action:(id)a6
{
  uint64_t v8 = sub_262B04488();
  uint64_t v10 = v9;
  uint64_t v11 = sub_262B04488();
  uint64_t v13 = v12;
  uint64_t v14 = sub_262B04488();
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings18SettingsFooterItem_identifier);
  uint64_t *v15 = v8;
  v15[1] = v10;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings18SettingsFooterItem_title);
  uint64_t *v16 = v11;
  v16[1] = v13;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings18SettingsFooterItem_subtitle);
  uint64_t *v17 = v14;
  v17[1] = v18;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings18SettingsFooterItem_action) = (Class)a6;
  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for SettingsFooterItem();
  id v19 = a6;
  return [(SettingsFooterItem *)&v21 init];
}

- (_TtC14iCloudSettings18SettingsFooterItem)init
{
  result = (_TtC14iCloudSettings18SettingsFooterItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end