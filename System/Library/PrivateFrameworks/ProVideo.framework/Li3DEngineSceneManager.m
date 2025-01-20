@interface Li3DEngineSceneManager
- (BOOL)applyForce:(const void *)a3 node:(id)a4 arScale:(float)a5 objects:(void *)a6;
- (BOOL)hasAppliedForce:(id)a3;
- (Li3DEngineSceneManager)init;
- (NSMutableSet)appliedForces;
- (void)resetSim;
@end

@implementation Li3DEngineSceneManager

- (Li3DEngineSceneManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)Li3DEngineSceneManager;
  v2 = [(Li3DEngineSceneManager *)&v4 init];
  if (v2) {
    v2->_appliedForces = (NSMutableSet *)objc_opt_new();
  }
  return v2;
}

- (void)resetSim
{
  v2 = [(Li3DEngineSceneManager *)self appliedForces];

  [(NSMutableSet *)v2 removeAllObjects];
}

- (BOOL)hasAppliedForce:(id)a3
{
  objc_super v4 = [(Li3DEngineSceneManager *)self appliedForces];

  return [(NSMutableSet *)v4 containsObject:a3];
}

- (BOOL)applyForce:(const void *)a3 node:(id)a4 arScale:(float)a5 objects:(void *)a6
{
  if (*((double *)a3 + 5) == 0.0
    || !*((void *)a3 + 6)
    || *(unsigned char *)a3 && -[Li3DEngineSceneManager hasAppliedForce:](self, "hasAppliedForce:"))
  {
    return 0;
  }
  LiPhysicsUtils::ApplyForce((uint64_t)a3, a4, (uint64_t)a6, a5);
  [(NSMutableSet *)[(Li3DEngineSceneManager *)self appliedForces] addObject:*((void *)a3 + 6)];
  return 1;
}

- (NSMutableSet)appliedForces
{
  return self->_appliedForces;
}

@end