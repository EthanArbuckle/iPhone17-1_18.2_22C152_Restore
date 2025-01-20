@interface STUsageItem
+ (BOOL)supportsSecureCoding;
- (BOOL)usageTrusted;
- (NSDate)startDate;
- (NSNumber)maxUsage;
- (NSNumber)minUsage;
- (NSNumber)totalUsage;
- (NSString)budgetItemIdentifier;
- (NSString)categoryIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (STUsageItem)initWithCoder:(id)a3;
- (STUsageTrustIdentifier)trustIdentifier;
- (UIColor)color;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)itemType;
- (unint64_t)timePeriod;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setColor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setMaxUsage:(id)a3;
- (void)setMinUsage:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTimePeriod:(unint64_t)a3;
- (void)setTotalUsage:(id)a3;
- (void)setTrustIdentifier:(id)a3;
@end

@implementation STUsageItem

- (STUsageItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STUsageItem;
  v5 = [(STUsageItem *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_trustIdentifier"];
    trustIdentifier = v5->_trustIdentifier;
    v5->_trustIdentifier = (STUsageTrustIdentifier *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_categoryIdentifier"];
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemType"];
    v5->_itemType = [v12 unsignedIntegerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_color"];
    color = v5->_color;
    v5->_color = (UIColor *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timePeriod"];
    v5->_timePeriod = [v15 unsignedIntegerValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_totalUsage"];
    totalUsage = v5->_totalUsage;
    v5->_totalUsage = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maxUsage"];
    maxUsage = v5->_maxUsage;
    v5->_maxUsage = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_minUsage"];
    minUsage = v5->_minUsage;
    v5->_minUsage = (NSNumber *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"_identifier"];
  [v7 encodeObject:self->_trustIdentifier forKey:@"_trustIdentifier"];
  [v7 encodeObject:self->_categoryIdentifier forKey:@"_categoryIdentifier"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_itemType];
  [v7 encodeObject:v5 forKey:@"_itemType"];

  [v7 encodeObject:self->_color forKey:@"_color"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_timePeriod];
  [v7 encodeObject:v6 forKey:@"_timePeriod"];

  [v7 encodeObject:self->_startDate forKey:@"_startDate"];
  [v7 encodeObject:self->_totalUsage forKey:@"_totalUsage"];
  [v7 encodeObject:self->_maxUsage forKey:@"_maxUsage"];
  [v7 encodeObject:self->_minUsage forKey:@"_minUsage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v6[4] = *MEMORY[0x263EF8340];
  v6[0] = @"identifier";
  v6[1] = @"timePeriod";
  v6[2] = @"startDate";
  v6[3] = @"totalUsage";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  id v4 = STUIObjectDescriptionWithProperties(self, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_identifier copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(STUsageTrustIdentifier *)self->_trustIdentifier copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_categoryIdentifier copy];
  uint64_t v10 = (void *)v4[3];
  v4[3] = v9;

  v4[4] = self->_itemType;
  uint64_t v11 = [(UIColor *)self->_color copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  v4[6] = self->_timePeriod;
  uint64_t v13 = [(NSDate *)self->_startDate copy];
  v14 = (void *)v4[7];
  v4[7] = v13;

  uint64_t v15 = [(NSNumber *)self->_totalUsage copy];
  uint64_t v16 = (void *)v4[8];
  v4[8] = v15;

  uint64_t v17 = [(NSNumber *)self->_maxUsage copy];
  uint64_t v18 = (void *)v4[9];
  v4[9] = v17;

  uint64_t v19 = [(NSNumber *)self->_minUsage copy];
  uint64_t v20 = (void *)v4[10];
  v4[10] = v19;

  return v4;
}

- (NSString)budgetItemIdentifier
{
  v2 = [(STUsageItem *)self trustIdentifier];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)usageTrusted
{
  v2 = [(STUsageItem *)self trustIdentifier];
  char v3 = [v2 usageTrusted];

  return v3;
}

- (NSString)displayName
{
  char v3 = [(STUsageItem *)self budgetItemIdentifier];
  switch([(STUsageItem *)self itemType])
  {
    case 2uLL:
    case 5uLL:
    case 6uLL:
      id v4 = [MEMORY[0x263F670A8] sharedCache];
      uint64_t v5 = [v4 appInfoForBundleIdentifier:v3];

      uint64_t v6 = [v5 displayName];

      break;
    case 3uLL:
      uint64_t v7 = STCategoryNameWithIdentifier();
      goto LABEL_6;
    case 4uLL:
      uint64_t v7 = objc_msgSend(v3, "_lp_userVisibleHost");
LABEL_6:
      uint64_t v6 = (__CFString *)v7;
      break;
    default:
      uint64_t v6 = &stru_26D9391A8;
      break;
  }

  return (NSString *)v6;
}

- (UIImage)image
{
  switch([(STUsageItem *)self itemType])
  {
    case 2uLL:
    case 5uLL:
    case 6uLL:
      char v3 = [MEMORY[0x263F67408] sharedCache];
      id v4 = [(STUsageItem *)self budgetItemIdentifier];
      uint64_t v5 = [v3 imageForBundleIdentifier:v4];
      goto LABEL_5;
    case 3uLL:
      char v3 = [MEMORY[0x263F67408] sharedCache];
      id v4 = [(STUsageItem *)self budgetItemIdentifier];
      uint64_t v5 = [v3 imageForCategoryIdentifier:v4];
LABEL_5:
      uint64_t v6 = (void *)v5;
      goto LABEL_6;
    case 4uLL:
      char v3 = [MEMORY[0x263F67408] sharedCache];
      id v4 = [(STUsageItem *)self displayName];
      if ([v4 length])
      {
        uint64_t v8 = objc_opt_new();
        [v8 setScheme:@"https"];
        [v8 setHost:v4];
        uint64_t v9 = [v8 URL];
        uint64_t v10 = objc_msgSend(v9, "_lp_highLevelDomain");
        uint64_t v11 = [v8 host];
        v12 = [v8 URL];
        id v13 = v10;
        id v14 = v11;
        id v15 = v12;
        if ([v13 length])
        {
          uint64_t v16 = [v13 substringToIndex:1];
          uint64_t v17 = [v16 uppercaseString];
        }
        else
        {
          uint64_t v18 = [v14 substringToIndex:1];
          uint64_t v17 = [v18 uppercaseString];

          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:]((uint64_t)v15, (uint64_t)v14);
          }
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:]((uint64_t)v4);
        }
        uint64_t v17 = 0;
      }

      uint64_t v19 = [MEMORY[0x263F82DA0] currentTraitCollection];
      uint64_t v6 = objc_msgSend(v3, "monogramImageForInitial:useDarkColors:", v17, objc_msgSend(v19, "userInterfaceStyle") == 2);

LABEL_6:
      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return (UIImage *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (STUsageTrustIdentifier)trustIdentifier
{
  return self->_trustIdentifier;
}

- (void)setTrustIdentifier:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (unint64_t)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(unint64_t)a3
{
  self->_timePeriod = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSNumber)totalUsage
{
  return self->_totalUsage;
}

- (void)setTotalUsage:(id)a3
{
}

- (NSNumber)maxUsage
{
  return self->_maxUsage;
}

- (void)setMaxUsage:(id)a3
{
}

- (NSNumber)minUsage
{
  return self->_minUsage;
}

- (void)setMinUsage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minUsage, 0);
  objc_storeStrong((id *)&self->_maxUsage, 0);
  objc_storeStrong((id *)&self->_totalUsage, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_trustIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end