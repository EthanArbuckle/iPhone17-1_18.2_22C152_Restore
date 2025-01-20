@interface DOCFileProviderSource
+ (id)createSourceFrom:(id)a3 with:(id)a4;
+ (id)createSpotlightSources;
- (BOOL)appearsInMoveUI;
- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors;
- (BOOL)isAvailableSystemWide;
- (BOOL)isEjectable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpotlightBacked;
- (BOOL)isValidForConfiguration:(id)a3;
- (BOOL)isiCloudBased;
- (FPProviderDomain)providerDomain;
- (NSArray)supportedSearchFilters;
- (NSString)description;
- (NSString)displayName;
- (NSString)domainName;
- (NSString)providerName;
- (UIImage)iconPreferingSymbolImages;
- (_TtC5Files16DOCActionManager)actionManager;
- (_TtC5Files21DOCFileProviderSource)init;
- (_TtC5Files21DOCFileProviderSource)initWithCoder:(id)a3;
- (id)loadIconForSize:(int64_t)a3;
- (unint64_t)status;
- (void)setActionManager:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setIsEjectable:(BOOL)a3;
- (void)setProviderName:(id)a3;
@end

@implementation DOCFileProviderSource

- (NSString)displayName
{
  return (NSString *)sub_100059908(self, (uint64_t)a2, (void (*)(void))_s5Files21DOCFileProviderSourceC11displayNameSSvg_0);
}

+ (id)createSourceFrom:(id)a3 with:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  id v8 = a3;
  v9 = sub_100057B24(v8, v5, v7);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  v11 = (void (**)(void *, uint64_t, void *))&v9[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction];
  uint64_t v12 = *(void *)&v9[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction];
  *v11 = sub_1003179E8;
  v11[1] = (void (*)(void *, uint64_t, void *))v10;
  id v13 = v8;
  sub_1000A7258(v12);

  swift_bridgeObjectRelease();

  return v9;
}

+ (id)createSpotlightSources
{
  sub_100058908();
  type metadata accessor for DOCFileProviderSource(0);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (NSString)providerName
{
  return (NSString *)sub_100059908(self, (uint64_t)a2, (void (*)(void))_s5Files21DOCFileProviderSourceC12providerNameSSvg_0);
}

- (unint64_t)status
{
  int v2 = self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_isProviderDomainEnabled];
  if (v2 == 2) {
    return 2;
  }
  else {
    return (v2 & 1) == 0;
  }
}

- (_TtC5Files16DOCActionManager)actionManager
{
  int v2 = self;
  id v3 = sub_10006F9FC();

  return (_TtC5Files16DOCActionManager *)v3;
}

- (BOOL)isiCloudBased
{
  int v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
  if (v2) {
    LOBYTE(v2) = [v2 isiCloudDriveProvider];
  }
  return (char)v2;
}

- (BOOL)isValidForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = DOCFileProviderSource.isValid(for:)(v4);

  return self & 1;
}

- (BOOL)isAvailableSystemWide
{
  if (self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource_type])
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    int v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
    if (v2) {
      LOBYTE(v2) = [v2 isAvailableSystemWide];
    }
    else {
      __break(1u);
    }
  }
  return (char)v2;
}

- (FPProviderDomain)providerDomain
{
  return (FPProviderDomain *)*(id *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
}

- (void)setActionManager:(id)a3
{
  id v4 = *(id *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___actionManager];
  *(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___actionManager] = a3;
  id v3 = a3;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setProviderName:(id)a3
{
}

- (NSString)domainName
{
  int v2 = self;
  _s5Files21DOCFileProviderSourceC10domainNameSSSgvg_0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setDomainName:(id)a3
{
}

- (id)loadIconForSize:(int64_t)a3
{
  uint64_t v3 = *(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
  if (v3) {
    id v4 = [self iconForFileProvider:v3 size:a3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isEjectable
{
  return self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_isEjectable];
}

- (void)setIsEjectable:(BOOL)a3
{
  self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_isEjectable] = a3;
}

- (BOOL)isSpotlightBacked
{
  return self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource_type];
}

- (NSArray)supportedSearchFilters
{
  int v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_providerDomain];
  if (v2)
  {
    uint64_t v3 = self;
    id v4 = [v2 supportedSearchFilters];
    if (v4)
    {
      NSString v5 = v4;
      type metadata accessor for NSFileProviderSearchFilter(0);
      static Array._unconditionallyBridgeFromObjectiveC(_:)();

      v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  v6.super.isa = 0;
LABEL_6:

  return (NSArray *)v6.super.isa;
}

- (BOOL)appearsInMoveUI
{
  return (self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource_type] & 1) == 0
      && ([(DOCFileProviderSource *)self status] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NSString)description
{
  int v2 = self;
  DOCFileProviderSource.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    NSString v5 = self;
  }
  char v6 = DOCFileProviderSource.isEqual(_:)((uint64_t)v8);

  sub_1000CBBA4((uint64_t)v8, (uint64_t *)&unk_100705D60);
  return v6 & 1;
}

- (_TtC5Files21DOCFileProviderSource)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10031770C();
}

- (_TtC5Files21DOCFileProviderSource)init
{
  result = (_TtC5Files21DOCFileProviderSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000A7258(*(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_dropAction]);
  sub_100058154(*(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___containingApplicationIdentifier], *(void *)&self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage___containingApplicationIdentifier]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100058154(*(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage____domainName], *(void *)&self->providerDomain[OBJC_IVAR____TtC5Files21DOCFileProviderSource____lazy_storage____domainName]);
  id v3 = &self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_defaultSorting];
  uint64_t v4 = type metadata accessor for DOCItemSortMode();
  NSString v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  swift_bridgeObjectRelease();
  v5(&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_defaultGroupingMode], v4);
  swift_bridgeObjectRelease();
  char v6 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files21DOCFileProviderSource_type];
}

- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors
{
  int v2 = self;
  char v3 = sub_1005226CC();

  return v3 & 1;
}

- (UIImage)iconPreferingSymbolImages
{
  int v2 = self;
  id v3 = sub_100522844();

  return (UIImage *)v3;
}

@end