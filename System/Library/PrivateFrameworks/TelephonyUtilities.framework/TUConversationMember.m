@interface TUConversationMember
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMember:(id)a3;
- (BOOL)isLightweightMember;
- (BOOL)isOtherInvitedHandle;
- (BOOL)isValidated;
- (BOOL)joinedFromLetMeIn;
- (BOOL)needsContactLookupForDisplayName;
- (BOOL)pseudonym;
- (BOOL)representsSameMemberAs:(id)a3;
- (NSArray)idsDestinations;
- (NSDate)dateInitiatedLetMeIn;
- (NSDate)dateReceivedLetMeIn;
- (NSSet)handles;
- (NSString)idsDestination;
- (NSString)idsFromID;
- (NSString)nickname;
- (TUConversationMember)initWithCoder:(id)a3;
- (TUConversationMember)initWithContact:(id)a3;
- (TUConversationMember)initWithContact:(id)a3 additionalHandles:(id)a4;
- (TUConversationMember)initWithDestination:(id)a3;
- (TUConversationMember)initWithDestinations:(id)a3;
- (TUConversationMember)initWithHandle:(id)a3;
- (TUConversationMember)initWithHandle:(id)a3 nickname:(id)a4;
- (TUConversationMember)initWithHandle:(id)a3 nickname:(id)a4 joinedFromLetMeIn:(BOOL)a5;
- (TUConversationMember)initWithHandles:(id)a3;
- (TUConversationMemberAssociation)association;
- (TUHandle)handle;
- (TUHandle)lightweightPrimary;
- (TUVoucher)associationVoucher;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)validationSource;
- (unint64_t)hash;
- (unint64_t)lightweightPrimaryParticipantIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociation:(id)a3;
- (void)setAssociationVoucher:(id)a3;
- (void)setDateInitiatedLetMeIn:(id)a3;
- (void)setDateReceivedLetMeIn:(id)a3;
- (void)setIsLightweightMember:(BOOL)a3;
- (void)setIsOtherInvitedHandle:(BOOL)a3;
- (void)setJoinedFromLetMeIn:(BOOL)a3;
- (void)setLightweightPrimary:(id)a3;
- (void)setLightweightPrimaryParticipantIdentifier:(unint64_t)a3;
- (void)setNickname:(id)a3;
- (void)setValidationSource:(int64_t)a3;
@end

@implementation TUConversationMember

