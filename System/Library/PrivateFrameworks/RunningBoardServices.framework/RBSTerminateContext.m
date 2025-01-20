@interface RBSTerminateContext
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)defaultContextWithExplanation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)preventIfBeingDebugged;
- (BOOL)shouldTerminatePlugIns;
- (NSArray)attributes;
- (NSDictionary)additionalPayload;
- (NSString)description;
- (NSString)explanation;
- (RBSTerminateContext)init;
- (RBSTerminateContext)initWithExplanation:(id)a3;
- (RBSTerminateContext)initWithRBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)exceptionCode;
- (unint64_t)hash;
- (unint64_t)reportType;
- (unsigned)exceptionDomain;
- (unsigned)maximumTerminationResistance;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setAdditionalPayload:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setExceptionCode:(unint64_t)a3;
- (void)setExceptionDomain:(unsigned int)a3;
- (void)setExplanation:(id)a3;
- (void)setMaximumTerminationResistance:(unsigned __int8)a3;
- (void)setPreventIfBeingDebugged:(BOOL)a3;
- (void)setReportType:(unint64_t)a3;
@end

@implementation RBSTerminateContext

+ (id)defaultContextWithExplanation:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithExplanation:v4];

  [v5 setReportType:0];
  [v5 setExceptionCode:3735905538];
  [v5 setPreventIfBeingDebugged:0];
  [v5 setMaximumTerminationResistance:40];
  return v5;
}

- (RBSTerminateContext)init
{
  return [(RBSTerminateContext *)self initWithExplanation:@"<no explanation given>"];
}

- (RBSTerminateContext)initWithExplanation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSTerminateContext;
  v5 = [(RBSTerminateContext *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_maximumTerminationResistance = 40;
    uint64_t v7 = [v4 copy];
    explanation = v6->_explanation;
    v6->_explanation = (NSString *)v7;
  }
  return v6;
}

- (void)setExplanation:(id)a3
{
  self->_explanation = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSString)description
{
  NSUInteger v3 = [(NSArray *)self->_attributes count];
  id v4 = [NSString alloc];
  uint64_t v5 = [(id)objc_opt_class() description];
  unsigned int exceptionDomain = self->_exceptionDomain;
  if (exceptionDomain) {
    uint64_t v7 = @" domain:";
  }
  else {
    uint64_t v7 = &stru_1EE2E2768;
  }
  if (exceptionDomain)
  {
    v31 = [NSNumber numberWithUnsignedInt:self->_exceptionDomain];
  }
  else
  {
    v31 = &stru_1EE2E2768;
  }
  unint64_t exceptionCode = self->_exceptionCode;
  v9 = @" code:";
  if (!exceptionCode) {
    v9 = &stru_1EE2E2768;
  }
  v27 = v9;
  if (exceptionCode)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"0x%08X", exceptionCode);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = &stru_1EE2E2768;
  }
  explanation = self->_explanation;
  unint64_t reportType = self->_reportType;
  if (explanation) {
    v12 = @" explanation:";
  }
  else {
    v12 = &stru_1EE2E2768;
  }
  if (explanation) {
    v13 = (__CFString *)self->_explanation;
  }
  else {
    v13 = &stru_1EE2E2768;
  }
  v30 = v4;
  v28 = (void *)v5;
  if (reportType > 2) {
    v14 = @"(undefined)";
  }
  else {
    v14 = off_1E57416C8[reportType];
  }
  uint64_t v15 = NSStringFromRBSTerminationResistance(self->_maximumTerminationResistance);
  v16 = (void *)v15;
  if (v3)
  {
    v17 = [(NSArray *)self->_attributes componentsJoinedByString:@",\n\t"];
    v23 = v13;
    v25 = v14;
    v18 = v29;
    v19 = v28;
    v20 = v31;
    v21 = (void *)[v30 initWithFormat:@"<%@|%@%@%@%@%@%@ reportType:%@ maxTerminationResistance:%@%@%@%@>", v28, v7, v31, v27, v29, v12, v23, v25, v16, @" attrs:[\n\t", v17, @"\n\t]"];
  }
  else
  {
    v24 = v13;
    v26 = v14;
    v18 = v29;
    v19 = v28;
    v20 = v31;
    v21 = (void *)[v30 initWithFormat:@"<%@|%@%@%@%@%@%@ reportType:%@ maxTerminationResistance:%@%@%@%@>", v28, v7, v31, v27, v29, v12, v24, v26, v15, &stru_1EE2E2768, &stru_1EE2E2768, &stru_1EE2E2768];
  }

  if (exceptionCode) {
  if (exceptionDomain)
  }

  return (NSString *)v21;
}

