@interface QLToolbarButton
+ (BOOL)supportsSecureCoding;
- (BOOL)disappearsOnTap;
- (BOOL)enabled;
- (BOOL)forceToNavBar;
- (BOOL)isEqual:(id)a3;
- (BOOL)roundedSelectedIndicator;
- (BOOL)selected;
- (BOOL)useBundleImage;
- (BOOL)useInternalSymbolImage;
- (NSArray)options;
- (NSString)accessibilityIdentifier;
- (NSString)identifier;
- (NSString)symbolImageName;
- (NSString)title;
- (QLToolbarButton)barButtonWithTarget:(id)a3 action:(SEL)a4 maxSize:(CGSize)a5;
- (QLToolbarButton)init;
- (QLToolbarButton)initWithCoder:(id)a3;
- (QLToolbarButton)initWithIdentifier:(id)a3;
- (UIEdgeInsets)_additionalSelectionInsets;
- (id)_barButtonImage;
- (int64_t)systemItem;
- (unint64_t)placement;
- (void)encodeWithCoder:(id)a3;
- (void)handleLongPress:(id)a3;
- (void)invalidateCurrentState;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setDisappearsOnTap:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setForceToNavBar:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPlacement:(unint64_t)a3;
- (void)setRoundedSelectedIndicator:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setSystemItem:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUseBundleImage:(BOOL)a3;
- (void)setUseInternalSymbolImage:(BOOL)a3;
- (void)set_additionalSelectionInsets:(UIEdgeInsets)a3;
@end

@implementation QLToolbarButton

- (QLToolbarButton)init
{
  return 0;
}

- (QLToolbarButton)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLToolbarButton;
  v6 = [(QLToolbarButton *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_placement = 1;
    v7->_enabled = 1;
    v8 = v7;
  }

  return v7;
}

- (id)_barButtonImage
{
  v3 = [MEMORY[0x1E4F42A98] unspecifiedConfiguration];
  v4 = [v3 _configurationIgnoringDynamicType];

  if ([(QLToolbarButton *)self useBundleImage])
  {
    id v5 = (void *)MEMORY[0x1E4F42A80];
    v6 = [(QLToolbarButton *)self symbolImageName];
    v7 = QLFrameworkBundle();
    v8 = [v5 imageNamed:v6 inBundle:v7 withConfiguration:v4];
  }
  else
  {
    if ([(QLToolbarButton *)self useInternalSymbolImage])
    {
      v9 = (void *)MEMORY[0x1E4F42A80];
      v6 = [(QLToolbarButton *)self symbolImageName];
      uint64_t v10 = [v9 _systemImageNamed:v6 withConfiguration:v4];
    }
    else
    {
      v8 = [(QLToolbarButton *)self symbolImageName];

      if (!v8) {
        goto LABEL_9;
      }
      v11 = (void *)MEMORY[0x1E4F42A80];
      v6 = [(QLToolbarButton *)self symbolImageName];
      uint64_t v10 = [v11 systemImageNamed:v6 withConfiguration:v4];
    }
    v8 = (void *)v10;
  }

LABEL_9:
  return v8;
}

