@interface AudioPlayer
- (_TtC14SiriMessagesUI11AudioPlayer)init;
- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
@end

@implementation AudioPlayer

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_25D5EEA38();
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_25D5EEBB0((uint64_t)v8, a4);
}

- (_TtC14SiriMessagesUI11AudioPlayer)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14SiriMessagesUI11AudioPlayer___observationRegistrar;
  uint64_t v4 = sub_25D677990();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end