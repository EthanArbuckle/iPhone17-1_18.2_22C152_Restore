@interface STMirroringMonitorStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)exists;
- (BOOL)running;
- (STMirroringMonitorStatus)initWithCoder:(id)a3;
- (STMirroringMonitorStatus)initWithInstanceExists:(BOOL)a3 instanceRunning:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMirroringMonitorStatus

- (STMirroringMonitorStatus)initWithInstanceExists:(BOOL)a3 instanceRunning:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STMirroringMonitorStatus;
  result = [(STMirroringMonitorStatus *)&v7 init];
  if (result)
  {
    result->_exists = a3;
    result->_running = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STMirroringMonitorStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STMirroringMonitorStatus;
  v5 = [(STMirroringMonitorStatus *)&v7 init];
  if (v5)
  {
    v5->_exists = [v4 decodeBoolForKey:@"exists"];
    v5->_running = [v4 decodeBoolForKey:@"running"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL exists = self->_exists;
  id v5 = a3;
  [v5 encodeBool:exists forKey:@"exists"];
  [v5 encodeBool:self->_running forKey:@"running"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  BOOL exists = self->_exists;
  BOOL running = self->_running;
  return [v4 initWithInstanceExists:exists instanceRunning:running];
}

- (BOOL)exists
{
  return self->_exists;
}

- (BOOL)running
{
  return self->_running;
}

@end