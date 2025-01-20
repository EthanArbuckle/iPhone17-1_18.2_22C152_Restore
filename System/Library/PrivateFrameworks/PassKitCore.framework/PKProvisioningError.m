@interface PKProvisioningError
+ (BOOL)supportsSecureCoding;
+ (id)errorWithCommonType:(unint64_t)a3 severity:(unint64_t)a4;
+ (id)errorWithSeverity:(unint64_t)a3;
+ (id)errorWithTitle:(id)a3 message:(id)a4 severity:(unint64_t)a5;
+ (id)errorWithTitleKey:(id)a3 messageKey:(id)a4 severity:(unint64_t)a5;
+ (id)errorWithUnderlyingError:(id)a3 defaultSeverity:(unint64_t)a4;
+ (id)userCancelError;
- (BOOL)hasLocalizedTitleAndMessage;
- (NSError)displayableError;
- (NSError)underlyingError;
- (NSString)localizedMessage;
- (NSString)localizedRecoveryDescription;
- (NSString)localizedTitle;
- (NSURL)recoveryUrl;
- (PKProvisioningError)init;
- (PKProvisioningError)initWithCoder:(id)a3;
- (PKProvisioningError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
- (id)_initWithSeverity:(unint64_t)a3 localizedTitle:(id)a4 localizedMessage:(id)a5;
- (id)_initWithSeverity:(unint64_t)a3 userInfo:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)userInfo;
- (unint64_t)severity;
- (void)addInternalDebugDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHasLocalizedTitleAndMessage:(BOOL)a3;
- (void)setLocalizedMessage:(id)a3;
- (void)setLocalizedRecoveryDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setRecoveryUrl:(id)a3;
- (void)setUnderlyingError:(id)a3;
@end

@implementation PKProvisioningError

- (PKProvisioningError)init
{
  return 0;
}

- (PKProvisioningError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  return 0;
}

- (id)_initWithSeverity:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKProvisioningError;
  v7 = [(PKProvisioningError *)&v14 initWithDomain:@"PKProvisioningErrorDomain" code:a3 userInfo:v6];
  v8 = v7;
  if (v7)
  {
    v7->_severity = a3;
    v9 = (void *)[v6 mutableCopy];
    id v10 = v9;
    if (!v9) {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    objc_storeStrong((id *)&v8->_userInfo, v10);
    if (!v9) {

    }
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    internalDebugDescriptions = v8->_internalDebugDescriptions;
    v8->_internalDebugDescriptions = v11;
  }
  return v8;
}

- (id)_initWithSeverity:(unint64_t)a3 localizedTitle:(id)a4 localizedMessage:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(v8);
  v12 = (void *)[v10 copy];

  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  v13 = (void *)[v9 copy];

  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  id v14 = [(PKProvisioningError *)self _initWithSeverity:a3 userInfo:v11];

  return v14;
}

+ (id)errorWithTitleKey:(id)a3 messageKey:(id)a4 severity:(unint64_t)a5
{
  v7 = (NSString *)a4;
  v8 = (NSString *)a3;
  id v9 = [PKProvisioningError alloc];
  id v10 = PKLocalizedPaymentString(v8, 0);

  id v11 = PKLocalizedPaymentString(v7, 0);

  id v12 = [(PKProvisioningError *)v9 _initWithSeverity:a5 localizedTitle:v10 localizedMessage:v11];
  return v12;
}

+ (id)errorWithTitle:(id)a3 message:(id)a4 severity:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[PKProvisioningError alloc] _initWithSeverity:a5 localizedTitle:v8 localizedMessage:v7];

  return v9;
}

+ (id)errorWithCommonType:(unint64_t)a3 severity:(unint64_t)a4
{
  v5 = PKDisplayableErrorForCommonType(a3, 0);
  id v6 = +[PKProvisioningError errorWithUnderlyingError:v5 defaultSeverity:a4];

  return v6;
}

