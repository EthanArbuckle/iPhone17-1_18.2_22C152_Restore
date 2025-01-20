@interface TUISystemInputAssistantLayout
- (BOOL)usesUnifiedButtonBar;
- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5;
- (void)setUsesUnifiedButtonBar:(BOOL)a3;
@end

@implementation TUISystemInputAssistantLayout

- (void)setUsesUnifiedButtonBar:(BOOL)a3
{
  self->_usesUnifiedButtonBar = a3;
}

- (BOOL)usesUnifiedButtonBar
{
  return self->_usesUnifiedButtonBar;
}

- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 leadingBarButtonGroups];
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    v11 = (void *)v8;
  }
  else {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;

  v13 = [v7 trailingBarButtonGroups];

  if (v13) {
    v14 = v13;
  }
  else {
    v14 = v10;
  }
  id v15 = v14;

  uint64_t v16 = [v6 leadingBarButtonGroups];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v10;
  }
  id v19 = v18;

  v20 = [v6 trailingBarButtonGroups];

  if (v20) {
    v21 = v20;
  }
  else {
    v21 = v10;
  }
  id v22 = v21;

  v23 = objc_alloc_init(TUIButtonBarGroupSet);
  v24 = [v19 arrayByAddingObjectsFromArray:v12];
  [(TUIButtonBarGroupSet *)v23 setLeadingButtonGroups:v24];

  v25 = [v15 arrayByAddingObjectsFromArray:v22];

  [(TUIButtonBarGroupSet *)v23 setTrailingButtonGroups:v25];
  v26 = [(TUIButtonBarGroupSet *)v23 leadingButtonGroups];
  v27 = [(TUIButtonBarGroupSet *)v23 trailingButtonGroups];
  v28 = [v26 arrayByAddingObjectsFromArray:v27];
  [(TUIButtonBarGroupSet *)v23 setUnifiedButtonGroups:v28];

  return v23;
}

@end