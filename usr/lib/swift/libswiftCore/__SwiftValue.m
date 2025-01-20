@interface __SwiftValue
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (const)_swiftTypeMetadata;
- (const)_swiftValue;
- (id)_swiftTypeName;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation __SwiftValue

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_1E8EBFEB0 = (uint64_t)"__SwiftValue cannot be instantiated";
  __break(1u);
  return result;
}

- (void)dealloc
{
  uint64_t v3 = *((void *)self[1].super.isa - 1);
  uint64_t v4 = *(_DWORD *)(v3 + 80) & 0xF8;
  (*(void (**)(char *))(v3 + 8))((char *)self + ((v4 + 39) & ~(v4 | 7)));
  objc_destructInstance(self);

  swift_slowDealloc(self);
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    if (a3)
    {
      if (qword_1EB208E68 != -1) {
        dispatch_once_f(&qword_1EB208E68, &getSwiftValueClass(void)::$_0::operator() const(void)::TheLazy, (dispatch_function_t)getSwiftValueClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
      }
      if (objc_opt_isKindOfClass())
      {
        unint64_t HashableConformance = SwiftValueHeader::getHashableConformance((atomic_ullong *)&self[1]);
        if (HashableConformance)
        {
          uint64_t v6 = HashableConformance;
          unint64_t HashableBaseType = SwiftValueHeader::getHashableBaseType((atomic_ullong *)&self[1]);
          if (HashableBaseType)
          {
            uint64_t v8 = HashableBaseType;
            if (HashableBaseType == SwiftValueHeader::getHashableBaseType((atomic_ullong *)a3 + 1))
            {
              LOBYTE(EquatableConformance) = _swift_stdlib_Hashable_isEqual_indirect((uint64_t)self+ ((unsigned __int16)((*(_WORD *)(*((void *)self[1].super.isa - 1) + 80) & 0xF8)+ 39) & (unsigned __int16)~(*(_WORD *)(*((void *)self[1].super.isa - 1) + 80) & 0xF8) & 0x1F8), (uint64_t)a3+ ((unsigned __int16)((*(_WORD *)(*(void *)(*((void *)a3 + 1) - 8)+ 80) & 0xF8)+ 39) & (unsigned __int16)~(*(_WORD *)(*(void *)(*((void *)a3 + 1) - 8) + 80) & 0xF8) & 0x1F8), v8, v6);
              return EquatableConformance & 1;
            }
          }
        }
        unint64_t EquatableConformance = SwiftValueHeader::getEquatableConformance((atomic_ullong *)&self[1]);
        if (!EquatableConformance) {
          return EquatableConformance & 1;
        }
        uint64_t v10 = EquatableConformance;
        unint64_t EquatableConformance = SwiftValueHeader::getEquatableBaseType((atomic_ullong *)&self[1]);
        if (!EquatableConformance) {
          return EquatableConformance & 1;
        }
        uint64_t v11 = EquatableConformance;
        if (EquatableConformance == SwiftValueHeader::getEquatableBaseType((atomic_ullong *)a3 + 1))
        {
          LOBYTE(EquatableConformance) = _swift_stdlib_Equatable_isEqual_indirect((uint64_t)self+ ((unsigned __int16)((*(_WORD *)(*((void *)self[1].super.isa - 1) + 80) & 0xF8)+ 39) & (unsigned __int16)~(*(_WORD *)(*((void *)self[1].super.isa - 1)+ 80) & 0xF8) & 0x1F8), (uint64_t)a3+ ((unsigned __int16)((*(_WORD *)(*(void *)(*((void *)a3 + 1) - 8) + 80) & 0xF8)+ 39) & (unsigned __int16)~(*(_WORD *)(*(void *)(*((void *)a3 + 1) - 8)+ 80) & 0xF8) & 0x1F8), v11, v10);
          return EquatableConformance & 1;
        }
      }
    }
    LOBYTE(EquatableConformance) = 0;
    return EquatableConformance & 1;
  }
  return 1;
}