- (BOOL)needsContactLookupForDisplayName
{
  v3 = [(TUConversationMember *)self handle];
  v4 = [v3 value];
  if ([v4 destinationIdIsTemporary])
  {
    LOBYTE(v5) = 0;
LABEL_8:

    return v5;
  }
  v6 = [(TUConversationMember *)self handle];
  v7 = [v6 value];
  char v8 = [v7 destinationIdIsPseudonym];

  if ((v8 & 1) == 0)
  {
    v3 = [(TUConversationMember *)self handle];
    v4 = [v3 siriDisplayName];
    if (v4)
    {
      v9 = [(TUConversationMember *)self handle];
      int v5 = [v9 shouldHideContact] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
    goto LABEL_8;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (TUConversationMember)initWithHandle:(id)a3
{
  return [(TUConversationMember *)self initWithHandle:a3 nickname:0 joinedFromLetMeIn:0];
}

- (TUConversationMember)initWithHandle:(id)a3 nickname:(id)a4
{
  return [(TUConversationMember *)self initWithHandle:a3 nickname:a4 joinedFromLetMeIn:0];
}

- (TUConversationMember)initWithHandle:(id)a3 nickname:(id)a4 joinedFromLetMeIn:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TUConversationMember;
  v10 = [(TUConversationMember *)&v27 init];
  if (!v10) {
    goto LABEL_16;
  }
  id v11 = v8;
  v12 = [v11 isoCountryCode];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = TUNetworkCountryCode();
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      TUHomeCountryCode();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v14 = v17;
  }
  if ([v11 type] == 2)
  {
    v18 = [v11 canonicalHandleForISOCountryCode:v14];
    v19 = v11;
LABEL_12:

    goto LABEL_13;
  }
  v18 = v11;
  if ([v11 type] == 3)
  {
    v19 = [v11 value];
    v20 = [v19 lowercaseString];
    v18 = +[TUHandle normalizedEmailAddressHandleForValue:v20];

    goto LABEL_12;
  }
LABEL_13:
  uint64_t v21 = TUNormalizedHandleForTUHandle(v18);
  handle = v10->_handle;
  v10->_handle = (TUHandle *)v21;

  if ([v9 length])
  {
    uint64_t v23 = [v9 copy];
    nickname = v10->_nickname;
    v10->_nickname = (NSString *)v23;
  }
  v25 = [v11 siriDisplayName];
  [(TUHandle *)v10->_handle setSiriDisplayName:v25];

  v10->_joinedFromLetMeIn = a5;
  v10->_isOtherInvitedHandle = 0;

LABEL_16:
  return v10;
}

- (TUConversationMember)initWithHandles:(id)a3
{
  v4 = [a3 anyObject];
  int v5 = [(TUConversationMember *)self initWithHandle:v4];

  return v5;
}

- (TUConversationMember)initWithContact:(id)a3 additionalHandles:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[a4 mutableCopy];
  if ([v6 isKeyAvailable:*MEMORY[0x1E4F1AEE0]])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = [v6 phoneNumbers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (([v13 tuIsSuggested] & 1) == 0)
          {
            id v14 = [TUHandle alloc];
            v15 = [v13 value];
            v16 = [v15 stringValue];
            id v17 = [(TUHandle *)v14 initWithType:2 value:v16];

            [v7 addObject:v17];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }
  }
  if ([v6 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v18 = [v6 emailAddresses];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if (([v23 tuIsSuggested] & 1) == 0)
          {
            v24 = [TUHandle alloc];
            v25 = [v23 value];
            v26 = [(TUHandle *)v24 initWithType:3 value:v25];

            [v7 addObject:v26];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }
  }
  objc_super v27 = [(TUConversationMember *)self initWithHandles:v7];

  return v27;
}

- (TUConversationMember)initWithContact:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 set];
  v7 = [(TUConversationMember *)self initWithContact:v5 additionalHandles:v6];

  return v7;
}

- (TUConversationMember)initWithDestination:(id)a3
{
  v4 = +[TUHandle handleWithDestinationID:a3];
  id v5 = [(TUConversationMember *)self initWithHandle:v4];

  return v5;
}

- (TUConversationMember)initWithDestinations:(id)a3
{
  v4 = [a3 firstObject];
  id v5 = +[TUHandle handleWithDestinationID:v4];

  id v6 = [(TUConversationMember *)self initWithHandle:v5];
  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  v4 = NSStringFromSelector(sel_handle);
  id v5 = [(TUConversationMember *)self handle];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  id v6 = NSStringFromSelector(sel_nickname);
  v7 = [(TUConversationMember *)self nickname];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  id v8 = NSStringFromSelector(sel_isLightweightMember);
  [v3 appendFormat:@"%@=%d", v8, -[TUConversationMember isLightweightMember](self, "isLightweightMember")];

  if ([(TUConversationMember *)self isLightweightMember])
  {
    [v3 appendFormat:@", "];
    uint64_t v9 = NSStringFromSelector(sel_isValidated);
    BOOL v10 = [(TUConversationMember *)self isValidated];
    uint64_t v11 = @"NO";
    if (v10) {
      uint64_t v11 = @"YES";
    }
    [v3 appendFormat:@"%@=%@", v9, v11];
  }
  [v3 appendFormat:@", "];
  v12 = NSStringFromSelector(sel_lightweightPrimary);
  v13 = [(TUConversationMember *)self lightweightPrimary];
  [v3 appendFormat:@"%@=%@", v12, v13];

  [v3 appendFormat:@", "];
  id v14 = NSStringFromSelector(sel_lightweightPrimaryParticipantIdentifier);
  [v3 appendFormat:@"%@=%llu", v14, -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier")];

  [v3 appendFormat:@", "];
  v15 = NSStringFromSelector(sel_joinedFromLetMeIn);
  [v3 appendFormat:@"%@=%d", v15, -[TUConversationMember joinedFromLetMeIn](self, "joinedFromLetMeIn")];

  [v3 appendFormat:@", "];
  v16 = NSStringFromSelector(sel_dateReceivedLetMeIn);
  id v17 = [(TUConversationMember *)self dateReceivedLetMeIn];
  [v3 appendFormat:@"%@=%@", v16, v17];

  [v3 appendFormat:@", "];
  v18 = NSStringFromSelector(sel_dateInitiatedLetMeIn);
  uint64_t v19 = [(TUConversationMember *)self dateInitiatedLetMeIn];
  [v3 appendFormat:@"%@=%@", v18, v19];

  [v3 appendFormat:@", "];
  uint64_t v20 = NSStringFromSelector(sel_isOtherInvitedHandle);
  [v3 appendFormat:@"%@=%d", v20, -[TUConversationMember isOtherInvitedHandle](self, "isOtherInvitedHandle")];

  [v3 appendFormat:@", "];
  uint64_t v21 = NSStringFromSelector(sel_association);
  v22 = [(TUConversationMember *)self association];
  [v3 appendFormat:@"%@=%@", v21, v22];

  [v3 appendFormat:@", "];
  uint64_t v23 = NSStringFromSelector(sel_associationVoucher);
  v24 = [(TUConversationMember *)self associationVoucher];
  [v3 appendFormat:@"%@=%@", v23, v24];

  [v3 appendFormat:@">"];
  v25 = (void *)[v3 copy];

  return v25;
}

- (NSSet)handles
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(TUConversationMember *)self handle];
  v4 = [v2 setWithObject:v3];

  return (NSSet *)v4;
}

