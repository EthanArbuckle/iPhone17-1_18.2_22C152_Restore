@interface CSDThumperAccount
+ (id)phoneNumberMCCToISOCountryCodeTransformBlock;
+ (void)setPhoneNumberMCCToISOCountryCodeTransformBlock:(id)a3;
- (BOOL)containsRegisteredDeviceID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (CSDThumperAccount)init;
- (CSDThumperAccount)initWithAccountID:(id)a3 primaryDeviceID:(id)a4 phoneNumberURI:(id)a5 availableDeviceSlots:(int64_t)a6 allowedSecondaryDeviceIDs:(id)a7;
- (CSDThumperAccount)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSSet)allowedSecondaryDeviceIDs;
- (NSString)accountID;
- (NSString)phoneNumberURI;
- (NSString)primaryDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)availableDeviceSlots;
- (unint64_t)hash;
- (void)setAccountID:(id)a3;
- (void)setAllowedSecondaryDeviceIDs:(id)a3;
- (void)setAvailableDeviceSlots:(int64_t)a3;
- (void)setPhoneNumberURI:(id)a3;
- (void)setPrimaryDeviceID:(id)a3;
@end

@implementation CSDThumperAccount

- (CSDThumperAccount)init
{
  return 0;
}

- (CSDThumperAccount)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v29 = [v4 objectForKeyedSubscript:kPSAccountId];
  v28 = [v4 objectForKeyedSubscript:kPSPrimaryDeviceId];
  v5 = [v4 objectForKeyedSubscript:kPSAccountFreeSlots];
  id v23 = [v5 integerValue];

  uint64_t v6 = [v4 objectForKeyedSubscript:kPSMdn];
  uint64_t v7 = [v4 objectForKeyedSubscript:kPSMcc];
  v8 = [v4 objectForKeyedSubscript:kPSIsoMcc];
  objc_opt_class();
  v26 = self;
  v27 = v8;
  v24 = (void *)v7;
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [(id)objc_opt_class() phoneNumberMCCToISOCountryCodeTransformBlock];
      v10[2](v10, v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }
  v25 = (void *)v6;
  v11 = (void *)IDSCopyIDForPhoneNumberWithOptions();
  v12 = [v4 objectForKeyedSubscript:kPSDeviceList];
  v13 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v12 count]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v31;
    uint64_t v18 = kPSDeviceId;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = [*(id *)(*((void *)&v30 + 1) + 8 * i) objectForKeyedSubscript:v18];
        if (v20) {
          [v13 addObject:v20];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
  }

  if (v29 && v28 && v11)
  {
    v21 = [(CSDThumperAccount *)v26 initWithAccountID:v29 primaryDeviceID:v28 phoneNumberURI:v11 availableDeviceSlots:v23 allowedSecondaryDeviceIDs:v13];
  }
  else
  {

    v21 = 0;
  }

  return v21;
}

- (CSDThumperAccount)initWithAccountID:(id)a3 primaryDeviceID:(id)a4 phoneNumberURI:(id)a5 availableDeviceSlots:(int64_t)a6 allowedSecondaryDeviceIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CSDThumperAccount;
  id v16 = [(CSDThumperAccount *)&v26 init];
  if (v16)
  {
    uint64_t v17 = (NSString *)[v12 copy];
    accountID = v16->_accountID;
    v16->_accountID = v17;

    v19 = (NSString *)[v13 copy];
    primaryDeviceID = v16->_primaryDeviceID;
    v16->_primaryDeviceID = v19;

    v21 = (NSString *)[v14 copy];
    phoneNumberURI = v16->_phoneNumberURI;
    v16->_phoneNumberURI = v21;

    id v23 = (NSSet *)[v15 copy];
    allowedSecondaryDeviceIDs = v16->_allowedSecondaryDeviceIDs;
    v16->_allowedSecondaryDeviceIDs = v23;

    v16->_availableDeviceSlots = a6;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSDThumperAccount alloc];
  v5 = [(CSDThumperAccount *)self accountID];
  uint64_t v6 = [(CSDThumperAccount *)self primaryDeviceID];
  uint64_t v7 = [(CSDThumperAccount *)self phoneNumberURI];
  int64_t v8 = [(CSDThumperAccount *)self availableDeviceSlots];
  id v9 = [(CSDThumperAccount *)self allowedSecondaryDeviceIDs];
  v10 = [(CSDThumperAccount *)v4 initWithAccountID:v5 primaryDeviceID:v6 phoneNumberURI:v7 availableDeviceSlots:v8 allowedSecondaryDeviceIDs:v9];

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CSDMutableThumperAccount alloc];
  v5 = [(CSDThumperAccount *)self accountID];
  uint64_t v6 = [(CSDThumperAccount *)self primaryDeviceID];
  uint64_t v7 = [(CSDThumperAccount *)self phoneNumberURI];
  int64_t v8 = [(CSDThumperAccount *)self availableDeviceSlots];
  id v9 = [(CSDThumperAccount *)self allowedSecondaryDeviceIDs];
  v10 = [(CSDThumperAccount *)v4 initWithAccountID:v5 primaryDeviceID:v6 phoneNumberURI:v7 availableDeviceSlots:v8 allowedSecondaryDeviceIDs:v9];

  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector("accountID");
  v5 = [(CSDThumperAccount *)self accountID];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector("primaryDeviceID");
  uint64_t v7 = [(CSDThumperAccount *)self primaryDeviceID];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  int64_t v8 = NSStringFromSelector("phoneNumberURI");
  id v9 = [(CSDThumperAccount *)self phoneNumberURI];
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@", "];
  v10 = NSStringFromSelector("availableDeviceSlots");
  [v3 appendFormat:@"%@=%ld", v10, -[CSDThumperAccount availableDeviceSlots](self, "availableDeviceSlots")];

  [v3 appendFormat:@", "];
  v11 = NSStringFromSelector("allowedSecondaryDeviceIDs");
  id v12 = [(CSDThumperAccount *)self allowedSecondaryDeviceIDs];
  [v3 appendFormat:@"%@=%@", v11, v12];

  [v3 appendFormat:@">"];
  id v13 = [v3 copy];

  return v13;
}

