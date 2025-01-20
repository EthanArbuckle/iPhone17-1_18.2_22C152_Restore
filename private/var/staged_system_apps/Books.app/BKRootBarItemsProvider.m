@interface BKRootBarItemsProvider
+ (BOOL)canBeHiddenFor:(id)a3;
+ (BOOL)isCustomCollectionFor:(id)a3;
+ (BOOL)isDefaultCollectionFor:(id)a3;
+ (BOOL)isLibraryCollectionFor:(id)a3;
+ (BOOL)isSearchFor:(id)a3;
+ (BOOL)isStandardItemFor:(id)a3;
+ (BOOL)isStoreOnlyFor:(id)a3;
+ (BOOL)requiresURLFor:(id)a3;
+ (NSArray)placeholderStandardItems;
+ (NSString)AudiobooksIdentifier;
+ (NSString)BooksIdentifier;
+ (NSString)HomeIdentifier;
+ (NSString)LibraryAllIdentifier;
+ (NSString)LibraryAudiobooksIdentifier;
+ (NSString)LibraryBooksIdentifier;
+ (NSString)LibraryDownloadedIdentifier;
+ (NSString)LibraryFinishedIdentifier;
+ (NSString)LibraryMySamplesIdentifier;
+ (NSString)LibraryPDFIdentifier;
+ (NSString)LibraryUserCollectionIdentifier;
+ (NSString)LibraryWantToReadIdentifier;
+ (NSString)MangaIdentifier;
+ (NSString)NewCollectionIdentifier;
+ (NSString)SearchIdentifier;
+ (id)automationIdentifierFor:(id)a3;
+ (id)customCollectionIDFromItemIdentifier:(id)a3;
+ (id)defaultCollectionIDFromItemIdentifier:(id)a3;
+ (id)itemIdentifierForCollectionID:(id)a3;
+ (id)itemIdentifierForCustomCollectionID:(id)a3;
+ (id)itemIdentifierForDefaultCollectionID:(id)a3;
+ (id)standardItemsFromBagWith:(id)a3 countryCode:(id)a4;
+ (id)stringForReturnToRootBarItemFor:(id)a3;
+ (int64_t)tabTypeFor:(id)a3;
- (BKRootBarItemsProvider)init;
@end

@implementation BKRootBarItemsProvider

+ (id)standardItemsFromBagWith:(id)a3 countryCode:(id)a4
{
  uint64_t v5 = sub_1007FDFF0();
  if (a4)
  {
    uint64_t v6 = sub_1007FDC70();
    a4 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  _s5Books20RootBarItemsProviderC08standardD7FromBag4with11countryCodeSayAA0bC4ItemCGSayypG_SSSgtFZ_0(v5, v6, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for RootBarItem();
  v8.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

+ (int64_t)tabTypeFor:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  int64_t v5 = _s5Books20RootBarItemsProviderC7tabType3for13BookAnalytics010BridgedTabG0OSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (NSString)LibraryAllIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)HomeIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)BooksIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)AudiobooksIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)MangaIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)SearchIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryWantToReadIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryFinishedIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryBooksIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryAudiobooksIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryPDFIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryMySamplesIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryDownloadedIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)LibraryUserCollectionIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)NewCollectionIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSArray)placeholderStandardItems
{
  _s5Books20RootBarItemsProviderC019placeholderStandardD0SayAA0bC4ItemCGvgZ_0();
  type metadata accessor for RootBarItem();
  v2.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

+ (BOOL)isSearchFor:(id)a3
{
  return sub_1004D2D64((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC8isSearch3forSbSS_tFZ_0);
}

+ (BOOL)isStoreOnlyFor:(id)a3
{
  return sub_1004D2E78((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1004D21B4);
}

+ (BOOL)isDefaultCollectionFor:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  int64_t v5 = v4;
  swift_bridgeObjectRetain();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v8) = 0;
  }
  else
  {
    unsigned __int8 v9 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v3, v5);
    if (v9 <= 0x10u) {
      unsigned int v8 = (0x1FE0u >> v9) & 1;
    }
    else {
      LOBYTE(v8) = 1;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

+ (BOOL)canBeHiddenFor:(id)a3
{
  return sub_1004D2D64((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC11canBeHidden3forSbSS_tFZ_0);
}

+ (BOOL)isCustomCollectionFor:(id)a3
{
  return sub_1004D2D64((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC18isCustomCollection3forSbSS_tFZ_0);
}

+ (BOOL)isLibraryCollectionFor:(id)a3
{
  return sub_1004D2D64((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC19isLibraryCollection3forSbSS_tFZ_0);
}

+ (BOOL)isStandardItemFor:(id)a3
{
  return sub_1004D2E78((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1004D2364);
}

+ (id)itemIdentifierForDefaultCollectionID:(id)a3
{
  id v3 = a3;
  _s5Books20RootBarItemsProviderC14itemIdentifier22forDefaultCollectionIDSSSgSo09BCDefaultjK0a_tFZ_0();
  uint64_t v5 = v4;

  if (v5)
  {
    NSString v6 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return v6;
}

+ (id)defaultCollectionIDFromItemIdentifier:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  id v5 = _s5Books20RootBarItemsProviderC19defaultCollectionID18fromItemIdentifierSo09BCDefaultgH0aSgSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)itemIdentifierForCustomCollectionID:(id)a3
{
  v6._countAndFlagsBits = sub_1007FDC70();
  sub_1007FDDE0(v6);
  swift_bridgeObjectRelease();
  NSString v3 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)customCollectionIDFromItemIdentifier:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, v4);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    NSString v7 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

+ (id)itemIdentifierForCollectionID:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  uint64_t v5 = v4;
  NSString v6 = sub_1007FDC30();
  _s5Books20RootBarItemsProviderC14itemIdentifier22forDefaultCollectionIDSSSgSo09BCDefaultjK0a_tFZ_0();
  uint64_t v8 = v7;

  if (!v8)
  {
    v12._countAndFlagsBits = v3;
    v12._object = v5;
    sub_1007FDDE0(v12);
  }
  swift_bridgeObjectRelease();
  NSString v9 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return v9;
}

+ (BOOL)requiresURLFor:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v8) = 1;
  }
  else
  {
    unsigned __int8 v9 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v3, v5);
    if (v9 <= 0x10u) {
      unsigned int v8 = (0x1E01Fu >> v9) & 1;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)stringForReturnToRootBarItemFor:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v8 = 14;
  }
  else
  {
    unsigned __int8 v8 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v3, v5);
    if (v8 == 16) {
      unsigned __int8 v8 = 15;
    }
  }
  sub_1004D18BC(v8);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    NSString v11 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }

  return v11;
}

+ (id)automationIdentifierFor:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    char v8 = 14;
  }
  else
  {
    char v9 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v3, v5);
    if (v9 == 16) {
      char v8 = 15;
    }
    else {
      char v8 = v9;
    }
  }
  swift_bridgeObjectRelease();
  sub_10006AA94(v8);
  NSString v10 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return v10;
}

- (BKRootBarItemsProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RootBarItemsProvider();
  return [(BKRootBarItemsProvider *)&v3 init];
}

@end