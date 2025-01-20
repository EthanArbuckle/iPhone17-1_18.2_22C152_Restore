@interface TCSCall
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCall:(id)a3;
- (BOOL)isIncoming;
- (BOOL)isOutgoing;
- (BOOL)isRemoteUplinkMuted;
- (NSDate)dateAnsweredOrDialed;
- (NSDate)dateConnected;
- (NSString)contactIdentifier;
- (NSString)handleValue;
- (NSString)uniqueProxyIdentifier;
- (TCSCall)initWithCall:(id)a3;
- (TCSCall)initWithCoder:(id)a3;
- (TCSCall)initWithURL:(id)a3;
- (id)URL;
- (id)description;
- (int)disconnectedReason;
- (int)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 completion:(id)a4;
@end

@implementation TCSCall

- (TCSCall)initWithCall:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TCSCall;
  v5 = [(TCSCall *)&v21 init];
  v6 = v5;
  if (v5)
  {
    v5->_isNilCall = v4 == 0;
    v5->_isConnected = [v4 isConnected];
    v6->_isOutgoing = [v4 isOutgoing];
    if (objc_msgSend(v4, "tc_useUnderlyingRemoteUplinkMuted")) {
      char v7 = [v4 isRemoteUplinkMuted];
    }
    else {
      char v7 = 1;
    }
    v6->_isRemoteUplinkMuted = v7;
    v8 = [v4 contactIdentifiers];
    uint64_t v9 = [v8 firstObject];
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v9;

    v11 = [v4 handle];
    uint64_t v12 = [v11 value];
    handleValue = v6->_handleValue;
    v6->_handleValue = (NSString *)v12;

    v6->_status = [v4 status];
    uint64_t v14 = [v4 uniqueProxyIdentifier];
    uniqueProxyIdentifier = v6->_uniqueProxyIdentifier;
    v6->_uniqueProxyIdentifier = (NSString *)v14;

    v6->_disconnectedReason = [v4 disconnectedReason];
    uint64_t v16 = [v4 dateAnsweredOrDialed];
    dateAnsweredOrDialed = v6->_dateAnsweredOrDialed;
    v6->_dateAnsweredOrDialed = (NSDate *)v16;

    uint64_t v18 = [v4 dateConnected];
    dateConnected = v6->_dateConnected;
    v6->_dateConnected = (NSDate *)v18;
  }
  return v6;
}

