@interface _TUIElementMenuItemBuilder
- (BOOL)isEnabled;
- (BOOL)isOn;
- (NSString)title;
- (TUIImageModel)imageModel;
- (id)finalizeMenuItem;
- (id)finalizeTriggers;
- (void)addImageModel:(id)a3 forRole:(id)a4;
- (void)addText:(id)a3 forRole:(id)a4;
- (void)addTrigger:(id)a3 withBehavior:(id)a4;
- (void)setImageModel:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsOn:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation _TUIElementMenuItemBuilder

- (id)finalizeMenuItem
{
  if (self->_title)
  {
    v3 = [_TUIMenuItemContainer alloc];
    v4 = +[TUIMenuItemModel menuItemWithTitle:self->_title imageModel:self->_imageModel isEnabled:self->_isEnabled isOn:self->_isOn action:self->_action];
    v5 = [(_TUIMenuItemContainer *)v3 initWithModel:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addTrigger:(id)a3 withBehavior:(id)a4
{
  id v7 = a4;
  if ([a3 isEqualToString:@"press"]) {
    objc_storeStrong((id *)&self->_action, a4);
  }
}

- (id)finalizeTriggers
{
  return 0;
}

- (void)addText:(id)a3 forRole:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6 || [v6 isEqualToString:@"title"])
  {
    v8 = (NSString *)[v10 copy];
    title = self->_title;
    self->_title = v8;
  }
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v7 || [v7 isEqualToString:@"image"]) {
    objc_storeStrong((id *)&self->_imageModel, a3);
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (void)setImageModel:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (void)setIsOn:(BOOL)a3
{
  self->_isOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end