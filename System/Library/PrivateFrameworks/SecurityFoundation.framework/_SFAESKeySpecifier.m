@interface _SFAESKeySpecifier
+ (BOOL)supportsSecureCoding;
+ (Class)keyClass;
- (_SFAESKeySpecifier)initWithBitSize:(int64_t)a3;
- (_SFAESKeySpecifier)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bitSize;
- (int64_t)blockSize;
- (int64_t)keyLengthInBytes;
- (void)setBitSize:(int64_t)a3;
@end

@implementation _SFAESKeySpecifier

- (void).cxx_destruct
{
}

- (int64_t)keyLengthInBytes
{
  unint64_t v2 = *((void *)self->_aesKeySpecifierInternal + 1);
  if (v2 < 3) {
    return 8 * v2 + 16;
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"SFKey.m" lineNumber:305 description:@"unexected AES key bit size"];

  return result;
}

- (_SFAESKeySpecifier)initWithBitSize:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFAESKeySpecifier;
  v4 = [(_SFAESKeySpecifier *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(SFAESKeySpecifier_Ivars);
    id aesKeySpecifierInternal = v4->_aesKeySpecifierInternal;
    v4->_id aesKeySpecifierInternal = v5;

    *((void *)v4->_aesKeySpecifierInternal + 1) = a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = *((void *)self->_aesKeySpecifierInternal + 1);
  return (id)[v4 initWithBitSize:v5];
}

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFAESKeySpecifier)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAESKeySpecifier;
  return [(_SFAESKeySpecifier *)&v4 init];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_SFAESKeySpecifier;
  objc_super v4 = [(_SFAESKeySpecifier *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ bitSize: %ld", v4, 8 * -[_SFAESKeySpecifier keyLengthInBytes](self, "keyLengthInBytes")];

  return v5;
}

- (int64_t)bitSize
{
  return *((void *)self->_aesKeySpecifierInternal + 1);
}

- (void)setBitSize:(int64_t)a3
{
  *((void *)self->_aesKeySpecifierInternal + 1) = a3;
}

- (int64_t)blockSize
{
  return 16;
}

@end