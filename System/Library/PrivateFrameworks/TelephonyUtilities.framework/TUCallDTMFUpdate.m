@interface TUCallDTMFUpdate
+ (BOOL)supportsSecureCoding;
- (NSString)digits;
- (NSUUID)UUID;
- (TUCallDTMFUpdate)initWithCoder:(id)a3;
- (TUCallDTMFUpdate)initWithDigits:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDigits:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUCallDTMFUpdate

- (TUCallDTMFUpdate)initWithDigits:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCallDTMFUpdate;
  v5 = [(TUCallDTMFUpdate *)&v11 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUCallDTMFUpdate initWithDigits:]", @"digits" format];
    }
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 copy];
    digits = v5->_digits;
    v5->_digits = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUCallDTMFUpdate *)self digits];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p digits=%@>", v4, self, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(TUCallDTMFUpdate *)self UUID];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setUUID:v7];

  uint64_t v8 = [(TUCallDTMFUpdate *)self digits];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDigits:v9];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCallDTMFUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUCallDTMFUpdate;
  v5 = [(TUCallDTMFUpdate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"digits"];
    digits = v5->_digits;
    v5->_digits = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUCallDTMFUpdate *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];

  id v6 = [(TUCallDTMFUpdate *)self digits];
  [v4 encodeObject:v6 forKey:@"digits"];
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_digits, 0);
}

@end