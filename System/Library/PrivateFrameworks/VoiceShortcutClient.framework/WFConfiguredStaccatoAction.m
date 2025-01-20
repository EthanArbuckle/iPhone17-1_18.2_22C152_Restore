@interface WFConfiguredStaccatoAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemStaccatoAction;
- (BOOL)usesPreviewIconSymbolOverride;
- (NSData)colorScheme;
- (NSData)shortcutsMetadata;
- (NSString)associatedBundleIdentifier;
- (NSString)identifier;
- (NSString)name;
- (NSString)sectionIdentifier;
- (NSString)systemImageName;
- (WFColor)tintColor;
- (WFConfiguredStaccatoAction)initWithCoder:(id)a3;
- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 associatedBundleIdentifier:(id)a4 name:(id)a5 previewIcon:(id)a6 shortcutsMetadata:(id)a7;
- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 associatedBundleIdentifier:(id)a4 name:(id)a5 previewIcon:(id)a6 shortcutsMetadata:(id)a7 colorScheme:(id)a8;
- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 sectionIdentifier:(id)a4 associatedBundleIdentifier:(id)a5 name:(id)a6 systemImageName:(id)a7 shortcutsMetadata:(id)a8;
- (WFIcon)previewIcon;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedBundleIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPreviewIcon:(id)a3;
- (void)setShortcutsMetadata:(id)a3;
@end

@implementation WFConfiguredStaccatoAction

- (NSString)systemImageName
{
  return (NSString *)@"app.2.stack.3d";
}

- (NSString)sectionIdentifier
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return (NSString *)@"Nothing";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return (NSString *)@"Controls";
  }
  v4 = [(WFConfiguredStaccatoAction *)self identifier];
  char v5 = [v4 isEqualToString:@"com.apple.ShortcutsActions.SetSilentModeAction"];

  if (v5) {
    return (NSString *)@"SilentMode";
  }
  v6 = [(WFConfiguredStaccatoAction *)self identifier];
  char v7 = [v6 isEqualToString:@"com.apple.springboard.Focus"];

  if (v7) {
    return (NSString *)@"Focus";
  }
  v8 = [(WFConfiguredStaccatoAction *)self identifier];
  char v9 = [v8 isEqualToString:@"com.apple.springboard.OpenCamera"];

  if (v9) {
    return (NSString *)@"Camera";
  }
  v10 = [(WFConfiguredStaccatoAction *)self identifier];
  char v11 = [v10 isEqualToString:@"com.apple.VoiceMemos.ToggleRecording"];

  if (v11) {
    return (NSString *)@"VoiceMemos";
  }
  v12 = [(WFConfiguredStaccatoAction *)self identifier];
  char v13 = [v12 isEqualToString:@"com.apple.springboard.ToggleFlashlight"];

  if (v13) {
    return (NSString *)@"Flashlight";
  }
  v14 = [(WFConfiguredStaccatoAction *)self identifier];
  char v15 = [v14 isEqualToString:@"com.apple.AccessibilityUIServer.ToggleAccessibilityFeatureIntent"];

  if (v15) {
    return (NSString *)@"Accessibility";
  }
  v16 = [(WFConfiguredStaccatoAction *)self identifier];
  char v17 = [v16 isEqualToString:@"com.apple.musicrecognition.RecognizeMusicIntent"];

  if (v17) {
    return (NSString *)@"MusicRecognition";
  }
  v18 = [(WFConfiguredStaccatoAction *)self identifier];
  char v19 = [v18 isEqualToString:@"com.apple.Translate.ToggleSpeechTranslationIntent"];

  if (v19) {
    return (NSString *)@"Translate";
  }
  v20 = [(WFConfiguredStaccatoAction *)self identifier];
  int v21 = [v20 isEqualToString:@"com.apple.Magnifier.MagnifierIntent"];

  if (v21) {
    return (NSString *)@"Magnifier";
  }
  else {
    return (NSString *)@"Shortcuts";
  }
}

- (BOOL)isSystemStaccatoAction
{
  v2 = [(WFConfiguredStaccatoAction *)self sectionIdentifier];
  BOOL v3 = v2 != @"Shortcuts";

  return v3;
}

- (WFColor)tintColor
{
  v2 = [(WFConfiguredStaccatoAction *)self sectionIdentifier];
  BOOL v3 = WFStaccatoTintColorForSectionIdentifier(v2);

  return (WFColor *)v3;
}

- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 sectionIdentifier:(id)a4 associatedBundleIdentifier:(id)a5 name:(id)a6 systemImageName:(id)a7 shortcutsMetadata:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  if (a7)
  {
    id v17 = a7;
    v18 = [WFSymbolIcon alloc];
    char v19 = +[WFColor colorWithSystemColor:21];
    a7 = [(WFSymbolIcon *)v18 initWithSymbolName:v17 symbolColor:v19];
  }
  v20 = [(WFConfiguredStaccatoAction *)self initWithIdentifier:v13 associatedBundleIdentifier:v14 name:v15 previewIcon:a7 shortcutsMetadata:v16];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_shortcutsMetadata, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_previewIcon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSData)colorScheme
{
  return self->_colorScheme;
}

