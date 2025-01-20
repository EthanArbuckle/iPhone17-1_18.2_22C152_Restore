@interface PKExpressTransactionState
+ (BOOL)supportsSecureCoding;
+ (id)create;
+ (id)createForExpressType:(int64_t)a3;
+ (id)createForStandaloneTransaction:(int64_t)a3 applicationIdentifier:(id)a4 keyIdentifier:(id)a5 passUniqueIdentifier:(id)a6;
+ (id)createForStandaloneTransaction:(int64_t)a3 applicationIdentifier:(id)a4 keyIdentifier:(id)a5 passUniqueIdentifier:(id)a6 terminalReaderIdentifier:(id)a7;
- (BOOL)isAssociated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToState:(id)a3;
- (BOOL)isExpress;
- (BOOL)isIgnorable;
- (BOOL)isProcessing;
- (BOOL)isRelatedToState:(id)a3;
- (BOOL)mergeState:(id)a3;
- (BOOL)receiveEvents:(unint64_t)a3;
- (BOOL)receiveStandaloneTransaction:(int64_t)a3;
- (BOOL)transacted;
- (NSSet)TCIs;
- (NSString)applicationIdentifier;
- (NSString)keyIdentifier;
- (NSString)passUniqueIdentifier;
- (NSString)terminalReaderIdentifier;
- (PKExpressTransactionState)init;
- (PKExpressTransactionState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)standaloneTransactionType;
- (int64_t)type;
- (uint64_t)_normalizedStatus;
- (unint64_t)hash;
- (unint64_t)receivedEvents;
- (unsigned)_initForStandaloneTransaction:(void *)a3 applicationIdentifier:(void *)a4 keyIdentifier:(void *)a5 passUniqueIdentifier:(void *)a6 terminalReaderIdentifier:;
- (unsigned)_initWithUUID:(void *)a1;
- (void)_populatePassUniqueIdentifierWithLookup:(id)a3;
- (void)associateWithApplicationIdentifier:(id)a3 keyIdentifier:(id)a4 terminalReaderIdentifier:(id)a5 passUniqueIdentifier:(id)a6;
- (void)associateWithTCIs:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resolve;
@end

@implementation PKExpressTransactionState

+ (id)createForStandaloneTransaction:(int64_t)a3 applicationIdentifier:(id)a4 keyIdentifier:(id)a5 passUniqueIdentifier:(id)a6
{
  if (!a4) {
    return 0;
  }
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = -[PKExpressTransactionState _initForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:terminalReaderIdentifier:]((unsigned __int8 *)[PKExpressTransactionState alloc], a3, v11, v10, v9, 0);

  return v12;
}

- (unsigned)_initForStandaloneTransaction:(void *)a3 applicationIdentifier:(void *)a4 keyIdentifier:(void *)a5 passUniqueIdentifier:(void *)a6 terminalReaderIdentifier:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    v15 = [(PKExpressTransactionState *)a1 _initWithUUID:out];
    a1 = v15;
    if (v15)
    {
      *((_WORD *)v15 + 16) = 0;
      *((void *)v15 + 10) = a2;
      *((void *)v15 + 11) = 0;
      v15[34] = 1;
      uint64_t v16 = [v11 copy];
      v17 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v16;

      uint64_t v18 = [v12 copy];
      v19 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v18;

      uint64_t v20 = [v13 copy];
      v21 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v20;

      uint64_t v22 = [v14 copy];
      v23 = (void *)*((void *)a1 + 8);
      *((void *)a1 + 8) = v22;
    }
  }

  return a1;
}

