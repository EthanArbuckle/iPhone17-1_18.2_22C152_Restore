@interface RBDevice
+ (BOOL)allowsRenderingInBackground;
+ (BOOL)isRunningInBackground;
+ (BOOL)isSupported;
+ (NSArray)allDevices;
+ (RBDevice)sharedDefaultDevice;
+ (id)sharedDevice:(id)a3;
+ (uint64_t)sharedDefaultDevice;
+ (unint64_t)defaultBackgroundGPUPriority;
+ (unint64_t)defaultGPUPriority;
+ (void)allDevices;
+ (void)didEnterBackground:(id)a3;
+ (void)setAllowsRenderingInBackground:(BOOL)a3;
+ (void)setDefaultBackgroundGPUPriority:(unint64_t)a3;
+ (void)setDefaultGPUPriority:(unint64_t)a3;
+ (void)willEnterForeground:(id)a3;
- (BOOL)compileShader:(id)a3 error:(id *)a4;
- (CGImage)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5;
- (MTLCaptureScope)captureScope;
- (MTLDevice)device;
- (OS_dispatch_queue)queue;
- (RBDevice)initWithDevice:(id)a3;
- (id).cxx_construct;
- (id)pipelineDescriptions:(id)a3 extraColorFormats:(id)a4;
- (unint64_t)GPUPriority;
- (unint64_t)backgroundGPUPriority;
- (void)collectResources;
- (void)compileShader:(id)a3 completionQueue:(id)a4 handler:(id)a5;
- (void)dealloc;
- (void)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5 completionQueue:(id)a6 handler:(id)a7;
- (void)setBackgroundGPUPriority:(unint64_t)a3;
- (void)setGPUPriority:(unint64_t)a3;
@end

@implementation RBDevice

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)*((void *)self->_device._p + 4);
}

+ (RBDevice)sharedDefaultDevice
{
  {
    id v4 = a1;
    +[RBDevice sharedDefaultDevice]::device = +[RBDevice sharedDefaultDevice]::$_3::operator()(&v4);
  }
  return (RBDevice *)+[RBDevice sharedDefaultDevice]::device;
}

+ (BOOL)isRunningInBackground
{
  if (background_once != -1) {
    dispatch_once_f(&background_once, a1, (dispatch_function_t)init_background_notifications);
  }
  return is_running_in_background && allows_rendering_in_background == 0;
}

+ (BOOL)isSupported
{
  return [a1 sharedDefaultDevice] != 0;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  return self;
}

- (void)collectResources
{
  int v2 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)&self->_pending_collect, (unsigned int *)&v2, 1u);
  if (!v2)
  {
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    v5 = [(RBDevice *)self queue];
    dispatch_after_f(v4, (dispatch_queue_t)v5, self, (dispatch_function_t)collect_resources);
  }
}

