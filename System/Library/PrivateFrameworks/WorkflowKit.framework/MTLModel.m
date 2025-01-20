@interface MTLModel
+ (BOOL)supportsSecureCoding;
+ (id)allowedSecureCodingClassesByPropertyKey;
+ (id)dictionaryValueFromArchivedExternalRepresentation:(id)a3 version:(unint64_t)a4;
+ (id)encodingBehaviorsByPropertyKey;
+ (id)modelWithDictionary:(id)a3 error:(id *)a4;
+ (id)permanentPropertyKeys;
+ (id)propertyKeys;
+ (id)transitoryPropertyKeys;
+ (unint64_t)modelVersion;
+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3;
+ (void)enumeratePropertiesUsingBlock:(id)a3;
+ (void)generateAndCacheStorageBehaviors;
- (BOOL)isEqual:(id)a3;
- (BOOL)validate:(id *)a3;
- (MTLModel)init;
- (MTLModel)initWithCoder:(id)a3;
- (MTLModel)initWithDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)dictionaryValue;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodeValueForKey:(id)a3 withCoder:(id)a4 modelVersion:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)mergeValueForKey:(id)a3 fromModel:(id)a4;
- (void)mergeValuesForKeysFromModel:(id)a3;
@end

@implementation MTLModel

- (BOOL)isEqual:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (MTLModel *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else if ([(MTLModel *)v4 isMemberOfClass:objc_opt_class()])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = objc_msgSend((id)objc_opt_class(), "permanentPropertyKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v11 = [(MTLModel *)self valueForKey:v10];
          uint64_t v12 = [(MTLModel *)v4 valueForKey:v10];
          if (v11 | v12)
          {
            v13 = (void *)v12;
            int v14 = [(id)v11 isEqual:v12];

            if (!v14)
            {
              BOOL v15 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 1;
LABEL_16:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend((id)objc_opt_class(), "permanentPropertyKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [(MTLModel *)self valueForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        v6 ^= [v9 hash];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  v3 = [(id)objc_opt_class() permanentPropertyKeys];
  uint64_t v4 = [v3 allObjects];
  uint64_t v5 = [(MTLModel *)self dictionaryWithValuesForKeys:v4];

  unint64_t v6 = [NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, v5];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(MTLModel *)self dictionaryValue];
  [v4 setValuesForKeysWithDictionary:v5];

  return v4;
}

- (BOOL)validate:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "propertyKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [(MTLModel *)self valueForKey:v10];
        LODWORD(v10) = MTLValidateAndSetValue(self, v10, v11, 0, (uint64_t)a3);

        if (!v10)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)mergeValuesForKeysFromModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() propertyKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "propertyKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([v5 containsObject:v11]) {
          [(MTLModel *)self mergeValueForKey:v11 fromModel:v4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)mergeValueForKey:(id)a3 fromModel:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  uint64_t v8 = v13;
  id v9 = v7;
  if (!v13)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MTLModel.m", 254, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

    uint64_t v8 = 0;
  }
  SEL v10 = MTLSelectorWithCapitalizedKeyPattern("merge", v8, "FromModel:");
  if (objc_opt_respondsToSelector())
  {
    ((void (*)(MTLModel *, SEL, id))[(MTLModel *)self methodForSelector:v10])(self, v10, v9);
  }
  else if (v9)
  {
    uint64_t v11 = [v9 valueForKey:v13];
    [(MTLModel *)self setValue:v11 forKey:v13];
  }
}

- (NSDictionary)dictionaryValue
{
  v3 = [(id)objc_opt_class() transitoryPropertyKeys];
  id v4 = [(id)objc_opt_class() permanentPropertyKeys];
  uint64_t v5 = [v3 setByAddingObjectsFromSet:v4];

  uint64_t v6 = [v5 allObjects];
  id v7 = [(MTLModel *)self dictionaryWithValuesForKeys:v6];

  return (NSDictionary *)v7;
}

