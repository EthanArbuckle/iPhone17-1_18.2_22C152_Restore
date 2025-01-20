@interface XMLTreeParser.Element
- (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element)init;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
@end

@implementation XMLTreeParser.Element

- (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element)init
{
  result = (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (a5)
  {
    sub_25EAC0E10();
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a6) {
LABEL_3:
  }
    sub_25EAC0E10();
LABEL_4:
  v9 = (void *)MEMORY[0x2611EA030]((char *)self + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser7Element_parent);
  id v10 = a3;
  v11 = self;
  if (v9)
  {
    objc_msgSend(v10, sel_setDelegate_, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  uint64_t v6 = sub_25EAC0E10();
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_25EA76DC4(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_25EA76E7C(v8);
}

@end