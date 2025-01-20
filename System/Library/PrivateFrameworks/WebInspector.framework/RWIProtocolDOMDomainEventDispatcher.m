@interface RWIProtocolDOMDomainEventDispatcher
- (RWIProtocolDOMDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3;
- (void)attributeModifiedWithNodeId:(int)a3 name:(id)a4 value:(id)a5;
- (void)attributeRemovedWithNodeId:(int)a3 name:(id)a4;
- (void)characterDataModifiedWithNodeId:(int)a3 characterData:(id)a4;
- (void)childNodeCountUpdatedWithNodeId:(int)a3 childNodeCount:(int)a4;
- (void)childNodeInsertedWithParentNodeId:(int)a3 previousNodeId:(int)a4 node:(id)a5;
- (void)childNodeRemovedWithParentNodeId:(int)a3 nodeId:(int)a4;
- (void)customElementStateChangedWithNodeId:(int)a3 customElementState:(int64_t)a4;
- (void)didAddEventListenerWithNodeId:(int)a3;
- (void)didFireEventWithNodeId:(int)a3 eventName:(id)a4 timestamp:(double)a5 data:(id *)a6;
- (void)documentUpdated;
- (void)inlineStyleInvalidatedWithNodeIds:(id)a3;
- (void)inspectWithNodeId:(int)a3;
- (void)powerEfficientPlaybackStateChangedWithNodeId:(int)a3 timestamp:(double)a4 isPowerEfficient:(BOOL)a5;
- (void)pseudoElementAddedWithParentId:(int)a3 pseudoElement:(id)a4;
- (void)pseudoElementRemovedWithParentId:(int)a3 pseudoElementId:(int)a4;
- (void)setChildNodesWithParentId:(int)a3 nodes:(id)a4;
- (void)shadowRootPoppedWithHostId:(int)a3 rootId:(int)a4;
- (void)shadowRootPushedWithHostId:(int)a3 root:(id)a4;
- (void)willDestroyDOMNodeWithNodeId:(int)a3;
- (void)willRemoveEventListenerWithNodeId:(int)a3;
@end

@implementation RWIProtocolDOMDomainEventDispatcher

- (RWIProtocolDOMDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMDomainEventDispatcher;
  result = [(RWIProtocolDOMDomainEventDispatcher *)&v5 init];
  if (result) {
    result->_controller = a3;
  }
  return result;
}

- (void)documentUpdated
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

- (void)inspectWithNodeId:(int)a3
{
  v3 = *(WTF::JSONImpl::Value **)&a3;
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
  uint64_t v8 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setInteger(v8, &v22, v3);
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

- (void)setChildNodesWithParentId:(int)a3 nodes:(id)a4
{
  v39[0] = a3;
  uint64_t v51 = *MEMORY[0x263EF8340];
  v38 = (Inspector::FrontendRouter *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                      + 4))(self->_controller, a2);
  if (!a4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"nodes" format];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  objc_super v5 = (WTF::JSONImpl::Object *)[a4 countByEnumeratingWithState:&v44 objects:v50 count:16];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)v45;
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v11 = (void *)MEMORY[0x263EFF940];
          v12 = (objc_class *)objc_opt_class();
          [v11 raise:v8, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v12), v10 format];
        }
        uint64_t v9 = (WTF::JSONImpl::Object *)((char *)v9 + 1);
      }
      while (v6 != v9);
      objc_super v5 = (WTF::JSONImpl::Object *)[a4 countByEnumeratingWithState:&v44 objects:v50 count:16];
      v6 = v5;
    }
    while (v5);
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v43, v5);
  uint64_t v13 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::JSONImpl::Object *)v48[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v41 = (WTF::StringImpl *)v48[0];
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v42, (const WTF::String *)&v41);
  uint64_t v14 = v41;
  v41 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  v15 = v42;
  v42 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      v15 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v42, v15);
  v16 = v42;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v41 = (WTF::StringImpl *)v48[0];
  WTF::JSONImpl::ObjectBase::setInteger(v16, &v41, (WTF::JSONImpl::Value *)v39[0]);
  v17 = v41;
  v41 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = (uint64_t)v42;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v41 = (WTF::StringImpl *)v48[0];
  Inspector::toJSONObjectArray((Inspector *)a4, (uint64_t *)&v39[1]);
  uint64_t v19 = *(void *)&v39[1];
  *(void *)&v39[1] = 0;
  v40 = (_DWORD *)v19;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v18 + 16), &v41, (uint64_t *)&v40, (uint64_t)v48);
  if (v49)
  {
    v20 = (uint64_t *)(v18 + 24);
    uint64_t v21 = *(unsigned int *)(v18 + 36);
    if (v21 == *(_DWORD *)(v18 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v20, (unint64_t)&v41);
    }
    else
    {
      uint64_t v22 = *v20;
      v23 = v41;
      if (v41) {
        *(_DWORD *)v41 += 2;
      }
      *(void *)(v22 + 8 * v21) = v23;
      *(_DWORD *)(v18 + 36) = v21 + 1;
    }
  }
  v24 = v40;
  v40 = 0;
  if (v24)
  {
    if (*v24 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v24;
    }
  }
  v25 = *(_DWORD **)&v39[1];
  *(void *)&v39[1] = 0;
  if (v25)
  {
    if (*v25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v25;
    }
  }
  char v26 = v41;
  v41 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v26 -= 2;
    }
  }
  v27 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (uint64_t)v42;
  v41 = (WTF::StringImpl *)v48[0];
  v42 = 0;
  v40 = (_DWORD *)v28;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v27 + 2, &v41, (uint64_t *)&v40, (uint64_t)v48);
  if (v49)
  {
    v29 = (uint64_t *)((char *)v27 + 24);
    uint64_t v30 = *((unsigned int *)v27 + 9);
    if (v30 == *((_DWORD *)v27 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v29, (unint64_t)&v41);
    }
    else
    {
      uint64_t v31 = *v29;
      v32 = v41;
      if (v41) {
        *(_DWORD *)v41 += 2;
      }
      *(void *)(v31 + 8 * v30) = v32;
      *((_DWORD *)v27 + 9) = v30 + 1;
    }
  }
  v33 = v40;
  v40 = 0;
  if (v33)
  {
    if (*v33 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v33;
    }
  }
  v34 = v41;
  v41 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v34 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v48, v43);
  Inspector::FrontendRouter::sendEvent(v38, (const WTF::String *)v48);
  v35 = (_DWORD *)v48[0];
  v48[0] = 0;
  if (v35)
  {
    if (*v35 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v35 -= 2;
    }
  }
  v36 = v42;
  v42 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v36;
    }
  }
  v37 = v43;
  v43 = 0;
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

