@interface TUHandle
+ (BOOL)supportsSecureCoding;
+ (TUHandle)handleWithDestinationID:(id)a3;
+ (TUHandle)handleWithDictionaryRepresentation:(id)a3;
+ (TUHandle)handleWithPerson:(id)a3;
+ (TUHandle)handleWithPersonHandle:(id)a3;
+ (id)handleForCHRecentCall:(id)a3;
+ (id)handleForCHRecentCall:(id)a3 validHandlesOnly:(BOOL)a4;
+ (id)handleFromMessagingData:(id)a3;
+ (id)handlesForCHRecentCall:(id)a3;
+ (id)handlesForCHRecentCall:(id)a3 validHandlesOnly:(BOOL)a4;
+ (id)normalizedEmailAddressHandleForValue:(id)a3;
+ (id)normalizedGenericHandleForValue:(id)a3;
+ (id)normalizedHandleWithDestinationID:(id)a3;
+ (id)normalizedPhoneNumberHandleForValue:(id)a3 isoCountryCode:(id)a4;
+ (id)stringForType:(int64_t)a3;
+ (int64_t)handleTypeForCHHandle:(id)a3;
- (BOOL)hasSetISOCountryCode;
- (BOOL)isCanonicallyEqualToHandle:(id)a3 isoCountryCode:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandle:(id)a3;
- (BOOL)isEquivalentToHandle:(id)a3;
- (BOOL)isValidForISOCountryCode:(id)a3;
- (BOOL)shouldHideContact;
- (BOOL)shouldHideContactWithLockState:(BOOL)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)isoCountryCode;
- (NSString)normalizedValue;
- (NSString)siriDisplayName;
- (NSString)value;
- (TUHandle)init;
- (TUHandle)initWithCoder:(id)a3;
- (TUHandle)initWithDestinationID:(id)a3;
- (TUHandle)initWithHandle:(id)a3;
- (TUHandle)initWithType:(int64_t)a3 value:(id)a4;
- (TUHandle)initWithType:(int64_t)a3 value:(id)a4 normalizedValue:(id)a5;
- (TUHandle)initWithType:(int64_t)a3 value:(id)a4 siriDisplayName:(id)a5;
- (id)canonicalHandleForISOCountryCode:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)messagingData;
- (id)personHandle;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasSetISOCountryCode:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setSiriDisplayName:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation TUHandle

+ (id)normalizedHandleWithDestinationID:(id)a3
{
  id v3 = a3;
  if ([v3 destinationIdIsTokenURI]) {
    goto LABEL_6;
  }
  if ([v3 destinationIdIsEmailAddress])
  {
    uint64_t v4 = +[TUHandle normalizedEmailAddressHandleForValue:v3];
    goto LABEL_7;
  }
  if (![v3 destinationIdIsPhoneNumber])
  {
LABEL_6:
    uint64_t v4 = +[TUHandle normalizedGenericHandleForValue:v3];
  }
  else
  {
    uint64_t v4 = +[TUHandle normalizedPhoneNumberHandleForValue:v3 isoCountryCode:0];
  }
LABEL_7:
  v5 = (void *)v4;

  return v5;
}