+ (id)errorWithUnderlyingError:(id)a3 defaultSeverity:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__23;
  v65 = __Block_byref_object_dispose__23;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__23;
  v59 = __Block_byref_object_dispose__23;
  id v60 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  id v7 = [v6 userInfo];
  id v8 = (void *)[v7 mutableCopy];

  id v9 = [v8 objectForKeyedSubscript:@"PKErrorSeverity"];
  uint64_t v10 = PKProvisioningErrorSeverityFromString(v9);

  if (v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = a4;
  }
  v52[3] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKProvisioningError_errorWithUnderlyingError_defaultSeverity___block_invoke;
  aBlock[3] = &unk_1E56E35C8;
  id v12 = v6;
  id v47 = v12;
  v48 = &v61;
  v49 = &v55;
  v50 = &v51;
  v13 = (void (**)(void))_Block_copy(aBlock);
  id v14 = [v12 domain];
  uint64_t v15 = [v12 code];
  if ([v14 isEqualToString:@"PKProvisioningErrorDomain"])
  {
    v16 = (id *)[v12 copy];
    goto LABEL_28;
  }
  if (![v14 isEqualToString:@"PKDisplayableError"])
  {
    if ([v14 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v23 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa, 0);
      v24 = (void *)v62[5];
      v62[5] = v23;

      uint64_t v25 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa, 0);
      v26 = (void *)v56[5];
      v56[5] = v25;

      v27 = v52;
      v21 = 0;
      if (v15 == -1005) {
        uint64_t v28 = 2;
      }
      else {
        uint64_t v28 = 4;
      }
      goto LABEL_21;
    }
    if ([v14 isEqualToString:@"PKWebServiceErrorDomain"])
    {
      v21 = 0;
      BOOL v22 = 1;
      if (v15 > 40455)
      {
        if (((unint64_t)(v15 - 60039) > 0x33 || ((1 << (v15 + 121)) & 0x9100000007FFFLL) == 0)
          && (unint64_t)(v15 - 40456) >= 2
          && (unint64_t)(v15 - 60009) >= 2)
        {
          goto LABEL_23;
        }
LABEL_15:
        v21 = 0;
        v27 = v52;
        uint64_t v28 = 3;
LABEL_21:
        v27[3] = v28;
LABEL_22:
        BOOL v22 = 1;
        goto LABEL_23;
      }
      if (v15 <= 1)
      {
        if (v15)
        {
          if (v15 == 1)
          {
            v21 = 0;
            BOOL v22 = 1;
            v52[3] = 1;
          }
          goto LABEL_23;
        }
      }
      else if ((unint64_t)(v15 - 2) >= 4)
      {
        if (v15 != 40107) {
          goto LABEL_23;
        }
        goto LABEL_15;
      }
      v21 = [v12 localizedFailureReason];

      if (!v21) {
        goto LABEL_22;
      }
      goto LABEL_45;
    }
    if (![v14 isEqualToString:@"PKPaymentWebServiceErrorDomain"])
    {
      if (![v14 isEqualToString:@"PKDisplayableError"])
      {
        v13[2](v13);
LABEL_46:
        v21 = 0;
        goto LABEL_22;
      }
LABEL_45:
      uint64_t v38 = [v12 localizedFailureReason];
      v39 = (void *)v62[5];
      v62[5] = v38;

      uint64_t v40 = [v12 localizedRecoverySuggestion];
      v41 = (void *)v56[5];
      v56[5] = v40;

      goto LABEL_46;
    }
    uint64_t v29 = [v12 localizedFailureReason];
    v30 = (void *)v62[5];
    v62[5] = v29;

    uint64_t v31 = [v12 localizedRecoverySuggestion];
    v32 = (void *)v56[5];
    v56[5] = v31;

    uint64_t v33 = 3;
    if (v15 > 40500)
    {
      switch(v15)
      {
        case 60000:
        case 60001:
        case 60002:
        case 60003:
        case 60005:
        case 60006:
        case 60007:
        case 60008:
        case 60011:
        case 60018:
        case 60022:
        case 60028:
        case 60031:
        case 60032:
        case 60033:
        case 60034:
        case 60035:
        case 60036:
        case 60037:
        case 60057:
        case 60060:
        case 60061:
        case 60066:
        case 60067:
        case 60068:
        case 60075:
        case 60076:
        case 60077:
        case 60078:
        case 60079:
        case 60080:
        case 60084:
        case 60085:
        case 60086:
        case 60088:
        case 60089:
        case 60091:
        case 60103:
        case 60104:
          goto LABEL_19;
        case 60004:
        case 60009:
        case 60010:
        case 60015:
        case 60016:
        case 60017:
        case 60019:
        case 60020:
        case 60021:
        case 60023:
        case 60024:
        case 60025:
        case 60039:
        case 60040:
        case 60041:
        case 60042:
        case 60043:
        case 60044:
        case 60045:
        case 60046:
        case 60047:
        case 60048:
        case 60049:
        case 60050:
        case 60051:
        case 60052:
        case 60053:
        case 60056:
        case 60058:
        case 60059:
        case 60064:
        case 60065:
        case 60069:
        case 60070:
        case 60071:
        case 60083:
        case 60087:
        case 60090:
        case 60093:
          goto LABEL_72;
        case 60012:
        case 60013:
        case 60014:
        case 60026:
        case 60027:
        case 60029:
        case 60030:
        case 60038:
        case 60054:
        case 60055:
        case 60062:
        case 60063:
        case 60092:
          goto LABEL_71;
        case 60072:
        case 60073:
        case 60074:
        case 60081:
        case 60082:
        case 60094:
        case 60095:
        case 60096:
        case 60097:
        case 60098:
        case 60099:
        case 60100:
        case 60101:
        case 60102:
          goto LABEL_73;
        default:
          if (v15 == 40601) {
            goto LABEL_19;
          }
          uint64_t v42 = 40501;
          goto LABEL_70;
      }
    }
    if (v15 > 40307)
    {
      char v43 = v15 + 49;
      if ((unint64_t)(v15 - 40399) <= 0x3A)
      {
        if (((1 << v43) & 0x80000001400013) != 0) {
          goto LABEL_19;
        }
        if (((1 << v43) & 0x600000000000000) != 0) {
          goto LABEL_72;
        }
      }
      if (v15 == 40308) {
        goto LABEL_19;
      }
      uint64_t v44 = 40319;
    }
    else
    {
      if (v15 > 40101)
      {
        if (v15 > 40109)
        {
          if (v15 != 40110)
          {
            if (v15 == 40301)
            {
LABEL_71:
              uint64_t v33 = 4;
              goto LABEL_72;
            }
            uint64_t v42 = 40307;
LABEL_70:
            if (v15 != v42) {
              goto LABEL_73;
            }
            goto LABEL_71;
          }
        }
        else if ((unint64_t)(v15 - 40106) >= 2)
        {
          uint64_t v42 = 40102;
          goto LABEL_70;
        }
LABEL_72:
        v52[3] = v33;
        goto LABEL_73;
      }
      if (v15 > 40012)
      {
        if ((unint64_t)(v15 - 40013) < 2) {
          goto LABEL_72;
        }
        if (v15 != 40016)
        {
LABEL_73:
          v45 = [v8 PKNumberForKey:@"PKErrorHTTPResponseStatusCodeKey"];
          v21 = v45;
          BOOL v22 = v45 == 0;
          if (v45 && [v45 integerValue] == 500) {
            v52[3] = 5;
          }
          if (!v62[5]) {
            v13[2](v13);
          }
          goto LABEL_23;
        }
LABEL_19:
        uint64_t v33 = 5;
        goto LABEL_72;
      }
      if (!v15) {
        goto LABEL_19;
      }
      uint64_t v44 = 40001;
    }
    if (v15 == v44) {
      goto LABEL_72;
    }
    goto LABEL_73;
  }
  uint64_t v17 = PKTitleForDisplayableError(v12);
  v18 = (void *)v62[5];
  v62[5] = v17;

  uint64_t v19 = [v12 localizedRecoverySuggestion];
  v20 = (void *)v56[5];
  v56[5] = v19;

  v21 = 0;
  BOOL v22 = 0;
