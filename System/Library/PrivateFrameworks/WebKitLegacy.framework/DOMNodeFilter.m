@interface DOMNodeFilter
- (signed)acceptNode:(id)a3;
- (void)dealloc;
@end

@implementation DOMNodeFilter

- (void)dealloc
{
  internal = self->super._internal;
  if (internal)
  {
    if (*((_DWORD *)internal + 4) == 1) {
      (*(void (**)(DOMObjectInternal *, SEL))(*(void *)internal + 16))(internal, a2);
    }
    else {
      --*((_DWORD *)internal + 4);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)DOMNodeFilter;
  [(DOMObject *)&v4 dealloc];
}

- (signed)acceptNode:(id)a3
{
  if (!a3) {
    raiseTypeErrorException();
  }
  if (self) {
    self = (DOMNodeFilter *)self->super._internal;
  }
  (*((void (**)(uint64_t *__return_ptr))self->super.super.super.isa + 5))(&v6);
  if (!HIDWORD(v6)) {
    return v6;
  }
  if (HIDWORD(v6) == 1 && v6) {
    return 2;
  }
  objc_super v4 = (DOMAbstractView *)std::__throw_bad_variant_access[abi:sn180100]();
  [(DOMAbstractView *)v4 dealloc];
  return result;
}

@end