@interface PKASCAssociatedReaderIDReaderCA
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToASCAssociatedReaderIDReaderCA:(id)a3;
- (NSData)attestation;
- (NSData)publicKey;
- (PKASCAssociatedReaderIDReaderCA)initWithCoder:(id)a3;
- (PKASCAssociatedReaderIDReaderCA)initWithDictionary:(id)a3;
- (id)asDictionary;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAttestation:(id)a3;
- (void)setPublicKey:(id)a3;
@end

@implementation PKASCAssociatedReaderIDReaderCA

- (PKASCAssociatedReaderIDReaderCA)initWithDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 PKStringForKey:@"publicKey"];
    v6 = objc_msgSend(v5, "pk_decodeHexadecimal");

    v7 = [v4 PKStringForKey:@"attestation"];

    v8 = objc_msgSend(v7, "pk_decodeHexadecimal");

    v9 = 0;
    if (v6 && v8)
    {
      v13.receiver = self;
      v13.super_class = (Class)PKASCAssociatedReaderIDReaderCA;
      v10 = [(PKASCAssociatedReaderIDReaderCA *)&v13 init];
      p_isa = (id *)&v10->super.isa;
      if (v10)
      {
        objc_storeStrong((id *)&v10->_publicKey, v6);
        objc_storeStrong(p_isa + 2, v8);
      }
      self = p_isa;
      v9 = self;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSData *)self->_publicKey hexEncoding];
  [v3 setObject:v4 forKeyedSubscript:@"publicKey"];

  v5 = [(NSData *)self->_attestation hexEncoding];
  [v3 setObject:v5 forKeyedSubscript:@"attestation"];

  v6 = (void *)[v3 copy];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKASCAssociatedReaderIDReaderCA)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKASCAssociatedReaderIDReaderCA;
  v5 = [(PKASCAssociatedReaderIDReaderCA *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attestation"];
    attestation = v5->_attestation;
    v5->_attestation = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  publicKey = self->_publicKey;
  id v5 = a3;
  [v5 encodeObject:publicKey forKey:@"publicKey"];
  [v5 encodeObject:self->_attestation forKey:@"attestation"];
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(NSData *)self->_publicKey hexEncoding];
  id v5 = [(NSData *)self->_attestation hexEncoding];
  uint64_t v6 = [v3 stringWithFormat:@"<publicKey: '%@'; attestation: '%@';>", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_publicKey) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_attestation) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKASCAssociatedReaderIDReaderCA *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKASCAssociatedReaderIDReaderCA *)self isEqualToASCAssociatedReaderIDReaderCA:v5];

  return v6;
}

- (BOOL)isEqualToASCAssociatedReaderIDReaderCA:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  publicKey = self->_publicKey;
  BOOL v6 = (NSData *)v4[1];
  if (publicKey) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSData isEqual:](publicKey, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (publicKey != v6) {
    goto LABEL_8;
  }
LABEL_11:
  attestation = self->_attestation;
  objc_super v11 = (NSData *)v4[2];
  if (attestation && v11) {
    char v8 = -[NSData isEqual:](attestation, "isEqual:");
  }
  else {
    char v8 = attestation == v11;
  }
LABEL_9:

  return v8;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end