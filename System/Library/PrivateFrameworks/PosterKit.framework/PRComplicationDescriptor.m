@interface PRComplicationDescriptor
+ (BOOL)supportsSecureCoding;
- (ATXComplication)suggestedComplication;
- (BOOL)hasMatchingDescriptor;
- (BOOL)isEqual:(id)a3;
- (CHSWidget)widget;
- (NSString)uniqueIdentifier;
- (PRComplicationDescriptor)initWithCoder:(id)a3;
- (PRComplicationDescriptor)initWithPRSWidget:(id)a3;
- (PRComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4;
- (PRComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 suggestedComplication:(id)a5;
- (id)PRSWidget;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)widgetDescriptor;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggestedComplication:(id)a3;
- (void)setWidget:(id)a3;
@end

@implementation PRComplicationDescriptor

- (PRComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRComplicationDescriptor;
  v8 = [(PRComplicationDescriptor *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_widget, a4);
  }

  return v8;
}

- (PRComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 suggestedComplication:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(PRComplicationDescriptor *)self initWithUniqueIdentifier:a3 widget:a4];
  v10 = v9;
  if (v9) {
    [(PRComplicationDescriptor *)v9 setSuggestedComplication:v8];
  }

  return v10;
}

- (PRComplicationDescriptor)initWithPRSWidget:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F58DD8];
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = [v5 extensionBundleIdentifier];
    id v8 = [v5 containerBundleIdentifier];
    uint64_t v9 = [v5 kind];
    uint64_t v10 = [v5 family];
    v11 = [v5 intent];
    objc_super v12 = (void *)[v6 initWithExtensionBundleIdentifier:v7 containerBundleIdentifier:v8 kind:v9 family:v10 intent:v11];

    v13 = [v5 uniqueIdentifier];

    self = [(PRComplicationDescriptor *)self initWithUniqueIdentifier:v13 widget:v12];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)hasMatchingDescriptor
{
  v3 = [(PRComplicationDescriptor *)self widgetDescriptor];
  v4 = [(PRComplicationDescriptor *)self widget];
  [v4 family];
  uint64_t v5 = CHSWidgetFamilyMaskFromWidgetFamily();

  if (v3) {
    BOOL v6 = (v5 & ~[v3 supportedFamilies]) == 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)PRSWidget
{
  id v3 = objc_alloc(MEMORY[0x1E4F923A8]);
  uniqueIdentifier = self->_uniqueIdentifier;
  uint64_t v5 = [(CHSWidget *)self->_widget kind];
  BOOL v6 = [(CHSWidget *)self->_widget extensionBundleIdentifier];
  id v7 = [(CHSWidget *)self->_widget containerBundleIdentifier];
  uint64_t v8 = [(CHSWidget *)self->_widget family];
  uint64_t v9 = [(CHSWidget *)self->_widget intent];
  uint64_t v10 = (void *)[v3 initWithUniqueIdentifier:uniqueIdentifier kind:v5 extensionBundleIdentifier:v6 containerBundleIdentifier:v7 family:v8 intent:v9];

  return v10;
}

- (id)widgetDescriptor
{
  id v3 = PRSharedWidgetExtensionProvider();
  v4 = [v3 widgetDescriptorForWidget:self->_widget];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  uniqueIdentifier = self->_uniqueIdentifier;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__PRComplicationDescriptor_isEqual___block_invoke;
  v18[3] = &unk_1E54DB098;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendString:uniqueIdentifier counterpart:v18];
  widget = self->_widget;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __36__PRComplicationDescriptor_isEqual___block_invoke_2;
  v16 = &unk_1E54DBEB0;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:widget counterpart:&v13];
  LOBYTE(widget) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)widget;
}

id __36__PRComplicationDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __36__PRComplicationDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_uniqueIdentifier];
  id v5 = (id)[v3 appendObject:self->_widget];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_uniqueIdentifier withName:@"uniqueIdentifier" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_widget withName:@"widget" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_suggestedComplication withName:@"suggestedComplication" skipIfNil:1];
  unint64_t v6 = [v3 build];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRComplicationDescriptor alloc];
  id v5 = (void *)[(NSString *)self->_uniqueIdentifier copy];
  unint64_t v6 = (void *)[(CHSWidget *)self->_widget copy];
  id v7 = (void *)[(ATXComplication *)self->_suggestedComplication copy];
  id v8 = [(PRComplicationDescriptor *)v4 initWithUniqueIdentifier:v5 widget:v6 suggestedComplication:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRComplicationDescriptor *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"uniqueIdentifier"];

  unint64_t v6 = [(PRComplicationDescriptor *)self widget];
  [v4 encodeObject:v6 forKey:@"widget"];

  id v7 = [(PRComplicationDescriptor *)self suggestedComplication];
  [v4 encodeObject:v7 forKey:@"suggestedComplication"];
}

- (PRComplicationDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widget"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedComplication"];
    self = [(PRComplicationDescriptor *)self initWithUniqueIdentifier:v5 widget:v7 suggestedComplication:v9];

    id v10 = self;
  }

  return v10;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
}

- (ATXComplication)suggestedComplication
{
  return self->_suggestedComplication;
}

- (void)setSuggestedComplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedComplication, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end