@interface JSThread
- (void)_scriptingThreadMain;
@end

@implementation JSThread

- (void)_scriptingThreadMain
{
  swift_retain();
  sub_10000B5E8();

  swift_release();
}

@end