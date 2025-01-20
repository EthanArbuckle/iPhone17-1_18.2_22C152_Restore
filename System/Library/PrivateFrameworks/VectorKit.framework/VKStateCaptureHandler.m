@interface VKStateCaptureHandler
+ (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4;
- (VKStateCaptureHandler)initWithQueue:(id)a3 withName:(id)a4 withCallback:(function<NSString *)(;
- (id).cxx_construct;
- (os_state_data_s)_stateCapture;
- (void)_registerHandlerforStateCapture:(id)a3;
- (void)_unregisterHandlerforStateCapture;
- (void)dealloc;
@end

@implementation VKStateCaptureHandler

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

- (VKStateCaptureHandler)initWithQueue:(id)a3 withName:(id)a4 withCallback:(function<NSString *)(
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VKStateCaptureHandler;
  v10 = [(VKStateCaptureHandler *)&v19 init];
  v11 = v10;
  v12 = v10;
  if (!v10) {
    goto LABEL_23;
  }
  p_name = &v10->_name;
  objc_storeStrong((id *)&v10->_name, a4);
  if (!*p_name) {
    *p_name = (NSString *)@"VK State Snapshot";
  }
  f = (function<NSString *()> *)a5->__f_.__f_;
  if (f)
  {
    if (f == a5)
    {
      v21 = (function<NSString *()> *)v20;
      (*(void (**)(function<NSString *()> *, void *))(*(void *)a5->__f_.__buf_.__lx + 24))(a5, v20);
      goto LABEL_9;
    }
    f = (function<NSString *()> *)(*(uint64_t (**)(function<NSString *()> *))(*(void *)f->__f_.__buf_.__lx
                                                                                      + 16))(f);
  }
  v21 = f;
LABEL_9:
  p_callback = &v11->_callback;
  if (&v11->_callback != (function<NSString *()> *)v20)
  {
    v16 = v21;
    v17 = (function<NSString *()> *)v12->_callback.__f_.__f_;
    if (v21 == (function<NSString *()> *)v20)
    {
      if (v17 == p_callback)
      {
        (*(void (**)(void *, void *))(v20[0] + 24))(v20, v22);
        (*(void (**)(function<NSString *()> *))(*(void *)v21->__f_.__buf_.__lx + 32))(v21);
        v21 = 0;
        (*(void (**)(void *, void *))(*(void *)v12->_callback.__f_.__f_ + 24))(v12->_callback.__f_.__f_, v20);
        (*(void (**)(void *))(*(void *)v12->_callback.__f_.__f_ + 32))(v12->_callback.__f_.__f_);
        v12->_callback.__f_.__f_ = 0;
        v21 = (function<NSString *()> *)v20;
        (*(void (**)(void *, function<NSString *()> *))(v22[0] + 24))(v22, p_callback);
        (*(void (**)(void *))(v22[0] + 32))(v22);
      }
      else
      {
        (*(void (**)(void *, function<NSString *()> *))(v20[0] + 24))(v20, p_callback);
        (*(void (**)(function<NSString *()> *))(*(void *)v21->__f_.__buf_.__lx + 32))(v21);
        v21 = (function<NSString *()> *)v12->_callback.__f_.__f_;
      }
      v12->_callback.__f_.__f_ = p_callback;
    }
    else if (v17 == p_callback)
    {
      (*(void (**)(function<NSString *()> *, void *))(*(void *)v12->_callback.__f_.__buf_.__lx + 24))(p_callback, v20);
      (*(void (**)(void *))(*(void *)v12->_callback.__f_.__f_ + 32))(v12->_callback.__f_.__f_);
      v12->_callback.__f_.__f_ = v21;
      v21 = (function<NSString *()> *)v20;
    }
    else
    {
      v21 = (function<NSString *()> *)v12->_callback.__f_.__f_;
      v12->_callback.__f_.__f_ = v16;
    }
  }
  if (v21 == (function<NSString *()> *)v20)
  {
    (*(void (**)(void *))(v20[0] + 32))(v20);
  }
  else if (v21)
  {
    (*(void (**)(void))(*(void *)v21->__f_.__buf_.__lx + 40))();
  }
  [(VKStateCaptureHandler *)v12 _registerHandlerforStateCapture:v8];
LABEL_23:

  return v12;
}

- (void)_registerHandlerforStateCapture:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_4620);
  }
  v5 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412290;
    id v9 = name;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_DEBUG, "Register Handler for %@ State Capture", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v7, (id *)buf);
  self->_handle = os_state_add_handler();
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  p_callback = &self->_callback;
  f = (function<NSString *()> *)self->_callback.__f_.__f_;
  if (f == p_callback)
  {
    (*(void (**)(function<NSString *()> *, SEL))(*(void *)p_callback->__f_.__buf_.__lx + 32))(p_callback, a2);
  }
  else if (f)
  {
    (*(void (**)(function<NSString *()> *, SEL))(*(void *)f->__f_.__buf_.__lx + 40))(f, a2);
  }
  objc_storeStrong((id *)&self->_name, 0);
}

