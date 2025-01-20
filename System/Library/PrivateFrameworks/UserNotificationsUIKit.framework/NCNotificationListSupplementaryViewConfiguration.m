@interface NCNotificationListSupplementaryViewConfiguration
- (BOOL)containsUnmanagedContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)preventsUserDismissal;
- (NSArray)auxiliaryOptionActions;
- (NSArray)supplementaryActions;
- (NSString)auxiliaryOptionsSummaryText;
- (NSString)debugDescription;
- (NSString)groupName;
- (NSString)groupingIdentifier;
- (UIAction)defaultAction;
- (UIColor)textColor;
- (UIColor)tintColor;
- (id)_initWithGroupingIdentifier:(id)a3 groupName:(id)a4 defaultAction:(id)a5 supplementaryActions:(id)a6 auxiliaryOptionsSummaryText:(id)a7 auxiliaryOptionActions:(id)a8 tintColor:(id)a9 textColor:(id)a10 materialRecipe:(int64_t)a11 containsUnmanagedContent:(BOOL)a12 preventsUserDismissal:(BOOL)a13;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)materialRecipe;
- (unint64_t)hash;
@end

@implementation NCNotificationListSupplementaryViewConfiguration

- (id)_initWithGroupingIdentifier:(id)a3 groupName:(id)a4 defaultAction:(id)a5 supplementaryActions:(id)a6 auxiliaryOptionsSummaryText:(id)a7 auxiliaryOptionActions:(id)a8 tintColor:(id)a9 textColor:(id)a10 materialRecipe:(int64_t)a11 containsUnmanagedContent:(BOOL)a12 preventsUserDismissal:(BOOL)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  v45.receiver = self;
  v45.super_class = (Class)NCNotificationListSupplementaryViewConfiguration;
  v27 = [(NCNotificationListSupplementaryViewConfiguration *)&v45 init];
  if (v27)
  {
    uint64_t v28 = [v19 copy];
    groupingIdentifier = v27->_groupingIdentifier;
    v27->_groupingIdentifier = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    groupName = v27->_groupName;
    v27->_groupName = (NSString *)v30;

    uint64_t v32 = [v21 copy];
    defaultAction = v27->_defaultAction;
    v27->_defaultAction = (UIAction *)v32;

    uint64_t v34 = [v22 copy];
    supplementaryActions = v27->_supplementaryActions;
    v27->_supplementaryActions = (NSArray *)v34;

    uint64_t v36 = [v23 copy];
    auxiliaryOptionsSummaryText = v27->_auxiliaryOptionsSummaryText;
    v27->_auxiliaryOptionsSummaryText = (NSString *)v36;

    uint64_t v38 = [v24 copy];
    auxiliaryOptionActions = v27->_auxiliaryOptionActions;
    v27->_auxiliaryOptionActions = (NSArray *)v38;

    uint64_t v40 = [v25 copy];
    tintColor = v27->_tintColor;
    v27->_tintColor = (UIColor *)v40;

    uint64_t v42 = [v26 copy];
    textColor = v27->_textColor;
    v27->_textColor = (UIColor *)v42;

    v27->_materialRecipe = a11;
    v27->_containsUnmanagedContent = a12;
    v27->_preventsUserDismissal = a13;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_16:
      LOBYTE(v33) = 0;
      goto LABEL_17;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_16;
  }
  v6 = [(NCNotificationListSupplementaryViewConfiguration *)self groupingIdentifier];
  v7 = [v5 groupingIdentifier];
  int v8 = NCIsEqual();

  if (!v8) {
    goto LABEL_16;
  }
  v9 = [(NCNotificationListSupplementaryViewConfiguration *)self groupName];
  v10 = [v5 groupName];
  int v11 = NCIsEqual();

  if (!v11) {
    goto LABEL_16;
  }
  v12 = [(NCNotificationListSupplementaryViewConfiguration *)self defaultAction];
  v13 = [v5 defaultAction];
  int v14 = NCIsEqual();

  if (!v14) {
    goto LABEL_16;
  }
  v15 = [(NCNotificationListSupplementaryViewConfiguration *)self supplementaryActions];
  v16 = [v5 supplementaryActions];
  int v17 = NCIsEqualToArray();

  if (!v17) {
    goto LABEL_16;
  }
  v18 = [(NCNotificationListSupplementaryViewConfiguration *)self auxiliaryOptionsSummaryText];
  id v19 = [v5 auxiliaryOptionsSummaryText];
  int v20 = NCIsEqual();

  if (!v20) {
    goto LABEL_16;
  }
  id v21 = [(NCNotificationListSupplementaryViewConfiguration *)self auxiliaryOptionActions];
  id v22 = [v5 auxiliaryOptionActions];
  int v23 = NCIsEqualToArray();

  if (!v23) {
    goto LABEL_16;
  }
  id v24 = [(NCNotificationListSupplementaryViewConfiguration *)self tintColor];
  id v25 = [v5 tintColor];
  int v26 = NCIsEqual();

  if (!v26) {
    goto LABEL_16;
  }
  v27 = [(NCNotificationListSupplementaryViewConfiguration *)self textColor];
  uint64_t v28 = [v5 textColor];
  int v29 = NCIsEqual();

  if (!v29) {
    goto LABEL_16;
  }
  int64_t v30 = [(NCNotificationListSupplementaryViewConfiguration *)self materialRecipe];
  if (v30 != [v5 materialRecipe]) {
    goto LABEL_16;
  }
  int v31 = [(NCNotificationListSupplementaryViewConfiguration *)self containsUnmanagedContent];
  if (v31 != [v5 containsUnmanagedContent]) {
    goto LABEL_16;
  }
  BOOL v32 = [(NCNotificationListSupplementaryViewConfiguration *)self preventsUserDismissal];
  int v33 = v32 ^ [v5 preventsUserDismissal] ^ 1;
