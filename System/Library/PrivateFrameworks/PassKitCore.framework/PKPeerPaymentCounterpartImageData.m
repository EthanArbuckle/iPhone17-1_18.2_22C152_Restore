@interface PKPeerPaymentCounterpartImageData
+ (BOOL)supportsSecureCoding;
+ (id)counterpartImageDataIdentifierFromRecordName:(id)a3;
+ (id)recordNameForCounterpartImageDataIdentifier:(id)a3;
+ (id)recordNamePrefix;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (NSString)identifier;
- (PKPeerPaymentCounterpartImageData)initWithAppearanceData:(id)a3;
- (PKPeerPaymentCounterpartImageData)initWithCloudStoreCoder:(id)a3;
- (PKPeerPaymentCounterpartImageData)initWithCoder:(id)a3;
- (PKPeerPaymentCounterpartImageData)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)itemType;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageData:(id)a3;
@end

@implementation PKPeerPaymentCounterpartImageData

- (PKPeerPaymentCounterpartImageData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentCounterpartImageData;
  v5 = [(PKPeerPaymentCounterpartImageData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKDataForKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v8;
  }
  return v5;
}

- (PKPeerPaymentCounterpartImageData)initWithAppearanceData:(id)a3
{
  id v4 = a3;
  v5 = [v4 imageData];
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)PKPeerPaymentCounterpartImageData;
    uint64_t v6 = [(PKPeerPaymentCounterpartImageData *)&v14 init];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = [v4 displayName];
      [v7 safelyAddObject:v8];

      [v7 safelyAddObject:v5];
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", PKCombinedHash(17, v7));
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      objc_storeStrong((id *)&v6->_imageData, v5);
    }
    self = v6;
    objc_super v11 = self;
  }
  else
  {
    v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Error: attempted to initialize PKPeerPaymentCounterpartImageData with nil image data", buf, 2u);
    }

    objc_super v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentCounterpartImageData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentCounterpartImageData;
  v5 = [(PKPeerPaymentCounterpartImageData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_imageData forKey:@"imageData"];
}

- (PKPeerPaymentCounterpartImageData)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentCounterpartImageData;
  id v5 = [(PKPeerPaymentCounterpartImageData *)&v21 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 recordsWithRecordType:@"CounterpartImage"];
  v7 = [v6 firstObject];

  uint64_t v8 = objc_msgSend(v7, "pk_encryptedStringForKey:", @"identifier");
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;

  if (!v5->_identifier)
  {
    objc_super v11 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      v17 = "Cannot create a PKPeerPaymentCounterpartImageData with no identifier from CloudKit.";
LABEL_11:
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v17, v20, 2u);
    }
LABEL_15:

    v16 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = [v7 objectForKey:@"imageData"];
  if (!v10)
  {
    objc_super v11 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      v17 = "Cannot create a PKPeerPaymentCounterpartImageData with no asset data from CloudKit.";
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  objc_super v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v13 = [v11 fileURL];
  uint64_t v14 = [v12 initWithContentsOfURL:v13];

  if (!v14)
  {
    v18 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPeerPaymentCounterpartImageData with nil data", v20, 2u);
    }

    goto LABEL_15;
  }
  imageData = v5->_imageData;
  v5->_imageData = (NSData *)v14;

LABEL_6:
  v16 = v5;
LABEL_16:

  return v16;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x192FDC630]();
  v7 = [v5 recordsWithRecordType:@"CounterpartImage"];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [v8 encryptedValues];
  [v9 setObject:self->_identifier forKey:@"identifier"];
  uint64_t v10 = NSTemporaryDirectory();
  objc_super v11 = [v10 stringByAppendingPathComponent:self->_identifier];

  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v12 removeItemAtPath:v11 error:0];

  [(NSData *)self->_imageData writeToFile:v11 atomically:1];
  id v13 = objc_alloc(MEMORY[0x1E4F19E50]);
  uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
  v15 = (void *)[v13 initWithFileURL:v14];

  if (v15)
  {
    [v8 setObject:v15 forKey:@"imageData"];
  }
  else
  {
    v16 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Could not set CKAsset for the CKRecord because it is nil.", v17, 2u);
    }
  }
}

- (unint64_t)itemType
{
  return 10;
}

+ (id)recordNamePrefix
{
  return @"counterpartImage-";
}

- (id)primaryIdentifier
{
  return self->_identifier;
}

+ (id)recordNameForCounterpartImageDataIdentifier:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [a1 recordNamePrefix];
  uint64_t v8 = (void *)[v6 initWithFormat:@"%@%@", v7, v5];

  return v8;
}

+ (id)counterpartImageDataIdentifierFromRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 recordNamePrefix];
  int v6 = [v4 hasPrefix:v5];

  if (v6)
  {
    v7 = [a1 recordNamePrefix];
    uint64_t v8 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString alloc];
  id v5 = [(id)objc_opt_class() recordNamePrefix];
  int v6 = [(PKPeerPaymentCounterpartImageData *)self primaryIdentifier];
  v7 = (void *)[v4 initWithFormat:@"%@%@", v5, v6, @"CounterpartImage"];
  id v12 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v13[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_identifier == (NSString *)v4[1]
    && self->_imageData == (NSData *)v4[2];

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"imageData: '%@'; ", self->_imageData];
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_imageData];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[PKPeerPaymentCounterpartImageData allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_identifier, self->_identifier);
  objc_storeStrong((id *)&v4->_imageData, self->_imageData);
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end