@interface PKValueAddedMerchant
+ (BOOL)supportsSecureCoding;
- (NSData)identifier;
- (PKValueAddedMerchant)initWithCoder:(id)a3;
- (int64_t)timesPresented;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTimesPresented:(int64_t)a3;
@end

@implementation PKValueAddedMerchant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKValueAddedMerchant)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKValueAddedMerchant;
  v5 = [(PKValueAddedMerchant *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PKValueAddedMerchantIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v6;

    v5->_timesPresented = [v4 decodeIntegerForKey:@"PKValueAddedMerchantTimesPresentedKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"PKValueAddedMerchantIdentifierKey"];
  [v5 encodeInteger:self->_timesPresented forKey:@"PKValueAddedMerchantTimesPresentedKey"];
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)timesPresented
{
  return self->_timesPresented;
}

- (void)setTimesPresented:(int64_t)a3
{
  self->_timesPresented = a3;
}

- (void).cxx_destruct
{
}

@end