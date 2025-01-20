@interface TRAOrientationResolutionPolicyInfo
+ (id)resolutionPolicyInfoDeviceOrientation;
+ (id)resolutionPolicyInfoDeviceOrientationWithStateTypes:(id)a3;
+ (id)resolutionPolicyInfoDeviceOrientationWithStateTypesBySupportedOrientationMask:(id)a3;
+ (id)resolutionPolicyInfoForAssociatedParticipantWithRole:(id)a3;
+ (id)resolutionPolicyInfoForAssociatedParticipantWithUniqueID:(id)a3;
+ (id)resolutionPolicyInfoIsolation;
+ (id)resolutionPolicyInfoOrientationBelow;
+ (id)resolutionPolicyInfoOrientationBelowParticipantWithRole:(id)a3;
+ (id)resolutionPolicyInfoOrientationBelowParticipantWithUniqueID:(id)a3;
- (BOOL)forceResolution;
- (NSArray)associatedDeviceOrientationStateTypes;
- (NSDictionary)associatedDeviceOrientationStateTypesBySupportedOrientationMask;
- (NSString)associatedParticipantRole;
- (NSString)associatedParticipantUniqueIdentifier;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedAccStateTypes:(id)a4;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedAccStateTypesByMask:(id)a4;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantRole:(id)a4;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4 associatedParticipantRole:(id)a5 associatedAccStateTypes:(id)a6;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4 associatedParticipantRole:(id)a5 associatedAccStateTypes:(id)a6 associatedAccStateTypesByMask:(id)a7;
- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicyInfo:(id)a3;
- (TRASettingsActuationContext)actuationContext;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)resolutionPolicy;
- (void)setActuationContext:(id)a3;
- (void)setAssociatedDeviceOrientationStateTypes:(id)a3;
- (void)setForceResolution:(BOOL)a3;
@end

@implementation TRAOrientationResolutionPolicyInfo

- (int64_t)resolutionPolicy
{
  return self->_resolutionPolicy;
}

- (NSString)associatedParticipantRole
{
  return self->_associatedParticipantRole;
}

+ (id)resolutionPolicyInfoDeviceOrientationWithStateTypesBySupportedOrientationMask:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:1 associatedAccStateTypesByMask:v4];

  return v5;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedAccStateTypesByMask:(id)a4
{
  return [(TRAOrientationResolutionPolicyInfo *)self initWithResolutionPolicy:a3 associatedParticipantUniqueID:0 associatedParticipantRole:0 associatedAccStateTypes:0 associatedAccStateTypesByMask:a4];
}

+ (id)resolutionPolicyInfoForAssociatedParticipantWithUniqueID:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:3 associatedParticipantUniqueID:v4];

  return v5;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4
{
  return [(TRAOrientationResolutionPolicyInfo *)self initWithResolutionPolicy:a3 associatedParticipantUniqueID:a4 associatedParticipantRole:0 associatedAccStateTypes:0];
}

+ (id)resolutionPolicyInfoIsolation
{
  v2 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:0];
  return v2;
}

+ (id)resolutionPolicyInfoForAssociatedParticipantWithRole:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:3 associatedParticipantRole:v4];

  return v5;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantRole:(id)a4
{
  return [(TRAOrientationResolutionPolicyInfo *)self initWithResolutionPolicy:a3 associatedParticipantUniqueID:0 associatedParticipantRole:a4 associatedAccStateTypes:0];
}

+ (id)resolutionPolicyInfoDeviceOrientation
{
  v2 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:1];
  return v2;
}

