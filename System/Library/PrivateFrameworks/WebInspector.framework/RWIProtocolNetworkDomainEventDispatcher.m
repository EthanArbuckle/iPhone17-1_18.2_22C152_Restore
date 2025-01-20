@interface RWIProtocolNetworkDomainEventDispatcher
- (RWIProtocolNetworkDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3;
- (void)dataReceivedWithRequestId:(id)a3 timestamp:(double)a4 dataLength:(int)a5 encodedDataLength:(int)a6;
- (void)loadingFailedWithRequestId:(id)a3 timestamp:(double)a4 errorText:(id)a5 canceled:(BOOL *)a6;
- (void)loadingFinishedWithRequestId:(id)a3 timestamp:(double)a4 sourceMapURL:(id *)a5 metrics:(id *)a6;
- (void)requestInterceptedWithRequestId:(id)a3 request:(id)a4;
- (void)requestServedFromMemoryCacheWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 documentURL:(id)a6 timestamp:(double)a7 initiator:(id)a8 resource:(id)a9;
- (void)requestWillBeSentWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 documentURL:(id)a6 request:(id)a7 timestamp:(double)a8 walltime:(double)a9 initiator:(id)a10 redirectResponse:(id *)a11 type:(int64_t *)a12 targetId:(id *)a13;
- (void)responseInterceptedWithRequestId:(id)a3 response:(id)a4;
- (void)responseReceivedWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 timestamp:(double)a6 type:(int64_t)a7 response:(id)a8;
- (void)webSocketClosedWithRequestId:(id)a3 timestamp:(double)a4;
- (void)webSocketCreatedWithRequestId:(id)a3 url:(id)a4;
- (void)webSocketFrameErrorWithRequestId:(id)a3 timestamp:(double)a4 errorMessage:(id)a5;
- (void)webSocketFrameReceivedWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5;
- (void)webSocketFrameSentWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5;
- (void)webSocketHandshakeResponseReceivedWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5;
- (void)webSocketWillSendHandshakeRequestWithRequestId:(id)a3 timestamp:(double)a4 walltime:(double)a5 request:(id)a6;
@end

@implementation RWIProtocolNetworkDomainEventDispatcher

- (RWIProtocolNetworkDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolNetworkDomainEventDispatcher;
  result = [(RWIProtocolNetworkDomainEventDispatcher *)&v5 init];
  if (result) {
    result->_controller = a3;
  }
  return result;
}

- (void)requestWillBeSentWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 documentURL:(id)a6 request:(id)a7 timestamp:(double)a8 walltime:(double)a9 initiator:(id)a10 redirectResponse:(id *)a11 type:(int64_t *)a12 targetId:(id *)a13
{
  v21 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v22 = v21;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
LABEL_20:
      v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"loaderId" format];
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_21;
    }
  }
  v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  if (!a5) {
    goto LABEL_20;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_21:
  v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"documentURL" format];
LABEL_5:
  if (!a7) {
    v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"request" format];
  }
  if (!a10) {
    v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"initiator" format];
  }
  if (a11 && !*a11) {
    v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"redirectResponse" format];
  }
  if (a13 && !*a13) {
    v21 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"targetId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v85, v21);
  v23 = v85;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v84 = (WTF::JSONImpl::Object *)v86[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v84, (const WTF::String *)&v83);
  v24 = v83;
  v83 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v24 -= 2;
    }
  }
  v25 = v84;
  v84 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      v25 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v84, v25);
  v26 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  MEMORY[0x22A6705C0](v86, a3);
  WTF::JSONImpl::ObjectBase::setString(v26, (const WTF::String *)&v83, (const WTF::String *)v86);
  v27 = (_DWORD *)v86[0];
  v86[0] = 0;
  if (v27)
  {
    if (*v27 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v27 -= 2;
    }
  }
  v28 = v83;
  v83 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v28 -= 2;
    }
  }
  v29 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  MEMORY[0x22A6705C0](v86, a4);
  WTF::JSONImpl::ObjectBase::setString(v29, (const WTF::String *)&v83, (const WTF::String *)v86);
  v30 = (_DWORD *)v86[0];
  v86[0] = 0;
  if (v30)
  {
    if (*v30 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v30 -= 2;
    }
  }
  v31 = v83;
  v83 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v31 -= 2;
    }
  }
  v32 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  MEMORY[0x22A6705C0](v86, a5);
  WTF::JSONImpl::ObjectBase::setString(v32, (const WTF::String *)&v83, (const WTF::String *)v86);
  v33 = (_DWORD *)v86[0];
  v86[0] = 0;
  if (v33)
  {
    if (*v33 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v33 -= 2;
    }
  }
  v34 = v83;
  v83 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v34 -= 2;
    }
  }
  v35 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  MEMORY[0x22A6705C0](v86, a6);
  WTF::JSONImpl::ObjectBase::setString(v35, (const WTF::String *)&v83, (const WTF::String *)v86);
  v36 = (_DWORD *)v86[0];
  v86[0] = 0;
  if (v36)
  {
    if (*v36 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v36 -= 2;
    }
  }
  v37 = v83;
  v83 = 0;
  if (v37)
  {
    if (*(_DWORD *)v37 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v37 -= 2;
    }
  }
  uint64_t v38 = (uint64_t)v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  if (a7)
  {
    [a7 toJSONObject];
    uint64_t v39 = v81;
  }
  else
  {
    uint64_t v39 = 0;
  }
  v82 = (_DWORD *)v39;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v38 + 16), &v83, (uint64_t *)&v82, (uint64_t)v86);
  if (v87)
  {
    v40 = (uint64_t *)(v38 + 24);
    uint64_t v41 = *(unsigned int *)(v38 + 36);
    if (v41 == *(_DWORD *)(v38 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v40, (unint64_t)&v83);
    }
    else
    {
      uint64_t v42 = *v40;
      v43 = v83;
      if (v83) {
        *(_DWORD *)v83 += 2;
      }
      *(void *)(v42 + 8 * v41) = v43;
      *(_DWORD *)(v38 + 36) = v41 + 1;
    }
  }
  v44 = v82;
  v82 = 0;
  if (v44)
  {
    if (*v44 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v44;
    }
  }
  v45 = v83;
  v83 = 0;
  if (v45)
  {
    if (*(_DWORD *)v45 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v45 -= 2;
    }
  }
  v46 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  WTF::JSONImpl::ObjectBase::setDouble(v46, &v83, a8);
  v47 = v83;
  v83 = 0;
  if (v47)
  {
    if (*(_DWORD *)v47 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v47 -= 2;
    }
  }
  v48 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  WTF::JSONImpl::ObjectBase::setDouble(v48, &v83, a9);
  v49 = v83;
  v83 = 0;
  if (v49)
  {
    if (*(_DWORD *)v49 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v49 -= 2;
    }
  }
  uint64_t v50 = (uint64_t)v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  if (a10) {
    [a10 toJSONObject];
  }
  v82 = 0;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v50 + 16), &v83, (uint64_t *)&v82, (uint64_t)v86);
  if (v87)
  {
    v51 = (uint64_t *)(v50 + 24);
    uint64_t v52 = *(unsigned int *)(v50 + 36);
    if (v52 == *(_DWORD *)(v50 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v51, (unint64_t)&v83);
    }
    else
    {
      uint64_t v53 = *v51;
      v54 = v83;
      if (v83) {
        *(_DWORD *)v83 += 2;
      }
      *(void *)(v53 + 8 * v52) = v54;
      *(_DWORD *)(v50 + 36) = v52 + 1;
    }
  }
  v55 = v82;
  v82 = 0;
  if (v55)
  {
    if (*v55 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v55;
    }
  }
  v56 = v83;
  v83 = 0;
  if (v56)
  {
    if (*(_DWORD *)v56 == 2)
    {
      WTF::StringImpl::destroy();
      if (!a11) {
        goto LABEL_118;
      }
      goto LABEL_102;
    }
    *(_DWORD *)v56 -= 2;
  }
  if (!a11) {
    goto LABEL_118;
  }