- (MTLModel)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MTLModel *)self init];
  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v20 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [v8 objectForKey:v13];
          long long v15 = [MEMORY[0x1E4F1CA98] null];
          int v16 = [v14 isEqual:v15];

          if (v16) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = v14;
          }
          if (!MTLValidateAndSetValue(v7, v13, v17, 1, (uint64_t)a4))
          {

            long long v18 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    long long v18 = v7;
LABEL_15:
    id v6 = v20;
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (MTLModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLModel;
  return [(MTLModel *)&v3 init];
}

+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = v4;
  Property = class_getProperty(v5, (const char *)[v6 UTF8String]);
  if (Property)
  {
    id v8 = mtl_copyPropertyAttributes(Property);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__MTLModel_storageBehaviorForPropertyWithKey___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v8;
    uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
    int v10 = [a1 instancesRespondToSelector:*((void *)v8 + 2)];
    int v11 = [a1 instancesRespondToSelector:*((void *)v8 + 3)];
    if (v8[4] || (*((void *)v8 + 4) ? (int v12 = 1) : (int v12 = v10), ((v12 | v11) & 1) != 0))
    {
      if (!*v8 || *((void *)v8 + 4))
      {
        unint64_t v13 = 2;
LABEL_14:
        v9[2](v9);

        goto LABEL_15;
      }
      if (([a1 isEqual:objc_opt_class()] & 1) == 0)
      {
        unint64_t v13 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "storageBehaviorForPropertyWithKey:", v6);
        goto LABEL_14;
      }
    }
    unint64_t v13 = 0;
    goto LABEL_14;
  }
  unint64_t v13 = 0;
LABEL_15:

  return v13;
}

void __46__MTLModel_storageBehaviorForPropertyWithKey___block_invoke(uint64_t a1)
{
}

+ (id)permanentPropertyKeys
{
  objc_super v3 = objc_getAssociatedObject(a1, (const void *)MTLModelCachedPermanentPropertyKeysKey);
  if (!v3)
  {
    [a1 generateAndCacheStorageBehaviors];
    objc_super v3 = objc_getAssociatedObject(a1, (const void *)MTLModelCachedPermanentPropertyKeysKey);
  }
  return v3;
}

+ (id)transitoryPropertyKeys
{
  objc_super v3 = objc_getAssociatedObject(a1, (const void *)MTLModelCachedTransitoryPropertyKeysKey);
  if (!v3)
  {
    [a1 generateAndCacheStorageBehaviors];
    objc_super v3 = objc_getAssociatedObject(a1, (const void *)MTLModelCachedTransitoryPropertyKeysKey);
  }
  return v3;
}

+ (id)propertyKeys
{
  objc_super v3 = objc_getAssociatedObject(a1, (const void *)MTLModelCachedPropertyKeysKey);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __24__MTLModel_propertyKeys__block_invoke;
    v8[3] = &unk_1E6553980;
    id v10 = a1;
    id v5 = v6;
    id v9 = v5;
    [a1 enumeratePropertiesUsingBlock:v8];
    objc_setAssociatedObject(a1, (const void *)MTLModelCachedPropertyKeysKey, v5, (void *)0x303);
  }
  return v5;
}

void __24__MTLModel_propertyKeys__block_invoke(uint64_t a1, objc_property_t property)
{
  id v3 = [NSString stringWithUTF8String:property_getName(property)];
  if (objc_msgSend(*(id *)(a1 + 40), "storageBehaviorForPropertyWithKey:")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (void)enumeratePropertiesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, objc_property_t, unsigned char *))a3;
  char v11 = 0;
  do
  {
    if ([a1 isEqual:objc_opt_class()]) {
      break;
    }
    unsigned int outCount = 0;
    id v5 = class_copyPropertyList((Class)a1, &outCount);
    a1 = (id)[a1 superclass];
    if (v5)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __42__MTLModel_enumeratePropertiesUsingBlock___block_invoke;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = v5;
      id v6 = (void (**)(void))_Block_copy(v9);
      if (outCount)
      {
        unint64_t v7 = 0;
        do
        {
          v4[2](v4, v5[v7++], &v11);
          if (v11) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v7 >= outCount;
          }
        }
        while (!v8);
      }
      v6[2](v6);
    }
  }
  while (!v11);
}

void __42__MTLModel_enumeratePropertiesUsingBlock___block_invoke(uint64_t a1)
{
}

+ (id)modelWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = (void *)[objc_alloc((Class)a1) initWithDictionary:v6 error:a4];

  return v7;
}

+ (void)generateAndCacheStorageBehaviors
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a1, "propertyKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [a1 storageBehaviorForPropertyWithKey:v10];
        int v12 = v3;
        if (v11 != 1)
        {
          if (v11 != 2) {
            continue;
          }
          int v12 = v4;
        }
        [v12 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  objc_setAssociatedObject(a1, (const void *)MTLModelCachedTransitoryPropertyKeysKey, v3, (void *)0x303);
  objc_setAssociatedObject(a1, (const void *)MTLModelCachedPermanentPropertyKeysKey, v4, (void *)0x303);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (coderRequiresSecureCoding(v5))
  {
    uint64_t v6 = objc_opt_class();
    verifyAllowedClassesByPropertyKey(v6);
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "modelVersion"));
  [v5 encodeObject:v7 forKey:@"MTLModelVersion"];

  uint64_t v8 = [(id)objc_opt_class() encodingBehaviorsByPropertyKey];
  id v9 = [(MTLModel *)self dictionaryValue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__MTLModel_NSCoding__encodeWithCoder___block_invoke;
  v12[3] = &unk_1E6554B48;
  id v13 = v8;
  id v14 = v5;
  long long v15 = self;
  SEL v16 = a2;
  id v10 = v5;
  id v11 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
}

