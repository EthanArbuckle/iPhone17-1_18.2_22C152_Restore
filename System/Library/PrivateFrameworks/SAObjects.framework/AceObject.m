@interface AceObject
+ (BOOL)supportsSecureCoding;
+ (id)_aceObjectWithMutableDictionary:(id)a3;
+ (id)_aceObjectWithMutableDictionary:(id)a3 context:(id)a4;
+ (id)_filteredDictionaryForKeySet:(id)a3 plistData:(id)a4;
+ (id)_newAceObjectWithMutableDictionary:(id)a3;
+ (id)aceObjectArrayWithDictionaryArray:(id)a3 baseClass:(Class)a4;
+ (id)aceObjectArrayWithDictionaryArray:(id)a3 baseProtocol:(id)a4;
+ (id)aceObjectDictionaryWithDictionary:(id)a3 baseClass:(Class)a4;
+ (id)aceObjectDictionaryWithDictionary:(id)a3 baseProtocol:(id)a4;
+ (id)aceObjectWithDictionary:(id)a3;
+ (id)aceObjectWithDictionary:(id)a3 context:(id)a4;
+ (id)aceObjectWithGenericCommand:(id)a3;
+ (id)aceObjectWithGenericCommand:(id)a3 context:(id)a4;
+ (id)aceObjectWithPlistData:(id)a3;
+ (id)dictionaryArrayWithAceObjectArray:(id)a3;
+ (id)dictionaryWithAceObjectDictionary:(id)a3;
+ (id)newAceObjectWithDictionary:(id)a3 context:(id)a4;
+ (id)newAceObjectWithGenericCommand:(id)a3 context:(id)a4;
- (AceObject)init;
- (AceObject)initWithCoder:(id)a3;
- (AceObject)initWithDictionary:(id)a3;
- (AceObject)initWithDictionary:(id)a3 context:(id)a4;
- (BOOL)_isDeserialized;
- (BOOL)hasArrayForPropertyForKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)mutatingCommand;
- (NSData)plistData;
- (NSMutableDictionary)dict;
- (NSNumber)usefulnessScore;
- (NSString)aceId;
- (NSString)description;
- (NSString)refId;
- (id)_descriptionHint;
- (id)_dict;
- (id)_initWithMutableDictionary:(id)a3;
- (id)_initWithPlistData:(id)a3 aceId:(id)a4 refId:(id)a5 usefulnessScore:(id)a6 mutatingCommand:(id)a7;
- (id)_serializedData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deserializationDuration;
- (id)encodedClassName;
- (id)forceEagerDeserialization;
- (id)fullDescription;
- (id)groupIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertyForKey:(id)a3;
- (id)propertyForKeyWithoutDeserializing:(id)a3;
- (unint64_t)hash;
- (void)_appendDescriptionOfObject:(id)a3 toString:(id)a4 atDepth:(unint64_t)a5 withPrefixes:(id)a6 hint:(id)a7;
- (void)_deserializeFromPlistData;
- (void)encodeWithCoder:(id)a3;
- (void)setAceId:(id)a3;
- (void)setMutatingCommand:(BOOL)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setRefId:(id)a3;
- (void)setUsefulnessScore:(id)a3;
- (void)updateUsingSet:(id)a3 add:(id)a4 remove:(id)a5;
@end

