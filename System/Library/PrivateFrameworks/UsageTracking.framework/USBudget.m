@interface USBudget
+ (BOOL)supportsSecureCoding;
- (NSDictionary)schedule;
- (NSSet)bundleIdentifiers;
- (NSSet)categoryIdentifiers;
- (NSSet)items;
- (NSSet)webDomains;
- (NSString)calendarIdentifier;
- (NSString)identifier;
- (USBudget)initWithCategories:(id)a3 applications:(id)a4 webDomains:(id)a5 schedule:(id)a6 calendarIdentifier:(id)a7 identifier:(id)a8;
- (USBudget)initWithCoder:(id)a3;
- (USBudget)initWithType:(int64_t)a3 items:(id)a4 schedule:(id)a5 calendarIdentifier:(id)a6 identifier:(id)a7;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USBudget

- (USBudget)initWithCategories:(id)a3 applications:(id)a4 webDomains:(id)a5 schedule:(id)a6 calendarIdentifier:(id)a7 identifier:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a5;
  v21 = objc_opt_new();
  v22 = [v21 normalizeDomainNames:v20];

  if (![v15 count] && !objc_msgSend(v16, "count") && !objc_msgSend(v22, "count"))
  {
    v44 = [MEMORY[0x263F08690] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"USUsageMonitor.m", 34, @"Invalid parameter not satisfying: %@", @"(categoryIdentifiers.count > 0) || (bundleIdentifiers.count > 0) || (normalizedWebDomains.count > 0)" object file lineNumber description];
  }
  if (![v17 count])
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"USUsageMonitor.m", 36, @"Invalid parameter not satisfying: %@", @"schedule.count > 0" object file lineNumber description];
  }
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __94__USBudget_initWithCategories_applications_webDomains_schedule_calendarIdentifier_identifier___block_invoke;
  v46[3] = &unk_26431DC28;
  SEL v48 = a2;
  v23 = self;
  v47 = v23;
  [v17 enumerateKeysAndObjectsUsingBlock:v46];
  v45.receiver = v23;
  v45.super_class = (Class)USBudget;
  v24 = [(USBudget *)&v45 init];
  if (v19)
  {
    uint64_t v25 = [v19 copy];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;
  }
  else
  {
    identifier = objc_opt_new();
    uint64_t v27 = [identifier UUIDString];
    v28 = v24->_identifier;
    v24->_identifier = (NSString *)v27;
  }
  uint64_t v29 = [v15 copy];
  categoryIdentifiers = v24->_categoryIdentifiers;
  v24->_categoryIdentifiers = (NSSet *)v29;

  uint64_t v31 = [v16 copy];
  bundleIdentifiers = v24->_bundleIdentifiers;
  v24->_bundleIdentifiers = (NSSet *)v31;

  uint64_t v33 = [v22 copy];
  webDomains = v24->_webDomains;
  v24->_webDomains = (NSSet *)v33;

  if (v18)
  {
    uint64_t v35 = [v18 copy];
    calendarIdentifier = v24->_calendarIdentifier;
    v24->_calendarIdentifier = (NSString *)v35;
  }
  else
  {
    calendarIdentifier = [MEMORY[0x263EFF8F0] currentCalendar];
    v37 = [calendarIdentifier calendarIdentifier];
    uint64_t v38 = [v37 copy];
    v39 = v24->_calendarIdentifier;
    v24->_calendarIdentifier = (NSString *)v38;
  }
  uint64_t v40 = [v17 copy];
  schedule = v24->_schedule;
  v24->_schedule = (NSDictionary *)v40;

  return v24;
}

void __94__USBudget_initWithCategories_applications_webDomains_schedule_calendarIdentifier_identifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  if (v4 < 0.0)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"USUsageMonitor.m", 38, @"Invalid parameter not satisfying: %@", @"timeLimit.doubleValue >= 0.0" object file lineNumber description];
  }
}

- (USBudget)initWithType:(int64_t)a3 items:(id)a4 schedule:(id)a5 calendarIdentifier:(id)a6 identifier:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_opt_new();
  switch(a3)
  {
    case 1:
      id v18 = [MEMORY[0x263F08690] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"USUsageMonitor.m" lineNumber:55 description:@"Screen Time budgets are unsupported"];

      break;
    case 2:
      id v19 = self;
      id v20 = v17;
      id v21 = v13;
      goto LABEL_6;
    case 3:
      id v19 = self;
      id v20 = v17;
      id v21 = v17;
      id v22 = v13;
      goto LABEL_7;
    case 4:
      id v19 = self;
      id v20 = v13;
      id v21 = v17;
LABEL_6:
      id v22 = v17;
LABEL_7:
      self = [(USBudget *)v19 initWithCategories:v20 applications:v21 webDomains:v22 schedule:v14 calendarIdentifier:v15 identifier:v16];
      break;
    default:
      break;
  }

  return self;
}

