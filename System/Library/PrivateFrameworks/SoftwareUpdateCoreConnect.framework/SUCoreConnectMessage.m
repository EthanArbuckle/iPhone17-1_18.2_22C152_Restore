@interface SUCoreConnectMessage
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateMessageDictionary:(id)a3;
+ (id)nameForMessageType:(int64_t)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken;
- (NSDictionary)message;
- (NSError)error;
- (NSSet)allowlistedClasses;
- (NSString)clientID;
- (NSString)clientIDRaw;
- (NSString)messageName;
- (SUCoreConnectMessage)initWithCoder:(id)a3;
- (SUCoreConnectMessage)initWithType:(int64_t)a3 messageName:(id)a4 clientID:(id)a5 version:(id)a6 message:(id)a7;
- (SUCoreConnectVersion)version;
- (id)description;
- (id)summary;
- (int)clientProcessIdentifier;
- (int64_t)messageType;
- (void)encodeWithCoder:(id)a3;
- (void)setClientConnectionAuditToken:(id *)a3;
@end

@implementation SUCoreConnectMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowlistedClasses, 0);
  objc_storeStrong((id *)&self->_clientIDRaw, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

- (SUCoreConnectMessage)initWithType:(int64_t)a3 messageName:(id)a4 clientID:(id)a5 version:(id)a6 message:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v26 = [MEMORY[0x263F77DA8] sharedDiag];
    v27 = v26;
    v28 = @"SUCoreConnectMessage requires a non-nil messageName";
LABEL_10:
    [v26 trackAnomaly:@"SUCoreConnectMessage" forReason:v28 withResult:8102 withError:0];

    v25 = 0;
    goto LABEL_11;
  }
  if (!v14)
  {
    v26 = [MEMORY[0x263F77DA8] sharedDiag];
    v27 = v26;
    v28 = @"SUCoreConnectMessage requires a non-nil clientID";
    goto LABEL_10;
  }
  if (!+[SUCoreConnectMessage validateMessageDictionary:v16])
  {
    v26 = [MEMORY[0x263F77DA8] sharedDiag];
    v27 = v26;
    v28 = @"SUCoreConnectMessage requires a valid message dictionary";
    goto LABEL_10;
  }
  v30.receiver = self;
  v30.super_class = (Class)SUCoreConnectMessage;
  v17 = [(SUCoreConnectMessage *)&v30 init];
  v18 = v17;
  if (v17)
  {
    v17->_messageType = a3;
    objc_storeStrong((id *)&v17->_messageName, a4);
    v19 = NSString;
    v20 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v21 = [v19 stringWithFormat:@"%@.<%d>", v14, objc_msgSend(v20, "processIdentifier")];
    clientID = v18->_clientID;
    v18->_clientID = (NSString *)v21;

    objc_storeStrong((id *)&v18->_clientIDRaw, a5);
    v23 = [MEMORY[0x263F08AB0] processInfo];
    v18->_clientProcessIdentifier = [v23 processIdentifier];

    objc_storeStrong((id *)&v18->_version, a6);
    error = v18->_error;
    v18->_error = 0;

    objc_storeStrong((id *)&v18->_message, a7);
  }
  self = v18;
  v25 = self;
LABEL_11:

  return v25;
}

- (void)setClientConnectionAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientConnectionAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientConnectionAuditToken.val[4] = v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SUCoreConnectMessage messageType](self, "messageType"), @"MessageType");
  v5 = [(SUCoreConnectMessage *)self messageName];
  [v4 encodeObject:v5 forKey:@"MessageName"];

  v6 = [(SUCoreConnectMessage *)self clientID];
  [v4 encodeObject:v6 forKey:@"ClientID"];

  v7 = [(SUCoreConnectMessage *)self clientIDRaw];
  [v4 encodeObject:v7 forKey:@"ClientIDRaw"];

  objc_msgSend(v4, "encodeInt:forKey:", -[SUCoreConnectMessage clientProcessIdentifier](self, "clientProcessIdentifier"), @"ClientProcessIdentifier");
  v8 = [(SUCoreConnectMessage *)self version];
  [v4 encodeObject:v8 forKey:@"Version"];

  v9 = [(SUCoreConnectMessage *)self error];
  [v4 encodeObject:v9 forKey:@"Error"];

  id v10 = [(SUCoreConnectMessage *)self message];
  [v4 encodeObject:v10 forKey:@"Message"];
}

