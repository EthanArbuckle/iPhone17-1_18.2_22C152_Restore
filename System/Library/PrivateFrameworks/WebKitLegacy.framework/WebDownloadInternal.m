@interface WebDownloadInternal
- (BOOL)download:(id)a3 shouldDecodeSourceDataOfMIMEType:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (id).cxx_construct;
- (id)download:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (uint64_t)download:(WTF *)this decideDestinationWithSuggestedFilename:(void *)a2;
- (uint64_t)download:(WTF *)this didCreateDestination:(void *)a2;
- (uint64_t)download:(WTF *)this didFailWithError:(void *)a2;
- (uint64_t)download:(WTF *)this didReceiveDataOfLength:(void *)a2;
- (uint64_t)download:(WTF *)this didReceiveResponse:(void *)a2;
- (uint64_t)download:(id)&& shouldDecodeSourceDataOfMIMEType:;
- (uint64_t)download:(uint64_t)a1 decideDestinationWithSuggestedFilename:;
- (uint64_t)download:(uint64_t)a1 didCreateDestination:;
- (uint64_t)download:(uint64_t)a1 didFailWithError:;
- (uint64_t)download:(uint64_t)a1 didReceiveDataOfLength:;
- (uint64_t)download:(uint64_t)a1 didReceiveResponse:;
- (uint64_t)downloadDidBegin:(WTF *)this;
- (uint64_t)downloadDidBegin:(uint64_t)a1;
- (uint64_t)downloadDidFinish:(WTF *)this;
- (uint64_t)downloadDidFinish:(uint64_t)a1;
- (void)dealloc;
- (void)download:(id)&& willSendRequest:redirectResponse:;
- (void)download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4;
- (void)download:(id)a3 didCreateDestination:(id)a4;
- (void)download:(id)a3 didFailWithError:(id)a4;
- (void)download:(id)a3 didReceiveDataOfLength:(unint64_t)a4;
- (void)download:(id)a3 didReceiveResponse:(id)a4;
- (void)download:(void *)a1 decideDestinationWithSuggestedFilename:;
- (void)download:(void *)a1 didCreateDestination:;
- (void)download:(void *)a1 didFailWithError:;
- (void)download:(void *)a1 didReceiveDataOfLength:;
- (void)download:(void *)a1 didReceiveResponse:;
- (void)downloadDidBegin:(id)a3;
- (void)downloadDidBegin:(void *)a1;
- (void)downloadDidFinish:(id)a3;
- (void)downloadDidFinish:(void *)a1;
- (void)setRealDelegate:(id)a3;
@end

@implementation WebDownloadInternal

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WebDownloadInternal;
  [(WebDownloadInternal *)&v2 dealloc];
}

- (void)setRealDelegate:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->realDelegate.m_ptr;
  self->realDelegate.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_downloadDidBegin_ == a3
    || sel_download_willSendRequest_redirectResponse_ == a3
    || sel_download_didReceiveResponse_ == a3
    || sel_download_didReceiveDataOfLength_ == a3
    || sel_download_shouldDecodeSourceDataOfMIMEType_ == a3
    || sel_download_decideDestinationWithSuggestedFilename_ == a3
    || sel_download_didCreateDestination_ == a3
    || sel_downloadDidFinish_ == a3
    || sel_download_didFailWithError_ == a3)
  {
    return objc_opt_respondsToSelector() & 1;
  }
  v12.receiver = self;
  v12.super_class = (Class)WebDownloadInternal;
  return -[WebDownloadInternal respondsToSelector:](&v12, sel_respondsToSelector_);
}

- (void)downloadDidBegin:(id)a3
{
  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  v5 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v5 = &unk_1F3C7C840;
  v5[1] = m_ptr;
  v5[2] = a3;
  v6 = v5;
  WTF::callOnMainThread();
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }
}

