@interface _UIEditMenuListItem
+ (id)itemWithMenuElement:(id)a3 preferredDisplayMode:(unint64_t)a4;
+ (id)itemWithTitle:(id)a3;
- (BOOL)hidesImageForTraitCollection:(id)a3;
- (BOOL)hidesTitleForTraitCollection:(id)a3;
- (BOOL)wantsPasteSlotView;
- (NSString)title;
- (UIImage)image;
- (UIMenuElement)menuElement;
- (UISPasteVariant)pasteVariant;
- (UIView)customView;
- (double)overrideMinimumWidth;
- (id)description;
- (int64_t)options;
- (unint64_t)displayMode;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setOverrideMinimumWidth:(double)a3;
- (void)setWantsPasteSlotView:(BOOL)a3;
@end

@implementation _UIEditMenuListItem

+ (id)itemWithMenuElement:(id)a3 preferredDisplayMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__149;
  v37 = __Block_byref_object_dispose__149;
  id v38 = 0;
  if ([v5 _isLeaf])
  {
    id v7 = v5;
    char v8 = [v7 attributes];
    char v9 = [v7 attributes];
    if ([v7 state] == 1)
    {
      v10 = [v7 selectedImage];
    }
    else
    {
      v10 = 0;
    }
    unint64_t v11 = v9 & 2 | (unint64_t)(v8 & 1);
  }
  else
  {
    v10 = 0;
    unint64_t v11 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v5;
    uint64_t v13 = [v12 contentView];
  }
  else
  {
    uint64_t v13 = 0;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __64___UIEditMenuListItem_itemWithMenuElement_preferredDisplayMode___block_invoke;
  v32[3] = &unk_1E52FF670;
  v32[4] = &v33;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64___UIEditMenuListItem_itemWithMenuElement_preferredDisplayMode___block_invoke_2;
  v31[3] = &unk_1E52FF698;
  v31[4] = &v33;
  [v5 _acceptMenuVisit:0 commandVisit:v32 actionVisit:v31 deferredElementVisit:0];
  v14 = [(id)v34[5] localizedStringForLocalization:0];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v5 title];
  }
  v17 = v16;

  id v18 = [v5 image];
  v19 = (void *)v34[5];
  if (v19)
  {
    v20 = [v19 glyph];
    uint64_t v21 = +[UIImage systemImageNamed:v20];

    id v18 = (id)v21;
  }
  else
  {
    if (!v10) {
      goto LABEL_18;
    }
    v20 = v18;
    id v18 = v10;
  }

LABEL_18:
  if ([v5 _preferredDisplayMode]) {
    a4 = [v5 _preferredDisplayMode];
  }
  if (a4 == 1) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = a4 == 3;
  }
  v23 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;
  id v24 = v5;

  objc_storeStrong((id *)(v6 + 40), (id)v34[5]);
  v25 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v17;
  id v26 = v17;

  v27 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v18;
  id v28 = v18;

  *(void *)(v6 + 72) = v22;
  v29 = *(void **)(v6 + 56);
  *(void *)(v6 + 48) = v11;
  *(void *)(v6 + 56) = v13;

  _Block_object_dispose(&v33, 8);
  return (id)v6;
}

+ (id)itemWithTitle:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = (void *)v4[3];
  v4[3] = v3;

  v4[9] = 0;
  return v4;
}

- (BOOL)hidesTitleForTraitCollection:(id)a3
{
  v4 = [a3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (![(NSString *)self->_title length]) {
    return 1;
  }
  if (!self->_image) {
    return 0;
  }
  if (self->_displayMode == 1) {
    return !IsAccessibilityCategory;
  }
  return 0;
}

- (BOOL)hidesImageForTraitCollection:(id)a3
{
  v4 = [a3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  image = self->_image;
  NSUInteger v7 = [(NSString *)self->_title length];
  if (IsAccessibilityCategory)
  {
    BOOL v8 = v7 != 0;
  }
  else if (v7)
  {
    BOOL v8 = self->_displayMode == 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  return !image || v8;
}

- (id)description
{
  id v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(_UIEditMenuListItem *)self title];

  if (v4)
  {
    id v5 = [(_UIEditMenuListItem *)self title];
    id v6 = (id)[v3 appendName:@"title" object:v5];
  }
  NSUInteger v7 = [(_UIEditMenuListItem *)self image];

  if (v7)
  {
    BOOL v8 = [(_UIEditMenuListItem *)self image];
    id v9 = (id)[v3 appendName:@"image" object:v8 usingLightweightDescription:1];
  }
  v10 = [(_UIEditMenuListItem *)self pasteVariant];

  if (v10)
  {
    unint64_t v11 = [(_UIEditMenuListItem *)self pasteVariant];
    id v12 = (id)[v3 appendName:@"pasteVariant" object:v11];
  }
  if ([(_UIEditMenuListItem *)self options])
  {
    char v13 = [(_UIEditMenuListItem *)self options];
    v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = v14;
    if (v13) {
      [v14 addObject:@".disabled"];
    }
    if ((v13 & 2) != 0) {
      [v15 addObject:@".destructive"];
    }
    id v16 = NSString;
    v17 = [v15 componentsJoinedByString:@"|"];
    id v18 = [v16 stringWithFormat:@"(%@)", v17];

    id v19 = (id)[v3 appendName:@"options" object:v18];
  }
  unint64_t v20 = [(_UIEditMenuListItem *)self displayMode];
  uint64_t v21 = @".titleOnly";
  if (v20 == 1) {
    uint64_t v21 = @".imageOnly";
  }
  if (v20 == 2) {
    uint64_t v22 = @".imageAndTitle";
  }
  else {
    uint64_t v22 = v21;
  }
  id v23 = (id)[v3 appendName:@"displayMode" object:v22];
  [(_UIEditMenuListItem *)self overrideMinimumWidth];
  if (v24 > 0.0)
  {
    [(_UIEditMenuListItem *)self overrideMinimumWidth];
    id v25 = (id)objc_msgSend(v3, "appendName:doubleValue:", @"overrideMinimumWidth");
  }
  id v26 = [(_UIEditMenuListItem *)self customView];

  if (v26)
  {
    v27 = [(_UIEditMenuListItem *)self customView];
    id v28 = (id)[v3 appendName:@"customView" object:v27 usingLightweightDescription:1];
  }
  v29 = [(_UIEditMenuListItem *)self menuElement];
  id v30 = (id)[v3 appendName:@"menuElement" object:v29 usingLightweightDescription:1];

  v31 = [v3 string];

  return v31;
}

- (UIMenuElement)menuElement
{
  return self->_menuElement;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UISPasteVariant)pasteVariant
{
  return self->_pasteVariant;
}

- (int64_t)options
{
  return self->_options;
}

- (UIView)customView
{
  return self->_customView;
}

- (double)overrideMinimumWidth
{
  return self->_overrideMinimumWidth;
}

- (void)setOverrideMinimumWidth:(double)a3
{
  self->_overrideMinimumWidth = a3;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)wantsPasteSlotView
{
  return self->_wantsPasteSlotView;
}

- (void)setWantsPasteSlotView:(BOOL)a3
{
  self->_wantsPasteSlotView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_pasteVariant, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_menuElement, 0);
}

@end