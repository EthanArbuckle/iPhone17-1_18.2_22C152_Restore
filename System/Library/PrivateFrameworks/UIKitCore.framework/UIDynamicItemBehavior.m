@interface UIDynamicItemBehavior
+ (BOOL)_isPrimitiveBehavior;
- (BOOL)_rotationEnabledForItem:(id)a3;
- (BOOL)allowsRotation;
- (BOOL)isAnchored;
- (BOOL)useDefaultViewPropertiesApplier;
- (CGFloat)angularResistance;
- (CGFloat)angularVelocityForItem:(id)item;
- (CGFloat)charge;
- (CGFloat)density;
- (CGFloat)elasticity;
- (CGFloat)friction;
- (CGFloat)resistance;
- (CGPoint)_positionForItem:(id)a3;
- (CGPoint)linearVelocityForItem:(id)item;
- (NSArray)items;
- (UIDynamicItemBehavior)init;
- (UIDynamicItemBehavior)initWithItems:(NSArray *)items;
- (double)_angleForItem:(id)a3;
- (double)_angularResistanceForItem:(id)a3;
- (double)_densityForItem:(id)a3;
- (double)_elasticityForItem:(id)a3;
- (double)_frictionForItem:(id)a3;
- (double)_massForItem:(id)a3;
- (double)_resistanceForItem:(id)a3;
- (id)description;
- (void)_associate;
- (void)_configureBody:(id)a3 forView:(id)a4;
- (void)_dissociate;
- (void)_reevaluate:(unint64_t)a3;
- (void)_setAngle:(double)a3 forItem:(id)a4;
- (void)_setPosition:(CGPoint)a3 forItem:(id)a4;
- (void)addAngularVelocity:(CGFloat)velocity forItem:(id)item;
- (void)addItem:(id)item;
- (void)addLinearVelocity:(CGPoint)velocity forItem:(id)item;
- (void)applyImpulse:(CGPoint)a3 toItem:(id)a4;
- (void)removeItem:(id)item;
- (void)setAllowsRotation:(BOOL)allowsRotation;
- (void)setAnchored:(BOOL)anchored;
- (void)setAngularResistance:(CGFloat)angularResistance;
- (void)setCharge:(CGFloat)charge;
- (void)setDensity:(CGFloat)density;
- (void)setElasticity:(CGFloat)elasticity;
- (void)setFriction:(CGFloat)friction;
- (void)setResistance:(CGFloat)resistance;
- (void)setUseDefaultViewPropertiesApplier:(BOOL)a3;
@end

@implementation UIDynamicItemBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UIDynamicItemBehavior)init
{
  return [(UIDynamicItemBehavior *)self initWithItems:MEMORY[0x1E4F1CBF0]];
}