+ (id)createForStandaloneTransaction:(int64_t)a3 applicationIdentifier:(id)a4 keyIdentifier:(id)a5 passUniqueIdentifier:(id)a6 terminalReaderIdentifier:(id)a7
{
  if (a4)
  {
    id v11 = a7;
    id v12 = a6;
    id v13 = a5;
    id v14 = a4;
    v15 = -[PKExpressTransactionState _initForStandaloneTransaction:applicationIdentifier:keyIdentifier:passUniqueIdentifier:terminalReaderIdentifier:]((unsigned __int8 *)[PKExpressTransactionState alloc], a3, v14, v13, v12, v11);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)create
{
  v2 = (void *)[a1 createForExpressType:0];
  [v2 resolve];
  return v2;
}

+ (id)createForExpressType:(int64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id result = [PKExpressTransactionState alloc];
  if (result)
  {
    id v5 = result;
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    id result = [(PKExpressTransactionState *)v5 _initWithUUID:out];
    if (result)
    {
      *((_WORD *)result + 16) = 257;
      *((void *)result + 10) = 0;
      *((void *)result + 11) = a3;
      *((unsigned char *)result + 34) = 0;
    }
  }
  return result;
}

- (PKExpressTransactionState)init
{
  return 0;
}

- (unsigned)_initWithUUID:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)PKExpressTransactionState;
  v3 = (unsigned __int8 *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3) {
    uuid_copy(v3 + 8, a2);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = +[PKExpressTransactionState allocWithZone:](PKExpressTransactionState, "allocWithZone:");
  if (v5)
  {
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    id v5 = (PKExpressTransactionState *)[(PKExpressTransactionState *)v5 _initWithUUID:out];
  }
  uuid_copy(v5->_uuid, self->_uuid);
  v5->_express = self->_express;
  v5->_type = self->_type;
  v5->_standaloneTransactionType = self->_standaloneTransactionType;
  uint64_t v6 = [(NSMutableSet *)self->_TCIs mutableCopyWithZone:a3];
  TCIs = v5->_TCIs;
  v5->_TCIs = (NSMutableSet *)v6;

  v5->_processing = self->_processing;
  v5->_associated = self->_associated;
  if (self->_associated)
  {
    objc_storeStrong((id *)&v5->_applicationIdentifier, self->_applicationIdentifier);
    objc_storeStrong((id *)&v5->_keyIdentifier, self->_keyIdentifier);
    objc_storeStrong((id *)&v5->_terminalReaderIdentifier, self->_terminalReaderIdentifier);
    objc_storeStrong((id *)&v5->_passUniqueIdentifier, self->_passUniqueIdentifier);
  }
  v5->_receivedEvents = self->_receivedEvents;
  return v5;
}

- (unint64_t)hash
{
  return SipHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0) {
    BOOL v6 = [(PKExpressTransactionState *)self isEqualToState:v4];
  }

  return v6;
}

- (BOOL)isRelatedToState:(id)a3
{
  return a3 && uuid_compare((const unsigned __int8 *)a3 + 8, self->_uuid) == 0;
}

- (BOOL)isEqualToState:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![(PKExpressTransactionState *)self isRelatedToState:v4]
    || v4[32] != self->_express
    || *((void *)v4 + 11) != self->_type
    || *((void *)v4 + 10) != self->_standaloneTransactionType)
  {
    goto LABEL_37;
  }
  id v5 = (NSMutableSet *)*((void *)v4 + 3);
  TCIs = self->_TCIs;
  if (v5 && TCIs)
  {
    if ((-[NSMutableSet isEqual:](v5, "isEqual:") & 1) == 0) {
      goto LABEL_37;
    }
  }
  else if (v5 != TCIs)
  {
    goto LABEL_37;
  }
  if (v4[33] != self->_processing || v4[34] != self->_associated) {
    goto LABEL_37;
  }
  if (!v4[34])
  {
LABEL_40:
    BOOL v21 = *((void *)v4 + 9) == self->_receivedEvents;
    goto LABEL_38;
  }
  applicationIdentifier = self->_applicationIdentifier;
  v8 = (NSString *)*((id *)v4 + 5);
  id v9 = applicationIdentifier;
  if (v8 == v9)
  {
  }
  else
  {
    uint64_t v10 = v9;
    if (!v8 || !v9) {
      goto LABEL_36;
    }
    BOOL v11 = [(NSString *)v8 isEqualToString:v9];

    if (!v11) {
      goto LABEL_37;
    }
  }
  keyIdentifier = self->_keyIdentifier;
  v8 = (NSString *)*((id *)v4 + 6);
  id v13 = keyIdentifier;
  if (v8 == v13)
  {
  }
  else
  {
    uint64_t v10 = v13;
    if (!v8 || !v13) {
      goto LABEL_36;
    }
    BOOL v14 = [(NSString *)v8 isEqualToString:v13];

    if (!v14) {
      goto LABEL_37;
    }
  }
  terminalReaderIdentifier = self->_terminalReaderIdentifier;
  v8 = (NSString *)*((id *)v4 + 8);
  uint64_t v16 = terminalReaderIdentifier;
  if (v8 == v16)
  {
  }
  else
  {
    uint64_t v10 = v16;
    if (!v8 || !v16) {
      goto LABEL_36;
    }
    BOOL v17 = [(NSString *)v8 isEqualToString:v16];

    if (!v17) {
      goto LABEL_37;
    }
  }
  passUniqueIdentifier = self->_passUniqueIdentifier;
  v8 = (NSString *)*((id *)v4 + 7);
  v19 = passUniqueIdentifier;
  if (v8 == v19)
  {

    goto LABEL_40;
  }
  uint64_t v10 = v19;
  if (!v8 || !v19)
  {
LABEL_36:

    goto LABEL_37;
  }
  BOOL v20 = [(NSString *)v8 isEqualToString:v19];

  if (v20) {
    goto LABEL_40;
  }
