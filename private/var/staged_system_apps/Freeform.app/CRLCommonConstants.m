@interface CRLCommonConstants
+ (double)defaultBoardSaveInterval;
+ (int)timeScale;
- (_TtC8Freeform18CRLCommonConstants)init;
@end

@implementation CRLCommonConstants

+ (double)defaultBoardSaveInterval
{
  return 0.1;
}

+ (int)timeScale
{
  return 90000;
}

- (_TtC8Freeform18CRLCommonConstants)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLCommonConstants();
  return [(CRLCommonConstants *)&v3 init];
}

@end