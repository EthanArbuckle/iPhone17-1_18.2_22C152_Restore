@interface ICMediaUserState
+ (BOOL)supportsSecureCoding;
- (BOOL)ageVerificationRequired;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrozen;
- (ICMediaUserState)initWithBlock:(id)a3;
- (ICMediaUserState)initWithCoder:(id)a3;
- (ICMusicUserState)music;
- (ICTVUserState)tv;
- (NSArray)homeUserIDs;
- (NSNumber)dsid;
- (NSString)alternateDSID;
- (NSString)countryCode;
- (NSString)description;
- (NSString)digest;
- (NSString)firstName;
- (NSString)iCloudPersonID;
- (NSString)identifier;
- (NSString)lastName;
- (NSString)shortDebugName;
- (NSString)storefrontIdentifier;
- (NSString)username;
- (id)copyWithBlock:(id)a3;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAgeVerificationRequired:(BOOL)a3;
- (void)setAlternateDSID:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDsid:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHomeUserIDs:(id)a3;
- (void)setICloudPersonID:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setMusic:(id)a3;
- (void)setShortDebugName:(id)a3;
- (void)setStorefrontIdentifier:(id)a3;
- (void)setTv:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation ICMediaUserState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tv, 0);
  objc_storeStrong((id *)&self->_music, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUserIDs, 0);
  objc_storeStrong((id *)&self->_iCloudPersonID, 0);
  objc_storeStrong((id *)&self->_alternateDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_shortDebugName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setTv:(id)a3
{
}

- (ICTVUserState)tv
{
  return self->_tv;
}

- (ICMusicUserState)music
{
  return self->_music;
}

- (void)setAgeVerificationRequired:(BOOL)a3
{
  self->_ageVerificationRequired = a3;
}

- (BOOL)ageVerificationRequired
{
  return self->_ageVerificationRequired;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSArray)homeUserIDs
{
  return self->_homeUserIDs;
}

- (NSString)iCloudPersonID
{
  return self->_iCloudPersonID;
}

- (NSString)alternateDSID
{
  return self->_alternateDSID;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setShortDebugName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setCountryCode:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_frozen)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:271 description:@"Attempt to mutate after being initialized."];
  }
  countryCode = self->_countryCode;
  self->_countryCode = v5;
}

- (void)setMusic:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:266 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (ICMusicUserState *)[v5 copy];
  music = self->_music;
  self->_music = v6;
}

- (void)setUsername:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:261 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  username = self->_username;
  self->_username = v6;
}

- (void)setLastName:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:256 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  lastName = self->_lastName;
  self->_lastName = v6;
}

- (void)setFirstName:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:251 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  firstName = self->_firstName;
  self->_firstName = v6;
}

- (void)setStorefrontIdentifier:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:246 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  storefrontIdentifier = self->_storefrontIdentifier;
  self->_storefrontIdentifier = v6;
}

- (void)setHomeUserIDs:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:241 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSArray *)[v5 copy];
  homeUserIDs = self->_homeUserIDs;
  self->_homeUserIDs = v6;
}

- (void)setICloudPersonID:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:236 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  iCloudPersonID = self->_iCloudPersonID;
  self->_iCloudPersonID = v6;
}

- (void)setAlternateDSID:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:231 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  alternateDSID = self->_alternateDSID;
  self->_alternateDSID = v6;
}

- (void)setDsid:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:226 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSNumber *)[v5 copy];
  dsid = self->_dsid;
  self->_dsid = v6;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_frozen)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:221 description:@"Attempt to mutate after being initialized."];
  }
  self->_isActive = a3;
}

- (void)setIdentifier:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMediaUserState.m" lineNumber:216 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  identifier = self->_identifier;
  self->_identifier = v6;
}

