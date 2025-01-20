@interface PGGraphSocialGroupChange
- (NSSet)propertyNames;
- (NSString)socialGroupUUID;
- (PGGraphSocialGroupChange)initWithSocialGroupUUID:(id)a3 propertyNames:(id)a4;
- (id)description;
- (unint64_t)type;
- (void)mergeChange:(id)a3;
@end

@implementation PGGraphSocialGroupChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNames, 0);
  objc_storeStrong((id *)&self->_socialGroupUUID, 0);
}

- (NSSet)propertyNames
{
  return self->_propertyNames;
}

- (NSString)socialGroupUUID
{
  return self->_socialGroupUUID;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSocialGroupChange;
  v4 = [(PGGraphChange *)&v9 description];
  v5 = [(PGGraphSocialGroupChange *)self socialGroupUUID];
  v6 = [(PGGraphSocialGroupChange *)self propertyNames];
  v7 = [v3 stringWithFormat:@"%@ social group uuid: %@, propertyNames: %@", v4, v5, v6];

  return v7;
}

- (void)mergeChange:(id)a3
{
  id v4 = a3;
  id v9 = [v4 socialGroupUUID];
  [v9 length];
  v5 = (void *)[(NSSet *)self->_propertyNames mutableCopy];
  v6 = [v4 propertyNames];

  [v5 unionSet:v6];
  v7 = [MEMORY[0x1E4F1CAD0] setWithSet:v5];
  propertyNames = self->_propertyNames;
  self->_propertyNames = v7;
}

- (unint64_t)type
{
  return 12;
}

- (PGGraphSocialGroupChange)initWithSocialGroupUUID:(id)a3 propertyNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphSocialGroupChange;
  id v9 = [(PGGraphSocialGroupChange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_socialGroupUUID, a3);
    objc_storeStrong((id *)&v10->_propertyNames, a4);
  }

  return v10;
}

@end