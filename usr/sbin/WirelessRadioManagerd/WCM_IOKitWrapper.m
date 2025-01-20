@interface WCM_IOKitWrapper
- (BOOL)isBackSuperWideCameraSupported;
- (BOOL)isBackTeleCameraSupported;
- (BOOL)isFaceIdSupported;
- (BOOL)isFrontCameraSupported;
- (BOOL)isPencilIndicationSupported;
- (WCM_IOKitWrapper)init;
- (WCM_IOKitWrapper)initWithPlatformId:(unint64_t)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)registerIOkitStateEvent;
@end

@implementation WCM_IOKitWrapper

- (WCM_IOKitWrapper)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_IOKitWrapper;
  v2 = [(WCM_IOKitWrapper *)&v5 init];
  cntrl = (std::__shared_weak_count *)v2->mIOKitNotifier.__cntrl_;
  v2->mIOKitNotifier.__ptr_ = 0;
  v2->mIOKitNotifier.__cntrl_ = 0;
  if (cntrl) {
    sub_1000357EC(cntrl);
  }
  v2->mPlatformId = 0;
  return v2;
}

- (WCM_IOKitWrapper)initWithPlatformId:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WCM_IOKitWrapper;
  v4 = [(WCM_IOKitWrapper *)&v7 init];
  cntrl = (std::__shared_weak_count *)v4->mIOKitNotifier.__cntrl_;
  v4->mIOKitNotifier.__ptr_ = 0;
  v4->mIOKitNotifier.__cntrl_ = 0;
  if (cntrl) {
    sub_1000357EC(cntrl);
  }
  v4->mPlatformId = a3;
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCM_IOKitWrapper;
  [(WCM_IOKitWrapper *)&v2 dealloc];
}

- (BOOL)isFaceIdSupported
{
  return self->mPlatformId - 50 < 8;
}

- (BOOL)isFrontCameraSupported
{
  return 0;
}

- (BOOL)isBackTeleCameraSupported
{
  return self->mPlatformId == 52;
}

- (BOOL)isBackSuperWideCameraSupported
{
  return 0;
}

- (BOOL)isPencilIndicationSupported
{
  return 0;
}

- (void)registerIOkitStateEvent
{
  ptr = self->mIOKitNotifier.__ptr_;
  if (!ptr)
  {
    sub_10005125C(&v8);
    shared_ptr<WCM_IOKitEventNotifier> v4 = v8;
    shared_ptr<WCM_IOKitEventNotifier> v8 = (shared_ptr<WCM_IOKitEventNotifier>)0;
    cntrl = self->mIOKitNotifier.__cntrl_;
    self->mIOKitNotifier = v4;
    if (cntrl)
    {
      sub_1000357EC((std::__shared_weak_count *)cntrl);
      if (v8.__cntrl_) {
        sub_1000357EC((std::__shared_weak_count *)v8.__cntrl_);
      }
      ptr = self->mIOKitNotifier.__ptr_;
      if (ptr) {
        goto LABEL_6;
      }
LABEL_12:
      CFStringRef v6 = @"IOKit State registration: Failed to create WCM_IOKitEventNotifier object";
      goto LABEL_10;
    }
    ptr = v4.__ptr_;
    if (!v4.__ptr_) {
      goto LABEL_12;
    }
  }
LABEL_6:
  sub_10005129C((uint64_t)ptr, [(WCM_IOKitWrapper *)self isFaceIdSupported]);
  sub_1000512A4((uint64_t)self->mIOKitNotifier.__ptr_, [(WCM_IOKitWrapper *)self isFrontCameraSupported]);
  sub_1000512AC((uint64_t)self->mIOKitNotifier.__ptr_, [(WCM_IOKitWrapper *)self isBackTeleCameraSupported]);
  sub_1000512B4((uint64_t)self->mIOKitNotifier.__ptr_, [(WCM_IOKitWrapper *)self isBackSuperWideCameraSupported]);
  +[WCM_Logging logLevel:3, @"IOKit state registration: register WCM_IOKitEventNotifier callback result: 0x%x", sub_1000517B0((uint64_t)self->mIOKitNotifier.__ptr_) message];
  if ([(WCM_IOKitWrapper *)self isPencilIndicationSupported])
  {
    +[WCM_Logging logLevel:3 message:@"YYDebug_ Pencil Coex is supported 3"];
    sub_1000512BC((uint64_t)self->mIOKitNotifier.__ptr_, 1);
    sub_100051558((uint64_t)self->mIOKitNotifier.__ptr_);
  }
  else
  {
    sub_1000512BC((uint64_t)self->mIOKitNotifier.__ptr_, 0);
    +[WCM_Logging logLevel:3 message:@"YYDebug_ Pencil Coex is not supported"];
  }
  uint64_t v7 = sub_1000523DC(self->mIOKitNotifier.__ptr_);
  CFStringRef v6 = @"IOKit state registration: Start WCM_IOKitEventNotifier result: 0x%x";
LABEL_10:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v6, v7);
}

- (void).cxx_destruct
{
  cntrl = self->mIOKitNotifier.__cntrl_;
  if (cntrl) {
    sub_1000357EC((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end