- (os_state_data_s)_stateCapture
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_4620);
  }
  v3 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412290;
    v18 = name;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_DEBUG, "%@ State Capture Begin", buf, 0xCu);
  }
  v5 = [NSString stringWithFormat:@"%@ State Capture: Starting....", self->_name];
  f = self->_callback.__f_.__f_;
  if (f)
  {
    id v7 = (*(void (**)(void *))(*(void *)f + 48))(f);
    if (v7)
    {
      uint64_t v8 = [v5 stringByAppendingString:v7];

      v5 = (void *)v8;
    }
  }
  _GEOStateCaptureLog();
  id v9 = objc_opt_class();
  uint64_t v10 = [NSString stringWithFormat:@"%@ State Capture", self->_name];
  v15 = v10;
  v16 = @"Completed";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v12 = [NSString stringWithFormat:@"%@ State Capture", self->_name];
  v13 = (os_state_data_s *)[v9 stateDataForDictionary:v11 title:v12];

  return v13;
}

- (void)_unregisterHandlerforStateCapture
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_4620);
  }
  v3 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    int v5 = 138412290;
    v6 = name;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_DEBUG, "Unregister Handler for %@ State Capture", (uint8_t *)&v5, 0xCu);
  }
  if (self->_handle) {
    os_state_remove_handler();
  }
}

uint64_t __57__VKStateCaptureHandler__registerHandlerforStateCapture___block_invoke(uint64_t a1, uint64_t a2)
{
  if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1) {
    dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_4620);
  }
  id v4 = GEOGetVectorKitStateCaptureLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_DEBUG, "got called os_state_add_handler", v9, 2u);
  }
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    return 0;
  }
  v6 = WeakRetained;
  uint64_t v7 = [WeakRetained _stateCapture];

  return v7;
}

- (void)dealloc
{
  p_callback = &self->_callback;
  f = (function<NSString *()> *)self->_callback.__f_.__f_;
  self->_callback.__f_.__f_ = 0;
  if (f == p_callback)
  {
    (*(void (**)(function<NSString *()> *, SEL))(*(void *)p_callback->__f_.__buf_.__lx + 32))(p_callback, a2);
  }
  else if (f)
  {
    (*(void (**)(function<NSString *()> *, SEL))(*(void *)f->__f_.__buf_.__lx + 40))(f, a2);
  }
  [(VKStateCaptureHandler *)self _unregisterHandlerforStateCapture];
  v5.receiver = self;
  v5.super_class = (Class)VKStateCaptureHandler;
  [(VKStateCaptureHandler *)&v5 dealloc];
}

+ (os_state_data_s)stateDataForDictionary:(id)a3 title:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v23 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v23];
    id v8 = v23;
    if (v8)
    {
      if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1) {
        dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_4620);
      }
      uint64_t v9 = GEOGetVectorKitStateCaptureLog(void)::log;
      if (!os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      uint64_t v10 = "Error serializing dictionary for State Capture: %@";
      v11 = v9;
      uint32_t v12 = 12;
    }
    else
    {
      size_t v14 = [v7 length];
      v15 = (os_state_data_s *)malloc_type_calloc(1uLL, v14 + 200, 0x76450EECuLL);
      v13 = v15;
      if (v15)
      {
        v15->var0 = 1;
        v15->var1.var1 = v14;
        v16 = [v6 dataUsingEncoding:4];
        v17 = v16;
        if (v16)
        {
          id v18 = v16;
          uint64_t v19 = (const void *)[v18 bytes];
          if ((unint64_t)[v18 length] > 0x3E) {
            size_t v20 = 63;
          }
          else {
            size_t v20 = [v18 length];
          }
          memcpy(v13->var3, v19, v20);
        }
        memcpy(v13->var4, (const void *)[v7 bytes], v14);

        goto LABEL_21;
      }
      if (GEOGetVectorKitStateCaptureLog(void)::onceToken[0] != -1) {
        dispatch_once(GEOGetVectorKitStateCaptureLog(void)::onceToken, &__block_literal_global_4620);
      }
      uint64_t v21 = GEOGetVectorKitStateCaptureLog(void)::log;
      if (!os_log_type_enabled((os_log_t)GEOGetVectorKitStateCaptureLog(void)::log, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v10 = "Error os_state_data nil";
      v11 = v21;
      uint32_t v12 = 2;
    }
    _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    goto LABEL_8;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

@end