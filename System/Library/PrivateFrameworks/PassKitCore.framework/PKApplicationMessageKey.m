@interface PKApplicationMessageKey
+ (BOOL)supportsSecureCoding;
+ (id)createWithSource:(int64_t)a3 identifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (PKApplicationMessageKey)init;
- (PKApplicationMessageKey)initWithCoder:(id)a3;
- (int64_t)source;
- (unint64_t)hash;
- (void)_initWithSource:(void *)a3 identifier:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageKey

+ (id)createWithSource:(int64_t)a3 identifier:(id)a4
{
  id v5 = a4;
  v6 = -[PKApplicationMessageKey _initWithSource:identifier:]([PKApplicationMessageKey alloc], a3, v5);

  return v6;
}

- (void)_initWithSource:(void *)a3 identifier:
{
  id v5 = a3;
  v6 = v5;
  if (a1 && v5)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKApplicationMessageKey;
    v7 = objc_msgSendSuper2(&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7[1] = a2;
      uint64_t v9 = [v6 copy];
      v10 = (void *)v8[2];
      v8[2] = v9;
    }
    a1 = v8;
    v11 = a1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PKApplicationMessageKey)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplicationMessageKey;
  id v5 = [(PKApplicationMessageKey *)&v11 init];
  if (v5
    && (v5->_source = [v4 decodeIntegerForKey:@"source"],
        [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        !v5->_identifier))
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationMessageKey" code:0 userInfo:0];
    [v4 failWithError:v9];

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t source = self->_source;
  id v5 = a3;
  [v5 encodeInteger:source forKey:@"source"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (self)
    {
      if (self->_source == v5[1])
      {
        identifier = self->_identifier;
        v8 = (NSString *)v6[2];
        if (identifier && v8) {
          LOBYTE(self) = -[NSString isEqual:](identifier, "isEqual:");
        }
        else {
          LOBYTE(self) = identifier == v8;
        }
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (unint64_t)hash
{
  return SipHash();
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end