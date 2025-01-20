@interface StereoOrientationProvider
- (_TtC10VoiceMemos25StereoOrientationProvider)init;
- (id)preferredDataSourceOrientation;
- (int64_t)preferredInputOrientationFor:(id)a3;
- (void)deviceOrientationDidUpdate:(id)a3;
- (void)interfaceOrientationDidUpdate:(int64_t)a3;
@end

@implementation StereoOrientationProvider

- (_TtC10VoiceMemos25StereoOrientationProvider)init
{
  return (_TtC10VoiceMemos25StereoOrientationProvider *)sub_10000F9F8();
}

- (void)deviceOrientationDidUpdate:(id)a3
{
  v5 = self;
  id v6 = a3;
  v9 = self;
  id v7 = [v5 currentDevice];
  v8 = (objc_class *)[v7 orientation];

  *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC10VoiceMemos25StereoOrientationProvider_deviceOrientation) = v8;
}

- (void)interfaceOrientationDidUpdate:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25StereoOrientationProvider_interfaceOrientation) = (Class)a3;
}

- (id)preferredDataSourceOrientation
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos25StereoOrientationProvider_deviceOrientation) == (Class)6) {
    v2 = (id *)&AVAudioSessionOrientationBack;
  }
  else {
    v2 = (id *)&AVAudioSessionOrientationFront;
  }
  return *v2;
}

- (int64_t)preferredInputOrientationFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_100147A68(v4);

  return v6;
}

@end