- (BOOL)isEquivalentToHandle:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUHandle *)self type];
  if (v5 == [v4 type])
  {
    v6 = [(TUHandle *)self normalizedValue];
    if ([v6 length])
    {
      v7 = [v4 normalizedValue];
      if ([v7 length])
      {
        v8 = [(TUHandle *)self normalizedValue];
        v9 = [v4 normalizedValue];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)normalizedValue
{
  return self->_normalizedValue;
}

- (NSString)value
{
  return self->_value;
}

+ (id)normalizedPhoneNumberHandleForValue:(id)a3 isoCountryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = v6;
    if (![v7 length])
    {
      uint64_t v8 = PNCopyBestGuessCountryCodeForNumber();

      id v7 = (id)v8;
    }
    if ([v7 length])
    {
      v9 = TUPhoneNumberNormalizedPhoneNumberString((uint64_t)v5, v7);
    }
    else
    {
      v9 = 0;
    }
    char v10 = [[TUHandle alloc] initWithType:2 value:v5 normalizedValue:v9];
    [(TUHandle *)v10 setHasSetISOCountryCode:1];
    [(TUHandle *)v10 setIsoCountryCode:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (TUHandle)initWithType:(int64_t)a3 value:(id)a4 normalizedValue:(id)a5
{
  id v8 = a5;
  v9 = [(TUHandle *)self initWithType:a3 value:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    normalizedValue = v9->_normalizedValue;
    v9->_normalizedValue = (NSString *)v10;
  }
  return v9;
}

- (TUHandle)initWithType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUHandle;
  id v7 = [(TUHandle *)&v11 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUHandle initWithType:value:]", @"value" format];
    }
    v7->_hasSetISOCountryCode = a3 != 2;
    v7->_type = a3;
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSString *)v8;
  }
  return v7;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (void)setHasSetISOCountryCode:(BOOL)a3
{
  self->_hasSetISOCountryCode = a3;
}

+ (int64_t)handleTypeForCHHandle:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 type];
    if ((unint64_t)(v5 - 1) >= 3) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = v5;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSString)isoCountryCode
{
  if (!self->_hasSetISOCountryCode)
  {
    self->_hasSetISOCountryCode = 1;
    id v3 = [(TUHandle *)self normalizedValue];
    if ([v3 length])
    {
      id v4 = (NSString *)PNCopyBestGuessCountryCodeForNumber();
      isoCountryCode = self->_isoCountryCode;
      self->_isoCountryCode = v4;
    }
  }
  int64_t v6 = self->_isoCountryCode;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_siriDisplayName, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (void)encodeWithCoder:(id)a3
{
  isoCountryCode = self->_isoCountryCode;
  id v5 = a3;
  int64_t v6 = NSStringFromSelector(sel_isoCountryCode);
  [v5 encodeObject:isoCountryCode forKey:v6];

  int64_t type = self->_type;
  uint64_t v8 = NSStringFromSelector(sel_type);
  [v5 encodeInteger:type forKey:v8];

  value = self->_value;
  uint64_t v10 = NSStringFromSelector(sel_value);
  [v5 encodeObject:value forKey:v10];

  normalizedValue = self->_normalizedValue;
  v12 = NSStringFromSelector(sel_normalizedValue);
  [v5 encodeObject:normalizedValue forKey:v12];

  siriDisplayName = self->_siriDisplayName;
  NSStringFromSelector(sel_siriDisplayName);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:siriDisplayName forKey:v14];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TUHandle;
  id v5 = [(TUHandle *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_isoCountryCode);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v8;

    uint64_t v10 = NSStringFromSelector(sel_type);
    v5->_int64_t type = [v4 decodeIntegerForKey:v10];

    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector(sel_value);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    value = v5->_value;
    v5->_value = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_normalizedValue);
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    normalizedValue = v5->_normalizedValue;
    v5->_normalizedValue = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    v20 = NSStringFromSelector(sel_siriDisplayName);
    uint64_t v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
    siriDisplayName = v5->_siriDisplayName;
    v5->_siriDisplayName = (NSString *)v21;
  }
  return v5;
}

+ (id)handleForCHRecentCall:(id)a3
{
  return (id)[a1 handleForCHRecentCall:a3 validHandlesOnly:0];
}

+ (id)handleForCHRecentCall:(id)a3 validHandlesOnly:(BOOL)a4
{
  id v4 = [a1 handlesForCHRecentCall:a3 validHandlesOnly:a4];
  id v5 = [v4 firstObject];

  return v5;
}

+ (id)handlesForCHRecentCall:(id)a3
{
  return (id)[a1 handlesForCHRecentCall:a3 validHandlesOnly:0];
}

