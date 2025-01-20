@interface RWIProtocolPageDomainEventDispatcher
- (RWIProtocolPageDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3;
- (void)defaultUserPreferencesDidChangeWithPreferences:(id)a3;
- (void)domContentEventFiredWithTimestamp:(double)a3;
- (void)frameClearedScheduledNavigationWithFrameId:(id)a3;
- (void)frameDetachedWithFrameId:(id)a3;
- (void)frameNavigatedWithFrame:(id)a3;
- (void)frameScheduledNavigationWithFrameId:(id)a3 delay:(double)a4;
- (void)frameStartedLoadingWithFrameId:(id)a3;
- (void)frameStoppedLoadingWithFrameId:(id)a3;
- (void)loadEventFiredWithTimestamp:(double)a3;
@end

@implementation RWIProtocolPageDomainEventDispatcher

- (RWIProtocolPageDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolPageDomainEventDispatcher;
  result = [(RWIProtocolPageDomainEventDispatcher *)&v5 init];
  if (result) {
    result->_controller = a3;
  }
  return result;
}

- (void)domContentEventFiredWithTimestamp:(double)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v24, v4);
  objc_super v5 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::JSONImpl::Object *)v25[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v23, (const WTF::String *)&v22);
  v6 = v22;
  v22 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  v7 = v23;
  v23 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v23, v7);
  v8 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setDouble(v8, &v22, a3);
  v9 = v22;
  v22 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  v10 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = (uint64_t)v23;
  v22 = (WTF::StringImpl *)v25[0];
  v23 = 0;
  v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v10 + 2, &v22, (uint64_t *)&v21, (uint64_t)v25);
  if (v26)
  {
    v12 = (uint64_t *)((char *)v10 + 24);
    uint64_t v13 = *((unsigned int *)v10 + 9);
    if (v13 == *((_DWORD *)v10 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *((_DWORD *)v10 + 9) = v13 + 1;
    }
  }
  v16 = v21;
  v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  v17 = v22;
  v22 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v25, v24);
  Inspector::FrontendRouter::sendEvent(v4, (const WTF::String *)v25);
  v18 = (_DWORD *)v25[0];
  v25[0] = 0;
  if (v18)
  {
    if (*v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v18 -= 2;
    }
  }
  v19 = v23;
  v23 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v19;
    }
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v20;
    }
  }
}

- (void)loadEventFiredWithTimestamp:(double)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v24, v4);
  objc_super v5 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::JSONImpl::Object *)v25[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v23, (const WTF::String *)&v22);
  v6 = v22;
  v22 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  v7 = v23;
  v23 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v23, v7);
  v8 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setDouble(v8, &v22, a3);
  v9 = v22;
  v22 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  v10 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = (uint64_t)v23;
  v22 = (WTF::StringImpl *)v25[0];
  v23 = 0;
  v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v10 + 2, &v22, (uint64_t *)&v21, (uint64_t)v25);
  if (v26)
  {
    v12 = (uint64_t *)((char *)v10 + 24);
    uint64_t v13 = *((unsigned int *)v10 + 9);
    if (v13 == *((_DWORD *)v10 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *((_DWORD *)v10 + 9) = v13 + 1;
    }
  }
  v16 = v21;
  v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  v17 = v22;
  v22 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v25, v24);
  Inspector::FrontendRouter::sendEvent(v4, (const WTF::String *)v25);
  v18 = (_DWORD *)v25[0];
  v25[0] = 0;
  if (v18)
  {
    if (*v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v18 -= 2;
    }
  }
  v19 = v23;
  v23 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v19;
    }
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v20;
    }
  }
}

