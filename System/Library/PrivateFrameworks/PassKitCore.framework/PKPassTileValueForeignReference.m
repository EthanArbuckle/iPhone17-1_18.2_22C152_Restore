@interface PKPassTileValueForeignReference
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (NSString)content;
- (PKPassTileValueForeignReference)initWithCoder:(id)a3;
- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4;
- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4;
- (int64_t)foreignReferenceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setForeignReferenceType:(int64_t)a3;
@end

@implementation PKPassTileValueForeignReference

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassTileValueForeignReference;
  if ([(PKPassTileValue *)&v11 _setUpWithDictionary:v4]
    && ([v4 PKStringForKey:@"content"],
        v5 = (NSString *)objc_claimAutoreleasedReturnValue(),
        content = self->_content,
        self->_content = v5,
        content,
        self->_content))
  {
    v7 = [v4 PKStringForKey:@"foreignReferenceType"];
    int64_t v8 = PKPassTileForeignReferenceTypeFromString(v7);
    self->_foreignReferenceType = v8;
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileValueForeignReference;
  v5 = [(PKPassTileValue *)&v7 createResolvedValueWithBundle:a3 privateBundle:a4];
  objc_storeStrong(v5 + 3, self->_content);
  v5[4] = self->_foreignReferenceType;
  return v5;
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = v6;
  if (self->_foreignReferenceType != 1 || !self->_content)
  {
    objc_super v11 = 0;
    goto LABEL_14;
  }
  int64_t v8 = [v6 balanceModel];
  BOOL v9 = [v8 balanceForIdentifier:self->_content];

  if (v9)
  {
    switch(a4)
    {
      case 2:
        uint64_t v10 = [v9 localizedDescription];
        goto LABEL_12;
      case 1:
        uint64_t v10 = [v9 formattedValue];
        goto LABEL_12;
      case 0:
        uint64_t v10 = [v9 localizedTitle];
LABEL_12:
        objc_super v11 = (void *)v10;
        goto LABEL_13;
    }
  }
  objc_super v11 = 0;
LABEL_13:

LABEL_14:
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValueForeignReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileValueForeignReference;
  v5 = [(PKPassTileValue *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (NSString *)v6;

    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foreignReferenceType"];
    v5->_foreignReferenceType = PKPassTileForeignReferenceTypeFromString(v8);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueForeignReference;
  id v4 = a3;
  [(PKPassTileValue *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, @"content", v6.receiver, v6.super_class);
  if (self->_foreignReferenceType == 1) {
    v5 = @"balance";
  }
  else {
    v5 = 0;
  }
  [v4 encodeObject:v5 forKey:@"foreignReferenceType"];
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueForeignReference;
  id v7 = [(PKPassTileValue *)&v6 hash];
  NSUInteger v3 = [(NSString *)self->_content hash];
  int64_t foreignReferenceType = self->_foreignReferenceType;
  NSUInteger v8 = v3;
  int64_t v9 = foreignReferenceType;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileValueForeignReference;
  if ([(PKPassTileValue *)&v14 _isEqual:v4])
  {
    v5 = (id *)v4;
    content = self->_content;
    id v7 = (NSString *)v5[3];
    NSUInteger v8 = content;
    if (v7 != v8)
    {
      int64_t v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
      }
      else
      {
        BOOL v12 = [(NSString *)v7 isEqualToString:v8];

        if (v12) {
          goto LABEL_12;
        }
      }
      BOOL v11 = 0;
      goto LABEL_14;
    }

LABEL_12:
    BOOL v11 = v5[4] == self->_foreignReferenceType;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (int64_t)foreignReferenceType
{
  return self->_foreignReferenceType;
}

- (void)setForeignReferenceType:(int64_t)a3
{
  self->_int64_t foreignReferenceType = a3;
}

- (void).cxx_destruct
{
}

@end