- (NSString)idsFromID
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(TUConversationMember *)self handle];
  v4 = TUCopyIDSFromIDForHandle(v3);

  if (!v4)
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(TUConversationMember *)self handle];
      int v9 = 138412290;
      BOOL v10 = v6;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Could not convert %@ to IDS fromID", (uint8_t *)&v9, 0xCu);
    }
  }
  v7 = (void *)[v4 copy];

  return (NSString *)v7;
}

- (NSString)idsDestination
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(TUConversationMember *)self handle];
  v4 = TUCopyIDSCanonicalAddressForHandle(v3);

  if (!v4)
  {
    id v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(TUConversationMember *)self handle];
      int v9 = 138412290;
      BOOL v10 = v6;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Could not convert %@ to IDS destination", (uint8_t *)&v9, 0xCu);
    }
  }
  v7 = (void *)[v4 copy];

  return (NSString *)v7;
}

- (NSArray)idsDestinations
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(TUConversationMember *)self idsDestination];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (BOOL)representsSameMemberAs:(id)a3
{
  id v4 = a3;
  id v5 = [(TUConversationMember *)self handle];
  id v6 = [v4 handle];

  LOBYTE(v4) = [v5 isEqualToHandle:v6];
  return (char)v4;
}

- (BOOL)pseudonym
{
  v2 = [(TUConversationMember *)self handle];
  id v3 = [v2 value];
  char v4 = [v3 destinationIdIsPseudonym];

  return v4;
}

- (void)setValidationSource:(int64_t)a3
{
  if (a3 != 1 || self->_validationSource != 2) {
    self->_validationSource = a3;
  }
}

- (BOOL)isValidated
{
  return ![(TUConversationMember *)self isLightweightMember]
      || (unint64_t)([(TUConversationMember *)self validationSource] - 1) < 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUConversationMember *)self isEqualToMember:v4];

  return v5;
}

