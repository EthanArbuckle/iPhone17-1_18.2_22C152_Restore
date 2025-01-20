@interface _TVSplitTemplateController
- (void)updateWithSplitTemplate:(id)a3;
@end

@implementation _TVSplitTemplateController

- (void)updateWithSplitTemplate:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 displayMode];
  if ([v5 isEqualToString:@"hidden"])
  {
    uint64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"all"])
  {
    uint64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"overlay"])
  {
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(_TVSplitTemplateController *)self setPreferredDisplayMode:v6];
  v7 = [v4 style];
  objc_msgSend(v7, "tv_width");
  double v9 = v8;

  if (v9 >= 1.0)
  {
    [(_TVSplitTemplateController *)self setMaximumPrimaryColumnWidth:v9];
    [(_TVSplitTemplateController *)self setMinimumPrimaryColumnWidth:v9];
    double v9 = *MEMORY[0x263F1D5E8];
  }
  else
  {
    if (v9 >= 0.00000011920929)
    {
      [(_TVSplitTemplateController *)self setMaximumPrimaryColumnWidth:1.79769313e308];
      double v11 = *MEMORY[0x263F1D5E8];
      v10 = self;
    }
    else
    {
      double v9 = *MEMORY[0x263F1D5E8];
      [(_TVSplitTemplateController *)self setMaximumPrimaryColumnWidth:*MEMORY[0x263F1D5E8]];
      v10 = self;
      double v11 = v9;
    }
    [(_TVSplitTemplateController *)v10 setMinimumPrimaryColumnWidth:v11];
  }
  [(_TVSplitTemplateController *)self setPreferredPrimaryColumnWidthFraction:v9];
  v12 = [(_TVSplitTemplateController *)self viewControllers];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    v14 = objc_alloc_init(_TVAppNavigationController_iOS);
    v21[0] = v14;
    v15 = objc_alloc_init(_TVAppNavigationController_iOS);
    v21[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

    [(_TVSplitTemplateController *)self setViewControllers:v16];
    v17 = [v4 leftNavigationDocument];
    v18 = [v16 objectAtIndexedSubscript:0];
    [v17 setNavigationController:v18];

    v19 = [v4 rightNavigationDocument];
    v20 = [v16 objectAtIndexedSubscript:1];
    [v19 setNavigationController:v20];
  }
}

@end