+ (uint64_t)sharedDefaultDevice
{
  id v2 = MTLCreateSystemDefaultDevice();
  if (v2) {
    uint64_t v3 = [*a1 sharedDevice:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)sharedDevice:(id)a3
{
  os_unfair_lock_t lock = (os_unfair_lock_t)&devices_lock;
  char v10 = 1;
  os_unfair_lock_lock((os_unfair_lock_t)&devices_lock);
  if (!device_table) {
    operator new();
  }
  v11 = 0;
  v5 = RB::UntypedTable::lookup((RB::UntypedTable *)device_table, (uint64_t *)a3, &v11);
  if (!v11)
  {
    std::unique_lock<RB::spin_lock>::unlock((uint64_t)&lock);
    v5 = (uint64_t *)[objc_alloc((Class)a1) initWithDevice:a3];
    std::unique_lock<RB::spin_lock>::lock((uint64_t)&lock);
    v11 = 0;
    v6 = RB::UntypedTable::lookup((RB::UntypedTable *)device_table, (uint64_t *)a3, &v11);
    if (v11)
    {
      v7 = v6;

      v5 = v7;
    }
    else
    {
      RB::UntypedTable::insert((size_t **)device_table, (size_t *)a3, (size_t *)v5);

      all_devices = 0;
    }
  }
  if (v10) {
    os_unfair_lock_unlock(lock);
  }
  return v5;
}

- (RBDevice)initWithDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RBDevice;
  if ([(RBDevice *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (BOOL)compileShader:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  unint64_t v7 = rb_shader_type([a3 type]);
  if ((v7 & 0xFF00000000) != 0)
  {
    unsigned int v8 = v7;
    uint64_t v9 = -[RBDecodedFontMetadata fontUID]((uint64_t)self);
    if (a3) {
      char v10 = (uint64_t *)((char *)a3 + 16);
    }
    else {
      char v10 = 0;
    }
    return RB::FunctionLibrary::compile_shader(v9, v10, v8, a4);
  }
  else
  {
    if (a4)
    {
      uint64_t v12 = *MEMORY[0x263F08320];
      v13[0] = @"Missing shader type.";
      *a4 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.RenderBox.RBShaderError", 5, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    }
    return 0;
  }
}

- (void)compileShader:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  {
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    -[RBDevice(RBShader) compileShader:completionQueue:handler:]::compilation_queue = (uint64_t)dispatch_queue_create("com.apple.RenderBox.shader-compilation", v14);
  }
  uint64_t v9 = self;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void *)[a5 copy];
  v13 = -[RBDevice(RBShader) compileShader:completionQueue:handler:]::compilation_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3321888768;
  v15[2] = __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke;
  v15[3] = &__block_descriptor_64_e8_32c30_ZTSN2RB8objc_ptrIP8RBDeviceEE40c30_ZTSN2RB8objc_ptrIP8RBShaderEE48c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7NSErrorEEE56c61_ZTSN2RB8objc_ptrIPU28objcproto17OS_dispatch_queue8NSObjectEE_e5_v8__0l;
  id v16 = v9;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v13, v15);
}

void __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  [*(id *)(a1 + 32) compileShader:*(void *)(a1 + 40) error:&v7];
  id v2 = *(void **)(a1 + 48);
  if (v2)
  {
    if (*(void *)(a1 + 56)) {
      uint64_t v3 = *(NSObject **)(a1 + 56);
    }
    else {
      uint64_t v3 = MEMORY[0x263EF83A0];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3321888768;
    block[2] = __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke_2;
    block[3] = &unk_26C4E8390;
    id v4 = v2;
    block[4] = v7;
    id v6 = v4;
    dispatch_async(v3, block);
  }
}

uint64_t __60__RBDevice_RBShader__compileShader_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (NSArray)allDevices
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&devices_lock);
  id v2 = (void *)all_devices;
  if (!all_devices)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 8;
    if (device_table)
    {
      uint64_t v7 = v8;
      RB::UntypedTable::for_each(device_table, (void (*)(const void *, const void *, void *))RB::Table<objc_object  {objcproto9MTLDevice}*,RBDevice *>::for_each<+[RBDevice allDevices]::$_2>(+[RBDevice allDevices]#1}::__invoke, &v7);
    }
    id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
    if (v9) {
      id v4 = v9;
    }
    else {
      id v4 = v8;
    }
    id v2 = (void *)[v3 initWithObjects:v4 count:v10];
    all_devices = (uint64_t)v2;
    if (v9)
    {
      free(v9);
      id v2 = (void *)all_devices;
    }
  }
  v5 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&devices_lock);
  return v5;
}

