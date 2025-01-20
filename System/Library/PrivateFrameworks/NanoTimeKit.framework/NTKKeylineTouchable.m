@interface NTKKeylineTouchable
+ (NTKKeylineTouchable)touchableWithHandler:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 keyline:(id)a4 withEvent:(id)a5;
@end

@implementation NTKKeylineTouchable

+ (NTKKeylineTouchable)touchableWithHandler:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = _Block_copy(v3);

  v6 = (void *)v4[1];
  v4[1] = v5;

  return (NTKKeylineTouchable *)v4;
}

- (BOOL)pointInside:(CGPoint)a3 keyline:(id)a4 withEvent:(id)a5
{
  handler = (uint64_t (**)(id, id, id, __n128, __n128))self->_handler;
  if (handler) {
    LOBYTE(handler) = handler[2](handler, a4, a5, (__n128)a3, *(__n128 *)&a3.y);
  }
  return (char)handler;
}

- (void).cxx_destruct
{
}

@end