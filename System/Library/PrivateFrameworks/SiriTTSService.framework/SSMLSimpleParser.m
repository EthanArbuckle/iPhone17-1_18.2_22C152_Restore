@interface SSMLSimpleParser
- (_TtC14SiriTTSService16SSMLSimpleParser)init;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parserDidStartDocument:(id)a3;
@end

@implementation SSMLSimpleParser

- (void)parserDidStartDocument:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CE5D3C0();
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v11 = sub_19CED5260();
  uint64_t v13 = v12;
  if (a5) {
    sub_19CED5260();
  }
  if (a6) {
    sub_19CED5260();
  }
  uint64_t v14 = sub_19CED5180();
  id v15 = a3;
  v16 = self;
  sub_19CE5D42C((uint64_t)v16, v11, v13, v17, v18, v19, v20, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC14SiriTTSService16SSMLSimpleParser)init
{
  return (_TtC14SiriTTSService16SSMLSimpleParser *)sub_19CE5D648();
}

- (void).cxx_destruct
{
}

@end