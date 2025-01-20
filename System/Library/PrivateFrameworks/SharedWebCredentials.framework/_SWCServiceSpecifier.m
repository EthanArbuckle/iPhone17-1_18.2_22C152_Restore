@interface _SWCServiceSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)_serviceSpecifiersWithEntitlementValue:(id)a3 serviceType:(id)a4 error:(id *)a5;
+ (id)serviceSpecifiersWithEntitlementValue:(id)a3 error:(id *)a4;
+ (id)serviceSpecifiersWithEntitlementValue:(id)a3 serviceType:(id)a4 error:(id *)a5;
- (BOOL)domainEncompassesDomain:(id)a3;
- (BOOL)domainEncompassesDomainOfServiceSpecifier:(id)a3;
- (BOOL)isDomainWildcard;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullySpecified;
- (BOOL)isValid;
- (NSNumber)domainPort;
- (NSString)applicationIdentifier;
- (NSString)applicationIdentifierPrefix;
- (NSString)bundleIdentifier;
- (NSString)domain;
- (NSString)domainHost;
- (NSString)serviceType;
- (_SWCApplicationIdentifier)SWCApplicationIdentifier;
- (_SWCDomain)SWCDomain;
- (_SWCServiceSpecifier)init;
- (_SWCServiceSpecifier)initWithCoder:(id)a3;
- (_SWCServiceSpecifier)initWithServiceType:(id)a3 applicationIdentifier:(id)a4 domain:(id)a5;
- (char)domainModeOfOperation;
- (id)_initWithServiceType:(id)a3 applicationIdentifier:(id)a4 domain:(id)a5;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SWCServiceSpecifier

+ (id)serviceSpecifiersWithEntitlementValue:(id)a3 error:(id *)a4
{
  v4 = [a1 _serviceSpecifiersWithEntitlementValue:a3 serviceType:0 error:a4];
  return v4;
}

+ (id)serviceSpecifiersWithEntitlementValue:(id)a3 serviceType:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"SWCServiceSpecifier.mm", 35, @"Invalid parameter not satisfying: %@", @"serviceType != nil" object file lineNumber description];
  }
  v11 = [a1 _serviceSpecifiersWithEntitlementValue:v9 serviceType:v10 error:a5];

  return v11;
}

- (_SWCServiceSpecifier)initWithServiceType:(id)a3 applicationIdentifier:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v12 = 0;
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = [[_SWCApplicationIdentifier alloc] initWithString:v9];
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  v13 = [[_SWCDomain alloc] initWithString:v11];
LABEL_6:
  v14 = [(_SWCServiceSpecifier *)self _initWithServiceType:v8 applicationIdentifier:v12 domain:v13];

  return v14;
}

- (_SWCServiceSpecifier)init
{
  return (_SWCServiceSpecifier *)[(_SWCServiceSpecifier *)self _initWithServiceType:0 applicationIdentifier:0 domain:0];
}

- (NSString)applicationIdentifier
{
  return [(_SWCApplicationIdentifier *)self->_applicationIdentifier rawValue];
}

- (NSString)domain
{
  return [(_SWCDomain *)self->_domain rawValue];
}

- (id)_initWithServiceType:(id)a3 applicationIdentifier:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SWCServiceSpecifier;
  v11 = [(_SWCServiceSpecifier *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    serviceType = v11->_serviceType;
    v11->_serviceType = (NSString *)v12;

    objc_storeStrong((id *)&v11->_applicationIdentifier, a4);
    objc_storeStrong((id *)&v11->_domain, a5);
  }

  return v11;
}

