@interface VUIAlertAction
+ (id)vui_actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
+ (id)vui_actionWithTitle:(id)a3 titleImage:(id)a4 style:(int64_t)a5 handler:(id)a6;
+ (id)vui_actionWithTitle:(id)a3 titleImage:(id)a4 style:(int64_t)a5 metrics:(id)a6 handler:(id)a7;
- (BOOL)isEnabled;
- (NSDictionary)metrics;
- (NSString)title;
- (UIImage)titleImage;
- (id)handler;
- (int64_t)style;
- (void)setEnabled:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleImage:(id)a3;
@end

@implementation VUIAlertAction

+ (id)vui_actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  return +[VUIAlertAction vui_actionWithTitle:a3 titleImage:0 style:a4 metrics:0 handler:a5];
}

+ (id)vui_actionWithTitle:(id)a3 titleImage:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  return +[VUIAlertAction vui_actionWithTitle:a3 titleImage:a4 style:a5 metrics:0 handler:a6];
}

+ (id)vui_actionWithTitle:(id)a3 titleImage:(id)a4 style:(int64_t)a5 metrics:(id)a6 handler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_alloc_init(VUIAlertAction);
  [(VUIAlertAction *)v15 setTitle:v14];

  [(VUIAlertAction *)v15 setTitleImage:v13];
  [(VUIAlertAction *)v15 setStyle:a5];
  [(VUIAlertAction *)v15 setHandler:v11];

  [(VUIAlertAction *)v15 setMetrics:v12];
  return v15;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end