- (UIDynamicItemBehavior)initWithItems:(NSArray *)items
{
  v4 = items;
  v9.receiver = self;
  v9.super_class = (Class)UIDynamicItemBehavior;
  v5 = [(UIDynamicBehavior *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_elasticity = 0.2;
    v5->_friction = 0.2;
    v5->_density = 1.0;
    v5->_resistance = 0.1;
    v5->_angularResistance = 0.1;
    v5->_allowsRotation = 1;
    v5->_useDefaultViewPropertiesApplier = 1;
    v5->_anchored = 0;
    v5->_charge = 0.0;
    v7 = (void *)[(NSArray *)v4 mutableCopy];
    [(UIDynamicBehavior *)v6 _setItems:v7];
  }
  return v6;
}

- (void)_configureBody:(id)a3 forView:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  __int16 stateFlags = (__int16)self->_stateFlags;
  if (stateFlags)
  {
    [(UIDynamicItemBehavior *)self elasticity];
    objc_msgSend(v8, "setRestitution:");
    __int16 stateFlags = (__int16)self->_stateFlags;
    if ((stateFlags & 2) == 0)
    {
LABEL_3:
      if ((stateFlags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((stateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  [(UIDynamicItemBehavior *)self friction];
  objc_msgSend(v8, "setFriction:");
  __int16 stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 4) == 0)
  {
LABEL_4:
    if ((stateFlags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [(UIDynamicItemBehavior *)self density];
  objc_msgSend(v8, "setNormalizedDensity:");
  __int16 stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 8) == 0)
  {
LABEL_5:
    if ((stateFlags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [(UIDynamicItemBehavior *)self resistance];
  objc_msgSend(v8, "setLinearDamping:");
  __int16 stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 0x10) == 0)
  {
LABEL_6:
    if ((stateFlags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [(UIDynamicItemBehavior *)self angularResistance];
  objc_msgSend(v8, "setAngularDamping:");
  __int16 stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 0x20) == 0)
  {
LABEL_7:
    if ((stateFlags & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v8, "setAllowsRotation:", -[UIDynamicItemBehavior allowsRotation](self, "allowsRotation"));
  __int16 stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 0x100) == 0)
  {
LABEL_8:
    if ((stateFlags & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  objc_msgSend(v8, "setDynamic:", -[UIDynamicItemBehavior isAnchored](self, "isAnchored") ^ 1);
  if ((*(_WORD *)&self->_stateFlags & 0x80) != 0)
  {
LABEL_9:
    [(UIDynamicItemBehavior *)self charge];
    objc_msgSend(v8, "setCharge:");
  }
LABEL_10:
}

- (void)addItem:(id)item
{
  id v10 = item;
  v4 = [(UIDynamicBehavior *)self _items];
  char v5 = [v4 containsObject:v10];

  if ((v5 & 1) == 0)
  {
    [(UIDynamicBehavior *)self _addItem:v10];
    id v6 = [(UIDynamicBehavior *)self _context];

    if (v6)
    {
      v7 = [(UIDynamicBehavior *)self _context];
      id v8 = [v7 _registerBodyForItem:v10];

      [(UIDynamicItemBehavior *)self _configureBody:v8 forView:v10];
      objc_super v9 = [(UIDynamicBehavior *)self _context];
      [v9 _shouldReevaluateLocalBehaviors];
    }
  }
}

- (void)removeItem:(id)item
{
  id v9 = item;
  v4 = [(UIDynamicBehavior *)self _items];
  int v5 = [v4 containsObject:v9];

  if (v5)
  {
    id v6 = [(UIDynamicBehavior *)self _context];

    if (v6)
    {
      v7 = [(UIDynamicBehavior *)self _context];
      [v7 _unregisterBodyForItem:v9 action:0];

      id v8 = [(UIDynamicBehavior *)self _context];
      [v8 _shouldReevaluateLocalBehaviors];
    }
    [(NSMapTable *)self->_cachedLinearVelocities removeObjectForKey:v9];
    [(NSMapTable *)self->_cachedAngularVelocities removeObjectForKey:v9];
    [(UIDynamicBehavior *)self _removeItem:v9];
  }
}

- (NSArray)items
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIDynamicBehavior *)self _items];
  v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (void)setElasticity:(CGFloat)elasticity
{
  if (self->_elasticity != elasticity)
  {
    self->_elasticity = elasticity;
    *(_WORD *)&self->_stateFlags |= 1u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)setFriction:(CGFloat)friction
{
  if (self->_friction != friction)
  {
    self->_friction = friction;
    *(_WORD *)&self->_stateFlags |= 2u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)setDensity:(CGFloat)density
{
  if (self->_density != density)
  {
    self->_density = density;
    *(_WORD *)&self->_stateFlags |= 4u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)setResistance:(CGFloat)resistance
{
  if (self->_resistance != resistance)
  {
    self->_resistance = resistance;
    *(_WORD *)&self->_stateFlags |= 8u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)setAngularResistance:(CGFloat)angularResistance
{
  if (self->_angularResistance != angularResistance)
  {
    self->_angularResistance = angularResistance;
    *(_WORD *)&self->_stateFlags |= 0x10u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)setAnchored:(BOOL)anchored
{
  if (self->_anchored != anchored)
  {
    self->_anchored = anchored;
    *(_WORD *)&self->_stateFlags |= 0x100u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)setCharge:(CGFloat)charge
{
  if (self->_charge != charge)
  {
    self->_charge = charge;
    *(_WORD *)&self->_stateFlags |= 0x80u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)setAllowsRotation:(BOOL)allowsRotation
{
  if (self->_allowsRotation != allowsRotation)
  {
    self->_allowsRotation = allowsRotation;
    *(_WORD *)&self->_stateFlags |= 0x20u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (void)addLinearVelocity:(CGPoint)velocity forItem:(id)item
{
  double y = velocity.y;
  double x = velocity.x;
  id v7 = item;
  if (x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    id v28 = v7;
    id v9 = [(UIDynamicBehavior *)self _items];
    int v10 = [v9 containsObject:v28];

    id v7 = v28;
    if (v10)
    {
      v11 = [(UIDynamicBehavior *)self _context];

      if (v11)
      {
        v12 = [(UIDynamicBehavior *)self _context];
        v13 = [v12 _bodyForItem:v28];

        [v13 velocity];
        double v15 = x + v14;
        [v13 velocity];
        objc_msgSend(v13, "setVelocity:", v15, y + v16);
        [(UIDynamicBehavior *)self _changedParameterForBody:v13];
      }
      else
      {
        cachedLinearVelocities = self->_cachedLinearVelocities;
        if (!cachedLinearVelocities)
        {
          v18 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:0];
          v19 = self->_cachedLinearVelocities;
          self->_cachedLinearVelocities = v18;

          cachedLinearVelocities = self->_cachedLinearVelocities;
        }
        v20 = [(NSMapTable *)cachedLinearVelocities objectForKey:v28];
        v13 = v20;
        if (v20)
        {
          [v20 CGPointValue];
          double v22 = x + v21;
          double v24 = y + v23;
          v25 = self->_cachedLinearVelocities;
          v26 = (void *)MEMORY[0x1E4F29238];
        }
        else
        {
          v25 = self->_cachedLinearVelocities;
          v26 = (void *)MEMORY[0x1E4F29238];
          double v22 = x;
          double v24 = y;
        }
        v27 = objc_msgSend(v26, "valueWithCGPoint:", v22, v24);
        [(NSMapTable *)v25 setObject:v27 forKey:v28];
      }
      id v7 = v28;
    }
  }
}

- (CGPoint)linearVelocityForItem:(id)item
{
  id v4 = item;
  int v5 = [(UIDynamicBehavior *)self _items];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(UIDynamicBehavior *)self _context];
    id v8 = [v7 _bodyForItem:v4];

    [v8 velocity];
    double v10 = v9;
    [v8 velocity];
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)_setPosition:(CGPoint)a3 forItem:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(UIDynamicBehavior *)self _context];
  id v9 = [v8 _bodyForItem:v7];

  objc_msgSend(v9, "setPosition:", x, y);
  [(UIDynamicBehavior *)self _changedParameterForBody:v9];
}

- (CGPoint)_positionForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  char v6 = [v5 _bodyForItem:v4];

  [v6 position];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)_setAngle:(double)a3 forItem:(id)a4
{
  id v6 = a4;
  double v7 = [(UIDynamicBehavior *)self _context];
  id v8 = [v7 _bodyForItem:v6];

  [v8 setRotation:a3];
  [(UIDynamicBehavior *)self _changedParameterForBody:v8];
}

- (double)_angleForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  id v6 = [v5 _bodyForItem:v4];

  [v6 rotation];
  double v8 = v7;

  return v8;
}

- (void)addAngularVelocity:(CGFloat)velocity forItem:(id)item
{
  id v6 = item;
  if (velocity != 0.0)
  {
    id v21 = v6;
    double v7 = [(UIDynamicBehavior *)self _items];
    int v8 = [v7 containsObject:v21];

    id v6 = v21;
    if (v8)
    {
      double v9 = [(UIDynamicBehavior *)self _context];

      if (v9)
      {
        double v10 = [(UIDynamicBehavior *)self _context];
        double v11 = [v10 _bodyForItem:v21];

        [v11 angularVelocity];
        [v11 setAngularVelocity:v12 + velocity];
        [(UIDynamicBehavior *)self _changedParameterForBody:v11];
      }
      else
      {
        cachedAngularVelocities = self->_cachedAngularVelocities;
        if (!cachedAngularVelocities)
        {
          double v14 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:512 capacity:0];
          double v15 = self->_cachedAngularVelocities;
          self->_cachedAngularVelocities = v14;

          cachedAngularVelocities = self->_cachedAngularVelocities;
        }
        double v16 = [(NSMapTable *)cachedAngularVelocities objectForKey:v21];
        [v16 floatValue];
        CGFloat v18 = v17 + velocity;

        v19 = self->_cachedAngularVelocities;
        *(float *)&double v20 = v18;
        double v11 = [NSNumber numberWithFloat:v20];
        [(NSMapTable *)v19 setObject:v11 forKey:v21];
      }

      id v6 = v21;
    }
  }
}

- (CGFloat)angularVelocityForItem:(id)item
{
  id v4 = item;
  int v5 = [(UIDynamicBehavior *)self _items];
  int v6 = [v5 containsObject:v4];

  double v7 = 0.0;
  if (v6)
  {
    int v8 = [(UIDynamicBehavior *)self _context];
    double v9 = [v8 _bodyForItem:v4];

    [v9 angularVelocity];
    double v7 = v10;
  }
  return v7;
}

- (double)_elasticityForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  int v6 = [v5 _bodyForItem:v4];

  [v6 restitution];
  double v8 = v7;

  return v8;
}

- (double)_frictionForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  int v6 = [v5 _bodyForItem:v4];

  [v6 friction];
  double v8 = v7;

  return v8;
}

- (double)_densityForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  int v6 = [v5 _bodyForItem:v4];

  [v6 normalizedDensity];
  double v8 = v7;

  return v8;
}

- (double)_resistanceForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  int v6 = [v5 _bodyForItem:v4];

  [v6 linearDamping];
  double v8 = v7;

  return v8;
}

- (double)_angularResistanceForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  int v6 = [v5 _bodyForItem:v4];

  [v6 angularDamping];
  double v8 = v7;

  return v8;
}

- (double)_massForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  int v6 = [v5 _bodyForItem:v4];

  [v6 mass];
  double v8 = v7;

  return v8;
}

- (BOOL)_rotationEnabledForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(UIDynamicBehavior *)self _context];
  int v6 = [v5 _bodyForItem:v4];

  LOBYTE(v5) = [v6 allowsRotation];
  return (char)v5;
}

- (void)applyImpulse:(CGPoint)a3 toItem:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(UIDynamicBehavior *)self _context];
  id v9 = [v8 _bodyForItem:v7];

  objc_msgSend(v9, "applyImpulse:", x, y);
  [(UIDynamicBehavior *)self _changedParameterForBody:v9];
}

