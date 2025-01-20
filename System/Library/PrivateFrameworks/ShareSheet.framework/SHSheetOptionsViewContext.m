@interface SHSheetOptionsViewContext
- (NSArray)customizationGroups;
- (SHSheetOptionsViewContext)initWithCustomizationGroups:(id)a3;
- (UIViewController)itemPreviewViewController;
- (id)description;
- (void)setCustomizationGroups:(id)a3;
- (void)setItemPreviewViewController:(id)a3;
@end

@implementation SHSheetOptionsViewContext

- (SHSheetOptionsViewContext)initWithCustomizationGroups:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetOptionsViewContext;
  v5 = [(SHSheetOptionsViewContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    customizationGroups = v5->_customizationGroups;
    v5->_customizationGroups = (NSArray *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetOptionsViewContext;
  id v4 = [(SHSheetOptionsViewContext *)&v9 description];
  v5 = [(SHSheetOptionsViewContext *)self customizationGroups];
  uint64_t v6 = [(SHSheetOptionsViewContext *)self itemPreviewViewController];
  v7 = [v3 stringWithFormat:@"<%@ customizationGroups:%@ itemPreviewViewController:%@>", v4, v5, v6];

  return v7;
}

- (NSArray)customizationGroups
{
  return self->_customizationGroups;
}

- (void)setCustomizationGroups:(id)a3
{
}

- (UIViewController)itemPreviewViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemPreviewViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setItemPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemPreviewViewController);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
}

@end