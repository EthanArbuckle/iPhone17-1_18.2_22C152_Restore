@interface JSThread
- (void)_scriptingThreadMain;
@end

@implementation JSThread

- (void)_scriptingThreadMain
{
  swift_retain();
  sub_100D31F38();

  swift_release();
}

@end