- (void)_reevaluate:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v5 = [(UIDynamicBehavior *)self _items];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          double v11 = [(UIDynamicBehavior *)self _context];
          double v12 = v11;
          if (a3 == 2) {
            [v11 _registerBodyForItem:v10];
          }
          else {
          double v13 = [v11 _bodyForItem:v10];
          }

          [(UIDynamicItemBehavior *)self _configureBody:v13 forView:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_associate
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(UIDynamicItemBehavior *)self _reevaluate:2];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = self->_cachedLinearVelocities;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v9 = [(NSMapTable *)self->_cachedLinearVelocities objectForKey:v8];
        [v9 CGPointValue];
        double v11 = v10;
        double v13 = v12;
        long long v14 = [(UIDynamicBehavior *)self _context];
        long long v15 = [v14 _bodyForItem:v8];

        [v15 velocity];
        double v17 = v11 + v16;
        [v15 velocity];
        objc_msgSend(v15, "setVelocity:", v17, v13 + v18);
        [(UIDynamicBehavior *)self _changedParameterForBody:v15];
      }
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v5);
  }

  cachedLinearVelocities = self->_cachedLinearVelocities;
  self->_cachedLinearVelocities = 0;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v20 = self->_cachedAngularVelocities;
  uint64_t v21 = [(NSMapTable *)v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * j);
        v26 = -[NSMapTable objectForKey:](self->_cachedAngularVelocities, "objectForKey:", v25, (void)v33);
        [v26 floatValue];
        double v28 = v27;
        v29 = [(UIDynamicBehavior *)self _context];
        v30 = [v29 _bodyForItem:v25];

        [v30 angularVelocity];
        [v30 setAngularVelocity:v31 + v28];
        [(UIDynamicBehavior *)self _changedParameterForBody:v30];
      }
      uint64_t v22 = [(NSMapTable *)v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v22);
  }

  cachedAngularVelocities = self->_cachedAngularVelocities;
  self->_cachedAngularVelocities = 0;
}

