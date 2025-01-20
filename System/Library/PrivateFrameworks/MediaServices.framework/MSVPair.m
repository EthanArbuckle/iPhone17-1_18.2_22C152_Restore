@interface MSVPair
+ (BOOL)supportsSecureCoding;
+ (id)pairWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (MSVPair)initWithCoder:(id)a3;
- (MSVPair)initWithFirst:(id)a3 second:(id)a4;
- (id)description;
- (id)first;
- (id)second;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSVPair

- (id)second
{
  return self->_second;
}

- (id)first
{
  return self->_first;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{%@, %@}", self->_first, self->_second];
}

- (MSVPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSVPair;
  v9 = [(MSVPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id first = self->_first;
  id v5 = a3;
  [v5 encodeObject:first forKey:@"first"];
  [v5 encodeObject:self->_second forKey:@"second"];
}

- (MSVPair)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectForKey:@"first"];
  v6 = [v4 decodeObjectForKey:@"second"];

  id v7 = [(MSVPair *)self initWithFirst:v5 second:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MSVPair *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id first = self->_first;
      if (first == v5->_first || objc_msgSend(first, "isEqual:"))
      {
        id second = self->_second;
        if (second == v5->_second) {
          char v8 = 1;
        }
        else {
          char v8 = objc_msgSend(second, "isEqual:");
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  return [self->_second hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = (void *)[objc_alloc((Class)a1) initWithFirst:v7 second:v6];

  return v8;
}

@end