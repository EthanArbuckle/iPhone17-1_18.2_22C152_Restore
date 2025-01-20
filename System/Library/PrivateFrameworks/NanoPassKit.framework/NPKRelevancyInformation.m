@interface NPKRelevancyInformation
+ (BOOL)supportsSecureCoding;
- (NPKRelevancyInformation)initWithCoder:(id)a3;
- (NPKRelevancyInformation)initWithPassUniqueID:(id)a3 groupID:(id)a4 relevantText:(id)a5;
- (NSString)groupID;
- (NSString)passUniqueID;
- (NSString)relevantText;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setPassUniqueID:(id)a3;
- (void)setRelevantText:(id)a3;
@end

@implementation NPKRelevancyInformation

- (NPKRelevancyInformation)initWithPassUniqueID:(id)a3 groupID:(id)a4 relevantText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NPKRelevancyInformation;
  v12 = [(NPKRelevancyInformation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_passUniqueID, a3);
    objc_storeStrong((id *)&v13->_groupID, a4);
    objc_storeStrong((id *)&v13->_relevantText, a5);
  }

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p\n\tpassUniqueID: %@\n\tgroupID: %@\n\trelevantText: %@\n>", objc_opt_class(), self, self->_passUniqueID, self->_groupID, self->_relevantText];
}

- (NPKRelevancyInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKRelevancyInformation;
  v5 = [(NPKRelevancyInformation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueID"];
    passUniqueID = v5->_passUniqueID;
    v5->_passUniqueID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevantText"];
    relevantText = v5->_relevantText;
    v5->_relevantText = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  passUniqueID = self->_passUniqueID;
  id v5 = a3;
  [v5 encodeObject:passUniqueID forKey:@"passUniqueID"];
  [v5 encodeObject:self->_groupID forKey:@"groupID"];
  [v5 encodeObject:self->_relevantText forKey:@"relevantText"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)passUniqueID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPassUniqueID:(id)a3
{
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGroupID:(id)a3
{
}

- (NSString)relevantText
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRelevantText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

@end