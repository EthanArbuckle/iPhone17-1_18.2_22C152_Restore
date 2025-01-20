@interface ACFKeychainItemInfo
+ (id)keychainItemInfo;
+ (id)keychainItemInfoWithAttributes:(id)a3;
- (ACFKeychainItemInfo)init;
- (ACFKeychainItemInfo)initWithAttributes:(id)a3;
- (BOOL)isInvisible;
- (BOOL)isNegative;
- (BOOL)isPermanent;
- (BOOL)isSynchronizableAttributeAvaiable;
- (BOOL)returnAttributes;
- (BOOL)returnData;
- (BOOL)returnPersistentRef;
- (BOOL)returnRef;
- (BOOL)synchronizable;
- (NSData)applicationTag;
- (NSData)generic;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)attributes;
- (NSMutableDictionary)attributeDictionary;
- (NSString)accessGroup;
- (NSString)account;
- (NSString)applicationTagString;
- (NSString)comment;
- (NSString)description;
- (NSString)genericString;
- (NSString)label;
- (NSString)service;
- (NSString)subject;
- (id)classCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyType;
- (id)valueData;
- (id)valuePersistentRef;
- (id)valueRef;
- (unint64_t)creator;
- (unint64_t)returnLimit;
- (unint64_t)type;
- (void)accessibleType;
- (void)dealloc;
- (void)dump;
- (void)setAccessGroup:(id)a3;
- (void)setAccessibleType:(void *)a3;
- (void)setAccount:(id)a3;
- (void)setApplicationTag:(id)a3;
- (void)setApplicationTagString:(id)a3;
- (void)setAttributeDictionary:(id)a3;
- (void)setClassCode:(id)a3;
- (void)setComment:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCreator:(unint64_t)a3;
- (void)setDescription:(id)a3;
- (void)setGeneric:(id)a3;
- (void)setGenericString:(id)a3;
- (void)setIsInvisible:(BOOL)a3;
- (void)setIsNegative:(BOOL)a3;
- (void)setIsPermanent:(BOOL)a3;
- (void)setKeyType:(id)a3;
- (void)setLabel:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setReturnAttributes:(BOOL)a3;
- (void)setReturnData:(BOOL)a3;
- (void)setReturnLimit:(unint64_t)a3;
- (void)setReturnPersistentRef:(BOOL)a3;
- (void)setReturnRef:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setValueData:(id)a3;
- (void)setValuePersistentRef:(id)a3;
- (void)setValueRef:(id)a3;
@end

@implementation ACFKeychainItemInfo

+ (id)keychainItemInfo
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)keychainItemInfoWithAttributes:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAttributes:a3];

  return v3;
}

- (ACFKeychainItemInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)ACFKeychainItemInfo;
  v2 = [(ACFKeychainItemInfo *)&v4 init];
  if (v2) {
    -[ACFKeychainItemInfo setAttributeDictionary:](v2, "setAttributeDictionary:", [MEMORY[0x263EFF9A0] dictionary]);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v5 setAttributeDictionary:[-[NSMutableDictionary mutableCopyWithZone:](-[ACFKeychainItemInfo attributeDictionary](self, "attributeDictionary"), "mutableCopyWithZone:", a3)];
  return v5;
}

- (ACFKeychainItemInfo)initWithAttributes:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)ACFKeychainItemInfo;
    objc_super v4 = [(ACFKeychainItemInfo *)&v6 init];
    if (v4) {
      -[ACFKeychainItemInfo setAttributeDictionary:](v4, "setAttributeDictionary:", [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3]);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ACFKeychainItemInfo;
    [(ACFKeychainItemInfo *)&v7 dealloc];
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  [(ACFKeychainItemInfo *)self setAttributeDictionary:0];
  v3.receiver = self;
  v3.super_class = (Class)ACFKeychainItemInfo;
  [(ACFKeychainItemInfo *)&v3 dealloc];
}

- (NSDictionary)attributes
{
  v2 = NSDictionary;
  objc_super v3 = [(ACFKeychainItemInfo *)self attributeDictionary];

  return (NSDictionary *)[v2 dictionaryWithDictionary:v3];
}

