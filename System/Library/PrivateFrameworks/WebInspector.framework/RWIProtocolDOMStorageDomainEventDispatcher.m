@interface RWIProtocolDOMStorageDomainEventDispatcher
- (RWIProtocolDOMStorageDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3;
- (void)domStorageItemAddedWithStorageId:(id)a3 key:(id)a4 newValue:(id)a5;
- (void)domStorageItemRemovedWithStorageId:(id)a3 key:(id)a4;
- (void)domStorageItemUpdatedWithStorageId:(id)a3 key:(id)a4 oldValue:(id)a5 newValue:(id)a6;
- (void)domStorageItemsClearedWithStorageId:(id)a3;
@end

@implementation RWIProtocolDOMStorageDomainEventDispatcher

- (RWIProtocolDOMStorageDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMStorageDomainEventDispatcher;
  result = [(RWIProtocolDOMStorageDomainEventDispatcher *)&v5 init];
  if (result) {
    result->_controller = a3;
  }
  return result;
}

- (void)domStorageItemsClearedWithStorageId:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"storageId" format];
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
    v11 = (uint64_t *)(v9 + 24);
    uint64_t v12 = *(unsigned int *)(v9 + 36);
    if (v12 == *(_DWORD *)(v9 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v11, (unint64_t)&v30);
    }
    else
    {
      uint64_t v13 = *v11;
      v14 = v30;
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
  v26 = v31;
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

- (void)domStorageItemRemovedWithStorageId:(id)a3 key:(id)a4
{
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"storageId" format];
    if (a4) {
      goto LABEL_3;
    }
  }
  v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"key" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v37, v6);
  v8 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v36 = (WTF::JSONImpl::Object *)v38[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v36, (const WTF::String *)&v35);
  uint64_t v9 = v35;
  v35 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  uint64_t v10 = v36;
  v36 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      uint64_t v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v36, v10);
  uint64_t v11 = (uint64_t)v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  if (a3)
  {
    [a3 toJSONObject];
    uint64_t v12 = v33;
  }
  else
  {
    uint64_t v12 = 0;
  }
  char v34 = (_DWORD *)v12;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v11 + 16), &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    uint64_t v13 = (uint64_t *)(v11 + 24);
    uint64_t v14 = *(unsigned int *)(v11 + 36);
    if (v14 == *(_DWORD *)(v11 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v13, (unint64_t)&v35);
    }
    else
    {
      uint64_t v15 = *v13;
      v16 = v35;
      if (v35) {
        *(_DWORD *)v35 += 2;
      }
      *(void *)(v15 + 8 * v14) = v16;
      *(_DWORD *)(v11 + 36) = v14 + 1;
    }
  }
  v17 = v34;
  char v34 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  uint64_t v18 = v35;
  v35 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  v19 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  MEMORY[0x22A6705C0](v38, a4);
  WTF::JSONImpl::ObjectBase::setString(v19, (const WTF::String *)&v35, (const WTF::String *)v38);
  uint64_t v20 = (_DWORD *)v38[0];
  v38[0] = 0;
  if (v20)
  {
    if (*v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v20 -= 2;
    }
  }
  uint64_t v21 = v35;
  v35 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  v22 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v23 = (uint64_t)v36;
  v35 = (WTF::StringImpl *)v38[0];
  v36 = 0;
  char v34 = (_DWORD *)v23;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v22 + 2, &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    v24 = (uint64_t *)((char *)v22 + 24);
    uint64_t v25 = *((unsigned int *)v22 + 9);
    if (v25 == *((_DWORD *)v22 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v24, (unint64_t)&v35);
    }
    else
    {
      uint64_t v26 = *v24;
      v27 = v35;
      if (v35) {
        *(_DWORD *)v35 += 2;
      }
      *(void *)(v26 + 8 * v25) = v27;
      *((_DWORD *)v22 + 9) = v25 + 1;
    }
  }
  uint64_t v28 = v34;
  char v34 = 0;
  if (v28)
  {
    if (*v28 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v28;
    }
  }
  v29 = v35;
  v35 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v29 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v38, v37);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v38);
  v30 = (_DWORD *)v38[0];
  v38[0] = 0;
  if (v30)
  {
    if (*v30 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v30 -= 2;
    }
  }
  v31 = v36;
  v36 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v31;
    }
  }
  v32 = v37;
  v37 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v32;
    }
  }
}

