@interface JSRadioPlaybackIntent
@end

@implementation JSRadioPlaybackIntent

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore21JSRadioPlaybackIntent_radioStationStoreItemMetadata));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicJSCore21JSRadioPlaybackIntent_radioStationIdentifierSet);
}

@end