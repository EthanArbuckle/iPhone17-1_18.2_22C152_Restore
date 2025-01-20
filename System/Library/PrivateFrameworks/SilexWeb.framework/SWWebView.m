@interface SWWebView
- (NSArray)removedMenuIdentifiers;
- (UITextInputTraits)overridenTraits;
- (UIView)accessoryView;
- (id)_textInputTraits;
- (void)setAccessoryView:(id)a3;
- (void)setOverridenTraits:(id)a3;
- (void)setRemovedMenuIdentifiers:(id)a3;
- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4;
@end

@implementation SWWebView

- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SWWebView *)self inputAssistantItem];
  [v8 setLeadingBarButtonGroups:v7];

  id v9 = [(SWWebView *)self inputAssistantItem];
  [v9 setTrailingBarButtonGroups:v6];
}

- (id)_textInputTraits
{
  v11.receiver = self;
  v11.super_class = (Class)SWWebView;
  v3 = [(SWWebView *)&v11 _textInputTraits];
  v4 = [(SWWebView *)self overridenTraits];
  [v3 overrideWithTraits:v4];

  v5 = [(SWWebView *)self overridenTraits];
  [v3 overrideWithPrivateTraits:v5];

  id v6 = [(SWWebView *)self overridenTraits];
  objc_msgSend(v3, "setForceDisableDictation:", objc_msgSend(v6, "forceDisableDictation"));

  id v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (!v8)
  {
    id v9 = [(SWWebView *)self overridenTraits];
    objc_msgSend(v3, "setHidePrediction:", objc_msgSend(v9, "hidePrediction"));
  }
  return v3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (UITextInputTraits)overridenTraits
{
  return self->_overridenTraits;
}

- (void)setOverridenTraits:(id)a3
{
}

- (NSArray)removedMenuIdentifiers
{
  return self->_removedMenuIdentifiers;
}

- (void)setRemovedMenuIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedMenuIdentifiers, 0);
  objc_storeStrong((id *)&self->_overridenTraits, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end