- (void)attributeModifiedWithNodeId:(int)a3 name:(id)a4 value:(id)a5
{
  uint64_t v7 = *(WTF::JSONImpl::Value **)&a3;
  uint64_t v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v9 = v8;
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"name" format];
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"value" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v35, v8);
  uint64_t v10 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::JSONImpl::Object *)v36[0];
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
  v12 = v34;
  v34 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      v12 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v34, v12);
  uint64_t v13 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setInteger(v13, &v33, v7);
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
  v15 = v34;
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
  v17 = v33;
  v33 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  MEMORY[0x22A6705C0](v36, a5);
  WTF::JSONImpl::ObjectBase::setString(v18, (const WTF::String *)&v33, (const WTF::String *)v36);
  uint64_t v19 = (_DWORD *)v36[0];
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
  v20 = v33;
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
  uint64_t v21 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (uint64_t)v34;
  v33 = (WTF::StringImpl *)v36[0];
  v34 = 0;
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
  uint64_t v30 = v34;
  v34 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v30;
    }
  }
  uint64_t v31 = v35;
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

- (void)attributeRemovedWithNodeId:(int)a3 name:(id)a4
{
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v7 = v6;
  if (!a4) {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"name" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v30, v6);
  uint64_t v8 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::JSONImpl::Object *)v31[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v29, (const WTF::String *)&v28);
  uint64_t v9 = v28;
  uint64_t v28 = 0;
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
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v28, v5);
  v12 = v28;
  uint64_t v28 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  MEMORY[0x22A6705C0](v31, a4);
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v28, (const WTF::String *)v31);
  uint64_t v14 = (_DWORD *)v31[0];
  v31[0] = 0;
  if (v14)
  {
    if (*v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v14 -= 2;
    }
  }
  v15 = v28;
  uint64_t v28 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  v16 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v17 = (uint64_t)v29;
  uint64_t v28 = (WTF::StringImpl *)v31[0];
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
  uint64_t v22 = v27;
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
  uint64_t v28 = 0;
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
  uint64_t v24 = (_DWORD *)v31[0];
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
  uint64_t v25 = v29;
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
  uint64_t v30 = 0;
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