@implementation AceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AceObjectCodingKeyPlistData"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AceObjectCodingKeyAceId"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AceObjectCodingKeyRefId"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AceObjectCodingKeyUsefulnessScore"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AceObjectCodingKeyIsMutatingCommand"];
    v10 = [(AceObject *)self _initWithPlistData:v5 aceId:v6 refId:v7 usefulnessScore:v8 mutatingCommand:v9];
  }
  else
  {
    v6 = [v4 decodePropertyListForKey:@"AceObjectCodingKeyDictionary"];
    v10 = [(AceObject *)self initWithDictionary:v6];
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  plistData = self->_plistData;
  id v7 = a3;
  if (plistData)
  {
    [v7 encodeObject:plistData forKey:@"AceObjectCodingKeyPlistData"];
    [v7 encodeObject:self->_aceId forKey:@"AceObjectCodingKeyAceId"];
    [v7 encodeObject:self->_refId forKey:@"AceObjectCodingKeyRefId"];
    [v7 encodeObject:self->_usefulnessScore forKey:@"AceObjectCodingKeyUsefulnessScore"];
    [v7 encodeObject:self->_mutatingCommand forKey:@"AceObjectCodingKeyIsMutatingCommand"];
    v5 = v7;
  }
  else
  {
    uint64_t v6 = [(AceObject *)self dictionary];
    [v7 encodeObject:v6 forKey:@"AceObjectCodingKeyDictionary"];

    v5 = (void *)v6;
  }
}

+ (id)aceObjectWithGenericCommand:(id)a3
{
  id v4 = [a3 dictionary];
  v5 = [a1 aceObjectWithDictionary:v4];

  return v5;
}

+ (id)aceObjectWithGenericCommand:(id)a3 context:(id)a4
{
  id v4 = +[AceObject newAceObjectWithGenericCommand:a3 context:a4];
  return v4;
}

+ (id)aceObjectWithDictionary:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  v5 = [a1 _aceObjectWithMutableDictionary:v4];

  return v5;
}

+ (id)aceObjectWithDictionary:(id)a3 context:(id)a4
{
  id v4 = +[AceObject newAceObjectWithDictionary:a3 context:a4];
  return v4;
}

+ (id)newAceObjectWithGenericCommand:(id)a3 context:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 dictionary];
  id v7 = +[AceObject newAceObjectWithDictionary:v6 context:v5];

  return v7;
}

+ (id)newAceObjectWithDictionary:(id)a3 context:(id)a4
{
  id v4 = (void *)[a3 mutableCopy];
  id v5 = +[AceObject _newAceObjectWithMutableDictionary:v4];

  return v5;
}

+ (id)_aceObjectWithMutableDictionary:(id)a3 context:(id)a4
{
  id v4 = +[AceObject _newAceObjectWithMutableDictionary:](AceObject, "_newAceObjectWithMutableDictionary:", a3, a4);
  return v4;
}

+ (id)_newAceObjectWithMutableDictionary:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_aceObjectWithMutableDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"$group"];
  uint64_t v5 = [v3 objectForKey:@"$class"];
  uint64_t v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5)
  {
    v8 = +[BasicAceContext sharedBasicAceContext];
    v9 = (objc_class *)[v8 classWithClassName:v6 group:v4];

    v10 = (SAGenericCommand *)[v9 alloc];
    if (!v10) {
      v10 = [SAGenericCommand alloc];
    }
    id v7 = [(AceObject *)v10 _initWithMutableDictionary:v3];
  }

  return v7;
}

+ (id)aceObjectArrayWithDictionaryArray:(id)a3 baseClass:(Class)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__AceObject_aceObjectArrayWithDictionaryArray_baseClass___block_invoke;
  v6[3] = &__block_descriptor_48_e33___AceObject_16__0__NSDictionary_8lu40l8;
  v6[4] = a1;
  v6[5] = a4;
  id v4 = objc_msgSend(a3, "_sa_mappedArrayWithBlock:", v6);
  return v4;
}

id __57__AceObject_aceObjectArrayWithDictionaryArray_baseClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) aceObjectWithDictionary:v3];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = objc_opt_class();
    NSLog(&cfstr_UnexpectedObje.isa, v5, v6, v3);

    id v4 = 0;
  }

  return v4;
}

