@interface DisclosureProvider
- (_TtC13callservicesd18DisclosureProvider)init;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
@end

@implementation DisclosureProvider

- (_TtC13callservicesd18DisclosureProvider)init
{
  return (_TtC13callservicesd18DisclosureProvider *)sub_100347B20();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd18DisclosureProvider_startDisclosureAudioPlayer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd18DisclosureProvider_stopDisclosureAudioPlayer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13callservicesd18DisclosureProvider_recurringDisclosureAudioPlayer);
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_100348A48(v5);
}

@end