- (USBudget)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CategoryIdentifiers"];
  uint64_t v31 = [v4 decodeObjectOfClasses:v8 forKey:@"BundleIdentifiers"];
  v10 = [v4 decodeObjectOfClasses:v8 forKey:@"WebDomains"];
  v11 = objc_opt_new();
  v30 = [v11 normalizeDomainNames:v10];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CalendarIdentifier"];
  id v13 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
  id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"Schedule"];
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  BOOL v37 = 0;
  BOOL v37 = [v16 count] != 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __26__USBudget_initWithCoder___block_invoke;
  v33[3] = &unk_26431DC50;
  v33[4] = &v34;
  [v16 enumerateKeysAndObjectsUsingBlock:v33];
  if (!v5) {
    goto LABEL_7;
  }
  if ([v9 count] || objc_msgSend(v31, "count"))
  {
    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v17 = 0;
  if ([v30 count] && v12)
  {
LABEL_5:
    if (*((unsigned char *)v35 + 24))
    {
      v32.receiver = self;
      v32.super_class = (Class)USBudget;
      id v17 = [(USBudget *)&v32 init];
      uint64_t v18 = [v5 copy];
      id v19 = (void *)*((void *)v17 + 1);
      *((void *)v17 + 1) = v18;

      uint64_t v20 = [v9 copy];
      id v21 = (void *)*((void *)v17 + 2);
      *((void *)v17 + 2) = v20;

      uint64_t v22 = [v31 copy];
      v23 = (void *)*((void *)v17 + 3);
      *((void *)v17 + 3) = v22;

      uint64_t v24 = [v30 copy];
      uint64_t v25 = (void *)*((void *)v17 + 4);
      *((void *)v17 + 4) = v24;

      uint64_t v26 = [v12 copy];
      uint64_t v27 = (void *)*((void *)v17 + 5);
      *((void *)v17 + 5) = v26;

      uint64_t v28 = [v16 copy];
      self = (USBudget *)*((void *)v17 + 6);
      *((void *)v17 + 6) = v28;
      goto LABEL_8;
    }
LABEL_7:
    id v17 = 0;
  }
LABEL_8:

  _Block_object_dispose(&v34, 8);
  return (USBudget *)v17;
}

uint64_t __26__USBudget_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 doubleValue];
  if (v7 < 0.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_categoryIdentifiers forKey:@"CategoryIdentifiers"];
  [v5 encodeObject:self->_bundleIdentifiers forKey:@"BundleIdentifiers"];
  [v5 encodeObject:self->_webDomains forKey:@"WebDomains"];
  [v5 encodeObject:self->_calendarIdentifier forKey:@"CalendarIdentifier"];
  [v5 encodeObject:self->_schedule forKey:@"Schedule"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  v42.receiver = self;
  v42.super_class = (Class)USBudget;
  id v4 = [(USBudget *)&v42 description];
  id v5 = [(USBudget *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  objc_msgSend(v6, "appendString:", @" Categories: (");
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v7 = [(USBudget *)self categoryIdentifiers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v7);
        }
        if (*((unsigned char *)v39 + 24))
        {
          [v6 appendString:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          *((unsigned char *)v39 + 24) = 0;
        }
        else
        {
          [v6 appendFormat:@", %@", *(void *)(*((void *)&v34 + 1) + 8 * i)];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v8);
  }

  [v6 appendString:@""]);
  objc_msgSend(v6, "appendString:", @" Applications: (");
  *((unsigned char *)v39 + 24) = 1;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v11 = [(USBudget *)self bundleIdentifiers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v11);
        }
        if (*((unsigned char *)v39 + 24))
        {
          [v6 appendString:*(void *)(*((void *)&v30 + 1) + 8 * j)];
          *((unsigned char *)v39 + 24) = 0;
        }
        else
        {
          [v6 appendFormat:@", %@", *(void *)(*((void *)&v30 + 1) + 8 * j)];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v12);
  }

  [v6 appendString:@""]);
  objc_msgSend(v6, "appendString:", @" WebDomains: (");
  *((unsigned char *)v39 + 24) = 1;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = [(USBudget *)self webDomains];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v15);
        }
        if (*((unsigned char *)v39 + 24))
        {
          [v6 appendString:*(void *)(*((void *)&v26 + 1) + 8 * k)];
          *((unsigned char *)v39 + 24) = 0;
        }
        else
        {
          [v6 appendFormat:@", %@", *(void *)(*((void *)&v26 + 1) + 8 * k)];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v43 count:16];
    }
    while (v16);
  }

  [v6 appendString:@""]);
  id v19 = [(USBudget *)self calendarIdentifier];
  [v6 appendFormat:@" %@:{", v19];

  *((unsigned char *)v39 + 24) = 1;
  uint64_t v20 = [(USBudget *)self schedule];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __23__USBudget_description__block_invoke;
  v23[3] = &unk_26431DC78;
  uint64_t v25 = &v38;
  id v21 = v6;
  id v24 = v21;
  [v20 enumerateKeysAndObjectsUsingBlock:v23];

  [v21 appendString:@"}"];
  _Block_object_dispose(&v38, 8);
  return v21;
}

uint64_t __23__USBudget_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1 + 32;
  id v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v5 + 8) + 8) + 24)) {
    return [v4 appendFormat:@", %@: %@", a2, a3];
  }
  uint64_t result = [v4 appendFormat:@"%@: %@", a2, a3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (NSSet)items
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)categoryIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)bundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)webDomains
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)calendarIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)schedule
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end