- (void)domStorageItemAddedWithStorageId:(id)a3 key:(id)a4 newValue:(id)a5
{
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v9 = v8;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"key" format];
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"storageId" format];
  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"newValue" format];
LABEL_4:
  WTF::JSONImpl::Object::create((uint64_t *)&v42, v8);
  uint64_t v10 = v42;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v41 = (WTF::JSONImpl::Object *)v43[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::StringImpl *)v43[0];
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v41, (const WTF::String *)&v40);
  uint64_t v11 = v40;
  v40 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v41;
  v41 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      uint64_t v12 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v41, v12);
  uint64_t v13 = (uint64_t)v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::StringImpl *)v43[0];
  if (a3)
  {
    [a3 toJSONObject];
    uint64_t v14 = v38;
  }
  else
  {
    uint64_t v14 = 0;
  }
  char v39 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v13 + 16), &v40, (uint64_t *)&v39, (uint64_t)v43);
  if (v44)
  {
    uint64_t v15 = (uint64_t *)(v13 + 24);
    uint64_t v16 = *(unsigned int *)(v13 + 36);
    if (v16 == *(_DWORD *)(v13 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v40);
    }
    else
    {
      uint64_t v17 = *v15;
      uint64_t v18 = v40;
      if (v40) {
        *(_DWORD *)v40 += 2;
      }
      *(void *)(v17 + 8 * v16) = v18;
      *(_DWORD *)(v13 + 36) = v16 + 1;
    }
  }
  v19 = v39;
  char v39 = 0;
  if (v19)
  {
    if (*v19 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v19;
    }
  }
  uint64_t v20 = v40;
  v40 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  uint64_t v21 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::StringImpl *)v43[0];
  MEMORY[0x22A6705C0](v43, a4);
  WTF::JSONImpl::ObjectBase::setString(v21, (const WTF::String *)&v40, (const WTF::String *)v43);
  v22 = (_DWORD *)v43[0];
  v43[0] = 0;
  if (v22)
  {
    if (*v22 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v22 -= 2;
    }
  }
  uint64_t v23 = v40;
  v40 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  v24 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::StringImpl *)v43[0];
  MEMORY[0x22A6705C0](v43, a5);
  WTF::JSONImpl::ObjectBase::setString(v24, (const WTF::String *)&v40, (const WTF::String *)v43);
  uint64_t v25 = (_DWORD *)v43[0];
  v43[0] = 0;
  if (v25)
  {
    if (*v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v25 -= 2;
    }
  }
  uint64_t v26 = v40;
  v40 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v26 -= 2;
    }
  }
  v27 = v42;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (uint64_t)v41;
  v40 = (WTF::StringImpl *)v43[0];
  v41 = 0;
  char v39 = (_DWORD *)v28;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v27 + 2, &v40, (uint64_t *)&v39, (uint64_t)v43);
  if (v44)
  {
    v29 = (uint64_t *)((char *)v27 + 24);
    uint64_t v30 = *((unsigned int *)v27 + 9);
    if (v30 == *((_DWORD *)v27 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v29, (unint64_t)&v40);
    }
    else
    {
      uint64_t v31 = *v29;
      v32 = v40;
      if (v40) {
        *(_DWORD *)v40 += 2;
      }
      *(void *)(v31 + 8 * v30) = v32;
      *((_DWORD *)v27 + 9) = v30 + 1;
    }
  }
  uint64_t v33 = v39;
  char v39 = 0;
  if (v33)
  {
    if (*v33 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v33;
    }
  }
  char v34 = v40;
  v40 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v34 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v43, v42);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v43);
  v35 = (_DWORD *)v43[0];
  v43[0] = 0;
  if (v35)
  {
    if (*v35 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v35 -= 2;
    }
  }
  v36 = v41;
  v41 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v36;
    }
  }
  v37 = v42;
  v42 = 0;
  if (v37)
  {
    if (*(_DWORD *)v37 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v37;
    }
  }
}

- (void)domStorageItemUpdatedWithStorageId:(id)a3 key:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  uint64_t v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  uint64_t v11 = v10;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"storageId" format];
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
LABEL_10:
      uint64_t v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"oldValue" format];
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  uint64_t v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"key" format];
  if (!a5) {
    goto LABEL_10;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_11:
  uint64_t v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"newValue" format];
