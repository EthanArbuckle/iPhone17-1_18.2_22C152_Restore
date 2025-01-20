@interface SAExclaveFrame
- (BOOL)isExclave;
- (_BYTE)initWithExclave:(unsigned char *)a1;
- (id)exclave;
- (id)initCopyingFrame:(id)a3 withParent:(id)a4;
- (void)reset;
@end

@implementation SAExclaveFrame

- (_BYTE)initWithExclave:(unsigned char *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SAExclaveFrame;
    id v4 = objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 6, v3);
      a1[8] |= 4u;
    }
  }

  return a1;
}

- (BOOL)isExclave
{
  return 1;
}

- (id)exclave
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exclave);
  return WeakRetained;
}

- (id)initCopyingFrame:(id)a3 withParent:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SAExclaveFrame;
  v7 = [(SAFrame *)&v10 initCopyingFrame:v6 withParent:a4];
  if (v7)
  {
    v8 = [v6 exclave];
    objc_storeWeak(v7 + 6, v8);
  }
  return v7;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SAExclaveFrame;
  [(SAFrame *)&v3 reset];
  objc_storeWeak((id *)&self->_exclave, 0);
}

- (void).cxx_destruct
{
}

@end