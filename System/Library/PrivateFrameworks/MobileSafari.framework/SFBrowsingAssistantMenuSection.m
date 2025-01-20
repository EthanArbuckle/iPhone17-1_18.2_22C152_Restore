@interface SFBrowsingAssistantMenuSection
+ (NSArray)moreMenuSections;
+ (SFBrowsingAssistantMenuSection)favoritesSection;
+ (id)websiteSettingsSectionForDomain:(id)a3;
- (NSArray)items;
- (NSArray)settings;
- (NSString)identifier;
- (NSString)title;
- (SFBrowsingAssistantMenuSection)init;
- (SFBrowsingAssistantMenuSection)initWithIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItems:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFBrowsingAssistantMenuSection

+ (SFBrowsingAssistantMenuSection)favoritesSection
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)SFBrowsingAssistantMenuSection), sel_initWithIdentifier_, @"PageMenuSectionFavorites");

  return (SFBrowsingAssistantMenuSection *)v2;
}

+ (NSArray)moreMenuSections
{
  sub_18C56655C();
  type metadata accessor for SFBrowsingAssistantMenuSection();
  id v2 = (void *)sub_18C6F99C8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

+ (id)websiteSettingsSectionForDomain:(id)a3
{
  uint64_t v3 = sub_18C6F9848();
  id v5 = sub_18C566678(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

- (SFBrowsingAssistantMenuSection)initWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (SFBrowsingAssistantMenuSection *)sub_18C566850(v3);

  return v4;
}

- (NSString)identifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___SFBrowsingAssistantMenuSection_identifier));
}

- (void)setIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantMenuSection_identifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantMenuSection_identifier) = (Class)a3;
  id v3 = a3;
}

- (NSString)title
{
  swift_beginAccess();
  sub_18C6F7DE8();
  id v2 = (void *)sub_18C6F9808();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = sub_18C6F9848();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantMenuSection_title);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)items
{
  return (NSArray *)sub_18C5661BC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SFBrowsingAssistantMenuSection_items, &qword_1E9177388);
}

- (void)setItems:(id)a3
{
}

- (NSArray)settings
{
  return (NSArray *)sub_18C5661BC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SFBrowsingAssistantMenuSection_settings, &qword_1E9177380);
}

- (void)setSettings:(id)a3
{
}

- (SFBrowsingAssistantMenuSection)init
{
  result = (SFBrowsingAssistantMenuSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end