LABEL_102:
  uint64_t v57 = (uint64_t)v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  if (*a11) {
    [*a11 toJSONObject];
  }
  v82 = 0;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v57 + 16), &v83, (uint64_t *)&v82, (uint64_t)v86);
  if (v87)
  {
    v58 = (uint64_t *)(v57 + 24);
    uint64_t v59 = *(unsigned int *)(v57 + 36);
    if (v59 == *(_DWORD *)(v57 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v58, (unint64_t)&v83);
    }
    else
    {
      uint64_t v60 = *v58;
      v61 = v83;
      if (v83) {
        *(_DWORD *)v83 += 2;
      }
      *(void *)(v60 + 8 * v59) = v61;
      *(_DWORD *)(v57 + 36) = v59 + 1;
    }
  }
  v62 = v82;
  v82 = 0;
  if (v62)
  {
    if (*v62 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v62;
    }
  }
  v63 = v83;
  v83 = 0;
  if (v63)
  {
    if (*(_DWORD *)v63 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v63 -= 2;
    }
  }
LABEL_118:
  if (a12)
  {
    v64 = v84;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v83 = (WTF::StringImpl *)v86[0];
    Inspector::toProtocolString(v86);
    WTF::JSONImpl::ObjectBase::setString(v64, (const WTF::String *)&v83, (const WTF::String *)v86);
    v65 = (_DWORD *)v86[0];
    v86[0] = 0;
    if (v65)
    {
      if (*v65 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v65 -= 2;
      }
    }
    v66 = v83;
    v83 = 0;
    if (v66)
    {
      if (*(_DWORD *)v66 == 2)
      {
        WTF::StringImpl::destroy();
        if (!a13) {
          goto LABEL_137;
        }
        goto LABEL_127;
      }
      *(_DWORD *)v66 -= 2;
    }
  }
  if (!a13) {
    goto LABEL_137;
  }
LABEL_127:
  v67 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::StringImpl *)v86[0];
  MEMORY[0x22A6705C0](v86, *a13);
  WTF::JSONImpl::ObjectBase::setString(v67, (const WTF::String *)&v83, (const WTF::String *)v86);
  v68 = (_DWORD *)v86[0];
  v86[0] = 0;
  if (v68)
  {
    if (*v68 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v68 -= 2;
    }
  }
  v69 = v83;
  v83 = 0;
  if (v69)
  {
    if (*(_DWORD *)v69 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v69 -= 2;
    }
  }
LABEL_137:
  v70 = v85;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v71 = (uint64_t)v84;
  v83 = (WTF::StringImpl *)v86[0];
  v84 = 0;
  v82 = (_DWORD *)v71;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v70 + 2, &v83, (uint64_t *)&v82, (uint64_t)v86);
  if (v87)
  {
    v72 = (uint64_t *)((char *)v70 + 24);
    uint64_t v73 = *((unsigned int *)v70 + 9);
    if (v73 == *((_DWORD *)v70 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v72, (unint64_t)&v83);
    }
    else
    {
      uint64_t v74 = *v72;
      v75 = v83;
      if (v83) {
        *(_DWORD *)v83 += 2;
      }
      *(void *)(v74 + 8 * v73) = v75;
      *((_DWORD *)v70 + 9) = v73 + 1;
    }
  }
  v76 = v82;
  v82 = 0;
  if (v76)
  {
    if (*v76 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v76;
    }
  }
  v77 = v83;
  v83 = 0;
  if (v77)
  {
    if (*(_DWORD *)v77 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v77 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v86, v85);
  Inspector::FrontendRouter::sendEvent(v22, (const WTF::String *)v86);
  v78 = (_DWORD *)v86[0];
  v86[0] = 0;
  if (v78)
  {
    if (*v78 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v78 -= 2;
    }
  }
  v79 = v84;
  v84 = 0;
  if (v79)
  {
    if (*(_DWORD *)v79 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v79;
    }
  }
  v80 = v85;
  v85 = 0;
  if (v80)
  {
    if (*(_DWORD *)v80 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v80;
    }
  }
}

- (void)responseReceivedWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 timestamp:(double)a6 type:(int64_t)a7 response:(id)a8
{
  v13 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v14 = v13;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
LABEL_10:
      v13 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"loaderId" format];
      if (a8) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v13 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  if (!a5) {
    goto LABEL_10;
  }
LABEL_4:
  if (a8) {
    goto LABEL_5;
  }
LABEL_11:
  v13 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"response" format];
