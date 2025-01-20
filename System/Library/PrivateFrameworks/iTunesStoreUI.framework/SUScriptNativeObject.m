@interface SUScriptNativeObject
+ (SUScriptNativeObject)objectWithNativeObject:(id)a3;
+ (SUScriptNativeObject)objectWithNativeObject:(id)a3 weak:(BOOL)a4;
- (NSLock)internalLock;
- (SUScriptNativeObject)init;
- (SUScriptObject)scriptObject;
- (id)object;
- (id)strongObject;
- (id)weakObject;
- (void)destroyNativeObject;
- (void)lock;
- (void)setInternalLock:(id)a3;
- (void)setObject:(id)a3;
- (void)setScriptObject:(id)a3;
- (void)setStrongObject:(id)a3;
- (void)setWeakObject:(id)a3;
- (void)unlock;
@end

@implementation SUScriptNativeObject

- (SUScriptNativeObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptNativeObject;
  v2 = [(SUScriptNativeObject *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    internalLock = v2->_internalLock;
    v2->_internalLock = v3;
  }
  return v2;
}

- (id)object
{
  v3 = [(SUScriptNativeObject *)self weakObject];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SUScriptNativeObject *)self strongObject];
  }
  objc_super v6 = v5;

  return v6;
}

- (SUScriptObject)scriptObject
{
  [(SUScriptNativeObject *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scriptObject);
  [(SUScriptNativeObject *)self unlock];

  return (SUScriptObject *)WeakRetained;
}

- (void)setObject:(id)a3
{
  id v8 = a3;
  v4 = [(SUScriptNativeObject *)self object];

  if (v4) {
    [(SUScriptNativeObject *)self destroyNativeObject];
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 clearsWeakScriptReferences])
  {
    [(SUScriptNativeObject *)self lock];
    id strongObject = self->_strongObject;
    self->_id strongObject = 0;
    objc_super v6 = v8;
  }
  else
  {
    [(SUScriptNativeObject *)self lock];
    id v7 = v8;
    objc_super v6 = 0;
    id strongObject = self->_strongObject;
    self->_id strongObject = v7;
  }

  objc_storeWeak(&self->_weakObject, v6);
  [(SUScriptNativeObject *)self unlock];
  [(SUScriptNativeObject *)self setupNativeObject];
}

- (void)setScriptObject:(id)a3
{
  id v4 = a3;
  [(SUScriptNativeObject *)self lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scriptObject);

  objc_storeWeak((id *)&self->_scriptObject, v4);
  [(SUScriptNativeObject *)self unlock];
  if (!v4 && WeakRetained)
  {
    id v6 = [(SUScriptNativeObject *)self mainThreadProxy];
    [v6 destroyNativeObject];
  }
}

- (void)setStrongObject:(id)a3
{
  id v4 = a3;
  id v5 = [(SUScriptNativeObject *)self object];

  if (v5) {
    [(SUScriptNativeObject *)self destroyNativeObject];
  }
  [(SUScriptNativeObject *)self lock];
  id strongObject = self->_strongObject;
  self->_id strongObject = v4;

  if (v4) {
    objc_storeWeak(&self->_weakObject, 0);
  }
  [(SUScriptNativeObject *)self unlock];

  [(SUScriptNativeObject *)self setupNativeObject];
}

- (void)setWeakObject:(id)a3
{
  id v4 = a3;
  id v5 = [(SUScriptNativeObject *)self object];

  if (v5) {
    [(SUScriptNativeObject *)self destroyNativeObject];
  }
  [(SUScriptNativeObject *)self lock];
  objc_storeWeak(&self->_weakObject, v4);

  if (v4)
  {
    id strongObject = self->_strongObject;
    self->_id strongObject = 0;
  }
  [(SUScriptNativeObject *)self unlock];

  [(SUScriptNativeObject *)self setupNativeObject];
}

- (id)strongObject
{
  [(SUScriptNativeObject *)self lock];
  id v3 = self->_strongObject;
  [(SUScriptNativeObject *)self unlock];

  return v3;
}

- (id)weakObject
{
  [(SUScriptNativeObject *)self lock];
  id WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  [(SUScriptNativeObject *)self unlock];

  return WeakRetained;
}

- (void)destroyNativeObject
{
  [(SUScriptNativeObject *)self lock];
  objc_storeWeak(&self->_weakObject, 0);
  id strongObject = self->_strongObject;
  self->_id strongObject = 0;

  [(SUScriptNativeObject *)self unlock];
}

- (void)lock
{
  id v2 = [(SUScriptNativeObject *)self internalLock];
  [v2 lock];
}

+ (SUScriptNativeObject)objectWithNativeObject:(id)a3
{
  return (SUScriptNativeObject *)[a1 objectWithNativeObject:a3 weak:0];
}

+ (SUScriptNativeObject)objectWithNativeObject:(id)a3 weak:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)a1);
  id v8 = v7;
  if (v4) {
    [v7 setWeakObject:v6];
  }
  else {
    [v7 setStrongObject:v6];
  }

  return (SUScriptNativeObject *)v8;
}

- (void)unlock
{
  id v2 = [(SUScriptNativeObject *)self internalLock];
  [v2 unlock];
}

- (NSLock)internalLock
{
  return self->_internalLock;
}

- (void)setInternalLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLock, 0);
  objc_destroyWeak((id *)&self->_scriptObject);
  objc_destroyWeak(&self->_weakObject);

  objc_storeStrong(&self->_strongObject, 0);
}

@end