+ (unint64_t)defaultGPUPriority
{
  if (HIBYTE(RB::Device::default_gpu_priority)) {
    return RB::Device::default_gpu_priority;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

+ (void)setDefaultGPUPriority:(unint64_t)a3
{
  if (a3 > 0xFF)
  {
    if (HIBYTE(RB::Device::default_gpu_priority)) {
      HIBYTE(RB::Device::default_gpu_priority) = 0;
    }
  }
  else
  {
    RB::Device::default_gpu_priority = a3 | 0x100;
  }
}

+ (unint64_t)defaultBackgroundGPUPriority
{
  if (HIBYTE(RB::Device::default_bg_gpu_priority)) {
    return RB::Device::default_bg_gpu_priority;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

+ (void)setDefaultBackgroundGPUPriority:(unint64_t)a3
{
  if (a3 > 0xFF)
  {
    if (HIBYTE(RB::Device::default_bg_gpu_priority)) {
      HIBYTE(RB::Device::default_bg_gpu_priority) = 0;
    }
  }
  else
  {
    RB::Device::default_bg_gpu_priority = a3 | 0x100;
  }
}

- (void)dealloc
{
  *((void *)self->_device._p + 2) = 0;
  do
  {
    unsigned int v2 = atomic_load(&self->_pending_collect.__a_.__a_value);
    unsigned int v3 = v2;
    atomic_compare_exchange_strong((atomic_uint *volatile)&self->_pending_collect, &v3, 2u);
  }
  while (v3 != v2);
  v4.receiver = self;
  v4.super_class = (Class)RBDevice;
  [(RBDevice *)&v4 dealloc];
}

- (MTLDevice)device
{
  return (MTLDevice *)*((void *)self->_device._p + 3);
}

- (MTLCaptureScope)captureScope
{
  return (MTLCaptureScope *)RB::Device::capture_scope((RB::Device *)self->_device._p);
}

- (CGImage)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5
{
  return (CGImage *)render_image((uint64_t)self, a4, (uint64_t)a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5 completionQueue:(id)a6 handler:(id)a7
{
}

+ (void)setAllowsRenderingInBackground:(BOOL)a3
{
  allows_rendering_in_background = a3;
}

+ (BOOL)allowsRenderingInBackground
{
  return allows_rendering_in_background;
}

+ (void)didEnterBackground:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v3 = RB::misc_log((RB *)a1);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v4)
  {
    *(_DWORD *)buf = 67109376;
    int v19 = is_running_in_background;
    __int16 v20 = 1024;
    int v21 = allows_rendering_in_background;
    _os_log_impl(&dword_2140F5000, v3, OS_LOG_TYPE_INFO, "RBDevice.didEnterBackground: in bg %{BOOL}d, allows bg: %{BOOL}d", buf, 0xEu);
  }
  if (!allows_rendering_in_background)
  {
    RB::ImageProvider::submit_all((RB::ImageProvider *)v4);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = +[RBDevice allDevices];
    id v6 = (RB *)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(RB::Device ***)(*((void *)&v13 + 1) + 8 * (void)v9);
          uint64_t v11 = (os_unfair_lock_s *)RB::Device::shared_surfaces(v10[1]);
          RB::SharedSurfaceGroup::render_async(v11);
          RB::SharedSurfaceGroup::render_updates((RB::SharedSurfaceGroup *)v11);
          dispatch_sync_f((dispatch_queue_t)[v10 queue], 0, (dispatch_function_t)+[RBDevice didEnterBackground:]::$_4::__invoke);
          uint64_t v9 = (RB *)((char *)v9 + 1);
        }
        while (v7 != v9);
        id v6 = (RB *)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v7 = v6;
      }
      while (v6);
    }
    is_running_in_background = 1;
    uint64_t v12 = RB::misc_log(v6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2140F5000, v12, OS_LOG_TYPE_INFO, "RBDevice.didEnterBackground: done", buf, 2u);
    }
  }
}

+ (void)willEnterForeground:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unsigned int v3 = RB::misc_log((RB *)a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109376;
    v4[1] = is_running_in_background;
    __int16 v5 = 1024;
    int v6 = allows_rendering_in_background;
    _os_log_impl(&dword_2140F5000, v3, OS_LOG_TYPE_INFO, "RBDevice.willEnterForeground: in bg %{BOOL}d, allows bg: %{BOOL}d", (uint8_t *)v4, 0xEu);
  }
  is_running_in_background = 0;
  if (!allows_rendering_in_background) {
    +[RBLayer willEnterForeground]();
  }
}

- (unint64_t)GPUPriority
{
  if (*(unsigned __int16 *)((char *)self->_device._p + 295) >= 0x100u) {
    return *(_WORD *)((char *)self->_device._p + 295);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setGPUPriority:(unint64_t)a3
{
  unsigned int v3 = *((void *)self->_device._p + 4);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __27__RBDevice_setGPUPriority___block_invoke;
  v4[3] = &unk_2641F8550;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(v3, v4);
}

uint64_t __27__RBDevice_setGPUPriority___block_invoke(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 40);
  if (v1 >= 0x100) {
    __int16 v2 = 0;
  }
  else {
    __int16 v2 = v1 | 0x100;
  }
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 295) = v2;
  return result;
}