void __38__MTLModel_NSCoding__encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if (v9)
    {
      if (v9 == 2)
      {
        [*(id *)(a1 + 40) encodeConditionalObject:v5 forKey:v15];
      }
      else if (v9 == 1)
      {
        [*(id *)(a1 + 40) encodeObject:v5 forKey:v15];
      }
      else
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v11 = *(void *)(a1 + 56);
        uint64_t v13 = objc_opt_class();
        id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
        [v10 handleFailureInMethod:v11, v12, @"MTLModel+NSCoding.m", 232, @"Unrecognized encoding behavior %@ on class %@ for key \"%@\"", v13, v14, v15 object file lineNumber description];
      }
    }
  }
}

- (MTLModel)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = coderRequiresSecureCoding(v5);
  if (v6) {
    [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MTLModelVersion"];
  }
  else {
  char v7 = [v5 decodeObjectForKey:@"MTLModelVersion"];
  }
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v11 = objc_opt_class();
    NSLog(&cfstr_WarningDecodin.isa, v11);
LABEL_8:
    if (v6)
    {
      uint64_t v12 = objc_opt_class();
      verifyAllowedClassesByPropertyKey(v12);
    }
    else
    {
      uint64_t v13 = [v5 decodeObjectForKey:@"externalRepresentation"];
      if (v13)
      {
        id v14 = (id)v13;
        uint64_t v15 = [(id)objc_opt_class() methodForSelector:sel_dictionaryValueFromArchivedExternalRepresentation_version_];
        if (v15 == +[MTLModel methodForSelector:sel_dictionaryValueFromArchivedExternalRepresentation_version_])
        {
          v27 = [MEMORY[0x1E4F28B00] currentHandler];
          [v27 handleFailureInMethod:a2, self, @"MTLModel+NSCoding.m", 177, @"Decoded an old archive of %@ that contains an externalRepresentation, but +dictionaryValueFromArchivedExternalRepresentation:version: is not overridden to handle it", objc_opt_class() object file lineNumber description];
        }
        SEL v16 = objc_msgSend((id)objc_opt_class(), "dictionaryValueFromArchivedExternalRepresentation:version:", v14, objc_msgSend(v8, "unsignedIntegerValue"));
        if (!v16)
        {
          id v10 = 0;
          goto LABEL_28;
        }
        id v35 = 0;
        uint64_t v17 = [(MTLModel *)self initWithDictionary:v16 error:&v35];
        id v18 = v35;
        if (!v17)
        {
          uint64_t v28 = objc_opt_class();
          NSLog(&cfstr_CouldNotDecode.isa, v28, v18);
        }
LABEL_27:
        self = v17;

        id v10 = self;
LABEL_28:

        goto LABEL_29;
      }
    }
    uint64_t v19 = [(id)objc_opt_class() propertyKeys];
    SEL v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v19, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = v19;
    uint64_t v20 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v14);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v25 = -[MTLModel decodeValueForKey:withCoder:modelVersion:](self, "decodeValueForKey:withCoder:modelVersion:", v24, v5, [v8 unsignedIntegerValue]);
          if (v25) {
            [v16 setObject:v25 forKeyedSubscript:v24];
          }
        }
        uint64_t v21 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v21);
    }

    id v30 = 0;
    uint64_t v17 = [(MTLModel *)self initWithDictionary:v16 error:&v30];
    id v18 = v30;
    if (!v17)
    {
      uint64_t v29 = objc_opt_class();
      NSLog(&cfstr_CouldNotUnarch.isa, v29, v18);
    }
    goto LABEL_27;
  }
  unint64_t v9 = [v7 unsignedIntegerValue];
  if (v9 <= [(id)objc_opt_class() modelVersion]) {
    goto LABEL_8;
  }
  id v10 = 0;
LABEL_29:

  return v10;
}

- (id)decodeValueForKey:(id)a3 withCoder:(id)a4 modelVersion:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MTLModel+NSCoding.m", 126, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"MTLModel+NSCoding.m", 127, @"Invalid parameter not satisfying: %@", @"coder != nil" object file lineNumber description];

