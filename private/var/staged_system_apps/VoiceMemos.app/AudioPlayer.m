@interface AudioPlayer
- (id)audioEngineOutputNodeAccessQueue;
- (int)fillNextBuffer:(AudioBufferList *)a3 frameCount:(int)a4;
- (void)audioRendererError:(id)a3;
- (void)audioRendererQueueEmpty;
- (void)audioRendererWasInterrupted;
@end

@implementation AudioPlayer

- (int)fillNextBuffer:(AudioBufferList *)a3 frameCount:(int)a4
{
  swift_retain();
  int v6 = AudioPlayer.fillNextBuffer(_:frameCount:)(a3, a4);
  swift_release();
  return v6;
}

- (id)audioEngineOutputNodeAccessQueue
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v3 = (void *)Strong;
    swift_retain();
    id v4 = [v3 audioEngineOutputNodeAccessQueue];
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)audioRendererQueueEmpty
{
}

- (void)audioRendererError:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v5 = (void *)Strong;
    id v6 = a3;
    swift_retain();
    id v7 = (id)_convertErrorToNSError(_:)();
    [v5 audioPlayerError:v7];
    swift_release();

    swift_unknownObjectRelease();
  }
}

- (void)audioRendererWasInterrupted
{
}

@end