- (void)setShortcutsMetadata:(id)a3
{
}

- (NSData)shortcutsMetadata
{
  return self->_shortcutsMetadata;
}

- (void)setAssociatedBundleIdentifier:(id)a3
{
}

- (NSString)associatedBundleIdentifier
{
  return self->_associatedBundleIdentifier;
}

- (void)setPreviewIcon:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFIcon)previewIcon
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v22[0] = @"Camera";
  v22[1] = @"Magnifier";
  v23[0] = @"camera.fill";
  v23[1] = @"plus.magnifyingglass";
  v22[2] = @"Accessibility";
  v23[2] = @"accessibility.fill";
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v4 = [(WFConfiguredStaccatoAction *)self sectionIdentifier];
  char v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = [WFSymbolIcon alloc];
    char v7 = +[WFColor whiteColor];
    v8 = [(WFSymbolIcon *)v6 initWithSymbolName:v5 symbolColor:v7];
    goto LABEL_15;
  }
  char v7 = self->_previewIcon;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([(WFConfiguredStaccatoAction *)self usesPreviewIconSymbolOverride])
    {
      char v9 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
      v10 = +[WFColor tintColorForBundleIdentifier:v9];
      char v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        v12 = +[WFColor whiteColor];
      }
      id v16 = v12;

      char v19 = [WFSymbolIcon alloc];
      v20 = [(WFIcon *)v7 symbolName];
      v8 = [(WFSymbolIcon *)v19 initWithSymbolName:v20 symbolColor:v16];

      goto LABEL_14;
    }
  }
  else
  {

    char v7 = 0;
  }
  id v13 = [(WFConfiguredStaccatoAction *)self identifier];
  id v14 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  id v15 = +[WFSymbolIcon symbolIconForActionIdentifier:v13 bundleIdentifier:v14];

  if (v15)
  {
    id v16 = v15;
    v8 = v16;
  }
  else
  {
    id v17 = [WFAppIcon alloc];
    v18 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
    v8 = [(WFAppIcon *)v17 initWithBundleIdentifier:v18];

    id v16 = 0;
  }
LABEL_14:

LABEL_15:
  return (WFIcon *)v8;
}

- (BOOL)usesPreviewIconSymbolOverride
{
  BOOL v3 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobilenotes"];

  if (v4) {
    return 1;
  }
  char v5 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.mobilephone"];

  if (v6) {
    return 1;
  }
  v8 = [(WFConfiguredStaccatoAction *)self identifier];
  char v9 = [v8 isEqualToString:@"is.workflow.actions.runworkflow"];

  return v9;
}