LABEL_3:
  SEL v12 = MTLSelectorWithCapitalizedKeyPattern("decode", v9, "WithCoder:modelVersion:");
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = ((void (*)(MTLModel *, SEL, void *, unint64_t))[(MTLModel *)self methodForSelector:v12])(self, v12, v11, a5);
LABEL_10:
    uint64_t v17 = (void *)v13;
    goto LABEL_11;
  }
  if (!coderRequiresSecureCoding(v11))
  {
    uint64_t v13 = [v11 decodeObjectForKey:v9];
    goto LABEL_10;
  }
  id v14 = [(id)objc_opt_class() allowedSecureCodingClassesByPropertyKey];
  uint64_t v15 = [v14 objectForKeyedSubscript:v9];

  if (!v15)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MTLModel+NSCoding.m", 141, @"No allowed classes specified for securely decoding key \"%@\" on %@", v9, objc_opt_class() object file lineNumber description];
  }
  SEL v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
  uint64_t v17 = [v11 decodeObjectOfClasses:v16 forKey:v9];

LABEL_11:
  return v17;
}

+ (id)dictionaryValueFromArchivedExternalRepresentation:(id)a3 version:(unint64_t)a4
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_getAssociatedObject(a1, (const void *)MTLModelCachedAllowedClassesKey);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_21;
  }
  int v6 = [a1 encodingBehaviorsByPropertyKey];
  char v7 = [v6 keysOfEntriesPassingTest:&__block_literal_global_48503];

  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)v25;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(*((void *)&v24 + 1) + 8 * v10);
      Property = class_getProperty((Class)a1, (const char *)[v11 UTF8String]);
      if (Property)
      {
        uint64_t v13 = mtl_copyPropertyAttributes(Property);
      }
      else
      {
        id v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2, a1, @"MTLModel+NSCoding.m", 98, @"Could not find property \"%@\" on %@", v11, a1 object file lineNumber description];

        uint64_t v13 = mtl_copyPropertyAttributes(0);
      }
      id v14 = v13;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __61__MTLModel_NSCoding__allowedSecureCodingClassesByPropertyKey__block_invoke_2;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v13;
      uint64_t v15 = (void (**)(void))_Block_copy(aBlock);
      int v16 = v14[48];
      if (v16 == 35 || v16 == 64)
      {
        if (!*((void *)v14 + 5)) {
          goto LABEL_16;
        }
        uint64_t v28 = *((void *)v14 + 5);
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        [v5 setObject:v17 forKeyedSubscript:v11];
      }
      else
      {
        uint64_t v29 = objc_opt_class();
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        [v5 setObject:v17 forKeyedSubscript:v11];
      }

LABEL_16:
      v15[2](v15);

      ++v10;
    }
    while (v8 != v10);
    uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    uint64_t v8 = v19;
  }
  while (v19);
LABEL_20:

  objc_setAssociatedObject(a1, (const void *)MTLModelCachedAllowedClassesKey, v5, (void *)0x303);
  id v4 = 0;
LABEL_21:

  return v5;
}

void __61__MTLModel_NSCoding__allowedSecureCodingClassesByPropertyKey__block_invoke_2(uint64_t a1)
{
}

BOOL __61__MTLModel_NSCoding__allowedSecureCodingClassesByPropertyKey__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 unsignedIntegerValue] != 0;
}

+ (id)encodingBehaviorsByPropertyKey
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 propertyKeys];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v21 + 1) + 8 * v7);
        Property = class_getProperty((Class)a1, (const char *)[v8 UTF8String]);
        if (Property)
        {
          uint64_t v10 = mtl_copyPropertyAttributes(Property);
        }
        else
        {
          uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, a1, @"MTLModel+NSCoding.m", 71, @"Could not find property \"%@\" on %@", v8, a1 object file lineNumber description];

          uint64_t v10 = mtl_copyPropertyAttributes(0);
        }
        id v11 = v10;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __52__MTLModel_NSCoding__encodingBehaviorsByPropertyKey__block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v10;
        SEL v12 = (void (**)(void))_Block_copy(aBlock);
        if (v11[2]) {
          uint64_t v13 = 2;
        }
        else {
          uint64_t v13 = 1;
        }
        id v14 = [NSNumber numberWithUnsignedInteger:v13];
        [v4 setObject:v14 forKeyedSubscript:v8];

        v12[2](v12);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v5 = v16;
    }
    while (v16);
  }

  return v4;
}

void __52__MTLModel_NSCoding__encodingBehaviorsByPropertyKey__block_invoke(uint64_t a1)
{
}

+ (unint64_t)modelVersion
{
  return 0;
}

@end