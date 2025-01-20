@interface RDVASwiftVisionKWSSpotterDelegate
- (void)keywordSpotterDidDetectKeywordWithEvent:(id)a3;
@end

@implementation RDVASwiftVisionKWSSpotterDelegate

- (void)keywordSpotterDidDetectKeywordWithEvent:(id)a3
{
  v3 = *(uint64_t (**)(uint64_t))(*(void *)self->_TtCs12_SwiftObject_opaque + 96);
  id v4 = a3;
  uint64_t v5 = swift_retain();
  uint64_t v6 = v3(v5);
  if (v6)
  {
    v7 = (void *)v6;
    sub_1000C3170();
    NSString v8 = sub_1000C3550();
    swift_bridgeObjectRelease();
    sub_1000C3160();
    int v10 = v9;
    char v11 = sub_1000C3130();
    char v12 = sub_1000C3150();
    char v13 = sub_1000C3140();
    LODWORD(v14) = v10;
    [v7 didDetectKeywordWithKeyword:v8 score:v11 & 1 silenceAfter:v12 & 1 silenceBefore:v13 & 1 speechDuring:v14];

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_release();
  }
}

@end