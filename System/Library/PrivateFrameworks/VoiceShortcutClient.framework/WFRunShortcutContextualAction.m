@interface WFRunShortcutContextualAction
- (BOOL)showsUserInterfaceWhenRunning;
- (WFRunShortcutContextualAction)initWithDescriptor:(id)a3 serializedRepresentation:(id)a4 namedQueryInfo:(id)a5;
- (id)spotlightItem;
- (id)uniqueIdentifier;
@end

@implementation WFRunShortcutContextualAction

- (id)spotlightItem
{
  v9.receiver = self;
  v9.super_class = (Class)WFRunShortcutContextualAction;
  v2 = [(WFContextualAction *)&v9 spotlightItem];
  v3 = [v2 attributeSet];
  v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v4 rangeOfString:@":"];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v4 substringFromIndex:v5 + v6];

    [v3 setUniqueIdentifier:v7];
    v4 = (void *)v7;
  }

  return v2;
}

- (WFRunShortcutContextualAction)initWithDescriptor:(id)a3 serializedRepresentation:(id)a4 namedQueryInfo:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v38 = a5;
  if (!v9)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFRunShortcutContextualAction.m", 61, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];
  }
  v37 = self;
  v11 = [WFContextualActionParameter alloc];
  v12 = [v9 name];
  uint64_t v13 = [(WFContextualActionParameter *)v11 initWithType:@"WFWorkflowContentItem" displayString:v12 wfParameterKey:@"WFWorkflow" wfSerializedRepresentation:v10];

  v14 = [v9 associatedAppBundleIdentifier];

  if (v14)
  {
    v15 = [WFContextualActionIcon alloc];
    v16 = [v9 associatedAppBundleIdentifier];
    v35 = [(WFContextualActionIcon *)v15 initWithApplicationBundleIdentifier:v16];
  }
  else
  {
    v35 = 0;
  }
  v39 = v10;
  v36 = (void *)v13;
  v41[0] = v13;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  v18 = WFLocalizedString(@"Run %@");
  v19 = WFLocalizedString(@"Run Shortcut");
  v20 = [v9 name];
  id v21 = v9;
  v22 = (void *)MEMORY[0x1B3EC58F0]();
  v23 = [WFWorkflowIconDrawer alloc];
  v24 = objc_opt_new();
  v25 = [(WFWorkflowIconDrawer *)v23 initWithDrawerContext:v24];

  -[WFWorkflowIconDrawer setGlyphCharacter:](v25, "setGlyphCharacter:", [v21 glyphCharacter]);
  [(WFWorkflowIconDrawer *)v25 setDrawGradient:1];
  [(WFWorkflowIconDrawer *)v25 setDrawShadowBehindGlyph:0];
  -[WFWorkflowIconDrawer setGlyphSize:](v25, "setGlyphSize:", 60.0, 60.0);
  v26 = +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", [v21 color]);
  [(WFWorkflowIconDrawer *)v25 setBackgroundColor:v26];

  v27 = -[WFWorkflowIconDrawer imageWithSize:](v25, "imageWithSize:", 120.0, 120.0);
  v28 = v27;
  if (v27)
  {
    v29 = [v27 PNGRepresentation];

    if (v29)
    {
      v30 = [WFContextualActionIcon alloc];
      v31 = [v28 PNGRepresentation];
      [v28 scale];
      v29 = -[WFContextualActionIcon initWithImageData:scale:displayStyle:](v30, "initWithImageData:scale:displayStyle:", v31, 1);
    }
  }
  else
  {
    v29 = 0;
  }

  v40.receiver = v37;
  v40.super_class = (Class)WFRunShortcutContextualAction;
  v32 = [(WFTopHitItemContextualAction *)&v40 initWithItem:v21 identifier:@"is.workflow.actions.runworkflow" wfActionIdentifier:@"is.workflow.actions.runworkflow" associatedAppBundleIdentifier:@"com.apple.shortcuts" parameters:v17 displayFormatString:v18 title:v19 subtitleFormatString:v20 primaryColor:9 icon:v29 accessoryIcon:v35 namedQueryInfo:v38];

  return v32;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return 1;
}

- (id)uniqueIdentifier
{
  v3 = [(WFContextualAction *)self identifier];
  v4 = [(WFRunShortcutContextualAction *)self workflow];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v3 stringByAppendingFormat:@":%@", v5];

  return v6;
}

@end