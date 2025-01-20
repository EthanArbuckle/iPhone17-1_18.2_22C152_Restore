@interface SUUIProductPageAction
+ (id)actionWithType:(int64_t)a3;
- (NSURL)URL;
- (SUUIItem)item;
- (UIViewController)viewController;
- (id)viewControllerBlock;
- (int64_t)actionType;
- (void)setActionType:(int64_t)a3;
- (void)setItem:(id)a3;
- (void)setURL:(id)a3;
- (void)setViewControllerBlock:(id)a3;
@end

@implementation SUUIProductPageAction

+ (id)actionWithType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setActionType:a3];
  return v4;
}

- (UIViewController)viewController
{
  viewControllerBlock = (void (**)(void, void))self->_viewControllerBlock;
  if (viewControllerBlock)
  {
    ((void (**)(void, SEL))viewControllerBlock)[2](viewControllerBlock, a2);
    viewControllerBlock = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
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

- (SUUIItem)item
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

@end