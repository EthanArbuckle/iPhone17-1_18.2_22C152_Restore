@interface SearchUICollectionViewRestorationContext
+ (BOOL)supportsSecureCoding;
- (NSIndexPath)lastSelectedIndexPath;
- (SearchUICollectionViewRestorationContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLastSelectedIndexPath:(id)a3;
@end

@implementation SearchUICollectionViewRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchUICollectionViewRestorationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewRestorationContext;
  v5 = [(SearchUICollectionViewRestorationContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSelectedIndexPath"];
    lastSelectedIndexPath = v5->_lastSelectedIndexPath;
    v5->_lastSelectedIndexPath = (NSIndexPath *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  v5 = [(SearchUICollectionViewRestorationContext *)self lastSelectedIndexPath];
  [v4 setLastSelectedIndexPath:v5];

  return v4;
}

- (NSIndexPath)lastSelectedIndexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end