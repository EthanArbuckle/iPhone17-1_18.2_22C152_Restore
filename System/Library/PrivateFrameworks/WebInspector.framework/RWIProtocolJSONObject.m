@interface RWIProtocolJSONObject
- (BOOL)BOOLForKey:(id)a3;
- (RWIProtocolJSONObject)init;
- (RWIProtocolJSONObject)initWithJSONObject:(void *)a3;
- (Ref<WTF::JSONImpl::Object,)toJSONObject;
- (RefPtr<WTF::JSONImpl::Array,)JSONArrayForKey:(id)a3;
- (double)doubleForKey:(id)a3;
- (id).cxx_construct;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int)integerForKey:(id)a3;
- (void)removeKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setInteger:(int)a3 forKey:(id)a4;
- (void)setJSONArray:(void *)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4;
@end

@implementation RWIProtocolJSONObject

- (RWIProtocolJSONObject)init
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolJSONObject;
  v2 = [(RWIProtocolJSONObject *)&v9 init];
  v3 = v2;
  if (v2)
  {
    WTF::JSONImpl::Object::create((uint64_t *)&v8, (WTF::JSONImpl::Object *)v2);
    uint64_t v4 = (uint64_t)v8;
    v8 = 0;
    m_ptr = v3->_object.m_ptr;
    v3->_object.m_ptr = (Object *)v4;
    if (m_ptr)
    {
      int v6 = *m_ptr - 1;
      if (*m_ptr == 1)
      {
        WTF::JSONImpl::Value::operator delete();
        m_ptr = v8;
        v8 = 0;
        if (!m_ptr) {
          return v3;
        }
        int v6 = *m_ptr - 1;
        if (*m_ptr == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          return v3;
        }
      }
      _DWORD *m_ptr = v6;
    }
  }
  return v3;
}

- (RWIProtocolJSONObject)initWithJSONObject:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolJSONObject;
  uint64_t v4 = [(RWIProtocolJSONObject *)&v9 init];
  v5 = v4;
  if (v4)
  {
    int v6 = *(Object **)a3;
    *(void *)a3 = 0;
    m_ptr = v4->_object.m_ptr;
    v5->_object.m_ptr = v6;
    if (m_ptr)
    {
      if (*(_DWORD *)m_ptr == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*(_DWORD *)m_ptr;
      }
    }
  }
  return v5;
}

- (Ref<WTF::JSONImpl::Object,)toJSONObject
{
  m_ptr = self->_object.m_ptr;
  ++*(_DWORD *)m_ptr;
  RWIProtocolJSONObject *v2 = m_ptr;
  return (Ref<WTF::JSONImpl::Object, WTF::RawPtrTraits<WTF::JSONImpl::Object>, WTF::DefaultRefDerefTraits<WTF::JSONImpl::Object>>)self;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v5 = a3;
  if (!a4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property with nil key"];
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v9, a4);
  WTF::JSONImpl::ObjectBase::setBoolean((WTF::JSONImpl::ObjectBase *)m_ptr, &v9, (WTF::JSONImpl::Value *)v5);
  v8 = v9;
  objc_super v9 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
}

- (void)setInteger:(int)a3 forKey:(id)a4
{
  BOOL v5 = *(WTF::JSONImpl::Value **)&a3;
  if (!a4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property with nil key"];
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v9, a4);
  WTF::JSONImpl::ObjectBase::setInteger((WTF::JSONImpl::ObjectBase *)m_ptr, &v9, v5);
  v8 = v9;
  objc_super v9 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  if (!a4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property with nil key"];
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v9, a4);
  WTF::JSONImpl::ObjectBase::setDouble((WTF::JSONImpl::ObjectBase *)m_ptr, &v9, a3);
  v8 = v9;
  objc_super v9 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
}

- (void)setString:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property with nil key"];
    if (a3) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property to nil value"];
LABEL_3:
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v11, a4);
  MEMORY[0x22A6705C0](&v10, a3);
  WTF::JSONImpl::ObjectBase::setString((WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v11, (const WTF::String *)&v10);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v8 -= 2;
    }
  }
  objc_super v9 = v11;
  v11 = 0;
  if (v9)
  {
    if (*v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v9 -= 2;
    }
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    if (a3)
    {
LABEL_3:
      m_ptr = self->_object.m_ptr;
      MEMORY[0x22A6705C0](&v17, a4);
      [a3 toJSONObject];
      uint64_t v8 = v15;
      goto LABEL_6;
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property with nil key"];
    if (a3) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property to nil value"];
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v17, a4);
  uint64_t v8 = 0;
LABEL_6:
  v16 = (_DWORD *)v8;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)m_ptr + 2, &v17, (uint64_t *)&v16, (uint64_t)v18);
  if (v18[16])
  {
    objc_super v9 = (uint64_t *)((char *)m_ptr + 24);
    uint64_t v10 = *((unsigned int *)m_ptr + 9);
    if (v10 == *((_DWORD *)m_ptr + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v9, (unint64_t)&v17);
    }
    else
    {
      uint64_t v11 = *v9;
      v12 = v17;
      if (v17) {
        *(_DWORD *)v17 += 2;
      }
      *(void *)(v11 + 8 * v10) = v12;
      *((_DWORD *)m_ptr + 9) = v10 + 1;
    }
  }
  v13 = v16;
  v16 = 0;
  if (v13)
  {
    if (*v13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v13;
    }
  }
  v14 = v17;
  v17 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
}

