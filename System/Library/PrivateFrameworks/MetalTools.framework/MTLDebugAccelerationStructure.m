@interface MTLDebugAccelerationStructure
- (BOOL)purgeableStateValidForRendering;
- (MTLDebugAccelerationStructure)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLDebugAccelerationStructure)initWithBaseObject:(id)a3 parent:(id)a4 heap:(id)a5;
- (id)buffer;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (void)dealloc;
- (void)lockPurgeableState;
- (void)unlockPurgeableState;
@end

@implementation MTLDebugAccelerationStructure

- (id)buffer
{
  return self->_debugBuffer;
}

- (MTLDebugAccelerationStructure)initWithBaseObject:(id)a3 parent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugAccelerationStructure;
  v6 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_);
  v7 = v6;
  if (v6)
  {
    atomic_store(0, (unsigned int *)&v6->_purgeableStateToken);
    v6->_purgeableStateHasBeenSet = 0;
    v8 = (void *)[a3 buffer];
    if (v8) {
      v7->_debugBuffer = -[MTLDebugBuffer initWithBuffer:device:options:]([MTLDebugBuffer alloc], "initWithBuffer:device:options:", v8, a4, [v8 resourceOptions]);
    }
  }
  return v7;
}

- (MTLDebugAccelerationStructure)initWithBaseObject:(id)a3 parent:(id)a4 heap:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugAccelerationStructure;
  v8 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:heap:](&v12, sel_initWithBaseObject_parent_heap_);
  v9 = v8;
  if (v8)
  {
    atomic_store(0, (unsigned int *)&v8->_purgeableStateToken);
    v8->_purgeableStateHasBeenSet = 0;
    objc_super v10 = (void *)[a3 buffer];
    if (v10) {
      v9->_debugBuffer = -[MTLDebugBuffer initWithBuffer:heap:device:options:]([MTLDebugBuffer alloc], "initWithBuffer:heap:device:options:", v10, a5, a4, [v10 resourceOptions]);
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugAccelerationStructure;
  [(MTLToolsAccelerationStructure *)&v3 dealloc];
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heap")) {
    MTLReportFailure();
  }
  if (a3 != 1)
  {
    if (a3 != 2)
    {
      if (atomic_load((unsigned int *)&self->_purgeableStateToken)) {
        MTLReportFailure();
      }
    }
    self->_purgeableStateHasBeenSet = 1;
  }
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 setPurgeableState:a3];
}

- (void)lockPurgeableState
{
}

- (void)unlockPurgeableState
{
}

- (BOOL)purgeableStateValidForRendering
{
  return !self->_purgeableStateHasBeenSet
      || [(MTLDebugAccelerationStructure *)self setPurgeableState:1] == 2;
}

- (id)formattedDescription:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLDebugAccelerationStructure;
  return [(MTLToolsObject *)&v4 description];
}

- (id)description
{
  return [(MTLDebugAccelerationStructure *)self formattedDescription:0];
}

@end