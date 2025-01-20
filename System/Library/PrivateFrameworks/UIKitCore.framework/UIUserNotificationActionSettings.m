@interface UIUserNotificationActionSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)actionsByContext;
- (NSString)category;
- (UIUserNotificationActionSettings)initWithCategory:(id)a3 actionsByContext:(id)a4;
- (UIUserNotificationActionSettings)initWithCoder:(id)a3;
- (id)actions;
- (id)actionsForContext:(unint64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)validatedSettings;
- (unint64_t)_maximumActionsForContext:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionsByContext:(id)a3;
- (void)setCategory:(id)a3;
@end

@implementation UIUserNotificationActionSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationActionSettings)initWithCategory:(id)a3 actionsByContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIUserNotificationActionSettings;
  v8 = [(UIUserNotificationActionSettings *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    category = v8->_category;
    v8->_category = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    actionsByContext = v8->_actionsByContext;
    v8->_actionsByContext = (NSDictionary *)v11;
  }
  return v8;
}

- (UIUserNotificationActionSettings)initWithCoder:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCategoryKey"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kActionsByContextKey"];

  v10 = [(UIUserNotificationActionSettings *)self initWithCategory:v5 actionsByContext:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  category = self->_category;
  id v5 = a3;
  [v5 encodeObject:category forKey:@"kCategoryKey"];
  [v5 encodeObject:self->_actionsByContext forKey:@"kActionsByContextKey"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UIMutableUserNotificationActionSettings alloc];
  category = self->_category;
  actionsByContext = self->_actionsByContext;
  return [(UIUserNotificationActionSettings *)v4 initWithCategory:category actionsByContext:actionsByContext];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_category hash];
  return [(NSDictionary *)self->_actionsByContext hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)v4[1];
    category = self->_category;
    id v7 = v4;
    LODWORD(v5) = [v5 isEqualToString:category];
    v8 = (void *)v7[2];

    int v9 = v5 & [v8 isEqual:self->_actionsByContext];
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; category: %@, actions: %@>",
               objc_opt_class(),
               self,
               self->_category,
               self->_actionsByContext);
}

- (id)actions
{
  return [(UIUserNotificationActionSettings *)self actionsForContext:0];
}

- (id)actionsForContext:(unint64_t)a3
{
  actionsByContext = self->_actionsByContext;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSDictionary *)actionsByContext objectForKey:v4];

  return v5;
}

- (id)validatedSettings
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](self->_actionsByContext, "count"));
  v24 = v23 = self;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  NSUInteger v3 = [(NSDictionary *)self->_actionsByContext allKeys];
  uint64_t v25 = [v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    char v4 = 0;
    obuint64_t j = v3;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v7 = [(NSDictionary *)v23->_actionsByContext objectForKey:v6];
        unint64_t v8 = [(UIUserNotificationActionSettings *)v23 _maximumActionsForContext:v6];
        if ([v7 count] > v8)
        {
          uint64_t v9 = objc_msgSend(v7, "subarrayWithRange:", 0, v8);

          char v4 = 1;
          id v7 = (void *)v9;
        }
        v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v11 = v7;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              v17 = [v16 validatedAction];
              v4 |= v17 != v16;
              [v10 addObject:v17];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v13);
        }

        [v24 setObject:v10 forKey:v6];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);

    if (v4)
    {
      v18 = (UIUserNotificationActionSettings *)[objc_alloc((Class)objc_opt_class()) initWithCategory:v23->_category actionsByContext:v24];
      goto LABEL_21;
    }
  }
  else
  {
  }
  v18 = v23;
LABEL_21:
  v19 = v18;

  return v19;
}

- (unint64_t)_maximumActionsForContext:(unint64_t)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return 4;
  }
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSDictionary)actionsByContext
{
  return self->_actionsByContext;
}

- (void)setActionsByContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByContext, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end