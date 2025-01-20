@interface WBSPasswordCharacterClass
+ (id)asciiPrintableCharacterClass;
+ (id)customCharacterClassWithValue:(id)a3;
+ (id)digitCharacterClass;
+ (id)lowercaseCharacterClass;
+ (id)namedCharacterClassWithType:(int64_t)a3;
+ (id)specialCharacterClass;
+ (id)unicodeCharacterClass;
+ (id)uppercaseCharacterClass;
- (BOOL)isEqual:(id)a3;
- (NSString)value;
- (WBSPasswordCharacterClass)initWithType:(int64_t)a3 value:(id)a4;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation WBSPasswordCharacterClass

+ (id)customCharacterClassWithValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithType:6 value:v4];

  return v5;
}

+ (id)namedCharacterClassWithType:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:a3 value:&stru_1F105D3F0];
  return v3;
}

+ (id)asciiPrintableCharacterClass
{
  return (id)[a1 namedCharacterClassWithType:0];
}

+ (id)digitCharacterClass
{
  return (id)[a1 namedCharacterClassWithType:1];
}

+ (id)lowercaseCharacterClass
{
  return (id)[a1 namedCharacterClassWithType:2];
}

+ (id)uppercaseCharacterClass
{
  return (id)[a1 namedCharacterClassWithType:3];
}

+ (id)specialCharacterClass
{
  return (id)[a1 namedCharacterClassWithType:4];
}

+ (id)unicodeCharacterClass
{
  return (id)[a1 namedCharacterClassWithType:5];
}

- (WBSPasswordCharacterClass)initWithType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordCharacterClass;
  v7 = [(WBSPasswordCharacterClass *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    value = v8->_value;
    v8->_value = (NSString *)v9;

    v11 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  return [(NSString *)self->_value hash] ^ type;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSPasswordCharacterClass *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WBSPasswordCharacterClass *)v4 value];
      int64_t type = self->_type;
      if (type == [(WBSPasswordCharacterClass *)v4 type])
      {
        if (v5 == self->_value) {
          char v7 = 1;
        }
        else {
          char v7 = -[NSString isEqualToString:](v5, "isEqualToString:");
        }
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end