@interface SKUIProductPageAction
+ (id)actionWithType:(int64_t)a3;
- (NSURL)URL;
- (SKUIItem)item;
- (UIViewController)viewController;
- (id)viewControllerBlock;
- (int64_t)actionType;
- (void)setActionType:(int64_t)a3;
- (void)setItem:(id)a3;
- (void)setURL:(id)a3;
- (void)setViewControllerBlock:(id)a3;
- (void)viewController;
@end

@implementation SKUIProductPageAction

+ (id)actionWithType:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIProductPageAction actionWithType:]();
  }
  id v5 = objc_alloc_init((Class)a1);
  [v5 setActionType:a3];

  return v5;
}

- (UIViewController)viewController
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageAction viewController]();
  }
  viewControllerBlock = (void (**)(void))self->_viewControllerBlock;
  if (viewControllerBlock)
  {
    viewControllerBlock[2]();
    viewControllerBlock = (void (**)(void))objc_claimAutoreleasedReturnValue();
  }

  return (UIViewController *)viewControllerBlock;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (SKUIItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (id)viewControllerBlock
{
  return self->_viewControllerBlock;
}

- (void)setViewControllerBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong(&self->_viewControllerBlock, 0);
  objc_storeStrong((id *)&self->_urlTitle, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

+ (void)actionWithType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIProductPageAction actionWithType:]";
}

- (void)viewController
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageAction viewController]";
}

@end