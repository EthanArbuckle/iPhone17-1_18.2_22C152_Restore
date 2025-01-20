@interface MapsInterruptionAction
+ (id)actionWithTitle:(id)a3 cancels:(BOOL)a4 handler:(id)a5;
- (BOOL)cancels;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handler;
- (void)fire;
- (void)setCancels:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapsInterruptionAction

+ (id)actionWithTitle:(id)a3 cancels:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setTitle:v9];

  [v10 setCancels:v5];
  [v10 setHandler:v8];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_title);
  *((unsigned char *)v4 + 8) = self->_cancels;
  id v5 = objc_retainBlock(self->_handler);
  id v6 = v4[3];
  v4[3] = v5;

  return v4;
}

- (void)fire
{
  v3 = [(MapsInterruptionAction *)self handler];

  if (v3)
  {
    v4 = [(MapsInterruptionAction *)self handler];
    [(MapsInterruptionAction *)self setHandler:0];
    v4[2]();
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)cancels
{
  return self->_cancels;
}

- (void)setCancels:(BOOL)a3
{
  self->_cancels = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end