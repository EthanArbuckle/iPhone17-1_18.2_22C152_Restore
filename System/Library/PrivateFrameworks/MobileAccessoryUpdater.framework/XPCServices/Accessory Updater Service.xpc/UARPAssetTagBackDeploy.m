@interface UARPAssetTagBackDeploy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UARPAssetTagBackDeploy)init;
- (UARPAssetTagBackDeploy)initWithChar1:(char)a3 char2:(char)a4 char3:(char)a5 char4:(char)a6;
- (UARPAssetTagBackDeploy)initWithCoder:(id)a3;
- (UARPAssetTagBackDeploy)initWithString:(id)a3;
- (char)char1;
- (char)char2;
- (char)char3;
- (char)char4;
- (const)decodeCharForKey:(id)a3 key:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)tag;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPAssetTagBackDeploy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetTagBackDeploy)init
{
  return 0;
}

- (UARPAssetTagBackDeploy)initWithChar1:(char)a3 char2:(char)a4 char3:(char)a5 char4:(char)a6
{
  v14.receiver = self;
  v14.super_class = (Class)UARPAssetTagBackDeploy;
  v10 = [(UARPAssetTagBackDeploy *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_char1 = a3;
    v10->_char2 = a4;
    v10->_char3 = a5;
    v10->_char4 = a6;
    LOBYTE(v13) = a3;
    BYTE1(v13) = a4;
    BYTE2(v13) = a5;
    HIBYTE(v13) = a6;
    v10->_tag = uarpPayloadTagPack(&v13);
  }
  return v11;
}

- (UARPAssetTagBackDeploy)initWithString:(id)a3
{
  id v4 = a3;
  if ([v4 length] == (id)4)
  {
    v5 = (char *)[v4 UTF8String];
    self = [(UARPAssetTagBackDeploy *)self initWithChar1:*v5 char2:v5[1] char3:v5[2] char4:v5[3]];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%c%c%c%c", self->_char1, self->_char2, self->_char3, self->_char4];
}

- (const)decodeCharForKey:(id)a3 key:(id)a4
{
  uint64_t v5 = 0;
  result = (const char *)[a3 decodeBytesForKey:a4 returnedLength:&v5];
  if (!v5) {
    return 0;
  }
  return result;
}

- (UARPAssetTagBackDeploy)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UARPAssetTagBackDeploy *)self decodeCharForKey:v4 key:@"char1"];
  if (v5)
  {
    v6 = [(UARPAssetTagBackDeploy *)self decodeCharForKey:v4 key:@"char2"];
    if (v6
      && (v7 = v6,
          (v8 = [(UARPAssetTagBackDeploy *)self decodeCharForKey:v4 key:@"char3"]) != 0)
      && (v9 = v8,
          (v10 = [(UARPAssetTagBackDeploy *)self decodeCharForKey:v4 key:@"char4"]) != 0))
    {
      self = [(UARPAssetTagBackDeploy *)self initWithChar1:*v5 char2:*v7 char3:*v9 char4:*v10];
      uint64_t v5 = (const char *)self;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return (UARPAssetTagBackDeploy *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  p_char1 = &self->_char1;
  id v5 = a3;
  [v5 encodeBytes:p_char1 length:1 forKey:@"char1"];
  [v5 encodeBytes:&self->_char2 length:1 forKey:@"char2"];
  [v5 encodeBytes:&self->_char3 length:1 forKey:@"char3"];
  [v5 encodeBytes:&self->_char4 length:1 forKey:@"char4"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UARPAssetTagBackDeploy alloc];
  uint64_t char1 = self->_char1;
  uint64_t char2 = self->_char2;
  uint64_t char3 = self->_char3;
  uint64_t char4 = self->_char4;
  return [(UARPAssetTagBackDeploy *)v4 initWithChar1:char1 char2:char2 char3:char3 char4:char4];
}

- (unint64_t)hash
{
  return self->_tag;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPAssetTagBackDeploy *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      BOOL v10 = 1;
    }
    else
    {
      id v5 = v4;
      int char1 = self->_char1;
      if (char1 == [(UARPAssetTagBackDeploy *)v5 char1]
        && (int char2 = self->_char2, char2 == [(UARPAssetTagBackDeploy *)v5 char2])&& (char3 = self->_char3, char3 == [(UARPAssetTagBackDeploy *)v5 char3]))
      {
        int char4 = self->_char4;
        BOOL v10 = char4 == [(UARPAssetTagBackDeploy *)v5 char4];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (char)char1
{
  return self->_char1;
}

- (char)char2
{
  return self->_char2;
}

- (char)char3
{
  return self->_char3;
}

- (char)char4
{
  return self->_char4;
}

- (unsigned)tag
{
  return self->_tag;
}

@end