- (void)setClassCode:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F171B8];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (id)classCode
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F171B8];

  return (id)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setAccessGroup:(id)a3
{
  objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v5 = *MEMORY[0x263F16E80];
  if (a3)
  {
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F16E80];
    -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v6, v5);
  }
}

- (NSString)accessGroup
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16E80];

  return (NSString *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setCreationDate:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F16F10];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSDate)creationDate
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16F10];

  return (NSDate *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setModificationDate:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F17008];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSDate)modificationDate
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F17008];

  return (NSDate *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setDescription:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F16F20];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSString)description
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16F20];

  return (NSString *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setComment:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F16F08];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSString)comment
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16F08];

  return (NSString *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setCreator:(unint64_t)a3
{
  objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = *MEMORY[0x263F16F18];

  [(NSMutableDictionary *)v4 setObject:v5 forKey:v6];
}

- (unint64_t)creator
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = (void *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F16F18]];

  return [v3 unsignedIntegerValue];
}

- (void)setType:(unint64_t)a3
{
  objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = *MEMORY[0x263F17108];

  [(NSMutableDictionary *)v4 setObject:v5 forKey:v6];
}

- (unint64_t)type
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = (void *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F17108]];

  return [v3 unsignedIntegerValue];
}

- (void)setLabel:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F17000];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSString)label
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F17000];

  return (NSString *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setSubject:(id)a3
{
  if (a3)
  {
    objc_super v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F17098];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSString)subject
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F17098];

  return (NSString *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setIsInvisible:(BOOL)a3
{
  uint64_t v3 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!a3) {
    uint64_t v3 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F16F38];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (BOOL)isInvisible
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (const __CFBoolean *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F16F38]];
  if (v3) {
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  }
  return (char)v3;
}

- (void)setIsNegative:(BOOL)a3
{
  CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!a3) {
    CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F16F40];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (BOOL)isNegative
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (const __CFBoolean *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F16F40]];
  if (v3) {
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  }
  return (char)v3;
}

- (void)setIsPermanent:(BOOL)a3
{
  CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!a3) {
    CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F16F50];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (BOOL)isPermanent
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (const __CFBoolean *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F16F50]];
  if (v3) {
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  }
  return (char)v3;
}

- (void)setAccessibleType:(void *)a3
{
  uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v5 = *MEMORY[0x263F16E90];

  [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
}

- (void)accessibleType
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16E90];

  return (void *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (BOOL)isSynchronizableAttributeAvaiable
{
  return *MEMORY[0x263F080F8] >= 1056.0;
}

- (void)setSynchronizable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ACFKeychainItemInfo *)self isSynchronizableAttributeAvaiable])
  {
    uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v6 = [NSNumber numberWithBool:v3];
    uint64_t v7 = *MEMORY[0x263F170B0];
    [(NSMutableDictionary *)v5 setObject:v6 forKey:v7];
  }
}

- (BOOL)synchronizable
{
  int v3 = [(ACFKeychainItemInfo *)self isSynchronizableAttributeAvaiable];
  if (v3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = (void *)[(NSMutableDictionary *)v4 objectForKey:*MEMORY[0x263F170B0]];
    LOBYTE(v3) = [v5 BOOLValue];
  }
  return v3;
}

- (void)setKeyType:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F16FA8];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (id)keyType
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16FA8];

  return (id)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setApplicationTag:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F16EE8];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSData)applicationTag
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16EE8];

  return (NSData *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setApplicationTagString:(id)a3
{
  uint64_t v4 = [a3 dataUsingEncoding:4];

  [(ACFKeychainItemInfo *)self setApplicationTag:v4];
}

- (NSString)applicationTagString
{
  v2 = [[NSString alloc] initWithData:-[ACFKeychainItemInfo applicationTag](self, "applicationTag") encoding:4];

  return (NSString *)v2;
}

- (void)setAccount:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F16ED8];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSString)account
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16ED8];

  return (NSString *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setService:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F17090];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (NSString)service
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F17090];

  return (NSString *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setGeneric:(id)a3
{
  uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v5 = *MEMORY[0x263F16F30];
  if (a3)
  {
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F16F30];
    -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v6, v5);
  }
}

- (NSData)generic
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F16F30];

  return (NSData *)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setGenericString:(id)a3
{
  uint64_t v4 = [a3 dataUsingEncoding:4];

  [(ACFKeychainItemInfo *)self setGeneric:v4];
}

