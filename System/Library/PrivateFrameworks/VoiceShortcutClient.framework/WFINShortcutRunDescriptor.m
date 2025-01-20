@interface WFINShortcutRunDescriptor
+ (BOOL)supportsSecureCoding;
- (INShortcut)shortcut;
- (WFINShortcutRunDescriptor)initWithCoder:(id)a3;
- (WFINShortcutRunDescriptor)initWithShortcut:(id)a3;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFINShortcutRunDescriptor

- (void).cxx_destruct
{
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (id)kind
{
  return @"INShortcut";
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFINShortcutRunDescriptor *)self shortcut];
  [v4 encodeObject:v5 forKey:@"shortcut"];
}

- (WFINShortcutRunDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];

  v6 = [(WFINShortcutRunDescriptor *)self initWithShortcut:v5];
  return v6;
}

- (WFINShortcutRunDescriptor)initWithShortcut:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 141, @"Invalid parameter not satisfying: %@", @"shortcut" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFINShortcutRunDescriptor;
  v7 = [(WFINShortcutRunDescriptor *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_shortcut, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end