@interface DefaultVoiceSource
- (_TtC12TextToSpeech18DefaultVoiceSource)init;
- (void)resourceCacheDidReceiveUpdate;
@end

@implementation DefaultVoiceSource

- (_TtC12TextToSpeech18DefaultVoiceSource)init
{
  return (_TtC12TextToSpeech18DefaultVoiceSource *)DefaultVoiceSource.init()();
}

- (void)resourceCacheDidReceiveUpdate
{
  v3 = *(void (**)(uint64_t (*)(), _TtC12TextToSpeech18DefaultVoiceSource *))(**(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC12TextToSpeech18DefaultVoiceSource_debouncer)
                                                                                      + 184);
  swift_retain_n();
  v3(sub_1A6783DB8, self);
  swift_release_n();
}

@end