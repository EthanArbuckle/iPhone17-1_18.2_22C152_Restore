@interface PKPassSectionDetailDrillInField
+ (BOOL)supportsSecureCoding;
- (BOOL)isDrillInField;
- (NSArray)sectionIdentifiers;
- (NSString)localizedTitle;
- (PKPassSectionDetailDrillInField)initWithCoder:(id)a3;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)authRequirement;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthRequirement:(int64_t)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setSectionIdentifiers:(id)a3;
@end

@implementation PKPassSectionDetailDrillInField

- (id)asDictionary
{
  v2 = [(PKPassField *)self asMutableDictionary];
  v3 = (void *)[v2 copy];

  return v3;
}

- (PKPassSectionDetailDrillInField)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassSectionDetailDrillInField;
  v5 = [(PKPassField *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"sectionIdentifiers"];
    [(PKPassSectionDetailDrillInField *)v5 setSectionIdentifiers:v6];

    -[PKPassSectionDetailDrillInField setAuthRequirement:](v5, "setAuthRequirement:", [v4 decodeIntegerForKey:@"authRequirement"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    [(PKPassSectionDetailDrillInField *)v5 setLocalizedTitle:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassSectionDetailDrillInField;
  id v4 = a3;
  [(PKPassField *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sectionIdentifiers, @"sectionIdentifiers", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_authRequirement forKey:@"authRequirement"];
  [v4 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassSectionDetailDrillInField;
  id v5 = -[PKPassField copyWithZone:](&v9, sel_copyWithZone_);
  v6 = (void *)[(NSArray *)self->_sectionIdentifiers copyWithZone:a3];
  [v5 setSectionIdentifiers:v6];

  [v5 setAuthRequirement:self->_authRequirement];
  v7 = (void *)[(NSString *)self->_localizedTitle copyWithZone:a3];
  [v5 setLocalizedTitle:v7];

  return v5;
}

- (BOOL)isDrillInField
{
  return 1;
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (void)setSectionIdentifiers:(id)a3
{
}

- (int64_t)authRequirement
{
  return self->_authRequirement;
}

- (void)setAuthRequirement:(int64_t)a3
{
  self->_authRequirement = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
}

@end