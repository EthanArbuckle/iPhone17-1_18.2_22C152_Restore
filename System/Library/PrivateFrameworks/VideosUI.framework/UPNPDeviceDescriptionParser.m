@interface UPNPDeviceDescriptionParser
- (_TtC8VideosUI27UPNPDeviceDescriptionParser)init;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation UPNPDeviceDescriptionParser

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v11 = sub_1E387C928();
  uint64_t v13 = v12;
  if (a5) {
    sub_1E387C928();
  }
  if (a6) {
    sub_1E387C928();
  }
  sub_1E387C678();
  id v14 = a3;
  v15 = self;
  sub_1E35DDC94((uint64_t)v15, v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  sub_1E387C928();
  id v6 = a3;
  v7 = self;
  sub_1E35DDFE8();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  sub_1E387C928();
  if (a5) {
    sub_1E387C928();
  }
  if (a6) {
    sub_1E387C928();
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_1E35DE2C4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI27UPNPDeviceDescriptionParser)init
{
  return (_TtC8VideosUI27UPNPDeviceDescriptionParser *)sub_1E35DE46C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end