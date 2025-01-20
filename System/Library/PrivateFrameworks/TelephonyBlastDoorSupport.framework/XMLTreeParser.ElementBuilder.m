@interface XMLTreeParser.ElementBuilder
- (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder)init;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation XMLTreeParser.ElementBuilder

- (_TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder_rootElement) = 0;
  type metadata accessor for XMLTreeParser.ErrorContext();
  v3 = (objc_class *)swift_allocObject();
  *((void *)v3 + 2) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder_errorContext) = v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for XMLTreeParser.ElementBuilder();
  return [(XMLTreeParser.ElementBuilder *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV25TelephonyBlastDoorSupport13XMLTreeParser14ElementBuilder_rootElement));

  swift_release();
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
}

@end