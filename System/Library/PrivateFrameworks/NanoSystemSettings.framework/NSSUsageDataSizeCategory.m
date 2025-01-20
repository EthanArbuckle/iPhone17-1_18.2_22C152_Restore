@interface NSSUsageDataSizeCategory
- (NSSSizeVector)size;
- (NSSUsageDataSizeCategory)initWithIdentifier:(id)a3 size:(id)a4 name:(id)a5;
- (NSString)categoryIdentifier;
- (NSString)name;
@end

@implementation NSSUsageDataSizeCategory

- (NSSUsageDataSizeCategory)initWithIdentifier:(id)a3 size:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NSSUsageDataSizeCategory;
  v12 = [(NSSUsageDataSizeCategory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a5);
    objc_storeStrong((id *)&v13->_size, a4);
    objc_storeStrong((id *)&v13->_categoryIdentifier, a3);
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSSSizeVector)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end