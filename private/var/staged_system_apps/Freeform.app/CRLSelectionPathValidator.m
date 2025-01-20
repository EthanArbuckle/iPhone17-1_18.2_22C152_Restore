@interface CRLSelectionPathValidator
- (CRLSelectionModelTranslator)selectionModelTranslator;
- (_TtC8Freeform25CRLSelectionPathValidator)init;
- (_TtC8Freeform25CRLSelectionPathValidator)initWithBoard:(id)a3 translator:(id)a4;
- (_TtC8Freeform8CRLBoard)board;
- (id)selectionPathFromPersistableSelectionPath:(id)a3;
- (id)selectionPathFromPersistableSelectionPath:(id)a3 selectableBoardItemsFromParentMapAndSiblings:(id)a4;
- (void)setBoard:(id)a3;
- (void)setSelectionModelTranslator:(id)a3;
@end

@implementation CRLSelectionPathValidator

- (_TtC8Freeform8CRLBoard)board
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform8CRLBoard *)Strong;
}

- (void)setBoard:(id)a3
{
}

- (CRLSelectionModelTranslator)selectionModelTranslator
{
  return (CRLSelectionModelTranslator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator));
}

- (void)setSelectionModelTranslator:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform25CRLSelectionPathValidator)initWithBoard:(id)a3 translator:(id)a4
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator) = (Class)a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLSelectionPathValidator();
  id v6 = a4;
  return [(CRLSelectionPathValidator *)&v8 init];
}

- (id)selectionPathFromPersistableSelectionPath:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10060A4AC((uint64_t)v4);

  return v6;
}

- (id)selectionPathFromPersistableSelectionPath:(id)a3 selectableBoardItemsFromParentMapAndSiblings:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  objc_super v8 = self;
  id v9 = sub_10060BA84((uint64_t)v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  return v9;
}

- (_TtC8Freeform25CRLSelectionPathValidator)init
{
  result = (_TtC8Freeform25CRLSelectionPathValidator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator);
}

@end