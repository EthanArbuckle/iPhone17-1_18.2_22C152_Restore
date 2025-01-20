@interface BKRootBarItem
+ (BOOL)supportsSecureCoding;
- (BKRootBarItem)init;
- (BKRootBarItem)initWithCoder:(id)a3;
- (BKRootBarItem)initWithIdentifier:(id)a3 isPlaceholder:(BOOL)a4 url:(id)a5 titleOverride:(id)a6 iconNameOverride:(id)a7 selectedIconNameOverride:(id)a8 countryCode:(id)a9 editNameOnSelect:(BOOL)a10;
- (BOOL)editNameOnSelect;
- (BOOL)isCustomCollection;
- (BOOL)isDefaultCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLibraryCollection;
- (BOOL)isPlaceholder;
- (BOOL)isSearch;
- (BOOL)isStandardItem;
- (BOOL)isStoreOnly;
- (BOOL)requiresURL;
- (NSString)automationID;
- (NSString)countryCode;
- (NSString)description;
- (NSString)iconNameOverride;
- (NSString)identifier;
- (NSString)selectedIconNameOverride;
- (NSString)sidebarTitle;
- (NSString)suggestedTrackerName;
- (NSString)tabBarTitle;
- (NSString)titleOverride;
- (NSString)url;
- (id)toTabBarElement;
- (id)toTabBarItem;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKRootBarItem

- (BOOL)requiresURL
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  v2 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  v4 = self;
  swift_bridgeObjectRetain();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v2);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned __int8 v7 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v3, v2);
    if (v7 > 0x10u || ((1 << v7) & 0x1E01F) == 0)
    {

      char v10 = 0;
      return v10 & 1;
    }
  }
  char v9 = *((unsigned char *)&v4->super.isa + OBJC_IVAR___BKRootBarItem_isPlaceholder);

  char v10 = v9 ^ 1;
  return v10 & 1;
}

- (NSString)description
{
  return (NSString *)sub_1000558F0(self, (uint64_t)a2, (void (*)(void))RootBarItem.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKRootBarItem)initWithCoder:(id)a3
{
  return (BKRootBarItem *)RootBarItem.init(coder:)(a3);
}

- (BKRootBarItem)initWithIdentifier:(id)a3 isPlaceholder:(BOOL)a4 url:(id)a5 titleOverride:(id)a6 iconNameOverride:(id)a7 selectedIconNameOverride:(id)a8 countryCode:(id)a9 editNameOnSelect:(BOOL)a10
{
  uint64_t v14 = sub_1007FDC70();
  unint64_t v34 = v15;
  uint64_t v35 = v14;
  if (a5)
  {
    uint64_t v16 = sub_1007FDC70();
    uint64_t v32 = v17;
    uint64_t v33 = v16;
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    if (a6)
    {
LABEL_3:
      uint64_t v18 = sub_1007FDC70();
      uint64_t v20 = v19;
      id v21 = a9;
      if (a7) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v22 = 0;
      if (a8) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  uint64_t v18 = 0;
  uint64_t v20 = 0;
  id v21 = a9;
  if (!a7) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v22 = sub_1007FDC70();
  a7 = v23;
  if (a8)
  {
LABEL_5:
    a8 = (id)sub_1007FDC70();
    uint64_t v25 = v24;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v25 = 0;
LABEL_10:
  id v26 = v21;
  if (v26)
  {
    v27 = v26;
    uint64_t v28 = sub_1007FDC70();
    uint64_t v30 = v29;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v30 = 0;
  }
  return (BKRootBarItem *)RootBarItem.init(identifier:isPlaceholder:url:titleOverride:iconNameOverride:selectedIconNameOverride:countryCode:editNameOnSelect:)(v35, v34, a4, v33, v32, v18, v20, v22, (uint64_t)a7, (uint64_t)a8, v25, v28, v30, a10);
}

- (BOOL)isLibraryCollection
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  uint64_t v3 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  v4 = self;
  LOBYTE(v2) = _s5Books20RootBarItemsProviderC19isLibraryCollection3forSbSS_tFZ_0(v2, v3);

  return v2 & 1;
}

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)suggestedTrackerName
{
  NSString v2 = self;
  if (![(BKRootBarItem *)v2 isLibraryCollection]) {
    swift_bridgeObjectRetain();
  }

  NSString v3 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)toTabBarElement
{
  NSString v2 = self;
  NSString v3 = RootBarItem.toTabBarElement()();

  return v3;
}

- (NSString)automationID
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  NSString v2 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  v4 = self;
  swift_bridgeObjectRetain();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v2);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    char v7 = 14;
  }
  else
  {
    char v7 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v3, v2);
    if (v7 == 16) {
      char v7 = 15;
    }
  }
  sub_10006AA94(v7);

  NSString v8 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = RootBarItem.isEqual(_:)((uint64_t)v8);

  sub_10006CA38((uint64_t)v8);
  return v6 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  RootBarItem.encode(with:)((NSCoder)v4);
}

- (NSString)url
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_url);
}

- (NSString)tabBarTitle
{
  return (NSString *)sub_1000558F0(self, (uint64_t)a2, (void (*)(void))RootBarItem.tabBarTitle.getter);
}

- (BOOL)isPlaceholder
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_isPlaceholder);
}

- (NSString)iconNameOverride
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_iconNameOverride);
}

- (NSString)selectedIconNameOverride
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_selectedIconNameOverride);
}

- (NSString)titleOverride
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_titleOverride);
}

- (NSString)countryCode
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKRootBarItem_countryCode);
}

- (BOOL)editNameOnSelect
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_editNameOnSelect);
}

- (BKRootBarItem)init
{
  result = (BKRootBarItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)isSearch
{
  NSString v2 = self;
  char v3 = RootBarItem.isSearch.getter();

  return v3 & 1;
}

- (BOOL)isStoreOnly
{
  return sub_1005EC8E8((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1004D21B4);
}

- (BOOL)isDefaultCollection
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKRootBarItem_identifier);
  NSString v2 = *(void **)&self->identifier[OBJC_IVAR___BKRootBarItem_identifier];
  id v4 = self;
  swift_bridgeObjectRetain();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v2);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v7) = 0;
  }
  else
  {
    unsigned __int8 v8 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v3, v2);
    if (v8 > 0x10u) {
      LOBYTE(v7) = 1;
    }
    else {
      unsigned int v7 = (0x1FE0u >> v8) & 1;
    }
  }

  return v7;
}

- (BOOL)isCustomCollection
{
  NSString v2 = self;
  char v3 = RootBarItem.isCustomCollection.getter();

  return v3 & 1;
}

- (BOOL)isStandardItem
{
  return sub_1005EC8E8((char *)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1004D2364);
}

- (id)toTabBarItem
{
  NSString v2 = self;
  char v3 = RootBarItem.toTabBarItem()();

  return v3;
}

- (NSString)sidebarTitle
{
  return (NSString *)sub_1000558F0(self, (uint64_t)a2, (void (*)(void))RootBarItem.sidebarTitle.getter);
}

@end