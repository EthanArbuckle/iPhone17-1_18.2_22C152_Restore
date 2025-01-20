@interface RBSystemState
- (BOOL)isEqual:(id)a3;
- (BOOL)preventIdleSleep;
- (BOOL)preventLaunch;
- (NSDictionary)conditions;
- (NSDictionary)prewarmConfiguration;
- (NSSet)allowLaunchPredicates;
- (NSSet)preventIdleSleepIdentifiers;
- (NSSet)preventLaunchPredicates;
- (NSSet)tags;
- (id)_init;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation RBSystemState

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(RBSystemState *)+[RBMutableSystemState allocWithZone:a3] _init];
  v4[17] = self->_preventIdleSleep;
  v4[16] = self->_preventLaunch;
  uint64_t v5 = [(NSMutableSet *)self->_preventIdleSleepIdentifiers mutableCopy];
  v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  uint64_t v7 = [(NSMutableSet *)self->_tags mutableCopy];
  v8 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v7;

  uint64_t v9 = [(NSMutableSet *)self->_preventLaunchPredicates mutableCopy];
  v10 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v9;

  uint64_t v11 = [(NSMutableSet *)self->_allowLaunchPredicates mutableCopy];
  v12 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v11;

  uint64_t v13 = [(NSMutableDictionary *)self->_conditions mutableCopy];
  v14 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v13;

  uint64_t v15 = [(NSMutableDictionary *)self->_prewarmConfiguration mutableCopy];
  v16 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v15;

  return v4;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RBSystemState;
  return [(RBSystemState *)&v3 init];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmConfiguration, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_allowLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_preventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_preventIdleSleepIdentifiers, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

- (NSDictionary)conditions
{
  return &self->_conditions->super;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSystemState *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        uint64_t v7 = v6;
        if (self->_preventIdleSleep != v6->_preventIdleSleep || self->_preventLaunch != v6->_preventLaunch) {
          goto LABEL_37;
        }
        preventIdleSleepIdentifiers = self->_preventIdleSleepIdentifiers;
        CFSetRef v9 = (const __CFSet *)v6->_preventIdleSleepIdentifiers;
        if (preventIdleSleepIdentifiers != (NSMutableSet *)v9)
        {
          char v10 = 0;
          if (!preventIdleSleepIdentifiers || !v9) {
            goto LABEL_38;
          }
          CFIndex Count = CFSetGetCount((CFSetRef)self->_preventIdleSleepIdentifiers);
          if (Count != CFSetGetCount(v9)
            || ![(NSMutableSet *)preventIdleSleepIdentifiers isEqualToSet:v9])
          {
            goto LABEL_37;
          }
        }
        preventLaunchPredicates = self->_preventLaunchPredicates;
        CFSetRef v13 = (const __CFSet *)v7->_preventLaunchPredicates;
        if (preventLaunchPredicates != (NSMutableSet *)v13)
        {
          char v10 = 0;
          if (!preventLaunchPredicates || !v13) {
            goto LABEL_38;
          }
          CFIndex v14 = CFSetGetCount((CFSetRef)self->_preventLaunchPredicates);
          if (v14 != CFSetGetCount(v13)
            || ![(NSMutableSet *)preventLaunchPredicates isEqualToSet:v13])
          {
            goto LABEL_37;
          }
        }
        allowLaunchPredicates = self->_allowLaunchPredicates;
        CFSetRef v16 = (const __CFSet *)v7->_allowLaunchPredicates;
        if (allowLaunchPredicates != (NSMutableSet *)v16)
        {
          char v10 = 0;
          if (!allowLaunchPredicates || !v16) {
            goto LABEL_38;
          }
          CFIndex v17 = CFSetGetCount((CFSetRef)self->_allowLaunchPredicates);
          if (v17 != CFSetGetCount(v16)
            || ![(NSMutableSet *)allowLaunchPredicates isEqualToSet:v16])
          {
            goto LABEL_37;
          }
        }
        tags = self->_tags;
        CFSetRef v19 = (const __CFSet *)v7->_tags;
        if (tags != (NSMutableSet *)v19)
        {
          char v10 = 0;
          if (!tags || !v19) {
            goto LABEL_38;
          }
          CFIndex v20 = CFSetGetCount((CFSetRef)self->_tags);
          if (v20 != CFSetGetCount(v19) || ![(NSMutableSet *)tags isEqualToSet:v19]) {
            goto LABEL_37;
          }
        }
        conditions = self->_conditions;
        v22 = v7->_conditions;
        if (conditions != v22)
        {
          char v10 = 0;
          if (!conditions || !v22) {
            goto LABEL_38;
          }
          if (!-[NSMutableDictionary isEqual:](conditions, "isEqual:")) {
            goto LABEL_37;
          }
        }
        prewarmConfiguration = self->_prewarmConfiguration;
        CFDictionaryRef v24 = (const __CFDictionary *)v7->_prewarmConfiguration;
        if (prewarmConfiguration == (NSMutableDictionary *)v24)
        {
          char v10 = 1;
          goto LABEL_38;
        }
        char v10 = 0;
        if (!prewarmConfiguration || !v24) {
          goto LABEL_38;
        }
        CFIndex v25 = CFDictionaryGetCount((CFDictionaryRef)prewarmConfiguration);
        if (v25 == CFDictionaryGetCount(v24)) {
          char v10 = [(NSMutableDictionary *)prewarmConfiguration isEqualToDictionary:v24];
        }
        else {
LABEL_37:
        }
          char v10 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    char v10 = 0;
  }
