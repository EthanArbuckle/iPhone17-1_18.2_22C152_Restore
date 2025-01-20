@interface UIRuntimeAccessibilityConfiguration
- (NSNumber)accessibilityConfigurationTraits;
- (NSNumber)isAccessibilityConfigurationElement;
- (NSObject)object;
- (NSString)accessibilityConfigurationHint;
- (NSString)accessibilityConfigurationIdentifier;
- (NSString)accessibilityConfigurationLabel;
- (UIRuntimeAccessibilityConfiguration)initWithCoder:(id)a3;
- (UIRuntimeAccessibilityConfiguration)initWithObject:(id)a3 label:(id)a4 hint:(id)a5 traits:(id)a6 andIsAccessibilityElement:(id)a7;
- (UIRuntimeAccessibilityConfiguration)initWithObject:(id)a3 label:(id)a4 identifier:(id)a5 hint:(id)a6 traits:(id)a7 andIsAccessibilityElement:(id)a8;
- (void)applyConfiguration;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityConfigurationHint:(id)a3;
- (void)setAccessibilityConfigurationIdentifier:(id)a3;
- (void)setAccessibilityConfigurationLabel:(id)a3;
- (void)setAccessibilityConfigurationTraits:(id)a3;
- (void)setIsAccessibilityConfigurationElement:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation UIRuntimeAccessibilityConfiguration

- (UIRuntimeAccessibilityConfiguration)initWithObject:(id)a3 label:(id)a4 hint:(id)a5 traits:(id)a6 andIsAccessibilityElement:(id)a7
{
  return [(UIRuntimeAccessibilityConfiguration *)self initWithObject:a3 label:a4 identifier:0 hint:a5 traits:a6 andIsAccessibilityElement:a7];
}

- (UIRuntimeAccessibilityConfiguration)initWithObject:(id)a3 label:(id)a4 identifier:(id)a5 hint:(id)a6 traits:(id)a7 andIsAccessibilityElement:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)UIRuntimeAccessibilityConfiguration;
  v21 = [(UIRuntimeAccessibilityConfiguration *)&v34 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->object, a3);
    uint64_t v23 = [v18 copy];
    accessibilityConfigurationHint = v22->accessibilityConfigurationHint;
    v22->accessibilityConfigurationHint = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    accessibilityConfigurationIdentifier = v22->accessibilityConfigurationIdentifier;
    v22->accessibilityConfigurationIdentifier = (NSString *)v25;

    uint64_t v27 = [v16 copy];
    accessibilityConfigurationLabel = v22->accessibilityConfigurationLabel;
    v22->accessibilityConfigurationLabel = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    accessibilityConfigurationTraits = v22->accessibilityConfigurationTraits;
    v22->accessibilityConfigurationTraits = (NSNumber *)v29;

    uint64_t v31 = [v20 copy];
    isAccessibilityConfigurationElement = v22->isAccessibilityConfigurationElement;
    v22->isAccessibilityConfigurationElement = (NSNumber *)v31;
  }
  return v22;
}

- (UIRuntimeAccessibilityConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIRuntimeAccessibilityConfiguration;
  v5 = [(UIRuntimeAccessibilityConfiguration *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIAccessibileObject"];
    object = v5->object;
    v5->object = v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UIAccessibilityHint"];
    accessibilityConfigurationHint = v5->accessibilityConfigurationHint;
    v5->accessibilityConfigurationHint = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"UIAccessibilityIdentifier"];
    accessibilityConfigurationIdentifier = v5->accessibilityConfigurationIdentifier;
    v5->accessibilityConfigurationIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"UIAccessibilityLabel"];
    accessibilityConfigurationLabel = v5->accessibilityConfigurationLabel;
    v5->accessibilityConfigurationLabel = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"UIAccessibilityTraits"];
    accessibilityConfigurationTraits = v5->accessibilityConfigurationTraits;
    v5->accessibilityConfigurationTraits = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"UIIsAccessibilityElement"];
    isAccessibilityConfigurationElement = v5->isAccessibilityConfigurationElement;
    v5->isAccessibilityConfigurationElement = (NSNumber *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  object = self->object;
  id v11 = v4;
  if (object)
  {
    [v4 encodeObject:object forKey:@"UIAccessibileObject"];
    id v4 = v11;
  }
  accessibilityConfigurationHint = self->accessibilityConfigurationHint;
  if (accessibilityConfigurationHint)
  {
    [v11 encodeObject:accessibilityConfigurationHint forKey:@"UIAccessibilityHint"];
    id v4 = v11;
  }
  accessibilityConfigurationIdentifier = self->accessibilityConfigurationIdentifier;
  if (accessibilityConfigurationIdentifier)
  {
    [v11 encodeObject:accessibilityConfigurationIdentifier forKey:@"UIAccessibilityIdentifier"];
    id v4 = v11;
  }
  accessibilityConfigurationLabel = self->accessibilityConfigurationLabel;
  if (accessibilityConfigurationLabel)
  {
    [v11 encodeObject:accessibilityConfigurationLabel forKey:@"UIAccessibilityLabel"];
    id v4 = v11;
  }
  accessibilityConfigurationTraits = self->accessibilityConfigurationTraits;
  if (accessibilityConfigurationTraits)
  {
    [v11 encodeObject:accessibilityConfigurationTraits forKey:@"UIAccessibilityTraits"];
    id v4 = v11;
  }
  isAccessibilityConfigurationElement = self->isAccessibilityConfigurationElement;
  if (isAccessibilityConfigurationElement)
  {
    [v11 encodeObject:isAccessibilityConfigurationElement forKey:@"UIIsAccessibilityElement"];
    id v4 = v11;
  }
}

- (void)applyConfiguration
{
  isAccessibilityConfigurationElement = self->isAccessibilityConfigurationElement;
  if (isAccessibilityConfigurationElement) {
    [self->object setIsAccessibilityElement:[(NSNumber *)isAccessibilityConfigurationElement BOOLValue]];
  }
  if (self->accessibilityConfigurationHint) {
    -[NSObject setAccessibilityHint:](self->object, "setAccessibilityHint:");
  }
  if (self->accessibilityConfigurationIdentifier) {
    -[NSObject setAccessibilityIdentifier:](self->object, "setAccessibilityIdentifier:");
  }
  if (self->accessibilityConfigurationLabel) {
    -[NSObject setAccessibilityLabel:](self->object, "setAccessibilityLabel:");
  }
  accessibilityConfigurationTraits = self->accessibilityConfigurationTraits;
  if (accessibilityConfigurationTraits)
  {
    object = self->object;
    uint64_t v6 = [(NSNumber *)accessibilityConfigurationTraits longLongValue];
    [object setAccessibilityTraits:v6];
  }
}

- (NSString)accessibilityConfigurationHint
{
  return self->accessibilityConfigurationHint;
}

- (void)setAccessibilityConfigurationHint:(id)a3
{
}

- (NSString)accessibilityConfigurationIdentifier
{
  return self->accessibilityConfigurationIdentifier;
}

- (void)setAccessibilityConfigurationIdentifier:(id)a3
{
}

- (NSString)accessibilityConfigurationLabel
{
  return self->accessibilityConfigurationLabel;
}

- (void)setAccessibilityConfigurationLabel:(id)a3
{
}

- (NSNumber)accessibilityConfigurationTraits
{
  return self->accessibilityConfigurationTraits;
}

- (void)setAccessibilityConfigurationTraits:(id)a3
{
}

- (NSNumber)isAccessibilityConfigurationElement
{
  return self->isAccessibilityConfigurationElement;
}

- (void)setIsAccessibilityConfigurationElement:(id)a3
{
}

- (NSObject)object
{
  return self->object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->object, 0);
  objc_storeStrong((id *)&self->isAccessibilityConfigurationElement, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationTraits, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationLabel, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->accessibilityConfigurationHint, 0);
}

@end