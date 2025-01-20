@interface PKASCAssociatedReaderID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToASCAssociatedReaderID:(id)a3;
- (NSData)readerID;
- (PKASCAssociatedReaderID)initWithCoder:(id)a3;
- (PKASCAssociatedReaderID)initWithDictionary:(id)a3;
- (PKASCAssociatedReaderIDReaderCA)readerCA;
- (id)asDictionary;
- (id)description;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setReaderCA:(id)a3;
- (void)setReaderID:(id)a3;
@end

@implementation PKASCAssociatedReaderID

- (PKASCAssociatedReaderID)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"readerID"];
  v6 = objc_msgSend(v5, "pk_decodeHexadecimal");

  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKASCAssociatedReaderID;
    v7 = [(PKASCAssociatedReaderID *)&v16 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_readerID, v6);
      v9 = [v4 PKNumberForKey:@"priority"];
      v8->_priority = [v9 unsignedIntegerValue];

      v10 = [PKASCAssociatedReaderIDReaderCA alloc];
      v11 = [v4 PKDictionaryForKey:@"readerCA"];
      uint64_t v12 = [(PKASCAssociatedReaderIDReaderCA *)v10 initWithDictionary:v11];
      readerCA = v8->_readerCA;
      v8->_readerCA = (PKASCAssociatedReaderIDReaderCA *)v12;
    }
    self = v8;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSData *)self->_readerID hexEncoding];
  [v3 setObject:v4 forKeyedSubscript:@"readerID"];

  v5 = [NSNumber numberWithUnsignedInteger:self->_priority];
  [v3 setObject:v5 forKeyedSubscript:@"priority"];

  v6 = [(PKASCAssociatedReaderIDReaderCA *)self->_readerCA asDictionary];
  [v3 setObject:v6 forKeyedSubscript:@"readerCA"];

  v7 = (void *)[v3 copy];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKASCAssociatedReaderID)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKASCAssociatedReaderID;
  v5 = [(PKASCAssociatedReaderID *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerID"];
    readerID = v5->_readerID;
    v5->_readerID = (NSData *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
    v5->_priority = [v8 unsignedIntegerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerCA"];
    readerCA = v5->_readerCA;
    v5->_readerCA = (PKASCAssociatedReaderIDReaderCA *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  readerID = self->_readerID;
  id v6 = a3;
  [v6 encodeObject:readerID forKey:@"readerID"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_priority];
  [v6 encodeObject:v5 forKey:@"priority"];

  [v6 encodeObject:self->_readerCA forKey:@"readerCA"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"readerID: '%@'; ", self->_readerID];
  v7 = [NSNumber numberWithUnsignedInteger:self->_priority];
  [v6 appendFormat:@"priority: '%@'; ", v7];

  [v6 appendFormat:@"readerCA: '%@'; ", self->_readerCA];
  [v6 appendFormat:@">"];
  v8 = [NSString stringWithString:v6];

  return v8;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_readerID) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_readerCA) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_priority - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKASCAssociatedReaderID *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKASCAssociatedReaderID *)self isEqualToASCAssociatedReaderID:v5];

  return v6;
}

- (BOOL)isEqualToASCAssociatedReaderID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  readerID = self->_readerID;
  BOOL v6 = (NSData *)v4[1];
  if (readerID) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSData isEqual:](readerID, "isEqual:")) {
      goto LABEL_10;
    }
LABEL_14:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  if (readerID != v6) {
    goto LABEL_14;
  }
LABEL_10:
  if (self->_priority != v4[2]) {
    goto LABEL_14;
  }
  readerCA = self->_readerCA;
  uint64_t v9 = (PKASCAssociatedReaderIDReaderCA *)v4[3];
  if (readerCA && v9) {
    BOOL v10 = -[PKASCAssociatedReaderIDReaderCA isEqual:](readerCA, "isEqual:");
  }
  else {
    BOOL v10 = readerCA == v9;
  }
LABEL_15:

  return v10;
}

- (NSData)readerID
{
  return self->_readerID;
}

- (void)setReaderID:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (PKASCAssociatedReaderIDReaderCA)readerCA
{
  return self->_readerCA;
}

- (void)setReaderCA:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerCA, 0);
  objc_storeStrong((id *)&self->_readerID, 0);
}

@end