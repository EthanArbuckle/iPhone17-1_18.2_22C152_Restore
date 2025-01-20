@interface PKAppleBalanceInStoreTopUpToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (NSArray)certificateChain;
- (NSData)payload;
- (NSData)signature;
- (NSDate)expirationDate;
- (NSString)token;
- (NSString)tokenIdentifier;
- (NSURL)termsURL;
- (PKAppleBalanceInStoreTopUpToken)initWithCoder:(id)a3;
- (PKAppleBalanceInStoreTopUpToken)initWithDictionary:(id)a3 accountIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayableToken;
- (int64_t)state;
- (int64_t)tokenType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificateChain:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSignature:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTermsURL:(id)a3;
- (void)setToken:(id)a3;
- (void)setTokenIdentifier:(id)a3;
- (void)setTokenType:(int64_t)a3;
@end

@implementation PKAppleBalanceInStoreTopUpToken

- (PKAppleBalanceInStoreTopUpToken)initWithDictionary:(id)a3 accountIdentifier:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)PKAppleBalanceInStoreTopUpToken;
  v8 = [(PKAppleBalanceInStoreTopUpToken *)&v68 init];
  if (!v8) {
    goto LABEL_59;
  }
  v9 = [v6 PKDictionaryForKey:@"token"];
  v10 = [v9 PKStringForKey:@"payload"];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
  id v67 = 0;
  v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v67];
  id v62 = v67;
  if (v62)
  {
    p_super = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      [v62 description];
      v15 = v14 = v12;
      *(_DWORD *)buf = 138412290;
      v71 = v15;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: error decoding payload %@", buf, 0xCu);

      v12 = v14;
    }
  }
  else
  {
    uint64_t v16 = [v12 PKStringForKey:@"token"];
    token = v8->_token;
    v8->_token = (NSString *)v16;

    uint64_t v18 = [v12 PKDateForKey:@"expirationDate"];
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v18;

    uint64_t v20 = [v11 SHA256Hash];
    p_super = &v8->_payload->super;
    v8->_payload = (NSData *)v20;
  }

  if (!v8->_token)
  {
    v24 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v26 = "Top Up Token failed to initialize: missing token";
LABEL_20:
    _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    goto LABEL_21;
  }
  if (!v8->_expirationDate)
  {
    v24 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v26 = "Top Up Token failed to initialize: missing expiration date";
    goto LABEL_20;
  }
  if (!v8->_payload)
  {
    v24 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "Top Up Token failed to initialize: missing payload";
      goto LABEL_20;
    }
LABEL_21:
    int v27 = 1;
    goto LABEL_57;
  }
  v61 = v12;
  v21 = [v12 PKStringForKey:@"accountId"];
  v22 = v7;
  v23 = v21;
  v24 = v23;
  if (v23 == v22)
  {

    goto LABEL_23;
  }
  if (v22 && v23)
  {
    char v25 = [v22 isEqualToString:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_41;
    }
LABEL_23:
    uint64_t v28 = [v6 PKStringForKey:@"tokenIdentifier"];
    tokenIdentifier = v8->_tokenIdentifier;
    v8->_tokenIdentifier = (NSString *)v28;

    if (v8->_tokenIdentifier)
    {
      v57 = v6;
      v58 = v11;
      v56 = v10;
      v59 = v9;
      v55 = [v9 PKDictionaryForKey:@"header"];
      v30 = [v55 PKArrayContaining:objc_opt_class() forKey:@"x5c"];
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v32 = v30;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v63 objects:v69 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v64 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v63 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v37 options:0];
              if (v38) {
                [v31 addObject:v38];
              }
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v63 objects:v69 count:16];
        }
        while (v34);
      }

      uint64_t v39 = [v31 copy];
      certificateChain = v8->_certificateChain;
      v8->_certificateChain = (NSArray *)v39;

      if ([(NSArray *)v8->_certificateChain count])
      {
        v9 = v59;
        uint64_t v41 = [v59 PKStringForKey:@"signature"];
        uint64_t v42 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v41 options:0];
        signature = v8->_signature;
        v8->_signature = (NSData *)v42;

        v10 = v56;
        v6 = v57;
        v54 = (void *)v41;
        if (v8->_signature)
        {
          uint64_t v44 = [v57 PKURLForKey:@"termsURL"];
          termsURL = v8->_termsURL;
          v8->_termsURL = (NSURL *)v44;

          v46 = [v57 PKStringForKey:@"tokenType"];
          v8->_tokenType = PKAppleBalanceInStoreTopUpTokenTypeFromString(v46);

          v47 = [v57 PKStringForKey:@"state"];
          v48 = v47;
          if (v47) {
            v47 = PKAppleBalanceInStoreTopUpTokenStateFromString(v47);
          }
          int v27 = 0;
          v8->_state = (int64_t)v47;
        }
        else
        {
          v48 = PKLogFacilityTypeGetObject(0xEuLL);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v57;
            _os_log_impl(&dword_190E10000, v48, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: missing signature %@", buf, 0xCu);
          }
          int v27 = 1;
        }

        v50 = v55;
      }
      else
      {
        v51 = PKLogFacilityTypeGetObject(0xEuLL);
        v10 = v56;
        v6 = v57;
        v9 = v59;
        v50 = v55;
        v54 = v51;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v57;
          _os_log_impl(&dword_190E10000, v51, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: missing or invalid certificate data %@", buf, 0xCu);
        }
        int v27 = 1;
      }

      v11 = v58;
    }
    else
    {
      v50 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v50, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: missing token identifier", buf, 2u);
      }
      int v27 = 1;
    }
    v12 = v61;
    goto LABEL_56;
  }

