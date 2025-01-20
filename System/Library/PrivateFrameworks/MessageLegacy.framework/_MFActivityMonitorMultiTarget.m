@interface _MFActivityMonitorMultiTarget
- (BOOL)addActivityTarget:(id)a3;
- (BOOL)removeActivityTarget:(id)a3;
- (id)allTargets;
- (id)displayName;
- (id)primaryTarget;
- (void)dealloc;
- (void)setPrimaryTarget:(id)a3;
@end

@implementation _MFActivityMonitorMultiTarget

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MFActivityMonitorMultiTarget;
  [(_MFActivityMonitorMultiTarget *)&v3 dealloc];
}

- (BOOL)addActivityTarget:(id)a3
{
  allTargets = self->_allTargets;
  if (!allTargets)
  {
    allTargets = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    self->_allTargets = allTargets;
  }
  char v6 = [(NSMutableSet *)allTargets containsObject:a3];
  if ((v6 & 1) == 0) {
    [(NSMutableSet *)self->_allTargets addObject:a3];
  }
  return v6 ^ 1;
}

- (BOOL)removeActivityTarget:(id)a3
{
  allTargets = self->_allTargets;
  if (allTargets)
  {
    LODWORD(allTargets) = -[NSMutableSet containsObject:](allTargets, "containsObject:");
    if (allTargets)
    {
      [(NSMutableSet *)self->_allTargets removeObject:a3];
      if (self->_primaryTarget == a3) {
        [(_MFActivityMonitorMultiTarget *)self setPrimaryTarget:0];
      }
      LOBYTE(allTargets) = 1;
    }
  }
  return (char)allTargets;
}

- (id)primaryTarget
{
  return self->_primaryTarget;
}

- (void)setPrimaryTarget:(id)a3
{
  id v5 = a3;

  self->_primaryTarget = a3;
}

- (id)allTargets
{
  return (id)[(NSMutableSet *)self->_allTargets allObjects];
}

- (id)displayName
{
  if (!self->_primaryTarget || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id primaryTarget = self->_primaryTarget;
  return (id)[primaryTarget displayName];
}

@end