- (ICMediaUserState)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ICMediaUserState;
  id v5 = [(ICMediaUserState *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortDebugName"];
    shortDebugName = v5->_shortDebugName;
    v5->_shortDebugName = (NSString *)v8;

    v5->_isActive = [v4 decodeBoolForKey:@"isActive"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateDSID"];
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iCloudPersonID"];
    iCloudPersonID = v5->_iCloudPersonID;
    v5->_iCloudPersonID = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"homeUserIDs"];
    homeUserIDs = v5->_homeUserIDs;
    v5->_homeUserIDs = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefrontIdentifier"];
    storefrontIdentifier = v5->_storefrontIdentifier;
    v5->_storefrontIdentifier = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    username = v5->_username;
    v5->_username = (NSString *)v29;

    v5->_ageVerificationRequired = [v4 decodeBoolForKey:@"ageVerificationRequired"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"music"];
    music = v5->_music;
    v5->_music = (ICMusicUserState *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tv"];
    tv = v5->_tv;
    v5->_tv = (ICTVUserState *)v33;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_shortDebugName forKey:@"shortDebugName"];
  [v5 encodeBool:self->_isActive forKey:@"isActive"];
  [v5 encodeObject:self->_dsid forKey:@"dsid"];
  [v5 encodeObject:self->_alternateDSID forKey:@"alternateDSID"];
  [v5 encodeObject:self->_iCloudPersonID forKey:@"iCloudPersonID"];
  [v5 encodeObject:self->_homeUserIDs forKey:@"homeUserIDs"];
  [v5 encodeObject:self->_storefrontIdentifier forKey:@"storefrontIdentifier"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_firstName forKey:@"firstName"];
  [v5 encodeObject:self->_lastName forKey:@"lastName"];
  [v5 encodeObject:self->_username forKey:@"username"];
  [v5 encodeBool:self->_ageVerificationRequired forKey:@"ageVerificationRequired"];
  [v5 encodeObject:self->_music forKey:@"music"];
  [v5 encodeObject:self->_tv forKey:@"tv"];
}

- (NSString)shortDebugName
{
  v3 = NSString;
  id v4 = [(ICMediaUserState *)self username];
  id v5 = [(ICMediaUserState *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"\"%@\" (%@)", v4, v5];

  return (NSString *)v6;
}

- (NSString)digest
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSVHasherSharedSeed();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v107 = v3 ^ 0x736F6D6570736575;
  uint64_t v108 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v109 = v3 ^ 0x6C7967656E657261;
  uint64_t v110 = v4 ^ 0x7465646279746573;
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = objc_claimAutoreleasedReturnValue();
  [v6 UTF8String];
  [v6 length];

  v7 = self->_identifier;
  [(NSString *)v7 UTF8String];
  [(NSString *)v7 length];

  BOOL isActive = self->_isActive;
  LODWORD(data) = self->_isActive;
  *(void *)&long long v111 = isActive + 0x400000000000000;
  *(void *)&long long data = [(NSNumber *)self->_dsid integerValue];
  uint64_t v9 = data;
  unint64_t v10 = v111;
  if ((v111 & 0x400000000000000) != 0)
  {
    if ((v111 & 0x300000000000000) != 0)
    {
      v101 = [MEMORY[0x1E4F28B00] currentHandler];
      v102 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v101, "handleFailureInFunction:file:lineNumber:description:", v102, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", (void)v111);

      unint64_t v10 = v111;
    }
    uint64_t v17 = v10 & 0xFFFFFFFFFFFFFFLL | (v9 << 32);
    uint64_t v18 = (v107 + v108) ^ __ROR8__(v108, 51);
    uint64_t v19 = v109 + (v17 ^ v110);
    uint64_t v20 = __ROR8__(v17 ^ v110, 48);
    uint64_t v21 = (v19 ^ v20) + __ROR8__(v107 + v108, 32);
    uint64_t v22 = v21 ^ __ROR8__(v19 ^ v20, 43);
    uint64_t v23 = v19 + v18;
    uint64_t v109 = __ROR8__(v23, 32);
    uint64_t v110 = v22;
    uint64_t v107 = v21 ^ v17;
    uint64_t v108 = v23 ^ __ROR8__(v18, 47);
    unint64_t v10 = v10 & 0xFF00000000000000 | HIDWORD(v9);
  }
  else
  {
    if ((v111 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v95 = [MEMORY[0x1E4F28B00] currentHandler];
      v96 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v95 handleFailureInFunction:v96, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", (void)v111 file lineNumber description];

      unint64_t v10 = v111;
    }
    uint64_t v11 = (v107 + v108) ^ __ROR8__(v108, 51);
    uint64_t v12 = v109 + (v110 ^ v9);
    uint64_t v13 = __ROR8__(v110 ^ v9, 48);
    uint64_t v14 = (v12 ^ v13) + __ROR8__(v107 + v108, 32);
    uint64_t v15 = v14 ^ __ROR8__(v12 ^ v13, 43);
    uint64_t v16 = v12 + v11;
    uint64_t v109 = __ROR8__(v16, 32);
    uint64_t v110 = v15;
    uint64_t v107 = v14 ^ v9;
    uint64_t v108 = v16 ^ __ROR8__(v11, 47);
  }
  *(void *)&long long v111 = v10 + 0x800000000000000;
  v24 = self->_alternateDSID;
  [(NSString *)v24 UTF8String];
  [(NSString *)v24 length];

  uint64_t v25 = self->_iCloudPersonID;
  [(NSString *)v25 UTF8String];
  [(NSString *)v25 length];

  v26 = self->_homeUserIDs;
  *(void *)&long long data = [(NSArray *)v26 hash];
  uint64_t v27 = data;
  unint64_t v28 = v111;
  if ((v111 & 0x400000000000000) != 0)
  {
    if ((v111 & 0x300000000000000) != 0)
    {
      v103 = [MEMORY[0x1E4F28B00] currentHandler];
      v104 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v103, "handleFailureInFunction:file:lineNumber:description:", v104, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", (void)v111);

      unint64_t v28 = v111;
    }
    uint64_t v35 = v28 & 0xFFFFFFFFFFFFFFLL | (v27 << 32);
    uint64_t v36 = (v107 + v108) ^ __ROR8__(v108, 51);
    uint64_t v37 = v109 + (v35 ^ v110);
    uint64_t v38 = __ROR8__(v35 ^ v110, 48);
    uint64_t v39 = (v37 ^ v38) + __ROR8__(v107 + v108, 32);
    uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
    uint64_t v41 = v37 + v36;
    uint64_t v109 = __ROR8__(v41, 32);
    uint64_t v110 = v40;
    uint64_t v107 = v39 ^ v35;
    uint64_t v108 = v41 ^ __ROR8__(v36, 47);
    unint64_t v28 = v28 & 0xFF00000000000000 | HIDWORD(v27);
  }
  else
  {
    if ((v111 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v97 = [MEMORY[0x1E4F28B00] currentHandler];
      v98 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v97 handleFailureInFunction:v98, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", (void)v111 file lineNumber description];

      unint64_t v28 = v111;
    }
    uint64_t v29 = (v107 + v108) ^ __ROR8__(v108, 51);
    uint64_t v30 = v109 + (v110 ^ v27);
    uint64_t v31 = __ROR8__(v110 ^ v27, 48);
    uint64_t v32 = (v30 ^ v31) + __ROR8__(v107 + v108, 32);
    uint64_t v33 = v32 ^ __ROR8__(v30 ^ v31, 43);
    uint64_t v34 = v30 + v29;
    uint64_t v109 = __ROR8__(v34, 32);
    uint64_t v110 = v33;
    uint64_t v107 = v32 ^ v27;
    uint64_t v108 = v34 ^ __ROR8__(v29, 47);
  }
  *(void *)&long long v111 = v28 + 0x800000000000000;

  v42 = self->_storefrontIdentifier;
  [(NSString *)v42 UTF8String];
  [(NSString *)v42 length];

  v43 = self->_firstName;
  [(NSString *)v43 UTF8String];
  [(NSString *)v43 length];

  v44 = self->_lastName;
  [(NSString *)v44 UTF8String];
  [(NSString *)v44 length];

  v45 = self->_username;
  [(NSString *)v45 UTF8String];
  [(NSString *)v45 length];

  v46 = self->_music;
  *(void *)&long long data = [(ICMusicUserState *)v46 hash];
  uint64_t v47 = data;
  unint64_t v48 = v111;
  if ((v111 & 0x400000000000000) != 0)
  {
    if ((v111 & 0x300000000000000) != 0)
    {
      v105 = [MEMORY[0x1E4F28B00] currentHandler];
      v106 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v105, "handleFailureInFunction:file:lineNumber:description:", v106, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", (void)v111);

      unint64_t v48 = v111;
    }
    uint64_t v55 = v48 & 0xFFFFFFFFFFFFFFLL | (v47 << 32);
    uint64_t v56 = (v107 + v108) ^ __ROR8__(v108, 51);
    uint64_t v57 = v109 + (v55 ^ v110);
    uint64_t v58 = __ROR8__(v55 ^ v110, 48);
    uint64_t v59 = (v57 ^ v58) + __ROR8__(v107 + v108, 32);
    uint64_t v60 = v59 ^ __ROR8__(v57 ^ v58, 43);
    uint64_t v61 = v57 + v56;
    uint64_t v109 = __ROR8__(v61, 32);
    uint64_t v110 = v60;
    uint64_t v107 = v59 ^ v55;
    uint64_t v108 = v61 ^ __ROR8__(v56, 47);
    unint64_t v48 = v48 & 0xFF00000000000000 | HIDWORD(v47);
  }
  else
  {
    if ((v111 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v99 = [MEMORY[0x1E4F28B00] currentHandler];
      v100 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v99 handleFailureInFunction:v100, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", (void)v111 file lineNumber description];

      unint64_t v48 = v111;
    }
    uint64_t v49 = (v107 + v108) ^ __ROR8__(v108, 51);
    uint64_t v50 = v109 + (v110 ^ v47);
    uint64_t v51 = __ROR8__(v110 ^ v47, 48);
    uint64_t v52 = (v50 ^ v51) + __ROR8__(v107 + v108, 32);
    uint64_t v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
    uint64_t v54 = v50 + v49;
    uint64_t v109 = __ROR8__(v54, 32);
    uint64_t v110 = v53;
    uint64_t v107 = v52 ^ v47;
    uint64_t v108 = v54 ^ __ROR8__(v49, 47);
  }
  *(void *)&long long v111 = v48 + 0x800000000000000;

  memset(&v122[8], 0, 64);
  *(void *)v122 = 1000;
  uint64_t v62 = (v107 + v108) ^ __ROR8__(v108, 51);
  uint64_t v63 = v109 + (v110 ^ v111);
  uint64_t v64 = __ROR8__(v110 ^ v111, 48);
  uint64_t v65 = (v63 ^ v64) + __ROR8__(v107 + v108, 32);
  uint64_t v66 = v65 ^ __ROR8__(v63 ^ v64, 43);
  uint64_t v67 = v63 + v62;
  uint64_t v68 = v67 ^ __ROR8__(v62, 47);
  uint64_t v69 = (v65 ^ v111) + v68;
  uint64_t v70 = v69 ^ __ROR8__(v68, 51);
  uint64_t v71 = (__ROR8__(v67, 32) ^ 0xFFLL) + v66;
  uint64_t v72 = __ROR8__(v66, 48);
  uint64_t v73 = __ROR8__(v69, 32) + (v71 ^ v72);
  uint64_t v74 = v73 ^ __ROR8__(v71 ^ v72, 43);
  uint64_t v75 = v70 + v71;
  uint64_t v76 = v75 ^ __ROR8__(v70, 47);
  uint64_t v77 = v76 + v73;
  uint64_t v78 = v77 ^ __ROR8__(v76, 51);
  uint64_t v79 = __ROR8__(v75, 32) + v74;
  uint64_t v80 = __ROR8__(v74, 48);
  uint64_t v81 = __ROR8__(v77, 32) + (v79 ^ v80);
  uint64_t v82 = v81 ^ __ROR8__(v79 ^ v80, 43);
  uint64_t v83 = v78 + v79;
  uint64_t v84 = v83 ^ __ROR8__(v78, 47);
  uint64_t v85 = v84 + v81;
  uint64_t v86 = v85 ^ __ROR8__(v84, 51);
  uint64_t v87 = __ROR8__(v83, 32) + v82;
  uint64_t v88 = __ROR8__(v82, 48);
  uint64_t v89 = __ROR8__(v85, 32) + (v87 ^ v88);
  uint64_t v90 = v89 ^ __ROR8__(v87 ^ v88, 43);
  uint64_t v91 = v86 + v87;
  uint64_t v107 = v89;
  uint64_t v108 = v91 ^ __ROR8__(v86, 47);
  uint64_t v109 = __ROR8__(v91, 32);
  uint64_t v110 = v90;
  *(void *)&v122[8] = v108 ^ v89 ^ v109 ^ v90;
  long long data = *(_OWORD *)v122;
  long long v124 = *(_OWORD *)&v122[16];
  long long v125 = *(_OWORD *)&v122[32];
  long long v126 = *(_OWORD *)&v122[48];
  uint64_t v127 = 0;
  v92 = [NSNumber numberWithUnsignedInteger:*(void *)&v122[8]];
  v93 = [v92 stringValue];

  return (NSString *)v93;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICMediaUserState *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(ICMediaUserState *)self identifier];
      id v7 = [(ICMediaUserState *)v5 identifier];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8) {
          goto LABEL_10;
        }
      }
      BOOL v10 = [(ICMediaUserState *)self isActive];
      if (v10 != [(ICMediaUserState *)v5 isActive])
      {
LABEL_10:
        BOOL v9 = 0;
LABEL_62:

        goto LABEL_63;
      }
      id v11 = [(ICMediaUserState *)self dsid];
      id v12 = [(ICMediaUserState *)v5 dsid];
      if (v11 == v12)
      {
      }
      else
      {
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          BOOL v9 = 0;
LABEL_61:

          goto LABEL_62;
        }
      }
      id v14 = [(ICMediaUserState *)self alternateDSID];
      id v70 = [(ICMediaUserState *)v5 alternateDSID];
      uint64_t v71 = v14;
      if (v14 == v70)
      {
      }
      else
      {
        int v15 = [v14 isEqual:v70];

        if (!v15)
        {
          BOOL v9 = 0;
LABEL_60:

          goto LABEL_61;
        }
      }
      id v16 = [(ICMediaUserState *)self iCloudPersonID];
      id v17 = [(ICMediaUserState *)v5 iCloudPersonID];
      uint64_t v68 = v16;
      uint64_t v69 = v17;
      if (v16 == v17)
      {
      }
      else
      {
        uint64_t v18 = v17;
        int v19 = [v16 isEqual:v17];

        if (!v19)
        {
          BOOL v9 = 0;
          uint64_t v20 = v68;
LABEL_59:

          goto LABEL_60;
        }
      }
      id v21 = [(ICMediaUserState *)self homeUserIDs];
      id v22 = [(ICMediaUserState *)v5 homeUserIDs];
      uint64_t v65 = v22;
      uint64_t v66 = v21;
      if (v21 == v22)
      {
      }
      else
      {
        uint64_t v23 = v22;
        int v24 = [v21 isEqual:v22];

        if (!v24)
        {
          BOOL v9 = 0;
          uint64_t v20 = v68;
LABEL_58:

          goto LABEL_59;
        }
      }
      id v25 = [(ICMediaUserState *)self storefrontIdentifier];
      id v26 = [(ICMediaUserState *)v5 storefrontIdentifier];
      uint64_t v67 = v25;
      uint64_t v63 = v26;
      if (v25 == v26)
      {
      }
      else
      {
        uint64_t v27 = v26;
        int v28 = [v67 isEqual:v26];

        if (!v28)
        {
          BOOL v9 = 0;
          uint64_t v20 = v68;
LABEL_57:

          goto LABEL_58;
        }
      }
      id v29 = [(ICMediaUserState *)self firstName];
      id v30 = [(ICMediaUserState *)v5 firstName];
      uint64_t v64 = v29;
      uint64_t v61 = v30;
      if (v29 == v30)
      {
      }
      else
      {
        uint64_t v31 = v30;
        int v32 = [v29 isEqual:v30];

        if (!v32)
        {
          BOOL v9 = 0;
          uint64_t v20 = v68;
LABEL_56:

          goto LABEL_57;
        }
      }
      id v33 = [(ICMediaUserState *)self lastName];
      id v34 = [(ICMediaUserState *)v5 lastName];
      uint64_t v62 = v33;
      uint64_t v60 = v34;
      if (v33 == v34)
      {
      }
      else
      {
        uint64_t v35 = v34;
        int v36 = [v62 isEqual:v34];

        if (!v36)
        {
          BOOL v9 = 0;
          uint64_t v20 = v68;
LABEL_55:

          goto LABEL_56;
        }
      }
      id v37 = [(ICMediaUserState *)self username];
      id v38 = [(ICMediaUserState *)v5 username];
      uint64_t v59 = v38;
      if (v37 == v38)
      {
      }
      else
      {
        id v39 = v38;
        uint64_t v40 = v37;
        uint64_t v41 = v37;
        v42 = v39;
        int v43 = [v40 isEqual:v39];

        id v37 = v41;
        if (!v43) {
          goto LABEL_44;
        }
      }
      BOOL v44 = [(ICMediaUserState *)self ageVerificationRequired];
      if (v44 != [(ICMediaUserState *)v5 ageVerificationRequired])
      {
LABEL_44:
        BOOL v9 = 0;
        uint64_t v20 = v68;
LABEL_54:

        goto LABEL_55;
      }
      id v45 = [(ICMediaUserState *)self music];
      id v46 = [(ICMediaUserState *)v5 music];
      uint64_t v58 = v46;
      if (v45 == v46)
      {
      }
      else
      {
        id v47 = v46;
        unint64_t v48 = v45;
        uint64_t v56 = v45;
        uint64_t v49 = v47;
        int v50 = [v48 isEqual:v47];

        id v45 = v56;
        if (!v50)
        {
          BOOL v9 = 0;
          uint64_t v20 = v68;
LABEL_53:

          goto LABEL_54;
        }
      }
      uint64_t v51 = [(ICMediaUserState *)self tv];
      uint64_t v52 = [(ICMediaUserState *)v5 tv];
      uint64_t v57 = v51;
      if (v51 == v52)
      {
        BOOL v9 = 1;
      }
      else
      {
        uint64_t v53 = v52;
        char v54 = [v51 isEqual:v52];
        uint64_t v52 = v53;
        BOOL v9 = v54;
      }
      uint64_t v20 = v68;

      goto LABEL_53;
    }
    BOOL v9 = 0;
  }