- (QLToolbarButton)barButtonWithTarget:(id)a3 action:(SEL)a4 maxSize:(CGSize)a5
{
  id v7 = a3;
  v8 = [(QLToolbarButton *)self symbolImageName];

  if (v8)
  {
    v9 = [QLToolbarButtonItemRepresentation alloc];
    uint64_t v10 = [(QLToolbarButton *)self _barButtonImage];
    uint64_t v11 = [(QLToolbarButtonItemRepresentation *)v9 initWithImage:v10 style:0 target:v7 action:a4];
LABEL_5:
    v15 = (QLToolbarButtonItemRepresentation *)v11;

    goto LABEL_6;
  }
  v12 = [(QLToolbarButton *)self title];

  v13 = [QLToolbarButtonItemRepresentation alloc];
  v14 = v13;
  if (v12)
  {
    uint64_t v10 = [(QLToolbarButton *)self title];
    uint64_t v11 = [(QLToolbarButtonItemRepresentation *)v14 initWithTitle:v10 style:0 target:v7 action:a4];
    goto LABEL_5;
  }
  v15 = [(QLToolbarButtonItemRepresentation *)v13 initWithBarButtonSystemItem:self->_systemItem target:v7 action:a4];
LABEL_6:
  v16 = [(QLToolbarButton *)self options];

  if (v16) {
    [(QLToolbarButtonItemRepresentation *)v15 setLongPressTarget:self action:sel_handleLongPress_];
  }
  [(QLToolbarButtonItemRepresentation *)v15 setSelected:[(QLToolbarButton *)self selected]];
  [(QLToolbarButton *)self _additionalSelectionInsets];
  -[QLToolbarButtonItemRepresentation _setAdditionalSelectionInsets:](v15, "_setAdditionalSelectionInsets:");
  [(QLToolbarButtonItemRepresentation *)v15 setEnabled:[(QLToolbarButton *)self enabled]];
  v17 = [(QLToolbarButton *)self identifier];
  [(QLToolbarButtonItemRepresentation *)v15 setIdentifier:v17];

  [(QLToolbarButtonItemRepresentation *)v15 setPlacement:[(QLToolbarButton *)self placement]];
  [(QLToolbarButtonItemRepresentation *)v15 setPresentingViewController:v7];
  [(QLToolbarButtonItemRepresentation *)v15 setOriginalButton:self];
  [(QLToolbarButtonItemRepresentation *)v15 setDisappearsOnTap:[(QLToolbarButton *)self disappearsOnTap]];
  v18 = [(QLToolbarButton *)self accessibilityIdentifier];

  if (v18)
  {
    v19 = [(QLToolbarButton *)self accessibilityIdentifier];
    [(QLToolbarButtonItemRepresentation *)v15 setAccessibilityIdentifier:v19];
  }
  objc_storeStrong((id *)&self->_currentItemRepresentation, v15);
  objc_storeWeak(&self->_target, v7);
  if (a4) {
    v20 = a4;
  }
  else {
    v20 = 0;
  }
  self->_action = v20;

  return (QLToolbarButton *)v15;
}

- (void)handleLongPress:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([a3 state] == 1)
  {
    v4 = self->_currentItemRepresentation;
    id v5 = [(QLToolbarButtonItemRepresentation *)v4 presentingViewController];
    v6 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:0 preferredStyle:0];
    id v7 = [(QLToolbarButtonItemRepresentation *)v4 customView];
    v8 = [v6 popoverPresentationController];
    [v8 setSourceView:v7];

    v9 = [(QLToolbarButtonItemRepresentation *)v4 customView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [v6 popoverPresentationController];
    objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v19 = [(QLToolbarButton *)self options];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v49 count:16];
    v21 = &off_1E282B000;
    if (v20)
    {
      uint64_t v22 = v20;
      v37 = v5;
      v38 = v4;
      uint64_t v23 = *(void *)v46;
      int v24 = 1;
      id obj = v19;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          v26 = v6;
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v28 = (void *)MEMORY[0x1E4F42720];
          v29 = objc_msgSend(v27, "title", v37, v38);
          uint64_t v30 = [v27 style];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __35__QLToolbarButton_handleLongPress___block_invoke;
          v44[3] = &unk_1E6DD3A50;
          v44[4] = self;
          v44[5] = v27;
          v31 = [v28 actionWithTitle:v29 style:v30 handler:v44];

          v6 = v26;
          [v26 addAction:v31];
          v24 &= [v27 isCancel] ^ 1;
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v22);

      id v5 = v37;
      v4 = v38;
      v21 = &off_1E282B000;
      if ((v24 & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    v32 = (void *)MEMORY[0x1E4F42720];
    v33 = QLLocalizedString(@"Cancel");
    v34 = [v32 actionWithTitle:v33 style:1 handler:0];
    [v6 addAction:v34];

LABEL_13:
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = *((void *)v21 + 123);
    v40[2] = __35__QLToolbarButton_handleLongPress___block_invoke_2;
    v40[3] = &unk_1E6DD3A78;
    id v41 = v5;
    id v42 = v6;
    v43 = self;
    id v35 = v6;
    id v36 = v5;
    [v36 prepareForActionSheetPresentationWithCompletionHandler:v40];
  }
}

