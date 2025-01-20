@interface NRMutableDevice
+ (BOOL)supportsSecureCoding;
+ (id)diffFrom:(id)a3 to:(id)a4;
+ (id)diffsToActivate:(BOOL)a3 withDate:(id)a4;
+ (id)diffsToClearStatusCodeAndCompatibilityState;
+ (id)diffsToPair:(BOOL)a3 withDate:(id)a4;
+ (id)diffsToSetStatusCode:(unint64_t)a3;
+ (id)diffsToSetStatusCode:(unint64_t)a3 andCompatibilityState:(unsigned __int16)a4;
+ (id)enclosedClassTypes;
+ (void)parseDiff:(id)a3 forPropertyChange:(id)a4 withBlock:(id)a5;
- (BOOL)isActive;
- (BOOL)isAltAccount;
- (BOOL)isArchived;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaired;
- (BOOL)isSetup;
- (BOOL)migratable;
- (BOOL)supportsCapability:(id)a3;
- (NRMutableDevice)init;
- (NRMutableDevice)initWithCoder:(id)a3;
- (NRMutableDevice)initWithProtobuf:(id)a3;
- (NRPBMutableDevice)protobuf;
- (NSUUID)pairingID;
- (id)_createIndex:(id)a3;
- (id)allPropertyNames;
- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)propertyForName:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)removePropertyForName:(id)a3;
- (void)setProperty:(id)a3 forName:(id)a4;
- (void)setProtobuf:(id)a3;
@end

@implementation NRMutableDevice

- (NSUUID)pairingID
{
  v2 = [(NRMutableDevice *)self objectForKeyedSubscript:@"pairingID"];
  v3 = [v2 value];

  return (NSUUID *)v3;
}

