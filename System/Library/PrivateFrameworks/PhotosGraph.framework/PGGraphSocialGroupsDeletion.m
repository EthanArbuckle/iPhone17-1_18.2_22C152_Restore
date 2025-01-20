@interface PGGraphSocialGroupsDeletion
- (NSSet)socialGroupUUIDs;
- (PGGraphSocialGroupsDeletion)initWithSocialGroupUUIDs:(id)a3;
- (id)description;
- (unint64_t)changeCount;
- (unint64_t)type;
@end

@implementation PGGraphSocialGroupsDeletion

- (void).cxx_destruct
{
}

- (NSSet)socialGroupUUIDs
{
  return self->_socialGroupUUIDs;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphSocialGroupsDeletion;
  v4 = [(PGGraphChange *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, socialGroupUUIDs (%ld): %@", v4, -[NSSet count](self->_socialGroupUUIDs, "count"), self->_socialGroupUUIDs];

  return v5;
}

- (unint64_t)changeCount
{
  return [(NSSet *)self->_socialGroupUUIDs count];
}

- (unint64_t)type
{
  return 11;
}

- (PGGraphSocialGroupsDeletion)initWithSocialGroupUUIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSocialGroupsDeletion;
  v6 = [(PGGraphSocialGroupsDeletion *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_socialGroupUUIDs, a3);
  }

  return v7;
}

@end