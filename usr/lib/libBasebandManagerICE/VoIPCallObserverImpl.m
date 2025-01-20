@interface VoIPCallObserverImpl
- (VoIPCallObserverImpl)initWithCallback:(function<void)(BOOL queue:()BOOL;
- (id).cxx_construct;
- (void)callObserver:(id)a3 callChanged:(id)a4;
@end

@implementation VoIPCallObserverImpl

- (VoIPCallObserverImpl)initWithCallback:(function<void)(BOOL queue:()BOOL
{
  v25[3] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)VoIPCallObserverImpl;
  v6 = [(VoIPCallObserverImpl *)&v22 init];
  v7 = v6;
  v8 = v6;
  if (!v6)
  {
LABEL_25:
    v19 = 0;
    goto LABEL_26;
  }
  *(_WORD *)&v6->fVoIPCallStarting = 0;
  f = (function<void (BOOL, BOOL, const char *)> *)a3->__f_.__f_;
  if (!f) {
    goto LABEL_5;
  }
  if (f != a3)
  {
    f = (function<void (BOOL, BOOL, const char *)> *)(*(uint64_t (**)(function<void (BOOL, BOOL, const char *)> *))(*(void *)f->__f_.__buf_.__lx + 16))(f);
LABEL_5:
    v24 = (uint8_t *)f;
    goto LABEL_7;
  }
  v24 = buf;
  (*(void (**)(function<void (BOOL, BOOL, const char *)> *, uint8_t *))(*(void *)a3->__f_.__buf_.__lx + 24))(a3, buf);
LABEL_7:
  lx = v7->fCallback.__f_.__buf_.__lx;
  if (lx == buf) {
    goto LABEL_16;
  }
  v11 = v24;
  v12 = (uint8_t *)v8->fCallback.__f_.__f_;
  if (v24 == buf)
  {
    if (v12 == lx)
    {
      memset(v25, 170, 24);
      (*(void (**)(uint8_t *, void *))(*(void *)buf + 24))(buf, v25);
      (*(void (**)(uint8_t *))(*(void *)v24 + 32))(v24);
      v24 = 0;
      (*(void (**)(void *, uint8_t *))(*(void *)v8->fCallback.__f_.__f_ + 24))(v8->fCallback.__f_.__f_, buf);
      (*(void (**)(void *))(*(void *)v8->fCallback.__f_.__f_ + 32))(v8->fCallback.__f_.__f_);
      v8->fCallback.__f_.__f_ = 0;
      v24 = buf;
      (*(void (**)(void *, uint8_t *))(v25[0] + 24))(v25, lx);
      (*(void (**)(void *))(v25[0] + 32))(v25);
      v8->fCallback.__f_.__f_ = lx;
      v13 = v24;
      if (v24 == buf) {
        goto LABEL_11;
      }
    }
    else
    {
      (*(void (**)(uint8_t *, uint8_t *))(*(void *)buf + 24))(buf, lx);
      (*(void (**)(uint8_t *))(*(void *)v24 + 32))(v24);
      v24 = (uint8_t *)v8->fCallback.__f_.__f_;
      v14 = v24;
      v8->fCallback.__f_.__f_ = lx;
      v13 = v14;
      if (v14 == buf) {
        goto LABEL_11;
      }
    }
    goto LABEL_17;
  }
  if (v12 == lx)
  {
    (*(void (**)(uint8_t *, uint8_t *))(*(void *)lx + 24))(lx, buf);
    (*(void (**)(void *))(*(void *)v8->fCallback.__f_.__f_ + 32))(v8->fCallback.__f_.__f_);
    v8->fCallback.__f_.__f_ = v24;
    v24 = buf;
LABEL_16:
    v13 = v24;
    if (v24 == buf) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  v24 = (uint8_t *)v8->fCallback.__f_.__f_;
  v8->fCallback.__f_.__f_ = v11;
  v13 = v12;
  if (v12 == buf)
  {
LABEL_11:
    (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
    goto LABEL_19;
  }
LABEL_17:
  if (v13) {
    (*(void (**)(uint8_t *))(*(void *)v13 + 40))(v13);
  }
LABEL_19:
  v15 = (CXCallObserver *)objc_alloc_init(MEMORY[0x1E4F19198]);
  fCallObserver = v8->fCallObserver;
  v8->fCallObserver = v15;

  v17 = v8->fCallObserver;
  if (!v17)
  {
    v20 = GetOsLogContext()[1];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C59C6000, v20, OS_LOG_TYPE_ERROR, "Failed to create Call observer from CallKit", buf, 2u);
    }
    goto LABEL_25;
  }
  [(CXCallObserver *)v17 setDelegate:v8 queue:a4];
  v18 = GetOsLogContext()[1];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C59C6000, v18, OS_LOG_TYPE_DEFAULT, "Call observer created", buf, 2u);
  }
  v19 = v8;
