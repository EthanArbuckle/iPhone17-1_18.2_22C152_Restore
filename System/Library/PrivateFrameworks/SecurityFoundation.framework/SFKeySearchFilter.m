@interface SFKeySearchFilter
+ (BOOL)supportsSecureCoding;
- (NSArray)domains;
- (NSArray)specifiers;
- (SFKeySearchFilter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDomains:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation SFKeySearchFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFKeySearchFilter)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFKeySearchFilter;
  return [(SFKeySearchFilter *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSpecifiers:*((void *)self->_keySearchFilterInternal + 1)];
  [v4 setDomains:*((void *)self->_keySearchFilterInternal + 2)];
  return v4;
}

- (NSArray)specifiers
{
  v2 = (void *)[*((id *)self->_keySearchFilterInternal + 1) copy];
  return (NSArray *)v2;
}

- (void)setSpecifiers:(id)a3
{
  *((void *)self->_keySearchFilterInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSArray)domains
{
  v2 = (void *)[*((id *)self->_keySearchFilterInternal + 2) copy];
  return (NSArray *)v2;
}

- (void)setDomains:(id)a3
{
  *((void *)self->_keySearchFilterInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end