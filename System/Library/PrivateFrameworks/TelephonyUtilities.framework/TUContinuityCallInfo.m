@interface TUContinuityCallInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isBranded;
- (NSData)handlesHash;
- (NSDictionary)contactIdentifiersByHandle;
- (NSString)callIdentifier;
- (NSString)callerIdSubstring;
- (NSString)displayName;
- (NSString)senderIdentityName;
- (NSString)senderIdentityShortName;
- (TUContinuityCallInfo)initWithCallIdentifier:(id)a3 callerIdSubstring:(id)a4 displayName:(id)a5 isBranded:(BOOL)a6 contactIdentifiersByHandle:(id)a7 senderIdentityShortName:(id)a8 senderIdentityName:(id)a9 handlesHash:(id)a10;
- (TUContinuityCallInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUContinuityCallInfo

- (TUContinuityCallInfo)initWithCallIdentifier:(id)a3 callerIdSubstring:(id)a4 displayName:(id)a5 isBranded:(BOOL)a6 contactIdentifiersByHandle:(id)a7 senderIdentityShortName:(id)a8 senderIdentityName:(id)a9 handlesHash:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)TUContinuityCallInfo;
  v23 = [(TUContinuityCallInfo *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    callIdentifier = v23->_callIdentifier;
    v23->_callIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    callerIdSubstring = v23->_callerIdSubstring;
    v23->_callerIdSubstring = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    displayName = v23->_displayName;
    v23->_displayName = (NSString *)v28;

    v23->_isBranded = a6;
    uint64_t v30 = [v19 copy];
    contactIdentifiersByHandle = v23->_contactIdentifiersByHandle;
    v23->_contactIdentifiersByHandle = (NSDictionary *)v30;

    uint64_t v32 = [v20 copy];
    senderIdentityShortName = v23->_senderIdentityShortName;
    v23->_senderIdentityShortName = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    senderIdentityName = v23->_senderIdentityName;
    v23->_senderIdentityName = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    handlesHash = v23->_handlesHash;
    v23->_handlesHash = (NSData *)v36;
  }
  return v23;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" callIdentifier=%@", self->_callIdentifier];
  [v6 appendFormat:@" displayName=%@", self->_displayName];
  [v6 appendFormat:@" callerIdSubstring=%@", self->_callerIdSubstring];
  if (self->_isBranded) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v6 appendFormat:@" isBranded=%@", v7];
  [v6 appendFormat:@" contactIdentifiersByHandle=%@", self->_contactIdentifiersByHandle];
  [v6 appendFormat:@" senderIdentityShortName=%@", self->_senderIdentityShortName];
  [v6 appendFormat:@" senderIdentityName=%@", self->_senderIdentityName];
  [v6 appendFormat:@">"];
  v8 = (void *)[v6 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [+[TUContinuityCallInfo allocWithZone:a3] initWithCallIdentifier:self->_callIdentifier callerIdSubstring:self->_callerIdSubstring displayName:self->_displayName isBranded:self->_isBranded contactIdentifiersByHandle:self->_contactIdentifiersByHandle senderIdentityShortName:self->_senderIdentityShortName senderIdentityName:self->_senderIdentityName handlesHash:self->_handlesHash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityCallInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v31 = NSStringFromSelector(sel_callIdentifier);
  uint64_t v28 = [v4 decodeObjectOfClass:v5 forKey:v31];
  uint64_t v6 = objc_opt_class();
  uint64_t v30 = NSStringFromSelector(sel_callerIdSubstring);
  uint64_t v26 = [v4 decodeObjectOfClass:v6 forKey:v30];
  uint64_t v7 = objc_opt_class();
  v29 = NSStringFromSelector(sel_displayName);
  v25 = [v4 decodeObjectOfClass:v7 forKey:v29];
  v27 = NSStringFromSelector(sel_isBranded);
  unsigned int v22 = [v4 decodeBoolForKey:v27];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v24 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v21 = NSStringFromSelector(sel_contactIdentifiersByHandle);
  v10 = [v4 decodeObjectOfClasses:v24 forKey:v21];
  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_senderIdentityShortName);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
  uint64_t v14 = objc_opt_class();
  v15 = NSStringFromSelector(sel_senderIdentityName);
  id v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
  uint64_t v17 = objc_opt_class();
  id v18 = NSStringFromSelector(sel_handlesHash);
  id v19 = [v4 decodeObjectOfClass:v17 forKey:v18];

  v23 = [(TUContinuityCallInfo *)self initWithCallIdentifier:v28 callerIdSubstring:v26 displayName:v25 isBranded:v22 contactIdentifiersByHandle:v10 senderIdentityShortName:v13 senderIdentityName:v16 handlesHash:v19];
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  callIdentifier = self->_callIdentifier;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_callIdentifier);
  [v5 encodeObject:callIdentifier forKey:v6];

  callerIdSubstring = self->_callerIdSubstring;
  v8 = NSStringFromSelector(sel_callerIdSubstring);
  [v5 encodeObject:callerIdSubstring forKey:v8];

  displayName = self->_displayName;
  v10 = NSStringFromSelector(sel_displayName);
  [v5 encodeObject:displayName forKey:v10];

  BOOL isBranded = self->_isBranded;
  v12 = NSStringFromSelector(sel_isBranded);
  [v5 encodeBool:isBranded forKey:v12];

  contactIdentifiersByHandle = self->_contactIdentifiersByHandle;
  uint64_t v14 = NSStringFromSelector(sel_contactIdentifiersByHandle);
  [v5 encodeObject:contactIdentifiersByHandle forKey:v14];

  senderIdentityShortName = self->_senderIdentityShortName;
  id v16 = NSStringFromSelector(sel_senderIdentityShortName);
  [v5 encodeObject:senderIdentityShortName forKey:v16];

  senderIdentityName = self->_senderIdentityName;
  id v18 = NSStringFromSelector(sel_senderIdentityName);
  [v5 encodeObject:senderIdentityName forKey:v18];

  handlesHash = self->_handlesHash;
  NSStringFromSelector(sel_handlesHash);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:handlesHash forKey:v20];
}

- (NSString)callIdentifier
{
  return self->_callIdentifier;
}

- (NSString)callerIdSubstring
{
  return self->_callerIdSubstring;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isBranded
{
  return self->_isBranded;
}

- (NSDictionary)contactIdentifiersByHandle
{
  return self->_contactIdentifiersByHandle;
}

- (NSString)senderIdentityShortName
{
  return self->_senderIdentityShortName;
}

- (NSString)senderIdentityName
{
  return self->_senderIdentityName;
}

- (NSData)handlesHash
{
  return self->_handlesHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlesHash, 0);
  objc_storeStrong((id *)&self->_senderIdentityName, 0);
  objc_storeStrong((id *)&self->_senderIdentityShortName, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersByHandle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_callerIdSubstring, 0);

  objc_storeStrong((id *)&self->_callIdentifier, 0);
}

@end