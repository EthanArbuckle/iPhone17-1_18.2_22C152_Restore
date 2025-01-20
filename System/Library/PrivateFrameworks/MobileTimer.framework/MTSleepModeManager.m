@interface MTSleepModeManager
- (BOOL)isEnabled;
- (MTSleepModeManager)initWithDelegate:(id)a3;
- (MTSleepModeManager)initWithDelegate:(id)a3 isSynchronous:(BOOL)a4;
@end

@implementation MTSleepModeManager

- (MTSleepModeManager)initWithDelegate:(id)a3
{
  return [(MTSleepModeManager *)self initWithDelegate:a3 isSynchronous:0];
}

- (MTSleepModeManager)initWithDelegate:(id)a3 isSynchronous:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTSleepModeManager;
  return [(MTSleepModeManager *)&v5 init];
}

- (BOOL)isEnabled
{
  return 0;
}

@end