@interface SupplementalStackViewController
- (BOOL)isEmpty;
- (NSMutableArray)containeeViewControllerStack;
- (SupplementalStackViewController)init;
- (id)preferredFocusEnvironments;
- (id)topContainee_forTests;
- (void)_addContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_removeContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)popContainee:(BOOL)a3 completion:(id)a4;
- (void)pushContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setContaineeViewControllerStack:(id)a3;
- (void)setContainees:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SupplementalStackViewController

- (SupplementalStackViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SupplementalStackViewController;
  v2 = [(SupplementalStackViewController *)&v6 initWithNibName:0 bundle:0];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    containeeViewControllerStack = v2->_containeeViewControllerStack;
    v2->_containeeViewControllerStack = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)_addContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v28 = (void (**)(id, uint64_t))a5;
  id v31 = a3;
  v7 = [v31 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SupplementalStackViewController *)self addChildViewController:v31];
  v8 = [(SupplementalStackViewController *)self view];
  [v8 addSubview:v7];

  v29 = [v7 topAnchor];
  v30 = [(SupplementalStackViewController *)self view];
  v27 = [v30 safeAreaLayoutGuide];
  v26 = [v27 topAnchor];
  v25 = [v29 constraintEqualToAnchor:v26];
  v32[0] = v25;
  v23 = [v7 leadingAnchor];
  v24 = [(SupplementalStackViewController *)self view];
  v22 = [v24 safeAreaLayoutGuide];
  v21 = [v22 leadingAnchor];
  v20 = [v23 constraintEqualToAnchor:v21];
  v32[1] = v20;
  v18 = [v7 bottomAnchor];
  v19 = [(SupplementalStackViewController *)self view];
  v17 = [v19 safeAreaLayoutGuide];
  v9 = [v17 bottomAnchor];
  v10 = [v18 constraintEqualToAnchor:v9];
  v32[2] = v10;
  v11 = [v7 trailingAnchor];
  v12 = [(SupplementalStackViewController *)self view];
  v13 = [v12 safeAreaLayoutGuide];
  v14 = [v13 trailingAnchor];
  v15 = [v11 constraintEqualToAnchor:v14];
  v32[3] = v15;
  v16 = +[NSArray arrayWithObjects:v32 count:4];
  +[NSLayoutConstraint activateConstraints:v16];

  [v31 didMoveToParentViewController:self];
  if (v28) {
    v28[2](v28, 1);
  }
}

- (void)_removeContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v9 = a5;
  id v6 = a3;
  [v6 willMoveToParentViewController:0];
  v7 = [v6 view];
  [v7 removeFromSuperview];

  [v6 removeFromParentViewController];
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    v8 = v9;
  }
}

- (void)pushContainee:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (([(NSMutableArray *)self->_containeeViewControllerStack containsObject:v8] & 1) == 0)
  {
    v10 = dispatch_group_create();
    v11 = [(NSMutableArray *)self->_containeeViewControllerStack lastObject];
    if (v11)
    {
      dispatch_group_enter(v10);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1007D9E50;
      v17[3] = &unk_1012E7D28;
      v18 = v10;
      [(SupplementalStackViewController *)self _removeContainee:v11 animated:v6 completion:v17];
    }
    dispatch_group_enter(v10);
    [(NSMutableArray *)self->_containeeViewControllerStack addObject:v8];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007D9E58;
    v15[3] = &unk_1012E7D28;
    v16 = v10;
    v12 = v10;
    [(SupplementalStackViewController *)self _addContainee:v8 animated:v6 completion:v15];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007D9E60;
    block[3] = &unk_1012E6EA8;
    id v14 = v9;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)popContainee:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = dispatch_group_create();
  id v8 = [(NSMutableArray *)self->_containeeViewControllerStack lastObject];
  if (v8)
  {
    dispatch_group_enter(v7);
    [(NSMutableArray *)self->_containeeViewControllerStack removeObjectAtIndex:(char *)[(NSMutableArray *)self->_containeeViewControllerStack count] - 1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007DA080;
    v15[3] = &unk_1012E7D28;
    id v9 = v7;
    v16 = v9;
    [(SupplementalStackViewController *)self _removeContainee:v8 animated:v4 completion:v15];
    v10 = [(NSMutableArray *)self->_containeeViewControllerStack lastObject];
    if (v10)
    {
      dispatch_group_enter(v9);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1007DA088;
      v13[3] = &unk_1012E7D28;
      id v14 = v9;
      [(SupplementalStackViewController *)self _addContainee:v10 animated:v4 completion:v13];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007DA090;
    block[3] = &unk_1012E6EA8;
    id v12 = v6;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

- (void)setContainees:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  containeeViewControllerStack = self->_containeeViewControllerStack;
  unint64_t v11 = (unint64_t)v8;
  id v12 = containeeViewControllerStack;
  if (v11 | (unint64_t)v12
    && (v13 = v12,
        unsigned int v14 = [(id)v11 isEqual:v12],
        v13,
        (id)v11,
        !v14))
  {
    v15 = dispatch_group_create();
    v16 = [(NSMutableArray *)self->_containeeViewControllerStack lastObject];
    if (v16)
    {
      dispatch_group_enter(v15);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1007DA304;
      v24[3] = &unk_1012E7D28;
      v25 = v15;
      [(SupplementalStackViewController *)self _removeContainee:v16 animated:v6 completion:v24];
    }
    v17 = +[NSMutableArray arrayWithArray:v11];
    v18 = self->_containeeViewControllerStack;
    self->_containeeViewControllerStack = v17;

    v19 = [(NSMutableArray *)self->_containeeViewControllerStack lastObject];
    if (v19)
    {
      dispatch_group_enter(v15);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1007DA30C;
      v22[3] = &unk_1012E7D28;
      v23 = v15;
      [(SupplementalStackViewController *)self _addContainee:v19 animated:v6 completion:v22];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007DA314;
    block[3] = &unk_1012E6EA8;
    id v21 = v9;
    dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_containeeViewControllerStack count] == 0;
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = [(NSMutableArray *)self->_containeeViewControllerStack lastObject];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    BOOL v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    BOOL v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)topContainee_forTests
{
  return [(NSMutableArray *)self->_containeeViewControllerStack lastObject];
}

- (NSMutableArray)containeeViewControllerStack
{
  return self->_containeeViewControllerStack;
}

- (void)setContaineeViewControllerStack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end