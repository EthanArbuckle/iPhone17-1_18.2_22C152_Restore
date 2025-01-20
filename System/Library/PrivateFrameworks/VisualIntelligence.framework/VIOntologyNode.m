@interface VIOntologyNode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)knowledgeGraphID;
- (NSString)labelDebugDescription;
- (VIOntologyNode)initWithCoder:(id)a3;
- (VIOntologyNode)initWithKnowledgeGraphID:(id)a3 labelDebugDescription:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VIOntologyNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VIOntologyNode)initWithKnowledgeGraphID:(id)a3 labelDebugDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VIOntologyNode;
  v8 = [(VIOntologyNode *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    knowledgeGraphID = v8->_knowledgeGraphID;
    v8->_knowledgeGraphID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    labelDebugDescription = v8->_labelDebugDescription;
    v8->_labelDebugDescription = (NSString *)v11;
  }
  return v8;
}

- (VIOntologyNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VIOntologyNode *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"knowledgeGraphID"];
    knowledgeGraphID = v5->_knowledgeGraphID;
    v5->_knowledgeGraphID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"labelDebugDescription"];
    labelDebugDescription = v5->_labelDebugDescription;
    v5->_labelDebugDescription = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  knowledgeGraphID = self->_knowledgeGraphID;
  id v5 = a3;
  [v5 encodeObject:knowledgeGraphID forKey:@"knowledgeGraphID"];
  [v5 encodeObject:self->_labelDebugDescription forKey:@"labelDebugDescription"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VIOntologyNode *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    knowledgeGraphID = self->_knowledgeGraphID;
    uint64_t v8 = [(VIOntologyNode *)v6 knowledgeGraphID];
    if (VIObjectIsEqual((unint64_t)knowledgeGraphID, (uint64_t)v8))
    {
      labelDebugDescription = self->_labelDebugDescription;
      v10 = [(VIOntologyNode *)v6 labelDebugDescription];
      char IsEqual = VIObjectIsEqual((unint64_t)labelDebugDescription, (uint64_t)v10);
    }
    else
    {
      char IsEqual = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_knowledgeGraphID hash];
  return [(NSString *)self->_labelDebugDescription hash] ^ v3;
}

- (NSString)knowledgeGraphID
{
  return self->_knowledgeGraphID;
}

- (NSString)labelDebugDescription
{
  return self->_labelDebugDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelDebugDescription, 0);
  objc_storeStrong((id *)&self->_knowledgeGraphID, 0);
}

@end