- (unint64_t)hash
{
  v2 = self;
  uint64_t v3 = (atomic_ullong *)&self[1];
  unint64_t HashableConformance = SwiftValueHeader::getHashableConformance((atomic_ullong *)&self[1]);
  if (HashableConformance)
  {
    uint64_t v5 = HashableConformance;
    uint64_t isa = (uint64_t)v2[1].super.isa;
    uint64_t v7 = (uint64_t)v2
       + ((unsigned __int16)((*(_WORD *)(*(void *)(isa - 8) + 80) & 0xF8) + 39) & (unsigned __int16)~(*(_WORD *)(*(void *)(isa - 8) + 80) & 0xF8) & 0x1F8);
    return _swift_stdlib_Hashable_hashValue_indirect(v7, isa, v5);
  }
  else
  {
    if (SwiftValueHeader::getEquatableConformance(v3))
    {
      v13 = (Class *)*v3;
      os_unfair_lock_lock((os_unfair_lock_t)&-[__SwiftValue hash]::warnedLock);
      if (qword_1E8ECFBB8 != -1) {
        dispatch_once_f(&qword_1E8ECFBB8, &-[__SwiftValue hash]::warned, (dispatch_function_t)swift::Lazy<std::unordered_set<swift::TargetMetadata<swift::InProcess> const*,std::hash<swift::TargetMetadata<swift::InProcess> const*>,std::equal_to<swift::TargetMetadata<swift::InProcess> const*>,std::allocator<swift::TargetMetadata<swift::InProcess> const*>>>::defaultInitCallback);
      }
      std::__hash_table<swift::TargetMetadata<swift::InProcess> const*,std::hash<swift::TargetMetadata<swift::InProcess> const*>,std::equal_to<swift::TargetMetadata<swift::InProcess> const*>,std::allocator<swift::TargetMetadata<swift::InProcess> const*>>::__emplace_unique_key_args<swift::TargetMetadata<swift::InProcess> const*,swift::TargetMetadata<swift::InProcess> const* const&>((uint64_t)&-[__SwiftValue hash]::warned, &v13, &v13);
      if (v9)
      {
        TypeName = swift_getTypeName(v13, 1);
          "e performance problems.\n",
          v11,
          v12,
          TypeName);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&-[__SwiftValue hash]::warnedLock);
      return 1;
    }
    return (unint64_t)v2;
  }
}

- (id)description
{
  uint64_t isa = (Class *)self[1].super.isa;
  int v4 = *((_DWORD *)*(isa - 1) + 20);
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v10);
  uint64_t v6 = (uint64_t)BufferIn;
  if (*(isa - 1)) {
    uint64_t v7 = (uint64_t)*(isa - 1);
  }
  else {
    uint64_t v7 = 0;
  }
  (*(void (**)(void *, char *, Class *))(v7 + 16))(BufferIn, (char *)self + ((unsigned __int16)((v4 & 0xF8) + 39) & (unsigned __int16)~(v4 & 0xF8) & 0x1F8), isa);
  id Description = swift::getDescription(v6, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v10);
  return Description;
}

- (id)debugDescription
{
  uint64_t isa = (Class *)self[1].super.isa;
  int v4 = *((_DWORD *)*(isa - 1) + 20);
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v10);
  uint64_t v6 = (uint64_t)BufferIn;
  if (*(isa - 1)) {
    uint64_t v7 = (uint64_t)*(isa - 1);
  }
  else {
    uint64_t v7 = 0;
  }
  (*(void (**)(void *, char *, Class *))(v7 + 16))(BufferIn, (char *)self + ((unsigned __int16)((v4 & 0xF8) + 39) & (unsigned __int16)~(v4 & 0xF8) & 0x1F8), isa);
  id Description = swift::getDescription(v6, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v10);
  return Description;
}

- (const)_swiftTypeMetadata
{
  return self[1].super.isa;
}

- (id)_swiftTypeName
{
  TypeName = (uint8x16_t *)swift_getTypeName((Class *)self[1].super.isa, 1);
  int v4 = (void *)swift_stdlib_NSStringFromUTF8(TypeName, v3);

  return v4;
}

- (const)_swiftValue
{
  return (const OpaqueValue *)((char *)self
                             + ((unsigned __int16)((*(_WORD *)(*((void *)self[1].super.isa - 1) + 80) & 0xF8) + 39) & (unsigned __int16)~(*(_WORD *)(*((void *)self[1].super.isa - 1) + 80) & 0xF8) & 0x1F8));
}

@end