- (unint64_t)hash
{
  id v3 = [(CSDThumperAccount *)self accountID];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(CSDThumperAccount *)self primaryDeviceID];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  uint64_t v7 = [(CSDThumperAccount *)self phoneNumberURI];
  unint64_t v8 = (unint64_t)[v7 hash];
  id v9 = [(CSDThumperAccount *)self allowedSecondaryDeviceIDs];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  unint64_t v11 = v10 ^ [(CSDThumperAccount *)self availableDeviceSlots];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CSDThumperAccount *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(CSDThumperAccount *)self isEqualToAccount:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDThumperAccount *)self accountID];
  unint64_t v6 = [v4 accountID];
  if (TUStringsAreEqualOrNil())
  {
    uint64_t v7 = [(CSDThumperAccount *)self primaryDeviceID];
    unint64_t v8 = [v4 primaryDeviceID];
    if (TUStringsAreEqualOrNil())
    {
      id v9 = [(CSDThumperAccount *)self phoneNumberURI];
      unint64_t v10 = [v4 phoneNumberURI];
      if (TUStringsAreEqualOrNil())
      {
        unint64_t v11 = [(CSDThumperAccount *)self allowedSecondaryDeviceIDs];
        id v12 = [v4 allowedSecondaryDeviceIDs];
        if (TUObjectsAreEqualOrNil())
        {
          id v13 = [(CSDThumperAccount *)self availableDeviceSlots];
          BOOL v14 = v13 == [v4 availableDeviceSlots];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)containsRegisteredDeviceID:(id)a3
{
  id v4 = a3;
  [(CSDThumperAccount *)self allowedSecondaryDeviceIDs];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (TUStringsAreCaseInsensitiveEqual())
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      unint64_t v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[0] = kPSAccountId;
  id v3 = [(CSDThumperAccount *)self accountID];
  v11[0] = v3;
  v10[1] = kPSPrimaryDeviceId;
  id v4 = [(CSDThumperAccount *)self primaryDeviceID];
  v11[1] = v4;
  v10[2] = kPSAccountFreeSlots;
  id v5 = +[NSNumber numberWithInteger:[(CSDThumperAccount *)self availableDeviceSlots]];
  v11[2] = v5;
  v10[3] = kPSMdn;
  unint64_t v6 = [(CSDThumperAccount *)self phoneNumberURI];
  uint64_t v7 = [v6 _stripFZIDPrefix];
  v11[3] = v7;
  unint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return (NSDictionary *)v8;
}

+ (id)phoneNumberMCCToISOCountryCodeTransformBlock
{
  v2 = objc_retainBlock(off_100581230);

  return v2;
}

+ (void)setPhoneNumberMCCToISOCountryCodeTransformBlock:(id)a3
{
  id v3 = (Block_layout *)objc_retainBlock(a3);
  id v4 = off_100581230;
  off_100581230 = v3;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)primaryDeviceID
{
  return self->_primaryDeviceID;
}

- (void)setPrimaryDeviceID:(id)a3
{
}

- (NSString)phoneNumberURI
{
  return self->_phoneNumberURI;
}

- (void)setPhoneNumberURI:(id)a3
{
}

- (int64_t)availableDeviceSlots
{
  return self->_availableDeviceSlots;
}

- (void)setAvailableDeviceSlots:(int64_t)a3
{
  self->_availableDeviceSlots = a3;
}

- (NSSet)allowedSecondaryDeviceIDs
{
  return self->_allowedSecondaryDeviceIDs;
}

- (void)setAllowedSecondaryDeviceIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSecondaryDeviceIDs, 0);
  objc_storeStrong((id *)&self->_phoneNumberURI, 0);
  objc_storeStrong((id *)&self->_primaryDeviceID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end