+ (id)handlesForCHRecentCall:(id)a3 validHandlesOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  if (v4) {
    [v5 validRemoteParticipantHandles];
  }
  else {
  id v7 = [v5 remoteParticipantHandles];
  }
  uint64_t v8 = (void *)[v7 copy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "value", (void)v21);
        if ([v15 length])
        {
          uint64_t v16 = [v14 type];
          if (v16 == 1)
          {
            uint64_t v17 = +[TUHandle normalizedGenericHandleForValue:v15];
            goto LABEL_17;
          }
          if (v16 != 2)
          {
            if (v16 != 3) {
              goto LABEL_19;
            }
            uint64_t v17 = +[TUHandle normalizedEmailAddressHandleForValue:v15];
LABEL_17:
            uint64_t v19 = (void *)v17;
            if (!v17) {
              goto LABEL_19;
            }
LABEL_18:
            [v6 addObject:v19];

            goto LABEL_19;
          }
          v18 = [v5 isoCountryCode];
          uint64_t v19 = +[TUHandle normalizedPhoneNumberHandleForValue:v15 isoCountryCode:v18];

          if (v19) {
            goto LABEL_18;
          }
        }
LABEL_19:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v6;
}

+ (TUHandle)handleWithDestinationID:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[TUHandle alloc] initWithDestinationID:v3];

  return v4;
}

+ (TUHandle)handleWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  BOOL v4 = NSStringFromSelector(sel_value);
  id v5 = [v3 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = NSStringFromSelector(sel_type);
    uint64_t v8 = [v3 objectForKeyedSubscript:v7];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v9 = [v8 integerValue], (unint64_t)(v9 - 1) <= 2)) {
      uint64_t v10 = [[TUHandle alloc] initWithType:v9 value:v6];
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = NSStringFromSelector(sel_siriDisplayName);
    uint64_t v12 = [v3 objectForKeyedSubscript:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 stringValue];
      [(TUHandle *)v10 setSiriDisplayName:v13];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (TUHandle)initWithDestinationID:(id)a3
{
  id v4 = a3;
  if ([v4 destinationIdIsTokenURI])
  {
    uint64_t v5 = 1;
  }
  else if ([v4 destinationIdIsEmailAddress])
  {
    uint64_t v5 = 3;
  }
  else if ([v4 destinationIdIsPhoneNumber])
  {
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v6 = [(TUHandle *)self initWithType:v5 value:v4];

  return v6;
}

- (TUHandle)initWithHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v6 = [v4 value];
  id v7 = [v4 normalizedValue];
  uint64_t v8 = [(TUHandle *)self initWithType:v5 value:v6 normalizedValue:v7];

  if (v8)
  {
    uint64_t v9 = [v4 siriDisplayName];
    uint64_t v10 = [v9 copy];
    siriDisplayName = v8->_siriDisplayName;
    v8->_siriDisplayName = (NSString *)v10;
  }
  return v8;
}

- (TUHandle)initWithType:(int64_t)a3 value:(id)a4 siriDisplayName:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(TUHandle *)self initWithType:a3 value:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    siriDisplayName = v9->_siriDisplayName;
    v9->_siriDisplayName = (NSString *)v10;
  }
  return v9;
}

- (TUHandle)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUHandle.m", 153, @"%s is not available. Use a designated initializer instead.", "-[TUHandle init]");

  return 0;
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E58E80C8[a3 - 1];
  }

  return v3;
}

- (id)personHandle
{
  int64_t v3 = [(TUHandle *)self type];
  if (v3 == 3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2 * (v3 == 2);
  }
  id v5 = objc_alloc((Class)CUTWeakLinkClass());
  id v6 = [(TUHandle *)self value];
  id v7 = (void *)[v5 initWithValue:v6 type:v4];

  return v7;
}