- (BOOL)isEqualToMember:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationMember *)self handle];
  id v6 = [v4 handle];
  if ([v5 isEqualToHandle:v6])
  {
    v7 = [(TUConversationMember *)self lightweightPrimary];
    id v8 = [v4 lightweightPrimary];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8)
      && (unint64_t v9 = -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier"), v9 == [v4 lightweightPrimaryParticipantIdentifier])&& (v10 = -[TUConversationMember isLightweightMember](self, "isLightweightMember"), v10 == objc_msgSend(v4, "isLightweightMember")))
    {
      v13 = [(TUConversationMember *)self association];
      id v14 = [v4 association];
      char v11 = TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  id v3 = [(TUConversationMember *)self handle];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationMember *)self lightweightPrimary];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(TUConversationMember *)self lightweightPrimaryParticipantIdentifier];
  if ([(TUConversationMember *)self isLightweightMember]) {
    uint64_t v8 = 1231;
  }
  else {
    uint64_t v8 = 1237;
  }
  unint64_t v9 = [(TUConversationMember *)self association];
  unint64_t v10 = v7 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TUConversationMember *)self handle];
  uint64_t v6 = [(TUConversationMember *)self nickname];
  unint64_t v7 = objc_msgSend(v4, "initWithHandle:nickname:joinedFromLetMeIn:", v5, v6, -[TUConversationMember joinedFromLetMeIn](self, "joinedFromLetMeIn"));

  uint64_t v8 = [(TUConversationMember *)self lightweightPrimary];
  [v7 setLightweightPrimary:v8];

  objc_msgSend(v7, "setIsLightweightMember:", -[TUConversationMember isLightweightMember](self, "isLightweightMember"));
  objc_msgSend(v7, "setIsOtherInvitedHandle:", -[TUConversationMember isOtherInvitedHandle](self, "isOtherInvitedHandle"));
  unint64_t v9 = [(TUConversationMember *)self dateReceivedLetMeIn];
  [v7 setDateReceivedLetMeIn:v9];

  unint64_t v10 = [(TUConversationMember *)self dateInitiatedLetMeIn];
  [v7 setDateInitiatedLetMeIn:v10];

  objc_msgSend(v7, "setLightweightPrimaryParticipantIdentifier:", -[TUConversationMember lightweightPrimaryParticipantIdentifier](self, "lightweightPrimaryParticipantIdentifier"));
  objc_msgSend(v7, "setValidationSource:", -[TUConversationMember validationSource](self, "validationSource"));
  char v11 = [(TUConversationMember *)self association];
  v12 = (void *)[v11 copy];
  [v7 setAssociation:v12];

  v13 = [(TUConversationMember *)self associationVoucher];
  id v14 = (void *)[v13 copy];
  [v7 setAssociationVoucher:v14];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationMember)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_handle);
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  unint64_t v9 = NSStringFromSelector(sel_nickname);
  unint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  char v11 = NSStringFromSelector(sel_joinedFromLetMeIn);
  uint64_t v12 = [v4 decodeBoolForKey:v11];

  uint64_t v13 = objc_opt_class();
  id v14 = NSStringFromSelector(sel_dateReceivedLetMeIn);
  v15 = [v4 decodeObjectOfClass:v13 forKey:v14];

  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(sel_dateInitiatedLetMeIn);
  v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  uint64_t v19 = [(TUConversationMember *)self initWithHandle:v7 nickname:v10 joinedFromLetMeIn:v12];
  if (v19)
  {
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = NSStringFromSelector(sel_lightweightPrimary);
    uint64_t v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
    lightweightPrimary = v19->_lightweightPrimary;
    v19->_lightweightPrimary = (TUHandle *)v22;

    v24 = NSStringFromSelector(sel_lightweightPrimaryParticipantIdentifier);
    v19->_lightweightPrimaryParticipantIdentifier = [v4 decodeInt64ForKey:v24];

    v25 = NSStringFromSelector(sel_isLightweightMember);
    v19->_isLightweightMember = [v4 decodeBoolForKey:v25];

    v26 = NSStringFromSelector(sel_isOtherInvitedHandle);
    v19->_isOtherInvitedHandle = [v4 decodeBoolForKey:v26];

    objc_storeStrong((id *)&v19->_dateReceivedLetMeIn, v15);
    objc_storeStrong((id *)&v19->_dateInitiatedLetMeIn, v18);
    objc_super v27 = NSStringFromSelector(sel_validationSource);
    v19->_validationSource = [v4 decodeIntegerForKey:v27];

    uint64_t v28 = objc_opt_class();
    long long v29 = NSStringFromSelector(sel_association);
    uint64_t v30 = [v4 decodeObjectOfClass:v28 forKey:v29];
    association = v19->_association;
    v19->_association = (TUConversationMemberAssociation *)v30;

    uint64_t v32 = objc_opt_class();
    long long v33 = NSStringFromSelector(sel_associationVoucher);
    uint64_t v34 = [v4 decodeObjectOfClass:v32 forKey:v33];
    associationVoucher = v19->_associationVoucher;
    v19->_associationVoucher = (TUVoucher *)v34;
  }
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationMember *)self handle];
  uint64_t v6 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v5 forKey:v6];

  unint64_t v7 = [(TUConversationMember *)self nickname];
  uint64_t v8 = NSStringFromSelector(sel_nickname);
  [v4 encodeObject:v7 forKey:v8];

  unint64_t v9 = [(TUConversationMember *)self lightweightPrimary];
  unint64_t v10 = NSStringFromSelector(sel_lightweightPrimary);
  [v4 encodeObject:v9 forKey:v10];

  unint64_t v11 = [(TUConversationMember *)self lightweightPrimaryParticipantIdentifier];
  uint64_t v12 = NSStringFromSelector(sel_lightweightPrimaryParticipantIdentifier);
  [v4 encodeInt64:v11 forKey:v12];

  BOOL v13 = [(TUConversationMember *)self isLightweightMember];
  id v14 = NSStringFromSelector(sel_isLightweightMember);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(TUConversationMember *)self joinedFromLetMeIn];
  uint64_t v16 = NSStringFromSelector(sel_joinedFromLetMeIn);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(TUConversationMember *)self isOtherInvitedHandle];
  v18 = NSStringFromSelector(sel_isOtherInvitedHandle);
  [v4 encodeBool:v17 forKey:v18];

  uint64_t v19 = [(TUConversationMember *)self dateReceivedLetMeIn];
  uint64_t v20 = NSStringFromSelector(sel_dateReceivedLetMeIn);
  [v4 encodeObject:v19 forKey:v20];

  uint64_t v21 = [(TUConversationMember *)self dateInitiatedLetMeIn];
  uint64_t v22 = NSStringFromSelector(sel_dateInitiatedLetMeIn);
  [v4 encodeObject:v21 forKey:v22];

  int64_t v23 = [(TUConversationMember *)self validationSource];
  v24 = NSStringFromSelector(sel_validationSource);
  [v4 encodeInteger:v23 forKey:v24];

  v25 = [(TUConversationMember *)self association];
  v26 = NSStringFromSelector(sel_association);
  [v4 encodeObject:v25 forKey:v26];

  id v28 = [(TUConversationMember *)self associationVoucher];
  objc_super v27 = NSStringFromSelector(sel_associationVoucher);
  [v4 encodeObject:v28 forKey:v27];
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (int64_t)validationSource
{
  return self->_validationSource;
}