- (id)download:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v21 = a3;
  v22 = self;
  id v19 = a5;
  id v20 = a4;
  CFTypeRef cf = 0;
  isMainThread = (WTF::WorkQueue *)WTF::isMainThread((WTF *)self);
  if (isMainThread)
  {
    v10 = (const void *)[self->realDelegate.m_ptr download:a3 willSendRequest:a4 redirectResponse:a5];
    CFTypeRef v11 = v10;
    if (v10) {
      CFRetain(v10);
    }
  }
  else
  {
    uint64_t v12 = WTF::WorkQueue::main(isMainThread);
    v13 = (void *)WTF::fastMalloc((WTF *)0x30);
    void *v13 = &unk_1F3C7C868;
    v13[1] = &cf;
    v13[2] = &v22;
    v13[3] = &v21;
    v13[4] = &v20;
    v13[5] = &v19;
    v23 = v13;
    (*(void (**)(uint64_t, void **))(*(void *)v12 + 24))(v12, &v23);
    v14 = v23;
    v23 = 0;
    if (v14) {
      (*(void (**)(void *))(*v14 + 8))(v14);
    }
    CFTypeRef v11 = cf;
  }
  CFTypeRef cf = 0;
  CFTypeRef v15 = (id)CFMakeCollectable(v11);
  CFTypeRef v16 = cf;
  CFTypeRef cf = 0;
  if (v16) {
    CFRelease(v16);
  }
  return (id)v15;
}

