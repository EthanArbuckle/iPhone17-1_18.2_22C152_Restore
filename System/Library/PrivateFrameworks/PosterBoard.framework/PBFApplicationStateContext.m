@interface PBFApplicationStateContext
+ (id)contextWithForegroundStateDescription:(id)a3 posterUUIDs:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)posterUUIDs;
- (NSString)foregroundStateDescription;
- (id)description;
@end

@implementation PBFApplicationStateContext

+ (id)contextWithForegroundStateDescription:(id)a3 posterUUIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(PBFApplicationStateContext);
  uint64_t v8 = [v6 copy];

  foregroundStateDescription = v7->_foregroundStateDescription;
  v7->_foregroundStateDescription = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  posterUUIDs = v7->_posterUUIDs;
  v7->_posterUUIDs = (NSSet *)v10;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PBFApplicationStateContext *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSSet *)v4->_posterUUIDs isEqualToSet:self->_posterUUIDs];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_foregroundStateDescription withName:@"foregroundStateDescription" skipIfEmpty:1];
  v4 = [(NSSet *)self->_posterUUIDs allObjects];
  [v3 appendArraySection:v4 withName:@"posterUUIDs" skipIfEmpty:1];

  char v5 = [v3 build];

  return v5;
}

- (NSSet)posterUUIDs
{
  return self->_posterUUIDs;
}

- (NSString)foregroundStateDescription
{
  return self->_foregroundStateDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundStateDescription, 0);
  objc_storeStrong((id *)&self->_posterUUIDs, 0);
}

@end