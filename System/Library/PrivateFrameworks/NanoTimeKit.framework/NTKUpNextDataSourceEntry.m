@interface NTKUpNextDataSourceEntry
- (BOOL)isDonation;
- (NSSet)identifiers;
- (NSString)localizedName;
- (NTKUpNextDataSourceEntry)initWithDataSourceIdentifiers:(id)a3 localizedName:(id)a4 isDonation:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIdentifiers:(id)a3;
- (void)setIsDonation:(BOOL)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation NTKUpNextDataSourceEntry

- (NTKUpNextDataSourceEntry)initWithDataSourceIdentifiers:(id)a3 localizedName:(id)a4 isDonation:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextDataSourceEntry;
  v11 = [(NTKUpNextDataSourceEntry *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifiers, a3);
    objc_storeStrong((id *)&v12->_localizedName, a4);
    v12->_isDonation = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(NTKUpNextDataSourceEntry);
  if (v5)
  {
    v6 = (void *)[(NSSet *)self->_identifiers copyWithZone:a3];
    [(NTKUpNextDataSourceEntry *)v5 setIdentifiers:v6];

    v7 = (void *)[(NSString *)self->_localizedName copyWithZone:a3];
    [(NTKUpNextDataSourceEntry *)v5 setLocalizedName:v7];

    [(NTKUpNextDataSourceEntry *)v5 setIsDonation:self->_isDonation];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextDataSourceEntry;
  v4 = [(NTKUpNextDataSourceEntry *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@ - %@ - isDonation %x", v4, self->_localizedName, self->_identifiers, self->_isDonation];

  return v5;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (BOOL)isDonation
{
  return self->_isDonation;
}

- (void)setIsDonation:(BOOL)a3
{
  self->_isDonation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end