- (BOOL)isPaired
{
  v2 = [(NRMutableDevice *)self objectForKeyedSubscript:@"isPaired"];
  v3 = [v2 value];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isSetup
{
  v2 = [(NRMutableDevice *)self objectForKeyedSubscript:@"isSetup"];
  v3 = [v2 value];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isActive
{
  v2 = [(NRMutableDevice *)self objectForKeyedSubscript:@"isActive"];
  v3 = [v2 value];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isArchived
{
  v2 = [(NRMutableDevice *)self objectForKeyedSubscript:@"isArchived"];
  v3 = [v2 value];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isAltAccount
{
  v2 = [(NRMutableDevice *)self objectForKeyedSubscript:@"isAltAccount"];
  v3 = [v2 value];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)migratable
{
  v3 = [(NRMutableDevice *)self objectForKeyedSubscript:@"isArchived"];
  char v4 = [v3 value];

  char v5 = [v4 BOOLValue];
  v6 = [(NRMutableDevice *)self objectForKeyedSubscript:@"migrationConsent"];
  v7 = [v6 value];

  char v8 = [v7 BOOLValue];
  v9 = [(NRMutableDevice *)self objectForKeyedSubscript:@"migrationConsentDate"];
  v10 = [v9 value];

  if (v10)
  {
    [v10 timeIntervalSinceNow];
    BOOL v12 = v11 <= 0.0;
    if (v11 < -86400.0) {
      BOOL v12 = 0;
    }
    BOOL v13 = v12 & v8 & v5;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)supportsCapability:(id)a3
{
  id v4 = a3;
  char v5 = [(NRMutableDevice *)self objectForKeyedSubscript:@"capabilities"];
  v6 = [v5 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 hasUUID:v4];
  }
  else {
    char v7 = [v6 containsObject:v4];
  }
  BOOL v8 = v7;

  return v8;
}

+ (id)diffsToActivate:(BOOL)a3 withDate:(id)a4
{
  BOOL v4 = a3;
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [NRDevicePropertyDiffType alloc];
  char v7 = [NRDevicePropertyDiff alloc];
  if (v4)
  {
    BOOL v8 = [(NRDevicePropertyDiff *)v7 initWithValue:MEMORY[0x1E4F1CC38]];
    v9 = [(NRDevicePropertyDiffType *)v6 initWithDiff:v8 andChangeType:1];

    v10 = [NRDevicePropertyDiffType alloc];
    double v11 = [[NRDevicePropertyDiff alloc] initWithValue:v5];

    BOOL v12 = [(NRDevicePropertyDiffType *)v10 initWithDiff:v11 andChangeType:1];
    v23[0] = @"isActive";
    v23[1] = @"lastActiveDate";
    v24[0] = v9;
    v24[1] = v12;
    BOOL v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = v24;
    v15 = v23;
  }
  else
  {
    v16 = [(NRDevicePropertyDiff *)v7 initWithValue:MEMORY[0x1E4F1CC28]];
    v9 = [(NRDevicePropertyDiffType *)v6 initWithDiff:v16 andChangeType:1];

    v17 = [NRDevicePropertyDiffType alloc];
    v18 = [[NRDevicePropertyDiff alloc] initWithValue:v5];

    BOOL v12 = [(NRDevicePropertyDiffType *)v17 initWithDiff:v18 andChangeType:1];
    v21[0] = @"isActive";
    v21[1] = @"lastInactiveDate";
    v22[0] = v9;
    v22[1] = v12;
    BOOL v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = v22;
    v15 = v21;
  }
  v19 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:2];

  return v19;
}

+ (id)diffsToPair:(BOOL)a3 withDate:(id)a4
{
  BOOL v4 = a3;
  v27[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [NRDevicePropertyDiffType alloc];
  char v7 = [NRDevicePropertyDiff alloc];
  if (v4)
  {
    BOOL v8 = [(NRDevicePropertyDiff *)v7 initWithValue:MEMORY[0x1E4F1CC38]];
    v9 = [(NRDevicePropertyDiffType *)v6 initWithDiff:v8 andChangeType:1];

    if (v5)
    {
      v10 = [NRDevicePropertyDiffType alloc];
      double v11 = [[NRDevicePropertyDiff alloc] initWithValue:v5];
      BOOL v12 = [(NRDevicePropertyDiffType *)v10 initWithDiff:v11 andChangeType:1];
    }
    else
    {
      BOOL v12 = 0;
    }
    v15 = [[NRDevicePropertyDiffType alloc] initWithDiff:0 andChangeType:2];
    v16 = v15;
    if (v12)
    {
      v26[0] = @"isPaired";
      v26[1] = @"pairedDate";
      v27[0] = v9;
      v27[1] = v12;
      v26[2] = @"isArchived";
      v27[2] = v15;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = v27;
      v19 = v26;
      uint64_t v20 = 3;
    }
    else
    {
      v24[0] = @"isPaired";
      v24[1] = @"isArchived";
      v25[0] = v9;
      v25[1] = v15;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = v25;
      v19 = v24;
      uint64_t v20 = 2;
    }
    v14 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
  }
  else
  {
    BOOL v13 = [(NRDevicePropertyDiff *)v7 initWithValue:MEMORY[0x1E4F1CC28]];
    v9 = [(NRDevicePropertyDiffType *)v6 initWithDiff:v13 andChangeType:1];

    v22 = @"isPaired";
    v23 = v9;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  }

  return v14;
}

+ (id)diffsToSetStatusCode:(unint64_t)a3 andCompatibilityState:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  v6 = [NRDevicePropertyDiff alloc];
  char v7 = [NSNumber numberWithUnsignedInteger:a3];
  BOOL v8 = [(NRDevicePropertyDiff *)v6 initWithValue:v7];

  v9 = [[NRDevicePropertyDiffType alloc] initWithDiff:v8 andChangeType:0];
  v10 = [NRDevicePropertyDiff alloc];
  double v11 = [NSNumber numberWithUnsignedShort:v4];
  BOOL v12 = [(NRDevicePropertyDiff *)v10 initWithValue:v11];

  BOOL v13 = [[NRDevicePropertyDiffType alloc] initWithDiff:v12 andChangeType:1];
  v14 = v13;
  if (a3)
  {
    v21[0] = @"compatibilityState";
    v21[1] = @"statusCode";
    v22[0] = v13;
    v22[1] = v9;
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = v22;
    v17 = (__CFString **)v21;
    uint64_t v18 = 2;
  }
  else
  {
    v23 = @"compatibilityState";
    v24[0] = v13;
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = v24;
    v17 = &v23;
    uint64_t v18 = 1;
  }
  v19 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];

  return v19;
}

+ (id)diffsToSetStatusCode:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NRDevicePropertyDiff alloc];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [(NRDevicePropertyDiff *)v4 initWithValue:v5];

  char v7 = [[NRDevicePropertyDiffType alloc] initWithDiff:v6 andChangeType:0];
  BOOL v8 = v7;
  if (a3)
  {
    double v11 = @"statusCode";
    v12[0] = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

+ (id)diffsToClearStatusCodeAndCompatibilityState
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [[NRDevicePropertyDiffType alloc] initWithDiff:0 andChangeType:2];
  v3 = [[NRDevicePropertyDiffType alloc] initWithDiff:0 andChangeType:2];
  v6[0] = @"compatibilityState";
  v6[1] = @"statusCode";
  v7[0] = v3;
  v7[1] = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)parseDiff:(id)a3 forPropertyChange:(id)a4 withBlock:(id)a5
{
  BOOL v12 = (void (**)(id, uint64_t, void *))a5;
  char v7 = [a3 objectForKeyedSubscript:a4];
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 changeType];
    v10 = [v8 diff];
    double v11 = [v10 value];
    v12[2](v12, v9, v11);
  }
}

