@interface SSDownloadPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)policyRules;
- (NSString)downloadKind;
- (SSDownloadPolicy)initWithCoder:(id)a3;
- (SSDownloadPolicy)initWithDownloadKind:(id)a3 URLBagType:(int64_t)a4;
- (SSDownloadPolicy)initWithNetworkConstraints:(id)a3;
- (SSDownloadPolicy)initWithXPCEncoding:(id)a3;
- (id)_policyRuleForSizeLimit:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)URLBagType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPolicyRule:(id)a3;
- (void)setPolicyRules:(id)a3;
- (void)unionNetworkConstraints:(id)a3;
- (void)unionPolicyRule:(id)a3;
@end

@implementation SSDownloadPolicy

- (SSDownloadPolicy)initWithDownloadKind:(id)a3 URLBagType:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SSDownloadPolicy;
  v6 = [(SSDownloadPolicy *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_bagType = a4;
    v6->_downloadKind = (NSString *)[a3 copy];
  }
  return v7;
}

- (SSDownloadPolicy)initWithNetworkConstraints:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSDownloadPolicy;
  v4 = [(SSDownloadPolicy *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SSDownloadPolicy *)v4 unionNetworkConstraints:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicy;
  [(SSDownloadPolicy *)&v3 dealloc];
}

- (void)setPolicyRule:(id)a3
{
  id v5 = -[SSDownloadPolicy _policyRuleForSizeLimit:](self, "_policyRuleForSizeLimit:", [a3 downloadSizeLimit]);
  policyRules = self->_policyRules;
  if (v5)
  {
    uint64_t v7 = -[NSMutableArray indexOfObjectIdenticalTo:](policyRules, "indexOfObjectIdenticalTo:");
    v8 = self->_policyRules;
    [(NSMutableArray *)v8 replaceObjectAtIndex:v7 withObject:a3];
  }
  else
  {
    if (!policyRules)
    {
      policyRules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_policyRules = policyRules;
    }
    [(NSMutableArray *)policyRules addObject:a3];
  }
}

- (void)setPolicyRules:(id)a3
{
  policyRules = self->_policyRules;
  if (policyRules != a3)
  {

    self->_policyRules = (NSMutableArray *)[a3 mutableCopy];
  }
}

- (void)unionNetworkConstraints:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SSDownloadPolicy_unionNetworkConstraints___block_invoke;
  v3[3] = &unk_1E5BAA0F8;
  v3[4] = a3;
  v3[5] = self;
  SSNetworkTypeApplyBlock((uint64_t)v3);
}

void __44__SSDownloadPolicy_unionNetworkConstraints___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = objc_alloc_init(SSDownloadPolicyRule);
  [(SSDownloadPolicyRule *)v4 addNetworkType:a2];
  -[SSDownloadPolicyRule setDownloadSizeLimit:](v4, "setDownloadSizeLimit:", [*(id *)(a1 + 32) sizeLimitForNetworkType:a2]);
  [*(id *)(a1 + 40) unionPolicyRule:v4];
}

- (void)unionPolicyRule:(id)a3
{
  id v5 = -[SSDownloadPolicy _policyRuleForSizeLimit:](self, "_policyRuleForSizeLimit:", [a3 downloadSizeLimit]);
  if (v5)
  {
    [v5 unionPolicyRule:a3];
  }
  else
  {
    policyRules = self->_policyRules;
    if (!policyRules)
    {
      policyRules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_policyRules = policyRules;
    }
    [(NSMutableArray *)policyRules addObject:a3];
  }
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_policyRules hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && self->_bagType == *((void *)a3 + 1))
  {
    downloadKind = self->_downloadKind;
    if (downloadKind == *((NSString **)a3 + 2)
      || (int v7 = -[NSString isEqualToString:](downloadKind, "isEqualToString:")) != 0)
    {
      policyRules = self->_policyRules;
      if (policyRules == *((NSMutableArray **)a3 + 3))
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        LOBYTE(v7) = -[NSMutableArray isEqualToArray:](policyRules, "isEqualToArray:");
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_downloadKind forKey:@"kind"];
  [a3 encodeObject:self->_policyRules forKey:@"rules"];
  uint64_t v5 = SSGetStringForURLBagType(self->_bagType);
  [a3 encodeObject:v5 forKey:@"bagtype"];
}

- (SSDownloadPolicy)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSDownloadPolicy;
  v4 = [(SSDownloadPolicy *)&v9 init];
  if (v4)
  {
    uint64_t v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bagtype"];
    v4->_bagType = SSURLBagTypeForString(v5);
    v4->_downloadKind = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v4->_policyRules = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), @"rules"), "mutableCopy");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_bagType;
  v5[2] = [(NSString *)self->_downloadKind copyWithZone:a3];
  v5[3] = [(NSMutableArray *)self->_policyRules mutableCopyWithZone:a3];
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_downloadKind);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_policyRules);
  xpc_dictionary_set_int64(v3, "2", self->_bagType);
  return v3;
}

- (SSDownloadPolicy)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSDownloadPolicy;
    uint64_t v5 = [(SSDownloadPolicy *)&v10 init];
    if (v5)
    {
      xpc_object_t value = xpc_dictionary_get_value(a3, "1");
      uint64_t v8 = objc_opt_class();
      id v9 = SSXPCCreateNSArrayFromXPCEncodedArray(value, v8);
      v5->_bagType = xpc_dictionary_get_int64(a3, "2");
      objc_opt_class();
      v5->_downloadKind = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      v5->_policyRules = (NSMutableArray *)[v9 mutableCopy];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)_policyRuleForSizeLimit:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  policyRules = self->_policyRules;
  uint64_t v5 = [(NSMutableArray *)policyRules countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(policyRules);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 downloadSizeLimit] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)policyRules countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSString)downloadKind
{
  return self->_downloadKind;
}

- (NSArray)policyRules
{
  return &self->_policyRules->super;
}

- (int64_t)URLBagType
{
  return self->_bagType;
}

@end