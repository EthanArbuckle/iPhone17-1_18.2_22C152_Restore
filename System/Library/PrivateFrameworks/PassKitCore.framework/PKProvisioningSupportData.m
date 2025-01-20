@interface PKProvisioningSupportData
+ (BOOL)supportsSecureCoding;
- (NSDictionary)encryptedSupportDataDictionary;
- (NSString)sid;
- (PKProvisioningSupportData)initWithCoder:(id)a3;
- (PKProvisioningSupportData)initWithEncryptedSupportDataDictionary:(id)a3 sid:(id)a4;
- (id)_dictionaryRepresentation;
- (id)archiveForKeychainWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)supportDataType;
- (void)encodeWithCoder:(id)a3;
- (void)setSid:(id)a3;
@end

@implementation PKProvisioningSupportData

- (PKProvisioningSupportData)initWithEncryptedSupportDataDictionary:(id)a3 sid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningSupportData;
  v9 = [(PKProvisioningSupportData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptedSupportDataDictionary, a3);
    objc_storeStrong((id *)&v10->_sid, a4);
  }

  return v10;
}

- (id)archiveForKeychainWithError:(id *)a3
{
  v4 = (void *)MEMORY[0x1E4F28DB0];
  v5 = [(PKProvisioningSupportData *)self _dictionaryRepresentation];
  v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:a3];

  return v6;
}

- (unint64_t)supportDataType
{
  return 0;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_sid forKeyedSubscript:@"SID"];
  [v3 setObject:self->_encryptedSupportDataDictionary forKeyedSubscript:@"EncryptedSupportDictionary"];
  if ([v3 count]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningSupportData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKProvisioningSupportData;
  id v5 = [(PKProvisioningSupportData *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EncryptedSupportDictionary"];
    encryptedSupportDataDictionary = v5->_encryptedSupportDataDictionary;
    v5->_encryptedSupportDataDictionary = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SID"];
    sid = v5->_sid;
    v5->_sid = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encryptedSupportDataDictionary = self->_encryptedSupportDataDictionary;
  id v5 = a3;
  [v5 encodeObject:encryptedSupportDataDictionary forKey:@"EncryptedSupportDictionary"];
  [v5 encodeObject:self->_sid forKey:@"SID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_encryptedSupportDataDictionary copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_sid copy];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (NSDictionary)encryptedSupportDataDictionary
{
  return self->_encryptedSupportDataDictionary;
}

- (NSString)sid
{
  return self->_sid;
}

- (void)setSid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sid, 0);
  objc_storeStrong((id *)&self->_encryptedSupportDataDictionary, 0);
}

@end