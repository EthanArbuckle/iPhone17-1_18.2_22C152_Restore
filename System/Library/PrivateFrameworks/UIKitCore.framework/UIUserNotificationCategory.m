@interface UIUserNotificationCategory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)actionsForContext:(UIUserNotificationActionContext)context;
- (NSDictionary)actionsByContext;
- (NSString)identifier;
- (UIUserNotificationCategory)init;
- (UIUserNotificationCategory)initWithCoder:(NSCoder *)coder;
- (UIUserNotificationCategory)initWithIdentifier:(id)a3 actionsByContext:(id)a4;
- (id)actions;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)validatedCategory;
- (unint64_t)_maximumActionsForContext:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionsByContext:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation UIUserNotificationCategory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationCategory)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIUserNotificationCategory;
  return [(UIUserNotificationCategory *)&v3 init];
}

- (UIUserNotificationCategory)initWithIdentifier:(id)a3 actionsByContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIUserNotificationCategory *)self init];
  v9 = v8;
  if (v8) {
    UIUserNotificationCategoryCommonInit(v8, v6, v7);
  }

  return v9;
}

- (UIUserNotificationCategory)initWithCoder:(NSCoder *)coder
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v4 = coder;
  v12.receiver = self;
  v12.super_class = (Class)UIUserNotificationCategory;
  v5 = [(UIUserNotificationCategory *)&v12 init];
  if (v5)
  {
    id v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCategoryIdentifierKey"];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    v9 = [v7 setWithArray:v8];
    v10 = [(NSCoder *)v4 decodeObjectOfClasses:v9 forKey:@"kActionsByContextKey"];

    UIUserNotificationCategoryCommonInit(v5, v6, v10);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"kCategoryIdentifierKey"];
  [v5 encodeObject:self->_actionsByContext forKey:@"kActionsByContextKey"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [UIMutableUserNotificationCategory alloc];
  identifier = self->_identifier;
  actionsByContext = self->_actionsByContext;
  return [(UIUserNotificationCategory *)v4 initWithIdentifier:identifier actionsByContext:actionsByContext];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSDictionary *)self->_actionsByContext hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)v4[1];
    identifier = self->_identifier;
    id v7 = v4;
    LODWORD(v5) = [v5 isEqualToString:identifier];
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
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier: %@, actions: %@>",
               objc_opt_class(),
               self,
               self->_identifier,
               self->_actionsByContext);
}

- (id)actions
{
  return [(UIUserNotificationCategory *)self actionsForContext:0];
}

- (NSArray)actionsForContext:(UIUserNotificationActionContext)context
{
  actionsByContext = self->_actionsByContext;
  v4 = [NSNumber numberWithUnsignedInteger:context];
  id v5 = [(NSDictionary *)actionsByContext objectForKey:v4];

  return (NSArray *)v5;
}

- (id)validatedCategory
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(UIUserNotificationCategory *)self identifier];

  if (!v3)
  {
    NSLog(&cfstr_IgnoringUiuser.isa, v2);
    v20 = 0;
    goto LABEL_24;
  }
  v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](v2->_actionsByContext, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = [(NSDictionary *)v2->_actionsByContext allKeys];
  uint64_t v26 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v26)
  {

LABEL_22:
    v19 = v2;
    goto LABEL_23;
  }
  char v5 = 0;
  uint64_t v23 = *(void *)v32;
  v24 = v2;
  obuint64_t j = v4;
  do
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v32 != v23) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      v8 = [(NSDictionary *)v2->_actionsByContext objectForKey:v7];
      unint64_t v9 = -[UIUserNotificationCategory _maximumActionsForContext:](v2, "_maximumActionsForContext:", [v7 unsignedIntegerValue]);
      if ([v8 count] > v9)
      {
        uint64_t v10 = objc_msgSend(v8, "subarrayWithRange:", 0, v9);

        char v5 = 1;
        v8 = (void *)v10;
      }
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            v18 = [v17 validatedAction];
            v5 |= v18 != v17;
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v14);
      }

      [v25 setObject:v11 forKey:v7];
      v2 = v24;
    }
    uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v26);

  if ((v5 & 1) == 0) {
    goto LABEL_22;
  }
  v19 = (UIUserNotificationCategory *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:v24->_identifier actionsByContext:v25];
LABEL_23:
  v20 = v19;

LABEL_24:
  return v20;
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end