void __35__QLToolbarButton_handleLongPress___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (*(void *)(*(void *)(a1 + 32) + 32)) {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = WeakRetained;
  [WeakRetained performSelector:v6 withObject:*(void *)(a1 + 40)];
}

void __35__QLToolbarButton_handleLongPress___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__QLToolbarButton_handleLongPress___block_invoke_3;
  v4[3] = &unk_1E6DD3A78;
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  QLRunInMainThread(v4);
}

id __35__QLToolbarButton_handleLongPress___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = (id *)(*(void *)(a1 + 48) + 16);
  return objc_storeWeak(v3, v2);
}

- (void)invalidateCurrentState
{
  p_alertController = &self->_alertController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_alertController);
    [v4 dismissViewControllerAnimated:0 completion:0];

    objc_storeWeak((id *)p_alertController, 0);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(QLToolbarButton *)self identifier];
  uint64_t v6 = [v4 identifier];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    uint64_t v7 = (void *)v6;
    v8 = [(QLToolbarButton *)self identifier];
    v9 = [v4 identifier];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_18;
    }
  }
  double v11 = [(QLToolbarButton *)self title];
  uint64_t v12 = [v4 title];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    double v13 = (void *)v12;
    double v14 = [(QLToolbarButton *)self title];
    double v15 = [v4 title];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_18;
    }
  }
  double v17 = [(QLToolbarButton *)self accessibilityIdentifier];
  uint64_t v18 = [v4 accessibilityIdentifier];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    uint64_t v20 = [(QLToolbarButton *)self accessibilityIdentifier];
    v21 = [v4 accessibilityIdentifier];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_18;
    }
  }
  uint64_t v23 = [(QLToolbarButton *)self options];
  uint64_t v24 = [v4 options];
  if (v23 == (void *)v24)
  {
  }
  else
  {
    v25 = (void *)v24;
    v26 = [(QLToolbarButton *)self options];
    v27 = [v4 options];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_18;
    }
  }
  int v29 = [(QLToolbarButton *)self selected];
  if (v29 != [v4 selected])
  {
LABEL_18:
    LOBYTE(v30) = 0;
    goto LABEL_19;
  }
  [(QLToolbarButton *)self _additionalSelectionInsets];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  [v4 _additionalSelectionInsets];
  LOBYTE(v30) = 0;
  if (v35 == v43 && v33 == v40 && v39 == v42 && v37 == v41)
  {
    int64_t v44 = [(QLToolbarButton *)self systemItem];
    if (v44 == [v4 systemItem])
    {
      unint64_t v45 = [(QLToolbarButton *)self placement];
      if (v45 == [v4 placement])
      {
        int v46 = [(QLToolbarButton *)self forceToNavBar];
        if (v46 == [v4 forceToNavBar])
        {
          int v47 = [(QLToolbarButton *)self useBundleImage];
          if (v47 == [v4 useBundleImage])
          {
            int v48 = [(QLToolbarButton *)self useInternalSymbolImage];
            if (v48 == [v4 useInternalSymbolImage])
            {
              v49 = [(QLToolbarButton *)self symbolImageName];
              uint64_t v50 = [v4 symbolImageName];

              if (v49 == v50)
              {
                int v51 = [(QLToolbarButton *)self enabled];
                if (v51 == [v4 enabled])
                {
                  int v52 = [(QLToolbarButton *)self roundedSelectedIndicator];
                  if (v52 == [v4 roundedSelectedIndicator])
                  {
                    BOOL v53 = [(QLToolbarButton *)self disappearsOnTap];
                    int v30 = v53 ^ [v4 disappearsOnTap] ^ 1;
                    goto LABEL_19;
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_18;
  }
LABEL_19:

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(QLToolbarButton *)self identifier];

  if (v4)
  {
    id v5 = [(QLToolbarButton *)self identifier];
    [v11 encodeObject:v5 forKey:@"identifier"];
  }
  uint64_t v6 = [(QLToolbarButton *)self symbolImageName];

  if (v6)
  {
    uint64_t v7 = [(QLToolbarButton *)self symbolImageName];
    [v11 encodeObject:v7 forKey:@"symbolImageName"];
  }
  objc_msgSend(v11, "encodeInteger:forKey:", -[QLToolbarButton systemItem](self, "systemItem"), @"systemItem");
  objc_msgSend(v11, "encodeInteger:forKey:", -[QLToolbarButton placement](self, "placement"), @"placement");
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton forceToNavBar](self, "forceToNavBar"), @"forceToNavBar");
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton useBundleImage](self, "useBundleImage"), @"useBundleImage");
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton useInternalSymbolImage](self, "useInternalSymbolImage"), @"useInternalSymbolImage");
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton enabled](self, "enabled"), @"enabled");
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton selected](self, "selected"), @"selected");
  [(QLToolbarButton *)self _additionalSelectionInsets];
  objc_msgSend(v11, "encodeUIEdgeInsets:forKey:", @"_additionalSelectionInsets");
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton roundedSelectedIndicator](self, "roundedSelectedIndicator"), @"roundedSelectedIndicator");
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton disappearsOnTap](self, "disappearsOnTap"), @"disappearsOnTap");
  v8 = [(QLToolbarButton *)self title];
  [v11 encodeObject:v8 forKey:@"title"];

  v9 = [(QLToolbarButton *)self accessibilityIdentifier];
  [v11 encodeObject:v9 forKey:@"accessibilityIdentifier"];

  int v10 = [(QLToolbarButton *)self options];
  [v11 encodeObject:v10 forKey:@"options"];
}

