@interface UIMutableUserNotificationCategory
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActions:(NSArray *)actions forContext:(UIUserNotificationActionContext)context;
@end

@implementation UIMutableUserNotificationCategory

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UIUserNotificationCategory alloc];
  v5 = [(UIUserNotificationCategory *)self identifier];
  v6 = [(UIUserNotificationCategory *)self actionsByContext];
  v7 = [(UIUserNotificationCategory *)v4 initWithIdentifier:v5 actionsByContext:v6];

  return v7;
}

- (void)setActions:(NSArray *)actions forContext:(UIUserNotificationActionContext)context
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v6 = actions;
  v7 = [(UIUserNotificationCategory *)self actionsByContext];
  v8 = (void *)[v7 mutableCopy];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v11 = v10;

  v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = v6;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v12, "addObject:", v18, (void)v20);
        }
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  v19 = [NSNumber numberWithUnsignedInteger:context];
  [v11 setObject:v12 forKey:v19];

  [(UIUserNotificationCategory *)self setActionsByContext:v11];
}

@end