LABEL_37:
  BOOL v21 = 0;
LABEL_38:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKExpressTransactionState)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  memset(uu, 0, sizeof(uu));
  BOOL v6 = [v4 decodeObjectOfClass:v5 forKey:@"uuid"];
  if (!v6)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKExpressTransactionState" code:0 userInfo:0];
    [v4 failWithError:v9];

    goto LABEL_6;
  }
  *(_OWORD *)in = 0u;
  memset(v39, 0, sizeof(v39));
  id v7 = v6;
  [v7 UTF8String];
  if ((unint64_t)__strlcpy_chk() > 0x24 || uuid_parse(in, uu))
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKExpressTransactionState" code:0 userInfo:0];
    [v4 failWithError:v8];

LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_7;
  }

  id v12 = -[PKExpressTransactionState _initWithUUID:](self, uu);
  if (v12)
  {
    v12[32] = [v4 decodeBoolForKey:@"express"];
    *((void *)v12 + 11) = [v4 decodeIntegerForKey:@"type"];
    *((void *)v12 + 10) = [v4 decodeIntegerForKey:@"standaloneTransaction"];
    uint64_t v13 = objc_opt_class();
    BOOL v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"TCIs"];

    if (v15)
    {
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v34 != v19) {
                objc_enumerationMutation(v16);
              }
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_21;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v21 = [v16 mutableCopy];
        uint64_t v22 = (void *)*((void *)v12 + 3);
        *((void *)v12 + 3) = v21;
      }
      else
      {
LABEL_21:

        id v16 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKExpressTransactionState" code:0 userInfo:0];
        [v4 failWithError:v16];
      }
    }
    v12[33] = [v4 decodeBoolForKey:@"processing"];
    int v23 = [v4 decodeBoolForKey:@"associated"];
    v12[34] = v23;
    if (v23)
    {
      uint64_t v24 = [v4 decodeObjectOfClass:v5 forKey:@"applicationIdentifier"];
      v25 = (void *)*((void *)v12 + 5);
      *((void *)v12 + 5) = v24;

      uint64_t v26 = [v4 decodeObjectOfClass:v5 forKey:@"keyIdentifier"];
      v27 = (void *)*((void *)v12 + 6);
      *((void *)v12 + 6) = v26;

      uint64_t v28 = [v4 decodeObjectOfClass:v5 forKey:@"terminalReaderIdentifier"];
      v29 = (void *)*((void *)v12 + 8);
      *((void *)v12 + 8) = v28;

      uint64_t v30 = [v4 decodeObjectOfClass:v5 forKey:@"passUniqueIdentifier"];
      v31 = (void *)*((void *)v12 + 7);
      *((void *)v12 + 7) = v30;
    }
    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"events"];
    *((void *)v12 + 9) = [v32 unsignedIntegerValue];
  }
  self = v12;
  uint64_t v10 = self;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v7, 0, sizeof(v7));
  uuid_unparse_upper(self->_uuid, v7);
  uint64_t v5 = (void *)[[NSString alloc] initWithUTF8String:v7];
  [v4 encodeObject:v5 forKey:@"uuid"];

  [v4 encodeBool:self->_express forKey:@"express"];
  [v4 encodeInteger:self->_type forKey:@"type"];
  [v4 encodeInteger:self->_standaloneTransactionType forKey:@"standaloneTransaction"];
  [v4 encodeObject:self->_TCIs forKey:@"TCIs"];
  [v4 encodeBool:self->_processing forKey:@"processing"];
  [v4 encodeBool:self->_associated forKey:@"associated"];
  if (self->_associated)
  {
    [v4 encodeObject:self->_applicationIdentifier forKey:@"applicationIdentifier"];
    [v4 encodeObject:self->_keyIdentifier forKey:@"keyIdentifier"];
    [v4 encodeObject:self->_terminalReaderIdentifier forKey:@"terminalReaderIdentifier"];
    [v4 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  }
  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_receivedEvents];
  [v4 encodeObject:v6 forKey:@"events"];
}

