@interface TrackRunningCoordinator
- (BOOL)canShowTrackPrompt;
- (BOOL)didShowTrackPrompt;
- (BOOL)trackModeEnabled;
- (void)didUpdateKeyValueDomain:(id)a3;
- (void)reset;
- (void)setCanShowTrackPrompt:(BOOL)a3;
- (void)setDidShowTrackPrompt:(BOOL)a3;
- (void)setTrackModeEnabled:(BOOL)a3;
@end

@implementation TrackRunningCoordinator

- (BOOL)canShowTrackPrompt
{
  return self->canShowTrackPrompt[0];
}

- (void)setCanShowTrackPrompt:(BOOL)a3
{
  self->canShowTrackPrompt[0] = a3;
}

- (BOOL)didShowTrackPrompt
{
  return self->didShowTrackPrompt[0];
}

- (void)setDidShowTrackPrompt:(BOOL)a3
{
  self->didShowTrackPrompt[0] = a3;
}

- (BOOL)trackModeEnabled
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236C74C28();
  swift_release();
  swift_release();
  swift_release();
  return v3;
}

- (void)setTrackModeEnabled:(BOOL)a3
{
}

- (void)reset
{
  swift_retain();
  sub_236C115A0();

  swift_release();
}

- (void)didUpdateKeyValueDomain:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_236C12C40();
  swift_release();
}

@end