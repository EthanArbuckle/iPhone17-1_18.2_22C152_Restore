@interface MTLGPUDebugAccelerationStructureErrorLog
- (NSString)functionName;
- (id)description;
- (unint64_t)actualAccelerationStructureType;
- (unint64_t)expectedAccelerationStructureType;
- (void)dealloc;
- (void)setActualAccelerationStructureType:(unint64_t)a3;
- (void)setExpectedAccelerationStructureType:(unint64_t)a3;
- (void)setFunctionName:(id)a3;
@end

@implementation MTLGPUDebugAccelerationStructureErrorLog

- (id)description
{
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v5, [(MTLGPUDebugGPULog *)self function]);
  v3 = MTLAccelerationStructureStringFromType(self->_expectedAccelerationStructureType);
  return (id)[NSString stringWithFormat:@"Invalid Acceleration Structure type %@ bound to shader, expected %@, executing %@\n%@\n", MTLAccelerationStructureStringFromType(self->_actualAccelerationStructureType), v3, -[MTLGPUDebugGPULog functionDescription](self, "functionDescription"), -[MTLGPUDebugGPULog locationDescription](self, "locationDescription")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugAccelerationStructureErrorLog;
  [(MTLGPUDebugGPULog *)&v3 dealloc];
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (unint64_t)expectedAccelerationStructureType
{
  return self->_expectedAccelerationStructureType;
}

- (void)setExpectedAccelerationStructureType:(unint64_t)a3
{
  self->_expectedAccelerationStructureType = a3;
}

- (unint64_t)actualAccelerationStructureType
{
  return self->_actualAccelerationStructureType;
}

- (void)setActualAccelerationStructureType:(unint64_t)a3
{
  self->_actualAccelerationStructureType = a3;
}

@end