- (BOOL)BOOLForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v8, a3);
  unsigned __int16 Boolean = WTF::JSONImpl::ObjectBase::getBoolean((WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v8);
  BOOL v5 = v8;
  uint64_t v8 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  return (_BYTE)Boolean && Boolean > 0xFFu;
}

- (int)integerForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v7, a3);
  uint64_t Integer = WTF::JSONImpl::ObjectBase::getInteger((WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v7);
  BOOL v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  if ((Integer & 0xFF00000000) != 0) {
    return Integer;
  }
  else {
    return 0;
  }
}

- (double)doubleForKey:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v10, a3);
  uint64_t Double = WTF::JSONImpl::ObjectBase::getDouble((WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v10);
  char v6 = v5;
  double v7 = *(double *)&Double;
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8)
  {
    if (*v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v8 -= 2;
    }
  }
  double result = 0.0;
  if (v6) {
    return v7;
  }
  return result;
}

- (id)stringForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v8, a3);
  WTF::JSONImpl::ObjectBase::getString((uint64_t *)&v9, (WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v8);
  uint64_t v4 = v8;
  uint64_t v8 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  if (!v9) {
    return 0;
  }
  char v5 = (void *)WTF::StringImpl::operator NSString *();
  char v6 = v9;
  objc_super v9 = 0;
  if (v6)
  {
    if (*v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v6 -= 2;
    }
  }
  return v5;
}

- (id)objectForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v10, a3);
  WTF::JSONImpl::ObjectBase::getObject((uint64_t *)&v11, (WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v10);
  uint64_t v4 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  if (!v11) {
    return 0;
  }
  char v5 = [RWIProtocolJSONObject alloc];
  uint64_t v10 = (uint64_t)v11;
  uint64_t v11 = 0;
  char v6 = [(RWIProtocolJSONObject *)v5 initWithJSONObject:&v10];
  double v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v7;
    }
  }
  uint64_t v8 = v11;
  uint64_t v11 = 0;
  if (v8)
  {
    if (*v8 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v8;
    }
  }
  return v6;
}

- (void)removeKey:(id)a3
{
  if (a3)
  {
    m_ptr = self->_object.m_ptr;
    MEMORY[0x22A6705C0](&v5, a3);
    WTF::JSONImpl::ObjectBase::remove((WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v5);
    uint64_t v4 = v5;
    char v5 = 0;
    if (v4)
    {
      if (*v4 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v4 -= 2;
      }
    }
  }
}

- (void)setJSONArray:(void *)a3 forKey:(id)a4
{
  if (!a4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"cannot set property with nil key"];
  }
  m_ptr = self->_object.m_ptr;
  MEMORY[0x22A6705C0](&v16, a4);
  uint64_t v8 = *(void *)a3;
  *(void *)a3 = 0;
  uint64_t v15 = (_DWORD *)v8;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)m_ptr + 2, &v16, (uint64_t *)&v15, (uint64_t)v17);
  if (v17[16])
  {
    objc_super v9 = (uint64_t *)((char *)m_ptr + 24);
    uint64_t v10 = *((unsigned int *)m_ptr + 9);
    if (v10 == *((_DWORD *)m_ptr + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v9, (unint64_t)&v16);
    }
    else
    {
      uint64_t v11 = *v9;
      v12 = v16;
      if (v16) {
        *(_DWORD *)v16 += 2;
      }
      *(void *)(v11 + 8 * v10) = v12;
      *((_DWORD *)m_ptr + 9) = v10 + 1;
    }
  }
  v13 = v15;
  uint64_t v15 = 0;
  if (v13)
  {
    if (*v13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v13;
    }
  }
  v14 = v16;
  v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
}

- (RefPtr<WTF::JSONImpl::Array,)JSONArrayForKey:(id)a3
{
  if (a3)
  {
    m_ptr = self->_object.m_ptr;
    MEMORY[0x22A6705C0](&v5, a3);
    WTF::JSONImpl::ObjectBase::getArray((WTF::JSONImpl::ObjectBase *)m_ptr, (const WTF::String *)&v5);
    self = v5;
    char v5 = 0;
    if (self)
    {
      if (LODWORD(self->super.isa) == 2) {
        return (RefPtr<WTF::JSONImpl::Array, WTF::RawPtrTraits<WTF::JSONImpl::Array>, WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>)WTF::StringImpl::destroy();
      }
      else {
        LODWORD(self->super.isa) -= 2;
      }
    }
  }
  else
  {
    void *v3 = 0;
  }
  return (RefPtr<WTF::JSONImpl::Array, WTF::RawPtrTraits<WTF::JSONImpl::Array>, WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>)self;
}

- (void).cxx_destruct
{
  m_ptr = self->_object.m_ptr;
  self->_object.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)setJSONArray:(uint64_t)a1 forKey:(uint64_t *)a2 .cold.1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  if (v2)
  {
    OUTLINED_FUNCTION_0_4();
    if (v5) {
      WTF::StringImpl::destroy();
    }
    else {
      _DWORD *v3 = v4;
    }
  }
}

@end