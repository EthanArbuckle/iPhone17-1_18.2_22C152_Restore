@interface SiriCallAnnouncementProvider
- (_TtC13callservicesd28SiriCallAnnouncementProvider)init;
- (void)propertiesDidChangeForConfiguration:(id)a3;
- (void)voiceOverObserver:(id)a3 didChangeEnabled:(BOOL)a4;
@end

@implementation SiriCallAnnouncementProvider

- (void)voiceOverObserver:(id)a3 didChangeEnabled:(BOOL)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_10034A2EC((uint64_t)v6, a4);
  swift_unknownObjectRelease();
}

- (void)propertiesDidChangeForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10034A618(v4);
}

- (_TtC13callservicesd28SiriCallAnnouncementProvider)init
{
}

- (void).cxx_destruct
{
  sub_1002BD990(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC13callservicesd28SiriCallAnnouncementProvider_activeDescriptor), *(void *)&self->activeDescriptor[OBJC_IVAR____TtC13callservicesd28SiriCallAnnouncementProvider_activeDescriptor], *(void *)&self->activeDescriptor[OBJC_IVAR____TtC13callservicesd28SiriCallAnnouncementProvider_activeDescriptor+ 8], *(void **)&self->activeDescriptor[OBJC_IVAR____TtC13callservicesd28SiriCallAnnouncementProvider_activeDescriptor+ 16], *(void **)&self->activeDescriptor[OBJC_IVAR____TtC13callservicesd28SiriCallAnnouncementProvider_activeDescriptor+ 24]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd28SiriCallAnnouncementProvider_userConfiguration));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13callservicesd28SiriCallAnnouncementProvider_voiceOverObserver);
}

@end