LABEL_5:
  WTF::JSONImpl::Object::create((uint64_t *)&v55, v13);
  v15 = v55;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v54 = (WTF::JSONImpl::Object *)v56[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  WTF::JSONImpl::ObjectBase::setString(v15, (const WTF::String *)&v54, (const WTF::String *)&v53);
  v16 = v53;
  uint64_t v53 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  v17 = v54;
  v54 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      v17 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v54, v17);
  v18 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  MEMORY[0x22A6705C0](v56, a3);
  WTF::JSONImpl::ObjectBase::setString(v18, (const WTF::String *)&v53, (const WTF::String *)v56);
  v19 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v19)
  {
    if (*v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v19 -= 2;
    }
  }
  v20 = v53;
  uint64_t v53 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  v21 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  MEMORY[0x22A6705C0](v56, a4);
  WTF::JSONImpl::ObjectBase::setString(v21, (const WTF::String *)&v53, (const WTF::String *)v56);
  v22 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v22)
  {
    if (*v22 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v22 -= 2;
    }
  }
  v23 = v53;
  uint64_t v53 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  v24 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  MEMORY[0x22A6705C0](v56, a5);
  WTF::JSONImpl::ObjectBase::setString(v24, (const WTF::String *)&v53, (const WTF::String *)v56);
  v25 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v25)
  {
    if (*v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v25 -= 2;
    }
  }
  v26 = v53;
  uint64_t v53 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v26 -= 2;
    }
  }
  v27 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  WTF::JSONImpl::ObjectBase::setDouble(v27, &v53, a6);
  v28 = v53;
  uint64_t v53 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v28 -= 2;
    }
  }
  v29 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  Inspector::toProtocolString(v56);
  WTF::JSONImpl::ObjectBase::setString(v29, (const WTF::String *)&v53, (const WTF::String *)v56);
  v30 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v30)
  {
    if (*v30 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v30 -= 2;
    }
  }
  v31 = v53;
  uint64_t v53 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v31 -= 2;
    }
  }
  uint64_t v32 = (uint64_t)v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  if (a8)
  {
    [a8 toJSONObject];
    uint64_t v33 = v51;
  }
  else
  {
    uint64_t v33 = 0;
  }
  uint64_t v52 = (_DWORD *)v33;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v32 + 16), &v53, (uint64_t *)&v52, (uint64_t)v56);
  if (v57)
  {
    v34 = (uint64_t *)(v32 + 24);
    uint64_t v35 = *(unsigned int *)(v32 + 36);
    if (v35 == *(_DWORD *)(v32 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v34, (unint64_t)&v53);
    }
    else
    {
      uint64_t v36 = *v34;
      v37 = v53;
      if (v53) {
        *(_DWORD *)v53 += 2;
      }
      *(void *)(v36 + 8 * v35) = v37;
      *(_DWORD *)(v32 + 36) = v35 + 1;
    }
  }
  uint64_t v38 = v52;
  uint64_t v52 = 0;
  if (v38)
  {
    if (*v38 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v38;
    }
  }
  uint64_t v39 = v53;
  uint64_t v53 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v39 -= 2;
    }
  }
  v40 = v55;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v41 = (uint64_t)v54;
  uint64_t v53 = (WTF::StringImpl *)v56[0];
  v54 = 0;
  uint64_t v52 = (_DWORD *)v41;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v40 + 2, &v53, (uint64_t *)&v52, (uint64_t)v56);
  if (v57)
  {
    uint64_t v42 = (uint64_t *)((char *)v40 + 24);
    uint64_t v43 = *((unsigned int *)v40 + 9);
    if (v43 == *((_DWORD *)v40 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v42, (unint64_t)&v53);
    }
    else
    {
      uint64_t v44 = *v42;
      v45 = v53;
      if (v53) {
        *(_DWORD *)v53 += 2;
      }
      *(void *)(v44 + 8 * v43) = v45;
      *((_DWORD *)v40 + 9) = v43 + 1;
    }
  }
  v46 = v52;
  uint64_t v52 = 0;
  if (v46)
  {
    if (*v46 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v46;
    }
  }
  v47 = v53;
  uint64_t v53 = 0;
  if (v47)
  {
    if (*(_DWORD *)v47 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v47 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v56, v55);
  Inspector::FrontendRouter::sendEvent(v14, (const WTF::String *)v56);
  v48 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v48)
  {
    if (*v48 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v48 -= 2;
    }
  }
  v49 = v54;
  v54 = 0;
  if (v49)
  {
    if (*(_DWORD *)v49 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v49;
    }
  }
  uint64_t v50 = v55;
  v55 = 0;
  if (v50)
  {
    if (*(_DWORD *)v50 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v50;
    }
  }
}

- (void)dataReceivedWithRequestId:(id)a3 timestamp:(double)a4 dataLength:(int)a5 encodedDataLength:(int)a6
{
  v6 = *(WTF::JSONImpl::Value **)&a6;
  v7 = *(WTF::JSONImpl::Value **)&a5;
  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (!a3) {
    v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v38, v10);
  v12 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::JSONImpl::Object *)v39[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v36 = (WTF::StringImpl *)v39[0];
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v37, (const WTF::String *)&v36);
  v13 = v36;
  uint64_t v36 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  v14 = v37;
  v37 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      v14 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v37, v14);
  v15 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v36 = (WTF::StringImpl *)v39[0];
  MEMORY[0x22A6705C0](v39, a3);
  WTF::JSONImpl::ObjectBase::setString(v15, (const WTF::String *)&v36, (const WTF::String *)v39);
  v16 = (_DWORD *)v39[0];
  v39[0] = 0;
  if (v16)
  {
    if (*v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v16 -= 2;
    }
  }
  v17 = v36;
  uint64_t v36 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  v18 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v36 = (WTF::StringImpl *)v39[0];
  WTF::JSONImpl::ObjectBase::setDouble(v18, &v36, a4);
  v19 = v36;
  uint64_t v36 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  v20 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v36 = (WTF::StringImpl *)v39[0];
  WTF::JSONImpl::ObjectBase::setInteger(v20, &v36, v7);
  v21 = v36;
  uint64_t v36 = 0;
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
  uint64_t v36 = (WTF::StringImpl *)v39[0];
  WTF::JSONImpl::ObjectBase::setInteger(v22, &v36, v6);
  v23 = v36;
  uint64_t v36 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  v24 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v25 = (uint64_t)v37;
  uint64_t v36 = (WTF::StringImpl *)v39[0];
  v37 = 0;
  uint64_t v35 = (_DWORD *)v25;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v24 + 2, &v36, (uint64_t *)&v35, (uint64_t)v39);
  if (v40)
  {
    v26 = (uint64_t *)((char *)v24 + 24);
    uint64_t v27 = *((unsigned int *)v24 + 9);
    if (v27 == *((_DWORD *)v24 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v26, (unint64_t)&v36);
    }
    else
    {
      uint64_t v28 = *v26;
      v29 = v36;
      if (v36) {
        *(_DWORD *)v36 += 2;
      }
      *(void *)(v28 + 8 * v27) = v29;
      *((_DWORD *)v24 + 9) = v27 + 1;
    }
  }
  v30 = v35;
  uint64_t v35 = 0;
  if (v30)
  {
    if (*v30 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v30;
    }
  }
  v31 = v36;
  uint64_t v36 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v31 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v39, v38);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v39);
  uint64_t v32 = (_DWORD *)v39[0];
  v39[0] = 0;
  if (v32)
  {
    if (*v32 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v32 -= 2;
    }
  }
  uint64_t v33 = v37;
  v37 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v33;
    }
  }
  v34 = v38;
  uint64_t v38 = 0;
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

- (void)loadingFinishedWithRequestId:(id)a3 timestamp:(double)a4 sourceMapURL:(id *)a5 metrics:(id *)a6
{
  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (!a3) {
    v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
  }
  if (a5 && !*a5) {
    v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"sourceMapURL" format];
  }
  if (a6 && !*a6) {
    v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"metrics" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v46, v10);
  v12 = v46;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v45 = (WTF::JSONImpl::Object *)v47[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v44 = (WTF::StringImpl *)v47[0];
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v45, (const WTF::String *)&v44);
  v13 = v44;
  uint64_t v44 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  v14 = v45;
  v45 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      v14 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v45, v14);
  v15 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v44 = (WTF::StringImpl *)v47[0];
  MEMORY[0x22A6705C0](v47, a3);
  WTF::JSONImpl::ObjectBase::setString(v15, (const WTF::String *)&v44, (const WTF::String *)v47);
  v16 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v16)
  {
    if (*v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v16 -= 2;
    }
  }
  v17 = v44;
  uint64_t v44 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  v18 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v44 = (WTF::StringImpl *)v47[0];
  WTF::JSONImpl::ObjectBase::setDouble(v18, &v44, a4);
  v19 = v44;
  uint64_t v44 = 0;
  if (!v19)
  {
LABEL_28:
    if (!a5) {
      goto LABEL_38;
    }
    goto LABEL_31;
  }
  if (*(_DWORD *)v19 != 2)
  {
    *(_DWORD *)v19 -= 2;
    goto LABEL_28;
  }
  WTF::StringImpl::destroy();
  if (!a5) {
    goto LABEL_38;
  }
