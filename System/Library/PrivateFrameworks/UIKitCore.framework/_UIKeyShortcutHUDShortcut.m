@interface _UIKeyShortcutHUDShortcut
+ (BOOL)supportsSecureCoding;
+ (_UIKeyShortcutHUDShortcut)shortcutWithUIKeyCommand:(id)a3;
- (BOOL)_isEquivalentToPasteAndMatchStyleShortcut;
- (BOOL)_isEquivalentToPasteShortcut;
- (BOOL)isPasteShortcut;
- (NSArray)shortcutAlternates;
- (NSMutableArray)displayableAlternates;
- (NSMutableDictionary)alternatesMap;
- (NSString)discoverabilityTitle;
- (NSString)hudTitle;
- (NSString)input;
- (UICommandAlternate)alternateForBaseShortcut;
- (UIKeyCommand)discoverabilityUIKeyCommand;
- (_UIKeyShortcutHUDShortcut)baseShortcutForAlternate;
- (_UIKeyShortcutHUDShortcut)init;
- (_UIKeyShortcutHUDShortcut)initWithCoder:(id)a3;
- (id)originalTarget;
- (id)shortcutToDisplayForModifierFlags:(int64_t)a3;
- (int64_t)modifierFlags;
- (unint64_t)attributes;
- (void)_acceptMenuVisit:(id)a3 shortcutVisit:(id)a4;
- (void)_updateOverrideTitle;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateForBaseShortcut:(id)a3;
- (void)setBaseShortcutForAlternate:(id)a3;
- (void)setDiscoverabilityUIKeyCommand:(id)a3;
- (void)setOriginalTarget:(id)a3;
@end

@implementation _UIKeyShortcutHUDShortcut

+ (_UIKeyShortcutHUDShortcut)shortcutWithUIKeyCommand:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIKeyShortcutHUDShortcut;
  v3 = objc_msgSendSuper2(&v5, sel_elementWithUIMenuElement_, a3);
  [v3 _updateOverrideTitle];
  return (_UIKeyShortcutHUDShortcut *)v3;
}

- (_UIKeyShortcutHUDShortcut)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyShortcutHUDShortcut;
  v2 = [(_UIKeyShortcutHUDShortcut *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    displayableAlternates = v2->_displayableAlternates;
    v2->_displayableAlternates = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    alternatesMap = v2->_alternatesMap;
    v2->_alternatesMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (NSString)discoverabilityTitle
{
  v2 = [(_UIKeyShortcutHUDShortcut *)self uiKeyCommand];
  uint64_t v3 = [v2 discoverabilityTitle];

  return (NSString *)v3;
}

- (NSString)hudTitle
{
  if ([(NSString *)self->_overrideTitle length])
  {
    uint64_t v3 = self->_overrideTitle;
  }
  else
  {
    v4 = [(_UIKeyShortcutHUDShortcut *)self discoverabilityTitle];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      uint64_t v3 = [(_UIKeyShortcutHUDShortcut *)self discoverabilityTitle];
    }
    else
    {
      v6 = [(_UIKeyShortcutHUDMenuElement *)self title];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        uint64_t v3 = [(_UIKeyShortcutHUDMenuElement *)self title];
      }
      else
      {
        uint64_t v3 = @"No Title";
      }
    }
  }
  return (NSString *)v3;
}

- (void)_updateOverrideTitle
{
  if ([(_UIKeyShortcutHUDShortcut *)self _isEquivalentToPasteShortcut])
  {
    uint64_t v3 = sel_paste_;
LABEL_5:
    uint64_t v7 = +[UICommand _defaultCommandForAction:v3];
    v4 = [v7 title];
    overrideTitle = self->_overrideTitle;
    self->_overrideTitle = v4;

    v6 = (NSString *)v7;
    goto LABEL_7;
  }
  if ([(_UIKeyShortcutHUDShortcut *)self _isEquivalentToPasteAndMatchStyleShortcut])
  {
    uint64_t v3 = sel_pasteAndMatchStyle_;
    goto LABEL_5;
  }
  v6 = self->_overrideTitle;
  self->_overrideTitle = 0;
LABEL_7:
}

- (int64_t)modifierFlags
{
  uint64_t v3 = [(_UIKeyShortcutHUDShortcut *)self discoverabilityUIKeyCommand];
  if (v3) {
    [(_UIKeyShortcutHUDShortcut *)self discoverabilityUIKeyCommand];
  }
  else {
  v4 = [(_UIKeyShortcutHUDShortcut *)self uiKeyCommand];
  }
  int64_t v5 = [v4 _layoutAwareModifierFlags];

  return v5;
}

