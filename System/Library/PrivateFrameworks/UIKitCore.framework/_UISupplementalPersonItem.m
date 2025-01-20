@interface _UISupplementalPersonItem
+ (id)new;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)nickname;
- (NSString)organizationName;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)phoneticOrganizationName;
- (_UISupplementalPersonItem)init;
- (_UISupplementalPersonItem)initWithCoder:(id)a3;
- (_UISupplementalPersonItem)initWithContact:(id)a3;
- (_UISupplementalPersonItem)initWithContact:(id)a3 icon:(id)a4;
- (_UISupplementalPersonItem)initWithPersonNameComponents:(id)a3;
- (_UISupplementalPersonItem)initWithPersonNameComponents:(id)a3 icon:(id)a4;
- (_UISupplementalPersonItem)initWithTISupplementalPersonItem:(id)a3 icon:(id)a4;
- (id)description;
- (unint64_t)_identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setPhoneticOrganizationName:(id)a3;
@end

@implementation _UISupplementalPersonItem

+ (id)new
{
  id v2 = a1;
  return (id)[v2 init];
}

- (_UISupplementalPersonItem)init
{
  v3 = objc_opt_new();
  v4 = [(_UISupplementalPersonItem *)self initWithTISupplementalPersonItem:v3 icon:0];

  return v4;
}

- (_UISupplementalPersonItem)initWithTISupplementalPersonItem:(id)a3 icon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISupplementalPersonItem;
  v9 = [(_UISupplementalItem *)&v14 _init];
  v10 = (_UISupplementalPersonItem *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    v11 = (void *)[v8 copy];
    [(_UISupplementalItem *)v10 setIcon:v11];

    v12 = v10;
  }

  return v10;
}

- (_UISupplementalPersonItem)initWithContact:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FAE438];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithContact:v5];

  id v7 = [(_UISupplementalPersonItem *)self initWithTISupplementalPersonItem:v6 icon:0];
  return v7;
}

- (_UISupplementalPersonItem)initWithContact:(id)a3 icon:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4FAE438];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithContact:v8];

  v10 = [(_UISupplementalPersonItem *)self initWithTISupplementalPersonItem:v9 icon:v7];
  return v10;
}

- (_UISupplementalPersonItem)initWithPersonNameComponents:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FAE438];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithPersonNameComponents:v5];

  id v7 = [(_UISupplementalPersonItem *)self initWithTISupplementalPersonItem:v6 icon:0];
  return v7;
}

- (_UISupplementalPersonItem)initWithPersonNameComponents:(id)a3 icon:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4FAE438];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithPersonNameComponents:v8];

  v10 = [(_UISupplementalPersonItem *)self initWithTISupplementalPersonItem:v9 icon:v7];
  return v10;
}

- (unint64_t)_identifier
{
  return [self->super._internal identifier];
}

- (NSString)givenName
{
  return (NSString *)[self->super._internal givenName];
}

- (void)setGivenName:(id)a3
{
}

- (NSString)phoneticGivenName
{
  return (NSString *)[self->super._internal phoneticGivenName];
}

- (void)setPhoneticGivenName:(id)a3
{
}

- (NSString)familyName
{
  return (NSString *)[self->super._internal familyName];
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)phoneticFamilyName
{
  return (NSString *)[self->super._internal phoneticFamilyName];
}

- (void)setPhoneticFamilyName:(id)a3
{
}

- (NSString)organizationName
{
  return (NSString *)[self->super._internal organizationName];
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)phoneticOrganizationName
{
  return (NSString *)[self->super._internal phoneticOrganizationName];
}

- (void)setPhoneticOrganizationName:(id)a3
{
}

- (NSString)nickname
{
  return (NSString *)[self->super._internal nickname];
}

- (void)setNickname:(id)a3
{
}

- (_UISupplementalPersonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISupplementalPersonItem;
  id v5 = [(_UISupplementalItem *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unwrappedObject"];
    id internal = v5->super._internal;
    v5->super._id internal = (id)v6;

    id v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalPersonItem;
  id v4 = a3;
  [(_UISupplementalItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->super._internal, @"unwrappedObject", v5.receiver, v5.super_class);
}

- (id)description
{
  v13[14] = *MEMORY[0x1E4F143B8];
  v13[0] = "givenName";
  v13[1] = [(_UISupplementalPersonItem *)self givenName];
  v13[2] = "phoneticGivenName";
  v13[3] = [(_UISupplementalPersonItem *)self phoneticGivenName];
  v13[4] = "familyName";
  v13[5] = [(_UISupplementalPersonItem *)self familyName];
  v13[6] = "phoneticFamilyName";
  v13[7] = [(_UISupplementalPersonItem *)self phoneticFamilyName];
  v13[8] = "organizationName";
  v13[9] = [(_UISupplementalPersonItem *)self organizationName];
  v13[10] = "phoneticOrganizationName";
  v13[11] = [(_UISupplementalPersonItem *)self phoneticOrganizationName];
  v13[12] = "nickname";
  v13[13] = [(_UISupplementalPersonItem *)self nickname];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
  for (uint64_t i = 0; i != 14; i += 2)
  {
    uint64_t v6 = v13[i];
    objc_super v5 = (void *)v13[i + 1];
    if ([v5 length])
    {
      id v7 = [NSString stringWithFormat:@"%s=\"%@\"", v6, v5];
      [v3 addObject:v7];
    }
  }
  id v8 = NSString;
  uint64_t v9 = objc_opt_class();
  objc_super v10 = [v3 componentsJoinedByString:@", "];
  objc_msgSend(v8, "stringWithFormat:", @"<%@: %p; %@, identifier=%llu>",
    v9,
    self,
    v10,
  v11 = [self->super._internal identifier]);

  return v11;
}

@end