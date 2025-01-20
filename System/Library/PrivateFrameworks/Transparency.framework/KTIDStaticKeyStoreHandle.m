@interface KTIDStaticKeyStoreHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)valid;
- (KTIDStaticKeyStoreHandle)initWithCoder:(id)a3;
- (NSDate)validationDate;
- (NSString)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (int)errorCode;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setHandle:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)setValidationDate:(id)a3;
@end

@implementation KTIDStaticKeyStoreHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[KTIDStaticKeyStoreHandle allocWithZone:](KTIDStaticKeyStoreHandle, "allocWithZone:") init];
  v6 = [(KTIDStaticKeyStoreHandle *)self handle];
  v7 = (void *)[v6 copyWithZone:a3];
  [(KTIDStaticKeyStoreHandle *)v5 setHandle:v7];

  [(KTIDStaticKeyStoreHandle *)v5 setValid:[(KTIDStaticKeyStoreHandle *)self valid]];
  v8 = [(KTIDStaticKeyStoreHandle *)self validationDate];
  v9 = (void *)[v8 copyWithZone:a3];
  [(KTIDStaticKeyStoreHandle *)v5 setValidationDate:v9];

  [(KTIDStaticKeyStoreHandle *)v5 setErrorCode:[(KTIDStaticKeyStoreHandle *)self errorCode]];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(KTIDStaticKeyStoreHandle *)self handle];
  [v6 encodeObject:v4 forKey:@"handle"];

  objc_msgSend(v6, "encodeBool:forKey:", -[KTIDStaticKeyStoreHandle valid](self, "valid"), @"valid");
  v5 = [(KTIDStaticKeyStoreHandle *)self validationDate];
  [v6 encodeObject:v5 forKey:@"validationDate"];

  objc_msgSend(v6, "encodeInt:forKey:", -[KTIDStaticKeyStoreHandle errorCode](self, "errorCode"), @"errorCode");
}

- (KTIDStaticKeyStoreHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(KTIDStaticKeyStoreHandle);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    [(KTIDStaticKeyStoreHandle *)v5 setHandle:v6];

    -[KTIDStaticKeyStoreHandle setValid:](v5, "setValid:", [v4 decodeBoolForKey:@"valid"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validationDate"];
    [(KTIDStaticKeyStoreHandle *)v5 setValidationDate:v7];

    -[KTIDStaticKeyStoreHandle setErrorCode:](v5, "setErrorCode:", [v4 decodeIntForKey:@"errorCode"]);
    v8 = v5;
  }

  return v5;
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHandle:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSDate)validationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValidationDate:(id)a3
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationDate, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end