LABEL_63:

  return v9;
}

- (id)redactedDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(ICMediaUserState *)self firstName];
  id v6 = [v3 stringWithFormat:@"<%@: %p> firstName=%@ isActive=%dl", v4, self, v5, -[ICMediaUserState isActive](self, "isActive")];

  return v6;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(ICMediaUserState *)self dsid];
  id v5 = ICCreateLoggableValueForDSID(v4);
  [v3 setObject:v5 forKeyedSubscript:@"dsid"];

  uint64_t v6 = [(ICMediaUserState *)self homeUserIDs];
  id v7 = (void *)v6;
  if (v6) {
    int v8 = (__CFString *)v6;
  }
  else {
    int v8 = @"nil";
  }
  [v3 setObject:v8 forKeyedSubscript:@"homeUserIds"];

  uint64_t v9 = [(ICMediaUserState *)self firstName];
  BOOL v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = @"nil";
  }
  [v3 setObject:v11 forKeyedSubscript:@"firstName"];

  uint64_t v12 = [(ICMediaUserState *)self lastName];
  int v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"nil";
  }
  [v3 setObject:v14 forKeyedSubscript:@"lastName"];

  if ([(ICMediaUserState *)self isActive]) {
    uint64_t v15 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v15 forKeyedSubscript:@"isActive"];
  uint64_t v16 = [(ICMediaUserState *)self music];
  id v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (__CFString *)v16;
  }
  else {
    uint64_t v18 = @"nil";
  }
  [v3 setObject:v18 forKeyedSubscript:@"music"];

  uint64_t v19 = [(ICMediaUserState *)self tv];
  uint64_t v20 = (void *)v19;
  if (v19) {
    id v21 = (__CFString *)v19;
  }
  else {
    id v21 = @"nil";
  }
  [v3 setObject:v21 forKeyedSubscript:@"tv"];

  id v22 = [NSString stringWithFormat:@"<%@: %p [%@]>", objc_opt_class(), self, v3];

  return (NSString *)v22;
}

