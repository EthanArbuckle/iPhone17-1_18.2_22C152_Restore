@interface _ANEVirtualModel
+ (id)new;
+ (id)objectWithModel:(id)a3;
+ (void)initialize;
- (BOOL)removeCachedReference;
- (_ANEModel)model;
- (_ANEVirtualModel)init;
- (_ANEVirtualModel)initWithModel:(id)a3;
- (int64_t)refcount;
- (void)addCachedReference;
- (void)setModel:(id)a3;
- (void)setRefcount:(int64_t)a3;
@end

@implementation _ANEVirtualModel

+ (void)initialize
{
  gLogger = (uint64_t)os_log_create("com.apple.ane", "ANEVirtualModel");
  MEMORY[0x270F9A758]();
}

+ (id)new
{
  return 0;
}

- (_ANEVirtualModel)init
{
  return 0;
}

- (_ANEVirtualModel)initWithModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ANEVirtualModel;
  v6 = [(_ANEVirtualModel *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(_ANEVirtualModel *)v6 setModel:v5];
    [(_ANEVirtualModel *)v7 setRefcount:1];
    v8 = (void *)gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      [(_ANEVirtualModel *)v8 initWithModel:v7];
    }
  }

  return v7;
}

+ (id)objectWithModel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithModel:v4];

  return v5;
}

- (void)addCachedReference
{
  id v5 = a1;
  v6 = NSStringFromSelector(a2);
  v7 = [a3 model];
  v8 = [v7 modelURL];
  [a3 refcount];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_258723000, v9, v10, "%@: ANEVirtualModel addCachedReference model url %@ refcount %lld", v11, v12, v13, v14, v15);
}

- (BOOL)removeCachedReference
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = [(_ANEVirtualModel *)self model];

  if (!v4) {
    return 1;
  }
  [(_ANEVirtualModel *)self setRefcount:[(_ANEVirtualModel *)self refcount] - 1];
  int64_t v5 = [(_ANEVirtualModel *)self refcount];
  BOOL v6 = v5 < 1;
  v7 = (void *)gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    BOOL v8 = v5 < 1;
    uint64_t v9 = v7;
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [(_ANEVirtualModel *)self model];
    uint64_t v12 = [v11 modelURL];
    int v14 = 138413058;
    uint8_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v12;
    __int16 v18 = 2048;
    int64_t v19 = [(_ANEVirtualModel *)self refcount];
    __int16 v20 = 1024;
    BOOL v21 = v8;
    _os_log_debug_impl(&dword_258723000, v9, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualModel removeCachedReference model url %@ refcount %lld canBeRemoved %d", (uint8_t *)&v14, 0x26u);
  }
  return v6;
}

- (_ANEModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (int64_t)refcount
{
  return self->_refcount;
}

- (void)setRefcount:(int64_t)a3
{
  self->_refcount = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithModel:(void *)a3 .cold.1(void *a1, const char *a2, void *a3)
{
  id v5 = a1;
  BOOL v6 = NSStringFromSelector(a2);
  v7 = [a3 model];
  BOOL v8 = [v7 modelURL];
  [a3 refcount];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_258723000, v9, v10, "%@: ANEVirtualModel initWithModel model url %@ refcount %lld", v11, v12, v13, v14, v15);
}

@end