- (id)description
{
  v2 = self;
  uint64_t v49 = *MEMORY[0x263EF8340];
  long long v3 = [(SUCoreConnectMessage *)self message];
  id v4 = @"[>>>\n";
  if (!v3) {
    id v4 = 0;
  }
  v5 = v4;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(SUCoreConnectMessage *)v2 message];
  uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v37)
  {
    uint64_t v6 = *(void *)v44;
    uint64_t v33 = *(void *)v44;
    v34 = v2;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v9 = [(SUCoreConnectMessage *)v2 message];
        id v10 = [v9 objectForKey:v8];

        objc_opt_class();
        v38 = v10;
        if (objc_opt_isKindOfClass())
        {
          v36 = v5;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v40;
            id v15 = @"{\n";
            do
            {
              uint64_t v16 = 0;
              v17 = v15;
              do
              {
                if (*(void *)v40 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * v16);
                v19 = [v11 objectForKey:v18];
                id v15 = [(__CFString *)v17 stringByAppendingFormat:@"\t\t%@: %@\n", v18, v19];

                ++v16;
                v17 = v15;
              }
              while (v13 != v16);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v13);
          }
          else
          {
            id v15 = @"{\n";
          }

          v20 = v36;
          v5 = [(__CFString *)v36 stringByAppendingFormat:@"\t%@: %@\n\t}\n", v8, v15];
          uint64_t v6 = v33;
          v2 = v34;
        }
        else
        {
          id v15 = [(SUCoreConnectMessage *)v2 message];
          v20 = [(__CFString *)v15 objectForKey:v8];
          uint64_t v21 = [(__CFString *)v5 stringByAppendingFormat:@"\t%@: %@\n", v8, v20];

          v5 = (__CFString *)v21;
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v37);
  }

  if (v5)
  {
    v22 = [(__CFString *)v5 stringByAppendingString:@"<<<]"];
  }
  else
  {
    v22 = 0;
  }
  v23 = NSString;
  v24 = +[SUCoreConnectMessage nameForMessageType:[(SUCoreConnectMessage *)v2 messageType]];
  v25 = [(SUCoreConnectMessage *)v2 messageName];
  v26 = [(SUCoreConnectMessage *)v2 clientID];
  v27 = [(SUCoreConnectMessage *)v2 clientIDRaw];
  uint64_t v28 = [(SUCoreConnectMessage *)v2 clientProcessIdentifier];
  v29 = [(SUCoreConnectMessage *)v2 version];
  objc_super v30 = [(SUCoreConnectMessage *)v2 error];
  v31 = [v23 stringWithFormat:@"SUCoreConnectMessage(type:%@|name:%@|clientID:%@|clientIDRaw:%@|clientProcessIdentifier:%d|version:%@|error:%@|message:%@)", v24, v25, v26, v27, v28, v29, v30, v22];

  return v31;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (SUCoreConnectVersion)version
{
  return self->_version;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSError)error
{
  return self->_error;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

+ (id)nameForMessageType:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = @"CLIENT_MESSAGE";
  }
  else if (a3 == 2)
  {
    id v4 = @"SERVER_MESSAGE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN_TYPE(%lu)", a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)validateMessageDictionary:(id)a3
{
  return 1;
}