- (BOOL)isFullySpecified
{
  return self->_serviceType && self->_applicationIdentifier && self->_domain != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SWCServiceSpecifier *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      serviceType = self->_serviceType;
      BOOL v9 = 0;
      if (!((unint64_t)serviceType | (unint64_t)v5->_serviceType)
        || -[NSString isEqual:](serviceType, "isEqual:"))
      {
        applicationIdentifier = self->_applicationIdentifier;
        if (!((unint64_t)applicationIdentifier | (unint64_t)v5->_applicationIdentifier)
          || -[_SWCApplicationIdentifier isEqual:](applicationIdentifier, "isEqual:"))
        {
          domain = self->_domain;
          if (!((unint64_t)domain | (unint64_t)v5->_domain) || -[_SWCDomain isEqual:](domain, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceType hash];
  unint64_t v4 = [(_SWCApplicationIdentifier *)self->_applicationIdentifier hash] ^ v3;
  return v4 ^ [(_SWCDomain *)self->_domain hash];
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"{ s = %@, a = %@, d = %@ }", self->_serviceType, self->_applicationIdentifier, self->_domain];
  return v2;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(_SWCServiceSpecifier *)self description];
  v6 = (void *)[v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  serviceType = self->_serviceType;
  v5 = [(_SWCApplicationIdentifier *)self->_applicationIdentifier redactedDescription];
  v6 = [(_SWCDomain *)self->_domain redactedDescription];
  v7 = (void *)[v3 initWithFormat:@"{ s = %@, a = %@, d = %@ }", serviceType, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_serviceType forKey:@"serviceType"];
  [v4 encodeObject:self->_applicationIdentifier forKey:@"applicationIdentifier"];
  [v4 encodeObject:self->_domain forKey:@"domain"];
}

- (_SWCServiceSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"serviceType");
  v6 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"applicationIdentifier");
  v7 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"domain");
  id v8 = [(_SWCServiceSpecifier *)self _initWithServiceType:v5 applicationIdentifier:v6 domain:v7];

  return v8;
}

