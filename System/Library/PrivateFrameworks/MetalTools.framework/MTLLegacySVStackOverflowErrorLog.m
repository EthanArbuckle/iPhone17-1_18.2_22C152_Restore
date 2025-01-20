@interface MTLLegacySVStackOverflowErrorLog
- (NSString)functionName;
- (id)description;
- (void)dealloc;
- (void)setFunctionName:(id)a3;
@end

@implementation MTLLegacySVStackOverflowErrorLog

- (id)description
{
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v4, [(MTLLegacySVGPULog *)self function]);
  return (id)[NSString stringWithFormat:@"Stack Overflow executing %@", -[MTLLegacySVGPULog locationDescription](self, "locationDescription")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVStackOverflowErrorLog;
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