- (void)_dissociate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(UIDynamicBehavior *)self _items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(UIDynamicBehavior *)self _context];
        [v9 _unregisterBodyForItem:v8 action:&__block_literal_global_179];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __36__UIDynamicItemBehavior__dissociate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRestitution:0.2];
  [v2 setFriction:0.2];
  [v2 setNormalizedDensity:1.0];
  [v2 setLinearDamping:0.1];
  [v2 setAngularDamping:0.1];
  [v2 setAllowsRotation:1];
}

- (BOOL)useDefaultViewPropertiesApplier
{
  return self->_useDefaultViewPropertiesApplier;
}

- (void)setUseDefaultViewPropertiesApplier:(BOOL)a3
{
  if (self->_useDefaultViewPropertiesApplier != a3)
  {
    self->_useDefaultViewPropertiesApplier = a3;
    *(_WORD *)&self->_stateFlags |= 0x40u;
    id v3 = [(UIDynamicBehavior *)self _context];
    [v3 _shouldReevaluateLocalBehaviors];
  }
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v14.receiver = self;
  v14.super_class = (Class)UIDynamicItemBehavior;
  uint64_t v4 = [(UIDynamicBehavior *)&v14 description];
  uint64_t v5 = [v3 stringWithString:v4];

  __int16 stateFlags = (__int16)self->_stateFlags;
  if (stateFlags)
  {
    [(UIDynamicItemBehavior *)self elasticity];
    objc_msgSend(v5, "appendFormat:", @" E=%f", v10);
    __int16 stateFlags = (__int16)self->_stateFlags;
    if ((stateFlags & 2) == 0)
    {
LABEL_3:
      if ((stateFlags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((stateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  [(UIDynamicItemBehavior *)self friction];
  objc_msgSend(v5, "appendFormat:", @" F=%f", v11);
  __int16 stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 4) == 0)
  {
LABEL_4:
    if ((stateFlags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [(UIDynamicItemBehavior *)self density];
  objc_msgSend(v5, "appendFormat:", @" D=%f", v12);
  __int16 stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 8) == 0)
  {
LABEL_5:
    if ((stateFlags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  [(UIDynamicItemBehavior *)self resistance];
  objc_msgSend(v5, "appendFormat:", @" R=%f", v13);
  if ((*(_WORD *)&self->_stateFlags & 0x10) != 0)
  {
LABEL_6:
    [(UIDynamicItemBehavior *)self angularResistance];
    objc_msgSend(v5, "appendFormat:", @" AR=%f", v7);
  }
LABEL_7:
  if (![(UIDynamicItemBehavior *)self allowsRotation]) {
    [v5 appendString:@" !Rotation"];
  }
  if (!self->_useDefaultViewPropertiesApplier) {
    [v5 appendString:@" !DefaultApplier"];
  }
  if (self->_anchored) {
    [v5 appendString:@" Anchored"];
  }
  [v5 appendString:@" "];
  uint64_t v8 = [(UIDynamicBehavior *)self _itemsDescription];
  [v5 appendString:v8];

  return v5;
}

- (CGFloat)elasticity
{
  return self->_elasticity;
}

- (CGFloat)friction
{
  return self->_friction;
}

- (CGFloat)density
{
  return self->_density;
}

- (CGFloat)resistance
{
  return self->_resistance;
}

- (CGFloat)angularResistance
{
  return self->_angularResistance;
}

- (CGFloat)charge
{
  return self->_charge;
}

- (BOOL)isAnchored
{
  return self->_anchored;
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLinearVelocities, 0);
  objc_storeStrong((id *)&self->_cachedAngularVelocities, 0);
}

@end