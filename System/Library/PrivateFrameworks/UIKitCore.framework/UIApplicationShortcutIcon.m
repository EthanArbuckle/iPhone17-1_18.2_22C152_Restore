@interface UIApplicationShortcutIcon
+ (UIApplicationShortcutIcon)iconWithCustomImage:(id)a3;
+ (UIApplicationShortcutIcon)iconWithCustomImage:(id)a3 isTemplate:(BOOL)a4;
+ (UIApplicationShortcutIcon)iconWithSystemImageName:(NSString *)systemImageName;
+ (UIApplicationShortcutIcon)iconWithTemplateImageName:(NSString *)templateImageName;
+ (UIApplicationShortcutIcon)iconWithType:(UIApplicationShortcutIconType)type;
- (BOOL)isEqual:(id)a3;
- (SBSApplicationShortcutIcon)sbsShortcutIcon;
- (UIApplicationShortcutIcon)initWithSBSApplicationShortcutIcon:(id)a3;
- (UIApplicationShortcutIcon)initWithXPCDictionary:(id)a3;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation UIApplicationShortcutIcon

- (void).cxx_destruct
{
}

+ (UIApplicationShortcutIcon)iconWithType:(UIApplicationShortcutIconType)type
{
  if ((unint64_t)type > UIApplicationShortcutIconTypeUpdate) {
    v3 = @"questionmark";
  }
  else {
    v3 = off_1E52DCE20[type];
  }
  return (UIApplicationShortcutIcon *)[a1 iconWithSystemImageName:v3];
}

+ (UIApplicationShortcutIcon)iconWithTemplateImageName:(NSString *)templateImageName
{
  v4 = templateImageName;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v5 = (void *)getSBSApplicationShortcutTemplateIconClass_softClass;
  uint64_t v14 = getSBSApplicationShortcutTemplateIconClass_softClass;
  if (!getSBSApplicationShortcutTemplateIconClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getSBSApplicationShortcutTemplateIconClass_block_invoke;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getSBSApplicationShortcutTemplateIconClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = v5;
  _Block_object_dispose(&v11, 8);
  v7 = (void *)[[v6 alloc] initWithTemplateImageName:v4];
  v8 = (void *)[objc_alloc((Class)a1) initWithSBSApplicationShortcutIcon:v7];

  return (UIApplicationShortcutIcon *)v8;
}

+ (UIApplicationShortcutIcon)iconWithSystemImageName:(NSString *)systemImageName
{
  v4 = systemImageName;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v5 = (void *)getSBSApplicationShortcutSystemIconClass_softClass;
  uint64_t v14 = getSBSApplicationShortcutSystemIconClass_softClass;
  if (!getSBSApplicationShortcutSystemIconClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getSBSApplicationShortcutSystemIconClass_block_invoke;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getSBSApplicationShortcutSystemIconClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = v5;
  _Block_object_dispose(&v11, 8);
  v7 = (void *)[[v6 alloc] initWithSystemImageName:v4];
  v8 = (void *)[objc_alloc((Class)a1) initWithSBSApplicationShortcutIcon:v7];

  return (UIApplicationShortcutIcon *)v8;
}

- (UIApplicationShortcutIcon)initWithSBSApplicationShortcutIcon:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationShortcutIcon;
  v6 = [(UIApplicationShortcutIcon *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sbsShortcutIcon, a3);
  }

  return v7;
}

- (SBSApplicationShortcutIcon)sbsShortcutIcon
{
  return self->_sbsShortcutIcon;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIApplicationShortcutIcon *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(UIApplicationShortcutIcon *)v5 sbsShortcutIcon];
      if (v6 == self->_sbsShortcutIcon)
      {
        char v8 = 1;
      }
      else
      {
        v7 = [(UIApplicationShortcutIcon *)v5 sbsShortcutIcon];
        char v8 = [v7 isEqual:self->_sbsShortcutIcon];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

+ (UIApplicationShortcutIcon)iconWithCustomImage:(id)a3
{
  return (UIApplicationShortcutIcon *)[a1 iconWithCustomImage:a3 isTemplate:0];
}

+ (UIApplicationShortcutIcon)iconWithCustomImage:(id)a3 isTemplate:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (UIImage *)a3;
  if ([(UIImage *)v6 isSymbolImage])
  {
    v7 = _UIImageName(v6);
    if (_UIIsSystemSymbolImage(v6))
    {
      uint64_t v8 = [a1 iconWithSystemImageName:v7];
LABEL_6:
      objc_super v9 = (void *)v8;
      goto LABEL_10;
    }
    if (v7)
    {
      uint64_t v8 = [a1 iconWithTemplateImageName:v7];
      goto LABEL_6;
    }
  }
  v7 = UIImagePNGRepresentation(v6);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v10 = (void *)getSBSApplicationShortcutCustomImageIconClass_softClass;
  uint64_t v18 = getSBSApplicationShortcutCustomImageIconClass_softClass;
  if (!getSBSApplicationShortcutCustomImageIconClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSBSApplicationShortcutCustomImageIconClass_block_invoke;
    v14[3] = &unk_1E52D9900;
    v14[4] = &v15;
    __getSBSApplicationShortcutCustomImageIconClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  uint64_t v11 = v10;
  _Block_object_dispose(&v15, 8);
  v12 = (void *)[[v11 alloc] initWithImageData:v7 dataType:0 isTemplate:v4];
  objc_super v9 = (void *)[objc_alloc((Class)a1) initWithSBSApplicationShortcutIcon:v12];

LABEL_10:
  return (UIApplicationShortcutIcon *)v9;
}

- (unint64_t)hash
{
  return [(SBSApplicationShortcutIcon *)self->_sbsShortcutIcon hash];
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (UIApplicationShortcutIcon)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v6 = (void *)getSBSApplicationShortcutIconClass_softClass;
  uint64_t v15 = getSBSApplicationShortcutIconClass_softClass;
  if (!getSBSApplicationShortcutIconClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getSBSApplicationShortcutIconClass_block_invoke;
    v11[3] = &unk_1E52D9900;
    v11[4] = &v12;
    __getSBSApplicationShortcutIconClass_block_invoke((uint64_t)v11);
    v6 = (void *)v13[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = [(UIApplicationShortcutIcon *)self initWithSBSApplicationShortcutIcon:v8];

  return v9;
}

@end