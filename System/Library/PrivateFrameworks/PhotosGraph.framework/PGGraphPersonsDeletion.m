@interface PGGraphPersonsDeletion
- (NSSet)personLocalIdentifiers;
- (PGGraphPersonsDeletion)initWithPersonLocalIdentifiers:(id)a3;
- (id)description;
- (unint64_t)changeCount;
- (unint64_t)type;
@end

@implementation PGGraphPersonsDeletion

- (void).cxx_destruct
{
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPersonsDeletion;
  v4 = [(PGGraphChange *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, personLocalIdentifiers (%ld): %@", v4, -[NSSet count](self->_personLocalIdentifiers, "count"), self->_personLocalIdentifiers];

  return v5;
}

- (unint64_t)changeCount
{
  return [(NSSet *)self->_personLocalIdentifiers count];
}

- (unint64_t)type
{
  return 5;
}

- (PGGraphPersonsDeletion)initWithPersonLocalIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphPersonsDeletion;
  v6 = [(PGGraphPersonsDeletion *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personLocalIdentifiers, a3);
  }

  return v7;
}

@end