@interface NqmlStringGenerator
- (_TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator)init;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5;
- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)parserDidFindNewline:(void *)a3;
- (void)parserDidStartDocument:(id)a3;
- (void)parserDidStartListElement:(id)a3;
@end

@implementation NqmlStringGenerator

- (void)parserDidStartDocument:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_4AC4F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_3DED90;
  *(void *)(inited + 32) = NSFontAttributeName;
  v6 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration];
  *(void *)(inited + 64) = sub_3D530(0, (unint64_t *)&qword_4C2420);
  *(void *)(inited + 40) = v6;
  id v7 = a3;
  v8 = self;
  v9 = NSFontAttributeName;
  id v10 = v6;
  v11 = (char *)sub_112FC(inited);
  sub_3CB594(v11);

  swift_bridgeObjectRelease();
}

- (void)parserDidEndDocument:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(void *)(*(void *)v5 + 16))
  {
    id v6 = a3;
    id v7 = self;
    if (!sub_3CC894()) {
      sub_3CAAA4(*(void *)(*(void *)v5 + 16) - 1);
    }
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  else
  {
    __break(1u);
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_3CCDF4();
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  type metadata accessor for NqmlAttributeName(0);
  sub_3CD984(&qword_4A96C8, type metadata accessor for NqmlAttributeName);
  uint64_t v8 = sub_3D7BB0();
  id v9 = a3;
  id v10 = self;
  sub_3CD000(a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_3CD5D4(a4);
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_3D7D50();
  id v6 = a3;
  id v7 = self;
  sub_3CD6B4();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_3CD7E4();
}

- (void)parserDidStartListElement:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_3CBA28();
}

- (void)parserDidFindNewline:(void *)a3
{
  id v4 = a3;
  id v5 = a1;
  sub_3CBA28();
}

- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_3CD8AC();
}

- (_TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator)init
{
  result = (_TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration];
  id v4 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                                    + 8];
  id v5 = *(void **)&self->configuration[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                                    + 32];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator));

  swift_bridgeObjectRelease();
}

@end