- (SUCoreConnectMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SUCoreConnectMessage;
  v5 = [(SUCoreConnectMessage *)&v39 init];
  if (v5)
  {
    v5->_int64_t messageType = [v4 decodeIntegerForKey:@"MessageType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MessageName"];
    messageName = v5->_messageName;
    v5->_messageName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientIDRaw"];
    clientIDRaw = v5->_clientIDRaw;
    v5->_clientIDRaw = (NSString *)v10;

    v5->_clientProcessIdentifier = [v4 decodeIntForKey:@"ClientProcessIdentifier"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
    version = v5->_version;
    v5->_version = (SUCoreConnectVersion *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Error"];
    error = v5->_error;
    v5->_error = (NSError *)v14;

    int64_t messageType = v5->_messageType;
    if (messageType == 2)
    {
      v17 = +[SUCoreConnectClientPolicy getAllowlistedClassesForKey:v5->_messageName];
      if (v17)
      {
LABEL_7:
        uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"Message"];
        message = v5->_message;
        v5->_message = (NSDictionary *)v18;

LABEL_13:
        goto LABEL_14;
      }
      v24 = (void *)[[NSString alloc] initWithFormat:@"client policy does not define allowlisted classes for key: %@", v5->_messageName];
      v34 = [MEMORY[0x263F77D78] sharedCore];
      uint64_t v35 = [v34 buildError:8902 underlying:v5->_error description:v24];
      v36 = v5->_error;
      v5->_error = (NSError *)v35;

      uint64_t v37 = v5->_message;
      v5->_message = 0;

      v29 = [MEMORY[0x263F77DA8] sharedDiag];
      objc_super v30 = v29;
      v31 = v5->_error;
      v32 = v24;
      uint64_t v33 = 8902;
    }
    else
    {
      if (messageType != 1)
      {
        v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"no connect policy type could be determined for message with type: %ld", v5->_messageType);
        v20 = [MEMORY[0x263F77D78] sharedCore];
        uint64_t v21 = [v20 buildError:8901 underlying:v5->_error description:v17];
        v22 = v5->_error;
        v5->_error = (NSError *)v21;

        v23 = v5->_message;
        v5->_message = 0;

        v24 = [MEMORY[0x263F77DA8] sharedDiag];
        [v24 trackError:@"SUCoreConnectMessageDecode" forReason:v17 withResult:8901 withError:v5->_error];
LABEL_12:

        goto LABEL_13;
      }
      v17 = +[SUCoreConnectServerPolicy getAllowlistedClassesForKey:v5->_messageName];
      if (v17) {
        goto LABEL_7;
      }
      v24 = (void *)[[NSString alloc] initWithFormat:@"server policy does not define allowlisted classes for key: %@", v5->_messageName];
      v25 = [MEMORY[0x263F77D78] sharedCore];
      uint64_t v26 = [v25 buildError:8904 underlying:v5->_error description:v24];
      v27 = v5->_error;
      v5->_error = (NSError *)v26;

      uint64_t v28 = v5->_message;
      v5->_message = 0;

      v29 = [MEMORY[0x263F77DA8] sharedDiag];
      objc_super v30 = v29;
      v31 = v5->_error;
      v32 = v24;
      uint64_t v33 = 8904;
    }
    [v29 trackError:@"SUCoreConnectMessageDecode" forReason:v32 withResult:v33 withError:v31];

    goto LABEL_12;
  }
LABEL_14:

  return v5;
}

- (id)summary
{
  uint64_t v3 = NSString;
  id v4 = [(SUCoreConnectMessage *)self clientID];
  v5 = +[SUCoreConnectMessage nameForMessageType:[(SUCoreConnectMessage *)self messageType]];
  uint64_t v6 = [(SUCoreConnectMessage *)self messageName];
  v7 = [v3 stringWithFormat:@"SUCoreConnectMessage(clientID:%@|type:%@|name:%@)", v4, v5, v6];

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken
{
  long long v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSSet)allowlistedClasses
{
  return self->_allowlistedClasses;
}

@end