- (void)frameNavigatedWithFrame:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frame" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v32, v4);
  v6 = v32;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v31 = (WTF::JSONImpl::Object *)v33[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = (WTF::StringImpl *)v33[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v31, (const WTF::String *)&v30);
  v7 = v30;
  v30 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v31;
  v31 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v31, v8);
  uint64_t v9 = (uint64_t)v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = (WTF::StringImpl *)v33[0];
  if (a3)
  {
    [a3 toJSONObject];
    uint64_t v10 = v28;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v29 = (_DWORD *)v10;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v9 + 16), &v30, (uint64_t *)&v29, (uint64_t)v33);
  if (v34)
  {
    uint64_t v11 = (uint64_t *)(v9 + 24);
    uint64_t v12 = *(unsigned int *)(v9 + 36);
    if (v12 == *(_DWORD *)(v9 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v11, (unint64_t)&v30);
    }
    else
    {
      uint64_t v13 = *v11;
      uint64_t v14 = v30;
      if (v30) {
        *(_DWORD *)v30 += 2;
      }
      *(void *)(v13 + 8 * v12) = v14;
      *(_DWORD *)(v9 + 36) = v12 + 1;
    }
  }
  v15 = v29;
  v29 = 0;
  if (v15)
  {
    if (*v15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v15;
    }
  }
  v16 = v30;
  v30 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  v17 = v32;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v18 = (uint64_t)v31;
  v30 = (WTF::StringImpl *)v33[0];
  v31 = 0;
  v29 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v30, (uint64_t *)&v29, (uint64_t)v33);
  if (v34)
  {
    v19 = (uint64_t *)((char *)v17 + 24);
    uint64_t v20 = *((unsigned int *)v17 + 9);
    if (v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v30);
    }
    else
    {
      uint64_t v21 = *v19;
      v22 = v30;
      if (v30) {
        *(_DWORD *)v30 += 2;
      }
      *(void *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  v23 = v29;
  v29 = 0;
  if (v23)
  {
    if (*v23 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v23;
    }
  }
  v24 = v30;
  v30 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v24 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v33, v32);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v33);
  v25 = (_DWORD *)v33[0];
  v33[0] = 0;
  if (v25)
  {
    if (*v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v25 -= 2;
    }
  }
  char v26 = v31;
  v31 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v26;
    }
  }
  v27 = v32;
  v32 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v27;
    }
  }
}

- (void)frameDetachedWithFrameId:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v26, v4);
  v6 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::JSONImpl::Object *)v27[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v25, (const WTF::String *)&v24);
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v25;
  v25 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v25, v8);
  uint64_t v9 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  MEMORY[0x22A6705C0](v27, a3);
  WTF::JSONImpl::ObjectBase::setString(v9, (const WTF::String *)&v24, (const WTF::String *)v27);
  uint64_t v10 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v10)
  {
    if (*v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v10 -= 2;
    }
  }
  uint64_t v11 = v24;
  v24 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v13 = (uint64_t)v25;
  v24 = (WTF::StringImpl *)v27[0];
  v25 = 0;
  v23 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v24, (uint64_t *)&v23, (uint64_t)v27);
  if (v28)
  {
    uint64_t v14 = (uint64_t *)((char *)v12 + 24);
    uint64_t v15 = *((unsigned int *)v12 + 9);
    if (v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v24);
    }
    else
    {
      uint64_t v16 = *v14;
      v17 = v24;
      if (v24) {
        *(_DWORD *)v24 += 2;
      }
      *(void *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  uint64_t v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*v18 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v18;
    }
  }
  v19 = v24;
  v24 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v27, v26);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v27);
  uint64_t v20 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v20)
  {
    if (*v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v20 -= 2;
    }
  }
  uint64_t v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v21;
    }
  }
  v22 = v26;
  char v26 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v22;
    }
  }
}

- (void)frameStartedLoadingWithFrameId:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v26, v4);
  v6 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::JSONImpl::Object *)v27[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v25, (const WTF::String *)&v24);
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v25;
  v25 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v25, v8);
  uint64_t v9 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  MEMORY[0x22A6705C0](v27, a3);
  WTF::JSONImpl::ObjectBase::setString(v9, (const WTF::String *)&v24, (const WTF::String *)v27);
  uint64_t v10 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v10)
  {
    if (*v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v10 -= 2;
    }
  }
  uint64_t v11 = v24;
  v24 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v13 = (uint64_t)v25;
  v24 = (WTF::StringImpl *)v27[0];
  v25 = 0;
  v23 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v24, (uint64_t *)&v23, (uint64_t)v27);
  if (v28)
  {
    uint64_t v14 = (uint64_t *)((char *)v12 + 24);
    uint64_t v15 = *((unsigned int *)v12 + 9);
    if (v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v24);
    }
    else
    {
      uint64_t v16 = *v14;
      v17 = v24;
      if (v24) {
        *(_DWORD *)v24 += 2;
      }
      *(void *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  uint64_t v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*v18 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v18;
    }
  }
  v19 = v24;
  v24 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v27, v26);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v27);
  uint64_t v20 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v20)
  {
    if (*v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v20 -= 2;
    }
  }
  uint64_t v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v21;
    }
  }
  v22 = v26;
  char v26 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v22;
    }
  }
}

