@interface CLDurianRoseCrashEvent
- (CLDurianRoseCrashEvent)init;
- (CLDurianRoseCrashEvent)initWithData:(id)a3;
- (NSString)crashString;
- (unsigned)core;
- (void)dealloc;
@end

@implementation CLDurianRoseCrashEvent

- (CLDurianRoseCrashEvent)init
{
  return 0;
}

- (CLDurianRoseCrashEvent)initWithData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianRoseCrashEvent;
  v4 = [(CLDurianRoseCrashEvent *)&v6 init];
  if (v4) {
    v4->_data = (NSData *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianRoseCrashEvent;
  [(CLDurianRoseCrashEvent *)&v3 dealloc];
}

- (unsigned)core
{
  return 0;
}

- (NSString)crashString
{
  id v2 = [objc_alloc((Class)NSString) initWithData:self->_data encoding:1];

  return (NSString *)v2;
}

@end