- (TCSCall)initWithURL:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)TCSCall;
  v5 = [(TCSCall *)&v55 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v4 resolvingAgainstBaseURL:0];
    char v7 = [v6 scheme];
    if ([v7 isEqualToString:@"tincan"])
    {
      v8 = [v6 host];
      int v9 = [v8 isEqualToString:@"tcsCall"];

      if (v9)
      {
        id v50 = v4;
        v10 = objc_opt_new();
        [v10 setNumberStyle:1];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v11 = [v6 queryItems];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (!v12) {
          goto LABEL_51;
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v52;
        while (1)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v52 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v17 = [v16 name];
            int v18 = [@"conn" isEqualToString:v17];

            if (v18)
            {
              v19 = [v16 value];
              v20 = [v10 numberFromString:v19];

              if (v20) {
                char v21 = [v20 BOOLValue];
              }
              else {
                char v21 = 0;
              }
              v5->_isConnected = v21;
            }
            else
            {
              v22 = [v16 name];
              int v23 = [@"out" isEqualToString:v22];

              if (v23)
              {
                v24 = [v16 value];
                v20 = [v10 numberFromString:v24];

                if (v20) {
                  char v25 = [v20 BOOLValue];
                }
                else {
                  char v25 = 0;
                }
                v5->_isOutgoing = v25;
              }
              else
              {
                v26 = [v16 name];
                int v27 = [@"rUM" isEqualToString:v26];

                if (v27)
                {
                  v28 = [v16 value];
                  v20 = [v10 numberFromString:v28];

                  if (v20) {
                    char v29 = [v20 BOOLValue];
                  }
                  else {
                    char v29 = 0;
                  }
                  v5->_isRemoteUplinkMuted = v29;
                }
                else
                {
                  v30 = [v16 name];
                  int v31 = [@"stat" isEqualToString:v30];

                  if (v31)
                  {
                    v32 = [v16 value];
                    v20 = [v10 numberFromString:v32];

                    if (v20) {
                      int v33 = [v20 intValue];
                    }
                    else {
                      int v33 = 0;
                    }
                    v5->_status = v33;
                  }
                  else
                  {
                    v34 = [v16 name];
                    int v35 = [@"dR" isEqualToString:v34];

                    if (v35)
                    {
                      v36 = [v16 value];
                      v20 = [v10 numberFromString:v36];

                      if (v20) {
                        int v37 = [v20 intValue];
                      }
                      else {
                        int v37 = 0;
                      }
                      v5->_disconnectedReason = v37;
                    }
                    else
                    {
                      v38 = [v16 name];
                      int v39 = [@"cID" isEqualToString:v38];

                      if (v39)
                      {
                        v20 = [v16 value];
                        uint64_t v40 = [v20 length];
                        if (v40)
                        {
                          uint64_t v40 = [v16 value];
                        }
                        contactIdentifier = v5->_contactIdentifier;
                        v5->_contactIdentifier = (NSString *)v40;
                      }
                      else
                      {
                        v42 = [v16 name];
                        int v43 = [@"hdl" isEqualToString:v42];

                        if (v43)
                        {
                          v20 = [v16 value];
                          uint64_t v44 = [v20 length];
                          if (v44)
                          {
                            uint64_t v44 = [v16 value];
                          }
                          contactIdentifier = v5->_handleValue;
                          v5->_handleValue = (NSString *)v44;
                        }
                        else
                        {
                          v45 = [v16 name];
                          int v46 = [@"uPI" isEqualToString:v45];

                          if (!v46) {
                            continue;
                          }
                          v20 = [v16 value];
                          if ([v20 length])
                          {
                            v47 = [v16 value];
                          }
                          else
                          {
                            v47 = &stru_26CFCDDE8;
                          }
                          contactIdentifier = v5->_uniqueProxyIdentifier;
                          v5->_uniqueProxyIdentifier = &v47->isa;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
          if (!v13)
          {
LABEL_51:

            id v4 = v50;
            goto LABEL_56;
          }
        }
      }
    }
    else
    {
    }
    _TCSInitializeLogging();
    v48 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSCall initWithURL:]((uint64_t)v4, v48);
    }
    v5->_isNilCall = 1;
LABEL_56:
  }
  return v5;
}

- (void)setCallCenter:(id)a3
{
}

- (BOOL)isEqualToCall:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    char v11 = 0;
    goto LABEL_38;
  }
  BOOL v40 = [(TCSCall *)self isConnected];
  char v39 = [v7 isConnected];
  BOOL v38 = [(TCSCall *)self isOutgoing];
  char v37 = [v7 isOutgoing];
  BOOL v36 = [(TCSCall *)self isRemoteUplinkMuted];
  char v35 = [v7 isRemoteUplinkMuted];
  v8 = [(TCSCall *)self contactIdentifier];
  if (!v8)
  {
    v3 = [v7 contactIdentifier];
    if (!v3)
    {
      char v41 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  int v9 = [(TCSCall *)self contactIdentifier];
  v10 = [v7 contactIdentifier];
  char v41 = [v9 isEqualToString:v10];

  if (!v8) {
    goto LABEL_8;
  }
LABEL_9:

  uint64_t v12 = [(TCSCall *)self handleValue];
  if (!v12)
  {
    v3 = [v7 handleValue];
    if (!v3)
    {
      char v34 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  uint64_t v13 = [(TCSCall *)self handleValue];
  uint64_t v14 = [v7 handleValue];
  char v34 = [v13 isEqualToString:v14];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_15:

  int v33 = [(TCSCall *)self status];
  int v32 = [v7 status];
  v15 = [(TCSCall *)self uniqueProxyIdentifier];
  if (!v15)
  {
    id v4 = [v7 uniqueProxyIdentifier];
    if (!v4)
    {
      char v31 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  uint64_t v16 = [(TCSCall *)self uniqueProxyIdentifier];
  v17 = [v7 uniqueProxyIdentifier];
  char v31 = [v16 isEqualToString:v17];

  if (!v15) {
    goto LABEL_20;
  }
LABEL_21:

  int v30 = [(TCSCall *)self disconnectedReason];
  int v29 = [v7 disconnectedReason];
  int v18 = [(TCSCall *)self dateAnsweredOrDialed];
  if (!v18)
  {
    v5 = [v7 dateAnsweredOrDialed];
    if (!v5)
    {
      char v21 = 1;
LABEL_26:

      goto LABEL_27;
    }
  }
  v19 = [(TCSCall *)self dateAnsweredOrDialed];
  v20 = [v7 dateAnsweredOrDialed];
  char v21 = [v19 isEqualToDate:v20];

  if (!v18) {
    goto LABEL_26;
  }
LABEL_27:

  v22 = [(TCSCall *)self dateConnected];
  if (!v22)
  {
    v5 = [v7 dateConnected];
    if (!v5)
    {
      char v25 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  int v23 = [(TCSCall *)self dateConnected];
  v24 = [v7 dateConnected];
  char v25 = [v23 isEqualToDate:v24];

  if (!v22) {
    goto LABEL_32;
  }
LABEL_33:

  char v26 = v41 & ~(v40 ^ v39 | v38 ^ v37 | v36 ^ v35) & v34;
  if (v33 != v32) {
    char v26 = 0;
  }
  char v27 = v26 & v31;
  if (v30 != v29) {
    char v27 = 0;
  }
  char v11 = v27 & v21 & v25;
LABEL_38:

  return v11;
}

- (id)URL
{
  v43[8] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setNumberStyle:1];
  id v4 = objc_opt_new();
  [v4 setScheme:@"tincan"];
  [v4 setHost:@"tcsCall"];
  v5 = (void *)MEMORY[0x263F08BD0];
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[TCSCall isConnected](self, "isConnected"));
  char v41 = [v3 stringFromNumber:v42];
  BOOL v40 = [v5 queryItemWithName:@"conn" value:v41];
  v43[0] = v40;
  v6 = (void *)MEMORY[0x263F08BD0];
  char v39 = objc_msgSend(NSNumber, "numberWithBool:", -[TCSCall isOutgoing](self, "isOutgoing"));
  BOOL v38 = [v3 stringFromNumber:v39];
  char v37 = [v6 queryItemWithName:@"out" value:v38];
  v43[1] = v37;
  id v7 = (void *)MEMORY[0x263F08BD0];
  BOOL v36 = objc_msgSend(NSNumber, "numberWithBool:", -[TCSCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  char v35 = [v3 stringFromNumber:v36];
  char v34 = [v7 queryItemWithName:@"rUM" value:v35];
  v43[2] = v34;
  v8 = (void *)MEMORY[0x263F08BD0];
  int v33 = objc_msgSend(NSNumber, "numberWithInt:", -[TCSCall status](self, "status"));
  int v32 = [v3 stringFromNumber:v33];
  char v31 = [v8 queryItemWithName:@"stat" value:v32];
  v43[3] = v31;
  int v9 = (void *)MEMORY[0x263F08BD0];
  int v30 = objc_msgSend(NSNumber, "numberWithInt:", -[TCSCall disconnectedReason](self, "disconnectedReason"));
  int v29 = [v3 stringFromNumber:v30];
  v10 = [v9 queryItemWithName:@"dR" value:v29];
  v43[4] = v10;
  char v11 = (void *)MEMORY[0x263F08BD0];
  uint64_t v12 = [(TCSCall *)self contactIdentifier];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_26CFCDDE8;
  }
  v15 = [v11 queryItemWithName:@"cID" value:v14];
  v43[5] = v15;
  uint64_t v16 = (void *)MEMORY[0x263F08BD0];
  uint64_t v17 = [(TCSCall *)self handleValue];
  int v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = &stru_26CFCDDE8;
  }
  v20 = [v16 queryItemWithName:@"hdl" value:v19];
  v43[6] = v20;
  char v21 = (void *)MEMORY[0x263F08BD0];
  uint64_t v22 = [(TCSCall *)self uniqueProxyIdentifier];
  int v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = &stru_26CFCDDE8;
  }
  char v25 = [v21 queryItemWithName:@"uPI" value:v24];
  v43[7] = v25;
  char v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:8];
  [v4 setQueryItems:v26];

  char v27 = [v4 URL];

  return v27;
}

- (void)setUplinkMuted:(BOOL)a3 completion:(id)a4
{
}

- (BOOL)isIncoming
{
  return ![(TCSCall *)self isOutgoing];
}

- (BOOL)isActive
{
  return [(TCSCall *)self status] == 3
      || [(TCSCall *)self status] == 4
      || [(TCSCall *)self status] == 1;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  if (self->_isNilCall)
  {
    id v4 = @" (no call)>";
  }
  else
  {
    v5 = [(TCSCall *)self handleValue];
    [v3 appendFormat:@" hdl=%@", v5];

    [(TCSCall *)self status];
    v6 = TUStringForCallStatus();
    [v3 appendFormat:@" stat=%@", v6];

    objc_msgSend(v3, "appendFormat:", @" dR=%d", -[TCSCall disconnectedReason](self, "disconnectedReason"));
    if ([(TCSCall *)self status] == 5 || [(TCSCall *)self status] == 6)
    {
      id v7 = NSStringFromTUCallDisconnectedReason([(TCSCall *)self disconnectedReason]);
      [v3 appendFormat:@":'%@'", v7];
    }
    v8 = [(TCSCall *)self uniqueProxyIdentifier];
    [v3 appendFormat:@" uPI=%@", v8];

    [(TCSCall *)self isConnected];
    int v9 = NSStringFromBOOL();
    [v3 appendFormat:@" conn=%@", v9];

    BOOL v10 = [(TCSCall *)self isOutgoing];
    char v11 = @"in";
    if (v10) {
      char v11 = @"out";
    }
    [v3 appendFormat:@" dir=%@", v11];
    uint64_t v12 = [(TCSCall *)self contactIdentifier];
    [v3 appendFormat:@" cID=%@", v12];

    objc_msgSend(v3, "appendFormat:", @" rUM=%d", -[TCSCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
    id v4 = @">";
  }
  [v3 appendString:v4];
  uint64_t v13 = (void *)[v3 copy];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TCSCall *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TCSCall *)self isEqualToCall:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  BOOL v3 = [(TCSCall *)self isConnected];
  int v4 = v3 ^ [(TCSCall *)self isOutgoing];
  uint64_t v5 = v4 ^ [(TCSCall *)self isRemoteUplinkMuted];
  v6 = [(TCSCall *)self contactIdentifier];
  uint64_t v7 = [v6 hash];
  v8 = [(TCSCall *)self handleValue];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(TCSCall *)self status];
  char v11 = [(TCSCall *)self uniqueProxyIdentifier];
  uint64_t v12 = v10 ^ [v11 hash] ^ v5;
  uint64_t v13 = [(TCSCall *)self disconnectedReason];
  uint64_t v14 = [(TCSCall *)self dateAnsweredOrDialed];
  uint64_t v15 = v13 ^ [v14 hash];
  uint64_t v16 = [(TCSCall *)self dateConnected];
  unint64_t v17 = v12 ^ v15 ^ [v16 hash];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TCSCall)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TCSCall *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_isConnected);
    v5->_isConnected = [v4 decodeBoolForKey:v6];

    uint64_t v7 = NSStringFromSelector(sel_isOutgoing);
    v5->_isOutgoing = [v4 decodeBoolForKey:v7];

    v8 = NSStringFromSelector(sel_isRemoteUplinkMuted);
    v5->_isRemoteUplinkMuted = [v4 decodeBoolForKey:v8];

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = NSStringFromSelector(sel_contactIdentifier);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = NSStringFromSelector(sel_handleValue);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    handleValue = v5->_handleValue;
    v5->_handleValue = (NSString *)v15;

    unint64_t v17 = NSStringFromSelector(sel_status);
    v5->_status = [v4 decodeIntForKey:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_uniqueProxyIdentifier);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    uniqueProxyIdentifier = v5->_uniqueProxyIdentifier;
    v5->_uniqueProxyIdentifier = (NSString *)v20;

    uint64_t v22 = NSStringFromSelector(sel_disconnectedReason);
    v5->_disconnectedReason = [v4 decodeIntForKey:v22];

    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector(sel_dateAnsweredOrDialed);
    uint64_t v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
    dateAnsweredOrDialed = v5->_dateAnsweredOrDialed;
    v5->_dateAnsweredOrDialed = (NSDate *)v25;

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_dateConnected);
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    dateConnected = v5->_dateConnected;
    v5->_dateConnected = (NSDate *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isConnected = self->_isConnected;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_isConnected);
  [v5 encodeBool:isConnected forKey:v6];

  BOOL isOutgoing = self->_isOutgoing;
  v8 = NSStringFromSelector(sel_isOutgoing);
  [v5 encodeBool:isOutgoing forKey:v8];

  BOOL isRemoteUplinkMuted = self->_isRemoteUplinkMuted;
  uint64_t v10 = NSStringFromSelector(sel_isRemoteUplinkMuted);
  [v5 encodeBool:isRemoteUplinkMuted forKey:v10];

  contactIdentifier = self->_contactIdentifier;
  uint64_t v12 = NSStringFromSelector(sel_contactIdentifier);
  [v5 encodeObject:contactIdentifier forKey:v12];

  handleValue = self->_handleValue;
  uint64_t v14 = NSStringFromSelector(sel_handleValue);
  [v5 encodeObject:handleValue forKey:v14];

  uint64_t status = self->_status;
  uint64_t v16 = NSStringFromSelector(sel_status);
  [v5 encodeInt:status forKey:v16];

  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  uint64_t v18 = NSStringFromSelector(sel_uniqueProxyIdentifier);
  [v5 encodeObject:uniqueProxyIdentifier forKey:v18];

  uint64_t disconnectedReason = self->_disconnectedReason;
  uint64_t v20 = NSStringFromSelector(sel_disconnectedReason);
  [v5 encodeInt:disconnectedReason forKey:v20];

  dateAnsweredOrDialed = self->_dateAnsweredOrDialed;
  uint64_t v22 = NSStringFromSelector(sel_dateAnsweredOrDialed);
  [v5 encodeObject:dateAnsweredOrDialed forKey:v22];

  dateConnected = self->_dateConnected;
  NSStringFromSelector(sel_dateConnected);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:dateConnected forKey:v24];
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_isRemoteUplinkMuted;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)handleValue
{
  return self->_handleValue;
}

- (int)status
{
  return self->_status;
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (int)disconnectedReason
{
  return self->_disconnectedReason;
}

- (NSDate)dateAnsweredOrDialed
{
  return self->_dateAnsweredOrDialed;
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_dateAnsweredOrDialed, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_handleValue, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
}

- (void)initWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E834000, a2, OS_LOG_TYPE_ERROR, "Failed to parse URL %{private}@ into a TCSCall.", (uint8_t *)&v2, 0xCu);
}

@end