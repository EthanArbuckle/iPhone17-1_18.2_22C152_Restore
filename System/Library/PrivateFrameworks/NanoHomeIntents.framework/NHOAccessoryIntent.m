@interface NHOAccessoryIntent
- (BOOL)useHomeKitRecommendations;
- (NHOAccessoryIntent)init;
- (NSString)accessoriesAndScenes;
- (NSString)accessoryID;
- (NSString)accessoryName;
- (NSString)description;
- (NSString)homeID;
- (NSString)homeName;
- (NSString)icon;
- (NSString)serviceType;
- (void)setAccessoriesAndScenes:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setHomeID:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setIcon:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setUseHomeKitRecommendations:(BOOL)a3;
@end

@implementation NHOAccessoryIntent

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

- (NSString)accessoryID
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setAccessoryID:(id)a3
{
}

- (NSString)accessoryName
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setAccessoryName:(id)a3
{
}

- (NSString)icon
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setIcon:(id)a3
{
}

- (NSString)serviceType
{
  return (NSString *)sub_257312AD8(self);
}

- (void)setServiceType:(id)a3
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

- (NHOAccessoryIntent)init
{
  return (NHOAccessoryIntent *)NHOAccessoryIntent.init()();
}

- (NSString)description
{
  v2 = self;
  NHOAccessoryIntent.description.getter();

  v3 = (void *)sub_2573217E8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
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