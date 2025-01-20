@interface RBSSavedEndowment
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)savedEndowment:(id)a3 withKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSecureCoding)endowment;
- (NSString)description;
- (NSString)key;
- (RBSSavedEndowment)initWithRBSXPCCoder:(id)a3;
- (id)_initWithEndowment:(id)a3 andKey:(id)a4;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSSavedEndowment

- (id)_initWithEndowment:(id)a3 andKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RBSSavedEndowment;
  v9 = [(RBSSavedEndowment *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endowment, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (id)savedEndowment:(id)a3 withKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[RBSSavedEndowment alloc] _initWithEndowment:v6 andKey:v5];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSSavedEndowment *)a3;
  if (self == v4) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    char v6 = 0;
    goto LABEL_9;
  }
  key = self->_key;
  id v8 = v4->_key;
  if (key == v8)
  {
LABEL_8:
    char v6 = 1;
    goto LABEL_9;
  }
  char v6 = 0;
  if (key && v8) {
    char v6 = -[NSString isEqual:](key, "isEqual:");
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_key hash];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  uint64_t v5 = [(NSString *)self->_key description];
  char v6 = [(NSSecureCoding *)self->_endowment description];
  id v7 = (void *)[v3 initWithFormat:@"<%@| key:%@ endowment:%@>", v4, v5, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"_key"];
  RBSEndowmentEncode(self->_endowment);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = RBSXPCPackObject(v7);
  [v5 encodeXPCObject:v6 forKey:@"_endowment"];
}

- (RBSSavedEndowment)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeStringForKey:@"_key"];
  if (v5)
  {
    char v6 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"_endowment"];
    id v7 = RBSXPCUnpackObject(v6);
    id v8 = RBSEndowmentDecode(v7);

    if (v8)
    {
      self = (RBSSavedEndowment *)[(RBSSavedEndowment *)self _initWithEndowment:v8 andKey:v5];
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSecureCoding)endowment
{
  return self->_endowment;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_endowment, 0);
}

@end