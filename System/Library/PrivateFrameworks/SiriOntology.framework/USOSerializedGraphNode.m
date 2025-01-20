@interface USOSerializedGraphNode
+ (BOOL)supportsSecureCoding;
- (NSArray)normalizedStringPayloads;
- (NSNumber)integerPayload;
- (NSNumber)usoVerbId;
- (NSString)entityLabel;
- (NSString)stringPayload;
- (NSString)verbLabel;
- (USOSerializedGraphNode)initWithCoder:(id)a3;
- (USOSerializedGraphNode)initWithUsoElementId:(int)a3;
- (int)usoElementId;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityLabel:(id)a3;
- (void)setIntegerPayload:(id)a3;
- (void)setNormalizedStringPayloads:(id)a3;
- (void)setStringPayload:(id)a3;
- (void)setUsoElementId:(int)a3;
- (void)setUsoVerbId:(id)a3;
- (void)setVerbLabel:(id)a3;
@end

@implementation USOSerializedGraphNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedStringPayloads, 0);
  objc_storeStrong((id *)&self->_verbLabel, 0);
  objc_storeStrong((id *)&self->_entityLabel, 0);
  objc_storeStrong((id *)&self->_stringPayload, 0);
  objc_storeStrong((id *)&self->_integerPayload, 0);
  objc_storeStrong((id *)&self->_usoVerbId, 0);
}

- (void)setNormalizedStringPayloads:(id)a3
{
}

- (NSArray)normalizedStringPayloads
{
  return self->_normalizedStringPayloads;
}

- (void)setVerbLabel:(id)a3
{
}

- (NSString)verbLabel
{
  return self->_verbLabel;
}

- (void)setEntityLabel:(id)a3
{
}

- (NSString)entityLabel
{
  return self->_entityLabel;
}

- (void)setStringPayload:(id)a3
{
}

- (NSString)stringPayload
{
  return self->_stringPayload;
}

- (void)setIntegerPayload:(id)a3
{
}

- (NSNumber)integerPayload
{
  return self->_integerPayload;
}

- (void)setUsoVerbId:(id)a3
{
}

- (NSNumber)usoVerbId
{
  return self->_usoVerbId;
}

- (void)setUsoElementId:(int)a3
{
  self->_usoElementId = a3;
}

- (int)usoElementId
{
  return self->_usoElementId;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[USOSerializedGraphNode usoElementId](self, "usoElementId"));
  [v11 encodeObject:v4 forKey:@"usoElementId"];

  v5 = [(USOSerializedGraphNode *)self usoVerbId];
  [v11 encodeObject:v5 forKey:@"usoVerbId"];

  v6 = [(USOSerializedGraphNode *)self integerPayload];
  [v11 encodeObject:v6 forKey:@"integerPayload"];

  v7 = [(USOSerializedGraphNode *)self stringPayload];
  [v11 encodeObject:v7 forKey:@"stringPayload"];

  v8 = [(USOSerializedGraphNode *)self entityLabel];
  [v11 encodeObject:v8 forKey:@"entityLabel"];

  v9 = [(USOSerializedGraphNode *)self verbLabel];
  [v11 encodeObject:v9 forKey:@"verbLabel"];

  v10 = [(USOSerializedGraphNode *)self normalizedStringPayloads];
  [v11 encodeObject:v10 forKey:@"normalizedStringPayloads"];
}

- (USOSerializedGraphNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)USOSerializedGraphNode;
  v5 = [(USOSerializedGraphNode *)&v29 init];
  if (v5)
  {
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usoElementId"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usoVerbId"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"integerPayload"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringPayload"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityLabel"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verbLabel"];
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v27 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v27 forKey:@"normalizedStringPayloads"];
    v5->_usoElementId = [v28 intValue];
    usoVerbId = v5->_usoVerbId;
    v5->_usoVerbId = v6;
    v15 = v6;

    integerPayload = v5->_integerPayload;
    v5->_integerPayload = v7;
    v17 = v7;

    stringPayload = v5->_stringPayload;
    v5->_stringPayload = v8;
    v19 = v8;

    entityLabel = v5->_entityLabel;
    v5->_entityLabel = v9;
    v21 = v9;

    verbLabel = v5->_verbLabel;
    v5->_verbLabel = v10;
    v23 = v10;

    normalizedStringPayloads = v5->_normalizedStringPayloads;
    v5->_normalizedStringPayloads = (NSArray *)v13;

    v25 = v5;
  }

  return v5;
}

- (USOSerializedGraphNode)initWithUsoElementId:(int)a3
{
  self->_usoElementId = a3;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end