- (NSString)input
{
  uint64_t v3 = [(_UIKeyShortcutHUDShortcut *)self discoverabilityUIKeyCommand];
  if (v3) {
    [(_UIKeyShortcutHUDShortcut *)self discoverabilityUIKeyCommand];
  }
  else {
  v4 = [(_UIKeyShortcutHUDShortcut *)self uiKeyCommand];
  }
  int64_t v5 = [v4 _layoutAwareInput];

  return (NSString *)v5;
}

- (unint64_t)attributes
{
  v2 = [(_UIKeyShortcutHUDShortcut *)self uiKeyCommand];
  unint64_t v3 = [v2 attributes];

  return v3;
}

- (NSArray)shortcutAlternates
{
  v2 = [(_UIKeyShortcutHUDShortcut *)self alternatesMap];
  unint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)shortcutToDisplayForModifierFlags:(int64_t)a3
{
  v4 = self;
  int64_t v5 = [(_UIKeyShortcutHUDShortcut *)v4 uiKeyCommand];
  v6 = [v5 _alternateForModifierFlags:a3 usingAlternates:v4->_displayableAlternates];

  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)v4->_alternatesMap objectForKeyedSubscript:v6];
    objc_super v8 = v7;
    if (v7)
    {
      v9 = v7;

      v4 = v9;
    }
  }
  return v4;
}

- (BOOL)isPasteShortcut
{
  if ([(_UIKeyShortcutHUDShortcut *)self _isEquivalentToPasteShortcut]) {
    return 1;
  }
  return [(_UIKeyShortcutHUDShortcut *)self _isEquivalentToPasteAndMatchStyleShortcut];
}

- (BOOL)_isEquivalentToPasteShortcut
{
  v2 = [(_UIKeyShortcutHUDShortcut *)self uiKeyCommand];
  BOOL v3 = [v2 action] == (void)sel_paste_;

  return v3;
}

- (BOOL)_isEquivalentToPasteAndMatchStyleShortcut
{
  v2 = [(_UIKeyShortcutHUDShortcut *)self uiKeyCommand];
  BOOL v3 = [v2 action] == (void)sel_pasteAndMatchStyle_;

  return v3;
}

- (void)_acceptMenuVisit:(id)a3 shortcutVisit:(id)a4
{
  if (a4) {
    (*((void (**)(id, _UIKeyShortcutHUDShortcut *))a4 + 2))(a4, self);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDShortcut;
  id v4 = a3;
  [(_UIKeyShortcutHUDMenuElement *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayableAlternates, @"displayableAlternates", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_alternatesMap forKey:@"alternatesMap"];
}

- (_UIKeyShortcutHUDShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UIKeyShortcutHUDShortcut;
  objc_super v5 = [(_UIKeyShortcutHUDMenuElement *)&v24 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = self;
    objc_super v8 = self;
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"displayableAlternates"];
    displayableAlternates = v5->_displayableAlternates;
    v5->_displayableAlternates = (NSMutableArray *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = self;
    v14 = self;
    v15 = self;
    v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"alternatesMap"];
    alternatesMap = v5->_alternatesMap;
    v5->_alternatesMap = (NSMutableDictionary *)v17;

    objc_storeWeak((id *)&v5->_baseShortcutForAlternate, v5);
    v19 = v5->_alternatesMap;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __43___UIKeyShortcutHUDShortcut_initWithCoder___block_invoke;
    v22[3] = &unk_1E5308B60;
    v20 = v5;
    v23 = v20;
    [(NSMutableDictionary *)v19 enumerateKeysAndObjectsUsingBlock:v22];
    [(_UIKeyShortcutHUDShortcut *)v20 _updateOverrideTitle];
  }
  return v5;
}

- (UIKeyCommand)discoverabilityUIKeyCommand
{
  return self->_discoverabilityUIKeyCommand;
}

- (void)setDiscoverabilityUIKeyCommand:(id)a3
{
}

- (NSMutableArray)displayableAlternates
{
  return self->_displayableAlternates;
}

- (NSMutableDictionary)alternatesMap
{
  return self->_alternatesMap;
}

- (_UIKeyShortcutHUDShortcut)baseShortcutForAlternate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseShortcutForAlternate);
  return (_UIKeyShortcutHUDShortcut *)WeakRetained;
}

- (void)setBaseShortcutForAlternate:(id)a3
{
}

- (UICommandAlternate)alternateForBaseShortcut
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateForBaseShortcut);
  return (UICommandAlternate *)WeakRetained;
}

- (void)setAlternateForBaseShortcut:(id)a3
{
}

- (id)originalTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_originalTarget);
  return WeakRetained;
}

- (void)setOriginalTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_originalTarget);
  objc_destroyWeak((id *)&self->_alternateForBaseShortcut);
  objc_destroyWeak((id *)&self->_baseShortcutForAlternate);
  objc_storeStrong((id *)&self->_alternatesMap, 0);
  objc_storeStrong((id *)&self->_displayableAlternates, 0);
  objc_storeStrong((id *)&self->_discoverabilityUIKeyCommand, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
}

@end