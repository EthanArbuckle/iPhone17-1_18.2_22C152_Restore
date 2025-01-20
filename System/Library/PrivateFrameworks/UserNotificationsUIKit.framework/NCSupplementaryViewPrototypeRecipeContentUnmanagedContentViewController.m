@interface NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController
+ (id)title;
- (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController)init;
- (void)loadView;
- (void)unmanagedContentViewControllerView:(id)a3 setContainsUnmanagedContent:(BOOL)a4;
@end

@implementation NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController

+ (id)title
{
  return @"Unmanaged Content";
}

- (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController;
  v2 = [(NCSupplementaryViewPrototypeRecipeViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCSupplementaryViewPrototypeRecipeViewController *)v2 updateConfiguration:&__block_literal_global_399];
  }
  return v3;
}

uint64_t __79__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContainsUnmanagedContent:1];
}

- (void)loadView
{
  v3 = objc_alloc_init(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView);
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)v3 setContainsUnmanagedContent:1];
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)v3 setDelegate:self];
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController *)self setView:v3];
}

- (void)unmanagedContentViewControllerView:(id)a3 setContainsUnmanagedContent:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __138__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController_unmanagedContentViewControllerView_setContainsUnmanagedContent___block_invoke;
  v4[3] = &__block_descriptor_33_e65_v16__0__NCNotificationListMutableSupplementaryViewConfiguration_8l;
  BOOL v5 = a4;
  [(NCSupplementaryViewPrototypeRecipeViewController *)self updateConfiguration:v4];
}

uint64_t __138__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewController_unmanagedContentViewControllerView_setContainsUnmanagedContent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContainsUnmanagedContent:*(unsigned __int8 *)(a1 + 32)];
}

@end