@interface PXActionItem
- (NSString)systemImageName;
- (NSString)title;
- (PXActionItem)initWithTitle:(id)a3 systemImageName:(id)a4 role:(unint64_t)a5 handler:(id)a6;
- (PXActionItem)initWithTitle:(id)a3 systemImageName:(id)a4 role:(unint64_t)a5 state:(int64_t)a6 handler:(id)a7;
- (PXMenuAction)alternateAction;
- (UIImage)image;
- (id)handler;
- (int64_t)state;
- (unint64_t)role;
- (void)performAction;
@end

@implementation PXActionItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)handler
{
  return self->_handler;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)performAction
{
  v2 = [(PXActionItem *)self handler];
  v2[2]();
}

- (PXMenuAction)alternateAction
{
  return 0;
}

- (UIImage)image
{
  return 0;
}

- (PXActionItem)initWithTitle:(id)a3 systemImageName:(id)a4 role:(unint64_t)a5 handler:(id)a6
{
  return [(PXActionItem *)self initWithTitle:a3 systemImageName:a4 role:a5 state:0 handler:a6];
}

- (PXActionItem)initWithTitle:(id)a3 systemImageName:(id)a4 role:(unint64_t)a5 state:(int64_t)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PXActionItem;
  v15 = [(PXActionItem *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    title = v15->_title;
    v15->_title = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    systemImageName = v15->_systemImageName;
    v15->_systemImageName = (NSString *)v18;

    v15->_role = a5;
    v15->_state = a6;
    uint64_t v20 = [v14 copy];
    id handler = v15->_handler;
    v15->_id handler = (id)v20;
  }
  return v15;
}

@end