+ (TUHandle)handleWithPersonHandle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 value];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 type];
    if (v6)
    {
      uint64_t v7 = 1;
      if (v6 == 1) {
        uint64_t v7 = 3;
      }
      if (v6 == 2) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = v7;
      }
    }
    else
    {
      uint64_t v13 = [v3 value];
      char v14 = [v13 _appearsToBePhoneNumber];

      if (v14)
      {
        uint64_t v8 = 2;
      }
      else
      {
        uint64_t v15 = [v3 value];
        int v16 = [v15 _appearsToBeEmail];

        if (v16) {
          uint64_t v8 = 3;
        }
        else {
          uint64_t v8 = 1;
        }
      }
    }
    uint64_t v9 = [TUHandle alloc];
    uint64_t v10 = [v3 value];
    uint64_t v11 = [(TUHandle *)v9 initWithType:v8 value:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (TUHandle)handleWithPerson:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 personHandle];
  uint64_t v5 = +[TUHandle handleWithPersonHandle:v4];

  if (v5)
  {
    uint64_t v6 = [v3 displayName];
    uint64_t v7 = (void *)[v6 copy];
    [v5 setSiriDisplayName:v7];
  }

  return (TUHandle *)v5;
}

- (BOOL)shouldHideContact
{
  BOOL v3 = _MKBGetDeviceLockState() == 1 || _MKBGetDeviceLockState() == 2;

  return [(TUHandle *)self shouldHideContactWithLockState:v3];
}

- (BOOL)shouldHideContactWithLockState:(BOOL)a3
{
  if (self->_siriDisplayName) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  id v10 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:2080 error:&v10];
  id v6 = v10;
  uint64_t v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", self->_siriDisplayName, 0, 0, -[NSString length](self->_siriDisplayName, "length"));

  BOOL v8 = v7 != 0;
  return v8;
}

- (BOOL)isValidForISOCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUHandle *)self value];
  uint64_t v6 = [v5 length];

  if (!v6) {
    goto LABEL_6;
  }
  int64_t v7 = [(TUHandle *)self type];
  if (v7 == 1 || v7 == 3)
  {
    char valid = 1;
    goto LABEL_8;
  }
  if (v7 == 2)
  {
    BOOL v8 = [(TUHandle *)self value];
    char valid = PNIsValidPhoneNumberForCountry();
  }
  else
  {
LABEL_6:
    char valid = 0;
  }
LABEL_8:

  return valid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithHandle:self];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_type);
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "stringForType:", -[TUHandle type](self, "type"));
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_value);
  int64_t v7 = [(TUHandle *)self value];
  BOOL v8 = TULoggableStringForHandle((uint64_t)v7);
  [v3 appendFormat:@"%@=%@", v6, v8];

  [v3 appendFormat:@", "];
  uint64_t v9 = NSStringFromSelector(sel_normalizedValue);
  id v10 = [(TUHandle *)self normalizedValue];
  uint64_t v11 = TULoggableStringForHandle((uint64_t)v10);
  [v3 appendFormat:@"%@=%@", v9, v11];

  if ([(TUHandle *)self type] == 2)
  {
    [v3 appendFormat:@", "];
    uint64_t v12 = NSStringFromSelector(sel_isoCountryCode);
    uint64_t v13 = [(TUHandle *)self isoCountryCode];
    [v3 appendFormat:@"%@=%@", v12, v13];
  }
  [v3 appendFormat:@", "];
  char v14 = NSStringFromSelector(sel_siriDisplayName);
  uint64_t v15 = [(TUHandle *)self siriDisplayName];
  [v3 appendFormat:@"%@=%@", v14, v15];

  [v3 appendFormat:@">"];
  int v16 = (void *)[v3 copy];

  return v16;
}

