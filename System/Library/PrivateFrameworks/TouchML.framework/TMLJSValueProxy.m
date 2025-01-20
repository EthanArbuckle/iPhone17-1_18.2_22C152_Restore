@interface TMLJSValueProxy
- (TMLJSValueProxy)initWithTarget:(id)a3 keyPath:(id)a4;
- (id)_;
- (void)set_:(id)a3;
@end

@implementation TMLJSValueProxy

- (TMLJSValueProxy)initWithTarget:(id)a3 keyPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TMLJSValueProxy;
  v9 = [(TMLJSValueProxy *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_target, a3);
    uint64_t v13 = objc_msgSend_copy(v8, v11, v12);
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v13;
  }
  return v10;
}

- (id)_
{
  v3 = objc_msgSend_tmlValueForKeyPath_(self->_target, a2, v2, self->_keyPath);
  v6 = v3;
  if (v3)
  {
    id v7 = v3;
  }
  else
  {
    id v8 = objc_msgSend_currentContext(MEMORY[0x263F10378], v4, v5);
    objc_msgSend_jsValueInContext_(TMLJSNil, v9, v10, v8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)set_:(id)a3
{
  objc_msgSend_unwrap_(TMLJSNil, a2, v3, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTMLValue_forKeyPath_(self->_target, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_target, 0);
}

@end