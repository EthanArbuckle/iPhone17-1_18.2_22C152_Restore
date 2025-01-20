@interface STVersionVectorNode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNode:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (STVersionVectorNode)initWithCoder:(id)a3;
- (STVersionVectorNode)initWithDictionaryRepresentation:(id)a3;
- (STVersionVectorNode)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)increment;
- (void)join:(id)a3;
- (void)setCount:(unint64_t)a3;
@end

@implementation STVersionVectorNode

- (STVersionVectorNode)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STVersionVectorNode;
  v5 = [(STVersionVectorNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_count = 0;
  }

  return v5;
}

- (STVersionVectorNode)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 allKeys];
  uint64_t v6 = [v5 firstObject];

  v7 = [(STVersionVectorNode *)self initWithIdentifier:v6];
  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [v8 objectForKeyedSubscript:@"c"];
      v7->_count = [v9 unsignedIntegerValue];
    }
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(STVersionVectorNode *)self identifier];
  v10 = v3;
  v8 = @"c";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[STVersionVectorNode count](self, "count"));
  objc_super v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return (NSDictionary *)v6;
}

- (void)increment
{
  unint64_t v3 = [(STVersionVectorNode *)self count] + 1;
  [(STVersionVectorNode *)self setCount:v3];
}

- (void)join:(id)a3
{
  id v4 = a3;
  v5 = [(STVersionVectorNode *)self identifier];
  uint64_t v6 = [v4 identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    unint64_t v8 = [v4 count];
    unint64_t v9 = [(STVersionVectorNode *)self count];
    if (v8 <= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v8;
    }
    self->_count = v10;
  }
  else
  {
    v11 = +[STLog versionVector];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[STVersionVectorNode join:](v11);
    }
  }
}

- (int64_t)compare:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v6 = [(STVersionVectorNode *)self identifier];
  int v7 = [v5 identifier];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"STVersionVectorNode.m" lineNumber:72 description:@"Cannot compare vector nodes with different identifiers"];
  }
  unint64_t v9 = [(STVersionVectorNode *)self count];
  if (v9 >= [v5 count])
  {
    unint64_t v11 = [(STVersionVectorNode *)self count];
    int64_t v10 = v11 > [v5 count];
  }
  else
  {
LABEL_5:
    int64_t v10 = -1;
  }

  return v10;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(STVersionVectorNode *)self identifier];
  id v5 = [v3 stringWithFormat:@"%@: %lu", v4, -[STVersionVectorNode count](self, "count")];

  return v5;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(STVersionVectorNode *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p { identifier = %@, count = %lu }>", v4, self, v5, -[STVersionVectorNode count](self, "count")];

  return v6;
}

- (BOOL)isEqualToNode:(id)a3
{
  uint64_t v4 = (STVersionVectorNode *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v6 = [(STVersionVectorNode *)v4 identifier];
    int v7 = [(STVersionVectorNode *)self identifier];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(STVersionVectorNode *)v5 count];
      BOOL v9 = v8 == [(STVersionVectorNode *)self count];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (STVersionVectorNode *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v6 = [(STVersionVectorNode *)v4 identifier];
    int v7 = [(STVersionVectorNode *)self identifier];
    char v8 = [v6 isEqual:v7];
  }
  return v8;
}

- (unint64_t)hash
{
  v2 = [(STVersionVectorNode *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STVersionVectorNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STVersionVectorNode;
  id v5 = [(STVersionVectorNode *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"count"];
    v5->_count = [v8 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_count];
  [v5 encodeObject:v6 forKey:@"count"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:self->_identifier];
  [v4 setCount:self->_count];
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

- (void)join:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DA519000, log, OS_LOG_TYPE_FAULT, "Cannot join vector nodes with different identifiers", v1, 2u);
}

@end