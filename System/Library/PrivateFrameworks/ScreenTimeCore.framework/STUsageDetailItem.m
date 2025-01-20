@interface STUsageDetailItem
+ (id)keyPathsForValuesAffectingIsAllAppsOrCategories;
+ (id)keyPathsForValuesAffectingSortQuantity;
- (BOOL)isAllAppsOrCategories;
- (BOOL)isEqual:(id)a3;
- (BOOL)usageTrusted;
- (NSString)identifier;
- (STUsageDetailItem)initWithType:(int64_t)a3 identifier:(id)a4;
- (STUsageDetailItem)initWithType:(int64_t)a3 identifier:(id)a4 usageTrusted:(BOOL)a5;
- (float)quantity;
- (float)sortQuantity;
- (int64_t)type;
- (unint64_t)hash;
- (void)setQuantity:(float)a3;
- (void)setType:(int64_t)a3;
@end

@implementation STUsageDetailItem

- (STUsageDetailItem)initWithType:(int64_t)a3 identifier:(id)a4 usageTrusted:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)STUsageDetailItem;
  id v7 = a4;
  v8 = [(STUsageDetailItem *)&v12 init];
  v8->_type = a3;
  uint64_t v9 = objc_msgSend(v7, "copy", v12.receiver, v12.super_class);

  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v9;

  v8->_quantity = 0.0;
  v8->_usageTrusted = a5;
  return v8;
}

- (STUsageDetailItem)initWithType:(int64_t)a3 identifier:(id)a4
{
  return [(STUsageDetailItem *)self initWithType:a3 identifier:a4 usageTrusted:1];
}

- (unint64_t)hash
{
  v2 = [(STUsageDetailItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(STUsageDetailItem *)self identifier];
    id v7 = [v5 identifier];
    if ([v6 isEqualToString:v7])
    {
      BOOL v8 = [(STUsageDetailItem *)self usageTrusted];
      int v9 = v8 ^ [v5 usageTrusted] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)keyPathsForValuesAffectingIsAllAppsOrCategories
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"identifier"];
}

- (BOOL)isAllAppsOrCategories
{
  v2 = [(STUsageDetailItem *)self identifier];
  if (([v2 isEqualToString:@"__AllAppsAndCategories__"] & 1) != 0
    || ([v2 isEqualToString:@"__AllApps__"] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:@"__AllCategories__"];
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingSortQuantity
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isAllAppsOrCategories", @"quantity", 0);
}

- (float)sortQuantity
{
  if ([(STUsageDetailItem *)self isAllAppsOrCategories]) {
    return 3.4028e38;
  }
  [(STUsageDetailItem *)self quantity];
  return result;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (float)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(float)a3
{
  self->_quantity = a3;
}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (void).cxx_destruct
{
}

@end