@interface RAPNavigationItemValues
- (void)setValuesOnNavigationItem:(id)a3 animated:(BOOL)a4;
- (void)takeValuesFromNavigationItem:(id)a3;
@end

@implementation RAPNavigationItemValues

- (void)takeValuesFromNavigationItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = (NSString *)[v5 copy];
  title = self->_title;
  self->_title = v6;

  v8 = [v4 backBarButtonItem];
  backBarButtonItem = self->_backBarButtonItem;
  self->_backBarButtonItem = v8;

  v10 = [v4 titleView];
  titleView = self->_titleView;
  self->_titleView = v10;

  v12 = [v4 prompt];
  v13 = (NSString *)[v12 copy];
  prompt = self->_prompt;
  self->_prompt = v13;

  self->_leftItemsSupplementBackButton = [v4 leftItemsSupplementBackButton];
  self->_hidesBackButton = [v4 hidesBackButton];
  v15 = [v4 leftBarButtonItems];
  v16 = (NSArray *)[v15 copy];
  leftBarButtonItems = self->_leftBarButtonItems;
  self->_leftBarButtonItems = v16;

  id v20 = [v4 rightBarButtonItems];

  v18 = (NSArray *)[v20 copy];
  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = v18;
}

- (void)setValuesOnNavigationItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  title = self->_title;
  id v7 = a3;
  [v7 setTitle:title];
  [v7 setBackBarButtonItem:self->_backBarButtonItem];
  [v7 setTitleView:self->_titleView];
  [v7 setPrompt:self->_prompt];
  [v7 setLeftItemsSupplementBackButton:self->_leftItemsSupplementBackButton];
  [v7 setHidesBackButton:self->_hidesBackButton animated:v4];
  [v7 setLeftBarButtonItems:self->_leftBarButtonItems animated:v4];
  [v7 setRightBarButtonItems:self->_rightBarButtonItems animated:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end