- (id)copyWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [ICMediaUserState alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__ICMediaUserState_copyWithBlock___block_invoke;
  v9[3] = &unk_1E5AC9430;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(ICMediaUserState *)v5 initWithBlock:v9];

  return v7;
}

void __34__ICMediaUserState_copyWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v30 = a2;
  uint64_t v4 = [v3 copy];
  id v5 = (void *)v30[2];
  v30[2] = v4;

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  id v7 = (void *)v30[3];
  v30[3] = v6;

  *((unsigned char *)v30 + 8) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v9 = (void *)v30[4];
  v30[4] = v8;

  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  id v11 = (void *)v30[5];
  v30[5] = v10;

  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  int v13 = (void *)v30[6];
  v30[6] = v12;

  uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v15 = (void *)v30[7];
  v30[7] = v14;

  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  id v17 = (void *)v30[8];
  v30[8] = v16;

  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v19 = (void *)v30[9];
  v30[9] = v18;

  uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  id v21 = (void *)v30[10];
  v30[10] = v20;

  uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  uint64_t v23 = (void *)v30[11];
  v30[11] = v22;

  uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  id v25 = (void *)v30[12];
  v30[12] = v24;

  *((unsigned char *)v30 + 9) = *(unsigned char *)(*(void *)(a1 + 32) + 9);
  uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  uint64_t v27 = (void *)v30[13];
  v30[13] = v26;

  uint64_t v28 = [*(id *)(*(void *)(a1 + 32) + 112) copy];
  id v29 = (void *)v30[14];
  v30[14] = v28;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICMediaUserState)initWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, ICMediaUserState *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMediaUserState;
  id v5 = [(ICMediaUserState *)&v7 init];
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end