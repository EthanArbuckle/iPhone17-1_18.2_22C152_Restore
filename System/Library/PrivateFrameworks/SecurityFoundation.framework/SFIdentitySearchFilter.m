@interface SFIdentitySearchFilter
+ (BOOL)supportsSecureCoding;
- (NSArray)certificateSerialNumbers;
- (NSArray)certificateTypes;
- (NSArray)keySpecifiers;
- (SFIdentitySearchFilter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCertificateSerialNumbers:(id)a3;
- (void)setCertificateTypes:(id)a3;
- (void)setKeySpecifiers:(id)a3;
@end

@implementation SFIdentitySearchFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFIdentitySearchFilter)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFIdentitySearchFilter;
  return [(SFIdentitySearchFilter *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setCertificateSerialNumbers:*((void *)self->_identitySearchFilterInternal + 1)];
  [v4 setCertificateTypes:*((void *)self->_identitySearchFilterInternal + 2)];
  [v4 setKeySpecifiers:*((void *)self->_identitySearchFilterInternal + 3)];
  return v4;
}

- (NSArray)certificateSerialNumbers
{
  v2 = (void *)[*((id *)self->_identitySearchFilterInternal + 1) copy];
  return (NSArray *)v2;
}

- (void)setCertificateSerialNumbers:(id)a3
{
  *((void *)self->_identitySearchFilterInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSArray)certificateTypes
{
  v2 = (void *)[*((id *)self->_identitySearchFilterInternal + 2) copy];
  return (NSArray *)v2;
}

- (void)setCertificateTypes:(id)a3
{
  *((void *)self->_identitySearchFilterInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSArray)keySpecifiers
{
  v2 = (void *)[*((id *)self->_identitySearchFilterInternal + 3) copy];
  return (NSArray *)v2;
}

- (void)setKeySpecifiers:(id)a3
{
  *((void *)self->_identitySearchFilterInternal + 3) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end