@interface CRRecognitionPostProcessor
- (id)postprocessLineRegions:(id)a3;
@end

@implementation CRRecognitionPostProcessor

- (id)postprocessLineRegions:(id)a3
{
  sub_1DD73872C(0, &qword_1EAB58470);
  uint64_t v4 = sub_1DD8A7590();
  v5 = self;
  sub_1DD740490(v4);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1DD8A7580();
  swift_bridgeObjectRelease();
  return v6;
}

@end