+ (id)aceObjectDictionaryWithDictionary:(id)a3 baseClass:(Class)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__AceObject_aceObjectDictionaryWithDictionary_baseClass___block_invoke;
  v10[3] = &unk_1E5CD7AA0;
  id v12 = a1;
  Class v13 = a4;
  id v11 = v6;
  id v7 = v6;
  v8 = objc_msgSend(v7, "_sa_mappedDictionaryWithBlock:", v10);

  return v8;
}

id __57__AceObject_aceObjectDictionaryWithDictionary_baseClass___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 40), "aceObjectWithDictionary:");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = objc_opt_class();
    NSLog(&cfstr_UnexpectedObje.isa, v3, v4, *(void *)(a1 + 32));

    v2 = 0;
  }
  return v2;
}

+ (id)aceObjectArrayWithDictionaryArray:(id)a3 baseProtocol:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AceObject_aceObjectArrayWithDictionaryArray_baseProtocol___block_invoke;
  v10[3] = &unk_1E5CD7AC8;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  v8 = objc_msgSend(a3, "_sa_mappedArrayWithBlock:", v10);

  return v8;
}

id __60__AceObject_aceObjectArrayWithDictionaryArray_baseProtocol___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 40) aceObjectWithDictionary:v3];
  if (([v4 conformsToProtocol:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v5 = NSStringFromProtocol(*(Protocol **)(a1 + 32));
    uint64_t v6 = objc_opt_class();
    NSLog(&cfstr_UnexpectedObje.isa, v5, v6, v3);

    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)aceObjectDictionaryWithDictionary:(id)a3 baseProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__AceObject_aceObjectDictionaryWithDictionary_baseProtocol___block_invoke;
  v12[3] = &unk_1E5CD7AF0;
  id v14 = v6;
  id v15 = a1;
  id v13 = v7;
  id v8 = v6;
  id v9 = v7;
  v10 = objc_msgSend(v8, "_sa_mappedDictionaryWithBlock:", v12);

  return v10;
}

id __60__AceObject_aceObjectDictionaryWithDictionary_baseProtocol___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 48), "aceObjectWithDictionary:");
  if (([v2 conformsToProtocol:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = NSStringFromProtocol(*(Protocol **)(a1 + 32));
    uint64_t v4 = objc_opt_class();
    NSLog(&cfstr_UnexpectedObje.isa, v3, v4, *(void *)(a1 + 40));

    v2 = 0;
  }
  return v2;
}

+ (id)dictionaryArrayWithAceObjectArray:(id)a3
{
  return (id)objc_msgSend(a3, "_sa_mappedArrayWithBlock:", &__block_literal_global);
}

uint64_t __47__AceObject_dictionaryArrayWithAceObjectArray___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionary];
}

+ (id)dictionaryWithAceObjectDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "_sa_mappedDictionaryWithBlock:", &__block_literal_global_48);
}

uint64_t __47__AceObject_dictionaryWithAceObjectDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 dictionary];
}

+ (id)aceObjectWithPlistData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_MergedGlobals != -1) {
      dispatch_once(&_MergedGlobals, &__block_literal_global_267);
    }
    id v4 = (id)qword_1EB4EC9C8;
    uint64_t v5 = [(id)objc_opt_class() _filteredDictionaryForKeySet:v4 plistData:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [v5 objectForKey:@"$group"];
  uint64_t v7 = [v5 objectForKey:@"$class"];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    v10 = +[BasicAceContext sharedBasicAceContext];
    id v11 = (objc_class *)[v10 classWithClassName:v8 group:v6];
    if (!v11) {
      id v11 = (objc_class *)objc_opt_class();
    }

    id v12 = [v11 alloc];
    id v13 = [v5 objectForKey:@"aceId"];
    id v14 = [v5 objectForKey:@"refId"];
    id v15 = [v5 objectForKey:@"usefulnessScore"];
    v16 = [v5 objectForKey:@"mutatingCommand"];
    id v9 = (void *)[v12 _initWithPlistData:v3 aceId:v13 refId:v14 usefulnessScore:v15 mutatingCommand:v16];
  }
  return v9;
}

