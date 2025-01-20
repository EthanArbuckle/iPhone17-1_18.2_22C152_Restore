@interface IMMenuItem
+ (id)menuItemWithTitle:(id)a3 actionBlock:(id)a4;
+ (id)menuItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (IMMenuItem)initWithTitle:(id)a3 actionBlock:(id)a4;
- (IMMenuItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (NSString)title;
- (SEL)action;
- (id)actionBlock;
- (id)target;
- (void)dealloc;
- (void)performActionBlock:(id)a3;
@end

@implementation IMMenuItem

+ (id)menuItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithTitle:v9 target:v8 action:a5];

  return v10;
}

+ (id)menuItemWithTitle:(id)a3 actionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithTitle:v7 actionBlock:v6];

  return v8;
}

- (IMMenuItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMMenuItem;
  id v10 = [(IMMenuItem *)&v15 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    title = v10->_title;
    v10->_title = v11;

    objc_storeWeak(&v10->_target, v9);
    if (a5) {
      SEL v13 = a5;
    }
    else {
      SEL v13 = 0;
    }
    v10->_action = v13;
  }

  return v10;
}

- (IMMenuItem)initWithTitle:(id)a3 actionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMMenuItem *)self init];
  if (v8)
  {
    id v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    id v11 = [v7 copy];
    id actionBlock = v8->_actionBlock;
    v8->_id actionBlock = v11;
  }
  return v8;
}

- (void)dealloc
{
  id actionBlock = self->_actionBlock;
  self->_id actionBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMMenuItem;
  [(IMMenuItem *)&v4 dealloc];
}

- (void)performActionBlock:(id)a3
{
  objc_super v4 = [(IMMenuItem *)self actionBlock];

  if (v4)
  {
    v5 = [(IMMenuItem *)self actionBlock];
    v5[2]();
  }
}

- (NSString)title
{
  return self->_title;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
  objc_destroyWeak(&self->_target);

  objc_storeStrong((id *)&self->_title, 0);
}

@end