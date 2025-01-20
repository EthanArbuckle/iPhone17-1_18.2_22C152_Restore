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
    sub_100022374(0, (unint64_t *)&qword_100139070);
    sub_1000EA470();

    swift_release();
    v8.super.isa = sub_1000EA460().super.isa;
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