@interface WFSwiftAppShortcutDataSource
- (WFSwiftAppShortcutDataSource)init;
- (WFSwiftAppShortcutDataSource)initWithAppShortcutsProvider:(id)a3 denyListEnvironment:(unint64_t)a4 organizationStyle:(int64_t)a5;
- (id)fetchAppShortcutForBundleIdentifiers:(id)a3 localeIdentifier:(id)a4 error:(id *)a5;
- (void)appShortcutsChanged;
@end

@implementation WFSwiftAppShortcutDataSource

- (WFSwiftAppShortcutDataSource)initWithAppShortcutsProvider:(id)a3 denyListEnvironment:(unint64_t)a4 organizationStyle:(int64_t)a5
{
  swift_getObjectType();
  uint64_t v8 = swift_unknownObjectRetain();
  return (WFSwiftAppShortcutDataSource *)sub_1C8227940(v8, a4, a5, (char *)self);
}

- (id)fetchAppShortcutForBundleIdentifiers:(id)a3 localeIdentifier:(id)a4 error:(id *)a5
{
  sub_1C8532838();
  sub_1C8532658();
  v6 = self;
  sub_1C8223ECC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA512768);
  v7 = (void *)sub_1C8532518();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)appShortcutsChanged
{
  v2 = self;
  sub_1C8225610();
}

- (WFSwiftAppShortcutDataSource)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___WFSwiftAppShortcutDataSource__collections;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA511C90);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_unknownObjectRelease();
}

@end