- (NSString)genericString
{
  result = [(ACFKeychainItemInfo *)self generic];
  if (result)
  {
    [(ACFKeychainItemInfo *)self generic];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return (NSString *)[(ACFKeychainItemInfo *)self generic];
    }
    else
    {
      uint64_t v4 = [[NSString alloc] initWithData:-[ACFKeychainItemInfo generic](self, "generic") encoding:4];
      return (NSString *)v4;
    }
  }
  return result;
}

- (void)setValueRef:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F175B8];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (id)valueRef
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F175B8];

  return (id)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setValueData:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F175A8];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (id)valueData
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F175A8];

  return (id)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setValuePersistentRef:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [(ACFKeychainItemInfo *)self attributeDictionary];
    uint64_t v5 = *MEMORY[0x263F175B0];
    [(NSMutableDictionary *)v4 setObject:a3 forKey:v5];
  }
}

- (id)valuePersistentRef
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v3 = *MEMORY[0x263F175B0];

  return (id)[(NSMutableDictionary *)v2 objectForKey:v3];
}

- (void)setReturnData:(BOOL)a3
{
  uint64_t v3 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!a3) {
    uint64_t v3 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F17520];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (BOOL)returnData
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (const __CFBoolean *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F17520]];
  if (v3) {
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  }
  return (char)v3;
}

- (void)setReturnAttributes:(BOOL)a3
{
  CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!a3) {
    CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F17518];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (BOOL)returnAttributes
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (const __CFBoolean *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F17518]];
  if (v3) {
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  }
  return (char)v3;
}

- (void)setReturnRef:(BOOL)a3
{
  CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!a3) {
    CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F17530];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (BOOL)returnRef
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (const __CFBoolean *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F17530]];
  if (v3) {
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  }
  return (char)v3;
}

- (void)setReturnPersistentRef:(BOOL)a3
{
  CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!a3) {
    CFBooleanRef v3 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F17528];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (BOOL)returnPersistentRef
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (const __CFBoolean *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F17528]];
  if (v3) {
    LOBYTE(v3) = CFBooleanGetValue(v3) != 0;
  }
  return (char)v3;
}

- (void)setReturnLimit:(unint64_t)a3
{
  if (a3 == -1) {
    uint64_t v4 = *MEMORY[0x263F17408];
  }
  else {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:];
  }
  uint64_t v5 = [(ACFKeychainItemInfo *)self attributeDictionary];
  uint64_t v6 = *MEMORY[0x263F17400];

  [(NSMutableDictionary *)v5 setObject:v4 forKey:v6];
}

- (unint64_t)returnLimit
{
  v2 = [(ACFKeychainItemInfo *)self attributeDictionary];
  CFBooleanRef v3 = (void *)[(NSMutableDictionary *)v2 objectForKey:*MEMORY[0x263F17400]];
  if (!v3) {
    return 1;
  }
  if ((void *)*MEMORY[0x263F17408] == v3) {
    return -1;
  }
  return [v3 unsignedIntValue];
}

- (void)dump
{
  if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
  {
    id v3 = (id)[(NSDictionary *)[(ACFKeychainItemInfo *)self attributes] mutableCopy];
    [v3 setObject:[NSString stringWithFormat:@"<<<Generic data of size: %lu>>>", [objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x263F16F30]), "length")) forKey];
    [v3 setObject:[NSString stringWithFormat:@"<<<Return data of size: %lu>>>", [objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x263F17520]), "length")) forKey];
    uint64_t v4 = NSString;
    uint64_t v5 = *MEMORY[0x263F175A8];
    uint64_t v9 = [[(id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x263F175A8]) length];
    [v3 setObject:[v4 stringWithFormat:v6 forKey];
    if (ACFLogNS)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
      {
        uint64_t v6 = [v3 description];
        ACFLogNS(7, (uint64_t)"-[ACFKeychainItemInfo dump]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFKeychainItemInfo.m", 539, 0, v6, v7, v8, v9);
      }
    }
  }
}

- (NSMutableDictionary)attributeDictionary
{
  return self->_attributeDictionary;
}

- (void)setAttributeDictionary:(id)a3
{
}

@end