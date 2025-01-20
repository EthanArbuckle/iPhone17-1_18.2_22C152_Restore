@interface ICAssetGeneration
- (BOOL)isEqual:(id)a3;
- (ICAssetGeneration)init;
- (ICAssetGeneration)initWithNumber:(int64_t)a3 identifier:(id)a4;
- (ICAssetGeneration)initWithRawValue:(id)a3;
- (NSString)identifier;
- (NSString)rawValue;
- (id)description;
- (id)nextGeneration;
- (int64_t)number;
- (unint64_t)hash;
@end

@implementation ICAssetGeneration

- (ICAssetGeneration)initWithNumber:(int64_t)a3 identifier:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (a3 >= 1 && [v7 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)ICAssetGeneration;
    v9 = [(ICAssetGeneration *)&v13 init];
    v10 = v9;
    if (v9)
    {
      v9->_number = a3;
      objc_storeStrong((id *)&v9->_identifier, a4);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ICAssetGeneration)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICAssetGeneration;
  v2 = [(ICAssetGeneration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_number = 1;
    v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;
  }
  return v3;
}

- (ICAssetGeneration)initWithRawValue:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"_"];
  if ([v4 count] == 2)
  {
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = [v5 integerValue];

    id v7 = [v4 lastObject];
    self = [(ICAssetGeneration *)self initWithNumber:v6 identifier:v7];

    objc_super v8 = self;
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)nextGeneration
{
  v3 = [ICAssetGeneration alloc];
  int64_t v4 = [(ICAssetGeneration *)self number] + 1;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [(ICAssetGeneration *)v3 initWithNumber:v4 identifier:v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[ICAssetGeneration number](self, "number"));
  id v7 = [(ICAssetGeneration *)self identifier];
  objc_super v8 = [v3 stringWithFormat:@"<%@: %p, number: %@, identifier: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();

  uint64_t v6 = [(ICAssetGeneration *)self rawValue];
  id v7 = [v5 rawValue];
  objc_super v8 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v6) {
    v9 = 0;
  }
  else {
    v9 = v6;
  }
  unint64_t v10 = v9;
  if (v8 == v7) {
    v11 = 0;
  }
  else {
    v11 = v7;
  }
  unint64_t v12 = v11;
  objc_super v13 = (void *)v12;
  if (v10 | v12)
  {
    if (v10) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14) {
      char v15 = 0;
    }
    else {
      char v15 = [(id)v10 isEqual:v12];
    }
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICAssetGeneration *)self rawValue];
    uint64_t v5 = [v4 hash];
    self->_hash = ICHashWithHashKeys(v5, v6, v7, v8, v9, v10, v11, v12, 0);

    return self->_hash;
  }
  return result;
}

- (NSString)rawValue
{
  v3 = NSString;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[ICAssetGeneration number](self, "number"));
  uint64_t v5 = [(ICAssetGeneration *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@%@%@", v4, @"_", v5];

  return (NSString *)v6;
}

- (int64_t)number
{
  return self->_number;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end