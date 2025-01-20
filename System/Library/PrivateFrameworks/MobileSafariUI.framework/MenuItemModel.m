@interface MenuItemModel
- (MenuItemModel)initWithTitle:(id)a3 subtitle:(id)a4 payload:(id)a5 action:(id)a6;
- (NSString)subtitle;
- (NSString)title;
- (id)action;
- (id)payload;
@end

@implementation MenuItemModel

- (MenuItemModel)initWithTitle:(id)a3 subtitle:(id)a4 payload:(id)a5 action:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MenuItemModel;
  v14 = [(MenuItemModel *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v17;

    objc_storeStrong(&v14->_payload, a5);
    uint64_t v19 = [v13 copy];
    id action = v14->_action;
    v14->_id action = (id)v19;

    v21 = v14;
  }

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (id)payload
{
  return self->_payload;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end