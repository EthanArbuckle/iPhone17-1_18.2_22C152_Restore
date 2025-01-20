@interface UIUserNotificationSettings
+ (BOOL)supportsSecureCoding;
+ (UIUserNotificationSettings)settingsForTypes:(UIUserNotificationType)types categories:(NSSet *)categories;
+ (id)settingsForRegisteredSettings:(id)a3 requestedSettings:(id)a4;
+ (id)settingsForUserNotificationTypes:(unint64_t)a3 userNotificationActionSettings:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)mayPresentUserNotificationOfType:(unint64_t)a3;
- (NSSet)categories;
- (UIUserNotificationSettings)initWithCoder:(id)a3;
- (UIUserNotificationSettings)initWithTypes:(unint64_t)a3 categories:(id)a4;
- (UIUserNotificationSettings)initWithUserNotificationTypes:(unint64_t)a3 userNotificationActionSettings:(id)a4;
- (UIUserNotificationType)types;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)userNotificationActionSettings;
- (id)validatedSettings;
- (unint64_t)allowedUserNotificationTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIUserNotificationSettings

+ (id)settingsForUserNotificationTypes:(unint64_t)a3 userNotificationActionSettings:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUserNotificationTypes:a3 userNotificationActionSettings:v5];

  return v6;
}

+ (UIUserNotificationSettings)settingsForTypes:(UIUserNotificationType)types categories:(NSSet *)categories
{
  id v5 = categories;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTypes:types categories:v5];

  return (UIUserNotificationSettings *)v6;
}

+ (id)settingsForRegisteredSettings:(id)a3 requestedSettings:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 types];
  uint64_t v8 = [v6 types] & v7;
  v9 = [v6 categories];

  v10 = [a1 settingsForTypes:v8 categories:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationSettings)initWithUserNotificationTypes:(unint64_t)a3 userNotificationActionSettings:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [UIUserNotificationCategory alloc];
          v13 = [v11 category];
          v14 = [v11 actionsByContext];
          v15 = [(UIUserNotificationCategory *)v12 initWithIdentifier:v13 actionsByContext:v14];

          [v5 addObject:v15];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  v16 = [(UIUserNotificationSettings *)self initWithTypes:a3 categories:v5];
  return v16;
}

- (UIUserNotificationSettings)initWithTypes:(unint64_t)a3 categories:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UIUserNotificationSettings;
  uint64_t v7 = [(UIUserNotificationSettings *)&v23 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_types = a3;
    uint64_t v9 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = objc_msgSend(v15, "copy", (void)v19);
            [(NSSet *)v9 addObject:v16];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    categories = v8->_categories;
    v8->_categories = v9;
  }
  return v8;
}

- (UIUserNotificationSettings)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"kUserNotificationTypesKey"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
  uint64_t v8 = objc_msgSend(v6, "setWithArray:", v7, v12, v13);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kUserNotificationCategoriesKey"];

  id v10 = [(UIUserNotificationSettings *)self initWithTypes:v5 categories:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t types = self->_types;
  id v5 = a3;
  [v5 encodeInteger:types forKey:@"kUserNotificationTypesKey"];
  [v5 encodeObject:self->_categories forKey:@"kUserNotificationCategoriesKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t types = self->_types;
  categories = self->_categories;
  return (id)[v4 initWithTypes:types categories:categories];
}

- (unint64_t)hash
{
  unint64_t types = self->_types;
  return [(NSSet *)self->_categories hash] ^ types;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t types = self->_types;
    id v6 = v4;
    uint64_t v7 = [v6 types];
    categories = self->_categories;
    uint64_t v9 = [v6 categories];

    char v10 = [(NSSet *)categories isEqual:v9];
    if (types == v7) {
      BOOL v11 = v10;
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)mayPresentUserNotificationOfType:(unint64_t)a3
{
  return (self->_types & a3) != 0;
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p types: ("), objc_opt_class(), self;;
  id v4 = v3;
  unint64_t types = self->_types;
  if ((types & 4) != 0)
  {
    [v3 appendString:@"UIUserNotificationTypeAlert"];
    unint64_t types = self->_types;
    if ((types & 1) == 0)
    {
LABEL_3:
      if ((types & 2) == 0) {
        goto LABEL_4;
      }
LABEL_12:
      [v4 appendString:@" UIUserNotificationTypeSound"];
      if (self->_types) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  else if ((types & 1) == 0)
  {
    goto LABEL_3;
  }
  [v4 appendString:@" UIUserNotificationTypeBadge"];
  unint64_t types = self->_types;
  if ((types & 2) != 0) {
    goto LABEL_12;
  }
LABEL_4:
  if (types) {
    goto LABEL_5;
  }
LABEL_13:
  [v4 appendString:@"none"];
LABEL_5:
  [v4 appendString:@";"]);
  if ([(NSSet *)self->_categories count]) {
    [v4 appendFormat:@"categories: %@;", self->_categories];
  }
  [v4 appendString:@">"];
  return v4;
}

- (id)validatedSettings
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = self;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSSet count](v2->_categories, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2->_categories;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v4);
      }
      char v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      BOOL v11 = objc_msgSend(v10, "validatedCategory", (void)v16);
      BOOL v12 = v11 != v10;
      if (v11) {
        [v3 addObject:v11];
      }
      v7 |= v12;
    }
    uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v6);

  if (v7)
  {
    uint64_t v13 = [(UIUserNotificationSettings *)v2 copy];

    id v14 = v3;
    id v4 = *(NSSet **)(v13 + 16);
    *(void *)(v13 + 16) = v14;
    v2 = (UIUserNotificationSettings *)v13;
LABEL_12:
  }
  return v2;
}

- (unint64_t)allowedUserNotificationTypes
{
  return self->_types;
}

- (id)userNotificationActionSettings
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSSet count](self->_categories, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_categories;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v10 = [UIUserNotificationActionSettings alloc];
        BOOL v11 = objc_msgSend(v9, "identifier", (void)v15);
        BOOL v12 = [v9 actionsByContext];
        uint64_t v13 = [(UIUserNotificationActionSettings *)v10 initWithCategory:v11 actionsByContext:v12];

        [v3 addObject:v13];
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (UIUserNotificationType)types
{
  return self->_types;
}

- (NSSet)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
}

@end