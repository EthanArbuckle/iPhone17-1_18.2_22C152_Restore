@interface SecDbKeychainSecretData
- (NSData)serializedRepresentation;
- (NSString)tamperCheck;
- (SecDbKeychainAKSWrappedKey)wrappedKey;
- (SecDbKeychainSecretData)initWithCiphertext:(id)a3 wrappedKey:(id)a4 tamperCheck:(id)a5 error:(id *)a6;
- (SecDbKeychainSecretData)initWithData:(id)a3;
- (_SFAuthenticatedCiphertext)ciphertext;
@end

@implementation SecDbKeychainSecretData

- (NSString)tamperCheck
{
  return [(SecDbKeychainSerializedSecretData *)self->_serializedHolder tamperCheck];
}

- (SecDbKeychainSecretData)initWithData:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SecDbKeychainSecretData;
  v5 = [(SecDbKeychainSecretData *)&v14 init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = [[SecDbKeychainSerializedSecretData alloc] initWithData:v4];
  serializedHolder = v5->_serializedHolder;
  v5->_serializedHolder = v6;

  uint64_t v8 = [(SecDbKeychainSerializedSecretData *)v5->_serializedHolder ciphertext];
  if (!v8)
  {
LABEL_7:

    v5 = 0;
    goto LABEL_8;
  }
  v9 = (void *)v8;
  uint64_t v10 = [(SecDbKeychainSerializedSecretData *)v5->_serializedHolder wrappedKey];
  if (!v10)
  {

    goto LABEL_7;
  }
  v11 = (void *)v10;
  v12 = [(SecDbKeychainSerializedSecretData *)v5->_serializedHolder tamperCheck];

  if (!v12) {
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (SecDbKeychainAKSWrappedKey)wrappedKey
{
  v3 = [SecDbKeychainAKSWrappedKey alloc];
  id v4 = [(SecDbKeychainSerializedSecretData *)self->_serializedHolder wrappedKey];
  v5 = [(SecDbKeychainAKSWrappedKey *)v3 initWithData:v4];

  return v5;
}

- (_SFAuthenticatedCiphertext)ciphertext
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SecDbKeychainSerializedSecretData *)self->_serializedHolder ciphertext];
  id v9 = 0;
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v3 fromData:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    v7 = sub_10000B070("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error deserializing ciphertext from secret data: %@", buf, 0xCu);
    }
  }

  return (_SFAuthenticatedCiphertext *)v5;
}

- (void).cxx_destruct
{
}

- (NSData)serializedRepresentation
{
  return (NSData *)[(SecDbKeychainSerializedSecretData *)self->_serializedHolder data];
}

- (SecDbKeychainSecretData)initWithCiphertext:(id)a3 wrappedKey:(id)a4 tamperCheck:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SecDbKeychainSecretData;
  v13 = [(SecDbKeychainSecretData *)&v24 init];
  if (!v13) {
    goto LABEL_8;
  }
  objc_super v14 = objc_alloc_init(SecDbKeychainSerializedSecretData);
  serializedHolder = v13->_serializedHolder;
  v13->_serializedHolder = v14;

  v16 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:a6];
  [(SecDbKeychainSerializedSecretData *)v13->_serializedHolder setCiphertext:v16];

  v17 = [v11 serializedRepresentation];
  [(SecDbKeychainSerializedSecretData *)v13->_serializedHolder setWrappedKey:v17];

  [(SecDbKeychainSerializedSecretData *)v13->_serializedHolder setTamperCheck:v12];
  uint64_t v18 = [(SecDbKeychainSerializedSecretData *)v13->_serializedHolder ciphertext];
  if (!v18)
  {
LABEL_7:

    v13 = 0;
    goto LABEL_8;
  }
  v19 = (void *)v18;
  uint64_t v20 = [(SecDbKeychainSerializedSecretData *)v13->_serializedHolder wrappedKey];
  if (!v20)
  {

    goto LABEL_7;
  }
  v21 = (void *)v20;
  v22 = [(SecDbKeychainSerializedSecretData *)v13->_serializedHolder tamperCheck];

  if (!v22) {
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

@end