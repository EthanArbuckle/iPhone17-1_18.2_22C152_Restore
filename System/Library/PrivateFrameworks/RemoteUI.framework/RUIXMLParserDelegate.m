@interface RUIXMLParserDelegate
- (NSArray)stack;
- (RUIXMLElement)xmlElement;
- (RUIXMLParserDelegate)init;
- (RUIXMLParserDelegate)initWithRoot:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCDATA:(id)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation RUIXMLParserDelegate

- (RUIXMLElement)xmlElement
{
  return (RUIXMLElement *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___RUIXMLParserDelegate__xmlElement));
}

- (NSArray)stack
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_214603048();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (RUIXMLParserDelegate)initWithRoot:(id)a3
{
  id v4 = a3;
  v5 = (RUIXMLParserDelegate *)sub_2145E7018(a3);

  return v5;
}

- (RUIXMLParserDelegate)init
{
  return [(RUIXMLParserDelegate *)self initWithRoot:0];
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v11 = sub_214602EA8();
  uint64_t v13 = v12;
  if (a5) {
    sub_214602EA8();
  }
  if (a6) {
    sub_214602EA8();
  }
  sub_214602E08();
  id v14 = a3;
  v15 = self;
  sub_2145E70C8(v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = self;
  uint64_t v8 = sub_2146020E8();
  unint64_t v10 = v9;

  sub_2145E72B0();
  sub_214556AF4(v8, v10);
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  sub_214602EA8();
  id v6 = a3;
  id v7 = self;
  sub_2145E744C();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  uint64_t v10 = sub_214602EA8();
  uint64_t v12 = v11;
  if (a5) {
    sub_214602EA8();
  }
  if (a6) {
    sub_214602EA8();
  }
  id v13 = a3;
  id v14 = self;
  sub_2145E75A4(v10, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end