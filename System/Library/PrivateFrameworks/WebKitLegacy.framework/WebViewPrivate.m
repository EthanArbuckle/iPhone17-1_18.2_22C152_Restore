@interface WebViewPrivate
- (WebViewPrivate)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation WebViewPrivate

- (WebViewPrivate)init
{
  v8.receiver = self;
  v8.super_class = (Class)WebViewPrivate;
  v2 = [(WebViewPrivate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->allowsUndo = 1;
    v2->usesPageCache = 1;
    v2->shouldUpdateWhileOffscreen = 1;
    v2->zoomMultiplier = 1.0;
    v2->zoomsTextOnly = 0;
    v2->interactiveFormValidationEnabled = 0;
    v2->validationMessageTimerMagnification = 50;
    v2->isStopping = 0;
    v2->_geolocationProvider = (WebGeolocationProvider *)+[WebGeolocationProviderIOS sharedGeolocationProvider];
    v3->shouldCloseWithWindow = 0;
    ++pluginDatabaseClientCount;
    v5 = (AlternativeTextUIController *)WTF::fastMalloc((WTF *)0x10);
    *(void *)v5 = 0;
    *((void *)v5 + 1) = 0;
    value = (WTF *)v3->m_alternativeTextUIController.__ptr_.__value_;
    v3->m_alternativeTextUIController.__ptr_.__value_ = v5;
    if (value) {
      std::default_delete<WebCore::AlternativeTextUIController>::operator()[abi:sn180100](value, v4);
    }
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WebViewPrivate;
  [(WebViewPrivate *)&v2 dealloc];
}

- (void).cxx_destruct
{
  m_ptr = self->sourceApplicationAuditData.m_ptr;
  self->sourceApplicationAuditData.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  value = self->m_alternativeTextUIController.__ptr_.__value_;
  self->m_alternativeTextUIController.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<WebCore::AlternativeTextUIController>::operator()[abi:sn180100]((WTF *)value, (void *)a2);
  }
  v5 = self->_fixedPositionContent.m_ptr;
  self->_fixedPositionContent.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->indicateLayer.m_ptr;
  self->indicateLayer.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = self->newFullscreenController.m_ptr;
  self->newFullscreenController.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  uint64_t m_size = self->fullscreenControllersExiting.m_size;
  if (m_size)
  {
    m_buffer = (const void **)self->fullscreenControllersExiting.m_buffer;
    uint64_t v10 = 8 * m_size;
    do
    {
      v11 = *m_buffer;
      *m_buffer = 0;
      if (v11) {
        CFRelease(v11);
      }
      ++m_buffer;
      v10 -= 8;
    }
    while (v10);
  }
  v12 = (WTF *)self->fullscreenControllersExiting.m_buffer;
  if (v12)
  {
    self->fullscreenControllersExiting.m_buffer = 0;
    self->fullscreenControllersExiting.m_capacity = 0;
    WTF::fastFree(v12, (void *)a2);
  }
  v13 = self->fullscreenController.m_ptr;
  self->fullscreenController.m_ptr = 0;
  if (v13) {
    CFRelease(v13);
  }
  v14 = self->renderingUpdateScheduler.__ptr_.__value_;
  self->renderingUpdateScheduler.__ptr_.__value_ = 0;
  if (v14)
  {
    WebViewRenderingUpdateScheduler::~WebViewRenderingUpdateScheduler(v14, (void *)a2);
    if (*(_DWORD *)(v15 + 8))
    {
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)uint64_t v15 = 0u;
      m_tableForLLDB = self->identifierMap.m_impl.var0.m_tableForLLDB;
      if (!m_tableForLLDB) {
        goto LABEL_31;
      }
      goto LABEL_24;
    }
    WTF::fastFree((WTF *)v15, (void *)a2);
  }
  m_tableForLLDB = self->identifierMap.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB) {
    goto LABEL_31;
  }
LABEL_24:
  uint64_t v17 = *(m_tableForLLDB - 1);
  if (v17)
  {
    v18 = (const void **)(m_tableForLLDB + 2);
    do
    {
      if (*(v18 - 1) != (const void *)-1)
      {
        v19 = *v18;
        *v18 = 0;
        if (v19) {
          CFRelease(v19);
        }
      }
      v18 += 2;
      --v17;
    }
    while (v17);
  }
  WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
