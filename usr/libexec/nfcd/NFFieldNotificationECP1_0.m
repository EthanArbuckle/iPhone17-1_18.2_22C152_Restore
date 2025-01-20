@interface NFFieldNotificationECP1_0
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreRFTechOnIsEqual;
- (BOOL)isEqual:(id)a3;
- (BOOL)odaRequired;
- (NFFieldNotificationECP1_0)initWithCoder:(id)a3;
- (NFFieldNotificationECP1_0)initWithDictionary:(id)a3;
- (NFFieldNotificationECP1_0)initWithDictionaryForDavenport:(id)a3;
- (NFFieldNotificationECP1_0)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7 odaRequired:(BOOL)a8 terminalMode:(unsigned int)a9 terminalType:(unsigned int)a10 ignoreRFTechOnIsEqual:(BOOL)a11;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)terminalMode;
- (unsigned)terminalType;
- (void)_initCategoryWithType:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoreRFTechOnIsEqual:(BOOL)a3;
@end

@implementation NFFieldNotificationECP1_0

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL odaRequired = self->_odaRequired;
  id v5 = a3;
  [v5 encodeBool:odaRequired forKey:@"odaRequired"];
  [v5 encodeInteger:self->_terminalMode forKey:@"terminalMode"];
  [v5 encodeInteger:self->_terminalType forKey:@"terminalType"];
  [v5 encodeBool:self->_ignoreRFTechOnIsEqual forKey:@"ignoreRFTechOnIsEqual"];
  v6.receiver = self;
  v6.super_class = (Class)NFFieldNotificationECP1_0;
  [(NFFieldNotification *)&v6 encodeWithCoder:v5];
}

- (NFFieldNotificationECP1_0)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFFieldNotificationECP1_0;
  id v5 = [(NFFieldNotification *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_BOOL odaRequired = [v4 decodeBoolForKey:@"odaRequired"];
    v5->_terminalMode = [v4 decodeIntegerForKey:@"terminalMode"];
    v5->_terminalType = [v4 decodeIntegerForKey:@"terminalType"];
    v5->_ignoreRFTechOnIsEqual = [v4 decodeBoolForKey:@"ignoreRFTechOnIsEqual"];
  }

  return v5;
}

- (NFFieldNotificationECP1_0)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7 odaRequired:(BOOL)a8 terminalMode:(unsigned int)a9 terminalType:(unsigned int)a10 ignoreRFTechOnIsEqual:(BOOL)a11
{
  v16.receiver = self;
  v16.super_class = (Class)NFFieldNotificationECP1_0;
  v12 = [(NFFieldNotification *)&v16 initWithNotificationType:a3 rfTechnology:*(void *)&a4 typeFSystemCode:a5 creationDate:a6 cachedBeforeRFReset:a7];
  v13 = v12;
  if (v12)
  {
    v12->_BOOL odaRequired = a8;
    v12->_terminalMode = a9;
    v12->_terminalType = a10;
    v12->_ignoreRFTechOnIsEqual = a11;
    -[NFFieldNotificationECP1_0 _initCategoryWithType:](v12, "_initCategoryWithType:");
    v14 = v13;
  }

  return v13;
}

- (NFFieldNotificationECP1_0)initWithDictionaryForDavenport:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFFieldNotificationECP1_0;
  id v5 = [(NFFieldNotification *)&v9 initWithDictionary:v4];
  objc_super v6 = v5;
  if (v5)
  {
    v5->_BOOL odaRequired = 0;
    v5->_terminalType = 2;
    v5->_terminalMode = 4;
    objc_super v7 = [v4 objectForKey:@"IgnoreRFTechOnIsEqual"];
    v6->_ignoreRFTechOnIsEqual = [v7 BOOLValue];

    [(NFFieldNotification *)v6 setCategory:5];
    [(NFFieldNotification *)v6 setNotificationType:2];
  }

  return v6;
}

- (NFFieldNotificationECP1_0)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NFFieldNotificationECP1_0;
  id v5 = [(NFFieldNotification *)&v14 initWithDictionary:v4];
  if (!v5)
  {
LABEL_8:
    v11 = v5;
    goto LABEL_9;
  }
  objc_super v6 = [v4 objectForKey:@"ECPData"];
  if ([v6 length] == (id)5)
  {
    [(NFFieldNotification *)v5 setNotificationType:2];
    id v7 = v6;
    v8 = [v7 bytes];
    char v9 = v8[2];
    v5->_BOOL odaRequired = (v9 & 0x40) == 0;
    v5->_terminalType = v9 & 0xF;
    if (v9 < 0) {
      int v10 = 4;
    }
    else {
      int v10 = v8[4] & 3;
    }
    v5->_terminalMode = v10;
    [(NFFieldNotificationECP1_0 *)v5 _initCategoryWithType:v5->_terminalType];
    v12 = [v4 objectForKey:@"IgnoreRFTechOnIsEqual"];
    v5->_ignoreRFTechOnIsEqual = [v12 BOOLValue];

    goto LABEL_8;
  }

  v11 = 0;