- (unint64_t)hash
{
  unint64_t v2 = 0xBF58476D1CE4E5B9 * (self->_exceptionDomain ^ ((unint64_t)self->_exceptionDomain >> 30));
  unint64_t v3 = self->_exceptionCode ^ (self->_exceptionCode >> 30);
  unint64_t v4 = (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v3) ^ ((0xBF58476D1CE4E5B9 * v3) >> 27))) ^ (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27)));
  return v4 ^ (v4 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (RBSTerminateContext *)a3;
  if (self == v4) {
    goto LABEL_17;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || self->_reportType != v4->_reportType
    || self->_maximumTerminationResistance != v4->_maximumTerminationResistance
    || self->_exceptionDomain != v4->_exceptionDomain
    || self->_exceptionCode != v4->_exceptionCode
    || self->_preventIfBeingDebugged != v4->_preventIfBeingDebugged
    || (explanation = self->_explanation, explanation != v4->_explanation)
    && !-[NSString isEqualToString:](explanation, "isEqualToString:")
    || (attributes = self->_attributes, attributes != v4->_attributes)
    && !-[NSArray isEqualToArray:](attributes, "isEqualToArray:"))
  {
    char v10 = 0;
    goto LABEL_18;
  }
  additionalPayload = self->_additionalPayload;
  v9 = v4->_additionalPayload;
  if (additionalPayload == v9)
  {
LABEL_17:
    char v10 = 1;
    goto LABEL_18;
  }
  char v10 = 0;
  if (additionalPayload && v9) {
    char v10 = -[NSDictionary isEqual:](additionalPayload, "isEqual:");
  }
LABEL_18:

  return v10;
}

- (BOOL)shouldTerminatePlugIns
{
  return self->_maximumTerminationResistance > 0x27u;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext exceptionDomain](self, "exceptionDomain"), @"_exceptionDomain");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext exceptionCode](self, "exceptionCode"), @"_exceptionCode");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext maximumTerminationResistance](self, "maximumTerminationResistance"), @"_maximumTerminationResistance");
  objc_msgSend(v4, "encodeBool:forKey:", -[RBSTerminateContext preventIfBeingDebugged](self, "preventIfBeingDebugged"), @"_preventIfBeingDebugged");
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSTerminateContext reportType](self, "reportType"), @"_reportType");
  uint64_t v5 = [(RBSTerminateContext *)self attributes];
  [v4 encodeObject:v5 forKey:@"_attributes"];

  v6 = [(RBSTerminateContext *)self explanation];
  [v4 encodeObject:v6 forKey:@"_explanation"];

  RBSXPCPackObject(self->_additionalPayload);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeXPCObject:v7 forKey:@"_additionalPayload"];
}

- (RBSTerminateContext)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_explanation"];
  v6 = [(RBSTerminateContext *)self initWithExplanation:v5];

  if (v6)
  {
    -[RBSTerminateContext setExceptionDomain:](v6, "setExceptionDomain:", [v4 decodeInt64ForKey:@"_exceptionDomain"]);
    -[RBSTerminateContext setExceptionCode:](v6, "setExceptionCode:", [v4 decodeInt64ForKey:@"_exceptionCode"]);
    -[RBSTerminateContext setMaximumTerminationResistance:](v6, "setMaximumTerminationResistance:", [v4 decodeInt64ForKey:@"_maximumTerminationResistance"]);
    -[RBSTerminateContext setPreventIfBeingDebugged:](v6, "setPreventIfBeingDebugged:", [v4 decodeBoolForKey:@"_preventIfBeingDebugged"]);
    -[RBSTerminateContext setReportType:](v6, "setReportType:", [v4 decodeInt64ForKey:@"_reportType"]);
    uint64_t v7 = objc_opt_class();
    v8 = [v4 decodeCollectionOfClass:v7 containingClass:objc_opt_class() forKey:@"_attributes"];
    [(RBSTerminateContext *)v6 setAttributes:v8];

    v9 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"_additionalPayload"];
    char v10 = RBSXPCUnpackObject(v9);
    [(RBSTerminateContext *)v6 setAdditionalPayload:v10];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[RBSTerminateContext allocWithZone:a3] initWithExplanation:self->_explanation];
  [(RBSTerminateContext *)v4 setExceptionCode:self->_exceptionCode];
  [(RBSTerminateContext *)v4 setExceptionDomain:self->_exceptionDomain];
  [(RBSTerminateContext *)v4 setMaximumTerminationResistance:self->_maximumTerminationResistance];
  [(RBSTerminateContext *)v4 setPreventIfBeingDebugged:self->_preventIfBeingDebugged];
  [(RBSTerminateContext *)v4 setReportType:self->_reportType];
  [(RBSTerminateContext *)v4 setAttributes:self->_attributes];
  [(RBSTerminateContext *)v4 setAdditionalPayload:self->_additionalPayload];
  return v4;
}

- (NSDictionary)additionalPayload
{
  return self->_additionalPayload;
}

- (void)setAdditionalPayload:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (unint64_t)reportType
{
  return self->_reportType;
}

- (void)setReportType:(unint64_t)a3
{
  self->_unint64_t reportType = a3;
}

- (unsigned)exceptionDomain
{
  return self->_exceptionDomain;
}

- (void)setExceptionDomain:(unsigned int)a3
{
  self->_unsigned int exceptionDomain = a3;
}

- (unint64_t)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(unint64_t)a3
{
  self->_unint64_t exceptionCode = a3;
}

- (unsigned)maximumTerminationResistance
{
  return self->_maximumTerminationResistance;
}

- (void)setMaximumTerminationResistance:(unsigned __int8)a3
{
  self->_maximumTerminationResistance = a3;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (BOOL)preventIfBeingDebugged
{
  return self->_preventIfBeingDebugged;
}

- (void)setPreventIfBeingDebugged:(BOOL)a3
{
  self->_preventIfBeingDebugged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_additionalPayload, 0);
}

@end