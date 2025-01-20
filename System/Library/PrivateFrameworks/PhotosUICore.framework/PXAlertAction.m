@interface PXAlertAction
- (NSString)title;
- (PXAlertAction)init;
- (PXAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5;
- (id)action;
- (int64_t)style;
@end

@implementation PXAlertAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)action
{
  return self->_action;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (PXAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXAlert.m", 326, @"Invalid parameter not satisfying: %@", @"title != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXAlertAction;
  v11 = [(PXAlertAction *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v11->_style = a4;
    uint64_t v14 = [v10 copy];
    id action = v11->_action;
    v11->_id action = (id)v14;
  }
  return v11;
}

- (PXAlertAction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAlert.m", 322, @"%s is not available as initializer", "-[PXAlertAction init]");

  abort();
}

@end