LABEL_31:
  v20 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v44 = (WTF::StringImpl *)v47[0];
  MEMORY[0x22A6705C0](v47, *a5);
  WTF::JSONImpl::ObjectBase::setString(v20, (const WTF::String *)&v44, (const WTF::String *)v47);
  v21 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v21)
  {
    if (*v21 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v21 -= 2;
    }
  }
  v22 = v44;
  uint64_t v44 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
    {
      WTF::StringImpl::destroy();
      if (!a6) {
        goto LABEL_58;
      }
      goto LABEL_39;
    }
    *(_DWORD *)v22 -= 2;
  }
LABEL_38:
  if (!a6) {
    goto LABEL_58;
  }
LABEL_39:
  uint64_t v23 = (uint64_t)v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v44 = (WTF::StringImpl *)v47[0];
  if (*a6)
  {
    [*a6 toJSONObject];
    uint64_t v24 = v42;
  }
  else
  {
    uint64_t v24 = 0;
  }
  uint64_t v43 = (_DWORD *)v24;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v23 + 16), &v44, (uint64_t *)&v43, (uint64_t)v47);
  if (v48)
  {
    uint64_t v25 = (uint64_t *)(v23 + 24);
    uint64_t v26 = *(unsigned int *)(v23 + 36);
    if (v26 == *(_DWORD *)(v23 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v25, (unint64_t)&v44);
    }
    else
    {
      uint64_t v27 = *v25;
      uint64_t v28 = v44;
      if (v44) {
        *(_DWORD *)v44 += 2;
      }
      *(void *)(v27 + 8 * v26) = v28;
      *(_DWORD *)(v23 + 36) = v26 + 1;
    }
  }
  v29 = v43;
  uint64_t v43 = 0;
  if (v29)
  {
    if (*v29 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v29;
    }
  }
  v30 = v44;
  uint64_t v44 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v30 -= 2;
    }
  }
LABEL_58:
  v31 = v46;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v32 = (uint64_t)v45;
  uint64_t v44 = (WTF::StringImpl *)v47[0];
  v45 = 0;
  uint64_t v43 = (_DWORD *)v32;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v31 + 2, &v44, (uint64_t *)&v43, (uint64_t)v47);
  if (v48)
  {
    uint64_t v33 = (uint64_t *)((char *)v31 + 24);
    uint64_t v34 = *((unsigned int *)v31 + 9);
    if (v34 == *((_DWORD *)v31 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v33, (unint64_t)&v44);
    }
    else
    {
      uint64_t v35 = *v33;
      uint64_t v36 = v44;
      if (v44) {
        *(_DWORD *)v44 += 2;
      }
      *(void *)(v35 + 8 * v34) = v36;
      *((_DWORD *)v31 + 9) = v34 + 1;
    }
  }
  v37 = v43;
  uint64_t v43 = 0;
  if (v37)
  {
    if (*v37 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v37;
    }
  }
  uint64_t v38 = v44;
  uint64_t v44 = 0;
  if (v38)
  {
    if (*(_DWORD *)v38 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v38 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v47, v46);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v47);
  uint64_t v39 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v39)
  {
    if (*v39 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v39 -= 2;
    }
  }
  char v40 = v45;
  v45 = 0;
  if (v40)
  {
    if (*(_DWORD *)v40 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v40;
    }
  }
  uint64_t v41 = v46;
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
}

- (void)loadingFailedWithRequestId:(id)a3 timestamp:(double)a4 errorText:(id)a5 canceled:(BOOL *)a6
{
  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a5) {
      goto LABEL_3;
    }
  }
  v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"errorText" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v39, v10);
  v12 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v38 = (WTF::JSONImpl::Object *)v40[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v38, (const WTF::String *)&v37);
  v13 = v37;
  v37 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  v14 = v38;
  uint64_t v38 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      v14 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v38, v14);
  v15 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  MEMORY[0x22A6705C0](v40, a3);
  WTF::JSONImpl::ObjectBase::setString(v15, (const WTF::String *)&v37, (const WTF::String *)v40);
  v16 = (_DWORD *)v40[0];
  v40[0] = 0;
  if (v16)
  {
    if (*v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v16 -= 2;
    }
  }
  v17 = v37;
  v37 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  v18 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  WTF::JSONImpl::ObjectBase::setDouble(v18, &v37, a4);
  v19 = v37;
  v37 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  v20 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  MEMORY[0x22A6705C0](v40, a5);
  WTF::JSONImpl::ObjectBase::setString(v20, (const WTF::String *)&v37, (const WTF::String *)v40);
  v21 = (_DWORD *)v40[0];
  v40[0] = 0;
  if (v21)
  {
    if (*v21 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v21 -= 2;
    }
  }
  v22 = v37;
  v37 = 0;
  if (!v22)
  {
LABEL_32:
    if (!a6) {
      goto LABEL_39;
    }
    goto LABEL_35;
  }
  if (*(_DWORD *)v22 != 2)
  {
    *(_DWORD *)v22 -= 2;
    goto LABEL_32;
  }
  WTF::StringImpl::destroy();
  if (!a6) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v23 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  WTF::JSONImpl::ObjectBase::setBoolean(v23, &v37, (WTF::JSONImpl::Value *)*a6);
  uint64_t v24 = v37;
  v37 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v24 -= 2;
    }
  }
LABEL_39:
  uint64_t v25 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v26 = (uint64_t)v38;
  v37 = (WTF::StringImpl *)v40[0];
  uint64_t v38 = 0;
  uint64_t v36 = (_DWORD *)v26;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v25 + 2, &v37, (uint64_t *)&v36, (uint64_t)v40);
  if (v41)
  {
    uint64_t v27 = (uint64_t *)((char *)v25 + 24);
    uint64_t v28 = *((unsigned int *)v25 + 9);
    if (v28 == *((_DWORD *)v25 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v27, (unint64_t)&v37);
    }
    else
    {
      uint64_t v29 = *v27;
      v30 = v37;
      if (v37) {
        *(_DWORD *)v37 += 2;
      }
      *(void *)(v29 + 8 * v28) = v30;
      *((_DWORD *)v25 + 9) = v28 + 1;
    }
  }
  v31 = v36;
  uint64_t v36 = 0;
  if (v31)
  {
    if (*v31 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v31;
    }
  }
  uint64_t v32 = v37;
  v37 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v32 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v40, v39);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v40);
  uint64_t v33 = (_DWORD *)v40[0];
  v40[0] = 0;
  if (v33)
  {
    if (*v33 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v33 -= 2;
    }
  }
  uint64_t v34 = v38;
  uint64_t v38 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v34;
    }
  }
  uint64_t v35 = v39;
  uint64_t v39 = 0;
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

- (void)requestServedFromMemoryCacheWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 documentURL:(id)a6 timestamp:(double)a7 initiator:(id)a8 resource:(id)a9
{
  v16 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v17 = v16;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  v16 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameId" format];
  if (a5)
  {
LABEL_4:
    if (a6) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v16 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"loaderId" format];
  if (a6)
  {
LABEL_5:
    if (a8) {
      goto LABEL_6;
    }
LABEL_14:
    v16 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"initiator" format];
    if (a9) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_13:
  v16 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"documentURL" format];
  if (!a8) {
    goto LABEL_14;
  }
