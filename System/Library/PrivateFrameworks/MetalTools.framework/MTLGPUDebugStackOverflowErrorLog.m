@interface MTLGPUDebugStackOverflowErrorLog
- (NSString)functionName;
- (id)description;
- (void)dealloc;
- (void)setFunctionName:(id)a3;
@end

@implementation MTLGPUDebugStackOverflowErrorLog

- (id)description
{
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v4, [(MTLGPUDebugGPULog *)self function]);
  return (id)[NSString stringWithFormat:@"Stack Overflow executing %@\n%@", -[MTLGPUDebugGPULog functionDescription](self, "functionDescription"), -[MTLGPUDebugGPULog locationDescription](self, "locationDescription")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugStackOverflowErrorLog;
  [(MTLGPUDebugGPULog *)&v3 dealloc];
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

@end