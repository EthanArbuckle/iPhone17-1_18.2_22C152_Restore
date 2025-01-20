@interface RWIProtocolCSSDomainEventDispatcher
- (RWIProtocolCSSDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3;
- (void)mediaQueryResultChanged;
- (void)nodeLayoutFlagsChangedWithNodeId:(int)a3 layoutFlags:(id *)a4;
- (void)styleSheetAddedWithHeader:(id)a3;
- (void)styleSheetChangedWithStyleSheetId:(id)a3;
- (void)styleSheetRemovedWithStyleSheetId:(id)a3;
@end

@implementation RWIProtocolCSSDomainEventDispatcher

- (RWIProtocolCSSDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSDomainEventDispatcher;
  result = [(RWIProtocolCSSDomainEventDispatcher *)&v5 init];
  if (result) {
    result->_controller = a3;
  }
  return result;
}

- (void)mediaQueryResultChanged
{
  v2 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v10, v2);
  v3 = v10;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v9 = (uint64_t)v11;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v8 = (uint64_t)v11;
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v9, (const WTF::String *)&v8);
  v4 = (_DWORD *)v8;
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
  objc_super v5 = (_DWORD *)v9;
  uint64_t v9 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString((uint64_t *)&v11, v10);
  Inspector::FrontendRouter::sendEvent(v2, (const WTF::String *)&v11);
  v6 = v11;
  v11 = 0;
  if (v6)
  {
    if (*v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v6 -= 2;
    }
  }
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v7;
    }
  }
}

- (void)styleSheetChangedWithStyleSheetId:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"styleSheetId" format];
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
  uint64_t v8 = v25;
  v25 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      uint64_t v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
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
  v10 = (_DWORD *)v27[0];
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
  v11 = v24;
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
  v12 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v13 = (uint64_t)v25;
  v24 = (WTF::StringImpl *)v27[0];
  v25 = 0;
  v23 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v24, (uint64_t *)&v23, (uint64_t)v27);
  if (v28)
  {
    v14 = (uint64_t *)((char *)v12 + 24);
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
  v18 = v23;
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
  v20 = (_DWORD *)v27[0];
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
  v21 = v25;
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
  v26 = 0;
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

- (void)styleSheetAddedWithHeader:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"header" format];
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
  uint64_t v8 = v31;
  v31 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      uint64_t v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
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
  uint64_t v15 = v29;
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
  uint64_t v16 = v30;
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

- (void)styleSheetRemovedWithStyleSheetId:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"styleSheetId" format];
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
  uint64_t v8 = v25;
  v25 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      uint64_t v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
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
  v11 = v24;
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
    v14 = (uint64_t *)((char *)v12 + 24);
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
  v26 = 0;
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

- (void)nodeLayoutFlagsChangedWithNodeId:(int)a3 layoutFlags:(id *)a4
{
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (a4 && !*a4) {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"layoutFlags" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v37, v6);
  uint64_t v8 = v37;
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
  v11 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v35, v5);
  uint64_t v12 = v35;
  v35 = 0;
  if (!v12)
  {
LABEL_15:
    if (!a4) {
      goto LABEL_36;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_15;
  }
  WTF::StringImpl::destroy();
  if (!a4) {
    goto LABEL_36;
  }
LABEL_18:
  uint64_t v13 = (uint64_t)v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  Inspector::toJSONStringArray((Inspector *)*a4, (uint64_t *)&v33);
  uint64_t v14 = (uint64_t)v33;
  v33 = 0;
  char v34 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v13 + 16), &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    uint64_t v15 = (uint64_t *)(v13 + 24);
    uint64_t v16 = *(unsigned int *)(v13 + 36);
    if (v16 == *(_DWORD *)(v13 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v35);
    }
    else
    {
      uint64_t v17 = *v15;
      uint64_t v18 = v35;
      if (v35) {
        *(_DWORD *)v35 += 2;
      }
      *(void *)(v17 + 8 * v16) = v18;
      *(_DWORD *)(v13 + 36) = v16 + 1;
    }
  }
  v19 = v34;
  char v34 = 0;
  if (v19)
  {
    if (*v19 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v19;
    }
  }
  uint64_t v20 = v33;
  v33 = 0;
  if (v20)
  {
    if (*v20 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v20;
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
LABEL_36:
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
  char v28 = v34;
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

@end