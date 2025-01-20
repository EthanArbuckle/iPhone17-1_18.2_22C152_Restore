@interface _TUISyncLayoutAssertion
- (NSString)description;
- (_TUISyncLayoutAssertion)initWithController:(id)a3 timeout:(double)a4 transaction:(id)a5 feedId:(id)a6;
- (void)_invalidate:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _TUISyncLayoutAssertion

- (_TUISyncLayoutAssertion)initWithController:(id)a3 timeout:(double)a4 transaction:(id)a5 feedId:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_TUISyncLayoutAssertion;
  v12 = [(_TUISyncLayoutAssertion *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_controller, v10);
    v13->_timeout = a4;
    objc_storeStrong((id *)&v13->_transaction, a5);
    v13->_feedId.uniqueIdentifier = a6.var0;
  }

  return v13;
}

- (void)dealloc
{
  [(_TUISyncLayoutAssertion *)self _invalidate:0];
  v3.receiver = self;
  v3.super_class = (Class)_TUISyncLayoutAssertion;
  [(_TUISyncLayoutAssertion *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)_invalidate:(id)a3
{
  p_controller = &self->_controller;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);
  objc_storeWeak((id *)p_controller, 0);
  [WeakRetained removeAssertion:v4];
}

- (NSString)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p timeout=%f tx=%@ feedId=%lu>", v4, self, *(void *)&self->_timeout, self->_transaction, self->_feedId.uniqueIdentifier];

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end