- (void)inlineStyleInvalidatedWithNodeIds:(id)a3
{
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  objc_super v5 = v4;
  if (!a3) {
    v4 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"nodeIds" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v33, v4);
  v6 = v33;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v32 = (WTF::JSONImpl::Object *)v34[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v31 = (WTF::StringImpl *)v34[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v32, (const WTF::String *)&v31);
  uint64_t v7 = v31;
  uint64_t v31 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  uint64_t v8 = v32;
  char v32 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      uint64_t v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v32, v8);
  uint64_t v9 = (uint64_t)v32;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v31 = (WTF::StringImpl *)v34[0];
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v29);
  uint64_t v10 = (uint64_t)v29;
  v29 = 0;
  uint64_t v30 = (_DWORD *)v10;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v9 + 16), &v31, (uint64_t *)&v30, (uint64_t)v34);
  if (v35)
  {
    uint64_t v11 = (uint64_t *)(v9 + 24);
    uint64_t v12 = *(unsigned int *)(v9 + 36);
    if (v12 == *(_DWORD *)(v9 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v11, (unint64_t)&v31);
    }
    else
    {
      uint64_t v13 = *v11;
      uint64_t v14 = v31;
      if (v31) {
        *(_DWORD *)v31 += 2;
      }
      *(void *)(v13 + 8 * v12) = v14;
      *(_DWORD *)(v9 + 36) = v12 + 1;
    }
  }
  v15 = v30;
  uint64_t v30 = 0;
  if (v15)
  {
    if (*v15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v15;
    }
  }
  v16 = v29;
  v29 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  uint64_t v17 = v31;
  uint64_t v31 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = v33;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v19 = (uint64_t)v32;
  uint64_t v31 = (WTF::StringImpl *)v34[0];
  char v32 = 0;
  uint64_t v30 = (_DWORD *)v19;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v18 + 2, &v31, (uint64_t *)&v30, (uint64_t)v34);
  if (v35)
  {
    uint64_t v20 = (uint64_t *)((char *)v18 + 24);
    uint64_t v21 = *((unsigned int *)v18 + 9);
    if (v21 == *((_DWORD *)v18 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v20, (unint64_t)&v31);
    }
    else
    {
      uint64_t v22 = *v20;
      v23 = v31;
      if (v31) {
        *(_DWORD *)v31 += 2;
      }
      *(void *)(v22 + 8 * v21) = v23;
      *((_DWORD *)v18 + 9) = v21 + 1;
    }
  }
  uint64_t v24 = v30;
  uint64_t v30 = 0;
  if (v24)
  {
    if (*v24 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v24;
    }
  }
  uint64_t v25 = v31;
  uint64_t v31 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v34, v33);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v34);
  char v26 = (_DWORD *)v34[0];
  v34[0] = 0;
  if (v26)
  {
    if (*v26 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v26 -= 2;
    }
  }
  v27 = v32;
  char v32 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v27;
    }
  }
  uint64_t v28 = v33;
  v33 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v28;
    }
  }
}

- (void)characterDataModifiedWithNodeId:(int)a3 characterData:(id)a4
{
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v7 = v6;
  if (!a4) {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"characterData" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v30, v6);
  uint64_t v8 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::JSONImpl::Object *)v31[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v29, (const WTF::String *)&v28);
  uint64_t v9 = v28;
  uint64_t v28 = 0;
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
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v28, v5);
  uint64_t v12 = v28;
  uint64_t v28 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  MEMORY[0x22A6705C0](v31, a4);
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v28, (const WTF::String *)v31);
  uint64_t v14 = (_DWORD *)v31[0];
  v31[0] = 0;
  if (v14)
  {
    if (*v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v14 -= 2;
    }
  }
  v15 = v28;
  uint64_t v28 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  v16 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v17 = (uint64_t)v29;
  uint64_t v28 = (WTF::StringImpl *)v31[0];
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
  uint64_t v22 = v27;
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
  uint64_t v28 = 0;
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
  uint64_t v24 = (_DWORD *)v31[0];
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
  uint64_t v25 = v29;
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
  uint64_t v30 = 0;
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