LABEL_6:
  if (a9) {
    goto LABEL_7;
  }
LABEL_15:
  v16 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"resource" format];
LABEL_7:
  WTF::JSONImpl::Object::create((uint64_t *)&v65, v16);
  v18 = v65;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v64 = (WTF::JSONImpl::Object *)v66[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  WTF::JSONImpl::ObjectBase::setString(v18, (const WTF::String *)&v64, (const WTF::String *)&v63);
  v19 = v63;
  v63 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  v20 = v64;
  v64 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      v20 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v64, v20);
  v21 = v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  MEMORY[0x22A6705C0](v66, a3);
  WTF::JSONImpl::ObjectBase::setString(v21, (const WTF::String *)&v63, (const WTF::String *)v66);
  v22 = (_DWORD *)v66[0];
  v66[0] = 0;
  if (v22)
  {
    if (*v22 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v22 -= 2;
    }
  }
  uint64_t v23 = v63;
  v63 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  uint64_t v24 = v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  MEMORY[0x22A6705C0](v66, a4);
  WTF::JSONImpl::ObjectBase::setString(v24, (const WTF::String *)&v63, (const WTF::String *)v66);
  uint64_t v25 = (_DWORD *)v66[0];
  v66[0] = 0;
  if (v25)
  {
    if (*v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v25 -= 2;
    }
  }
  uint64_t v26 = v63;
  v63 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v26 -= 2;
    }
  }
  uint64_t v27 = v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  MEMORY[0x22A6705C0](v66, a5);
  WTF::JSONImpl::ObjectBase::setString(v27, (const WTF::String *)&v63, (const WTF::String *)v66);
  uint64_t v28 = (_DWORD *)v66[0];
  v66[0] = 0;
  if (v28)
  {
    if (*v28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v28 -= 2;
    }
  }
  uint64_t v29 = v63;
  v63 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v29 -= 2;
    }
  }
  v30 = v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  MEMORY[0x22A6705C0](v66, a6);
  WTF::JSONImpl::ObjectBase::setString(v30, (const WTF::String *)&v63, (const WTF::String *)v66);
  v31 = (_DWORD *)v66[0];
  v66[0] = 0;
  if (v31)
  {
    if (*v31 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v31 -= 2;
    }
  }
  uint64_t v32 = v63;
  v63 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v32 -= 2;
    }
  }
  uint64_t v33 = v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  WTF::JSONImpl::ObjectBase::setDouble(v33, &v63, a7);
  uint64_t v34 = v63;
  v63 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v34 -= 2;
    }
  }
  uint64_t v35 = (uint64_t)v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  if (a8)
  {
    [a8 toJSONObject];
    uint64_t v36 = v61;
  }
  else
  {
    uint64_t v36 = 0;
  }
  v62 = (_DWORD *)v36;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v35 + 16), &v63, (uint64_t *)&v62, (uint64_t)v66);
  if (v67)
  {
    v37 = (uint64_t *)(v35 + 24);
    uint64_t v38 = *(unsigned int *)(v35 + 36);
    if (v38 == *(_DWORD *)(v35 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v37, (unint64_t)&v63);
    }
    else
    {
      uint64_t v39 = *v37;
      char v40 = v63;
      if (v63) {
        *(_DWORD *)v63 += 2;
      }
      *(void *)(v39 + 8 * v38) = v40;
      *(_DWORD *)(v35 + 36) = v38 + 1;
    }
  }
  char v41 = v62;
  v62 = 0;
  if (v41)
  {
    if (*v41 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v41;
    }
  }
  uint64_t v42 = v63;
  v63 = 0;
  if (v42)
  {
    if (*(_DWORD *)v42 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v42 -= 2;
    }
  }
  uint64_t v43 = (uint64_t)v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::StringImpl *)v66[0];
  if (a9) {
    [a9 toJSONObject];
  }
  v62 = 0;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v43 + 16), &v63, (uint64_t *)&v62, (uint64_t)v66);
  if (v67)
  {
    uint64_t v44 = (uint64_t *)(v43 + 24);
    uint64_t v45 = *(unsigned int *)(v43 + 36);
    if (v45 == *(_DWORD *)(v43 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v44, (unint64_t)&v63);
    }
    else
    {
      uint64_t v46 = *v44;
      v47 = v63;
      if (v63) {
        *(_DWORD *)v63 += 2;
      }
      *(void *)(v46 + 8 * v45) = v47;
      *(_DWORD *)(v43 + 36) = v45 + 1;
    }
  }
  char v48 = v62;
  v62 = 0;
  if (v48)
  {
    if (*v48 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v48;
    }
  }
  v49 = v63;
  v63 = 0;
  if (v49)
  {
    if (*(_DWORD *)v49 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v49 -= 2;
    }
  }
  uint64_t v50 = v65;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v51 = (uint64_t)v64;
  v63 = (WTF::StringImpl *)v66[0];
  v64 = 0;
  v62 = (_DWORD *)v51;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v50 + 2, &v63, (uint64_t *)&v62, (uint64_t)v66);
  if (v67)
  {
    uint64_t v52 = (uint64_t *)((char *)v50 + 24);
    uint64_t v53 = *((unsigned int *)v50 + 9);
    if (v53 == *((_DWORD *)v50 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v52, (unint64_t)&v63);
    }
    else
    {
      uint64_t v54 = *v52;
      v55 = v63;
      if (v63) {
        *(_DWORD *)v63 += 2;
      }
      *(void *)(v54 + 8 * v53) = v55;
      *((_DWORD *)v50 + 9) = v53 + 1;
    }
  }
  v56 = v62;
  v62 = 0;
  if (v56)
  {
    if (*v56 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v56;
    }
  }
  char v57 = v63;
  v63 = 0;
  if (v57)
  {
    if (*(_DWORD *)v57 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v57 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v66, v65);
  Inspector::FrontendRouter::sendEvent(v17, (const WTF::String *)v66);
  v58 = (_DWORD *)v66[0];
  v66[0] = 0;
  if (v58)
  {
    if (*v58 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v58 -= 2;
    }
  }
  uint64_t v59 = v64;
  v64 = 0;
  if (v59)
  {
    if (*(_DWORD *)v59 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v59;
    }
  }
  uint64_t v60 = v65;
  v65 = 0;
  if (v60)
  {
    if (*(_DWORD *)v60 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v60;
    }
  }
}

