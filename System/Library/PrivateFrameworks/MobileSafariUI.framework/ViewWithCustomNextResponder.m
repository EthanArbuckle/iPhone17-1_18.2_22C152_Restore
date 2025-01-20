@interface ViewWithCustomNextResponder
- (UIFocusEnvironment)customParentFocusEnvironment;
- (UIResponder)customNextResponder;
- (id)nextResponder;
- (id)parentFocusEnvironment;
- (void)setNextResponder:(id)a3 parentFocusEnvironment:(id)a4;
@end

@implementation ViewWithCustomNextResponder

- (void)setNextResponder:(id)a3 parentFocusEnvironment:(id)a4
{
  p_customNextResponder = &self->_customNextResponder;
  id obj = a4;
  objc_storeWeak((id *)p_customNextResponder, a3);
  objc_storeWeak((id *)&self->_customParentFocusEnvironment, obj);
}

- (id)nextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customNextResponder);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ViewWithCustomNextResponder;
    id v5 = [(ViewWithCustomNextResponder *)&v8 nextResponder];
  }
  v6 = v5;

  return v6;
}

- (id)parentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ViewWithCustomNextResponder;
    id v5 = [(ViewWithCustomNextResponder *)&v8 parentFocusEnvironment];
  }
  v6 = v5;

  return v6;
}

- (UIResponder)customNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customNextResponder);
  return (UIResponder *)WeakRetained;
}

- (UIFocusEnvironment)customParentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customParentFocusEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customParentFocusEnvironment);
  objc_destroyWeak((id *)&self->_customNextResponder);
}

@end