@interface PGGraphPersonChange
- (NSSet)propertyNames;
- (NSString)contactIdentifier;
- (NSString)personLocalIdentifier;
- (PGGraphPersonChange)initWithPersonLocalIdentifier:(id)a3 contactIdentifier:(id)a4 propertyNames:(id)a5;
- (PGGraphPersonChange)initWithPersonLocalIdentifier:(id)a3 propertyNames:(id)a4;
- (id)description;
- (unint64_t)type;
- (void)mergeChange:(id)a3;
@end

@implementation PGGraphPersonChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNames, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

- (NSSet)propertyNames
{
  return self->_propertyNames;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGGraphPersonChange;
  v4 = [(PGGraphChange *)&v10 description];
  v5 = [(PGGraphPersonChange *)self personLocalIdentifier];
  v6 = [(PGGraphPersonChange *)self contactIdentifier];
  v7 = [(PGGraphPersonChange *)self propertyNames];
  v8 = [v3 stringWithFormat:@"%@ person local identifier: %@, contact identifier: %@, propertyNames: %@", v4, v5, v6, v7];

  return v8;
}

- (void)mergeChange:(id)a3
{
  id v10 = a3;
  v4 = [v10 personLocalIdentifier];
  v5 = [v10 contactIdentifier];
  if (![v4 length]) {
    [v5 length];
  }
  v6 = (void *)[(NSSet *)self->_propertyNames mutableCopy];
  v7 = [v10 propertyNames];
  [v6 unionSet:v7];

  v8 = [MEMORY[0x1E4F1CAD0] setWithSet:v6];
  propertyNames = self->_propertyNames;
  self->_propertyNames = v8;
}

- (unint64_t)type
{
  return 6;
}

- (PGGraphPersonChange)initWithPersonLocalIdentifier:(id)a3 contactIdentifier:(id)a4 propertyNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphPersonChange;
  v12 = [(PGGraphPersonChange *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v13->_contactIdentifier, a4);
    objc_storeStrong((id *)&v13->_propertyNames, a5);
  }

  return v13;
}

- (PGGraphPersonChange)initWithPersonLocalIdentifier:(id)a3 propertyNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPersonChange;
  id v9 = [(PGGraphPersonChange *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v10->_propertyNames, a4);
  }

  return v10;
}

@end