- (QLToolbarButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)QLToolbarButton;
  id v5 = [(QLToolbarButton *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolImageName"];
    symbolImageName = v5->_symbolImageName;
    v5->_symbolImageName = (NSString *)v8;

    v5->_systemItem = [v4 decodeIntegerForKey:@"systemItem"];
    v5->_placement = [v4 decodeIntegerForKey:@"placement"];
    v5->_forceToNavBar = [v4 decodeBoolForKey:@"forceToNavBar"];
    v5->_useBundleImage = [v4 decodeBoolForKey:@"useBundleImage"];
    v5->_useInternalSymbolImage = [v4 decodeBoolForKey:@"useInternalSymbolImage"];
    v5->_selected = [v4 decodeBoolForKey:@"selected"];
    [v4 decodeUIEdgeInsetsForKey:@"_additionalSelectionInsets"];
    v5->__additionalSelectionInsets.top = v10;
    v5->__additionalSelectionInsets.left = v11;
    v5->__additionalSelectionInsets.bottom = v12;
    v5->__additionalSelectionInsets.right = v13;
    v5->_roundedSelectedIndicator = [v4 decodeBoolForKey:@"roundedSelectedIndicator"];
    v5->_disappearsOnTap = [v4 decodeBoolForKey:@"disappearsOnTap"];
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityIdentifier"];
    accessibilityIdentifier = v5->_accessibilityIdentifier;
    v5->_accessibilityIdentifier = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"options"];
    options = v5->_options;
    v5->_options = (NSArray *)v21;

    uint64_t v23 = v5;
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
}

- (int64_t)systemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(int64_t)a3
{
  self->_systemItem = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSArray)options
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOptions:(id)a3
{
}

- (unint64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (BOOL)useBundleImage
{
  return self->_useBundleImage;
}

- (void)setUseBundleImage:(BOOL)a3
{
  self->_useBundleImage = a3;
}

- (BOOL)useInternalSymbolImage
{
  return self->_useInternalSymbolImage;
}

- (void)setUseInternalSymbolImage:(BOOL)a3
{
  self->_useInternalSymbolImage = a3;
}

- (BOOL)forceToNavBar
{
  return self->_forceToNavBar;
}

- (void)setForceToNavBar:(BOOL)a3
{
  self->_forceToNavBar = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  objc_copyStruct(v6, &self->__additionalSelectionInsets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)set_additionalSelectionInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3 = a3;
  objc_copyStruct(&self->__additionalSelectionInsets, &v3, 32, 1, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)roundedSelectedIndicator
{
  return self->_roundedSelectedIndicator;
}

- (void)setRoundedSelectedIndicator:(BOOL)a3
{
  self->_roundedSelectedIndicator = a3;
}

- (BOOL)disappearsOnTap
{
  return self->_disappearsOnTap;
}

- (void)setDisappearsOnTap:(BOOL)a3
{
  self->_disappearsOnTap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak(&self->_target);
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_currentItemRepresentation, 0);
}

@end