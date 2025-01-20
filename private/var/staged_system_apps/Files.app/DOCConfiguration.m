@interface DOCConfiguration
- (BOOL)allowsDisplaying:(id)a3;
- (BOOL)canPresentContentForTab:(unint64_t)a3;
- (_TtP5Files31DOCSourceListInterfaceProviding_)sourceListUI;
- (void)configureContextForDisplayingTab:(unint64_t)a3;
- (void)updateStateAndSceneIdentifiersWithWindow:(id)a3;
@end

@implementation DOCConfiguration

- (void)updateStateAndSceneIdentifiersWithWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10002AB38(a3);
}

- (void)configureContextForDisplayingTab:(unint64_t)a3
{
  if (a3 > 2) {
    __break(1u);
  }
  else {
    [(DOCConfiguration *)self setDefaultEffectiveTabIdentifierForLocationRestore:*(void *)*(&off_1006945C0 + a3)];
  }
}

- (BOOL)allowsDisplaying:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000BD990(v4);

  return self & 1;
}

- (BOOL)canPresentContentForTab:(unint64_t)a3
{
  id v4 = self;
  if (![(DOCConfiguration *)v4 forSavingDocuments])
  {
    BOOL v5 = 1;
    goto LABEL_5;
  }
  if (a3 < 3)
  {
    BOOL v5 = (a3 & 7) == 2;
LABEL_5:

    return v5;
  }
  type metadata accessor for DOCTab(0);
  BOOL result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  return result;
}

- (_TtP5Files31DOCSourceListInterfaceProviding_)sourceListUI
{
  type metadata accessor for DOCSourceListInterface_Default();
  v3 = self;
  inited = (void *)swift_initStaticObject();

  return (_TtP5Files31DOCSourceListInterfaceProviding_ *)inited;
}

@end