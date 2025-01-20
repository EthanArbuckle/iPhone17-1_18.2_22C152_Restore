@interface ICArchive
+ (id)packageExtension;
@end

@implementation ICArchive

+ (id)packageExtension
{
  if (qword_100103640 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = sub_1000B7580();
  swift_bridgeObjectRelease();

  return v2;
}

@end