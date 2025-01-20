@interface PLPlatterCustomContentView
- (PLPlatterCustomContentView)initWithAncestorPlatterView:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation PLPlatterCustomContentView

- (PLPlatterCustomContentView)initWithAncestorPlatterView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPlatterCustomContentView;
  v5 = [(PLPlatterCustomContentView *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_ancestorPlatterView, v4);
  }

  return v6;
}

- (void)willRemoveSubview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLPlatterCustomContentView;
  id v4 = a3;
  [(PLPlatterCustomContentView *)&v6 willRemoveSubview:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ancestorPlatterView);
  objc_msgSend(WeakRetained, "_willRemoveCustomContent:", v4, v6.receiver, v6.super_class);
}

- (void).cxx_destruct
{
}

@end