- (NRMutableDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)NRMutableDevice;
  v2 = [(NRMutableStateBase *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    properties = v2->_properties;
    v2->_properties = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setProperty:(id)a3 forName:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(NRMutableDevice *)self objectForKeyedSubscript:v6];
  uint64_t v9 = +[NRMutableDeviceProperty diffFrom:v8 to:v7];

  v10 = [[NRDevicePropertyDiffType alloc] initWithDiff:v9 andChangeType:1];
  if (v10)
  {
    double v11 = [NRDeviceDiff alloc];
    id v15 = v6;
    v16[0] = v10;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    BOOL v13 = [(NRDeviceDiff *)v11 initWithDiffPropertyDiffs:v12];
  }
  else
  {
    BOOL v13 = 0;
  }
  id v14 = [(NRMutableStateBase *)self applyDiff:v13];
}

- (void)removePropertyForName:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[NRDevicePropertyDiffType alloc] initWithDiff:0 andChangeType:2];
  id v6 = [NRDeviceDiff alloc];
  id v10 = v4;
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  BOOL v8 = [(NRDeviceDiff *)v6 initWithDiffPropertyDiffs:v7];
  id v9 = [(NRMutableStateBase *)self applyDiff:v8];
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)NRMutableDevice;
  [(NRMutableStateBase *)&v4 invalidate];
  properties = self->_properties;
  self->_properties = 0;
}

