@interface JSPlatform
- (JSValue)is24HourClockEnabled;
- (JSValue)isDebugOrInternalBuild;
- (_TtC7MusicUI10JSPlatform)init;
- (void)setIs24HourClockEnabled:(id)a3;
- (void)setIsDebugOrInternalBuild:(id)a3;
@end

@implementation JSPlatform

- (JSValue)isDebugOrInternalBuild
{
  v2 = self;
  v3 = (void *)sub_229B203D8();

  return (JSValue *)v3;
}

- (void)setIsDebugOrInternalBuild:(id)a3
{
}

- (JSValue)is24HourClockEnabled
{
  v2 = self;
  v3 = (void *)sub_229B203D8();

  return (JSValue *)v3;
}

- (void)setIs24HourClockEnabled:(id)a3
{
}

- (_TtC7MusicUI10JSPlatform)init
{
  return (_TtC7MusicUI10JSPlatform *)sub_229B206BC();
}

@end