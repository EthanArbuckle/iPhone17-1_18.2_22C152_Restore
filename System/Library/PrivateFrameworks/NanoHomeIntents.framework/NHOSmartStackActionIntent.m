@interface NHOSmartStackActionIntent
- (BOOL)useHomeKitRecommendations;
- (NHOSmartStackActionIntent)init;
- (NSString)accessoriesAndScenes;
- (NSString)actionID;
- (NSString)actionName;
- (NSString)homeID;
- (NSString)homeName;
- (NSString)icon;
- (void)setAccessoriesAndScenes:(id)a3;
- (void)setActionID:(id)a3;
- (void)setActionName:(id)a3;
- (void)setHomeID:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setIcon:(id)a3;
- (void)setUseHomeKitRecommendations:(BOOL)a3;
@end

@implementation NHOSmartStackActionIntent

- (NSString)homeID
{
  return (NSString *)sub_257300B88(self);
}

- (void)setHomeID:(id)a3
{
}

- (NSString)homeName
{
  return (NSString *)sub_257300B88(self);
}

- (void)setHomeName:(id)a3
{
}

- (NSString)actionID
{
  return (NSString *)sub_257300B88(self);
}

- (void)setActionID:(id)a3
{
}

- (NSString)actionName
{
  return (NSString *)sub_257300B88(self);
}

- (void)setActionName:(id)a3
{
}

- (NSString)icon
{
  return (NSString *)sub_257300B88(self);
}

- (void)setIcon:(id)a3
{
}

- (BOOL)useHomeKitRecommendations
{
  v2 = self;
  swift_retain();
  sub_2573213C8();

  swift_release();
  return v4;
}

- (void)setUseHomeKitRecommendations:(BOOL)a3
{
  v3 = self;
  swift_retain();
  sub_2573213D8();

  swift_release();
}

- (NSString)accessoriesAndScenes
{
  v2 = self;
  swift_retain();
  sub_2573213C8();

  swift_release();
  v3 = (void *)sub_2573217E8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setAccessoriesAndScenes:(id)a3
{
  sub_2573217F8();
  BOOL v4 = self;
  swift_retain();
  sub_2573213D8();

  swift_release();
}

- (NHOSmartStackActionIntent)init
{
  return (NHOSmartStackActionIntent *)NHOSmartStackActionIntent.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end