- (_SWCApplicationIdentifier)SWCApplicationIdentifier
{
  return (_SWCApplicationIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (_SWCDomain)SWCDomain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (NSString)bundleIdentifier
{
  return [(_SWCApplicationIdentifier *)self->_applicationIdentifier bundleIdentifier];
}

- (NSString)applicationIdentifierPrefix
{
  return [(_SWCApplicationIdentifier *)self->_applicationIdentifier prefix];
}

- (NSString)domainHost
{
  return [(_SWCDomain *)self->_domain host];
}

- (BOOL)isDomainWildcard
{
  return [(_SWCDomain *)self->_domain isWildcard];
}

- (NSNumber)domainPort
{
  return [(_SWCDomain *)self->_domain port];
}

- (char)domainModeOfOperation
{
  return [(_SWCDomain *)self->_domain modeOfOperation];
}

- (BOOL)domainEncompassesDomain:(id)a3
{
  id v4 = a3;
  v5 = [(_SWCServiceSpecifier *)self SWCDomain];
  if (v5)
  {
    v6 = [[_SWCDomain alloc] initWithString:v4];
    if (v6) {
      char v7 = [v5 encompassesDomain:v6];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)domainEncompassesDomainOfServiceSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(_SWCServiceSpecifier *)self SWCDomain];
  uint64_t v6 = [v4 SWCDomain];
  char v7 = (void *)v6;
  char v8 = 0;
  if (v5 && v6) {
    char v8 = [v5 encompassesDomain:v6];
  }

  return v8;
}

- (BOOL)isValid
{
  applicationIdentifier = self->_applicationIdentifier;
  if (!applicationIdentifier || (int v4 = [(_SWCApplicationIdentifier *)applicationIdentifier isValid]) != 0)
  {
    domain = self->_domain;
    if (!domain || (int v4 = [(_SWCDomain *)domain isValid]) != 0)
    {
      serviceType = self->_serviceType;
      if (serviceType)
      {
        LOBYTE(v4) = _SWCServiceTypeIsWhitelisted(serviceType);
      }
      else
      {
        LOBYTE(v4) = 1;
      }
    }
  }
  return v4;
}

+ (id)_serviceSpecifiersWithEntitlementValue:(id)a3 serviceType:(id)a4 error:(id *)a5
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v8 = a4;
  context = (void *)MEMORY[0x1AD1157F0]();
  v41 = v8;
  if (v8 && (_SWCServiceTypeIsWhitelisted(v8) & 1) == 0)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    v52[0] = &unk_1F03458C0;
    v51[0] = @"Line";
    v51[1] = @"Function";
    id obj = [NSString stringWithUTF8String:"+[_SWCServiceSpecifier(Private) _serviceSpecifiersWithEntitlementValue:serviceType:error:]"];
    v52[1] = obj;
    v51[2] = *MEMORY[0x1E4F28228];
    v24 = (void *)[[NSString alloc] initWithFormat:@"Service %@ is not supported.", v8];
    v52[2] = v24;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
    uint64_t v29 = [v30 initWithDomain:@"SWCErrorDomain" code:2 userInfo:v28];
    goto LABEL_28;
  }
  if (!v39 || (BOOL v9 = 0, !_NSIsNSArray()))
  {
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    v47[0] = &unk_1F03458F0;
    v46[0] = @"Line";
    v46[1] = @"Function";
    id obj = [NSString stringWithUTF8String:"+[_SWCServiceSpecifier(Private) _serviceSpecifiersWithEntitlementValue:serviceType:error:]"];
    v47[1] = obj;
    v46[2] = *MEMORY[0x1E4F28228];
    v24 = (void *)[[NSString alloc] initWithFormat:@"Invalid entitlement value of class %@", objc_opt_class()];
    v47[2] = v24;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
    uint64_t v29 = [v27 initWithDomain:@"SWCErrorDomain" code:2 userInfo:v28];
LABEL_28:
    v26 = (void *)v29;
LABEL_29:

    v25 = 0;
    id v38 = obj;
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v10 = [v8 length];
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v34 = (objc_class *)a1;
  uint64_t v35 = v10;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v39;
  uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (!v11) {
    goto LABEL_24;
  }
  uint64_t v12 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      if (!_NSIsNSString())
      {

        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        v49[0] = &unk_1F03458D8;
        v48[0] = @"Line";
        v48[1] = @"Function";
        v24 = [NSString stringWithUTF8String:"+[_SWCServiceSpecifier(Private) _serviceSpecifiersWithEntitlementValue:serviceType:error:]"];
        v49[1] = v24;
        v48[2] = *MEMORY[0x1E4F28228];
        v28 = (void *)[[NSString alloc] initWithFormat:@"Invalid entitlement value (in array) of class %@", objc_opt_class()];
        v49[2] = v28;
        v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
        v26 = (void *)[v32 initWithDomain:@"SWCErrorDomain" code:2 userInfo:v33];

        goto LABEL_29;
      }
      uint64_t v15 = [v14 rangeOfString:@":"];
      uint64_t v17 = v15;
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v18 = v16;
        if (v41)
        {
          if (v35 != v15) {
            continue;
          }
          uint64_t v19 = [v14 compare:v41 options:1 range:0];
          v20 = v41;
          if (v19) {
            continue;
          }
        }
        else
        {
          v5 = [v14 substringToIndex:v15];
          v20 = [v5 lowercaseString];
          BOOL v9 = v20;
        }
        v21 = _SWCServiceTypeCanonicalize(v20);
        if (!v41)
        {
        }
        v22 = [v14 substringFromIndex:v17 + v18];
        if (_SWCServiceTypeIsWhitelisted(v21))
        {
          v23 = (void *)[[v34 alloc] initWithServiceType:v21 applicationIdentifier:0 domain:v22];
          [v38 addObject:v23];
        }
      }
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_24:

  if (v38)
  {
    v24 = [v38 array];
    v25 = (void *)[v24 copy];
    v26 = 0;
    goto LABEL_30;
  }
  v26 = 0;
  v25 = 0;
LABEL_31:
  if (a5 && !v25) {
    *a5 = v26;
  }

  return v25;
}

@end