- (id)propertyForName:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:a3];
  if (v3) {
    objc_super v4 = [[NRMutableDeviceProperty alloc] initWithValue:v3];
  }
  else {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)allPropertyNames
{
  return (id)[(NSMutableDictionary *)self->_properties allKeys];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_properties count];
}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (id *)v5;
  BOOL v8 = (id *)v6;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v36 = v8;
  if ([v7 count])
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    double v11 = [v7[5] allKeys];
    BOOL v12 = [v10 setWithArray:v11];
    BOOL v13 = (void *)[v12 mutableCopy];

    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    id v15 = [v8[5] allKeys];
    v16 = [v14 setWithArray:v15];

    [v13 minusSet:v16];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v23 = [[NRDevicePropertyDiffType alloc] initWithDiff:0 andChangeType:2];
          [v9 setObject:v23 forKeyedSubscript:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v19);
    }
  }
  if ([v8 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v8[5];
    uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          if (v7)
          {
            v29 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          }
          else
          {
            v29 = 0;
          }
          v30 = [v8 objectForKeyedSubscript:v28];
          v31 = +[NRMutableDeviceProperty diffFrom:v29 to:v30];
          if (v31)
          {
            v32 = [[NRDevicePropertyDiffType alloc] initWithDiff:v31 andChangeType:v29 != 0];
            [v9 setObject:v32 forKeyedSubscript:v28];

            BOOL v8 = v36;
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v25);
    }
  }
  if ([v9 count]) {
    v33 = [[NRDeviceDiff alloc] initWithDiffPropertyDiffs:v9];
  }
  else {
    v33 = 0;
  }

  return v33;
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (![v9 count])
  {
    uint64_t v24 = 0;
    id v25 = v9;
    goto LABEL_25;
  }
  BOOL v28 = v7;
  context = (void *)MEMORY[0x1A624A5B0]();
  id v10 = self;
  p_isa = (id *)&v10->super.super.isa;
  uint64_t v12 = (uint64_t)v10;
  BOOL v29 = a6;
  if (!a6)
  {
    uint64_t v12 = [(NRMutableDevice *)v10 copyWithZone:0];
  }
  v30 = (void *)v12;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v33 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v18 = [v13 objectForKeyedSubscript:v17];
        uint64_t v19 = [v18 diff];
        uint64_t v20 = [v19 value];
        uint64_t v21 = [p_isa[5] objectForKeyedSubscript:v17];
        uint64_t v22 = (void *)v21;
        if (v19)
        {
          if (!v21 || !a4) {
            [p_isa[5] setObject:v20 forKeyedSubscript:v17];
          }
        }
        else
        {
          [p_isa[5] removeObjectForKey:v17];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  if (v29)
  {
    v23 = v30;
    if (!v13) {
      goto LABEL_24;
    }
LABEL_21:
    if (v28) {
      [p_isa notifyParentWithDiff:v13];
    }
    [p_isa notifyObserversWithDiff:v13];
    goto LABEL_24;
  }
  v23 = v30;
  uint64_t v26 = [(id)objc_opt_class() diffFrom:v30 to:p_isa];

  id v13 = (id)v26;
  if (v26) {
    goto LABEL_21;
  }
LABEL_24:

  id v25 = v13;
  uint64_t v24 = v25;
LABEL_25:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_createIndex:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v17 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v9 name:@"device property key" classes:v10 owner:self];

        double v11 = [v5 objectForKeyedSubscript:v9];
        uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v11 name:@"device property value" classes:v12 owner:self];

        id v13 = [v11 value];

        if (v13)
        {
          uint64_t v14 = [v11 value];
          [v16 setObject:v14 forKeyedSubscript:v9];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v16;
}

- (NRMutableDevice)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NRMutableDevice *)self init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:3];
    uint64_t v12 = objc_msgSend(v10, "setWithArray:", v11, v17, v18);
    id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"properties"];

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_properties name:@"device properties dictionary" owner:v5];
    uint64_t v14 = [(NRMutableDevice *)v5 _createIndex:v13];
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v14;

LABEL_5:
    uint64_t v9 = v5;
    goto LABEL_6;
  }
  uint64_t v7 = (void *)v6;
  BOOL v8 = [[NRPBMutableDevice alloc] initWithData:v6];
  uint64_t v9 = [(NRMutableDevice *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (NRMutableDevice)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NRMutableDevice;
  id v5 = [(NRMutableStateBase *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = [v4 names];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = [v4 names];
        double v11 = [v10 objectAtIndexedSubscript:v9];

        uint64_t v12 = [v4 properties];
        id v13 = [v12 objectAtIndexedSubscript:v9];

        uint64_t v14 = [v13 value];
        if (v14)
        {
          uint64_t v15 = +[NRDevicePropertyDiff unpackPropertyValue:v14];
          if (v15) {
            [(NSMutableDictionary *)v6 setObject:v15 forKeyedSubscript:v11];
          }
        }
        ++v9;
        id v16 = [v4 names];
        unint64_t v17 = [v16 count];
      }
      while (v9 < v17);
    }
    properties = v5->_properties;
    v5->_properties = v6;
    uint64_t v19 = v6;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_properties name:@"device properties dictionary" owner:v5];
  }

  return v5;
}