+ (id)resolutionPolicyInfoOrientationBelow
{
  v2 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:2];
  return v2;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4 associatedParticipantRole:(id)a5 associatedAccStateTypes:(id)a6
{
  return [(TRAOrientationResolutionPolicyInfo *)self initWithResolutionPolicy:a3 associatedParticipantUniqueID:a4 associatedParticipantRole:a5 associatedAccStateTypes:a6 associatedAccStateTypesByMask:0];
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3
{
  return [(TRAOrientationResolutionPolicyInfo *)self initWithResolutionPolicy:a3 associatedParticipantUniqueID:0 associatedParticipantRole:0 associatedAccStateTypes:0];
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedParticipantUniqueID:(id)a4 associatedParticipantRole:(id)a5 associatedAccStateTypes:(id)a6 associatedAccStateTypesByMask:(id)a7
{
  unint64_t v13 = (unint64_t)a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TRAOrientationResolutionPolicyInfo;
  v17 = [(TRAOrientationResolutionPolicyInfo *)&v29 init];
  v18 = v17;
  if (v17)
  {
    v17->_resolutionPolicy = a3;
    if (a3 != 3) {
      goto LABEL_6;
    }
    if (!(v13 | v14))
    {
      v26 = [MEMORY[0x263F08690] currentHandler];
      [v26 handleFailureInMethod:a2, v18, @"TRAResolutionPolicy.m", 123, @"Invalid parameter not satisfying: %@", @"participantUniqueID || participantRole" object file lineNumber description];
    }
    if ((v14 != 0) == (v13 != 0))
    {
      v28 = [MEMORY[0x263F08690] currentHandler];
      [v28 handleFailureInMethod:a2, v18, @"TRAResolutionPolicy.m", 124, @"Invalid parameter not satisfying: %@", @"(!participantUniqueID && participantRole) || (participantUniqueID && !participantRole)" object file lineNumber description];

      if (v15) {
        goto LABEL_7;
      }
    }
    else
    {
LABEL_6:
      if (v15)
      {
LABEL_7:
        if (v18->_resolutionPolicy == 1 && ![v15 count])
        {
          v27 = [MEMORY[0x263F08690] currentHandler];
          [v27 handleFailureInMethod:a2, v18, @"TRAResolutionPolicy.m", 127, @"Invalid parameter not satisfying: %@", @"associatedAccStateTypes == nil || [associatedAccStateTypes count] > 0" object file lineNumber description];
        }
      }
    }
    uint64_t v19 = [(id)v13 copy];
    associatedParticipantUniqueIdentifier = v18->_associatedParticipantUniqueIdentifier;
    v18->_associatedParticipantUniqueIdentifier = (NSString *)v19;

    uint64_t v21 = [(id)v14 copy];
    associatedParticipantRole = v18->_associatedParticipantRole;
    v18->_associatedParticipantRole = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    associatedDeviceOrientationStateTypesBySupportedOrientationMask = v18->_associatedDeviceOrientationStateTypesBySupportedOrientationMask;
    v18->_associatedDeviceOrientationStateTypesBySupportedOrientationMask = (NSDictionary *)v23;

    [(TRAOrientationResolutionPolicyInfo *)v18 setAssociatedDeviceOrientationStateTypes:v15];
  }

  return v18;
}

- (void)setAssociatedDeviceOrientationStateTypes:(id)a3
{
  id v4 = a3;
  if (self->_resolutionPolicy == 1)
  {
    id v7 = v4;
    if (v4)
    {
      v5 = (NSArray *)[v4 copy];
      associatedDeviceOrientationStateTypes = self->_associatedDeviceOrientationStateTypes;
      self->_associatedDeviceOrientationStateTypes = v5;
    }
    else
    {
      associatedDeviceOrientationStateTypes = self->_associatedDeviceOrientationStateTypes;
      self->_associatedDeviceOrientationStateTypes = (NSArray *)&unk_270BFE5E8;
    }

    id v4 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuationContext, 0);
  objc_storeStrong((id *)&self->_associatedDeviceOrientationStateTypesBySupportedOrientationMask, 0);
  objc_storeStrong((id *)&self->_associatedDeviceOrientationStateTypes, 0);
  objc_storeStrong((id *)&self->_associatedParticipantRole, 0);
  objc_storeStrong((id *)&self->_associatedParticipantUniqueIdentifier, 0);
}

- (NSString)associatedParticipantUniqueIdentifier
{
  return self->_associatedParticipantUniqueIdentifier;
}

- (NSArray)associatedDeviceOrientationStateTypes
{
  return self->_associatedDeviceOrientationStateTypes;
}

- (NSDictionary)associatedDeviceOrientationStateTypesBySupportedOrientationMask
{
  return self->_associatedDeviceOrientationStateTypesBySupportedOrientationMask;
}

- (void)setActuationContext:(id)a3
{
}

- (void)setForceResolution:(BOOL)a3
{
  self->_forceResolution = a3;
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

+ (id)resolutionPolicyInfoDeviceOrientationWithStateTypes:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:1 associatedAccStateTypes:v4];

  return v5;
}

+ (id)resolutionPolicyInfoOrientationBelowParticipantWithUniqueID:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:2 associatedParticipantUniqueID:v4];

  return v5;
}

+ (id)resolutionPolicyInfoOrientationBelowParticipantWithRole:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithResolutionPolicy:2 associatedParticipantRole:v4];

  return v5;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicyInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 resolutionPolicy];
  v6 = [v4 associatedParticipantUniqueIdentifier];
  id v7 = [v4 associatedParticipantRole];
  v8 = [v4 associatedDeviceOrientationStateTypes];

  v9 = [(TRAOrientationResolutionPolicyInfo *)self initWithResolutionPolicy:v5 associatedParticipantUniqueID:v6 associatedParticipantRole:v7 associatedAccStateTypes:v8];
  return v9;
}