LABEL_23:
  [v8 setObject:v62[5] forKeyedSubscript:*MEMORY[0x1E4F28568]];
  [v8 setObject:v56[5] forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  [v8 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v34 = [PKProvisioningError alloc];
  v16 = [(PKProvisioningError *)v34 _initWithSeverity:v52[3] userInfo:v8];
  objc_storeStrong(v16 + 9, a3);
  if (v22)
  {
    v35 = (void *)[[NSString alloc] initWithFormat:@"Underlying(D: %@, Code: %ld)", v14, v15];
    [v16 addInternalDebugDescription:v35];
  }
  if (v21)
  {
    v36 = (void *)[[NSString alloc] initWithFormat:@"Received HTTP %@", v21];
    [v16 addInternalDebugDescription:v36];
  }
LABEL_28:

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v16;
}

void __64__PKProvisioningError_errorWithUnderlyingError_defaultSeverity___block_invoke(uint64_t a1)
{
  char v12 = 0;
  v2 = _PKSharingDisplayableError(*(void **)(a1 + 32), &v12, 0);
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = PKTitleForDisplayableError(v2);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = [v3 localizedRecoverySuggestion];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v12) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = *(void *)(v10 + 24);
    }
    *(void *)(v10 + 24) = v11;
  }
}

+ (id)errorWithSeverity:(unint64_t)a3
{
  id v3 = [[PKProvisioningError alloc] _initWithSeverity:a3 userInfo:0];
  return v3;
}

+ (id)userCancelError
{
  id v2 = [[PKProvisioningError alloc] _initWithSeverity:1 userInfo:0];
  return v2;
}

- (void)addInternalDebugDescription:(id)a3
{
}

- (NSString)localizedTitle
{
  id v2 = [(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_CouldNotSetUpT.isa, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;

  return (NSString *)v5;
}

- (void)setLocalizedTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_userInfo setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28568]];
}