LABEL_41:
  v60 = v9;
  v49 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v71 = v24;
    __int16 v72 = 2112;
    v73 = v22;
    _os_log_impl(&dword_190E10000, v49, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: response account ID %@ did not match device account ID %@", buf, 0x16u);
  }
  int v27 = 1;
  v50 = v49;
  v9 = v60;
  v12 = v61;
LABEL_56:

LABEL_57:
  if (!v27)
  {
LABEL_59:
    v52 = v8;
    goto LABEL_60;
  }
  v52 = 0;
LABEL_60:

  return v52;
}

- (BOOL)isExpired
{
  expirationDate = self->_expirationDate;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(expirationDate) = [(NSDate *)expirationDate compare:v3] == NSOrderedAscending;

  return (char)expirationDate;
}

- (id)displayableToken
{
  v3 = [MEMORY[0x1E4F28E78] string];
  token = self->_token;
  uint64_t v5 = [(NSString *)token length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKAppleBalanceInStoreTopUpToken_displayableToken__block_invoke;
  v8[3] = &unk_1E56D8218;
  id v6 = v3;
  id v9 = v6;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](token, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);

  return v6;
}

void __51__PKAppleBalanceInStoreTopUpToken_displayableToken__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = v5;
  if ((a3 & 3) == 0)
  {
    [*(id *)(a1 + 32) appendString:@" "];
    id v5 = v6;
  }
  [*(id *)(a1 + 32) appendString:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceInStoreTopUpToken)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKAppleBalanceInStoreTopUpToken *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenIdentifier"];
    tokenIdentifier = v5->_tokenIdentifier;
    v5->_tokenIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v5->_tokenType = [v4 decodeIntegerForKey:@"tokenType"];
    v5->_state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    uint64_t v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"certificateChain"];
    certificateChain = v5->_certificateChain;
    v5->_certificateChain = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSData *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  token = self->_token;
  id v5 = a3;
  [v5 encodeObject:token forKey:@"token"];
  [v5 encodeObject:self->_tokenIdentifier forKey:@"tokenIdentifier"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeInteger:self->_tokenType forKey:@"tokenType"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeObject:self->_termsURL forKey:@"termsURL"];
  [v5 encodeObject:self->_certificateChain forKey:@"certificateChain"];
  [v5 encodeObject:self->_payload forKey:@"payload"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_36;
  }
  token = self->_token;
  uint64_t v6 = (NSString *)v4[1];
  if (token && v6)
  {
    if ((-[NSString isEqual:](token, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (token != v6)
  {
    goto LABEL_36;
  }
  tokenIdentifier = self->_tokenIdentifier;
  uint64_t v8 = (NSString *)v4[3];
  if (tokenIdentifier && v8)
  {
    if ((-[NSString isEqual:](tokenIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (tokenIdentifier != v8)
  {
    goto LABEL_36;
  }
  expirationDate = self->_expirationDate;
  uint64_t v10 = (NSDate *)v4[4];
  if (expirationDate && v10)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (expirationDate != v10)
  {
    goto LABEL_36;
  }
  if (self->_tokenType != v4[2] || self->_state != v4[5]) {
    goto LABEL_36;
  }
  termsURL = self->_termsURL;
  uint64_t v12 = (NSURL *)v4[6];
  if (termsURL && v12)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (termsURL != v12)
  {
    goto LABEL_36;
  }
  certificateChain = self->_certificateChain;
  v14 = (NSArray *)v4[7];
  if (certificateChain && v14)
  {
    if ((-[NSArray isEqual:](certificateChain, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (certificateChain != v14)
  {
    goto LABEL_36;
  }
  payload = self->_payload;
  uint64_t v16 = (NSData *)v4[8];
  if (!payload || !v16)
  {
    if (payload == v16) {
      goto LABEL_32;
    }
LABEL_36:
    char v19 = 0;
    goto LABEL_37;
  }
  if ((-[NSData isEqual:](payload, "isEqual:") & 1) == 0) {
    goto LABEL_36;
  }
LABEL_32:
  signature = self->_signature;
  uint64_t v18 = (NSData *)v4[9];
  if (signature && v18) {
    char v19 = -[NSData isEqual:](signature, "isEqual:");
  }
  else {
    char v19 = signature == v18;
  }
LABEL_37:

  return v19;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_token];
  [v3 safelyAddObject:self->_tokenIdentifier];
  [v3 safelyAddObject:self->_expirationDate];
  [v3 safelyAddObject:self->_termsURL];
  [v3 safelyAddObject:self->_certificateChain];
  [v3 safelyAddObject:self->_payload];
  [v3 safelyAddObject:self->_signature];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_tokenType - v4 + 32 * v4;
  unint64_t v6 = self->_state - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"token: '%@'; ", self->_token];
  [v3 appendFormat:@"identifier: '%@'; ", self->_tokenIdentifier];
  if (self->_tokenType) {
    uint64_t v4 = @"unknown";
  }
  else {
    uint64_t v4 = @"barcode";
  }
  [v3 appendFormat:@"type: '%@'; ", v4];
  int64_t v5 = [(NSDate *)self->_expirationDate description];
  [v3 appendFormat:@"expirationDate: '%@'; ", v5];

  int64_t state = self->_state;
  id v7 = @"valid";
  if (state == 1) {
    id v7 = @"invalid";
  }
  if (state == 2) {
    uint64_t v8 = @"unknown";
  }
  else {
    uint64_t v8 = v7;
  }
  [v3 appendFormat:@"state: '%@'; ", v8];
  id v9 = [(NSURL *)self->_termsURL description];
  [v3 appendFormat:@"termsURL: '%@'; ", v9];

  uint64_t v10 = [(NSArray *)self->_certificateChain description];
  [v3 appendFormat:@"certificateChain: '%@'; ", v10];

  [v3 appendFormat:@"payload: '%@'; ", self->_payload];
  [v3 appendFormat:@"signature: '%@'; ", self->_signature];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [+[PKAppleBalanceInStoreTopUpToken allocWithZone:](PKAppleBalanceInStoreTopUpToken, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_token copyWithZone:a3];
  token = v5->_token;
  v5->_token = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_tokenIdentifier copyWithZone:a3];
  tokenIdentifier = v5->_tokenIdentifier;
  v5->_tokenIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v10;

  v5->_tokenType = self->_tokenType;
  v5->_int64_t state = self->_state;
  uint64_t v12 = [(NSURL *)self->_termsURL copyWithZone:a3];
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v12;

  uint64_t v14 = [(NSArray *)self->_certificateChain copyWithZone:a3];
  certificateChain = v5->_certificateChain;
  v5->_certificateChain = (NSArray *)v14;

  uint64_t v16 = [(NSData *)self->_payload copyWithZone:a3];
  payload = v5->_payload;
  v5->_payload = (NSData *)v16;

  uint64_t v18 = [(NSData *)self->_signature copyWithZone:a3];
  signature = v5->_signature;
  v5->_signature = (NSData *)v18;

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (int64_t)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(int64_t)a3
{
  self->_tokenType = a3;
}

- (NSString)tokenIdentifier
{
  return self->_tokenIdentifier;
}

- (void)setTokenIdentifier:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_tokenIdentifier, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end