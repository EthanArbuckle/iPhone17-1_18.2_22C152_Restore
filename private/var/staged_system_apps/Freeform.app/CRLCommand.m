@interface CRLCommand
- (BOOL)shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup;
- (_TtC8Freeform10CRLCommand)init;
- (void)setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:(BOOL)a3;
@end

@implementation CRLCommand

- (BOOL)shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform10CRLCommand_shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup);
}

- (void)setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform10CRLCommand_shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup) = a3;
}

- (_TtC8Freeform10CRLCommand)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform10CRLCommand_committed) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform10CRLCommand_shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLCommand();
  return [(CRLCommand *)&v3 init];
}

@end