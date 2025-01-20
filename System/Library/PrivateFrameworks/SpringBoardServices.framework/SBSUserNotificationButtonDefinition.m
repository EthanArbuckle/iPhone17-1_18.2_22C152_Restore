@interface SBSUserNotificationButtonDefinition
+ (id)_buttonDefinitionsFromSerializedDefinitions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredButton;
- (NSString)title;
- (SBSUserNotificationButtonDefinition)init;
- (SBSUserNotificationButtonDefinition)initWithTitle:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)build;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)presentationStyle;
- (unint64_t)hash;
- (void)_copyPropertiesToDefinition:(id)a3;
@end

@implementation SBSUserNotificationButtonDefinition

- (SBSUserNotificationButtonDefinition)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSCFUserNotificationButtonDefinition.m" lineNumber:29 description:@"[SBSUserNotificationButtonDefinition init] is unavailable for use."];

  return 0;
}

- (id)_initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSCFUserNotificationButtonDefinition.m", 34, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v12.receiver = self;
  v12.super_class = (Class)SBSUserNotificationButtonDefinition;
  self = [(SBSUserNotificationButtonDefinition *)&v12 init];
  if (self)
  {
    [v5 bs_safeStringForKey:@"_SBSButtonTitle"];
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v6;

    if (self->_title)
    {
      v8 = [v5 bs_safeNumberForKey:@"_SBSButtonPresentationStyle"];
      self->_presentationStyle = [v8 intValue];

      self->_isPreferredButton = [v5 bs_BOOLForKey:@"_SBSButtonPreferred"];
      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
LABEL_7:
  self = self;
  v9 = self;
LABEL_9:

  return v9;
}

- (SBSUserNotificationButtonDefinition)initWithTitle:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBSCFUserNotificationButtonDefinition.m", 53, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBSUserNotificationButtonDefinition;
  v6 = [(SBSUserNotificationButtonDefinition *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    title = v6->_title;
    v6->_title = (NSString *)v7;
  }
  return v6;
}

+ (id)_buttonDefinitionsFromSerializedDefinitions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v11 = [SBSUserNotificationButtonDefinition alloc];
        id v12 = -[SBSUserNotificationButtonDefinition _initWithDictionary:](v11, "_initWithDictionary:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)build
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_title forKeyedSubscript:@"_SBSButtonTitle"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_presentationStyle];
  [v3 setObject:v4 forKeyedSubscript:@"_SBSButtonPresentationStyle"];

  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isPreferredButton];
  [v3 setObject:v5 forKeyedSubscript:@"_SBSButtonPreferred"];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

- (unint64_t)hash
{
  BOOL isPreferredButton = self->_isPreferredButton;
  return [(NSString *)self->_title hash] + 11 * isPreferredButton + self->_presentationStyle;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSUserNotificationButtonDefinition *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (BSEqualBools() && self->_presentationStyle == v5->_presentationStyle)
      {
        title = self->_title;
        uint64_t v7 = [(SBSUserNotificationButtonDefinition *)v5 title];
        char v8 = [(NSString *)title isEqualToString:v7];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void)_copyPropertiesToDefinition:(id)a3
{
  objc_storeStrong((id *)a3 + 1, self->_title);
  id v5 = a3;
  v5[4] = self->_presentationStyle;
  *((unsigned char *)v5 + 20) = self->_isPreferredButton;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(SBSUserNotificationButtonDefinition *)[SBSMutableUserNotificationButtonDefinition alloc] initWithTitle:self->_title];
  [(SBSUserNotificationButtonDefinition *)self _copyPropertiesToDefinition:v4];
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (BOOL)isPreferredButton
{
  return self->_isPreferredButton;
}

- (void).cxx_destruct
{
}

@end