- (void)requestInterceptedWithRequestId:(id)a3 request:(id)a4
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
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a4) {
      goto LABEL_3;
    }
  }
  v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"request" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v37, v6);
  v8 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v36 = (WTF::JSONImpl::Object *)v38[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v36, (const WTF::String *)&v35);
  v9 = v35;
  uint64_t v35 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  v10 = v36;
  uint64_t v36 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v36, v10);
  v11 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  MEMORY[0x22A6705C0](v38, a3);
  WTF::JSONImpl::ObjectBase::setString(v11, (const WTF::String *)&v35, (const WTF::String *)v38);
  v12 = (_DWORD *)v38[0];
  v38[0] = 0;
  if (v12)
  {
    if (*v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v12 -= 2;
    }
  }
  v13 = v35;
  uint64_t v35 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = (uint64_t)v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  if (a4)
  {
    [a4 toJSONObject];
    uint64_t v15 = v33;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v34 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v14 + 16), &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    v16 = (uint64_t *)(v14 + 24);
    uint64_t v17 = *(unsigned int *)(v14 + 36);
    if (v17 == *(_DWORD *)(v14 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v35);
    }
    else
    {
      uint64_t v18 = *v16;
      v19 = v35;
      if (v35) {
        *(_DWORD *)v35 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *(_DWORD *)(v14 + 36) = v17 + 1;
    }
  }
  v20 = v34;
  uint64_t v34 = 0;
  if (v20)
  {
    if (*v20 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v20;
    }
  }
  v21 = v35;
  uint64_t v35 = 0;
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
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  uint64_t v36 = 0;
  uint64_t v34 = (_DWORD *)v23;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v22 + 2, &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    uint64_t v24 = (uint64_t *)((char *)v22 + 24);
    uint64_t v25 = *((unsigned int *)v22 + 9);
    if (v25 == *((_DWORD *)v22 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v24, (unint64_t)&v35);
    }
    else
    {
      uint64_t v26 = *v24;
      uint64_t v27 = v35;
      if (v35) {
        *(_DWORD *)v35 += 2;
      }
      *(void *)(v26 + 8 * v25) = v27;
      *((_DWORD *)v22 + 9) = v25 + 1;
    }
  }
  uint64_t v28 = v34;
  uint64_t v34 = 0;
  if (v28)
  {
    if (*v28 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v28;
    }
  }
  uint64_t v29 = v35;
  uint64_t v35 = 0;
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
  uint64_t v32 = v37;
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

- (void)responseInterceptedWithRequestId:(id)a3 response:(id)a4
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
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a4) {
      goto LABEL_3;
    }
  }
  v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"response" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v37, v6);
  v8 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v36 = (WTF::JSONImpl::Object *)v38[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v36, (const WTF::String *)&v35);
  v9 = v35;
  uint64_t v35 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  v10 = v36;
  uint64_t v36 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v36, v10);
  v11 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  MEMORY[0x22A6705C0](v38, a3);
  WTF::JSONImpl::ObjectBase::setString(v11, (const WTF::String *)&v35, (const WTF::String *)v38);
  v12 = (_DWORD *)v38[0];
  v38[0] = 0;
  if (v12)
  {
    if (*v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v12 -= 2;
    }
  }
  v13 = v35;
  uint64_t v35 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = (uint64_t)v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  if (a4)
  {
    [a4 toJSONObject];
    uint64_t v15 = v33;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v34 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v14 + 16), &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    v16 = (uint64_t *)(v14 + 24);
    uint64_t v17 = *(unsigned int *)(v14 + 36);
    if (v17 == *(_DWORD *)(v14 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v35);
    }
    else
    {
      uint64_t v18 = *v16;
      v19 = v35;
      if (v35) {
        *(_DWORD *)v35 += 2;
      }
      *(void *)(v18 + 8 * v17) = v19;
      *(_DWORD *)(v14 + 36) = v17 + 1;
    }
  }
  v20 = v34;
  uint64_t v34 = 0;
  if (v20)
  {
    if (*v20 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v20;
    }
  }
  v21 = v35;
  uint64_t v35 = 0;
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
  uint64_t v35 = (WTF::StringImpl *)v38[0];
  uint64_t v36 = 0;
  uint64_t v34 = (_DWORD *)v23;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v22 + 2, &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    uint64_t v24 = (uint64_t *)((char *)v22 + 24);
    uint64_t v25 = *((unsigned int *)v22 + 9);
    if (v25 == *((_DWORD *)v22 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v24, (unint64_t)&v35);
    }
    else
    {
      uint64_t v26 = *v24;
      uint64_t v27 = v35;
      if (v35) {
        *(_DWORD *)v35 += 2;
      }
      *(void *)(v26 + 8 * v25) = v27;
      *((_DWORD *)v22 + 9) = v25 + 1;
    }
  }
  uint64_t v28 = v34;
  uint64_t v34 = 0;
  if (v28)
  {
    if (*v28 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v28;
    }
  }
  uint64_t v29 = v35;
  uint64_t v35 = 0;
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
  uint64_t v32 = v37;
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

- (void)webSocketWillSendHandshakeRequestWithRequestId:(id)a3 timestamp:(double)a4 walltime:(double)a5 request:(id)a6
{
  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (a3)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a6) {
      goto LABEL_3;
    }
  }
  v10 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"request" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v45, v10);
  v12 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v44 = (WTF::JSONImpl::Object *)v46[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v44, (const WTF::String *)&v43);
  v13 = v43;
  uint64_t v43 = 0;
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
  uint64_t v44 = 0;
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
  uint64_t v43 = (WTF::StringImpl *)v46[0];
  MEMORY[0x22A6705C0](v46, a3);
  WTF::JSONImpl::ObjectBase::setString(v15, (const WTF::String *)&v43, (const WTF::String *)v46);
  v16 = (_DWORD *)v46[0];
  v46[0] = 0;
  if (v16)
  {
    if (*v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v16 -= 2;
    }
  }
  uint64_t v17 = v43;
  uint64_t v43 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setDouble(v18, &v43, a4);
  v19 = v43;
  uint64_t v43 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  v20 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setDouble(v20, &v43, a5);
  v21 = v43;
  uint64_t v43 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  uint64_t v22 = (uint64_t)v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v43 = (WTF::StringImpl *)v46[0];
  if (a6)
  {
    [a6 toJSONObject];
    uint64_t v23 = v41;
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v42 = (_DWORD *)v23;
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
      uint64_t v27 = v43;
      if (v43) {
        *(_DWORD *)v43 += 2;
      }
      *(void *)(v26 + 8 * v25) = v27;
      *(_DWORD *)(v22 + 36) = v25 + 1;
    }
  }
  uint64_t v28 = v42;
  uint64_t v42 = 0;
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
  uint64_t v43 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v29 -= 2;
    }
  }
  v30 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v31 = (uint64_t)v44;
  uint64_t v43 = (WTF::StringImpl *)v46[0];
  uint64_t v44 = 0;
  uint64_t v42 = (_DWORD *)v31;
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
      uint64_t v35 = v43;
      if (v43) {
        *(_DWORD *)v43 += 2;
      }
      *(void *)(v34 + 8 * v33) = v35;
      *((_DWORD *)v30 + 9) = v33 + 1;
    }
  }
  uint64_t v36 = v42;
  uint64_t v42 = 0;
  if (v36)
  {
    if (*v36 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v36;
    }
  }
  v37 = v43;
  uint64_t v43 = 0;
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
  uint64_t v38 = (_DWORD *)v46[0];
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
  char v39 = v44;
  uint64_t v44 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v39;
    }
  }
  char v40 = v45;
  uint64_t v45 = 0;
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

- (void)webSocketHandshakeResponseReceivedWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5
{
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a5) {
      goto LABEL_3;
    }
  }
  v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"response" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v41, v8);
  v10 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v40 = (WTF::JSONImpl::Object *)v42[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v40, (const WTF::String *)&v39);
  v11 = v39;
  char v39 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  v12 = v40;
  char v40 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      v12 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v40, v12);
  v13 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  MEMORY[0x22A6705C0](v42, a3);
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v39, (const WTF::String *)v42);
  uint64_t v14 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v14)
  {
    if (*v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v14 -= 2;
    }
  }
  uint64_t v15 = v39;
  char v39 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  v16 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  WTF::JSONImpl::ObjectBase::setDouble(v16, &v39, a4);
  uint64_t v17 = v39;
  char v39 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = (uint64_t)v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  if (a5)
  {
    [a5 toJSONObject];
    uint64_t v19 = v37;
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v38 = (_DWORD *)v19;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v18 + 16), &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    v20 = (uint64_t *)(v18 + 24);
    uint64_t v21 = *(unsigned int *)(v18 + 36);
    if (v21 == *(_DWORD *)(v18 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v20, (unint64_t)&v39);
    }
    else
    {
      uint64_t v22 = *v20;
      uint64_t v23 = v39;
      if (v39) {
        *(_DWORD *)v39 += 2;
      }
      *(void *)(v22 + 8 * v21) = v23;
      *(_DWORD *)(v18 + 36) = v21 + 1;
    }
  }
  uint64_t v24 = v38;
  uint64_t v38 = 0;
  if (v24)
  {
    if (*v24 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v24;
    }
  }
  uint64_t v25 = v39;
  char v39 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  uint64_t v26 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v27 = (uint64_t)v40;
  char v39 = (WTF::StringImpl *)v42[0];
  char v40 = 0;
  uint64_t v38 = (_DWORD *)v27;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v26 + 2, &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    uint64_t v28 = (uint64_t *)((char *)v26 + 24);
    uint64_t v29 = *((unsigned int *)v26 + 9);
    if (v29 == *((_DWORD *)v26 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v28, (unint64_t)&v39);
    }
    else
    {
      uint64_t v30 = *v28;
      uint64_t v31 = v39;
      if (v39) {
        *(_DWORD *)v39 += 2;
      }
      *(void *)(v30 + 8 * v29) = v31;
      *((_DWORD *)v26 + 9) = v29 + 1;
    }
  }
  uint64_t v32 = v38;
  uint64_t v38 = 0;
  if (v32)
  {
    if (*v32 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v32;
    }
  }
  uint64_t v33 = v39;
  char v39 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v33 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v42, v41);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v42);
  uint64_t v34 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v34)
  {
    if (*v34 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v34 -= 2;
    }
  }
  uint64_t v35 = v40;
  char v40 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v35;
    }
  }
  uint64_t v36 = v41;
  uint64_t v41 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v36;
    }
  }
}

- (void)webSocketCreatedWithRequestId:(id)a3 url:(id)a4
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
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a4) {
      goto LABEL_3;
    }
  }
  v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"url" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v31, v6);
  v8 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v30 = (WTF::JSONImpl::Object *)v32[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v29 = (WTF::StringImpl *)v32[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v30, (const WTF::String *)&v29);
  v9 = v29;
  uint64_t v29 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  v10 = v30;
  uint64_t v30 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v30, v10);
  v11 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v29 = (WTF::StringImpl *)v32[0];
  MEMORY[0x22A6705C0](v32, a3);
  WTF::JSONImpl::ObjectBase::setString(v11, (const WTF::String *)&v29, (const WTF::String *)v32);
  v12 = (_DWORD *)v32[0];
  v32[0] = 0;
  if (v12)
  {
    if (*v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v12 -= 2;
    }
  }
  v13 = v29;
  uint64_t v29 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v29 = (WTF::StringImpl *)v32[0];
  MEMORY[0x22A6705C0](v32, a4);
  WTF::JSONImpl::ObjectBase::setString(v14, (const WTF::String *)&v29, (const WTF::String *)v32);
  uint64_t v15 = (_DWORD *)v32[0];
  v32[0] = 0;
  if (v15)
  {
    if (*v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v15 -= 2;
    }
  }
  v16 = v29;
  uint64_t v29 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  uint64_t v17 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v18 = (uint64_t)v30;
  uint64_t v29 = (WTF::StringImpl *)v32[0];
  uint64_t v30 = 0;
  uint64_t v28 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v29, (uint64_t *)&v28, (uint64_t)v32);
  if (v33)
  {
    uint64_t v19 = (uint64_t *)((char *)v17 + 24);
    uint64_t v20 = *((unsigned int *)v17 + 9);
    if (v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v29);
    }
    else
    {
      uint64_t v21 = *v19;
      uint64_t v22 = v29;
      if (v29) {
        *(_DWORD *)v29 += 2;
      }
      *(void *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  uint64_t v23 = v28;
  uint64_t v28 = 0;
  if (v23)
  {
    if (*v23 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v23;
    }
  }
  uint64_t v24 = v29;
  uint64_t v29 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v24 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v32, v31);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v32);
  uint64_t v25 = (_DWORD *)v32[0];
  v32[0] = 0;
  if (v25)
  {
    if (*v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v25 -= 2;
    }
  }
  uint64_t v26 = v30;
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
  uint64_t v27 = v31;
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
}

- (void)webSocketClosedWithRequestId:(id)a3 timestamp:(double)a4
{
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (!a3) {
    v6 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v30, v6);
  v8 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v29 = (WTF::JSONImpl::Object *)v31[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v29, (const WTF::String *)&v28);
  v9 = v28;
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
  v10 = v29;
  uint64_t v29 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v29, v10);
  v11 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  MEMORY[0x22A6705C0](v31, a3);
  WTF::JSONImpl::ObjectBase::setString(v11, (const WTF::String *)&v28, (const WTF::String *)v31);
  v12 = (_DWORD *)v31[0];
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
  v13 = v28;
  uint64_t v28 = 0;
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
  uint64_t v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setDouble(v14, &v28, a4);
  uint64_t v15 = v28;
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
  uint64_t v29 = 0;
  uint64_t v27 = (_DWORD *)v17;
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
  uint64_t v27 = 0;
  if (v22)
  {
    if (*v22 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v22;
    }
  }
  uint64_t v23 = v28;
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
  uint64_t v29 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v25;
    }
  }
  uint64_t v26 = v30;
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

