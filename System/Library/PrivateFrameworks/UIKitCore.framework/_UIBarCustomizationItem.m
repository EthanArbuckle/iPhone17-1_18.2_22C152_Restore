@interface _UIBarCustomizationItem
+ (_UIBarCustomizationItem)itemWithIdentifier:(id)a3 icon:(id)a4 name:(id)a5 view:(id)a6;
+ (id)groupWithWithIdentifier:(id)a3 icon:(id)a4 name:(id)a5 items:(id)a6;
- (BOOL)collapsed;
- (BOOL)collapsible;
- (BOOL)enabled;
- (BOOL)removable;
- (BOOL)reverseItemsForRTL;
- (CGRect)_sourceFrameInContainer:(id)a3;
- (NSArray)subitems;
- (NSString)identifier;
- (NSString)name;
- (UIColor)tintColor;
- (UIImage)icon;
- (UIView)view;
- (_UIBarCustomizationChiclet)_chiclet;
- (_UIBarCustomizationItem)init;
- (id)description;
- (id)sourceViewProvider;
- (void)_enumerateSubitemsWithBlock:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setCollapsible:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setRemovable:(BOOL)a3;
- (void)setReverseItemsForRTL:(BOOL)a3;
- (void)setSourceViewProvider:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setView:(id)a3;
- (void)set_chiclet:(id)a3;
@end

@implementation _UIBarCustomizationItem

- (_UIBarCustomizationItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBarCustomizationItem;
  v2 = [(_UIBarCustomizationItem *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_UIBarCustomizationItem *)v2 setCollapsible:1];
    [(_UIBarCustomizationItem *)v3 setRemovable:1];
  }
  return v3;
}

+ (_UIBarCustomizationItem)itemWithIdentifier:(id)a3 icon:(id)a4 name:(id)a5 view:(id)a6
{
  id v9 = a3;
  unint64_t v10 = (unint64_t)a6;
  unint64_t v11 = (unint64_t)a5;
  unint64_t v12 = (unint64_t)a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!(v12 | v11 | v10))
    {
      v16 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Creating a _UIBarCustomizationItem with no visible content!", buf, 2u);
      }
    }
  }
  else if (!(v12 | v11 | v10))
  {
    v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &itemWithIdentifier_icon_name_view____s_category) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Creating a _UIBarCustomizationItem with no visible content!", v18, 2u);
    }
  }
  v13 = objc_opt_new();
  v14 = (void *)v13[2];
  v13[2] = v9;

  [v13 setEnabled:1];
  [v13 setIcon:v12];

  [v13 setName:v11];
  [v13 setView:v10];

  return (_UIBarCustomizationItem *)v13;
}

+ (id)groupWithWithIdentifier:(id)a3 icon:(id)a4 name:(id)a5 items:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v14 = [v12 count];
  if (has_internal_diagnostics)
  {
    if (!v14)
    {
      v32 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v32, OS_LOG_TYPE_FAULT, "Creating a group _UIBarCustomizationItem with no items!", buf, 2u);
      }
    }
  }
  else if (!v14)
  {
    v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &groupWithWithIdentifier_icon_name_items____s_category)
                       + 8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Creating a group _UIBarCustomizationItem with no items!", buf, 2u);
    }
  }
  id v15 = v11;
  v16 = v15;
  if (![v15 length])
  {
    id v35 = v9;
    id v36 = v10;
    v16 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v34 = v12;
    id v17 = v12;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v23 = [v22 name];
          uint64_t v24 = [v23 length];

          if (v24)
          {
            if ([v16 length]) {
              [v16 appendString:@", "];
            }
            v25 = [v22 name];
            [v16 appendString:v25];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v19);
    }

    id v9 = v35;
    id v10 = v36;
    id v12 = v34;
  }
  v26 = objc_opt_new();
  v27 = (void *)v26[2];
  v26[2] = v9;
  id v28 = v9;

  v29 = (void *)v26[8];
  v26[8] = v12;

  if (v10) {
    BOOL v30 = 1;
  }
  else {
    BOOL v30 = [v15 length] != 0;
  }
  [v26 setCollapsible:v30];
  [v26 setEnabled:1];
  [v26 setIcon:v10];
  [v26 setName:v16];

  return v26;
}

