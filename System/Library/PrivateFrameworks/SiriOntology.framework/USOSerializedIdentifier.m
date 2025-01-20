@interface USOSerializedIdentifier
+ (BOOL)supportsSecureCoding;
- (NSNumber)groupIndex;
- (NSNumber)interpretationGroup;
- (NSNumber)probability;
- (NSNumber)sourceComponent;
- (NSString)appBundleId;
- (NSString)namespaceString;
- (NSString)value;
- (USOSerializedIdentifier)initWithCoder:(id)a3;
- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6;
- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7;
- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8;
- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8 groupIndex:(id)a9;
- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8 groupIndex:(id)a9 interpretationGroup:(id)a10;
- (unint64_t)nodeIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setNodeIndex:(unint64_t)a3;
@end

@implementation USOSerializedIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpretationGroup, 0);
  objc_storeStrong((id *)&self->_groupIndex, 0);
  objc_storeStrong((id *)&self->_sourceComponent, 0);
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_namespaceString, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (NSNumber)interpretationGroup
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)groupIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)sourceComponent
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)probability
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)namespaceString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNodeIndex:(unint64_t)a3
{
  self->_nodeIndex = a3;
}

- (unint64_t)nodeIndex
{
  return self->_nodeIndex;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", -[USOSerializedIdentifier nodeIndex](self, "nodeIndex"));
  [v5 encodeObject:v6 forKey:@"nodeIndex"];

  v7 = [(USOSerializedIdentifier *)self value];
  [v5 encodeObject:v7 forKey:@"value"];

  v8 = [(USOSerializedIdentifier *)self appBundleId];
  [v5 encodeObject:v8 forKey:@"appBundleId"];

  v9 = [(USOSerializedIdentifier *)self namespaceString];
  [v5 encodeObject:v9 forKey:@"namespaceString"];

  v10 = [(USOSerializedIdentifier *)self probability];
  [v5 encodeObject:v10 forKey:@"probability"];

  v11 = [(USOSerializedIdentifier *)self sourceComponent];
  [v5 encodeObject:v11 forKey:@"sourceComponent"];

  v12 = [(USOSerializedIdentifier *)self groupIndex];
  [v5 encodeObject:v12 forKey:@"groupIndex"];

  id v13 = [(USOSerializedIdentifier *)self interpretationGroup];
  [v5 encodeObject:v13 forKey:@"interpretationGroup"];
}

- (USOSerializedIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)USOSerializedIdentifier;
  id v5 = [(USOSerializedIdentifier *)&v22 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeIndex"];
    v5->_nodeIndex = [v6 unsignedLongLongValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespaceString"];
    namespaceString = v5->_namespaceString;
    v5->_namespaceString = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"probability"];
    probability = v5->_probability;
    v5->_probability = (NSNumber *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceComponent"];
    sourceComponent = v5->_sourceComponent;
    v5->_sourceComponent = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIndex"];
    groupIndex = v5->_groupIndex;
    v5->_groupIndex = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interpretationGroup"];
    interpretationGroup = v5->_interpretationGroup;
    v5->_interpretationGroup = (NSNumber *)v19;
  }
  return v5;
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8 groupIndex:(id)a9 interpretationGroup:(id)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)USOSerializedIdentifier;
  v18 = [(USOSerializedIdentifier *)&v27 init];
  uint64_t v19 = v18;
  if (v18)
  {
    v18->_nodeIndex = a3;
    objc_storeStrong((id *)&v18->_value, a4);
    objc_storeStrong((id *)&v19->_appBundleId, a5);
    objc_storeStrong((id *)&v19->_namespaceString, a6);
    objc_storeStrong((id *)&v19->_probability, a7);
    objc_storeStrong((id *)&v19->_sourceComponent, a8);
    objc_storeStrong((id *)&v19->_groupIndex, a9);
    objc_storeStrong((id *)&v19->_interpretationGroup, a10);
  }

  return v19;
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8 groupIndex:(id)a9
{
  return [(USOSerializedIdentifier *)self initWithNodeIndex:a3 value:a4 appBundleId:a5 namespaceString:a6 probability:a7 sourceComponent:a8 groupIndex:a9 interpretationGroup:0];
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7 sourceComponent:(id)a8
{
  return [(USOSerializedIdentifier *)self initWithNodeIndex:a3 value:a4 appBundleId:a5 namespaceString:a6 probability:a7 sourceComponent:a8 groupIndex:0];
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6 probability:(id)a7
{
  return [(USOSerializedIdentifier *)self initWithNodeIndex:a3 value:a4 appBundleId:a5 namespaceString:a6 probability:a7 sourceComponent:0];
}

- (USOSerializedIdentifier)initWithNodeIndex:(unint64_t)a3 value:(id)a4 appBundleId:(id)a5 namespaceString:(id)a6
{
  return [(USOSerializedIdentifier *)self initWithNodeIndex:a3 value:a4 appBundleId:a5 namespaceString:a6 probability:0 sourceComponent:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end