- (BOOL)isLightweightMember
{
  return self->_isLightweightMember;
}

- (void)setIsLightweightMember:(BOOL)a3
{
  self->_isLightweightMember = a3;
}

- (NSDate)dateReceivedLetMeIn
{
  return self->_dateReceivedLetMeIn;
}

- (void)setDateReceivedLetMeIn:(id)a3
{
}

- (NSDate)dateInitiatedLetMeIn
{
  return self->_dateInitiatedLetMeIn;
}

- (void)setDateInitiatedLetMeIn:(id)a3
{
}

- (TUHandle)lightweightPrimary
{
  return self->_lightweightPrimary;
}

- (void)setLightweightPrimary:(id)a3
{
}

- (unint64_t)lightweightPrimaryParticipantIdentifier
{
  return self->_lightweightPrimaryParticipantIdentifier;
}

- (void)setLightweightPrimaryParticipantIdentifier:(unint64_t)a3
{
  self->_lightweightPrimaryParticipantIdentifier = a3;
}

- (TUConversationMemberAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
}

- (BOOL)joinedFromLetMeIn
{
  return self->_joinedFromLetMeIn;
}

- (void)setJoinedFromLetMeIn:(BOOL)a3
{
  self->_joinedFromLetMeIn = a3;
}

- (BOOL)isOtherInvitedHandle
{
  return self->_isOtherInvitedHandle;
}

- (void)setIsOtherInvitedHandle:(BOOL)a3
{
  self->_isOtherInvitedHandle = a3;
}

- (TUVoucher)associationVoucher
{
  return self->_associationVoucher;
}

- (void)setAssociationVoucher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationVoucher, 0);
  objc_storeStrong((id *)&self->_association, 0);
  objc_storeStrong((id *)&self->_lightweightPrimary, 0);
  objc_storeStrong((id *)&self->_dateInitiatedLetMeIn, 0);
  objc_storeStrong((id *)&self->_dateReceivedLetMeIn, 0);
  objc_storeStrong((id *)&self->_nickname, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end