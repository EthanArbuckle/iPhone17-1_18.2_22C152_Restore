@interface PGTitleSpecPool
+ (id)poolWithSpecs:(id)a3;
- (NSArray)specs;
- (PGTitleSpecPool)initWithSpecs:(id)a3;
- (id)description;
@end

@implementation PGTitleSpecPool

- (void).cxx_destruct
{
}

- (NSArray)specs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecPool;
  v4 = [(PGTitleSpecPool *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ specs %@", v4, self->_specs];

  return v5;
}

- (PGTitleSpecPool)initWithSpecs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGTitleSpecPool;
  v6 = [(PGTitleSpecPool *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specs, a3);
  }

  return v7;
}

+ (id)poolWithSpecs:(id)a3
{
  id v3 = a3;
  v4 = [[PGTitleSpecPool alloc] initWithSpecs:v3];

  return v4;
}

@end