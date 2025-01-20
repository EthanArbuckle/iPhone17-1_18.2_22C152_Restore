@interface BKSceneControllerUtilities
+ (NSString)accountInfoKey;
+ (NSString)assetIDKey;
+ (NSString)bookKey;
+ (NSString)endOfBookKey;
+ (NSString)primaryKey;
+ (NSString)sceneTypeKey;
+ (id)sceneTypekeyForSceneController:(id)a3;
+ (unint64_t)sceneTypeFrom:(id)a3;
- (BKSceneControllerUtilities)init;
@end

@implementation BKSceneControllerUtilities

+ (NSString)primaryKey
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)accountInfoKey
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)endOfBookKey
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)bookKey
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)sceneTypeKey
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (NSString)assetIDKey
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (id)sceneTypekeyForSceneController:(id)a3
{
  swift_unknownObjectRetain();
  sub_1006E5224(a3);
  swift_unknownObjectRelease();
  NSString v4 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return v4;
}

+ (unint64_t)sceneTypeFrom:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  unint64_t v5 = sub_1006E5318(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (BKSceneControllerUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneControllerUtilities();
  return [(BKSceneControllerUtilities *)&v3 init];
}

@end