- (unint64_t)hash
{
  BOOL v3 = objc_opt_new();
  char v4 = [(WFConfiguredStaccatoAction *)self identifier];
  id v5 = (id)[v3 combine:v4];

  char v6 = [(WFConfiguredStaccatoAction *)self name];
  id v7 = (id)[v3 combine:v6];

  v8 = [(WFConfiguredStaccatoAction *)self previewIcon];
  id v9 = (id)[v3 combine:v8];

  v10 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  id v11 = (id)[v3 combine:v10];

  v12 = [(WFConfiguredStaccatoAction *)self shortcutsMetadata];
  id v13 = (id)[v3 combine:v12];

  id v14 = [(WFConfiguredStaccatoAction *)self colorScheme];
  id v15 = (id)[v3 combine:v14];

  unint64_t v16 = [v3 finalize];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (WFConfiguredStaccatoAction *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v6 = v5;
        id v7 = [(WFConfiguredStaccatoAction *)self identifier];
        v8 = [(WFConfiguredStaccatoAction *)v6 identifier];
        id v9 = v7;
        id v10 = v8;
        id v11 = v10;
        if (v9 == v10)
        {
        }
        else
        {
          LOBYTE(v12) = 0;
          id v13 = v10;
          id v14 = v9;
          if (!v9 || !v10) {
            goto LABEL_42;
          }
          int v15 = [v9 isEqualToString:v10];

          if (!v15)
          {
            LOBYTE(v12) = 0;
LABEL_43:

            goto LABEL_44;
          }
        }
        unint64_t v16 = [(WFConfiguredStaccatoAction *)self name];
        id v17 = [(WFConfiguredStaccatoAction *)v6 name];
        id v14 = v16;
        id v18 = v17;
        id v13 = v18;
        if (v14 == v18)
        {
        }
        else
        {
          LOBYTE(v12) = 0;
          char v19 = v18;
          id v20 = v14;
          if (!v14 || !v18) {
            goto LABEL_41;
          }
          int v21 = [v14 isEqualToString:v18];

          if (!v21)
          {
            LOBYTE(v12) = 0;
LABEL_42:

            goto LABEL_43;
          }
        }
        v22 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
        v23 = [(WFConfiguredStaccatoAction *)v6 associatedBundleIdentifier];
        id v20 = v22;
        id v24 = v23;
        char v19 = v24;
        id v40 = v20;
        if (v20 == v24)
        {
        }
        else
        {
          LOBYTE(v12) = 0;
          v25 = v24;
          if (!v20 || !v24) {
            goto LABEL_40;
          }
          int v12 = [v20 isEqualToString:v24];

          if (!v12) {
            goto LABEL_41;
          }
        }
        v26 = [(WFConfiguredStaccatoAction *)self previewIcon];
        v27 = [(WFConfiguredStaccatoAction *)v6 previewIcon];
        id v28 = v26;
        id v29 = v27;
        v38 = v29;
        id v39 = v28;
        if (v28 == v29)
        {
        }
        else
        {
          LOBYTE(v12) = 0;
          if (!v28)
          {
            v30 = v29;
            char v19 = v37;
            goto LABEL_38;
          }
          v30 = v29;
          char v19 = v37;
          if (!v29)
          {
LABEL_38:

            goto LABEL_39;
          }
          int v31 = [v28 isEqual:v29];

          if (!v31)
          {
            LOBYTE(v12) = 0;
            char v19 = v37;
LABEL_39:
            v25 = v38;
            id v20 = v39;
LABEL_40:

            id v20 = v40;
LABEL_41:

            goto LABEL_42;
          }
        }
        v32 = [(WFConfiguredStaccatoAction *)self shortcutsMetadata];
        v33 = [(WFConfiguredStaccatoAction *)v6 shortcutsMetadata];
        id v28 = v32;
        id v34 = v33;
        v35 = v34;
        if (v28 == v34)
        {
          LOBYTE(v12) = 1;
        }
        else
        {
          LOBYTE(v12) = 0;
          if (v28)
          {
            char v19 = v37;
            if (v34) {
              LOBYTE(v12) = [v28 isEqual:v34];
            }
            goto LABEL_36;
          }
        }
        char v19 = v37;
LABEL_36:

        v30 = v35;
        goto LABEL_38;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_44:

  return v12;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(WFConfiguredStaccatoAction *)self identifier];
  char v6 = [(WFConfiguredStaccatoAction *)self name];
  id v7 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  v8 = [v3 stringWithFormat:@"<%@ (%p): id: %@ name: %@, bundle: %@>", v4, self, v5, v6, v7];

  return v8;
}

- (WFConfiguredStaccatoAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedBundleIdentifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewIcon"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutsMetadata"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorScheme"];

  id v11 = 0;
  if (v5 && v7 && v6)
  {
    self = [(WFConfiguredStaccatoAction *)self initWithIdentifier:v5 associatedBundleIdentifier:v6 name:v7 previewIcon:v8 shortcutsMetadata:v9 colorScheme:v10];
    id v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFConfiguredStaccatoAction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  char v6 = [(WFConfiguredStaccatoAction *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  [v4 encodeObject:self->_previewIcon forKey:@"previewIcon"];
  id v7 = [(WFConfiguredStaccatoAction *)self associatedBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"associatedBundleIdentifier"];

  v8 = [(WFConfiguredStaccatoAction *)self shortcutsMetadata];
  [v4 encodeObject:v8 forKey:@"shortcutsMetadata"];

  id v9 = [(WFConfiguredStaccatoAction *)self colorScheme];
  [v4 encodeObject:v9 forKey:@"colorScheme"];
}

- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 associatedBundleIdentifier:(id)a4 name:(id)a5 previewIcon:(id)a6 shortcutsMetadata:(id)a7 colorScheme:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v17) {
      goto LABEL_3;
    }
LABEL_8:
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"WFConfiguredSystemAction.m", 56, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"WFConfiguredSystemAction.m", 55, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v17) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"WFConfiguredSystemAction.m", 57, @"Invalid parameter not satisfying: %@", @"associatedBundleIdentifier" object file lineNumber description];

LABEL_4:
  v37.receiver = self;
  v37.super_class = (Class)WFConfiguredStaccatoAction;
  int v21 = [(WFConfiguredStaccatoAction *)&v37 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    name = v21->_name;
    v21->_name = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    associatedBundleIdentifier = v21->_associatedBundleIdentifier;
    v21->_associatedBundleIdentifier = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    shortcutsMetadata = v21->_shortcutsMetadata;
    v21->_shortcutsMetadata = (NSData *)v28;

    objc_storeStrong((id *)&v21->_previewIcon, a6);
    uint64_t v30 = [v20 copy];
    colorScheme = v21->_colorScheme;
    v21->_colorScheme = (NSData *)v30;

    v32 = v21;
  }

  return v21;
}

- (WFConfiguredStaccatoAction)initWithIdentifier:(id)a3 associatedBundleIdentifier:(id)a4 name:(id)a5 previewIcon:(id)a6 shortcutsMetadata:(id)a7
{
  return [(WFConfiguredStaccatoAction *)self initWithIdentifier:a3 associatedBundleIdentifier:a4 name:a5 previewIcon:a6 shortcutsMetadata:a7 colorScheme:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end