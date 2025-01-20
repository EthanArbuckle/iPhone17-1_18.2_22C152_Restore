@interface MTLLegacySVTrapErrorLog
- (NSString)functionName;
- (id)description;
- (void)dealloc;
- (void)setFunctionName:(id)a3;
@end

@implementation MTLLegacySVTrapErrorLog

- (id)description
{
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v4, [(MTLLegacySVGPULog *)self function]);
  return (id)[NSString stringWithFormat:@"Trap hit in %@", -[MTLLegacySVGPULog locationDescription](self, "locationDescription")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVTrapErrorLog;
  [(MTLLegacySVGPULog *)&v3 dealloc];
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

@end