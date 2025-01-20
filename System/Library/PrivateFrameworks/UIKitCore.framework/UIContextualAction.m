@interface UIContextualAction
+ (UIContextualAction)contextualActionWithStyle:(UIContextualActionStyle)style title:(NSString *)title handler:(UIContextualActionHandler)handler;
- (BOOL)forcesFallbackBackgroundColor;
- (BOOL)isDestructive;
- (NSString)title;
- (UIColor)backgroundColor;
- (UIContextualActionHandler)handler;
- (UIContextualActionStyle)style;
- (UIImage)image;
- (UIMenu)_menu;
- (UIVisualEffect)_backgroundEffect;
- (id)completionHandler;
- (id)description;
- (id)preHandler;
- (void)_completeWithResult:(BOOL)a3;
- (void)_setBackgroundEffect:(id)a3;
- (void)_setMenu:(id)a3;
- (void)cancel;
- (void)executeHandlerWithView:(id)a3 completionHandler:(id)a4;
- (void)executePreHandlerWithView:(id)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setCompletionHandler:(id)a3;
- (void)setForcesFallbackBackgroundColor:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setImage:(UIImage *)image;
- (void)setPreHandler:(id)a3;
- (void)setTitle:(NSString *)title;
@end

@implementation UIContextualAction

+ (UIContextualAction)contextualActionWithStyle:(UIContextualActionStyle)style title:(NSString *)title handler:(UIContextualActionHandler)handler
{
  UIContextualActionHandler v8 = handler;
  v9 = title;
  v10 = objc_alloc_init((Class)a1);
  v10[2] = style;
  [v10 setTitle:v9];

  if (style)
  {
    if (style == UIContextualActionStyleDestructive)
    {
      uint64_t v11 = +[UIColor systemRedColor];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    if (dyld_program_sdk_at_least()) {
      +[UIColor systemGray3Color];
    }
    else {
    uint64_t v11 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
    }
  }
  v12 = (void *)v10[5];
  v10[5] = v11;

  [v10 setHandler:v8];
  return (UIContextualAction *)v10;
}

- (BOOL)isDestructive
{
  return [(UIContextualAction *)self style] == UIContextualActionStyleDestructive;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  v4 = backgroundColor;
  UIContextualActionHandler v8 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    int64_t style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        v5 = +[UIColor systemRedColor];
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      if (dyld_program_sdk_at_least()) {
        +[UIColor systemGray3Color];
      }
      else {
      v5 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
      }
    }
  }
  v6 = self->_backgroundColor;
  self->_backgroundColor = v5;
}

- (void)executePreHandlerWithView:(id)a3
{
  id v6 = a3;
  v4 = [(UIContextualAction *)self preHandler];

  if (v4)
  {
    v5 = [(UIContextualAction *)self preHandler];
    ((void (**)(void, UIContextualAction *, id))v5)[2](v5, self, v6);
  }
}

- (void)executeHandlerWithView:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = _Block_copy(a4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v7;

  v9 = [(UIContextualAction *)self handler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__UIContextualAction_executeHandlerWithView_completionHandler___block_invoke;
  v10[3] = &unk_1E52DC3A0;
  v10[4] = self;
  ((void (**)(void, UIContextualAction *, id, void *))v9)[2](v9, self, v6, v10);
}

uint64_t __63__UIContextualAction_executeHandlerWithView_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeWithResult:a2];
}

- (void)cancel
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)_completeWithResult:(BOOL)a3
{
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    BOOL v5 = a3;
    v7 = (void (**)(id, BOOL))_Block_copy(completionHandler);
    id v6 = self->_completionHandler;
    self->_id completionHandler = 0;

    v7[2](v7, v5);
  }
}

- (id)description
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel_style);
  v10[0] = v3;
  v4 = NSStringFromSelector(sel_title);
  v10[1] = v4;
  BOOL v5 = NSStringFromSelector(sel_backgroundColor);
  v10[2] = v5;
  id v6 = NSStringFromSelector(sel_image);
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  UIContextualActionHandler v8 = +[UIDescriptionBuilder descriptionForObject:self keys:v7];

  return v8;
}

- (UIContextualActionStyle)style
{
  return self->_style;
}

- (UIContextualActionHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)forcesFallbackBackgroundColor
{
  return self->_forcesFallbackBackgroundColor;
}

- (void)setForcesFallbackBackgroundColor:(BOOL)a3
{
  self->_forcesFallbackBackgroundColor = a3;
}

- (id)preHandler
{
  return self->_preHandler;
}

- (void)setPreHandler:(id)a3
{
}

- (UIMenu)_menu
{
  return self->__menu;
}

- (void)_setMenu:(id)a3
{
}

- (UIVisualEffect)_backgroundEffect
{
  return self->__backgroundEffect;
}

- (void)_setBackgroundEffect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundEffect, 0);
  objc_storeStrong((id *)&self->__menu, 0);
  objc_storeStrong(&self->_preHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end