- (void)download:(id)a3 didReceiveResponse:(id)a4
{
  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v7 = &unk_1F3C7C890;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (uint64_t)download:(uint64_t)a1 didReceiveResponse:
{
  return [*(id *)(a1 + 8) download:*(void *)(a1 + 16) didReceiveResponse:*(void *)(a1 + 24)];
}

- (void)download:(id)a3 didReceiveDataOfLength:(unint64_t)a4
{
  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v7 = &unk_1F3C7C8B8;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (BOOL)download:(id)a3 shouldDecodeSourceDataOfMIMEType:(id)a4
{
  id v15 = a3;
  CFTypeRef v16 = self;
  id v14 = a4;
  char v13 = 0;
  isMainThread = (WTF::WorkQueue *)WTF::isMainThread((WTF *)self);
  if (isMainThread)
  {
    m_ptr = self->realDelegate.m_ptr;
    return [m_ptr download:a3 shouldDecodeSourceDataOfMIMEType:a4];
  }
  else
  {
    uint64_t v10 = WTF::WorkQueue::main(isMainThread);
    CFTypeRef v11 = (void *)WTF::fastMalloc((WTF *)0x28);
    *CFTypeRef v11 = &unk_1F3C7C8E0;
    v11[1] = &v13;
    v11[2] = &v16;
    v11[3] = &v15;
    v11[4] = &v14;
    v17 = v11;
    (*(void (**)(uint64_t, void **))(*(void *)v10 + 24))(v10, &v17);
    uint64_t v12 = v17;
    v17 = 0;
    if (v12) {
      (*(void (**)(void *))(*v12 + 8))(v12);
    }
    return v13 != 0;
  }
}

- (void)download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4
{
  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v7 = &unk_1F3C7C908;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (void)download:(id)a3 didCreateDestination:(id)a4
{
  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v7 = &unk_1F3C7C930;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (void)downloadDidFinish:(id)a3
{
  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  v5 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v5 = &unk_1F3C7C958;
  v5[1] = m_ptr;
  v5[2] = a3;
  v6 = v5;
  WTF::callOnMainThread();
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }
}

- (void)download:(id)a3 didFailWithError:(id)a4
{
  m_ptr = self->realDelegate.m_ptr;
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  if (a4) {
    CFRetain(a4);
  }
  v7 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v7 = &unk_1F3C7C980;
  v7[1] = m_ptr;
  v7[2] = a3;
  v7[3] = a4;
  v8 = v7;
  WTF::callOnMainThread();
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->realDelegate.m_ptr;
  self->realDelegate.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)downloadDidBegin:(void *)a1
{
  *a1 = &unk_1F3C7C840;
  objc_super v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)downloadDidBegin:(WTF *)this
{
  *(void *)this = &unk_1F3C7C840;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)downloadDidBegin:(uint64_t)a1
{
  return [*(id *)(a1 + 8) downloadDidBegin:*(void *)(a1 + 16)];
}

- (void)download:(id)&& willSendRequest:redirectResponse:
{
  objc_super v2 = (const void *)[*(id *)(**(void **)(a1 + 16) + 8) download:**(void **)(a1 + 24) willSendRequest:**(void **)(a1 + 32) redirectResponse:**(void **)(a1 + 40)];
  v3 = v2;
  v4 = *(const void ***)(a1 + 8);
  if (v2) {
    CFRetain(v2);
  }
  v5 = *v4;
  const void *v4 = v3;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (void)download:(void *)a1 didReceiveResponse:
{
  *a1 = &unk_1F3C7C890;
  objc_super v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (uint64_t)download:(WTF *)this didReceiveResponse:(void *)a2
{
  *(void *)this = &unk_1F3C7C890;
  v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    CFRelease(v5);
  }
  return WTF::fastFree(this, a2);
}

- (void)download:(void *)a1 didReceiveDataOfLength:
{
  *a1 = &unk_1F3C7C8B8;
  objc_super v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)download:(WTF *)this didReceiveDataOfLength:(void *)a2
{
  *(void *)this = &unk_1F3C7C8B8;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 didReceiveDataOfLength:
{
  return [*(id *)(a1 + 8) download:*(void *)(a1 + 16) didReceiveDataOfLength:*(void *)(a1 + 24)];
}

- (uint64_t)download:(id)&& shouldDecodeSourceDataOfMIMEType:
{
  uint64_t result = [*(id *)(**(void **)(a1 + 16) + 8) download:**(void **)(a1 + 24) shouldDecodeSourceDataOfMIMEType:**(void **)(a1 + 32)];
  **(unsigned char **)(a1 + 8) = result;
  return result;
}

- (void)download:(void *)a1 decideDestinationWithSuggestedFilename:
{
  *a1 = &unk_1F3C7C908;
  objc_super v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (uint64_t)download:(WTF *)this decideDestinationWithSuggestedFilename:(void *)a2
{
  *(void *)this = &unk_1F3C7C908;
  v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    CFRelease(v5);
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 decideDestinationWithSuggestedFilename:
{
  return [*(id *)(a1 + 8) download:*(void *)(a1 + 16) decideDestinationWithSuggestedFilename:*(void *)(a1 + 24)];
}

- (void)download:(void *)a1 didCreateDestination:
{
  *a1 = &unk_1F3C7C930;
  objc_super v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (uint64_t)download:(WTF *)this didCreateDestination:(void *)a2
{
  *(void *)this = &unk_1F3C7C930;
  v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    CFRelease(v5);
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 didCreateDestination:
{
  return [*(id *)(a1 + 8) download:*(void *)(a1 + 16) didCreateDestination:*(void *)(a1 + 24)];
}

- (void)downloadDidFinish:(void *)a1
{
  *a1 = &unk_1F3C7C958;
  objc_super v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)downloadDidFinish:(WTF *)this
{
  *(void *)this = &unk_1F3C7C958;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    CFRelease(v4);
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)downloadDidFinish:(uint64_t)a1
{
  return [*(id *)(a1 + 8) downloadDidFinish:*(void *)(a1 + 16)];
}

- (void)download:(void *)a1 didFailWithError:
{
  *a1 = &unk_1F3C7C980;
  objc_super v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

- (uint64_t)download:(WTF *)this didFailWithError:(void *)a2
{
  *(void *)this = &unk_1F3C7C980;
  v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    CFRelease(v5);
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)download:(uint64_t)a1 didFailWithError:
{
  return [*(id *)(a1 + 8) download:*(void *)(a1 + 16) didFailWithError:*(void *)(a1 + 24)];
}

@end