- (void)childNodeCountUpdatedWithNodeId:(int)a3 childNodeCount:(int)a4
{
  v4 = *(WTF::JSONImpl::Value **)&a4;
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v28, v6);
  uint64_t v7 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::JSONImpl::Object *)v29[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v27, (const WTF::String *)&v26);
  uint64_t v8 = v26;
  char v26 = 0;
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
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v26, v5);
  uint64_t v11 = v26;
  char v26 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v26, v4);
  uint64_t v13 = v26;
  char v26 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = (uint64_t)v27;
  char v26 = (WTF::StringImpl *)v29[0];
  v27 = 0;
  uint64_t v25 = (_DWORD *)v15;
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
      uint64_t v19 = v26;
      if (v26) {
        *(_DWORD *)v26 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  uint64_t v20 = v25;
  uint64_t v25 = 0;
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
  char v26 = 0;
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
  uint64_t v22 = (_DWORD *)v29[0];
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
  uint64_t v24 = v28;
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

- (void)childNodeInsertedWithParentNodeId:(int)a3 previousNodeId:(int)a4 node:(id)a5
{
  v6 = *(WTF::JSONImpl::Value **)&a4;
  uint64_t v7 = *(WTF::JSONImpl::Value **)&a3;
  uint64_t v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v9 = v8;
  if (!a5) {
    uint64_t v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"node" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v40, v8);
  uint64_t v10 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::JSONImpl::Object *)v41[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v39, (const WTF::String *)&v38);
  uint64_t v11 = v38;
  v38 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v39;
  v39 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      uint64_t v12 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v39, v12);
  uint64_t v13 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setInteger(v13, &v38, v7);
  uint64_t v14 = v38;
  v38 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  uint64_t v15 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setInteger(v15, &v38, v6);
  v16 = v38;
  v38 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  uint64_t v17 = (uint64_t)v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  if (a5)
  {
    [a5 toJSONObject];
    uint64_t v18 = v36;
  }
  else
  {
    uint64_t v18 = 0;
  }
  char v37 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v17 + 16), &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    uint64_t v19 = (uint64_t *)(v17 + 24);
    uint64_t v20 = *(unsigned int *)(v17 + 36);
    if (v20 == *(_DWORD *)(v17 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v38);
    }
    else
    {
      uint64_t v21 = *v19;
      uint64_t v22 = v38;
      if (v38) {
        *(_DWORD *)v38 += 2;
      }
      *(void *)(v21 + 8 * v20) = v22;
      *(_DWORD *)(v17 + 36) = v20 + 1;
    }
  }
  v23 = v37;
  char v37 = 0;
  if (v23)
  {
    if (*v23 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v23;
    }
  }
  uint64_t v24 = v38;
  v38 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v24 -= 2;
    }
  }
  uint64_t v25 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v26 = (uint64_t)v39;
  v38 = (WTF::StringImpl *)v41[0];
  v39 = 0;
  char v37 = (_DWORD *)v26;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v25 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v27 = (uint64_t *)((char *)v25 + 24);
    uint64_t v28 = *((unsigned int *)v25 + 9);
    if (v28 == *((_DWORD *)v25 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v27, (unint64_t)&v38);
    }
    else
    {
      uint64_t v29 = *v27;
      char v30 = v38;
      if (v38) {
        *(_DWORD *)v38 += 2;
      }
      *(void *)(v29 + 8 * v28) = v30;
      *((_DWORD *)v25 + 9) = v28 + 1;
    }
  }
  uint64_t v31 = v37;
  char v37 = 0;
  if (v31)
  {
    if (*v31 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v31;
    }
  }
  char v32 = v38;
  v38 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v32 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v41, v40);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v41);
  v33 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v33)
  {
    if (*v33 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v33 -= 2;
    }
  }
  v34 = v39;
  v39 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v34;
    }
  }
  char v35 = v40;
  v40 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v35;
    }
  }
}

- (void)childNodeRemovedWithParentNodeId:(int)a3 nodeId:(int)a4
{
  v4 = *(WTF::JSONImpl::Value **)&a4;
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v28, v6);
  uint64_t v7 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::JSONImpl::Object *)v29[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v27, (const WTF::String *)&v26);
  uint64_t v8 = v26;
  uint64_t v26 = 0;
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
  uint64_t v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v26, v5);
  uint64_t v11 = v26;
  uint64_t v26 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v26, v4);
  uint64_t v13 = v26;
  uint64_t v26 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = (uint64_t)v27;
  uint64_t v26 = (WTF::StringImpl *)v29[0];
  v27 = 0;
  uint64_t v25 = (_DWORD *)v15;
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
      uint64_t v19 = v26;
      if (v26) {
        *(_DWORD *)v26 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  uint64_t v20 = v25;
  uint64_t v25 = 0;
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
  uint64_t v26 = 0;
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
  uint64_t v22 = (_DWORD *)v29[0];
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
  uint64_t v24 = v28;
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

- (void)willDestroyDOMNodeWithNodeId:(int)a3
{
  v3 = *(WTF::JSONImpl::Value **)&a3;
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v24, v4);
  objc_super v5 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::JSONImpl::Object *)v25[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v23, (const WTF::String *)&v22);
  v6 = v22;
  uint64_t v22 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v23;
  v23 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      uint64_t v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v23, v7);
  uint64_t v8 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setInteger(v8, &v22, v3);
  uint64_t v9 = v22;
  uint64_t v22 = 0;
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
  uint64_t v22 = (WTF::StringImpl *)v25[0];
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
  uint64_t v22 = 0;
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
  uint64_t v19 = v23;
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
  uint64_t v24 = 0;
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

