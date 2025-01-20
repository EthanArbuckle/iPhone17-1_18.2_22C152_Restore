@interface TUIBarButtonItem
- (NSAttributedString)attributedTitle;
- (NSDictionary)imageModelIDToResource;
- (TUIAXAttributes)axAttributes;
- (TUIMenuModel)menuModel;
- (double)buttonWidth;
- (double)maxButtonWidth;
- (double)minButtonWidth;
- (unint64_t)buttonRole;
- (unint64_t)buttonType;
- (void)dealloc;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setAxAttributes:(id)a3;
- (void)setButtonRole:(unint64_t)a3;
- (void)setButtonType:(unint64_t)a3;
- (void)setButtonWidth:(double)a3;
- (void)setImageModelIDToResource:(id)a3;
- (void)setMaxButtonWidth:(double)a3;
- (void)setMenuModel:(id)a3;
- (void)setMinButtonWidth:(double)a3;
@end

@implementation TUIBarButtonItem

- (void)setMenuModel:(id)a3
{
  v5 = (TUIMenuModel *)a3;
  menuModel = self->_menuModel;
  if (menuModel != v5)
  {
    v9 = v5;
    unsigned __int8 v7 = [(TUIMenuModel *)menuModel isEqual:v5];
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_menuModel, a3);
      if ([(NSDictionary *)self->_imageModelIDToResource count]) {
        [(TUIMenuModel *)self->_menuModel loadImagesFromResourceMap:self->_imageModelIDToResource];
      }
      id v8 = [(TUIMenuModel *)v9 newUIMenuElement];
      [(TUIBarButtonItem *)self setMenu:v8];

      v5 = v9;
    }
  }
}

- (void)setImageModelIDToResource:(id)a3
{
  id v4 = a3;
  if (![(NSDictionary *)self->_imageModelIDToResource isEqualToDictionary:v4])
  {
    [v4 enumerateKeysAndObjectsUsingBlock:&stru_2518D0];
    imageModelIDToResource = self->_imageModelIDToResource;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_13A58;
    v10[3] = &unk_2518F8;
    v10[4] = self;
    [(NSDictionary *)imageModelIDToResource enumerateKeysAndObjectsUsingBlock:v10];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_13AAC;
    v9[3] = &unk_2518F8;
    v9[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
    v6 = (NSDictionary *)[v4 copy];
    unsigned __int8 v7 = self->_imageModelIDToResource;
    self->_imageModelIDToResource = v6;

    if (self->_menuModel)
    {
      if ([(NSDictionary *)self->_imageModelIDToResource count])
      {
        [(TUIMenuModel *)self->_menuModel loadImagesFromResourceMap:self->_imageModelIDToResource];
        id v8 = [(TUIMenuModel *)self->_menuModel newUIMenuElement];
        [(TUIBarButtonItem *)self setMenu:v8];
      }
    }
  }
}

- (void)dealloc
{
  imageModelIDToResource = self->_imageModelIDToResource;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13B5C;
  v5[3] = &unk_2518F8;
  v5[4] = self;
  [(NSDictionary *)imageModelIDToResource enumerateKeysAndObjectsUsingBlock:v5];
  v4.receiver = self;
  v4.super_class = (Class)TUIBarButtonItem;
  [(TUIBarButtonItem *)&v4 dealloc];
}

- (void)imageResourceDidChangeImage:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_13C48;
  v4[3] = &unk_251828;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (void)setButtonRole:(unint64_t)a3
{
  self->_buttonRole = a3;
}

- (double)buttonWidth
{
  return self->_buttonWidth;
}

- (void)setButtonWidth:(double)a3
{
  self->_buttonWidth = a3;
}

- (double)minButtonWidth
{
  return self->_minButtonWidth;
}

- (void)setMinButtonWidth:(double)a3
{
  self->_minButtonWidth = a3;
}

- (double)maxButtonWidth
{
  return self->_maxButtonWidth;
}

- (void)setMaxButtonWidth:(double)a3
{
  self->_maxButtonWidth = a3;
}

- (TUIMenuModel)menuModel
{
  return self->_menuModel;
}

- (TUIAXAttributes)axAttributes
{
  return self->_axAttributes;
}

- (void)setAxAttributes:(id)a3
{
}

- (NSDictionary)imageModelIDToResource
{
  return self->_imageModelIDToResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageModelIDToResource, 0);
  objc_storeStrong((id *)&self->_axAttributes, 0);
  objc_storeStrong((id *)&self->_menuModel, 0);

  objc_storeStrong((id *)&self->_attributedTitle, 0);
}

@end