- (AceObject)init
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"$class";
  id v3 = [(AceObject *)self encodedClassName];
  v8[1] = @"$group";
  v9[0] = v3;
  id v4 = [(AceObject *)self groupIdentifier];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [(AceObject *)self initWithDictionary:v5];

  return v6;
}

- (id)_initWithPlistData:(id)a3 aceId:(id)a4 refId:(id)a5 usefulnessScore:(id)a6 mutatingCommand:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)AceObject;
  v17 = [(AceObject *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    plistData = v17->_plistData;
    v17->_plistData = (NSData *)v18;

    uint64_t v20 = [v13 copy];
    aceId = v17->_aceId;
    v17->_aceId = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    refId = v17->_refId;
    v17->_refId = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    usefulnessScore = v17->_usefulnessScore;
    v17->_usefulnessScore = (NSNumber *)v24;

    uint64_t v26 = [v16 copy];
    mutatingCommand = v17->_mutatingCommand;
    v17->_mutatingCommand = (NSNumber *)v26;
  }
  return v17;
}

- (AceObject)initWithDictionary:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  uint64_t v5 = [(AceObject *)self _initWithMutableDictionary:v4];

  return v5;
}

- (AceObject)initWithDictionary:(id)a3 context:(id)a4
{
  uint64_t v5 = (void *)[a3 mutableCopy];
  id v6 = [(AceObject *)self _initWithMutableDictionary:v5];

  return v6;
}

- (id)_initWithMutableDictionary:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AceObject;
  id v6 = [(AceObject *)&v22 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dict, a3);
    id v8 = [v5 objectForKey:@"aceId"];
    uint64_t v9 = [v8 copy];
    aceId = v7->_aceId;
    v7->_aceId = (NSString *)v9;

    id v11 = [v5 objectForKey:@"refId"];
    uint64_t v12 = [v11 copy];
    refId = v7->_refId;
    v7->_refId = (NSString *)v12;

    id v14 = [v5 objectForKey:@"usefulnessScore"];
    uint64_t v15 = [v14 copy];
    usefulnessScore = v7->_usefulnessScore;
    v7->_usefulnessScore = (NSNumber *)v15;

    v17 = [v5 objectForKey:@"mutatingCommand"];
    uint64_t v18 = [v17 copy];
    mutatingCommand = v7->_mutatingCommand;
    v7->_mutatingCommand = (NSNumber *)v18;

    uint64_t v20 = v7;
  }

  return v7;
}

- (void)_deserializeFromPlistData
{
  CFPropertyListFormat format = 0;
  id v3 = (NSMutableDictionary *)CFPropertyListCreateWithData(0, (CFDataRef)self->_plistData, 1uLL, &format, 0);
  if (v3)
  {
    dict = self->_dict;
    self->_dict = v3;

    aceId = self->_aceId;
    if (aceId) {
      [(NSMutableDictionary *)self->_dict setValue:aceId forKey:@"aceId"];
    }
    refId = self->_refId;
    if (refId) {
      [(NSMutableDictionary *)self->_dict setValue:refId forKey:@"refId"];
    }
    usefulnessScore = self->_usefulnessScore;
    if (usefulnessScore) {
      [(NSMutableDictionary *)self->_dict setValue:usefulnessScore forKey:@"usefulnessScore"];
    }
    mutatingCommand = self->_mutatingCommand;
    if (mutatingCommand) {
      [(NSMutableDictionary *)self->_dict setValue:mutatingCommand forKey:@"mutatingCommand"];
    }
  }
}

- (id)_dict
{
  dict = self->_dict;
  if (!dict)
  {
    if (self->_plistData)
    {
      [(AceObject *)self _deserializeFromPlistData];
      dict = self->_dict;
    }
    else
    {
      dict = 0;
    }
  }
  return dict;
}

- (id)encodedClassName
{
  return [(AceObject *)self topLevelPropertyForKey:@"$class"];
}