- (void)associateWithTCIs:(id)a3
{
  id v4 = a3;
  if (self->_processing && v4)
  {
    id v8 = v4;
    if ([v4 count])
    {
      TCIs = self->_TCIs;
      if (TCIs)
      {
        [(NSMutableSet *)TCIs unionSet:v8];
      }
      else
      {
        BOOL v6 = (NSMutableSet *)[v8 mutableCopy];
        id v7 = self->_TCIs;
        self->_TCIs = v6;
      }
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)associateWithApplicationIdentifier:(id)a3 keyIdentifier:(id)a4 terminalReaderIdentifier:(id)a5 passUniqueIdentifier:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!self->_processing || self->_associated)
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = v12;
    self->_associated = 1;
    BOOL v14 = (NSString *)[v22 copy];
    applicationIdentifier = self->_applicationIdentifier;
    self->_applicationIdentifier = v14;

    id v16 = (NSString *)[v10 copy];
    keyIdentifier = self->_keyIdentifier;
    self->_keyIdentifier = v16;

    uint64_t v18 = (NSString *)[v11 copy];
    terminalReaderIdentifier = self->_terminalReaderIdentifier;
    self->_terminalReaderIdentifier = v18;

    BOOL v20 = (NSString *)[v13 copy];
    passUniqueIdentifier = self->_passUniqueIdentifier;
    self->_passUniqueIdentifier = v20;
  }
}

