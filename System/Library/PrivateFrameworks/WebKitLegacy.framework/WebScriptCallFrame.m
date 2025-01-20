@interface WebScriptCallFrame
- (id)_convertValueToObjcValue:(JSValue)a3;
- (id)_initWithGlobalObject:(id)a3 functionName:(String)a4 exceptionValue:(JSValue)a5;
- (id)exception;
- (id)functionName;
- (id)userInfo;
- (void)dealloc;
- (void)setUserInfo:(id)a3;
@end

@implementation WebScriptCallFrame

- (id)_initWithGlobalObject:(id)a3 functionName:(String)a4 exceptionValue:(JSValue)a5
{
  v15.receiver = self;
  v15.super_class = (Class)WebScriptCallFrame;
  v8 = [(WebScriptCallFrame *)&v15 init];
  if (v8)
  {
    v9 = objc_alloc_init(WebScriptCallFramePrivate);
    v8->_private = v9;
    v9->globalObject = (WebScriptObject *)a3;
    v11 = v8->_private;
    v12 = *(StringImpl **)a4.m_impl.m_ptr;
    if (*(void *)a4.m_impl.m_ptr) {
      *(_DWORD *)v12 += 2;
    }
    m_ptr = (WTF::StringImpl *)v11->functionName.m_impl.m_ptr;
    v11->functionName.m_impl.m_ptr = v12;
    if (m_ptr)
    {
      if (*(_DWORD *)m_ptr == 2) {
        WTF::StringImpl::destroy(m_ptr, v10);
      }
      else {
        *(_DWORD *)m_ptr -= 2;
      }
    }
    v8->_private->exceptionValue = a5;
  }
  return v8;
}

- (id)_convertValueToObjcValue:(JSValue)a3
{
  if (!a3.super.isa) {
    return 0;
  }
  globalObject = self->_private->globalObject;
  if ((Class)[(WebScriptObject *)globalObject _imp] == a3.super.isa) {
    return globalObject;
  }
  uint64_t v5 = [(WebScriptObject *)globalObject _originRootObject];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(WebScriptObject *)globalObject _rootObject];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  v9 = (void *)MEMORY[0x1E4FB61E8];
  return (id)[v9 _convertValueToObjcValue:a3.super.isa originRootObject:v6 rootObject:v8];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebScriptCallFrame;
  [(WebScriptCallFrame *)&v3 dealloc];
}

- (void)setUserInfo:(id)a3
{
  id userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_id userInfo = a3;
  }
}

- (id)userInfo
{
  return self->_userInfo;
}

- (id)functionName
{
  m_ptr = self->_private->functionName.m_impl.m_ptr;
  if (!m_ptr || !*((_DWORD *)m_ptr + 1)) {
    return 0;
  }
  *(_DWORD *)m_ptr += 2;
  id result = (id)WTF::StringImpl::operator NSString *();
  id v5 = result;
  if (*(_DWORD *)m_ptr == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v4);
    return v5;
  }
  else
  {
    *(_DWORD *)m_ptr -= 2;
  }
  return result;
}

- (id)exception
{
  if (self->_private->exceptionValue.super.isa) {
    return -[WebScriptCallFrame _convertValueToObjcValue:](self, "_convertValueToObjcValue:");
  }
  else {
    return 0;
  }
}

@end