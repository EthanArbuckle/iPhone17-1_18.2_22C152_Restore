@interface NavContainerBannerAction
- (BOOL)hidden;
- (NSString)title;
- (id)actionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActionHandler:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation NavContainerBannerAction

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NavContainerBannerAction;
  v3 = [(NavContainerBannerAction *)&v7 description];
  v4 = [(NavContainerBannerAction *)self title];
  v5 = +[NSString stringWithFormat:@"%@ title: %@ hidden: %d", v3, v4, [(NavContainerBannerAction *)self hidden]];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  v5 = [(NavContainerBannerAction *)self title];
  [v4 setTitle:v5];

  [v4 setHidden:[self hidden]];
  v6 = [(NavContainerBannerAction *)self actionHandler];
  [v4 setActionHandler:v6];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end