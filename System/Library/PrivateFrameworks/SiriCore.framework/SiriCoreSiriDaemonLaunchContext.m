@interface SiriCoreSiriDaemonLaunchContext
- (SiriCoreSiriDaemonLaunchContext)initWithLaunchArguments:(id)a3;
- (int64_t)daemonType;
- (void)setDaemonType:(int64_t)a3;
@end

@implementation SiriCoreSiriDaemonLaunchContext

- (void)setDaemonType:(int64_t)a3
{
  self->_daemonType = a3;
}

- (int64_t)daemonType
{
  return self->_daemonType;
}

- (SiriCoreSiriDaemonLaunchContext)initWithLaunchArguments:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriCoreSiriDaemonLaunchContext;
  v3 = [(SiriCoreSiriDaemonLaunchContext *)&v6 init];
  v4 = v3;
  if (v3) {
    [(SiriCoreSiriDaemonLaunchContext *)v3 setDaemonType:1];
  }
  return v4;
}

@end