- (id)groupIdentifier
{
  return [(AceObject *)self topLevelPropertyForKey:@"$group"];
}

- (void)setAceId:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_aceId, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    aceId = self->_aceId;
    self->_aceId = v4;

    if (self->_dict) {
      [(AceObject *)self setTopLevelProperty:self->_aceId forKey:@"aceId"];
    }
  }
}

- (void)setRefId:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_refId, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    refId = self->_refId;
    self->_refId = v4;

    if (self->_dict) {
      [(AceObject *)self setTopLevelProperty:self->_refId forKey:@"refId"];
    }
  }
}

- (BOOL)mutatingCommand
{
  return [(NSNumber *)self->_mutatingCommand BOOLValue];
}

- (void)setMutatingCommand:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSNumber *)self->_mutatingCommand BOOLValue] != a3)
  {
    id v5 = [NSNumber numberWithBool:v3];
    mutatingCommand = self->_mutatingCommand;
    self->_mutatingCommand = v5;

    if (self->_dict)
    {
      uint64_t v7 = self->_mutatingCommand;
      [(AceObject *)self setTopLevelProperty:v7 forKey:@"mutatingCommand"];
    }
  }
}

- (void)setUsefulnessScore:(id)a3
{
  id v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_usefulnessScore, "isEqualToNumber:"))
  {
    id v4 = (NSNumber *)[v6 copy];
    usefulnessScore = self->_usefulnessScore;
    self->_usefulnessScore = v4;

    if (self->_dict) {
      [(AceObject *)self setTopLevelProperty:self->_usefulnessScore forKey:@"usefulnessScore"];
    }
  }
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AceObject *)self _dict];
  [v8 setValue:v7 forKey:v6];
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AceObject *)self _dict];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)propertyForKeyWithoutDeserializing:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dict)
  {
    id v6 = [(AceObject *)self propertyForKey:v4];
  }
  else if (v4 && self->_plistData)
  {
    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    if (v7)
    {
      id v8 = [(id)objc_opt_class() _filteredDictionaryForKeySet:v7 plistData:self->_plistData];
      id v6 = [v8 valueForKey:v5];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasArrayForPropertyForKey:(id)a3
{
  id v4 = a3;
  if (self->_dict || !self->_plistData)
  {
    id v5 = [(AceObject *)self propertyForKey:v4];
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0 && [v5 count] != 0;
  }
  else
  {
    BOOL v6 = _CFPropertyListCreateSingleValue()
      && (CFTypeID v8 = CFGetTypeID(0), v8 == CFArrayGetTypeID())
      && CFArrayGetCount(0) > 0;
  }

  return v6;
}

- (id)forceEagerDeserialization
{
  if (!self->_dict && self->_plistData) {
    [(AceObject *)self _deserializeFromPlistData];
  }
  return self;
}

- (id)_serializedData
{
  return self->_plistData;
}

- (BOOL)_isDeserialized
{
  return self->_dict != 0;
}

- (id)_descriptionHint
{
  return 0;
}

- (id)fullDescription
{
  id v3 = [(AceObject *)self forceEagerDeserialization];
  if (self->_dict)
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    [v4 appendString:@"["];
    id v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    [v4 appendString:v6];

    [v4 appendString:@" "];
    id v7 = [(AceObject *)self dictionary];
    CFTypeID v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [(AceObject *)self _descriptionHint];
    [(AceObject *)self _appendDescriptionOfObject:v7 toString:v4 atDepth:0 withPrefixes:v8 hint:v9];

    [v4 appendString:@"]"];
  }
  else
  {
    v10 = NSString;
    id v11 = [(AceObject *)self groupIdentifier];
    uint64_t v12 = [(AceObject *)self encodedClassName];
    id v4 = [v10 stringWithFormat:@"Serialized object group: %@ class: %@ aceId: %@ refId: %@", v11, v12, self->_aceId, self->_refId];
  }
  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [(AceObject *)self groupIdentifier];
  id v7 = [(AceObject *)self encodedClassName];
  dict = self->_dict;
  if (!dict)
  {
    aceId = self->_aceId;
LABEL_5:
    id v11 = [v3 stringWithFormat:@"%@ group: %@ class: %@ aceId: %@ refId: %@", v5, v6, v7, aceId, self->_refId];
    if (!dict) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  aceId = [(AceObject *)self aceId];
  if (!self->_dict) {
    goto LABEL_5;
  }
  v10 = [(AceObject *)self refId];
  id v11 = [v3 stringWithFormat:@"%@ group: %@ class: %@ aceId: %@ refId: %@", v5, v6, v7, aceId, v10];

LABEL_6:
LABEL_7:

  return (NSString *)v11;
}

- (void)_appendDescriptionOfObject:(id)a3 toString:(id)a4 atDepth:(unint64_t)a5 withPrefixes:(id)a6 hint:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v49 = v13;
  if ([v13 count] <= a5)
  {
    unint64_t v15 = [v13 count];
    if (v15 <= a5)
    {
      unint64_t v16 = v15;
      do
      {
        v17 = [MEMORY[0x1E4F28E78] stringWithString:@"\n  "];
        if (v16)
        {
          for (uint64_t i = 0; i != v16; ++i)
            [v17 appendString:@"  "];
        }
        [v13 addObject:v17];

        ++v16;
      }
      while (v16 <= a5);
    }
  }
  v48 = [v13 objectAtIndexedSubscript:a5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v11 count])
      {
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __75__AceObject__appendDescriptionOfObject_toString_atDepth_withPrefixes_hint___block_invoke;
        v50[3] = &unk_1E5CD7B58;
        id v51 = v12;
        id v52 = v48;
        v53 = self;
        unint64_t v55 = a5;
        id v54 = v13;
        [v11 enumerateObjectsUsingBlock:v50];

        goto LABEL_42;
      }
      v32 = @"<empty array>";
      v31 = v12;
LABEL_36:
      [v31 appendString:v32];
      goto LABEL_42;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v11 length] >= 0x33)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v27 = v11;
      v28 = objc_msgSend(v26, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v27, "bytes"), 50, 0);
      objc_super v29 = [v28 description];
      [v12 appendString:v29];

      [v12 appendFormat:@"%@ <truncated; %lu total bytes>", v28, objc_msgSend(v27, "length")];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 appendString:@"\""];
        [v12 appendString:v11];
        v31 = v12;
        v32 = @"\"";
        goto LABEL_36;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [v11 descriptionWithLocale:0];
        [v12 appendFormat:@"%@", v28, v43];
      }
      else
      {
        v28 = [v11 description];
        [v12 appendString:v28];
      }
    }

    goto LABEL_42;
  }
  id v19 = v11;
  if ([v19 count])
  {
    id v46 = v19;
    uint64_t v20 = [v19 allKeys];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [MEMORY[0x1E4F1CA80] setWithArray:v20];
      id v22 = v14;

      v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
      [v21 minusSet:v23];

      uint64_t v24 = [v21 allObjects];
      uint64_t v20 = [v22 arrayByAddingObjectsFromArray:v24];
    }
    id v45 = v11;
    objc_opt_class();
    id v44 = v14;
    if (objc_opt_isKindOfClass()) {
      id v25 = v14;
    }
    else {
      id v25 = 0;
    }
    v30 = v46;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v33 = v20;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v57;
      unint64_t v37 = a5 + 1;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v57 != v36) {
            objc_enumerationMutation(v33);
          }
          v39 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          v40 = [v30 objectForKey:v39];
          if (v40)
          {
            [v12 appendString:v48];
            v41 = [v39 description];
            [v12 appendString:v41];

            v30 = v46;
            [v12 appendString:@": "];
            v42 = [v25 objectForKeyedSubscript:v39];
            [(AceObject *)self _appendDescriptionOfObject:v40 toString:v12 atDepth:v37 withPrefixes:v49 hint:v42];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v35);
    }

    id v14 = v44;
    id v11 = v45;
  }
  else
  {
    [v12 appendString:@"<empty dict>"];
    v30 = v19;
  }

