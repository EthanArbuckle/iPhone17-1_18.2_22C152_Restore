@interface ICClearActivityCachesActivity
- (ICClearActivityCachesActivity)init;
- (ICClearActivityCachesActivity)initWithNote:(id)a3;
- (ICClearActivityCachesActivity)initWithPerformActivity:(id)a3;
- (ICNote)note;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (void)performActivityWithCompletion:(id)a3;
@end

@implementation ICClearActivityCachesActivity

- (ICNote)note
{
  return (ICNote *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICClearActivityCachesActivity_note];
}

- (ICClearActivityCachesActivity)initWithNote:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->ICActivity_opaque[OBJC_IVAR___ICClearActivityCachesActivity_note] = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(ICClearActivityCachesActivity *)&v8 init];
}

- (UIImage)activityImage
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self systemImageNamed:v3];

  return (UIImage *)v4;
}

- (NSString)activityTitle
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)activityType
{
  NSString v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    id v4 = sub_100262970;
  }
  v5 = *(void **)&self->ICActivity_opaque[OBJC_IVAR___ICClearActivityCachesActivity_note];
  objc_super v8 = self;
  [v5 clearReplicaIDsToNotesVersion];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 updateChangeCountWithReason:v6];

  id v7 = [v5 managedObjectContext];
  [v7 ic_save];

  [(ICClearActivityCachesActivity *)v8 activityDidFinish:1];
  sub_10002E70C((uint64_t)v4);
}

- (ICClearActivityCachesActivity)initWithPerformActivity:(id)a3
{
  _Block_copy(a3);
  result = (ICClearActivityCachesActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICClearActivityCachesActivity)init
{
  result = (ICClearActivityCachesActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end