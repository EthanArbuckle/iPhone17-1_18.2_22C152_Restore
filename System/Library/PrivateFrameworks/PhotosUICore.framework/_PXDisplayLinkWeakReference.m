@interface _PXDisplayLinkWeakReference
- (SEL)selector;
- (_PXDisplayLinkWeakReference)initWithObject:(id)a3 selector:(SEL)a4;
- (id)object;
- (void)handleDisplayLink:(id)a3;
@end

@implementation _PXDisplayLinkWeakReference

- (void).cxx_destruct
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void)handleDisplayLink:(id)a3
{
  id v5 = a3;
  v4 = [(_PXDisplayLinkWeakReference *)self object];
  if (v4) {
    objc_msgSend(v4, "performSelector:withObject:", -[_PXDisplayLinkWeakReference selector](self, "selector"), v5);
  }
  else {
    [v5 invalidate];
  }
}

- (_PXDisplayLinkWeakReference)initWithObject:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v7 = [(_PXDisplayLinkWeakReference *)self init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_object, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_selector = v9;
  }

  return v8;
}

@end