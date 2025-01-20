@interface __SwiftNativeNSError
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)description;
- (id)domain;
- (id)userInfo;
- (int64_t)code;
- (void)dealloc;
@end

@implementation __SwiftNativeNSError

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_1E8EBFEB0 = (uint64_t)"__SwiftNativeNSError cannot be instantiated";
  __break(1u);
  return result;
}

- (void)dealloc
{
  Class Class = swift::_swift_getClass((unint64_t)self, a2);
  if (qword_1EB208DD8 != -1) {
    dispatch_once_f(&qword_1EB208DD8, &getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  }
  if (Class == (Class)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy)
  {
    Class isa = self[1].super.super.isa;
    unint64_t ObjCClassMetadata = (unint64_t)isa;
  }
  else
  {
    unint64_t v4 = objc_opt_class();
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v4);
    Class isa = self[1].super.super.isa;
  }
  uint64_t v7 = *(unsigned __int8 *)(*((void *)isa - 1) + 80);
  if (*(void *)(ObjCClassMetadata - 8)) {
    uint64_t v8 = *(void *)(ObjCClassMetadata - 8);
  }
  else {
    uint64_t v8 = 0;
  }
  (*(void (**)(unint64_t))(v8 + 8))(((unint64_t)&self[1].super._userInfo + v7) & ~v7);
  v9.receiver = self;
  v9.super_class = (Class)__SwiftNativeNSError;
  [(__SwiftNativeNSError *)&v9 dealloc];
}

- (id)domain
{
  return self->super._domain;
}

- (id)description
{
  Class isa = (Class *)self[1].super.super.isa;
  uint64_t v4 = *((unsigned __int8 *)*(isa - 1) + 80);
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v10);
  uint64_t v6 = (uint64_t)BufferIn;
  if (*((void *)self[1].super.super.isa - 1)) {
    uint64_t v7 = *((void *)self[1].super.super.isa - 1);
  }
  else {
    uint64_t v7 = 0;
  }
  (*(void (**)(void *, unint64_t))(v7 + 16))(BufferIn, ((unint64_t)&self[1].super._userInfo + v4) & ~v4);
  id Description = swift::getDescription(v6, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v10);
  return Description;
}

- (int64_t)code
{
  return self->super._code;
}

- (id)userInfo
{
  return self->super._userInfo;
}

- (Class)classForCoder
{
  if (qword_1EB208DC8 != -1) {
    dispatch_once_f(&qword_1EB208DC8, &swift::getNSErrorClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)swift::getNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  }
  return (Class)swift::getNSErrorClass(void)::$_0::operator() const(void)::TheLazy;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v19 = v3;
  uint64_t v20 = v4;
  if (a3)
  {
    Class Class = swift::_swift_getClass((unint64_t)a3, a2);
    if (qword_1EB208DD8 != -1) {
      dispatch_once_f(&qword_1EB208DD8, &getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
    }
    if (Class == (Class)getSwiftNativeNSErrorClass(void)::$_0::operator() const(void)::TheLazy)
    {
      unint64_t HashableBaseType = swift::SwiftError::getHashableBaseType((atomic_ullong *)self, v7);
      if (HashableBaseType
        && (uint64_t v13 = HashableBaseType, swift::SwiftError::getHashableBaseType((atomic_ullong *)a3, v12) == HashableBaseType))
      {
        uint64_t HashableConformance = swift::SwiftError::getHashableConformance((atomic_ullong *)self, v14);
        if (HashableConformance) {
          unsigned __int8 isEqual_indirect = _swift_stdlib_Hashable_isEqual_indirect(((unint64_t)&self[1].super._userInfo+ *(unsigned __int8 *)(*((void *)self[1].super.super.isa - 1) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*((void *)self[1].super.super.isa - 1) + 80), ((unint64_t)a3+ *(unsigned __int8 *)(*(void *)(*((void *)a3 + 5) - 8) + 80)+ 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*((void *)a3 + 5) - 8)+ 80), v13, HashableConformance);
        }
        else {
          unsigned __int8 isEqual_indirect = -[__SwiftNativeNSError isEqual:](&v16, sel_isEqual_, a3, self, __SwiftNativeNSError, v17.receiver, v17.super_class, v18.receiver, v18.super_class);
        }
      }
      else
      {
        unsigned __int8 isEqual_indirect = -[__SwiftNativeNSError isEqual:](&v17, sel_isEqual_, a3, v16.receiver, v16.super_class, self, __SwiftNativeNSError, v18.receiver, v18.super_class);
      }
    }
    else
    {
      unsigned __int8 isEqual_indirect = -[__SwiftNativeNSError isEqual:](&v18, sel_isEqual_, a3, v16.receiver, v16.super_class, v17.receiver, v17.super_class, self, __SwiftNativeNSError);
    }
  }
  else
  {
    unsigned __int8 isEqual_indirect = 0;
  }
  return isEqual_indirect & 1;
}

@end