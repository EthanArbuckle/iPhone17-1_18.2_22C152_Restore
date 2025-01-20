@interface USOSerializedGraphEdge
+ (BOOL)supportsSecureCoding;
- (NSString)edgeLabel;
- (USOSerializedGraphEdge)initWithCoder:(id)a3;
- (USOSerializedGraphEdge)initWithUsoElementId:(int)a3 fromVertex:(unint64_t)a4 toVertex:(unint64_t)a5 enumeration:(unsigned int)a6;
- (int)usoElementId;
- (unint64_t)fromVertex;
- (unint64_t)toVertex;
- (unsigned)enumeration;
- (void)encodeWithCoder:(id)a3;
- (void)setEdgeLabel:(id)a3;
- (void)setEnumeration:(unsigned int)a3;
- (void)setFromVertex:(unint64_t)a3;
- (void)setToVertex:(unint64_t)a3;
- (void)setUsoElementId:(int)a3;
@end

@implementation USOSerializedGraphEdge

- (void).cxx_destruct
{
}

- (void)setEdgeLabel:(id)a3
{
}

- (NSString)edgeLabel
{
  return self->_edgeLabel;
}

- (void)setEnumeration:(unsigned int)a3
{
  self->_enumeration = a3;
}

- (unsigned)enumeration
{
  return self->_enumeration;
}

- (void)setToVertex:(unint64_t)a3
{
  self->_toVertex = a3;
}

- (unint64_t)toVertex
{
  return self->_toVertex;
}

- (void)setFromVertex:(unint64_t)a3
{
  self->_fromVertex = a3;
}

- (unint64_t)fromVertex
{
  return self->_fromVertex;
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
  id v9 = a3;
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[USOSerializedGraphEdge usoElementId](self, "usoElementId"));
  [v9 encodeObject:v4 forKey:@"usoElementId"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[USOSerializedGraphEdge fromVertex](self, "fromVertex"));
  [v9 encodeObject:v5 forKey:@"fromVertex"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[USOSerializedGraphEdge toVertex](self, "toVertex"));
  [v9 encodeObject:v6 forKey:@"toVertex"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSerializedGraphEdge enumeration](self, "enumeration"));
  [v9 encodeObject:v7 forKey:@"enumeration"];

  v8 = [(USOSerializedGraphEdge *)self edgeLabel];
  [v9 encodeObject:v8 forKey:@"edgeLabel"];
}

- (USOSerializedGraphEdge)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSerializedGraphEdge;
  v5 = [(USOSerializedGraphEdge *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usoElementId"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fromVertex"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toVertex"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumeration"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edgeLabel"];
    v5->_usoElementId = [v6 intValue];
    v5->_fromVertex = [v7 unsignedLongLongValue];
    v5->_toVertex = [v8 unsignedLongLongValue];
    v5->_enumeration = [v9 unsignedIntValue];
    edgeLabel = v5->_edgeLabel;
    v5->_edgeLabel = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (USOSerializedGraphEdge)initWithUsoElementId:(int)a3 fromVertex:(unint64_t)a4 toVertex:(unint64_t)a5 enumeration:(unsigned int)a6
{
  self->_fromVertex = a4;
  self->_toVertex = a5;
  self->_usoElementId = a3;
  self->_enumeration = a6;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end