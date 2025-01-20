@interface APPCPolicyData
+ (BOOL)supportsSecureCoding;
- (APPCPolicyData)initWithCoder:(id)a3;
- (APPCPolicyData)initWithPolicyType:(int64_t)a3 policyValue:(id)a4 isXLFormat:(id)a5;
- (NSArray)targetingExpression;
- (NSDictionary)dataAdapters;
- (NSNumber)isXLFormat;
- (NSNumber)policyValue;
- (NSString)adFormatType;
- (NSString)adType;
- (NSString)containerType;
- (NSString)expression;
- (NSString)placementDescriptor;
- (NSString)userStatus;
- (id)dictionaryRepresentation;
- (int64_t)policyType;
- (void)encodeWithCoder:(id)a3;
- (void)setAdFormatType:(id)a3;
- (void)setAdType:(id)a3;
- (void)setContainerType:(id)a3;
- (void)setDataAdapters:(id)a3;
- (void)setExpression:(id)a3;
- (void)setPlacementDescriptor:(id)a3;
- (void)setTargetingExpression:(id)a3;
- (void)setUserStatus:(id)a3;
@end

@implementation APPCPolicyData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APPCPolicyData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APPCPolicyData *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    v5->_policyType = (int)[v4 decodeIntForKey:@"policyType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policyValue"];
    policyValue = v5->_policyValue;
    v5->_policyValue = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerType"];
    containerType = v5->_containerType;
    v5->_containerType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adType"];
    adType = v5->_adType;
    v5->_adType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expression"];
    expression = v5->_expression;
    v5->_expression = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v7 forKey:@"targetingExpression"];
    targetingExpression = v5->_targetingExpression;
    v5->_targetingExpression = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v9 forKey:@"dataAdapters"];
    dataAdapters = v5->_dataAdapters;
    v5->_dataAdapters = (NSDictionary *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placementDescriptor"];
    placementDescriptor = v5->_placementDescriptor;
    v5->_placementDescriptor = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adFormatType"];
    adFormatType = v5->_adFormatType;
    v5->_adFormatType = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userStatus"];
    userStatus = v5->_userStatus;
    v5->_userStatus = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isXLFormat"];
    isXLFormat = v5->_isXLFormat;
    v5->_isXLFormat = (NSNumber *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:-[APPCPolicyData policyType](self, "policyType") forKey:@"policyType"];
  v5 = [(APPCPolicyData *)self policyValue];
  [v4 encodeObject:v5 forKey:@"policyValue"];

  uint64_t v6 = [(APPCPolicyData *)self containerType];
  [v4 encodeObject:v6 forKey:@"containerType"];

  v7 = [(APPCPolicyData *)self adType];
  [v4 encodeObject:v7 forKey:@"adType"];

  uint64_t v8 = [(APPCPolicyData *)self expression];
  [v4 encodeObject:v8 forKey:@"expression"];

  v9 = [(APPCPolicyData *)self targetingExpression];
  [v4 encodeObject:v9 forKey:@"targetingExpression"];

  uint64_t v10 = [(APPCPolicyData *)self dataAdapters];
  [v4 encodeObject:v10 forKey:@"dataAdapters"];

  v11 = [(APPCPolicyData *)self placementDescriptor];
  [v4 encodeObject:v11 forKey:@"placementDescriptor"];

  uint64_t v12 = [(APPCPolicyData *)self adFormatType];
  [v4 encodeObject:v12 forKey:@"adFormatType"];

  v13 = [(APPCPolicyData *)self userStatus];
  [v4 encodeObject:v13 forKey:@"userStatus"];

  id v14 = [(APPCPolicyData *)self isXLFormat];
  [v4 encodeObject:v14 forKey:@"isXLFormat"];
}

- (APPCPolicyData)initWithPolicyType:(int64_t)a3 policyValue:(id)a4 isXLFormat:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)APPCPolicyData;
  v11 = [(APPCPolicyData *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_policyType = a3;
    objc_storeStrong((id *)&v11->_policyValue, a4);
    objc_storeStrong((id *)&v12->_isXLFormat, a5);
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithInt:LODWORD(self->_policyType)];
  [v3 setObject:v4 forKeyedSubscript:@"policyType"];

  [v3 setObject:self->_policyValue forKeyedSubscript:@"policyValue"];
  [v3 setObject:self->_isXLFormat forKeyedSubscript:@"isXLFormat"];
  [v3 setValue:self->_containerType forKey:@"containerType"];
  [v3 setValue:self->_adType forKey:@"adType"];
  [v3 setValue:self->_expression forKey:@"expression"];
  [v3 setValue:self->_placementDescriptor forKey:@"placementDescriptor"];
  [v3 setValue:self->_adFormatType forKey:@"adFormatType"];
  [v3 setValue:self->_userStatus forKey:@"userStatus"];
  [v3 setValue:self->_targetingExpression forKey:@"targetingExpression"];
  [v3 setValue:self->_dataAdapters forKey:@"dataAdapters"];

  return v3;
}

- (int64_t)policyType
{
  return self->_policyType;
}

- (NSNumber)policyValue
{
  return self->_policyValue;
}

- (NSNumber)isXLFormat
{
  return self->_isXLFormat;
}

- (NSString)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
}

- (NSArray)targetingExpression
{
  return self->_targetingExpression;
}

- (void)setTargetingExpression:(id)a3
{
}

- (NSDictionary)dataAdapters
{
  return self->_dataAdapters;
}

- (void)setDataAdapters:(id)a3
{
}

- (NSString)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(id)a3
{
}

- (NSString)adType
{
  return self->_adType;
}

- (void)setAdType:(id)a3
{
}

- (NSString)placementDescriptor
{
  return self->_placementDescriptor;
}

- (void)setPlacementDescriptor:(id)a3
{
}

- (NSString)adFormatType
{
  return self->_adFormatType;
}

- (void)setAdFormatType:(id)a3
{
}

- (NSString)userStatus
{
  return self->_userStatus;
}

- (void)setUserStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_adFormatType, 0);
  objc_storeStrong((id *)&self->_placementDescriptor, 0);
  objc_storeStrong((id *)&self->_adType, 0);
  objc_storeStrong((id *)&self->_containerType, 0);
  objc_storeStrong((id *)&self->_dataAdapters, 0);
  objc_storeStrong((id *)&self->_targetingExpression, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_isXLFormat, 0);

  objc_storeStrong((id *)&self->_policyValue, 0);
}

@end