LABEL_42:
}

void __75__AceObject__appendDescriptionOfObject_toString_atDepth_withPrefixes_hint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  [v5 appendString:v6];
  [*(id *)(a1 + 32) appendString:@"["];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%lu", a3);
  [*(id *)(a1 + 32) appendString:@"] "];
  [*(id *)(a1 + 48) _appendDescriptionOfObject:v7 toString:*(void *)(a1 + 32) atDepth:*(void *)(a1 + 64) + 1 withPrefixes:*(void *)(a1 + 56) hint:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(AceObject *)self dictionary];
  uint64_t v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(AceObject *)self dictionary];
  uint64_t v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    plistData = self->_plistData;
    if (plistData && v5[5])
    {
      char v7 = -[NSData isEqualToData:](plistData, "isEqualToData:");
    }
    else
    {
      CFTypeID v8 = [(AceObject *)self _dict];
      uint64_t v9 = [v5 dictionary];
      char v7 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AceObject *)self _dict];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)_filteredDictionaryForKeySet:(id)a3 plistData:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    if (_CFPropertyListCreateFiltered() && (CFTypeID v5 = CFGetTypeID(0), v5 == CFDictionaryGetTypeID()))
    {
      id v6 = 0;
      id v4 = v6;
      if (v6) {
        CFRelease(v6);
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  char v7 = (void *)[v4 copy];

  return v7;
}

- (id)deserializationDuration
{
  return &unk_1EFD71D90;
}

- (void)updateUsingSet:(id)a3 add:(id)a4 remove:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = v10;
  Class Class = object_getClass(self);
  if (Class)
  {
    Superclass = Class;
    objc_super v29 = self;
    id v30 = v12;
    do
    {
      unsigned int outCount = 0;
      unint64_t v15 = class_copyPropertyList(Superclass, &outCount);
      if (v15)
      {
        unint64_t v16 = v15;
        v28 = Superclass;
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            Name = property_getName(v16[i]);
            if (Name)
            {
              id v19 = (void *)[[NSString alloc] initWithUTF8String:Name];
              if (v19)
              {
                uint64_t v20 = [v8 propertyForKey:v19];
                if (v20) {
                  [(AceObject *)self setProperty:v20 forKey:v19];
                }
                v21 = objc_msgSend(v11, "propertyForKey:", v19, v28);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v22 = v11;
                  id v23 = v8;
                  uint64_t v24 = [(AceObject *)self propertyForKey:v19];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v25 = [v24 arrayByAddingObjectsFromArray:v21];
                    [(AceObject *)self setProperty:v25 forKey:v19];
                  }
                  else
                  {
                    uint64_t v26 = [v21 copy];

                    [(AceObject *)self setProperty:v26 forKey:v19];
                    v21 = (void *)v26;
                  }

                  id v8 = v23;
                  id v11 = v22;
                  self = v29;
                  id v12 = v30;
                }
                id v27 = [v12 propertyForKey:v19];

                if (v27) {
                  [(AceObject *)self setProperty:0 forKey:v19];
                }
              }
            }
          }
        }
        free(v16);
        Superclass = v28;
      }
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
  }
}

- (NSString)aceId
{
  return self->_aceId;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSNumber)usefulnessScore
{
  return self->_usefulnessScore;
}

- (NSData)plistData
{
  return self->_plistData;
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_plistData, 0);
  objc_storeStrong((id *)&self->_usefulnessScore, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_aceId, 0);
  objc_storeStrong((id *)&self->_mutatingCommand, 0);
}

@end