LABEL_9:

  return v11;
}

- (void)_initCategoryWithType:(unsigned int)a3
{
  uint64_t v5 = 1;
  switch(a3)
  {
    case 0u:
      goto LABEL_3;
    case 1u:
      uint64_t v5 = 4;
      goto LABEL_3;
    case 2u:
      uint64_t v5 = 5;
      goto LABEL_3;
    case 3u:
    case 4u:
      uint64_t v5 = 3;
      goto LABEL_3;
    default:
      if (a3 != 15) {
        return;
      }
      uint64_t v5 = 2;
LABEL_3:
      [(NFFieldNotification *)self setCategory:v5];
      return;
  }
}

- (id)description
{
  v3 = objc_opt_new();
  if ([(NFFieldNotification *)self rfTechnology]) {
    [v3 appendString:@"A,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 2) != 0) {
    [v3 appendString:@"B,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 4) != 0) {
    [v3 appendString:@"F,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 0x10) != 0) {
    [v3 appendString:@"V,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 8) != 0) {
    [v3 appendString:@"ECP,"];
  }
  if (![v3 length]) {
    [v3 appendString:@"None"];
  }
  id v4 = objc_alloc((Class)NSString);
  ClassName = object_getClassName(self);
  unsigned int v6 = [(NFFieldNotification *)self typeFSystemCode];
  BOOL odaRequired = self->_odaRequired;
  uint64_t v8 = __rev16(v6);
  uint64_t terminalMode = self->_terminalMode;
  uint64_t terminalType = self->_terminalType;
  v11 = [(NFFieldNotification *)self _creationDateString];
  id v12 = [v4 initWithFormat:@"<%s: tech=%@ sc=0x%X, oda=%d, terminalMode=%d, terminalType=%d, date=%@, cached=%d>", ClassName, v3, v8, odaRequired, terminalMode, terminalType, v11, -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset")];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NFFieldNotificationECP1_0 *)a3;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unsigned int v6 = [(NFFieldNotificationECP1_0 *)v5 odaRequired];
      if (v6 == [(NFFieldNotificationECP1_0 *)self odaRequired]
        && (unsigned int v7 = [(NFFieldNotificationECP1_0 *)v5 terminalType],
            v7 == [(NFFieldNotificationECP1_0 *)self terminalType])
        && (unsigned int v8 = [(NFFieldNotificationECP1_0 *)v5 terminalMode],
            v8 == [(NFFieldNotificationECP1_0 *)self terminalMode])
        && [(NFFieldNotificationECP1_0 *)self ignoreRFTechOnIsEqual])
      {
        objc_super v14 = self;
        char v9 = &selRef_isEqualWithoutRFTech_;
        int v10 = &v14;
      }
      else
      {
        v13 = self;
        char v9 = &selRef_isEqual_;
        int v10 = &v13;
      }
      v10[1] = (NFFieldNotificationECP1_0 *)NFFieldNotificationECP1_0;
      unsigned __int8 v11 = [super v9:v5 v13];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NFFieldNotificationECP1_0 alloc];
  unint64_t v5 = [(NFFieldNotification *)self notificationType];
  uint64_t v6 = [(NFFieldNotification *)self rfTechnology];
  uint64_t v7 = [(NFFieldNotification *)self typeFSystemCode];
  unsigned int v8 = [(NFFieldNotification *)self creationDate];
  BOOL v9 = [(NFFieldNotification *)self cachedBeforeRFReset];
  LOBYTE(v12) = self->_ignoreRFTechOnIsEqual;
  int v10 = -[NFFieldNotificationECP1_0 initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:ignoreRFTechOnIsEqual:](v4, "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:ignoreRFTechOnIsEqual:", v5, v6, v7, v8, v9, self->_odaRequired, *(void *)&self->_terminalMode, v12);

  return v10;
}

- (BOOL)odaRequired
{
  return self->_odaRequired;
}

- (unsigned)terminalMode
{
  return self->_terminalMode;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

- (BOOL)ignoreRFTechOnIsEqual
{
  return self->_ignoreRFTechOnIsEqual;
}

- (void)setIgnoreRFTechOnIsEqual:(BOOL)a3
{
  self->_ignoreRFTechOnIsEqual = a3;
}

@end