@interface SAExclaveBinaryLoadInfo
- (id)exclave;
- (id)initWithBinary:(uint64_t)a3 segment:(uint64_t)a4 loadAddress:(void *)a5 exclave:;
@end

@implementation SAExclaveBinaryLoadInfo

- (id)initWithBinary:(uint64_t)a3 segment:(uint64_t)a4 loadAddress:(void *)a5 exclave:
{
  id v9 = a5;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)SAExclaveBinaryLoadInfo;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_initWithBinary_segment_loadAddress_, a2, a3, a4);
    v11 = v10;
    if (v10) {
      objc_storeWeak(v10 + 4, v9);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)exclave
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exclave);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end