- (void)shadowRootPushedWithHostId:(int)a3 root:(id)a4
{
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v7 = v6;
  if (!a4) {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"root" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v36, v6);
  uint64_t v8 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v35 = (WTF::JSONImpl::Object *)v37[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v35, (const WTF::String *)&v34);
  uint64_t v9 = v34;
  v34 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  uint64_t v10 = v35;
  char v35 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      uint64_t v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v35, v10);
  uint64_t v11 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v34, v5);
  uint64_t v12 = v34;
  v34 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = (uint64_t)v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  if (a4)
  {
    [a4 toJSONObject];
    uint64_t v14 = v32;
  }
  else
  {
    uint64_t v14 = 0;
  }
  v33 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v13 + 16), &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    uint64_t v15 = (uint64_t *)(v13 + 24);
    uint64_t v16 = *(unsigned int *)(v13 + 36);
    if (v16 == *(_DWORD *)(v13 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v34);
    }
    else
    {
      uint64_t v17 = *v15;
      uint64_t v18 = v34;
      if (v34) {
        *(_DWORD *)v34 += 2;
      }
      *(void *)(v17 + 8 * v16) = v18;
      *(_DWORD *)(v13 + 36) = v16 + 1;
    }
  }
  uint64_t v19 = v33;
  v33 = 0;
  if (v19)
  {
    if (*v19 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v19;
    }
  }
  uint64_t v20 = v34;
  v34 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  uint64_t v21 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (uint64_t)v35;
  v34 = (WTF::StringImpl *)v37[0];
  char v35 = 0;
  v33 = (_DWORD *)v22;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v21 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v23 = (uint64_t *)((char *)v21 + 24);
    uint64_t v24 = *((unsigned int *)v21 + 9);
    if (v24 == *((_DWORD *)v21 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v23, (unint64_t)&v34);
    }
    else
    {
      uint64_t v25 = *v23;
      char v26 = v34;
      if (v34) {
        *(_DWORD *)v34 += 2;
      }
      *(void *)(v25 + 8 * v24) = v26;
      *((_DWORD *)v21 + 9) = v24 + 1;
    }
  }
  v27 = v33;
  v33 = 0;
  if (v27)
  {
    if (*v27 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v27;
    }
  }
  uint64_t v28 = v34;
  v34 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v28 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v37, v36);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v37);
  uint64_t v29 = (_DWORD *)v37[0];
  v37[0] = 0;
  if (v29)
  {
    if (*v29 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v29 -= 2;
    }
  }
  char v30 = v35;
  char v35 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v30;
    }
  }
  uint64_t v31 = v36;
  uint64_t v36 = 0;
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

