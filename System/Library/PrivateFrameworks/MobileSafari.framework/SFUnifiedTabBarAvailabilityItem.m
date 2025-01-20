@interface SFUnifiedTabBarAvailabilityItem
- (NSString)title;
- (SFUnifiedTabBarAvailabilityItem)initWithTitle:(id)a3;
- (SFUnifiedTabBarAvailabilityItem)initWithTitle:(id)a3 image:(id)a4 buttonType:(int64_t)a5 action:(id)a6;
- (UIImage)image;
- (id)action;
- (int64_t)buttonType;
- (void)performAction;
- (void)setAction:(id)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFUnifiedTabBarAvailabilityItem

- (SFUnifiedTabBarAvailabilityItem)initWithTitle:(id)a3
{
  return [(SFUnifiedTabBarAvailabilityItem *)self initWithTitle:a3 image:0 buttonType:15 action:0];
}

- (SFUnifiedTabBarAvailabilityItem)initWithTitle:(id)a3 image:(id)a4 buttonType:(int64_t)a5 action:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFUnifiedTabBarAvailabilityItem;
  v13 = [(SFUnifiedTabBarAvailabilityItem *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_image, a4);
    v13->_buttonType = a5;
    uint64_t v16 = [v12 copy];
    id action = v13->_action;
    v13->_id action = (id)v16;

    v18 = v13;
  }

  return v13;
}

- (void)performAction
{
  id action = (void (**)(void))self->_action;
  if (action) {
    action[2]();
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end