LABEL_26:

  return v19;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = GetOsLogContext()[1];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v16 = [v7 providerIdentifier];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v16;
    _os_log_debug_impl(&dword_1C59C6000, v8, OS_LOG_TYPE_DEBUG, "Provider ID: %@", buf, 0xCu);
  }
  v9 = GetOsLogContext()[1];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = [v7 hasConnected];
    int v18 = [v7 hasEnded];
    BOOL fVoIPCallStarting = self->fVoIPCallStarting;
    BOOL fVoIPCallActive = self->fVoIPCallActive;
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v17;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v18;
    __int16 v28 = 1024;
    BOOL v29 = fVoIPCallStarting;
    __int16 v30 = 1024;
    BOOL v31 = fVoIPCallActive;
    _os_log_debug_impl(&dword_1C59C6000, v9, OS_LOG_TYPE_DEBUG, "(1) call connected: %{BOOL}d, call ended: %{BOOL}d, fVoIPCallStarting: %{BOOL}d, fVoIPCallActive: %{BOOL}d", buf, 0x1Au);
  }
  if (([v7 hasConnected] & 1) == 0 && (objc_msgSend(v7, "hasEnded") & 1) == 0)
  {
    if (!self->fVoIPCallStarting)
    {
      int v10 = 1;
      self->BOOL fVoIPCallStarting = 1;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (!self->fVoIPCallStarting)
  {
LABEL_10:
    int v10 = 0;
    goto LABEL_11;
  }
  self->BOOL fVoIPCallStarting = 0;
  int v10 = 1;
LABEL_11:
  if ([v7 hasConnected] && (objc_msgSend(v7, "hasEnded") & 1) == 0)
  {
    if (!self->fVoIPCallActive)
    {
      int v10 = 1;
      self->BOOL fVoIPCallActive = 1;
    }
  }
  else if (self->fVoIPCallActive)
  {
    self->BOOL fVoIPCallActive = 0;
    int v10 = 1;
  }
  v11 = GetOsLogContext()[1];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v21 = [v7 hasConnected];
    int v22 = [v7 hasEnded];
    BOOL v23 = self->fVoIPCallStarting;
    BOOL v24 = self->fVoIPCallActive;
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v21;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v22;
    __int16 v28 = 1024;
    BOOL v29 = v23;
    __int16 v30 = 1024;
    BOOL v31 = v24;
    _os_log_debug_impl(&dword_1C59C6000, v11, OS_LOG_TYPE_DEBUG, "(2) call connected: %{BOOL}d, call ended: %{BOOL}d, fVoIPCallStarting: %{BOOL}d, fVoIPCallActive: %{BOOL}d", buf, 0x1Au);
    if (!v10) {
      goto LABEL_21;
    }
  }
  else if (!v10)
  {
    goto LABEL_21;
  }
  BOOL v12 = self->fVoIPCallStarting;
  BOOL v13 = self->fVoIPCallActive;
  id v14 = [v7 providerIdentifier];
  BOOL v26 = v12;
  BOOL v25 = v13;
  *(void *)buf = [v14 UTF8String];
  f = self->fCallback.__f_.__f_;
  if (!f) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(void *, BOOL *, BOOL *, unsigned char *))(*(void *)f + 48))(f, &v26, &v25, buf);

LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fCallObserver, 0);
  f = (VoIPCallObserverImpl *)self->fCallback.__f_.__f_;
  if (f == (VoIPCallObserverImpl *)&self->fCallback)
  {
    v5 = *(void (**)(function<void (BOOL, BOOL, const char *)> *))(*(void *)self->fCallback.__f_.__buf_.__lx
                                                                            + 32);
    v5(&self->fCallback);
  }
  else if (f)
  {
    v4 = (void (*)(void))*((void *)f->super.isa + 5);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end