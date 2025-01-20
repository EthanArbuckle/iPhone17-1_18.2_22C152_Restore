@interface SKStatusProvisionPayload
+ (BOOL)supportsSecureCoding;
+ (id)logger;
- (NSData)commitmentSalt;
- (NSData)decryptionKey;
- (NSData)encryptedStatusPayload;
- (NSData)initializationVector;
- (NSDate)validFrom;
- (NSDate)validUntil;
- (NSString)identifier;
- (SKStatusPayload)statusPayload;
- (SKStatusProvisionPayload)initWithCoder:(id)a3;
- (SKStatusProvisionPayload)initWithStatusPayload:(id)a3 validFrom:(id)a4 validUntil:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCommitmentSalt:(id)a3;
- (void)setDecryptionKey:(id)a3;
- (void)setEncryptedStatusPayload:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitializationVector:(id)a3;
@end

@implementation SKStatusProvisionPayload

- (SKStatusProvisionPayload)initWithStatusPayload:(id)a3 validFrom:(id)a4 validUntil:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SKStatusProvisionPayload;
  v12 = [(SKStatusProvisionPayload *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_statusPayload, a3);
    objc_storeStrong((id *)&v13->_validFrom, a4);
    objc_storeStrong((id *)&v13->_validUntil, a5);
    v14 = [MEMORY[0x263F08C38] UUID];
    uint64_t v15 = [v14 UUIDString];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v15;
  }
  return v13;
}

+ (id)logger
{
  if (logger_onceToken_9 != -1) {
    dispatch_once(&logger_onceToken_9, &__block_literal_global_10);
  }
  v2 = (void *)logger__logger_9;
  return v2;
}

uint64_t __34__SKStatusProvisionPayload_logger__block_invoke()
{
  logger__logger_9 = (uint64_t)os_log_create("com.apple.StatusKit", "SKStatusProvisionPayload");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  statusPayload = self->_statusPayload;
  id v5 = a3;
  [v5 encodeObject:statusPayload forKey:@"payload"];
  [v5 encodeObject:self->_validFrom forKey:@"valid-from"];
  [v5 encodeObject:self->_validUntil forKey:@"valid-until"];
  [v5 encodeObject:self->_encryptedStatusPayload forKey:@"encrypted-payload"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_decryptionKey forKey:@"key"];
  [v5 encodeObject:self->_initializationVector forKey:@"initialization-vector"];
  [v5 encodeObject:self->_commitmentSalt forKey:@"commitment-salt"];
}

- (SKStatusProvisionPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valid-from"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valid-until"];
  v8 = [(SKStatusProvisionPayload *)self initWithStatusPayload:v5 validFrom:v6 validUntil:v7];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encrypted-payload"];
  [(SKStatusProvisionPayload *)v8 setEncryptedStatusPayload:v9];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(SKStatusProvisionPayload *)v8 setIdentifier:v10];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  [(SKStatusProvisionPayload *)v8 setDecryptionKey:v11];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialization-vector"];
  [(SKStatusProvisionPayload *)v8 setInitializationVector:v12];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commitment-salt"];

  [(SKStatusProvisionPayload *)v8 setCommitmentSalt:v13];
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SKStatusProvisionPayload *)self identifier];
  v6 = [(SKStatusProvisionPayload *)self statusPayload];
  v7 = [(SKStatusProvisionPayload *)self validFrom];
  v8 = [(SKStatusProvisionPayload *)self validUntil];
  id v9 = [(SKStatusProvisionPayload *)self decryptionKey];
  id v10 = @"NO";
  if (!v9) {
    id v10 = @"YES";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = \"%@\"; payload = \"%@\"; validFrom = \"%@\"; validUntil = \"%@\"; hasKey = \"%@\";",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  id v11 = v10);

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (NSData)decryptionKey
{
  return self->_decryptionKey;
}

- (void)setDecryptionKey:(id)a3
{
}

- (NSDate)validFrom
{
  return self->_validFrom;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (NSData)encryptedStatusPayload
{
  return self->_encryptedStatusPayload;
}

- (void)setEncryptedStatusPayload:(id)a3
{
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
}

- (NSData)commitmentSalt
{
  return self->_commitmentSalt;
}

- (void)setCommitmentSalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitmentSalt, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_encryptedStatusPayload, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_validFrom, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end