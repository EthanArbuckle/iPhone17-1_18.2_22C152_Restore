@interface TTSAssetMAStrategy.DownloadSourceExtractor
- (_TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor)init;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation TTSAssetMAStrategy.DownloadSourceExtractor

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
  sub_19CED5180();
  id v14 = a3;
  v15 = self;
  sub_19CE0DA14((uint64_t)v15, v11, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  sub_19CED5260();
  if (a5) {
    sub_19CED5260();
  }
  if (a6) {
    sub_19CED5260();
  }
  id v10 = a3;
  uint64_t v11 = self;
  sub_19CE0DB80();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  sub_19CED5260();
  id v6 = a3;
  v7 = self;
  sub_19CE0DD40();

  swift_bridgeObjectRelease();
}

- (_TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor)init
{
  return (_TtCC14SiriTTSService18TTSAssetMAStrategy23DownloadSourceExtractor *)sub_19CE0DE98();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end