- (void)shadowRootPoppedWithHostId:(int)a3 rootId:(int)a4
{
  v4 = *(WTF::JSONImpl::Value **)&a4;
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v28, v6);
  uint64_t v7 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::JSONImpl::Object *)v29[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v27, (const WTF::String *)&v26);
  uint64_t v8 = v26;
  char v26 = 0;
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
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v26, v5);
  uint64_t v11 = v26;
  char v26 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v26, v4);
  uint64_t v13 = v26;
  char v26 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = (uint64_t)v27;
  char v26 = (WTF::StringImpl *)v29[0];
  v27 = 0;
  uint64_t v25 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v14 + 2, &v26, (uint64_t *)&v25, (uint64_t)v29);
  if (v30)
  {
    uint64_t v16 = (uint64_t *)((char *)v14 + 24);
    uint64_t v17 = *((unsigned int *)v14 + 9);
    if (v17 == *((_DWORD *)v14 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v26);
    }
    else
    {
      uint64_t v18 = *v16;
      uint64_t v19 = v26;
      if (v26) {
        *(_DWORD *)v26 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  uint64_t v20 = v25;
  uint64_t v25 = 0;
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
  char v26 = 0;
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
  uint64_t v22 = (_DWORD *)v29[0];
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
  uint64_t v24 = v28;
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

- (void)customElementStateChangedWithNodeId:(int)a3 customElementState:(int64_t)a4
{
  v4 = *(WTF::JSONImpl::Value **)&a3;
  objc_super v5 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v28, v5);
  v6 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::JSONImpl::Object *)v29[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v27, (const WTF::String *)&v26);
  uint64_t v7 = v26;
  char v26 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  uint64_t v8 = v27;
  v27 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      uint64_t v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v27, v8);
  uint64_t v9 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v9, &v26, v4);
  uint64_t v10 = v26;
  char v26 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  uint64_t v11 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v25 = (_DWORD *)v29[0];
  WTF::JSONImpl::ObjectBase::setString(v11, (const WTF::String *)&v26, (const WTF::String *)&v25);
  uint64_t v12 = v25;
  uint64_t v25 = 0;
  if (v12)
  {
    if (*v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v12 -= 2;
    }
  }
  uint64_t v13 = v26;
  char v26 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = (uint64_t)v27;
  char v26 = (WTF::StringImpl *)v29[0];
  v27 = 0;
  uint64_t v25 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v14 + 2, &v26, (uint64_t *)&v25, (uint64_t)v29);
  if (v30)
  {
    uint64_t v16 = (uint64_t *)((char *)v14 + 24);
    uint64_t v17 = *((unsigned int *)v14 + 9);
    if (v17 == *((_DWORD *)v14 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v26);
    }
    else
    {
      uint64_t v18 = *v16;
      uint64_t v19 = v26;
      if (v26) {
        *(_DWORD *)v26 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  uint64_t v20 = v25;
  uint64_t v25 = 0;
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
  char v26 = 0;
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
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v29);
  uint64_t v22 = (_DWORD *)v29[0];
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
  uint64_t v24 = v28;
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

- (void)pseudoElementAddedWithParentId:(int)a3 pseudoElement:(id)a4
{
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  uint64_t v7 = v6;
  if (!a4) {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"pseudoElement" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v36, v6);
  uint64_t v8 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v35 = (WTF::JSONImpl::Object *)v37[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v35, (const WTF::String *)&v34);
  uint64_t v9 = v34;
  v34 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  uint64_t v10 = v35;
  char v35 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      uint64_t v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v35, v10);
  uint64_t v11 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v34, v5);
  uint64_t v12 = v34;
  v34 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = (uint64_t)v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  if (a4)
  {
    [a4 toJSONObject];
    uint64_t v14 = v32;
  }
  else
  {
    uint64_t v14 = 0;
  }
  v33 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v13 + 16), &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    uint64_t v15 = (uint64_t *)(v13 + 24);
    uint64_t v16 = *(unsigned int *)(v13 + 36);
    if (v16 == *(_DWORD *)(v13 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v34);
    }
    else
    {
      uint64_t v17 = *v15;
      uint64_t v18 = v34;
      if (v34) {
        *(_DWORD *)v34 += 2;
      }
      *(void *)(v17 + 8 * v16) = v18;
      *(_DWORD *)(v13 + 36) = v16 + 1;
    }
  }
  uint64_t v19 = v33;
  v33 = 0;
  if (v19)
  {
    if (*v19 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v19;
    }
  }
  uint64_t v20 = v34;
  v34 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  uint64_t v21 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (uint64_t)v35;
  v34 = (WTF::StringImpl *)v37[0];
  char v35 = 0;
  v33 = (_DWORD *)v22;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v21 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v23 = (uint64_t *)((char *)v21 + 24);
    uint64_t v24 = *((unsigned int *)v21 + 9);
    if (v24 == *((_DWORD *)v21 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v23, (unint64_t)&v34);
    }
    else
    {
      uint64_t v25 = *v23;
      char v26 = v34;
      if (v34) {
        *(_DWORD *)v34 += 2;
      }
      *(void *)(v25 + 8 * v24) = v26;
      *((_DWORD *)v21 + 9) = v24 + 1;
    }
  }
  v27 = v33;
  v33 = 0;
  if (v27)
  {
    if (*v27 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v27;
    }
  }
  uint64_t v28 = v34;
  v34 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v28 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v37, v36);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v37);
  uint64_t v29 = (_DWORD *)v37[0];
  v37[0] = 0;
  if (v29)
  {
    if (*v29 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v29 -= 2;
    }
  }
  char v30 = v35;
  char v35 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v30;
    }
  }
  uint64_t v31 = v36;
  uint64_t v36 = 0;
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

