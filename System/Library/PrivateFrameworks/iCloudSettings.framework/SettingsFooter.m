@interface SettingsFooter
- (NSArray)footerItems;
- (_TtC14iCloudSettings14SettingsFooter)init;
- (id)init:(id)a3;
@end

@implementation SettingsFooter

- (NSArray)footerItems
{
  return (NSArray *)sub_262ADAAF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings14SettingsFooter_footerItems, v2, (void (*)(uint64_t))type metadata accessor for SettingsFooterItem);
}

- (id)init:(id)a3
{
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B422A20);
    uint64_t v3 = sub_262B04558();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return SettingsFooter.init(_:)(v3);
}

- (_TtC14iCloudSettings14SettingsFooter)init
{
  result = (_TtC14iCloudSettings14SettingsFooter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end