- (NRPBMutableDevice)protobuf
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v3 setNames:v4];

  id v5 = [MEMORY[0x1E4F1CA48] array];
  [v3 setProperties:v5];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_properties;
  uint64_t v24 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v24)
  {
    uint64_t v7 = *(void *)v26;
    uint64_t v23 = v3;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v6);
        }
        unint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v10 = [(NRMutableDevice *)self objectForKeyedSubscript:v9];
        if ([v9 isEqual:@"capabilities"]
          && ([v10 value],
              double v11 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v11,
              (isKindOfClass & 1) != 0))
        {
          id v13 = [v10 value];
          uint64_t v14 = v7;
          uint64_t v15 = v6;
          id v16 = self;
          unint64_t v17 = [[NRMiniUUIDSet alloc] initWithUUIDSet:v13];
          uint64_t v18 = [[NRMutableDeviceProperty alloc] initWithValue:v17];
          uint64_t v19 = [(NRMutableDeviceProperty *)v18 protobuf];

          self = v16;
          uint64_t v6 = v15;
          uint64_t v7 = v14;
          uint64_t v3 = v23;
        }
        else
        {
          uint64_t v19 = [v10 protobuf];
        }
        uint64_t v20 = [v3 names];
        [v20 addObject:v9];

        if (v19)
        {
          objc_super v21 = [v3 properties];
          [v21 addObject:v19];
        }
      }
      uint64_t v24 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v24);
  }

  return (NRPBMutableDevice *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRMutableDevice *)self protobuf];
  id v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

+ (id)enclosedClassTypes
{
  v2 = +[NRMutableDeviceProperty enclosedClassTypes];
  uint64_t v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_properties;
  uint64_t v3 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    unint64_t v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hash", (void)v9) - v6 + 32 * v6;
      }
      uint64_t v4 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NRMutableDevice *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_6;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v7 = 0;
    goto LABEL_8;
  }
  properties = self->_properties;
  if (properties == v5->_properties) {
LABEL_6:
  }
    char v7 = 1;
  else {
    char v7 = -[NSMutableDictionary isEqual:](properties, "isEqual:");
  }
LABEL_8:

  return v7;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"NRMutableDevice[%p]", self);
  uint64_t v4 = [(NSMutableDictionary *)self->_properties allKeys];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v11 = (void *)MEMORY[0x1A624A5B0]();
        long long v12 = [(NRMutableDevice *)self objectForKeyedSubscript:v10];
        id v13 = [v10 stringByPaddingToLength:30 withString:@" " startingAtIndex:0];
        uint64_t v14 = [v12 description];
        uint64_t v15 = +[NRTextFormattingUtilities prefixLinesWithString:v13 withText:v14];

        [v3 appendString:v15];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v3;
}

uint64_t __30__NRMutableDevice_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = self->_properties;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v10 = [(NRMutableDevice *)self objectForKeyedSubscript:v9];
        long long v11 = +[NRMutableDeviceProperty diffFrom:0 to:v10];
        long long v12 = [[NRDevicePropertyDiffType alloc] initWithDiff:v11 andChangeType:0];
        [v4 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v13 = [[NRDeviceDiff alloc] initWithDiffPropertyDiffs:v4];
  id v14 = (id)[v16 applyDiff:v13 upOnly:0 notifyParent:0 unconditional:1];

  return v16;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_properties copy];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)setProtobuf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_protobuf, 0);
}

@end