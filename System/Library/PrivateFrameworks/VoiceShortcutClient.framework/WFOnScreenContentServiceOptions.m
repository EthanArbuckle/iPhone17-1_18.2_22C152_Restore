@interface WFOnScreenContentServiceOptions
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)originatingProcessAuditToken;
- (NSArray)supportedItemClasses;
- (WFOnScreenContentServiceOptions)init;
- (WFOnScreenContentServiceOptions)initWithCoder:(id)a3;
- (WFOnScreenContentServiceOptions)initWithSupportedItemClasses:(id)a3 originatingProcessAuditToken:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginatingProcessAuditToken:(id *)a3;
@end

@implementation WFOnScreenContentServiceOptions

- (void).cxx_destruct
{
}

- (void)setOriginatingProcessAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_originatingProcessAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_originatingProcessAuditToken.val[4] = v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)originatingProcessAuditToken
{
  long long v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSArray)supportedItemClasses
{
  return self->_supportedItemClasses;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFOnScreenContentServiceOptions *)self supportedItemClasses];
  [v4 encodeObject:v5 forKey:@"supportedItemClasses"];

  long long v6 = *(_OWORD *)&self->_originatingProcessAuditToken.val[4];
  v8[0] = *(_OWORD *)self->_originatingProcessAuditToken.val;
  v8[1] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "if_dataWithAuditToken:", v8);
  [v4 encodeObject:v7 forKey:@"originatingProcessAuditToken"];
}

- (WFOnScreenContentServiceOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFOnScreenContentServiceOptions;
  v5 = [(WFOnScreenContentServiceOptions *)&v17 init];
  if (v5)
  {
    long long v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"supportedItemClasses"];
    supportedItemClasses = v5->_supportedItemClasses;
    v5->_supportedItemClasses = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingProcessAuditToken"];
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "if_auditToken");
      *(_OWORD *)v5->_originatingProcessAuditToken.val = v15;
      *(_OWORD *)&v5->_originatingProcessAuditToken.val[4] = v16;
    }
    v13 = v5;
  }
  return v5;
}

- (WFOnScreenContentServiceOptions)initWithSupportedItemClasses:(id)a3 originatingProcessAuditToken:(id *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFOnScreenContentServiceOptions;
  v8 = [(WFOnScreenContentServiceOptions *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_supportedItemClasses, a3);
    long long v10 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v9->_originatingProcessAuditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v9->_originatingProcessAuditToken.val[4] = v10;
    v11 = v9;
  }

  return v9;
}

- (WFOnScreenContentServiceOptions)init
{
  long long v3 = [MEMORY[0x1E4F28F80] processInfo];
  id v4 = v3;
  if (v3) {
    objc_msgSend(v3, "if_auditToken");
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  v5 = [(WFOnScreenContentServiceOptions *)self initWithSupportedItemClasses:&unk_1F0CB1DD8 originatingProcessAuditToken:v7];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end