- (TRAOrientationResolutionPolicyInfo)initWithResolutionPolicy:(int64_t)a3 associatedAccStateTypes:(id)a4
{
  return [(TRAOrientationResolutionPolicyInfo *)self initWithResolutionPolicy:a3 associatedParticipantUniqueID:0 associatedParticipantRole:0 associatedAccStateTypes:a4];
}

- (id)succinctDescription
{
  v2 = [(TRAOrientationResolutionPolicyInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v53 = self;
  unint64_t v4 = self->_resolutionPolicy - 1;
  if (v4 > 2) {
    uint64_t v5 = @"None";
  }
  else {
    uint64_t v5 = off_265543DD0[v4];
  }
  uint64_t v6 = [MEMORY[0x263F089D8] stringWithString:v5];
  id v7 = (void *)v6;
  int64_t resolutionPolicy = self->_resolutionPolicy;
  if (resolutionPolicy == 1)
  {
    v48 = v3;
    v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_associatedDeviceOrientationStateTypes, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    unint64_t v13 = self->_associatedDeviceOrientationStateTypes;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v13);
          }
          unint64_t v18 = [*(id *)(*((void *)&v62 + 1) + 8 * i) integerValue] - 1;
          uint64_t v19 = @"ValidatedCurrentOrientation";
          if (v18 <= 2) {
            uint64_t v19 = off_265543DE8[v18];
          }
          [v12 addObject:v19];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v15);
    }

    v11 = [v12 componentsJoinedByString:@","];

    v10 = 0;
    v3 = v48;
  }
  else
  {
    if (resolutionPolicy != 3)
    {
      uint64_t v21 = (void *)v6;
      goto LABEL_43;
    }
    associatedParticipantUniqueIdentifier = self->_associatedParticipantUniqueIdentifier;
    if (!associatedParticipantUniqueIdentifier) {
      associatedParticipantUniqueIdentifier = self->_associatedParticipantRole;
    }
    v10 = associatedParticipantUniqueIdentifier;
    v11 = 0;
  }
  if (v10) {
    v20 = v10;
  }
  else {
    v20 = v11;
  }
  uint64_t v21 = [MEMORY[0x263F089D8] stringWithFormat:@"%@-(%@)", v5, v20];

  if (v53->_resolutionPolicy == 1)
  {
    associatedDeviceOrientationStateTypesBySupportedOrientationMasuint64_t k = v53->_associatedDeviceOrientationStateTypesBySupportedOrientationMask;
    if (associatedDeviceOrientationStateTypesBySupportedOrientationMask)
    {
      v45 = v10;
      v46 = v11;
      v47 = v21;
      v49 = v3;
      v52 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](associatedDeviceOrientationStateTypesBySupportedOrientationMask, "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      obuint64_t j = [(NSDictionary *)v53->_associatedDeviceOrientationStateTypesBySupportedOrientationMask allKeys];
      uint64_t v23 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v51 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v59 != v51) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            v27 = [(NSDictionary *)v53->_associatedDeviceOrientationStateTypesBySupportedOrientationMask objectForKey:v26];
            v28 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v53->_associatedDeviceOrientationStateTypes, "count"));
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v29 = v27;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v66 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v55;
              do
              {
                for (uint64_t k = 0; k != v31; ++k)
                {
                  if (*(void *)v55 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  unint64_t v34 = [*(id *)(*((void *)&v54 + 1) + 8 * k) integerValue] - 1;
                  v35 = @"ValidatedCurrentOrientation";
                  if (v34 <= 2) {
                    v35 = off_265543DE8[v34];
                  }
                  [v28 addObject:v35];
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v54 objects:v66 count:16];
              }
              while (v31);
            }

            v36 = [v28 componentsJoinedByString:@","];
            [v26 integerValue];
            v37 = BSInterfaceOrientationMaskDescription();
            [v52 setObject:v36 forKey:v37];
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v24);
      }

      v38 = NSString;
      v39 = [v52 description];
      v40 = [v38 stringWithFormat:@"-(%@)", v39];
      uint64_t v21 = v47;
      [v47 appendString:v40];

      v3 = v49;
      v10 = v45;
      v11 = v46;
    }
  }

LABEL_43:
  [v3 appendString:v21 withName:@"Policy"];
  if (v53->_forceResolution) {
    id v41 = (id)[v3 appendBool:1 withName:@"Force Resolution"];
  }
  actuationContext = v53->_actuationContext;
  if (actuationContext) {
    id v43 = (id)[v3 appendObject:actuationContext withName:@"Actuation Context"];
  }

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAOrientationResolutionPolicyInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (BOOL)forceResolution
{
  return self->_forceResolution;
}

@end