- (void)pseudoElementRemovedWithParentId:(int)a3 pseudoElementId:(int)a4
{
  v4 = *(WTF::JSONImpl::Value **)&a4;
  objc_super v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v28, v6);
  uint64_t v7 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::JSONImpl::Object *)v29[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v27, (const WTF::String *)&v26);
  uint64_t v8 = v26;
  char v26 = 0;
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
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v26, v5);
  uint64_t v11 = v26;
  char v26 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v26 = (WTF::StringImpl *)v29[0];
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v26, v4);
  uint64_t v13 = v26;
  char v26 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = (uint64_t)v27;
  char v26 = (WTF::StringImpl *)v29[0];
  v27 = 0;
  uint64_t v25 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v14 + 2, &v26, (uint64_t *)&v25, (uint64_t)v29);
  if (v30)
  {
    uint64_t v16 = (uint64_t *)((char *)v14 + 24);
    uint64_t v17 = *((unsigned int *)v14 + 9);
    if (v17 == *((_DWORD *)v14 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v26);
    }
    else
    {
      uint64_t v18 = *v16;
      uint64_t v19 = v26;
      if (v26) {
        *(_DWORD *)v26 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  uint64_t v20 = v25;
  uint64_t v25 = 0;
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
  char v26 = 0;
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
  uint64_t v22 = (_DWORD *)v29[0];
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
  uint64_t v24 = v28;
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

- (void)didAddEventListenerWithNodeId:(int)a3
{
  v3 = *(WTF::JSONImpl::Value **)&a3;
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v24, v4);
  objc_super v5 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::JSONImpl::Object *)v25[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v23, (const WTF::String *)&v22);
  v6 = v22;
  uint64_t v22 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v23;
  v23 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      uint64_t v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v23, v7);
  uint64_t v8 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setInteger(v8, &v22, v3);
  uint64_t v9 = v22;
  uint64_t v22 = 0;
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
  uint64_t v22 = (WTF::StringImpl *)v25[0];
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
  uint64_t v16 = v21;
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
  uint64_t v22 = 0;
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
  uint64_t v19 = v23;
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
  uint64_t v24 = 0;
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

- (void)willRemoveEventListenerWithNodeId:(int)a3
{
  v3 = *(WTF::JSONImpl::Value **)&a3;
  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v24, v4);
  objc_super v5 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::JSONImpl::Object *)v25[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v23, (const WTF::String *)&v22);
  v6 = v22;
  uint64_t v22 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v23;
  v23 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      uint64_t v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v23, v7);
  uint64_t v8 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = (WTF::StringImpl *)v25[0];
  WTF::JSONImpl::ObjectBase::setInteger(v8, &v22, v3);
  uint64_t v9 = v22;
  uint64_t v22 = 0;
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
  uint64_t v22 = (WTF::StringImpl *)v25[0];
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
  uint64_t v16 = v21;
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
  uint64_t v22 = 0;
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
  uint64_t v19 = v23;
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
  uint64_t v24 = 0;
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

- (void)didFireEventWithNodeId:(int)a3 eventName:(id)a4 timestamp:(double)a5 data:(id *)a6
{
  uint64_t v9 = *(WTF::JSONImpl::Value **)&a3;
  uint64_t v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  uint64_t v11 = v10;
  if (!a4) {
    uint64_t v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"eventName" format];
  }
  if (a6 && !*a6) {
    uint64_t v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"data" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v45, v10);
  uint64_t v12 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  long long v44 = (WTF::JSONImpl::Object *)v46[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v44, (const WTF::String *)&v43);
  uint64_t v13 = v43;
  v43 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v44;
  long long v44 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      uint64_t v14 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v44, v14);
  uint64_t v15 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setInteger(v15, &v43, v9);
  uint64_t v16 = v43;
  v43 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  uint64_t v17 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  MEMORY[0x22A6705C0](v46, a4);
  WTF::JSONImpl::ObjectBase::setString(v17, (const WTF::String *)&v43, (const WTF::String *)v46);
  uint64_t v18 = (_DWORD *)v46[0];
  v46[0] = 0;
  if (v18)
  {
    if (*v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v18 -= 2;
    }
  }
  uint64_t v19 = v43;
  v43 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  uint64_t v20 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setDouble(v20, &v43, a5);
  uint64_t v21 = v43;
  v43 = 0;
  if (!v21)
  {
LABEL_29:
    if (!a6) {
      goto LABEL_49;
    }
    goto LABEL_32;
  }
  if (*(_DWORD *)v21 != 2)
  {
    *(_DWORD *)v21 -= 2;
    goto LABEL_29;
  }
  WTF::StringImpl::destroy();
  if (!a6) {
    goto LABEL_49;
  }
LABEL_32:
  uint64_t v22 = (uint64_t)v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  if (*a6)
  {
    [*a6 toJSONObject];
    uint64_t v23 = v41;
  }
  else
  {
    uint64_t v23 = 0;
  }
  char v42 = (_DWORD *)v23;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v22 + 16), &v43, (uint64_t *)&v42, (uint64_t)v46);
  if (v47)
  {
    uint64_t v24 = (uint64_t *)(v22 + 24);
    uint64_t v25 = *(unsigned int *)(v22 + 36);
    if (v25 == *(_DWORD *)(v22 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v24, (unint64_t)&v43);
    }
    else
    {
      uint64_t v26 = *v24;
      v27 = v43;
      if (v43) {
        *(_DWORD *)v43 += 2;
      }
      *(void *)(v26 + 8 * v25) = v27;
      *(_DWORD *)(v22 + 36) = v25 + 1;
    }
  }
  uint64_t v28 = v42;
  char v42 = 0;
  if (v28)
  {
    if (*v28 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v28;
    }
  }
  uint64_t v29 = v43;
  v43 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v29 -= 2;
    }
  }
