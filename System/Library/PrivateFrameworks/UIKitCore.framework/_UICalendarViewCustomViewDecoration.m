@interface _UICalendarViewCustomViewDecoration
- (_UICalendarViewCustomViewDecoration)initWithCustomViewProvider:(id)a3;
- (id)_decorationViewForReuseView:(id)a3;
@end

@implementation _UICalendarViewCustomViewDecoration

- (_UICalendarViewCustomViewDecoration)initWithCustomViewProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICalendarViewCustomViewDecoration;
  v5 = [(_UICalendarViewCustomViewDecoration *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id customViewProvider = v5->_customViewProvider;
    v5->_id customViewProvider = v6;
  }
  return v5;
}

- (id)_decorationViewForReuseView:(id)a3
{
  fulfilledCustomView = self->_fulfilledCustomView;
  if (!fulfilledCustomView)
  {
    (*((void (**)(void))self->_customViewProvider + 2))();
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_fulfilledCustomView;
    self->_fulfilledCustomView = v5;

    id customViewProvider = self->_customViewProvider;
    self->_id customViewProvider = 0;

    fulfilledCustomView = self->_fulfilledCustomView;
  }
  return fulfilledCustomView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fulfilledCustomView, 0);
  objc_storeStrong(&self->_customViewProvider, 0);
}

@end