- (void)setCollapsed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIBarCustomizationItem *)self collapsible])
  {
    if (self->_collapsed != v3) {
      self->_collapsed = v3;
    }
  }
}

- (CGRect)_sourceFrameInContainer:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = (double *)&v24;
  uint64_t v26 = 0x4010000000;
  v27 = &unk_186D7DBA7;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v28 = *MEMORY[0x1E4F1DB20];
  long long v29 = v5;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __51___UIBarCustomizationItem__sourceFrameInContainer___block_invoke;
  v21 = &unk_1E52FB828;
  id v6 = v4;
  id v22 = v6;
  v23 = &v24;
  v7 = (void (**)(void *, _UIBarCustomizationItem *))_Block_copy(&v18);
  if ([(_UIBarCustomizationItem *)self collapsed]
    || ([(_UIBarCustomizationItem *)self subitems],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        !v9))
  {
    v7[2](v7, self);
  }
  else
  {
    [(_UIBarCustomizationItem *)self _enumerateSubitemsWithBlock:v7];
  }
  double v10 = v25[4];
  double v11 = v25[5];
  double v12 = v25[6];
  double v13 = v25[7];

  _Block_object_dispose(&v24, 8);
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_enumerateSubitemsWithBlock:(id)a3
{
  id v4 = a3;
  if ([(_UIBarCustomizationItem *)self reverseItemsForRTL]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [(_UIBarCustomizationItem *)self subitems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55___UIBarCustomizationItem__enumerateSubitemsWithBlock___block_invoke;
  v8[3] = &unk_1E52FB850;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsWithOptions:v5 usingBlock:v8];
}

- (id)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(_UIBarCustomizationItem *)self identifier];
  id v6 = [v3 stringWithFormat:@"<%@: %p identifier = %@", v4, self, v5];;

  id v7 = [(_UIBarCustomizationItem *)self icon];
  if (v7)
  {
    [v6 appendFormat:@"; icon = <%@: %p", objc_opt_class(), v7];
    if ([v7 isSymbolImage])
    {
      v8 = _UIImageName(v7);
      [v6 appendFormat:@"; symbol = (%@)", v8];
    }
    [v6 appendString:@">"];
  }
  uint64_t v9 = [(_UIBarCustomizationItem *)self name];
  double v10 = (void *)v9;
  if (v9) {
    [v6 appendFormat:@"; name = %@", v9];
  }
  double v11 = [(_UIBarCustomizationItem *)self view];
  if (v11) {
    [v6 appendFormat:@"; view = <%@: %p>", objc_opt_class(), v11];
  }
  double v12 = [(_UIBarCustomizationItem *)self subitems];
  if ([v12 count]) {
    [v6 appendFormat:@"; subitems = <%@: %p>", objc_opt_class(), v12];
  }
  [v6 appendString:@">"];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)sourceViewProvider
{
  return self->_sourceViewProvider;
}

- (void)setSourceViewProvider:(id)a3
{
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (BOOL)removable
{
  return self->_removable;
}

- (void)setRemovable:(BOOL)a3
{
  self->_removable = a3;
}

- (BOOL)collapsible
{
  return self->_collapsible;
}

- (void)setCollapsible:(BOOL)a3
{
  self->_collapsible = a3;
}

- (_UIBarCustomizationChiclet)_chiclet
{
  return self->__chiclet;
}

- (void)set_chiclet:(id)a3
{
}

- (BOOL)reverseItemsForRTL
{
  return self->_reverseItemsForRTL;
}

- (void)setReverseItemsForRTL:(BOOL)a3
{
  self->_reverseItemsForRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__chiclet, 0);
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong(&self->_sourceViewProvider, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end