LABEL_17:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupingIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_groupName hash] + v3;
  uint64_t v5 = [(UIAction *)self->_defaultAction hash];
  NSUInteger v6 = v4 + v5 + [(NSArray *)self->_supplementaryActions hash];
  NSUInteger v7 = [(NSString *)self->_auxiliaryOptionsSummaryText hash];
  NSUInteger v8 = v7 + [(NSArray *)self->_auxiliaryOptionActions hash];
  NSUInteger v9 = v6 + v8 + [(UIColor *)self->_tintColor hash];
  return v9
       + [(UIColor *)self->_textColor hash]
       + self->_materialRecipe
       + self->_containsUnmanagedContent
       + self->_preventsUserDismissal;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationListSupplementaryViewConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [NCNotificationListMutableSupplementaryViewConfiguration alloc];
  LOWORD(v6) = *(_WORD *)&self->_containsUnmanagedContent;
  return -[NCNotificationListSupplementaryViewConfiguration _initWithGroupingIdentifier:groupName:defaultAction:supplementaryActions:auxiliaryOptionsSummaryText:auxiliaryOptionActions:tintColor:textColor:materialRecipe:containsUnmanagedContent:preventsUserDismissal:](v4, "_initWithGroupingIdentifier:groupName:defaultAction:supplementaryActions:auxiliaryOptionsSummaryText:auxiliaryOptionActions:tintColor:textColor:materialRecipe:containsUnmanagedContent:preventsUserDismissal:", self->_groupingIdentifier, self->_groupName, self->_defaultAction, self->_supplementaryActions, self->_auxiliaryOptionsSummaryText, self->_auxiliaryOptionActions, self->_tintColor, self->_textColor, self->_materialRecipe, v6);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(NCNotificationListSupplementaryViewConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = [(NCNotificationListSupplementaryViewConfiguration *)self groupingIdentifier];
  [v4 appendString:v5 withName:@"groupingIdentifier"];

  uint64_t v6 = [(NCNotificationListSupplementaryViewConfiguration *)self groupName];
  [v4 appendString:v6 withName:@"groupName"];

  NSUInteger v7 = [(NCNotificationListSupplementaryViewConfiguration *)self defaultAction];
  id v8 = (id)[v4 appendObject:v7 withName:@"defaultAction"];

  NSUInteger v9 = [(NCNotificationListSupplementaryViewConfiguration *)self supplementaryActions];
  id v10 = (id)[v4 appendObject:v9 withName:@"supplementaryActions"];

  int v11 = [(NCNotificationListSupplementaryViewConfiguration *)self auxiliaryOptionsSummaryText];
  id v12 = (id)[v4 appendObject:v11 withName:@"auxiliaryOptionsSummaryText"];

  v13 = [(NCNotificationListSupplementaryViewConfiguration *)self auxiliaryOptionActions];
  id v14 = (id)[v4 appendObject:v13 withName:@"auxiliaryOptionActions"];

  v15 = [(NCNotificationListSupplementaryViewConfiguration *)self tintColor];
  id v16 = (id)[v4 appendObject:v15 withName:@"tintColor"];

  int v17 = [(NCNotificationListSupplementaryViewConfiguration *)self textColor];
  id v18 = (id)[v4 appendObject:v17 withName:@"textColor"];

  [(NCNotificationListSupplementaryViewConfiguration *)self materialRecipe];
  id v19 = MTStringFromMaterialRecipe();
  id v20 = (id)[v4 appendObject:v19 withName:@"materialRecipe"];

  id v21 = (id)objc_msgSend(v4, "appendBool:withName:", -[NCNotificationListSupplementaryViewConfiguration containsUnmanagedContent](self, "containsUnmanagedContent"), @"unmanagedContent");
  id v22 = (id)objc_msgSend(v4, "appendBool:withName:", -[NCNotificationListSupplementaryViewConfiguration preventsUserDismissal](self, "preventsUserDismissal"), @"preventsUserDismissal");

  return v4;
}

- (id)succinctDescription
{
  v2 = [(NCNotificationListSupplementaryViewConfiguration *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return [(NCNotificationListSupplementaryViewConfiguration *)self descriptionBuilderWithMultilinePrefix:&stru_1F2F516F8];
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (NSArray)supplementaryActions
{
  return self->_supplementaryActions;
}

- (NSString)auxiliaryOptionsSummaryText
{
  return self->_auxiliaryOptionsSummaryText;
}

- (NSArray)auxiliaryOptionActions
{
  return self->_auxiliaryOptionActions;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (BOOL)containsUnmanagedContent
{
  return self->_containsUnmanagedContent;
}

- (BOOL)preventsUserDismissal
{
  return self->_preventsUserDismissal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, 0);
  objc_storeStrong((id *)&self->_supplementaryActions, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
}

@end