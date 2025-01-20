@interface SBHSpecialWidgetDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)sbh_canBeAddedToStack;
- (BOOL)sbh_supportsRemovableBackground;
- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies;
- (SBHSpecialWidgetDescriptor)initWithCoder:(id)a3;
- (SBHSpecialWidgetDescriptor)initWithType:(unint64_t)a3;
- (id)_initWithType:(unint64_t)a3 supportedSizeClasses:(unint64_t)a4;
- (id)accentColor;
- (id)backgroundColor;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)displayName;
- (id)succinctDescriptionBuilder;
- (id)widgetDescription;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SBHSpecialWidgetDescriptor

- (SBHSpecialWidgetDescriptor)initWithType:(unint64_t)a3
{
  return (SBHSpecialWidgetDescriptor *)-[SBHSpecialWidgetDescriptor _initWithType:supportedSizeClasses:](self, "_initWithType:supportedSizeClasses:");
}

- (id)_initWithType:(unint64_t)a3 supportedSizeClasses:(unint64_t)a4
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:&stru_1F2FA0300 containerBundleIdentifier:0 deviceIdentifier:0];
  v22.receiver = self;
  v22.super_class = (Class)SBHSpecialWidgetDescriptor;
  v8 = [(SBHSpecialWidgetDescriptor *)&v22 initWithExtensionIdentity:v7 kind:&stru_1F2FA0300 supportedFamilies:a4 intentType:0];
  if (v8)
  {
    switch(a3)
    {
      case 1uLL:
        v9 = SBHBundle();
        v10 = v9;
        v11 = @"SIRI_SUGGESTIONS_WIDGET_DISPLAY_NAME";
        goto LABEL_9;
      case 2uLL:
        v9 = SBHBundle();
        v10 = v9;
        v11 = @"SHORTCUTS_FOLDER_WIDGET_DISPLAY_NAME";
        goto LABEL_9;
      case 3uLL:
        v9 = SBHBundle();
        v10 = v9;
        v11 = @"FILES_WIDGET_DISPLAY_NAME";
        goto LABEL_9;
      case 4uLL:
        v9 = SBHBundle();
        v10 = v9;
        v11 = @"APP_PREDICTIONS_WIDGET_DISPLAY_NAME";
        goto LABEL_9;
      case 5uLL:
        v9 = SBHBundle();
        v10 = v9;
        v11 = @"WIDGET_ADD_SHEET_SUGGESTED_STACK_DISPLAY_NAME";
        goto LABEL_9;
      case 6uLL:
        v9 = SBHBundle();
        v10 = v9;
        v11 = @"SHORTCUTS_SINGLE_WIDGET_DISPLAY_NAME";
LABEL_9:
        v12 = [v9 localizedStringForKey:v11 value:&stru_1F2FA0300 table:@"SpringBoardHome"];

        break;
      default:
        v12 = @"None";
        break;
    }
    uint64_t v13 = [(__CFString *)v12 copy];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v13;

    switch(a3)
    {
      case 1uLL:
        v15 = SBHBundle();
        v16 = v15;
        v17 = @"SIRI_SUGGESTIONS_WIDGET_DESCRIPTION";
        goto LABEL_17;
      case 2uLL:
        v15 = SBHBundle();
        v16 = v15;
        v17 = @"SHORTCUTS_FOLDER_WIDGET_DESCRIPTION";
        goto LABEL_17;
      case 3uLL:
        v15 = SBHBundle();
        v16 = v15;
        v17 = @"FILES_WIDGET_DESCRIPTION";
        goto LABEL_17;
      case 4uLL:
        v15 = SBHBundle();
        v16 = v15;
        v17 = @"APP_PREDICTIONS_WIDGET_DESCRIPTION";
        goto LABEL_17;
      case 5uLL:
        v15 = SBHBundle();
        v16 = v15;
        v17 = @"WIDGET_ADD_SHEET_SUGGESTED_STACK_DESCRIPTION";
        goto LABEL_17;
      case 6uLL:
        v15 = SBHBundle();
        v16 = v15;
        v17 = @"SHORTCUTS_SINGLE_WIDGET_DESCRIPTION";
LABEL_17:
        v18 = [v15 localizedStringForKey:v17 value:&stru_1F2FA0300 table:@"SpringBoardHome"];

        break;
      default:
        v18 = @"None";
        break;
    }
    uint64_t v19 = [(__CFString *)v18 copy];
    description = v8->_description;
    v8->_description = (NSString *)v19;

    v8->_type = a3;
  }

  return v8;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)widgetDescription
{
  return self->_description;
}

- (BOOL)sbh_canBeAddedToStack
{
  return (self->_type < 7) & (0x4Fu >> self->_type);
}

- (BOOL)sbh_supportsRemovableBackground
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (id)backgroundColor
{
  if (self->_type == 5)
  {
    v2 = [MEMORY[0x1E4FB1618] systemTealColor];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)accentColor
{
  if (self->_type == 5)
  {
    v2 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v9 = [v8 type], v9 == -[SBHSpecialWidgetDescriptor type](self, "type")))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHSpecialWidgetDescriptor;
    BOOL v10 = [(SBHSpecialWidgetDescriptor *)&v12 isEqual:v6];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SBHSpecialWidgetDescriptor;
  unint64_t v3 = [(SBHSpecialWidgetDescriptor *)&v7 hash];
  id v4 = [(SBHSpecialWidgetDescriptor *)self displayName];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)succinctDescriptionBuilder
{
  v5.receiver = self;
  v5.super_class = (Class)SBHSpecialWidgetDescriptor;
  unint64_t v3 = [(SBHSpecialWidgetDescriptor *)&v5 succinctDescriptionBuilder];
  [v3 appendString:self->_displayName withName:@"displayName"];
  [v3 appendString:self->_description withName:@"description"];
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHSpecialWidgetDescriptor;
  id v4 = [(SBHSpecialWidgetDescriptor *)&v6 descriptionBuilderWithMultilinePrefix:a3];
  [v4 appendString:self->_displayName withName:@"displayName"];
  [v4 appendString:self->_description withName:@"description"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHSpecialWidgetDescriptor;
  id v4 = a3;
  [(SBHSpecialWidgetDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
}

- (SBHSpecialWidgetDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHSpecialWidgetDescriptor;
  objc_super v5 = [(SBHSpecialWidgetDescriptor *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end