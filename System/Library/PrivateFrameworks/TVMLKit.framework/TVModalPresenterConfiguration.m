@interface TVModalPresenterConfiguration
- (BOOL)allowsMenuDismissal;
- (BOOL)allowsModalOverModal;
- (BOOL)navigationBarHidden;
- (CGRect)sourceRect;
- (CGSize)formSheetSize;
- (CGSize)popoverSize;
- (NSString)barButtonID;
- (TVModalPresenterConfiguration)init;
- (TVModalPresenterConfiguration)initWithDictionary:(id)a3;
- (UIView)sourceView;
- (int64_t)presentationStyle;
- (unint64_t)configurationType;
- (void)_configureWithDictionary:(id)a3;
- (void)setAllowsMenuDismissal:(BOOL)a3;
- (void)setAllowsModalOverModal:(BOOL)a3;
- (void)setBarButtonID:(id)a3;
- (void)setConfigurationType:(unint64_t)a3;
- (void)setFormSheetSize:(CGSize)a3;
- (void)setNavigationBarHidden:(BOOL)a3;
- (void)setPopoverSize:(CGSize)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
@end

@implementation TVModalPresenterConfiguration

- (TVModalPresenterConfiguration)init
{
  return [(TVModalPresenterConfiguration *)self initWithDictionary:0];
}

- (TVModalPresenterConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TVModalPresenterConfiguration;
  v5 = [(TVModalPresenterConfiguration *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TVModalPresenterConfiguration *)v5 _configureWithDictionary:v4];
  }

  return v6;
}

- (void)_configureWithDictionary:(id)a3
{
  id v66 = a3;
  id v4 = [v66 objectForKey:@"popover"];
  objc_opt_class();
  CGFloat v5 = 0.0;
  v63 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v6 = v4) != 0)
  {
    v7 = v6;
    objc_super v8 = [v6 objectForKey:@"barButtonID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v65 = v8;
    }
    else {
      id v65 = 0;
    }
    v12 = [v7 objectForKey:@"height"];
    objc_opt_class();
    CGFloat v11 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      CGFloat v11 = v13;
    }
    v62 = v7;
    v14 = [v7 objectForKey:@"width"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      CGFloat v5 = v15;
    }

    unint64_t v9 = 3;
    uint64_t v10 = 7;
  }
  else
  {
    v62 = 0;
    id v65 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = 5;
    CGFloat v11 = 0.0;
  }
  v16 = [v66 objectForKey:@"playback"];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
    uint64_t v10 = 0;
    unint64_t v9 = 2;
  }
  v19 = [v66 objectForKey:@"formSheet"];
  objc_opt_class();
  double v20 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v21 = v19) != 0)
  {
    v64 = v21;
    v22 = [v21 objectForKey:@"height"];
    objc_opt_class();
    double v23 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      [v22 doubleValue];
      double v23 = v24;
    }
    v25 = [v64 objectForKey:@"width"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v25 doubleValue];
      double v20 = v26;
    }

    unint64_t v9 = 1;
    uint64_t v10 = 2;
  }
  else
  {
    v64 = 0;
    double v23 = 0.0;
  }
  v27 = [v66 objectForKey:@"navigationBarHidden"];
  objc_opt_class();
  v59 = v27;
  if (objc_opt_isKindOfClass()) {
    char v57 = [v27 BOOLValue];
  }
  else {
    char v57 = 1;
  }
  v28 = (CGFloat *)MEMORY[0x263F001A8];
  v29 = [v66 objectForKey:@"useCustomPresenter"];
  objc_opt_class();
  v61 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v29 BOOLValue]) {
    unint64_t v9 = 4;
  }
  CGFloat v30 = *v28;
  CGFloat v31 = v28[1];
  CGFloat v32 = v28[2];
  CGFloat v33 = v28[3];
  v34 = [v66 objectForKey:@"sourceview"];
  objc_opt_class();
  v60 = v19;
  v58 = v29;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = 0;
    goto LABEL_33;
  }
  id v35 = v34;
  v36 = v35;
  if (!v35)
  {
LABEL_33:
    v39 = 0;
    goto LABEL_38;
  }
  uint64_t v37 = v10;
  v38 = [v35 objectForKey:@"sourceviewObj"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v39 = v38;
  }
  else {
    v39 = 0;
  }
  v40 = [v36 objectForKey:@"sourceviewRect"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v40 CGRectValue];
    CGFloat v30 = v41;
    CGFloat v31 = v42;
    CGFloat v32 = v43;
    CGFloat v33 = v44;
  }

  uint64_t v10 = v37;
LABEL_38:
  v45 = [v66 objectForKey:@"overridePresentationStyle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v46 = v45;
  }
  else {
    id v46 = 0;
  }
  if ([v46 isEqualToString:@"currentContext"])
  {
    int64_t v47 = 6;
  }
  else if ([v46 isEqualToString:@"formSheet"])
  {
    unint64_t v9 = 1;
    int64_t v47 = 2;
  }
  else if ([v46 isEqualToString:@"fullscreen"])
  {
    int64_t v47 = 5;
  }
  else if ([v46 isEqualToString:@"none"])
  {
    int64_t v47 = -1;
  }
  else if ([v46 isEqualToString:@"pageSheet"])
  {
    int64_t v47 = 1;
  }
  else
  {
    int64_t v47 = v10;
  }
  v48 = [v66 objectForKey:@"allowsModalOverModal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v49 = [v48 BOOLValue];
  }
  else {
    char v49 = 0;
  }
  v50 = (NSString *)[v65 copy];
  barButtonID = self->_barButtonID;
  self->_barButtonID = v50;

  self->_configurationType = v9;
  if (*MEMORY[0x263F001B0] == v20)
  {
    v52 = v63;
    if (*(double *)(MEMORY[0x263F001B0] + 8) == v23)
    {
      [MEMORY[0x263F1CB68] defaultFormSheetSize];
      double v20 = v53;
      double v23 = v54;
    }
  }
  else
  {
    v52 = v63;
  }
  self->_formSheetSize.width = v20;
  self->_formSheetSize.height = v23;
  self->_navigationBarHidden = v57;
  self->_popoverSize.width = v5;
  self->_popoverSize.height = v11;
  self->_allowsModalOverModal = v49;
  self->_allowsMenuDismissal = 1;
  sourceView = self->_sourceView;
  self->_presentationStyle = v47;
  self->_sourceView = v39;
  v56 = v39;

  self->_sourceRect.origin.x = v30;
  self->_sourceRect.origin.y = v31;
  self->_sourceRect.size.width = v32;
  self->_sourceRect.size.height = v33;
}

- (BOOL)allowsModalOverModal
{
  return self->_allowsModalOverModal;
}

- (void)setAllowsModalOverModal:(BOOL)a3
{
  self->_allowsModalOverModal = a3;
}

- (BOOL)allowsMenuDismissal
{
  return self->_allowsMenuDismissal;
}

- (void)setAllowsMenuDismissal:(BOOL)a3
{
  self->_allowsMenuDismissal = a3;
}

- (NSString)barButtonID
{
  return self->_barButtonID;
}

- (void)setBarButtonID:(id)a3
{
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (CGSize)formSheetSize
{
  double width = self->_formSheetSize.width;
  double height = self->_formSheetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFormSheetSize:(CGSize)a3
{
  self->_formSheetSize = a3;
}

- (CGSize)popoverSize
{
  double width = self->_popoverSize.width;
  double height = self->_popoverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPopoverSize:(CGSize)a3
{
  self->_popoverSize = a3;
}

- (BOOL)navigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_barButtonID, 0);
}

@end