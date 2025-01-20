@interface SBSHomeScreenServiceArrayOfStrings
+ (BOOL)supportsSecureCoding;
- (NSArray)array;
- (SBSHomeScreenServiceArrayOfStrings)init;
- (SBSHomeScreenServiceArrayOfStrings)initWithArray:(id)a3;
- (SBSHomeScreenServiceArrayOfStrings)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSHomeScreenServiceArrayOfStrings

- (SBSHomeScreenServiceArrayOfStrings)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomeScreenServiceArrayOfStrings;
  v5 = [(SBSHomeScreenServiceArrayOfStrings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    array = v5->_array;
    v5->_array = (NSArray *)v6;
  }
  return v5;
}

- (SBSHomeScreenServiceArrayOfStrings)init
{
  return [(SBSHomeScreenServiceArrayOfStrings *)self initWithArray:MEMORY[0x1E4F1CBF0]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SBSHomeScreenServiceArrayOfStrings)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = self;
  v7 = self;
  v8 = [v4 setWithObjects:v6, v7];
  objc_super v9 = [v5 decodeObjectOfClasses:v8 forKey:@"array"];

  v10 = [(SBSHomeScreenServiceArrayOfStrings *)self initWithArray:v9];
  return v10;
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
}

@end