- (void)webSocketFrameReceivedWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5
{
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a5) {
      goto LABEL_3;
    }
  }
  v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"response" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v41, v8);
  v10 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v40 = (WTF::JSONImpl::Object *)v42[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v40, (const WTF::String *)&v39);
  v11 = v39;
  char v39 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  v12 = v40;
  char v40 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      v12 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v40, v12);
  v13 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  MEMORY[0x22A6705C0](v42, a3);
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v39, (const WTF::String *)v42);
  uint64_t v14 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v14)
  {
    if (*v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v14 -= 2;
    }
  }
  uint64_t v15 = v39;
  char v39 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  v16 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  WTF::JSONImpl::ObjectBase::setDouble(v16, &v39, a4);
  uint64_t v17 = v39;
  char v39 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = (uint64_t)v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  if (a5)
  {
    [a5 toJSONObject];
    uint64_t v19 = v37;
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v38 = (_DWORD *)v19;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v18 + 16), &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    uint64_t v20 = (uint64_t *)(v18 + 24);
    uint64_t v21 = *(unsigned int *)(v18 + 36);
    if (v21 == *(_DWORD *)(v18 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v20, (unint64_t)&v39);
    }
    else
    {
      uint64_t v22 = *v20;
      uint64_t v23 = v39;
      if (v39) {
        *(_DWORD *)v39 += 2;
      }
      *(void *)(v22 + 8 * v21) = v23;
      *(_DWORD *)(v18 + 36) = v21 + 1;
    }
  }
  uint64_t v24 = v38;
  uint64_t v38 = 0;
  if (v24)
  {
    if (*v24 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v24;
    }
  }
  uint64_t v25 = v39;
  char v39 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  uint64_t v26 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v27 = (uint64_t)v40;
  char v39 = (WTF::StringImpl *)v42[0];
  char v40 = 0;
  uint64_t v38 = (_DWORD *)v27;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v26 + 2, &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    uint64_t v28 = (uint64_t *)((char *)v26 + 24);
    uint64_t v29 = *((unsigned int *)v26 + 9);
    if (v29 == *((_DWORD *)v26 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v28, (unint64_t)&v39);
    }
    else
    {
      uint64_t v30 = *v28;
      uint64_t v31 = v39;
      if (v39) {
        *(_DWORD *)v39 += 2;
      }
      *(void *)(v30 + 8 * v29) = v31;
      *((_DWORD *)v26 + 9) = v29 + 1;
    }
  }
  char v32 = v38;
  uint64_t v38 = 0;
  if (v32)
  {
    if (*v32 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v32;
    }
  }
  char v33 = v39;
  char v39 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v33 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v42, v41);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v42);
  uint64_t v34 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v34)
  {
    if (*v34 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v34 -= 2;
    }
  }
  uint64_t v35 = v40;
  char v40 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v35;
    }
  }
  uint64_t v36 = v41;
  uint64_t v41 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v36;
    }
  }
}

- (void)webSocketFrameErrorWithRequestId:(id)a3 timestamp:(double)a4 errorMessage:(id)a5
{
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a5) {
      goto LABEL_3;
    }
  }
  v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"errorMessage" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v35, v8);
  v10 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v34 = (WTF::JSONImpl::Object *)v36[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v34, (const WTF::String *)&v33);
  v11 = v33;
  char v33 = 0;
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
  uint64_t v34 = 0;
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
  v13 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v33 = (WTF::StringImpl *)v36[0];
  MEMORY[0x22A6705C0](v36, a3);
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v33, (const WTF::String *)v36);
  uint64_t v14 = (_DWORD *)v36[0];
  v36[0] = 0;
  if (v14)
  {
    if (*v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v14 -= 2;
    }
  }
  uint64_t v15 = v33;
  char v33 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  v16 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setDouble(v16, &v33, a4);
  uint64_t v17 = v33;
  char v33 = 0;
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
  char v33 = (WTF::StringImpl *)v36[0];
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
  uint64_t v20 = v33;
  char v33 = 0;
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
  char v33 = (WTF::StringImpl *)v36[0];
  uint64_t v34 = 0;
  char v32 = (_DWORD *)v22;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v21 + 2, &v33, (uint64_t *)&v32, (uint64_t)v36);
  if (v37)
  {
    uint64_t v23 = (uint64_t *)((char *)v21 + 24);
    uint64_t v24 = *((unsigned int *)v21 + 9);
    if (v24 == *((_DWORD *)v21 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v23, (unint64_t)&v33);
    }
    else
    {
      uint64_t v25 = *v23;
      uint64_t v26 = v33;
      if (v33) {
        *(_DWORD *)v33 += 2;
      }
      *(void *)(v25 + 8 * v24) = v26;
      *((_DWORD *)v21 + 9) = v24 + 1;
    }
  }
  uint64_t v27 = v32;
  char v32 = 0;
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
  char v33 = 0;
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
  uint64_t v29 = (_DWORD *)v36[0];
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
  uint64_t v34 = 0;
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
  uint64_t v35 = 0;
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

- (void)webSocketFrameSentWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5
{
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"requestId" format];
    if (a5) {
      goto LABEL_3;
    }
  }
  v8 = (WTF::JSONImpl::Object *)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"response" format];
LABEL_3:
  WTF::JSONImpl::Object::create((uint64_t *)&v41, v8);
  v10 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v40 = (WTF::JSONImpl::Object *)v42[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v40, (const WTF::String *)&v39);
  v11 = v39;
  char v39 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  v12 = v40;
  char v40 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      v12 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WTF::JSONImpl::Object::create((uint64_t *)&v40, v12);
  v13 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  MEMORY[0x22A6705C0](v42, a3);
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v39, (const WTF::String *)v42);
  uint64_t v14 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v14)
  {
    if (*v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v14 -= 2;
    }
  }
  uint64_t v15 = v39;
  char v39 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  v16 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  WTF::JSONImpl::ObjectBase::setDouble(v16, &v39, a4);
  uint64_t v17 = v39;
  char v39 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = (uint64_t)v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  char v39 = (WTF::StringImpl *)v42[0];
  if (a5)
  {
    [a5 toJSONObject];
    uint64_t v19 = v37;
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v38 = (_DWORD *)v19;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v18 + 16), &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    uint64_t v20 = (uint64_t *)(v18 + 24);
    uint64_t v21 = *(unsigned int *)(v18 + 36);
    if (v21 == *(_DWORD *)(v18 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v20, (unint64_t)&v39);
    }
    else
    {
      uint64_t v22 = *v20;
      uint64_t v23 = v39;
      if (v39) {
        *(_DWORD *)v39 += 2;
      }
      *(void *)(v22 + 8 * v21) = v23;
      *(_DWORD *)(v18 + 36) = v21 + 1;
    }
  }
  uint64_t v24 = v38;
  uint64_t v38 = 0;
  if (v24)
  {
    if (*v24 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v24;
    }
  }
  uint64_t v25 = v39;
  char v39 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  uint64_t v26 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v27 = (uint64_t)v40;
  char v39 = (WTF::StringImpl *)v42[0];
  char v40 = 0;
  uint64_t v38 = (_DWORD *)v27;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v26 + 2, &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    uint64_t v28 = (uint64_t *)((char *)v26 + 24);
    uint64_t v29 = *((unsigned int *)v26 + 9);
    if (v29 == *((_DWORD *)v26 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v28, (unint64_t)&v39);
    }
    else
    {
      uint64_t v30 = *v28;
      uint64_t v31 = v39;
      if (v39) {
        *(_DWORD *)v39 += 2;
      }
      *(void *)(v30 + 8 * v29) = v31;
      *((_DWORD *)v26 + 9) = v29 + 1;
    }
  }
  char v32 = v38;
  uint64_t v38 = 0;
  if (v32)
  {
    if (*v32 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v32;
    }
  }
  char v33 = v39;
  char v39 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v33 -= 2;
    }
  }
  WTF::JSONImpl::Value::toJSONString(v42, v41);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v42);
  uint64_t v34 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v34)
  {
    if (*v34 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v34 -= 2;
    }
  }
  uint64_t v35 = v40;
  char v40 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v35;
    }
  }
  uint64_t v36 = v41;
  uint64_t v41 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v36;
    }
  }
}

@end