- (NSString)localizedMessage
{
  id v3 = [(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:*MEMORY[0x1E4F285A0]];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_CouldNotSetUpM.isa, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  if (os_variant_has_internal_ui())
  {
    uint64_t v7 = [(NSMutableArray *)self->_internalDebugDescriptions count];
    unint64_t v8 = self->_severity - 1;
    if (v7)
    {
      if (v8 > 6) {
        id v9 = @"unknown";
      }
      else {
        id v9 = off_1E56E35E8[v8];
      }
      char v12 = [(NSMutableArray *)self->_internalDebugDescriptions componentsJoinedByString:@"\n• "];
      v13 = [v6 stringByAppendingFormat:@"\n\n[INTERNAL] - %@ \n• %@", v9, v12];

      goto LABEL_16;
    }
    if (v8 > 6) {
      uint64_t v11 = @"unknown";
    }
    else {
      uint64_t v11 = off_1E56E35E8[v8];
    }
    id v10 = [v6 stringByAppendingFormat:@"\n\n[INTERNAL] - %@", v11];
  }
  else
  {
    id v10 = v6;
  }
  v13 = v10;
LABEL_16:

  return (NSString *)v13;
}

- (void)setLocalizedMessage:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_userInfo setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
}

- (BOOL)hasLocalizedTitleAndMessage
{
  id v3 = [(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:*MEMORY[0x1E4F285A0]];
  if (v3)
  {
    id v4 = [(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSError)displayableError
{
  id v3 = [(PKProvisioningError *)self localizedTitle];
  id v4 = [(PKProvisioningError *)self localizedMessage];
  BOOL v5 = [(PKProvisioningError *)self underlyingError];
  id v6 = [(PKProvisioningError *)self userInfo];
  uint64_t v7 = PKDisplayableErrorCustomWithType(-1, v3, v4, v5, v6);

  return (NSError *)v7;
}

- (NSString)localizedRecoveryDescription
{
  id v2 = [(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:*MEMORY[0x1E4F28590]];
  id v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (void)setLocalizedRecoveryDescription:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E4F28590], v7, v8);
  }
  else
  {
    [(NSMutableDictionary *)self->_userInfo setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28590]];
    id v6 = 0;
  }
}

- (NSURL)recoveryUrl
{
  return (NSURL *)[(NSMutableDictionary *)self->_userInfo objectForKeyedSubscript:@"PKErrorRecoveryURL"];
}

- (void)setRecoveryUrl:(id)a3
{
}

- (id)userInfo
{
  id v2 = (void *)[(NSMutableDictionary *)self->_userInfo copy];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[PKProvisioningError alloc] _initWithSeverity:self->_severity userInfo:self->_userInfo];
  uint64_t v5 = [(NSError *)self->_underlyingError copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSMutableArray *)self->_internalDebugDescriptions mutableCopy];
  uint64_t v8 = (void *)v4[6];
  v4[6] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningError)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKProvisioningError;
  uint64_t v5 = [(PKProvisioningError *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingError"];
    underlyingError = v5->_underlyingError;
    v5->_underlyingError = (NSError *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"severity"];
    v5->_severity = PKProvisioningErrorSeverityFromString(v8);

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    char v12 = [v4 decodeObjectOfClasses:v11 forKey:@"internalDebugDescriptions"];
    uint64_t v13 = [v12 mutableCopy];
    internalDebugDescriptions = v5->_internalDebugDescriptions;
    v5->_internalDebugDescriptions = (NSMutableArray *)v13;

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    v20 = [v4 decodeObjectOfClasses:v19 forKey:@"userInfo"];
    uint64_t v21 = [v20 mutableCopy];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSMutableDictionary *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKProvisioningError;
  [(PKProvisioningError *)&v8 encodeWithCoder:v4];
  [v4 encodeObject:self->_underlyingError forKey:@"underlyingError"];
  unint64_t v5 = self->_severity - 1;
  if (v5 > 6) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56E35E8[v5];
  }
  [v4 encodeObject:v6 forKey:@"severity"];
  [v4 encodeObject:self->_internalDebugDescriptions forKey:@"internalDebugDescriptions"];
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_userInfo copy];
  [v4 encodeObject:v7 forKey:@"userInfo"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: ", v5];

  unint64_t v7 = self->_severity - 1;
  if (v7 > 6) {
    objc_super v8 = @"unknown";
  }
  else {
    objc_super v8 = off_1E56E35E8[v7];
  }
  [v6 appendFormat:@"severity: '%@'; ", v8];
  [v6 appendFormat:@"internalDebugDescriptions: '%@'; ", self->_internalDebugDescriptions];
  [v6 appendFormat:@"underlyingError: '%@'; ", self->_underlyingError];
  [v6 appendFormat:@"userInfo: '%@'; ", self->_userInfo];
  [v6 appendFormat:@">"];
  id v9 = [NSString stringWithString:v6];

  return v9;
}

- (unint64_t)severity
{
  return self->_severity;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (void)setHasLocalizedTitleAndMessage:(BOOL)a3
{
  self->_hasLocalizedTitleAndMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_internalDebugDescriptions, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end