- (unint64_t)backgroundGPUPriority
{
  if (*(unsigned __int16 *)((char *)self->_device._p + 293) >= 0x100u) {
    return *(_WORD *)((char *)self->_device._p + 293);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setBackgroundGPUPriority:(unint64_t)a3
{
  unsigned int v3 = *((void *)self->_device._p + 4);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __37__RBDevice_setBackgroundGPUPriority___block_invoke;
  v4[3] = &unk_2641F8550;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(v3, v4);
}

uint64_t __37__RBDevice_setBackgroundGPUPriority___block_invoke(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 40);
  if (v1 >= 0x100) {
    __int16 v2 = 0;
  }
  else {
    __int16 v2 = v1 | 0x100;
  }
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 293) = v2;
  return result;
}

- (id)pipelineDescriptions:(id)a3 extraColorFormats:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  int v40 = 1065353216;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v35;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(a3);
        }
        RB::FormattedRenderState::ID::ID((RB::FormattedRenderState::ID *)v41, (const char *)[*(id *)(*((void *)&v34 + 1) + 8 * v9) UTF8String]);
        std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::__emplace_unique_impl<RB::FormattedRenderState::ID>(&v38, v41);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v7);
  }
  if (*((void *)&v39 + 1))
  {
    if ([a4 count])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v10 = [a4 countByEnumeratingWithState:&v30 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v31;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(a4);
            }
            long long v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __endptr = (char *)[v13 UTF8String];
              uint64_t v14 = strtol(__endptr, &__endptr, 0);
              if (v14)
              {
                if (*__endptr == 58)
                {
                  int v15 = v14;
                  uint64_t v16 = strtol(__endptr + 1, 0, 0);
                  if (v16)
                  {
                    __int16 v17 = v16;
                    std::unordered_set<RB::FormattedRenderState>::unordered_set((uint64_t)v41, (uint64_t)&v38);
                    id v18 = v42;
                    if (v42)
                    {
                      int v19 = v17 & 0x3FF;
                      do
                      {
                        uint64_t v27 = v18[2];
                        unsigned int v20 = *((_DWORD *)v18 + 6);
                        unsigned int v28 = v20;
                        if ((v20 & 0x3FF) == v15)
                        {
                          unsigned int v28 = v20 & 0xFFFFFC00 | v19;
                          std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::__emplace_unique_key_args<RB::FormattedRenderState,RB::FormattedRenderState const&>((uint64_t)&v38, (unsigned int *)&v27, (uint64_t)&v27);
                        }
                        id v18 = (uint64_t *)*v18;
                      }
                      while (v18);
                    }
                    std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table((uint64_t)v41);
                  }
                }
              }
            }
            ++v12;
          }
          while (v12 != v10);
          uint64_t v10 = [a4 countByEnumeratingWithState:&v30 objects:v43 count:16];
        }
        while (v10);
      }
    }
    p = self->_device._p;
    std::unordered_set<RB::FormattedRenderState>::unordered_set((uint64_t)v26, (uint64_t)&v38);
    pipeline_set = (void *)RB::JSONPipeline::make_pipeline_set((RB::Device *)p, (unint64_t)v26);
    std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table((uint64_t)v26);
    id v23 = pipeline_set;
  }
  else
  {
    id v23 = (id)[MEMORY[0x263EFF8C0] array];
  }
  v24 = v23;
  std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table((uint64_t)&v38);
  return v24;
}

- (void).cxx_destruct
{
  p = self->_device._p;
  if (p)
  {
    if (atomic_fetch_add_explicit((atomic_uint *volatile)p + 2, 0xFFFFFFFF, memory_order_release) == 1)
    {
      __dmb(9u);
      (*(void (**)(void))(*(void *)p + 8))();
    }
  }
}

+ (void)allDevices
{
  BOOL v4 = *a3;
  uint64_t v5 = *((void *)*a3 + 9);
  if (*((void *)*a3 + 10) < (unint64_t)(v5 + 1))
  {
    result = RB::vector<RBDevice *,8ul,unsigned long>::reserve_slow(*a3, v5 + 1);
    uint64_t v5 = v4[9];
  }
  int v6 = (void *)v4[8];
  if (!v6) {
    int v6 = v4;
  }
  v6[v5] = a2;
  ++v4[9];
  return result;
}

@end