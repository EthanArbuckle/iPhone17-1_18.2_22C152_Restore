@interface ImageJoeColorAnalyzer
- (id)colorsForImage:(id)a3;
@end

@implementation ImageJoeColorAnalyzer

- (id)colorsForImage:(id)a3
{
  v4 = self;
  id v5 = a3;
  swift_retain();
  id result = [v4 colorsForImage:v5];
  if (result)
  {
    id v7 = result;
    sub_100036814(0, (unint64_t *)&qword_100111C20);
    sub_1000CC3B0();

    swift_release();
    v8.super.isa = sub_1000CC3A0().super.isa;
    swift_bridgeObjectRelease();
    return v8.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end