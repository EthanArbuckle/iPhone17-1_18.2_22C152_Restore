@interface RWIProtocolConsoleDomainEventDispatcher
- (RWIProtocolConsoleDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3;
- (void)heapSnapshotWithTimestamp:(double)a3 snapshotData:(id)a4 title:(id *)a5;
- (void)messageAddedWithMessage:(id)a3;
- (void)messageRepeatCountUpdatedWithCount:(int)a3 timestamp:(double *)a4;
- (void)messagesClearedWithReason:(int64_t)a3;
@end

@implementation RWIProtocolConsoleDomainEventDispatcher

- (RWIProtocolConsoleDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolConsoleDomainEventDispatcher;
  result = [(RWIProtocolConsoleDomainEventDispatcher *)&v5 init];
  if (result) {
    result->_controller = a3;
  }
  return result;
}

- (void)messageAddedWithMessage:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"message" format];
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

- (void)messageRepeatCountUpdatedWithCount:(int)a3 timestamp:(double *)a4
{
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v28, v6);
  v7 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::JSONImpl::Object *)v29[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v27, (const WTF::String *)&v26);
  v8 = v26;
  v26 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  uint64_t v9 = v27;
  v27 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      uint64_t v9 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v27, v9);
  uint64_t v10 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v26, v5);
  v11 = v26;
  v26 = 0;
  if (!v11)
  {
LABEL_12:
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    goto LABEL_12;
  }
  WTF::StringImpl::destroy();
  if (!a4) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v12 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setDouble(v12, &v26, *a4);
  uint64_t v13 = v26;
  v26 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
LABEL_19:
  v14 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = (uint64_t)v27;
  v26 = (WTF::StringImpl *)v29[0];
  v27 = 0;
  v25 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v14 + 2, &v26, (uint64_t *)&v25, (uint64_t)v29);
  if (v30)
  {
    v16 = (uint64_t *)((char *)v14 + 24);
    uint64_t v17 = *((unsigned int *)v14 + 9);
    if (v17 == *((_DWORD *)v14 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v26);
    }
    else
    {
      uint64_t v18 = *v16;
      v19 = v26;
      if (v26) {
        *(_DWORD *)v26 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  uint64_t v20 = v25;
  v25 = 0;
  if (v20)
  {
    if (*v20 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v20;
    }
  }
  uint64_t v21 = v26;
  v26 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v29, v28);
  Inspector::FrontendRouter::sendEvent(v6, (const WTF::String *)v29);
  v22 = (_DWORD *)v29[0];
  v29[0] = 0;
  if (v22)
  {
    if (*v22 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v22 -= 2;
    }
  }
  v23 = v27;
  v27 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v23;
    }
  }
  v24 = v28;
  uint64_t v28 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v24;
    }
  }
}

- (void)messagesClearedWithReason:(int64_t)a3
{
  v3 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v24, v3);
  v4 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::JSONImpl::Object *)v25[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setString(v4, (const WTF::String *)&v23, (const WTF::String *)&v22);
  objc_super v5 = v22;
  v22 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  v6 = v23;
  v23 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      v6 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v23, v6);
  v7 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::StringImpl *)v25[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v21 = (_DWORD *)v25[0];
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v22, (const WTF::String *)&v21);
  v8 = v21;
  uint64_t v21 = 0;
  if (v8)
  {
    if (*v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v8 -= 2;
    }
  }
  uint64_t v9 = v22;
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
  uint64_t v10 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = (uint64_t)v23;
  v22 = (WTF::StringImpl *)v25[0];
  v23 = 0;
  uint64_t v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v10 + 2, &v22, (uint64_t *)&v21, (uint64_t)v25);
  if (v26)
  {
    uint64_t v12 = (uint64_t *)((char *)v10 + 24);
    uint64_t v13 = *((unsigned int *)v10 + 9);
    if (v13 == *((_DWORD *)v10 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *((_DWORD *)v10 + 9) = v13 + 1;
    }
  }
  v16 = v21;
  uint64_t v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  uint64_t v17 = v22;
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
  Inspector::FrontendRouter::sendEvent(v3, (const WTF::String *)v25);
  uint64_t v18 = (_DWORD *)v25[0];
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
  uint64_t v20 = v24;
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

- (void)heapSnapshotWithTimestamp:(double)a3 snapshotData:(id)a4 title:(id *)a5
{
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v9 = v8;
  if (!a4) {
    v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"snapshotData" format];
  }
  if (a5 && !*a5) {
    v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"title" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v35, v8);
  uint64_t v10 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v34 = (WTF::JSONImpl::Object *)v36[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v34, (const WTF::String *)&v33);
  uint64_t v11 = v33;
  v33 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v34;
  char v34 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      uint64_t v12 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v34, v12);
  uint64_t v13 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setDouble(v13, &v33, a3);
  uint64_t v14 = v33;
  v33 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  uint64_t v15 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  MEMORY[0x22A6705C0](v36, a4);
  WTF::JSONImpl::ObjectBase::setString(v15, (const WTF::String *)&v33, (const WTF::String *)v36);
  v16 = (_DWORD *)v36[0];
  v36[0] = 0;
  if (v16)
  {
    if (*v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v16 -= 2;
    }
  }
  uint64_t v17 = v33;
  v33 = 0;
  if (!v17)
  {
LABEL_25:
    if (!a5) {
      goto LABEL_36;
    }
    goto LABEL_28;
  }
  if (*(_DWORD *)v17 != 2)
  {
    *(_DWORD *)v17 -= 2;
    goto LABEL_25;
  }
  WTF::StringImpl::destroy();
  if (!a5) {
    goto LABEL_36;
  }
LABEL_28:
  uint64_t v18 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  MEMORY[0x22A6705C0](v36, *a5);
  WTF::JSONImpl::ObjectBase::setString(v18, (const WTF::String *)&v33, (const WTF::String *)v36);
  v19 = (_DWORD *)v36[0];
  v36[0] = 0;
  if (v19)
  {
    if (*v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v19 -= 2;
    }
  }
  uint64_t v20 = v33;
  v33 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
LABEL_36:
  uint64_t v21 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (uint64_t)v34;
  v33 = (WTF::StringImpl *)v36[0];
  char v34 = 0;
  v32 = (_DWORD *)v22;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v21 + 2, &v33, (uint64_t *)&v32, (uint64_t)v36);
  if (v37)
  {
    v23 = (uint64_t *)((char *)v21 + 24);
    uint64_t v24 = *((unsigned int *)v21 + 9);
    if (v24 == *((_DWORD *)v21 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v23, (unint64_t)&v33);
    }
    else
    {
      uint64_t v25 = *v23;
      char v26 = v33;
      if (v33) {
        *(_DWORD *)v33 += 2;
      }
      *(void *)(v25 + 8 * v24) = v26;
      *((_DWORD *)v21 + 9) = v24 + 1;
    }
  }
  v27 = v32;
  v32 = 0;
  if (v27)
  {
    if (*v27 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v27;
    }
  }
  uint64_t v28 = v33;
  v33 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v28 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v36, v35);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v36);
  v29 = (_DWORD *)v36[0];
  v36[0] = 0;
  if (v29)
  {
    if (*v29 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v29 -= 2;
    }
  }
  char v30 = v34;
  char v34 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v30;
    }
  }
  v31 = v35;
  v35 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v31;
    }
  }
}

@end