LABEL_39:

  return v10;
}

- (BOOL)preventLaunch
{
  return self->_preventLaunch;
}

- (NSSet)preventLaunchPredicates
{
  return &self->_preventLaunchPredicates->super;
}

- (NSSet)allowLaunchPredicates
{
  return &self->_allowLaunchPredicates->super;
}

- (unint64_t)hash
{
  unint64_t v3 = 0xBF58476D1CE4E5B9
     * (((unint64_t)self->_preventIdleSleep << 24) | ((unint64_t)self->_preventLaunch << 16));
  unint64_t v4 = 0x94D049BB133111EBLL * (v3 ^ (v3 >> 27));
  uint64_t v5 = [(NSMutableSet *)self->_preventIdleSleepIdentifiers hash];
  uint64_t v6 = [(NSMutableSet *)self->_tags hash];
  uint64_t v7 = [(NSMutableSet *)self->_preventLaunchPredicates hash];
  uint64_t v8 = [(NSMutableSet *)self->_allowLaunchPredicates hash];
  uint64_t v9 = [(NSMutableDictionary *)self->_conditions hash];
  return v6 ^ v5 ^ v7 ^ (v4 >> 31) ^ v8 ^ v9 ^ [(NSMutableDictionary *)self->_prewarmConfiguration hash] ^ v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)v4;
  if (self->_preventLaunch) {
    uint64_t v6 = @" preventLaunch";
  }
  else {
    uint64_t v6 = &stru_26DA9D688;
  }
  if (self->_preventIdleSleep) {
    uint64_t v7 = @" preventIdleSleep";
  }
  else {
    uint64_t v7 = &stru_26DA9D688;
  }
  uint64_t v8 = (void *)[v3 initWithFormat:@"<%@| %@%@>", v4, v6, v7];

  return v8;
}

- (BOOL)preventIdleSleep
{
  return self->_preventIdleSleep;
}

- (NSSet)preventIdleSleepIdentifiers
{
  return &self->_preventIdleSleepIdentifiers->super;
}

- (NSDictionary)prewarmConfiguration
{
  return &self->_prewarmConfiguration->super;
}

- (NSSet)tags
{
  return &self->_tags->super;
}

@end