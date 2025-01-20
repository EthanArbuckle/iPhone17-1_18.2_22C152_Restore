@interface SFTripleDESEncryptionOperation
- (SFTripleDESEncryptionOperation)initWithCoder:(id)a3;
- (SFTripleDESEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
@end

@implementation SFTripleDESEncryptionOperation

- (SFTripleDESEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SFTripleDESEncryptionOperation;
  return [(SFSymmetricEncryptionOperation *)&v5 initWithKeySpecifier:a3 mode:a4];
}

- (SFTripleDESEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFTripleDESEncryptionOperation;
  return [(SFSymmetricEncryptionOperation *)&v4 initWithCoder:a3];
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end