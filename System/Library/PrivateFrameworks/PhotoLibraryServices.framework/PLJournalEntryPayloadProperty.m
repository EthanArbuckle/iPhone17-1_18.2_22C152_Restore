@interface PLJournalEntryPayloadProperty
+ (id)payloadPropertyForUUID;
+ (id)payloadPropertyWithKey:(id)a3 andType:(unint64_t)a4 info:(id)a5;
+ (id)payloadPropertyWithKey:(id)a3 andType:(unint64_t)a4 requiresConversion:(BOOL)a5 info:(id)a6;
+ (id)payloadPropertyWithKey:(id)a3 relatedEntityPropertyNames:(id)a4 shouldPrefetchRelationship:(BOOL)a5;
+ (id)payloadPropertyWithKey:(id)a3 subRelationshipProperties:(id)a4 subRelationshipEntityName:(id)a5 isToMany:(BOOL)a6 isAdditionalEntityName:(BOOL)a7 info:(id)a8;
- (BOOL)hasSourceObjectValue;
- (BOOL)isAdditionalEntityName;
- (BOOL)isEqualToKey:(id)a3;
- (BOOL)isOptional;
- (BOOL)isToManySubRelationship;
- (BOOL)isUUIDKey;
- (BOOL)requiresConversion;
- (BOOL)shouldPrefetchRelationship;
- (NSDictionary)subRelationshipProperties;
- (NSSet)relatedEntityPropertyNames;
- (NSString)key;
- (NSString)subRelationshipEntityName;
- (PLJournalEntryPayloadProperty)initWithKey:(id)a3 andType:(unint64_t)a4 subRelationshipProperties:(id)a5 subRelationshipEntityName:(id)a6 requiresConversion:(BOOL)a7 relatedEntityPropertyNames:(id)a8 isUUIDKey:(BOOL)a9 isToManySubRelationship:(BOOL)a10 shouldPrefetchRelationship:(BOOL)a11 isAdditionalEntityName:(BOOL)a12 info:(id)a13;
- (PLJournalEntryPayloadProperty)parentProperty;
- (PLJournalEntryPayloadPropertyInfo)info;
- (id)defaultValue;
- (id)description;
- (unint64_t)type;
- (void)setDefaultValue:(id)a3;
- (void)setOptional:(BOOL)a3;
- (void)setParentProperty:(id)a3;
@end

@implementation PLJournalEntryPayloadProperty

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_parentProperty, 0);
  objc_storeStrong((id *)&self->_subRelationshipEntityName, 0);
  objc_storeStrong((id *)&self->_subRelationshipProperties, 0);
  objc_storeStrong((id *)&self->_relatedEntityPropertyNames, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setDefaultValue:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (PLJournalEntryPayloadPropertyInfo)info
{
  return self->_info;
}

- (void)setParentProperty:(id)a3
{
}

- (PLJournalEntryPayloadProperty)parentProperty
{
  return self->_parentProperty;
}

- (BOOL)isAdditionalEntityName
{
  return self->_isAdditionalEntityName;
}

- (NSString)subRelationshipEntityName
{
  return self->_subRelationshipEntityName;
}

- (BOOL)isToManySubRelationship
{
  return self->_isToManySubRelationship;
}

- (BOOL)shouldPrefetchRelationship
{
  return self->_shouldPrefetchRelationship;
}

- (NSDictionary)subRelationshipProperties
{
  return self->_subRelationshipProperties;
}

- (NSSet)relatedEntityPropertyNames
{
  return self->_relatedEntityPropertyNames;
}

- (BOOL)isUUIDKey
{
  return self->_isUUIDKey;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)hasSourceObjectValue
{
  v3 = [(PLJournalEntryPayloadProperty *)self key];
  if (v3 || [(PLJournalEntryPayloadProperty *)self isUUIDKey])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(PLJournalEntryPayloadProperty *)self subRelationshipProperties];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)requiresConversion
{
  if (self->_requiresConversion) {
    return 1;
  }
  BOOL result = 0;
  int64_t type = self->_type;
  if (type <= 1799)
  {
    if (type && type != 1100 && type != 1200) {
      return result;
    }
    return 1;
  }
  if (type == 1800 || type == 2100 || type == 2000) {
    return 1;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[key: %@, type: %lu, isUUIDKey: %d, requiresConversion: %d, relationPropetyNames: %@  subRelationshipProperties: %@]", self->_key, self->_type, self->_isUUIDKey, self->_requiresConversion, self->_relatedEntityPropertyNames, self->_subRelationshipProperties];
}

- (BOOL)isEqualToKey:(id)a3
{
  return [(NSString *)self->_key isEqualToString:a3];
}

- (PLJournalEntryPayloadProperty)initWithKey:(id)a3 andType:(unint64_t)a4 subRelationshipProperties:(id)a5 subRelationshipEntityName:(id)a6 requiresConversion:(BOOL)a7 relatedEntityPropertyNames:(id)a8 isUUIDKey:(BOOL)a9 isToManySubRelationship:(BOOL)a10 shouldPrefetchRelationship:(BOOL)a11 isAdditionalEntityName:(BOOL)a12 info:(id)a13
{
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v27 = a8;
  id v26 = a13;
  v28.receiver = self;
  v28.super_class = (Class)PLJournalEntryPayloadProperty;
  v22 = [(PLJournalEntryPayloadProperty *)&v28 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_key, a3);
    v23->_int64_t type = a4;
    objc_storeStrong((id *)&v23->_subRelationshipProperties, a5);
    objc_storeStrong((id *)&v23->_subRelationshipEntityName, a6);
    v23->_requiresConversion = a7;
    objc_storeStrong((id *)&v23->_relatedEntityPropertyNames, a8);
    v23->_isUUIDKey = a9;
    v23->_isToManySubRelationship = a10;
    v23->_shouldPrefetchRelationship = a11;
    v23->_isAdditionalEntityName = a12;
    objc_storeStrong((id *)&v23->_info, a13);
  }

  return v23;
}

+ (id)payloadPropertyWithKey:(id)a3 subRelationshipProperties:(id)a4 subRelationshipEntityName:(id)a5 isToMany:(BOOL)a6 isAdditionalEntityName:(BOOL)a7 info:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  BYTE3(v20) = a7;
  BYTE2(v20) = 1;
  BYTE1(v20) = a6;
  LOBYTE(v20) = 0;
  v18 = objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v17, 0, v16, v15, 1, 0, v20, v14);

  return v18;
}

+ (id)payloadPropertyWithKey:(id)a3 andType:(unint64_t)a4 requiresConversion:(BOOL)a5 info:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  LODWORD(v14) = 0x10000;
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v11, a4, 0, 0, v6, 0, v14, v10);

  return v12;
}

+ (id)payloadPropertyWithKey:(id)a3 andType:(unint64_t)a4 info:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  LODWORD(v12) = 0x10000;
  id v10 = objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v9, a4, 0, 0, 0, 0, v12, v8);

  return v10;
}

+ (id)payloadPropertyWithKey:(id)a3 relatedEntityPropertyNames:(id)a4 shouldPrefetchRelationship:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  BYTE3(v12) = 0;
  BYTE2(v12) = a5;
  LOWORD(v12) = 0;
  id v10 = objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v9, 0, 0, 0, 1, v8, v12, 0);

  return v10;
}

+ (id)payloadPropertyForUUID
{
  LODWORD(v4) = 65537;
  v2 = objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", 0, 0, 0, 0, 0, 0, v4, 0);
  return v2;
}

@end