- (void)frameStoppedLoadingWithFrameId:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v26, v4);
  v6 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::JSONImpl::Object *)v27[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v25, (const WTF::String *)&v24);
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v25;
  v25 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v25, v8);
  uint64_t v9 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  MEMORY[0x22A6705C0](v27, a3);
  WTF::JSONImpl::ObjectBase::setString(v9, (const WTF::String *)&v24, (const WTF::String *)v27);
  uint64_t v10 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v10)
  {
    if (*v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v10 -= 2;
    }
  }
  uint64_t v11 = v24;
  v24 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v13 = (uint64_t)v25;
  v24 = (WTF::StringImpl *)v27[0];
  v25 = 0;
  v23 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v24, (uint64_t *)&v23, (uint64_t)v27);
  if (v28)
  {
    uint64_t v14 = (uint64_t *)((char *)v12 + 24);
    uint64_t v15 = *((unsigned int *)v12 + 9);
    if (v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v24);
    }
    else
    {
      uint64_t v16 = *v14;
      v17 = v24;
      if (v24) {
        *(_DWORD *)v24 += 2;
      }
      *(void *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  uint64_t v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*v18 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v18;
    }
  }
  v19 = v24;
  v24 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v27, v26);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v27);
  uint64_t v20 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v20)
  {
    if (*v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v20 -= 2;
    }
  }
  uint64_t v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v21;
    }
  }
  v22 = v26;
  char v26 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v22;
    }
  }
}

- (void)frameScheduledNavigationWithFrameId:(id)a3 delay:(double)a4
{
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (!a3) {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v30, v6);
  v8 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::JSONImpl::Object *)v31[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v29, (const WTF::String *)&v28);
  uint64_t v9 = v28;
  char v28 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  uint64_t v10 = v29;
  v29 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      uint64_t v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v29, v10);
  uint64_t v11 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v28 = (WTF::StringImpl *)v31[0];
  MEMORY[0x22A6705C0](v31, a3);
  WTF::JSONImpl::ObjectBase::setString(v11, (const WTF::String *)&v28, (const WTF::String *)v31);
  uint64_t v12 = (_DWORD *)v31[0];
  v31[0] = 0;
  if (v12)
  {
    if (*v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v12 -= 2;
    }
  }
  uint64_t v13 = v28;
  char v28 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setDouble(v14, &v28, a4);
  uint64_t v15 = v28;
  char v28 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  uint64_t v16 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v17 = (uint64_t)v29;
  char v28 = (WTF::StringImpl *)v31[0];
  v29 = 0;
  v27 = (_DWORD *)v17;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v16 + 2, &v28, (uint64_t *)&v27, (uint64_t)v31);
  if (v32)
  {
    uint64_t v18 = (uint64_t *)((char *)v16 + 24);
    uint64_t v19 = *((unsigned int *)v16 + 9);
    if (v19 == *((_DWORD *)v16 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v18, (unint64_t)&v28);
    }
    else
    {
      uint64_t v20 = *v18;
      uint64_t v21 = v28;
      if (v28) {
        *(_DWORD *)v28 += 2;
      }
      *(void *)(v20 + 8 * v19) = v21;
      *((_DWORD *)v16 + 9) = v19 + 1;
    }
  }
  v22 = v27;
  v27 = 0;
  if (v22)
  {
    if (*v22 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v22;
    }
  }
  v23 = v28;
  char v28 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v31, v30);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v31);
  v24 = (_DWORD *)v31[0];
  v31[0] = 0;
  if (v24)
  {
    if (*v24 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v24 -= 2;
    }
  }
  v25 = v29;
  v29 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v25;
    }
  }
  char v26 = v30;
  v30 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v26;
    }
  }
}

- (void)frameClearedScheduledNavigationWithFrameId:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v26, v4);
  v6 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::JSONImpl::Object *)v27[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v25, (const WTF::String *)&v24);
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v25;
  v25 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v25, v8);
  uint64_t v9 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v27[0];
  MEMORY[0x22A6705C0](v27, a3);
  WTF::JSONImpl::ObjectBase::setString(v9, (const WTF::String *)&v24, (const WTF::String *)v27);
  uint64_t v10 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v10)
  {
    if (*v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v10 -= 2;
    }
  }
  uint64_t v11 = v24;
  v24 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v13 = (uint64_t)v25;
  v24 = (WTF::StringImpl *)v27[0];
  v25 = 0;
  v23 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v24, (uint64_t *)&v23, (uint64_t)v27);
  if (v28)
  {
    uint64_t v14 = (uint64_t *)((char *)v12 + 24);
    uint64_t v15 = *((unsigned int *)v12 + 9);
    if (v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v24);
    }
    else
    {
      uint64_t v16 = *v14;
      uint64_t v17 = v24;
      if (v24) {
        *(_DWORD *)v24 += 2;
      }
      *(void *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  uint64_t v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*v18 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v18;
    }
  }
  uint64_t v19 = v24;
  v24 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v27, v26);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v27);
  uint64_t v20 = (_DWORD *)v27[0];
  v27[0] = 0;
  if (v20)
  {
    if (*v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v20 -= 2;
    }
  }
  uint64_t v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v21;
    }
  }
  v22 = v26;
  char v26 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v22;
    }
  }
}