- (unint64_t)hash
{
  id v3 = [(TUHandle *)self isoCountryCode];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(TUHandle *)self type] ^ v4;
  uint64_t v6 = [(TUHandle *)self value];
  uint64_t v7 = [v6 hash];
  BOOL v8 = [(TUHandle *)self normalizedValue];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUHandle *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUHandle *)self isEqualToHandle:v4];
  }

  return v5;
}

- (BOOL)isEqualToHandle:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUHandle *)self type];
  if (v5 == [v4 type])
  {
    uint64_t v6 = [(TUHandle *)self isoCountryCode];
    uint64_t v7 = [v4 isoCountryCode];
    if (TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v7))
    {
      BOOL v8 = [(TUHandle *)self value];
      unint64_t v9 = [v4 value];
      if (TUStringsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
      {
        id v10 = [(TUHandle *)self normalizedValue];
        uint64_t v11 = [v4 normalizedValue];
        char v12 = TUStringsAreEqualOrNil((unint64_t)v10, (uint64_t)v11);
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)canonicalHandleForISOCountryCode:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUHandle *)self type];
  switch(v5)
  {
    case 3:
      goto LABEL_4;
    case 2:
      uint64_t v7 = [(TUHandle *)self value];
      BOOL v8 = [v4 lowercaseString];
      unint64_t v9 = +[TUPhoneNumber phoneNumberWithDigits:v7 countryCode:v8];

      if (v9)
      {
        id v10 = [v9 unformattedInternationalRepresentation];
        uint64_t v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [v9 digits];
        }
        uint64_t v6 = v12;
      }
      else
      {
        uint64_t v6 = [(TUHandle *)self value];
      }

      break;
    case 1:
LABEL_4:
      uint64_t v6 = [(TUHandle *)self value];
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  uint64_t v13 = [[TUHandle alloc] initWithType:[(TUHandle *)self type] value:v6];

  return v13;
}

- (BOOL)isCanonicallyEqualToHandle:(id)a3 isoCountryCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TUHandle *)self canonicalHandleForISOCountryCode:v6];
  unint64_t v9 = [v7 canonicalHandleForISOCountryCode:v6];

  char v10 = 0;
  if (v8 && v9) {
    char v10 = [v8 isEqualToHandle:v9];
  }

  return v10;
}

- (id)messagingData
{
  v2 = +[CSDMessagingHandle handleWithTUHandle:self];
  id v3 = [v2 data];

  return v3;
}

+ (id)handleFromMessagingData:(id)a3
{
  id v3 = a3;
  id v4 = [[CSDMessagingHandle alloc] initWithData:v3];

  int64_t v5 = [(CSDMessagingHandle *)v4 tuHandle];

  return v5;
}

+ (id)normalizedEmailAddressHandleForValue:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [TUHandle alloc];
    int64_t v5 = [v3 lowercaseString];
    id v6 = [(TUHandle *)v4 initWithType:3 value:v3 normalizedValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)normalizedGenericHandleForValue:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [v3 normalizedTokenURI];
    int64_t v5 = [[TUHandle alloc] initWithType:1 value:v3 normalizedValue:v4];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[TUHandle type](self, "type"));
  int64_t v5 = NSStringFromSelector(sel_type);
  [v3 setObject:v4 forKeyedSubscript:v5];

  id v6 = [(TUHandle *)self value];
  id v7 = NSStringFromSelector(sel_value);
  [v3 setObject:v6 forKeyedSubscript:v7];

  BOOL v8 = [(TUHandle *)self siriDisplayName];
  unint64_t v9 = NSStringFromSelector(sel_siriDisplayName);
  [v3 setObject:v8 forKeyedSubscript:v9];

  char v10 = (void *)[v3 copy];

  return (NSDictionary *)v10;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void)setValue:(id)a3
{
}

- (NSString)siriDisplayName
{
  return self->_siriDisplayName;
}

- (void)setSiriDisplayName:(id)a3
{
}

- (BOOL)hasSetISOCountryCode
{
  return self->_hasSetISOCountryCode;
}

@end