LABEL_49:
  char v30 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v31 = (uint64_t)v44;
  v43 = (WTF::StringImpl *)v46[0];
  long long v44 = 0;
  char v42 = (_DWORD *)v31;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v30 + 2, &v43, (uint64_t *)&v42, (uint64_t)v46);
  if (v47)
  {
    uint64_t v32 = (uint64_t *)((char *)v30 + 24);
    uint64_t v33 = *((unsigned int *)v30 + 9);
    if (v33 == *((_DWORD *)v30 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v32, (unint64_t)&v43);
    }
    else
    {
      uint64_t v34 = *v32;
      char v35 = v43;
      if (v43) {
        *(_DWORD *)v43 += 2;
      }
      *(void *)(v34 + 8 * v33) = v35;
      *((_DWORD *)v30 + 9) = v33 + 1;
    }
  }
  uint64_t v36 = v42;
  char v42 = 0;
  if (v36)
  {
    if (*v36 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v36;
    }
  }
  char v37 = v43;
  v43 = 0;
  if (v37)
  {
    if (*(_DWORD *)v37 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v37 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v46, v45);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v46);
  char v38 = (_DWORD *)v46[0];
  v46[0] = 0;
  if (v38)
  {
    if (*v38 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v38 -= 2;
    }
  }
  v39 = v44;
  long long v44 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v39;
    }
  }
  v40 = v45;
  long long v45 = 0;
  if (v40)
  {
    if (*(_DWORD *)v40 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v40;
    }
  }
}

- (void)powerEfficientPlaybackStateChangedWithNodeId:(int)a3 timestamp:(double)a4 isPowerEfficient:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(WTF::JSONImpl::Value **)&a3;
  uint64_t v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create((uint64_t *)&v32, v8);
  uint64_t v9 = v32;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v31 = (WTF::JSONImpl::Object *)v33[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v30 = (WTF::StringImpl *)v33[0];
  WTF::JSONImpl::ObjectBase::setString(v9, (const WTF::String *)&v31, (const WTF::String *)&v30);
  uint64_t v10 = v30;
  char v30 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  uint64_t v11 = v31;
  uint64_t v31 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      uint64_t v11 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v31, v11);
  uint64_t v12 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v30 = (WTF::StringImpl *)v33[0];
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v30, v7);
  uint64_t v13 = v30;
  char v30 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v30 = (WTF::StringImpl *)v33[0];
  WTF::JSONImpl::ObjectBase::setDouble(v14, &v30, a4);
  uint64_t v15 = v30;
  char v30 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  uint64_t v16 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v30 = (WTF::StringImpl *)v33[0];
  WTF::JSONImpl::ObjectBase::setBoolean(v16, &v30, (WTF::JSONImpl::Value *)v5);
  uint64_t v17 = v30;
  char v30 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = v32;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v19 = (uint64_t)v31;
  char v30 = (WTF::StringImpl *)v33[0];
  uint64_t v31 = 0;
  uint64_t v29 = (_DWORD *)v19;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v18 + 2, &v30, (uint64_t *)&v29, (uint64_t)v33);
  if (v34)
  {
    uint64_t v20 = (uint64_t *)((char *)v18 + 24);
    uint64_t v21 = *((unsigned int *)v18 + 9);
    if (v21 == *((_DWORD *)v18 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v20, (unint64_t)&v30);
    }
    else
    {
      uint64_t v22 = *v20;
      uint64_t v23 = v30;
      if (v30) {
        *(_DWORD *)v30 += 2;
      }
      *(void *)(v22 + 8 * v21) = v23;
      *((_DWORD *)v18 + 9) = v21 + 1;
    }
  }
  uint64_t v24 = v29;
  uint64_t v29 = 0;
  if (v24)
  {
    if (*v24 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v24;
    }
  }
  uint64_t v25 = v30;
  char v30 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v33, v32);
  Inspector::FrontendRouter::sendEvent(v8, (const WTF::String *)v33);
  uint64_t v26 = (_DWORD *)v33[0];
  v33[0] = 0;
  if (v26)
  {
    if (*v26 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v26 -= 2;
    }
  }
  v27 = v31;
  uint64_t v31 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v27;
    }
  }
  uint64_t v28 = v32;
  uint64_t v32 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v28;
    }
  }
}

@end