LABEL_31:
  v20 = self->draggedLinkTitle.m_ptr;
  self->draggedLinkTitle.m_ptr = 0;
  if (v20) {
    CFRelease(v20);
  }
  v21 = self->draggedLinkURL.m_ptr;
  self->draggedLinkURL.m_ptr = 0;
  if (v21) {
    CFRelease(v21);
  }
  v22 = self->dataOperationTextIndicator.m_ptr;
  self->dataOperationTextIndicator.m_ptr = 0;
  if (v22) {
    CFRelease(v22);
  }
  v23 = self->textIndicatorData.m_ptr;
  self->textIndicatorData.m_ptr = 0;
  if (v23) {
    CFRelease(v23);
  }
  v24 = self->_caretChangeListeners.m_ptr;
  self->_caretChangeListeners.m_ptr = 0;
  if (v24) {
    CFRelease(v24);
  }
  v25 = self->UIKitDelegateForwarder.m_ptr;
  self->UIKitDelegateForwarder.m_ptr = 0;
  if (v25) {
    CFRelease(v25);
  }
  v26 = self->mediaStyle.m_ptr;
  self->mediaStyle.m_ptr = 0;
  if (v26) {
    CFRelease(v26);
  }
  v27 = self->backgroundColor.m_ptr;
  self->backgroundColor.m_ptr = 0;
  if (v27) {
    CFRelease(v27);
  }
  v28 = self->hostWindow.m_ptr;
  self->hostWindow.m_ptr = 0;
  if (v28) {
    CFRelease(v28);
  }
  v29 = self->preferences.m_ptr;
  self->preferences.m_ptr = 0;
  if (v29) {
    CFRelease(v29);
  }
  v30 = (WTF::StringImpl *)self->userAgent.m_impl.m_ptr;
  self->userAgent.m_impl.m_ptr = 0;
  if (!v30)
  {
LABEL_54:
    v31 = self->applicationNameForUserAgent.m_ptr;
    self->applicationNameForUserAgent.m_ptr = 0;
    if (!v31) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  if (*(_DWORD *)v30 != 2)
  {
    *(_DWORD *)v30 -= 2;
    goto LABEL_54;
  }
  WTF::StringImpl::destroy(v30, (StringImpl *)a2);
  v31 = self->applicationNameForUserAgent.m_ptr;
  self->applicationNameForUserAgent.m_ptr = 0;
  if (v31) {
LABEL_55:
  }
    CFRelease(v31);
LABEL_56:
  v32 = self->formValidationBubble.m_ptr;
  self->formValidationBubble.m_ptr = 0;
  if (!v32) {
    goto LABEL_59;
  }
  if (*(_DWORD *)v32 != 1)
  {
    --*(_DWORD *)v32;
LABEL_59:
    v33 = self->currentNodeHighlight.m_ptr;
    self->currentNodeHighlight.m_ptr = 0;
    if (!v33) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
  v43 = (WTF *)MEMORY[0x1E4E465F0]();
  WTF::fastFree(v43, v44);
  v33 = self->currentNodeHighlight.m_ptr;
  self->currentNodeHighlight.m_ptr = 0;
  if (v33) {
LABEL_60:
  }
    CFRelease(v33);
LABEL_61:
  v34 = self->inspector.m_ptr;
  self->inspector.m_ptr = 0;
  if (v34) {
    CFRelease(v34);
  }
  v35 = self->formDelegateForwarder.m_ptr;
  self->formDelegateForwarder.m_ptr = 0;
  if (v35) {
    CFRelease(v35);
  }
  v36 = self->resourceProgressDelegateForwarder.m_ptr;
  self->resourceProgressDelegateForwarder.m_ptr = 0;
  if (v36) {
    CFRelease(v36);
  }
  v37 = self->editingDelegateForwarder.m_ptr;
  self->editingDelegateForwarder.m_ptr = 0;
  if (v37) {
    CFRelease(v37);
  }
  v38 = self->frameLoadDelegateForwarder.m_ptr;
  self->frameLoadDelegateForwarder.m_ptr = 0;
  if (v38) {
    CFRelease(v38);
  }
  v39 = self->policyDelegateForwarder.m_ptr;
  self->policyDelegateForwarder.m_ptr = 0;
  if (v39) {
    CFRelease(v39);
  }
  v40 = self->UIDelegateForwarder.m_ptr;
  self->UIDelegateForwarder.m_ptr = 0;
  if (v40) {
    CFRelease(v40);
  }
  v41 = self->group.m_ptr;
  self->group.m_ptr = 0;
  if (v41)
  {
    if (*(_DWORD *)v41 == 1)
    {
      WebViewGroup::~WebViewGroup(v41, (StringImpl *)a2);
      WTF::fastFree(v45, v46);
      v42 = self->page.m_ptr;
      self->page.m_ptr = 0;
      if (!v42) {
        return;
      }
      goto LABEL_85;
    }
    --*(_DWORD *)v41;
  }
  v42 = self->page.m_ptr;
  self->page.m_ptr = 0;
  if (!v42) {
    return;
  }
LABEL_85:
  if (*(_DWORD *)v42 == 1)
  {
    v47 = (WTF *)MEMORY[0x1E4E47DB0]();
    WTF::fastFree(v47, v48);
  }
  else
  {
    --*(_DWORD *)v42;
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 101) = 0;
  *((void *)self + 104) = 0;
  *((unsigned char *)self + 866) = 0;
  *((void *)self + 125) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((void *)self + 20) = 0;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 760) = 0u;
  *(_OWORD *)((char *)self + 904) = 0u;
  *((void *)self + 122) = 0;
  *((_OWORD *)self + 60) = 0u;
  *((void *)self + 132) = 0;
  *((_OWORD *)self + 65) = 0u;
  *((_OWORD *)self + 64) = 0u;
  *((void *)self + 140) = 0;
  *((_OWORD *)self + 69) = 0u;
  return self;
}

@end