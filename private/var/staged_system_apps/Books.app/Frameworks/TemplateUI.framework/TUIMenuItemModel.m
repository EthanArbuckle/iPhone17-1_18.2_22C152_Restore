@interface TUIMenuItemModel
+ (id)menuItemWithTitle:(id)a3 imageModel:(id)a4 isEnabled:(BOOL)a5 isOn:(BOOL)a6 action:(id)a7;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOn;
- (NSString)title;
- (TUIElementBehaviorArgumentsMap)action;
- (TUIImageModel)imageModel;
- (TUIMenuItemModel)initWithTitle:(id)a3 imageModel:(id)a4 isEnabled:(BOOL)a5 isOn:(BOOL)a6 action:(id)a7;
- (id)newUIMenuElementWithActionObject:(id)a3 delegate:(id)a4;
- (void)loadImagesFromResourceMap:(id)a3;
@end

@implementation TUIMenuItemModel

- (TUIMenuItemModel)initWithTitle:(id)a3 imageModel:(id)a4 isEnabled:(BOOL)a5 isOn:(BOOL)a6 action:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)TUIMenuItemModel;
  v15 = [(TUIMenuItemModel *)&v19 init];
  if (v15)
  {
    v16 = (NSString *)[v12 copy];
    title = v15->_title;
    v15->_title = v16;

    objc_storeStrong((id *)&v15->_imageModel, a4);
    v15->_isEnabled = a5;
    v15->_isOn = a6;
    objc_storeStrong((id *)&v15->_action, a7);
  }

  return v15;
}

+ (id)menuItemWithTitle:(id)a3 imageModel:(id)a4 isEnabled:(BOOL)a5 isOn:(BOOL)a6 action:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[TUIMenuItemModel alloc] initWithTitle:v13 imageModel:v12 isEnabled:v8 isOn:v7 action:v11];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = TUIDynamicCast(v5, v4);

  if (v6
    && ((title = self->_title, title == *(NSString **)(v6 + 16))
     || -[NSString isEqualToString:](title, "isEqualToString:"))
    && ((imageModel = self->_imageModel, imageModel == *(TUIImageModel **)(v6 + 24))
     || -[TUIImageModel isEqual:](imageModel, "isEqual:"))
    && self->_isEnabled == *(unsigned __int8 *)(v6 + 8)
    && self->_isOn == *(unsigned __int8 *)(v6 + 9))
  {
    action = self->_action;
    if (action == *(TUIElementBehaviorArgumentsMap **)(v6 + 32)) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = -[TUIElementBehaviorArgumentsMap isEqual:](action, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)loadImagesFromResourceMap:(id)a3
{
  id v9 = a3;
  imageModel = self->_imageModel;
  if (imageModel && !-[TUIImageModel isLoaded](imageModel, "isLoaded") && [v9 count])
  {
    uint64_t v5 = [(TUIImageModel *)self->_imageModel identifier];
    uint64_t v6 = [v9 objectForKeyedSubscript:v5];

    if (v6)
    {
      BOOL v7 = self->_imageModel;
      id v8 = objc_alloc_init((Class)UIImage);
      [(TUIImageModel *)v7 loadImageFromResource:v6 placeholderImage:v8];
    }
  }
}

- (id)newUIMenuElementWithActionObject:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  title = self->_title;
  if (title)
  {
    id v9 = [(TUIImageModel *)self->_imageModel image];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_133ED4;
    v11[3] = &unk_256080;
    id v12 = v7;
    id v13 = v6;
    id v14 = self;
    title = +[UIAction actionWithTitle:title image:v9 identifier:0 handler:v11];

    if (!self->_isEnabled) {
      [title setAttributes:1];
    }
    if (self->_isOn) {
      [title setState:1];
    }
  }
  return title;
}

- (NSString)title
{
  return self->_title;
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (TUIElementBehaviorArgumentsMap)action
{
  return self->_action;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_imageModel, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end