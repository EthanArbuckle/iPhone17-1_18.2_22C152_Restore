@interface UNCContactRecord
- (BOOL)isCNContactIdentifierSuggested;
- (BOOL)isDisplayNameSuggested;
- (BOOL)isEqual:(id)a3;
- (NSString)cnContactFullname;
- (NSString)cnContactIdentifier;
- (NSString)customIdentifier;
- (NSString)displayName;
- (NSString)handle;
- (NSString)serviceName;
- (UNCContactRecord)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)handleType;
- (unint64_t)hash;
- (void)setCnContactFullname:(id)a3;
- (void)setCnContactIdentifier:(id)a3;
- (void)setCnContactIdentifierSuggested:(BOOL)a3;
- (void)setCustomIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameSuggested:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHandleType:(int64_t)a3;
- (void)setServiceName:(id)a3;
@end

@implementation UNCContactRecord

- (UNCContactRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UNCContactRecord;
  v5 = [(UNCContactRecord *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"handle"];
    [(UNCContactRecord *)v5 setHandle:v6];

    v7 = [v4 objectForKey:@"handleType"];
    -[UNCContactRecord setHandleType:](v5, "setHandleType:", [v7 unsignedIntegerValue]);

    v8 = [v4 objectForKey:@"serviceName"];
    [(UNCContactRecord *)v5 setServiceName:v8];

    v9 = [v4 objectForKey:@"displayName"];
    [(UNCContactRecord *)v5 setDisplayName:v9];

    v10 = [v4 objectForKey:@"displayNameSuggested"];
    -[UNCContactRecord setDisplayNameSuggested:](v5, "setDisplayNameSuggested:", [v10 BOOLValue]);

    v11 = [v4 objectForKey:@"customIdentifier"];
    [(UNCContactRecord *)v5 setCustomIdentifier:v11];

    v12 = [v4 objectForKey:@"cnContactIdentifier"];
    [(UNCContactRecord *)v5 setCnContactIdentifier:v12];

    v13 = [v4 objectForKey:@"cnContactFullName"];
    [(UNCContactRecord *)v5 setCnContactFullname:v13];

    v14 = [v4 objectForKey:@"cnContactIdentifierSuggested"];
    -[UNCContactRecord setCnContactIdentifierSuggested:](v5, "setCnContactIdentifierSuggested:", [v14 BOOLValue]);
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(UNCContactRecord *)self handle];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"handle");

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNCContactRecord handleType](self, "handleType"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, @"handleType");

  v6 = [(UNCContactRecord *)self serviceName];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, @"serviceName");

  v7 = [(UNCContactRecord *)self displayName];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, @"displayName");

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCContactRecord isDisplayNameSuggested](self, "isDisplayNameSuggested"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, @"displayNameSuggested");

  v9 = [(UNCContactRecord *)self customIdentifier];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, @"customIdentifier");

  v10 = [(UNCContactRecord *)self cnContactIdentifier];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, @"cnContactIdentifier");

  v11 = [(UNCContactRecord *)self cnContactFullname];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v11, @"cnContactFullName");

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCContactRecord isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v12, @"cnContactIdentifierSuggested");

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCContactRecord *)self handle];
  v5 = objc_msgSend(v4, "un_logDigest");
  id v6 = (id)[v3 appendObject:v5 withName:@"handle"];

  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[UNCContactRecord handleType](self, "handleType"), @"handleType");
  v8 = [(UNCContactRecord *)self serviceName];
  id v9 = (id)[v3 appendObject:v8 withName:@"serviceName"];

  v10 = [(UNCContactRecord *)self displayName];
  v11 = objc_msgSend(v10, "un_logDigest");
  id v12 = (id)[v3 appendObject:v11 withName:@"displayName"];

  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCContactRecord isDisplayNameSuggested](self, "isDisplayNameSuggested"), @"displayNameSuggested");
  v14 = [(UNCContactRecord *)self customIdentifier];
  v15 = objc_msgSend(v14, "un_logDigest");
  id v16 = (id)[v3 appendObject:v15 withName:@"customIdentifier"];

  v17 = [(UNCContactRecord *)self cnContactIdentifier];
  id v18 = (id)[v3 appendObject:v17 withName:@"cnContactIdentifier"];

  v19 = [(UNCContactRecord *)self cnContactFullname];
  v20 = objc_msgSend(v19, "un_logDigest");
  id v21 = (id)[v3 appendObject:v20 withName:@"cnContactFullname"];

  id v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCContactRecord isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"), @"cnContactIdentifierSuggested");
  v23 = [v3 build];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_14:
      LOBYTE(v27) = 0;
      goto LABEL_15;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = [(UNCContactRecord *)self handle];
  id v7 = [v5 handle];
  int v8 = UNEqualStrings();

  if (!v8) {
    goto LABEL_14;
  }
  int64_t v9 = [(UNCContactRecord *)self handleType];
  if (v9 != [v5 handleType]) {
    goto LABEL_14;
  }
  v10 = [(UNCContactRecord *)self serviceName];
  v11 = [v5 serviceName];
  int v12 = UNEqualStrings();

  if (!v12) {
    goto LABEL_14;
  }
  id v13 = [(UNCContactRecord *)self displayName];
  v14 = [v5 displayName];
  int v15 = UNEqualStrings();

  if (!v15) {
    goto LABEL_14;
  }
  int v16 = [(UNCContactRecord *)self isDisplayNameSuggested];
  if (v16 != [v5 isDisplayNameSuggested]) {
    goto LABEL_14;
  }
  v17 = [(UNCContactRecord *)self customIdentifier];
  id v18 = [v5 customIdentifier];
  int v19 = UNEqualStrings();

  if (!v19) {
    goto LABEL_14;
  }
  v20 = [(UNCContactRecord *)self cnContactIdentifier];
  id v21 = [v5 cnContactIdentifier];
  int v22 = UNEqualStrings();

  if (!v22) {
    goto LABEL_14;
  }
  v23 = [(UNCContactRecord *)self cnContactFullname];
  v24 = [v5 cnContactFullname];
  int v25 = UNEqualStrings();

  if (!v25) {
    goto LABEL_14;
  }
  BOOL v26 = [(UNCContactRecord *)self isCNContactIdentifierSuggested];
  int v27 = v26 ^ [v5 isCNContactIdentifierSuggested] ^ 1;
LABEL_15:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3 = self->_handleType + [(NSString *)self->_handle hash];
  NSUInteger v4 = [(NSString *)self->_serviceName hash];
  NSUInteger v5 = v3 + v4 + [(NSString *)self->_displayName hash];
  BOOL displayNameSuggested = self->_displayNameSuggested;
  NSUInteger v7 = displayNameSuggested + [(NSString *)self->_customIdentifier hash];
  NSUInteger v8 = v5 + v7 + [(NSString *)self->_cnContactIdentifier hash];
  NSUInteger v9 = [(NSString *)self->_cnContactIdentifier hash];
  return v8 + v9 + [(NSString *)self->_cnContactFullname hash] + self->_cnContactIdentifierSuggested;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)isDisplayNameSuggested
{
  return self->_displayNameSuggested;
}

- (void)setDisplayNameSuggested:(BOOL)a3
{
  self->_BOOL displayNameSuggested = a3;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setCustomIdentifier:(id)a3
{
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (void)setCnContactIdentifier:(id)a3
{
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (void)setCnContactFullname:(id)a3
{
}

- (BOOL)isCNContactIdentifierSuggested
{
  return self->_cnContactIdentifierSuggested;
}

- (void)setCnContactIdentifierSuggested:(BOOL)a3
{
  self->_cnContactIdentifierSuggested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end