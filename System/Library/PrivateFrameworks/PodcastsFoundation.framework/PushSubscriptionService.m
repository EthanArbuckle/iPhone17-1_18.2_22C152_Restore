@interface PushSubscriptionService
- (_TtC18PodcastsFoundation23PushSubscriptionService)init;
@end

@implementation PushSubscriptionService

- (_TtC18PodcastsFoundation23PushSubscriptionService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionService____lazy_storage___urlRequestService) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(PushSubscriptionService *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation23PushSubscriptionService____lazy_storage___urlRequestService));
}

@end