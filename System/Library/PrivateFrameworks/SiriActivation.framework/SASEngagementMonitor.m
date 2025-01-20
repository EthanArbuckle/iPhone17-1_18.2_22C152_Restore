@interface SASEngagementMonitor
- (SASEngagementMonitor)init;
- (SASUserEngagementContext)currentEngagementContext;
- (void)dealloc;
- (void)setCurrentEngagementContext:(id)a3;
- (void)stop;
@end

@implementation SASEngagementMonitor

- (SASUserEngagementContext)currentEngagementContext
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___SASEngagementMonitor_currentEngagementContext);
  swift_beginAccess();
  return (SASUserEngagementContext *)*v2;
}

- (void)setCurrentEngagementContext:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___SASEngagementMonitor_currentEngagementContext);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)dealloc
{
  v2 = self;
  EngagementMonitor.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)stop
{
  v2 = self;
  sub_1D95CE13C();
}

- (SASEngagementMonitor)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SASEngagementMonitor_currentEngagementContext) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SASEngagementMonitor_task) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EngagementMonitor();
  return [(SASEngagementMonitor *)&v3 init];
}

@end