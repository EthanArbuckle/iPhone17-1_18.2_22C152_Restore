@interface WBSAction
+ (id)actionWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 handler:(id)a6;
+ (id)toggleSectionExpandedAction;
- (BOOL)isEqual:(id)a3;
- (NSString)accessibilityIdentifier;
- (NSString)identifier;
- (NSString)title;
- (UIImage)image;
- (id)description;
- (id)makeUIAction;
- (unint64_t)hash;
- (void)performAction;
- (void)setAccessibilityIdentifier:(id)a3;
@end

@implementation WBSAction

- (id)makeUIAction
{
  v3 = (void *)MEMORY[0x1AD115160](self->_handler, a2);
  v4 = (void *)MEMORY[0x1E4F426E8];
  title = self->_title;
  image = self->_image;
  identifier = self->_identifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25__WBSAction_makeUIAction__block_invoke;
  v11[3] = &unk_1E5E40A38;
  id v12 = v3;
  id v8 = v3;
  v9 = [v4 actionWithTitle:title image:image identifier:identifier handler:v11];
  [v9 setAccessibilityIdentifier:self->_accessibilityIdentifier];

  return v9;
}

+ (id)toggleSectionExpandedAction
{
  return +[WBSAction actionWithTitle:&stru_1F031A860 image:0 identifier:@"com.apple.Safari.SectionToggleExpanded" handler:&__block_literal_global_1];
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 handler:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init((Class)a1);
  uint64_t v16 = [v14 copy];

  v17 = (void *)*((void *)v15 + 2);
  *((void *)v15 + 2) = v16;

  objc_storeStrong((id *)v15 + 3, a4);
  v18 = (void *)[v13 copy];

  if (v18)
  {
    id v19 = v18;
    v20 = (void *)*((void *)v15 + 4);
    *((void *)v15 + 4) = v19;
  }
  else
  {
    v20 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v21 = [v20 UUIDString];
    v22 = (void *)*((void *)v15 + 4);
    *((void *)v15 + 4) = v21;
  }
  uint64_t v23 = MEMORY[0x1AD115160](v12);

  v24 = (void *)*((void *)v15 + 1);
  *((void *)v15 + 1) = v23;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@:%p; title = %@; image = %@; identifier = %@>",
               objc_opt_class(),
               self,
               self->_title,
               self->_image,
               self->_identifier);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSAction *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)self->_identifier isEqualToString:v4->_identifier];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (void)performAction
{
}

uint64_t __25__WBSAction_makeUIAction__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

@end