LABEL_5:
  WTF::JSONImpl::Object::create((uint64_t *)&v47, v10);
  uint64_t v12 = v47;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v46 = (WTF::JSONImpl::Object *)v48[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v45 = (WTF::StringImpl *)v48[0];
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v46, (const WTF::String *)&v45);
  uint64_t v13 = v45;
  v45 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v46;
  v46 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      uint64_t v14 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v46, v14);
  uint64_t v15 = (uint64_t)v46;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v45 = (WTF::StringImpl *)v48[0];
  if (a3)
  {
    [a3 toJSONObject];
    uint64_t v16 = v43;
  }
  else
  {
    uint64_t v16 = 0;
  }
  char v44 = (_DWORD *)v16;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v15 + 16), &v45, (uint64_t *)&v44, (uint64_t)v48);
  if (v49)
  {
    uint64_t v17 = (uint64_t *)(v15 + 24);
    uint64_t v18 = *(unsigned int *)(v15 + 36);
    if (v18 == *(_DWORD *)(v15 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v17, (unint64_t)&v45);
    }
    else
    {
      uint64_t v19 = *v17;
      uint64_t v20 = v45;
      if (v45) {
        *(_DWORD *)v45 += 2;
      }
      *(void *)(v19 + 8 * v18) = v20;
      *(_DWORD *)(v15 + 36) = v18 + 1;
    }
  }
  uint64_t v21 = v44;
  char v44 = 0;
  if (v21)
  {
    if (*v21 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v21;
    }
  }
  v22 = v45;
  v45 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
  uint64_t v23 = v46;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v45 = (WTF::StringImpl *)v48[0];
  MEMORY[0x22A6705C0](v48, a4);
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v45, (const WTF::String *)v48);
  v24 = (_DWORD *)v48[0];
  v48[0] = 0;
  if (v24)
  {
    if (*v24 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v24 -= 2;
    }
  }
  uint64_t v25 = v45;
  v45 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  uint64_t v26 = v46;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v45 = (WTF::StringImpl *)v48[0];
  MEMORY[0x22A6705C0](v48, a5);
  WTF::JSONImpl::ObjectBase::setString(v26, (const WTF::String *)&v45, (const WTF::String *)v48);
  v27 = (_DWORD *)v48[0];
  v48[0] = 0;
  if (v27)
  {
    if (*v27 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v27 -= 2;
    }
  }
  uint64_t v28 = v45;
  v45 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v28 -= 2;
    }
  }
  v29 = v46;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v45 = (WTF::StringImpl *)v48[0];
  MEMORY[0x22A6705C0](v48, a6);
  WTF::JSONImpl::ObjectBase::setString(v29, (const WTF::String *)&v45, (const WTF::String *)v48);
  uint64_t v30 = (_DWORD *)v48[0];
  v48[0] = 0;
  if (v30)
  {
    if (*v30 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v30 -= 2;
    }
  }
  uint64_t v31 = v45;
  v45 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v31 -= 2;
    }
  }
  v32 = v47;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v33 = (uint64_t)v46;
  v45 = (WTF::StringImpl *)v48[0];
  v46 = 0;
  char v44 = (_DWORD *)v33;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v32 + 2, &v45, (uint64_t *)&v44, (uint64_t)v48);
  if (v49)
  {
    char v34 = (uint64_t *)((char *)v32 + 24);
    uint64_t v35 = *((unsigned int *)v32 + 9);
    if (v35 == *((_DWORD *)v32 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v34, (unint64_t)&v45);
    }
    else
    {
      uint64_t v36 = *v34;
      v37 = v45;
      if (v45) {
        *(_DWORD *)v45 += 2;
      }
      *(void *)(v36 + 8 * v35) = v37;
      *((_DWORD *)v32 + 9) = v35 + 1;
    }
  }
  uint64_t v38 = v44;
  char v44 = 0;
  if (v38)
  {
    if (*v38 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v38;
    }
  }
  char v39 = v45;
  v45 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v39 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v48, v47);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v48);
  v40 = (_DWORD *)v48[0];
  v48[0] = 0;
  if (v40)
  {
    if (*v40 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v40 -= 2;
    }
  }
  v41 = v46;
  v46 = 0;
  if (v41)
  {
    if (*(_DWORD *)v41 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v41;
    }
  }
  v42 = v47;
  v47 = 0;
  if (v42)
  {
    if (*(_DWORD *)v42 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v42;
    }
  }
}

@end