- (void)defaultUserPreferencesDidChangeWithPreferences:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v35 = (Inspector::FrontendRouter *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                      + 4))(self->_controller, a2);
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"preferences" format];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v4 = (WTF::JSONImpl::Object *)[a3 countByEnumeratingWithState:&v41 objects:v47 count:16];
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)v42;
    uint64_t v7 = *MEMORY[0x263EFF4A0];
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v10 = (void *)MEMORY[0x263EFF940];
          uint64_t v11 = (objc_class *)objc_opt_class();
          [v10 raise:v7, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v11), v9, v35 format];
        }
        v8 = (WTF::JSONImpl::Object *)((char *)v8 + 1);
      }
      while (v5 != v8);
      v4 = (WTF::JSONImpl::Object *)[a3 countByEnumeratingWithState:&v41 objects:v47 count:16];
      objc_super v5 = v4;
    }
    while (v4);
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v40, v4);
  uint64_t v12 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::JSONImpl::Object *)v45[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v45[0];
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v39, (const WTF::String *)&v38);
  uint64_t v13 = v38;
  v38 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v39;
  v39 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      uint64_t v14 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v39, v14);
  uint64_t v15 = (uint64_t)v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v45[0];
  Inspector::toJSONObjectArray((Inspector *)a3, (uint64_t *)&v36);
  uint64_t v16 = (uint64_t)v36;
  v36 = 0;
  v37 = (_DWORD *)v16;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v15 + 16), &v38, (uint64_t *)&v37, (uint64_t)v45);
  if (v46)
  {
    uint64_t v17 = (uint64_t *)(v15 + 24);
    uint64_t v18 = *(unsigned int *)(v15 + 36);
    if (v18 == *(_DWORD *)(v15 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v17, (unint64_t)&v38);
    }
    else
    {
      uint64_t v19 = *v17;
      uint64_t v20 = v38;
      if (v38) {
        *(_DWORD *)v38 += 2;
      }
      *(void *)(v19 + 8 * v18) = v20;
      *(_DWORD *)(v15 + 36) = v18 + 1;
    }
  }
  uint64_t v21 = v37;
  v37 = 0;
  if (v21)
  {
    if (*v21 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v21;
    }
  }
  v22 = v36;
  v36 = 0;
  if (v22)
  {
    if (*v22 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v22;
    }
  }
  v23 = v38;
  v38 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  v24 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v25 = (uint64_t)v39;
  v38 = (WTF::StringImpl *)v45[0];
  v39 = 0;
  v37 = (_DWORD *)v25;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v24 + 2, &v38, (uint64_t *)&v37, (uint64_t)v45);
  if (v46)
  {
    char v26 = (uint64_t *)((char *)v24 + 24);
    uint64_t v27 = *((unsigned int *)v24 + 9);
    if (v27 == *((_DWORD *)v24 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v26, (unint64_t)&v38);
    }
    else
    {
      uint64_t v28 = *v26;
      v29 = v38;
      if (v38) {
        *(_DWORD *)v38 += 2;
      }
      *(void *)(v28 + 8 * v27) = v29;
      *((_DWORD *)v24 + 9) = v27 + 1;
    }
  }
  v30 = v37;
  v37 = 0;
  if (v30)
  {
    if (*v30 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v30;
    }
  }
  v31 = v38;
  v38 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v31 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v45, v40);
  Inspector::FrontendRouter::sendEvent(v35, (const WTF::String *)v45);
  char v32 = (_DWORD *)v45[0];
  v45[0] = 0;
  if (v32)
  {
    if (*v32 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v32 -= 2;
    }
  }
  v33 = v39;
  v39 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v33;
    }
  }
  char v34 = v40;
  v40 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v34;
    }
  }
}

@end