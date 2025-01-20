@interface BKDebugViewEntry
+ (id)entryWithTitle:(id)a3 action:(id)a4;
+ (id)entryWithTitle:(id)a3 model:(id)a4;
+ (id)entryWithTitle:(id)a3 model:(id)a4 action:(id)a5;
- (BKDebugViewCellModel)model;
- (NSString)title;
- (id)action;
- (void)setAction:(id)a3;
- (void)setModel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKDebugViewEntry

+ (id)entryWithTitle:(id)a3 action:(id)a4
{
  return [a1 entryWithTitle:a3 model:0 action:a4];
}

+ (id)entryWithTitle:(id)a3 model:(id)a4
{
  return [a1 entryWithTitle:a3 model:a4 action:0];
}

+ (id)entryWithTitle:(id)a3 model:(id)a4 action:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(BKDebugViewEntry);
  [(BKDebugViewEntry *)v10 setTitle:v9];

  [(BKDebugViewEntry *)v10 setModel:v8];
  [(BKDebugViewEntry *)v10 setAction:v7];

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BKDebugViewCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end