- (void)_populatePassUniqueIdentifierWithLookup:(id)a3
{
  id v4 = a3;
  if (self->_associated)
  {
    if (!self->_passUniqueIdentifier)
    {
      applicationIdentifier = self->_applicationIdentifier;
      if (applicationIdentifier)
      {
        id v9 = v4;
        BOOL v6 = (*((void (**)(id, NSString *, NSString *))v4 + 2))(v4, applicationIdentifier, self->_keyIdentifier);
        id v7 = (NSString *)[v6 copy];
        passUniqueIdentifier = self->_passUniqueIdentifier;
        self->_passUniqueIdentifier = v7;

        id v4 = v9;
      }
    }
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)mergeState:(id)a3
{
  id v4 = (id *)a3;
  if (!self->_processing || (uint64_t v5 = v4) == 0)
  {
    __break(1u);
    return (char)v4;
  }
  if (![(PKExpressTransactionState *)self isRelatedToState:v4]) {
    goto LABEL_39;
  }
  if (v5[3])
  {
    TCIs = self->_TCIs;
    if (TCIs)
    {
      -[NSMutableSet unionSet:](TCIs, "unionSet:");
    }
    else
    {
      id v7 = (NSMutableSet *)[v5[3] mutableCopy];
      id v8 = self->_TCIs;
      self->_TCIs = v7;
    }
  }
  if (!self->_associated)
  {
    if (*((unsigned char *)v5 + 34)) {
      [(PKExpressTransactionState *)self associateWithApplicationIdentifier:v5[5] keyIdentifier:v5[6] terminalReaderIdentifier:v5[8] passUniqueIdentifier:v5[7]];
    }
    goto LABEL_17;
  }
  if (*((unsigned char *)v5 + 34))
  {
    id v9 = v5[5];
    id v10 = self->_applicationIdentifier;
    id v11 = (NSString *)v9;
    if (v10 == v11)
    {
    }
    else
    {
      id v12 = v11;
      if (!v10 || !v11) {
        goto LABEL_38;
      }
      BOOL v13 = [(NSString *)v10 isEqualToString:v11];

      if (!v13) {
        goto LABEL_39;
      }
    }
    id v15 = v5[6];
    id v10 = self->_keyIdentifier;
    id v16 = (NSString *)v15;
    if (v10 == v16)
    {
    }
    else
    {
      id v12 = v16;
      if (!v10 || !v16) {
        goto LABEL_38;
      }
      BOOL v17 = [(NSString *)v10 isEqualToString:v16];

      if (!v17) {
        goto LABEL_39;
      }
    }
    id v18 = v5[8];
    id v10 = self->_terminalReaderIdentifier;
    uint64_t v19 = (NSString *)v18;
    if (v10 == v19)
    {

LABEL_33:
      id v21 = v5[7];
      id v10 = self->_passUniqueIdentifier;
      id v22 = (NSString *)v21;
      if (v10 == v22)
      {

        goto LABEL_17;
      }
      id v12 = v22;
      if (v10 && v22)
      {
        BOOL v23 = [(NSString *)v10 isEqualToString:v22];

        if (!v23) {
          goto LABEL_39;
        }
LABEL_17:
        [(PKExpressTransactionState *)self receiveEvents:v5[9]];
        [(PKExpressTransactionState *)self receiveStandaloneTransaction:v5[10]];
        if (!*((unsigned char *)v5 + 33)) {
          [(PKExpressTransactionState *)self resolve];
        }
        char v14 = 1;
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    id v12 = v19;
    if (v10 && v19)
    {
      BOOL v20 = [(NSString *)v10 isEqualToString:v19];

      if (!v20) {
        goto LABEL_39;
      }
      goto LABEL_33;
    }
LABEL_38:
  }
LABEL_39:
  char v14 = 0;
LABEL_40:

  LOBYTE(v4) = v14;
  return (char)v4;
}

- (BOOL)receiveEvents:(unint64_t)a3
{
  if (self->_processing)
  {
    id v4 = self;
    uint64_t v5 = -[PKExpressTransactionState _normalizedStatus]((uint64_t)self);
    v4->_receivedEvents |= a3;
    LOBYTE(self) = -[PKExpressTransactionState _normalizedStatus]((uint64_t)v4) != v5;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (uint64_t)_normalizedStatus
{
  if (result)
  {
    if ((unint64_t)(*(void *)(result + 80) - 1) < 2) {
      return 1;
    }
    unint64_t v1 = *(void *)(result + 72);
    if ((v1 & 6) != 0)
    {
      return 1;
    }
    else if ((v1 & 0x200) != 0)
    {
      return 3;
    }
    else
    {
      unint64_t v2 = v1 >> 7;
      if ((v2 & 2) != 0) {
        return v2 & 2;
      }
      else {
        return 2 * (*(unsigned char *)(result + 33) == 0);
      }
    }
  }
  return result;
}

- (BOOL)receiveStandaloneTransaction:(int64_t)a3
{
  if (self->_processing)
  {
    if (a3)
    {
      id v4 = self;
      uint64_t v5 = -[PKExpressTransactionState _normalizedStatus]((uint64_t)self);
      v4->_standaloneTransactionType = a3;
      LOBYTE(self) = -[PKExpressTransactionState _normalizedStatus]((uint64_t)v4) != v5;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (void)resolve
{
  if (self->_processing) {
    self->_processing = 0;
  }
  else {
    __break(1u);
  }
}

- (BOOL)isIgnorable
{
  if (!self)
  {
    unint64_t receivedEvents = MEMORY[0x48];
    return (receivedEvents >> 10) & 1;
  }
  if ((unint64_t)(self->_standaloneTransactionType - 1) >= 2)
  {
    unint64_t receivedEvents = self->_receivedEvents;
    if ((receivedEvents & 0x306) == 0) {
      return (receivedEvents >> 10) & 1;
    }
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)transacted
{
  return (self->_receivedEvents & 7) != 0 || self->_standaloneTransactionType != 0;
}

- (NSSet)TCIs
{
  unint64_t v2 = (void *)[(NSMutableSet *)self->_TCIs copy];
  return (NSSet *)v2;
}

- (BOOL)isExpress
{
  return self->_express;
}

- (BOOL)isProcessing
{
  return self->_processing;
}

- (BOOL)isAssociated
{
  return self->_associated;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)terminalReaderIdentifier
{
  return self->_terminalReaderIdentifier;
}

- (unint64_t)receivedEvents
{
  return self->_receivedEvents;
}

- (int64_t)standaloneTransactionType
{
  return self->_standaloneTransactionType;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_TCIs, 0);
}

@end