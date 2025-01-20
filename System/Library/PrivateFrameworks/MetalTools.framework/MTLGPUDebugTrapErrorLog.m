@interface MTLGPUDebugTrapErrorLog
- (NSString)functionName;
- (id)description;
- (void)dealloc;
- (void)setFunctionName:(id)a3;
@end

@implementation MTLGPUDebugTrapErrorLog

- (id)description
{
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v4, [(MTLGPUDebugGPULog *)self function]);
  return (id)[NSString stringWithFormat:@"Trap hit in %@\n%@", -[MTLGPUDebugGPULog functionDescription](self, "functionDescription"), -[MTLGPUDebugGPULog locationDescription](self, "locationDescription")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugTrapErrorLog;
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