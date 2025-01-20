@interface DAPartialIP
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DAPartialIP)initWithAddress:(id)a3 mask:(id)a4;
- (DAPartialIP)initWithCoder:(id)a3;
- (DAPartialIP)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)address;
- (NSData)mask;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
@end

@implementation DAPartialIP

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAPartialIP)initWithAddress:(id)a3 mask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)DAPartialIP;
    self = [(DAPartialIP *)&v15 init];
    if (self
      && (unint64_t)[v6 length] <= 0x10
      && (unint64_t)[v8 length] <= 0x10)
    {
      v10 = (NSData *)[v6 copy];
      address = self->_address;
      self->_address = v10;

      v12 = (NSData *)[v8 copy];
      mask = self->_mask;
      self->_mask = v12;

      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (DAPartialIP)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAPartialIP;
  id v7 = [(DAPartialIP *)&v10 init];
  if (!v7)
  {
    if (a4)
    {
      objc_opt_class();
      DAErrorF();
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_5;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData()) {
    goto LABEL_8;
  }
  v8 = v7;
LABEL_5:

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  address = self->_address;
  if (address)
  {
    v5 = address;
    id v6 = [(NSData *)v5 bytes];
    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = "";
    }
    NSUInteger v8 = [(NSData *)v5 length];

    xpc_dictionary_set_data(xdict, "ipAd", v7, v8);
  }
  mask = self->_mask;
  if (mask)
  {
    objc_super v10 = mask;
    id v11 = xdict;
    v12 = v10;
    v13 = [(NSData *)v12 bytes];
    if (v13) {
      v14 = v13;
    }
    else {
      v14 = "";
    }
    NSUInteger v15 = [(NSData *)v12 length];

    xpc_dictionary_set_data(v11, "ipMa", v14, v15);
  }
}

- (void)encodeWithCoder:(id)a3
{
  address = self->_address;
  id v5 = a3;
  [v5 encodeObject:address forKey:@"address"];
  [v5 encodeObject:self->_mask forKey:@"mask"];
}

- (DAPartialIP)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAPartialIP;
  id v5 = [(DAPartialIP *)&v14 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectForKey:@"address"];
    id v7 = [v4 decodeObjectForKey:@"mask"];
    NSUInteger v8 = v7;
    if (!v6 || !v7)
    {

      v12 = 0;
      goto LABEL_6;
    }
    address = v5->_address;
    v5->_address = v6;
    objc_super v10 = v6;

    mask = v5->_mask;
    v5->_mask = v8;
  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DAPartialIP *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  id v5 = v4;
  address = self->_address;
  id v7 = [(DAPartialIP *)v5 address];
  if (![(NSData *)address isEqualToData:v7])
  {

    goto LABEL_7;
  }
  mask = self->_mask;
  v9 = [(DAPartialIP *)v5 mask];
  LOBYTE(mask) = [(NSData *)mask isEqualToData:v9];

  if ((mask & 1) == 0)
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
LABEL_5:
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (id)description
{
  v3 = [(NSData *)self->_address description];
  id v4 = [(NSData *)self->_mask description];
  id v5 = +[NSString stringWithFormat:@"addr: %@, mask: %@", v3, v4];

  return v5;
}

- (NSData)address
{
  return self->_address;
}

- (NSData)mask
{
  return self->_mask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end