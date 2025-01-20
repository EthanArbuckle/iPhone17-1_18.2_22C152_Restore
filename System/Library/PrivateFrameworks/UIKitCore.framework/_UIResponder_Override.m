@interface _UIResponder_Override
+ (id)overrideForResponder:(id)a3 withTarget:(id)a4 forType:(int64_t)a5;
- (UIResponder)owner;
- (UIResponder)target;
- (id)description;
- (int64_t)types;
- (void)dealloc;
@end

@implementation _UIResponder_Override

+ (id)overrideForResponder:(id)a3 withTarget:(id)a4 forType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 _currentOverrideClient];
  uint64_t v10 = v9;
  if (v9 && (id v11 = objc_loadWeakRetained((id *)(v9 + 16)), v11, v11 == v8))
  {
    if ((*(void *)(v10 + 24) & a5) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v10 + 16));
      v17 = [WeakRetained _overrideHost];
      [v17 attachOverrider:v7 forTypes:a5];

      *(void *)(v10 + 24) |= a5;
    }
  }
  else
  {
    uint64_t v12 = objc_opt_new();

    if (v12)
    {
      objc_storeWeak((id *)(v12 + 8), v7);
      objc_storeWeak((id *)(v12 + 16), v8);
      *(void *)(v12 + 24) = a5;
      v13 = [v8 _overrideHost];
      [v13 attachOverrider:v7 forTypes:a5];
    }
    uint64_t v10 = v12;
  }
  id v14 = (id)v10;

  return v14;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  v4 = [WeakRetained _overrideHost];
  id v5 = objc_loadWeakRetained((id *)&self->_owner);
  [v4 detachOverrider:v5 forTypes:self->_types];

  v6.receiver = self;
  v6.super_class = (Class)_UIResponder_Override;
  [(_UIResponder_Override *)&v6 dealloc];
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)_UIResponder_Override;
  v4 = [(_UIResponder_Override *)&v10 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  id v6 = objc_loadWeakRetained((id *)&self->_target);
  id v7 = NSStringFrom_UI_UIResponder_Override_Type(self->_types);
  id v8 = [v3 stringWithFormat:@"<%@ owner=%@; target=%@; types=%@>", v4, WeakRetained, v6, v7];;

  return v8;
}

- (UIResponder)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (UIResponder *)WeakRetained;
}

- (UIResponder)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (UIResponder *)WeakRetained;
}

- (int64_t)types
{
  return self->_types;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
  objc_destroyWeak((id *)&self->_owner);
}

@end