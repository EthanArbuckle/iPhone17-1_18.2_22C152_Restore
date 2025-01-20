@interface SKUIReviewInAppRatingAction
+ (id)actionWithCustomContentViewController:(id)a3;
- (id)afterDismissHandler;
- (id)beforeDismissHandler;
- (void)setAfterDismissHandler:(id)a3;
- (void)setBeforeDismissHandler:(id)a3;
- (void)setCustomEnabledState:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SKUIReviewInAppRatingAction

+ (id)actionWithCustomContentViewController:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SKUIReviewInAppRatingAction;
  v3 = objc_msgSendSuper2(&v5, sel_actionWithCustomContentViewController_, a3);
  objc_msgSend(v3, "setCustomEnabledState:", objc_msgSend(v3, "isEnabled"));

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIReviewInAppRatingAction;
  -[UIInterfaceAction setEnabled:](&v5, sel_setEnabled_);
  [(SKUIReviewInAppRatingAction *)self setCustomEnabledState:v3];
}

- (void)setCustomEnabledState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIInterfaceAction *)self customContentViewController];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(UIInterfaceAction *)self customContentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [(UIInterfaceAction *)self customContentViewController];
      [v9 setEnabled:v3];
    }
  }
}

- (id)beforeDismissHandler
{
  return self->_beforeDismissHandler;
}

- (void)setBeforeDismissHandler:(id)a3
{
}

- (id)afterDismissHandler
{
  return self->_afterDismissHandler;
}

- (void)setAfterDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_afterDismissHandler, 0);

  objc_storeStrong(&self->_beforeDismissHandler, 0);
}

@end