@interface UIUserNotificationAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isAuthenticationRequired;
- (BOOL)isDestructive;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)parameters;
- (NSString)activationModeString;
- (NSString)behaviorString;
- (NSString)identifier;
- (NSString)title;
- (UIUserNotificationAction)init;
- (UIUserNotificationAction)initWithCoder:(NSCoder *)coder;
- (UIUserNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 behavior:(unint64_t)a5 parameters:(id)a6 activationMode:(unint64_t)a7 isAuthenticationRequired:(BOOL)a8 isDestructive:(BOOL)a9;
- (UIUserNotificationActionBehavior)behavior;
- (UIUserNotificationActivationMode)activationMode;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)validatedAction;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationMode:(unint64_t)a3;
- (void)setAuthenticationRequired:(BOOL)a3;
- (void)setBehavior:(unint64_t)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIUserNotificationAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIUserNotificationAction)initWithIdentifier:(id)a3 title:(id)a4 behavior:(unint64_t)a5 parameters:(id)a6 activationMode:(unint64_t)a7 isAuthenticationRequired:(BOOL)a8 isDestructive:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v18 = [(UIUserNotificationAction *)self init];
  v19 = v18;
  if (v18) {
    UIUserNotificationActionCommonSetup(v18, v15, v16, a5, v17, a7, a8, a9);
  }

  return v19;
}

- (UIUserNotificationAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIUserNotificationAction;
  return [(UIUserNotificationAction *)&v3 init];
}

- (UIUserNotificationAction)initWithCoder:(NSCoder *)coder
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = coder;
  v5 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentifierKey"];
  v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitleKey"];
  uint64_t v7 = [(NSCoder *)v4 decodeIntegerForKey:@"kBehaviorKey"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:3];
  v10 = objc_msgSend(v8, "setWithArray:", v9, v15, v16);
  v11 = [(NSCoder *)v4 decodeObjectOfClasses:v10 forKey:@"kParametersKey"];

  uint64_t v12 = [(NSCoder *)v4 decodeIntegerForKey:@"kActivationModeKey"];
  LOBYTE(v9) = [(NSCoder *)v4 decodeBoolForKey:@"kIsAuthenticationRequiredKey"];
  char v13 = [(NSCoder *)v4 decodeBoolForKey:@"kIsDestructiveKey"];

  UIUserNotificationActionCommonSetup(self, v5, v6, v7, v11, v12, (char)v9, v13);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"kIdentifierKey"];
  [v5 encodeObject:self->_title forKey:@"kTitleKey"];
  [v5 encodeInteger:self->_behavior forKey:@"kBehaviorKey"];
  [v5 encodeObject:self->_parameters forKey:@"kParametersKey"];
  [v5 encodeInteger:self->_activationMode forKey:@"kActivationModeKey"];
  [v5 encodeBool:self->_authenticationRequired forKey:@"kIsAuthenticationRequiredKey"];
  [v5 encodeBool:self->_destructive forKey:@"kIsDestructiveKey"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [UIMutableUserNotificationAction alloc];
  LOBYTE(v6) = self->_destructive;
  return [(UIUserNotificationAction *)v4 initWithIdentifier:self->_identifier title:self->_title behavior:self->_behavior parameters:self->_parameters activationMode:self->_activationMode isAuthenticationRequired:self->_authenticationRequired isDestructive:v6];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  uint64_t behavior_low = SLODWORD(self->_behavior);
  return v4 ^ behavior_low ^ [(NSDictionary *)self->_parameters hash] ^ self->_activationMode ^ self->_authenticationRequired ^ self->_destructive;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    id v6 = v4;
    uint64_t v7 = [v6 identifier];
    LODWORD(identifier) = [(NSString *)identifier isEqualToString:v7];

    title = self->_title;
    v9 = [v6 title];
    unsigned int v10 = identifier & [(NSString *)title isEqualToString:v9];

    unint64_t behavior = self->_behavior;
    if (behavior == [v6 behavior]) {
      unsigned int v12 = v10;
    }
    else {
      unsigned int v12 = 0;
    }
    parameters = self->_parameters;
    v14 = [v6 parameters];
    BOOL v15 = v12 & [(NSDictionary *)parameters isEqualToDictionary:v14];

    unint64_t activationMode = self->_activationMode;
    if (activationMode != [v6 activationMode]) {
      LOBYTE(v15) = 0;
    }
    int authenticationRequired = self->_authenticationRequired;
    if (authenticationRequired != [v6 isAuthenticationRequired]) {
      LOBYTE(v15) = 0;
    }
    int destructive = self->_destructive;
    int v19 = [v6 isDestructive];

    BOOL v20 = destructive == v19 && v15;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (NSString)activationModeString
{
  activationModeString = (__CFString *)self->_activationModeString;
  if (!activationModeString)
  {
    unint64_t activationMode = self->_activationMode;
    if (activationMode == 1)
    {
      activationModeString = @"UIUserNotificationActivationModeBackground";
    }
    else
    {
      if (activationMode)
      {
        activationModeString = 0;
        return (NSString *)activationModeString;
      }
      activationModeString = @"UIUserNotificationActivationModeForeground";
    }
    self->_activationModeString = &activationModeString->isa;
  }
  return (NSString *)activationModeString;
}

- (NSString)behaviorString
{
  if (!self->_activationModeString)
  {
    unint64_t behavior = self->_behavior;
    if (!behavior)
    {
      NSUInteger v3 = @"UIUserNotificationActionBehaviorDefault";
      goto LABEL_6;
    }
    if (behavior == 1)
    {
      NSUInteger v3 = @"UIUserNotificationActionBehaviorTextInput";
LABEL_6:
      self->_behaviorString = &v3->isa;
    }
  }
  return self->_behaviorString;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  identifier = self->_identifier;
  title = self->_title;
  uint64_t v7 = [(UIUserNotificationAction *)self behaviorString];
  v8 = [(UIUserNotificationAction *)self activationModeString];
  v9 = NSStringFromBOOL();
  unsigned int v10 = NSStringFromBOOL();
  v11 = [(NSDictionary *)self->_parameters description];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@, title: %@, behavior: %@, activationMode: %@, isAuthenticationRequired:%@, isDestructive:%@, parameters: %@>",
    v4,
    self,
    identifier,
    title,
    v7,
    v8,
    v9,
    v10,
  unsigned int v12 = v11);

  return v12;
}

- (id)validatedAction
{
  v2 = self;
  NSUInteger v3 = v2;
  if (!v2->_activationMode && !v2->_authenticationRequired)
  {
    uint64_t v4 = [(UIUserNotificationAction *)v2 copy];

    *(unsigned char *)(v4 + 8) = 1;
    NSUInteger v3 = (void *)v4;
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIUserNotificationActionBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(unint64_t)a3
{
  self->_unint64_t behavior = a3;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (UIUserNotificationActivationMode)activationMode
{
  return self->_activationMode;
}

- (void)setActivationMode:(unint64_t)a3
{
  self->_unint64_t activationMode = a3;
}

- (BOOL)isAuthenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_int authenticationRequired = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_int destructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end