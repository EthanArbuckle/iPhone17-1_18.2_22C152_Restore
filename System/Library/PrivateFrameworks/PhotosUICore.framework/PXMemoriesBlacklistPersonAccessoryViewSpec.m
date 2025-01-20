@interface PXMemoriesBlacklistPersonAccessoryViewSpec
+ (id)specWithPerson:(id)a3;
- (PXMemoriesBlacklistPersonAccessoryViewSpec)initWithPerson:(id)a3;
- (PXPerson)person;
@end

@implementation PXMemoriesBlacklistPersonAccessoryViewSpec

- (void).cxx_destruct
{
}

- (PXPerson)person
{
  return self->_person;
}

- (PXMemoriesBlacklistPersonAccessoryViewSpec)initWithPerson:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoriesBlacklistPersonAccessoryViewSpec;
  v6 = -[PXMemoriesBlacklistAccessoryViewSpec initWithContentViewFrame:](&v9, sel_initWithContentViewFrame_, 0.0, 0.0, 294.0, 100.0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_person, a3);
    [(PXMemoriesBlacklistAccessoryViewSpec *)v7 setType:2];
  }

  return v7;
}

+ (id)specWithPerson:(id)a3
{
  id v3 = a3;
  v4 = [[PXMemoriesBlacklistPersonAccessoryViewSpec alloc] initWithPerson:v3];

  return v4;
}

@end