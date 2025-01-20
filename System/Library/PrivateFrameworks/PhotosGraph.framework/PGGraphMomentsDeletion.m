@interface PGGraphMomentsDeletion
- (NSSet)momentUUIDs;
- (PGGraphMomentsDeletion)initWithMomentUUIDs:(id)a3;
- (id)description;
- (unint64_t)changeCount;
- (unint64_t)type;
@end

@implementation PGGraphMomentsDeletion

- (void).cxx_destruct
{
}

- (NSSet)momentUUIDs
{
  return self->_momentUUIDs;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphMomentsDeletion;
  v4 = [(PGGraphChange *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, momentUUIDs (%lu): %@", v4, -[NSSet count](self->_momentUUIDs, "count"), self->_momentUUIDs];

  return v5;
}

- (unint64_t)changeCount
{
  return [(NSSet *)self->_momentUUIDs count];
}

- (unint64_t)type
{
  return 2;
}

- (PGGraphMomentsDeletion)initWithMomentUUIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMomentsDeletion;
  v6 = [(PGGraphMomentsDeletion *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_momentUUIDs, a3);
  }

  return v7;
}

@end