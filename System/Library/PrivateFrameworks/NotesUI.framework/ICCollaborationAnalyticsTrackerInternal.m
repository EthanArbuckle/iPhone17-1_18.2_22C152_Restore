@interface ICCollaborationAnalyticsTrackerInternal
- (ICCollaborationAnalyticsTrackerInternal)init;
- (ICCollaborationAnalyticsTrackerInternal)initWithDelegate:(id)a3;
- (void)dealloc;
- (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7;
- (void)saveNewShare:(id)a3 forNote:(id)a4;
- (void)trackShare:(id)a3 forNote:(id)a4;
- (void)unshareNote:(id)a3;
@end

@implementation ICCollaborationAnalyticsTrackerInternal

- (ICCollaborationAnalyticsTrackerInternal)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (ICCollaborationAnalyticsTrackerInternal *)sub_1B0A9A4E0((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)trackShare:(id)a3 forNote:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  ICCollaborationAnalyticsTrackerInternal.track(share:note:)(a3, v8);
}

- (void)saveNewShare:(id)a3 forNote:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  ICCollaborationAnalyticsTrackerInternal.save(newShare:note:)(v6, v7);
}

- (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7
{
  BOOL v8 = a6;
  if (a3)
  {
    uint64_t v12 = sub_1B0B8240C();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  id v15 = a5;
  id v16 = a7;
  v17 = self;
  ICCollaborationAnalyticsTrackerInternal.save(activityType:collaborationSelected:error:completed:note:)(v12, v14, a4, a5, v8, v16);

  swift_bridgeObjectRelease();
}

- (void)unshareNote:(id)a3
{
  id v4 = a3;
  v5 = self;
  ICCollaborationAnalyticsTrackerInternal.unshare(note:)(v4);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  id v4 = self;
  unint64_t v5 = swift_bridgeObjectRetain();
  sub_1B0A96734(v5);
  swift_bridgeObjectRelease();
  v6.receiver = v4;
  v6.super_class = ObjectType;
  [(ICCollaborationAnalyticsTrackerInternal *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationAnalyticsTrackerInternal_shareAnalyticsQueue);
}

- (ICCollaborationAnalyticsTrackerInternal)init
{
  result = (ICCollaborationAnalyticsTrackerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end