@interface NHOActionSetIntent
- (BOOL)useHomeKitRecommendations;
- (NHOActionSetIntent)init;
- (NSString)accessoriesAndScenes;
- (NSString)actionSetID;
- (NSString)actionSetName;
- (NSString)homeID;
- (NSString)homeName;
- (NSString)icon;
- (void)setAccessoriesAndScenes:(id)a3;
- (void)setActionSetID:(id)a3;
- (void)setActionSetName:(id)a3;
- (void)setHomeID:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setIcon:(id)a3;
- (void)setUseHomeKitRecommendations:(BOOL)a3;
@end

@implementation NHOActionSetIntent

- (NSString)homeID
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setHomeID:(id)a3
{
}

- (NSString)homeName
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setHomeName:(id)a3
{
}

- (NSString)actionSetID
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setActionSetID:(id)a3
{
}

- (NSString)actionSetName
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setActionSetName:(id)a3
{
}

- (NSString)icon
{
  return (NSString *)sub_257312AD8(self);
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
  return (NSString *)sub_257312AD8(self);
}

- (void)setAccessoriesAndScenes:(id)a3
{
}

- (NHOActionSetIntent)init
{
  return (NHOActionSetIntent *)NHOActionSetIntent.init()();
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