@interface PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor
+ (BOOL)supportsSecureCoding;
- (NSData)readerGroupIdentifier;
- (NSData)readerGroupPublicKey;
- (PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor)initWithCoder:(id)a3;
- (PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor)initWithReaderGroupIdentifier:(id)a3 readerGroupPublicKey:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor

- (PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor)initWithReaderGroupIdentifier:(id)a3 readerGroupPublicKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor;
  v9 = [(PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_readerGroupIdentifier, a3);
    objc_storeStrong((id *)&v10->_readerGroupPublicKey, a4);
  }

  return v10;
}

- (PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor;
  v5 = [(PKUnifiedAccessHomeAuxiliaryCapabilityDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerGroupIdentifier"];
    readerGroupIdentifier = v5->_readerGroupIdentifier;
    v5->_readerGroupIdentifier = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerGroupPublicKey"];
    readerGroupPublicKey = v5->_readerGroupPublicKey;
    v5->_readerGroupPublicKey = (NSData *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  readerGroupIdentifier = self->_readerGroupIdentifier;
  id v5 = a3;
  [v5 encodeObject:readerGroupIdentifier forKey:@"readerGroupIdentifier"];
  [v5 encodeObject:self->_readerGroupPublicKey forKey:@"readerGroupPublicKey"];
}

- (NSData)readerGroupIdentifier
{
  return self->_readerGroupIdentifier;
}

- (NSData)readerGroupPublicKey
{
  return self->_readerGroupPublicKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerGroupPublicKey, 0);
  objc_storeStrong((id *)&self->_readerGroupIdentifier, 0);
}

@end