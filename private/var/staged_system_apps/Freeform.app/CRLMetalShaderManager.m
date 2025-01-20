@interface CRLMetalShaderManager
- (CRLMetalShaderManager)initWithDevice:(id)a3;
- (MTLDevice)device;
- (id)computeShaderWithName:(id)a3 initBlock:(id)a4;
- (id)defaultClampToEdgeSampler;
- (id)defaultClampToZeroSampler;
- (id)defaultLinearSampler;
- (id)defaultNearestSampler;
- (id)defaultSampler;
- (id)libraryForBundle:(id)a3;
- (id)linearClampToEdgeSampler;
- (id)linearClampToZeroSampler;
- (id)nearestClampToEdgeSampler;
- (id)nearestClampToZeroSampler;
- (id)samplerWithName:(id)a3 initBlock:(id)a4;
- (id)shaderWithName:(id)a3 initBlock:(id)a4;
@end

@implementation CRLMetalShaderManager

- (CRLMetalShaderManager)initWithDevice:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRLMetalShaderManager;
  v6 = [(CRLMetalShaderManager *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = +[NSMapTable strongToStrongObjectsMapTable];
    libraries = v7->_libraries;
    v7->_libraries = (NSMapTable *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    shaders = v7->_shaders;
    v7->_shaders = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    computeShaders = v7->_computeShaders;
    v7->_computeShaders = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableDictionary dictionary];
    samplers = v7->_samplers;
    v7->_samplers = (NSMutableDictionary *)v14;

    *(void *)&v7->_librariesLock._os_unfair_lock_opaque = 0;
    *(void *)&v7->_computeShadersLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)libraryForBundle:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_librariesLock);
  id v5 = [(NSMapTable *)self->_libraries objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = [(CRLMetalShaderManager *)self device];
    id v13 = 0;
    id v5 = [v6 newDefaultLibraryWithBundle:v4 error:&v13];
    id v7 = v13;

    if (!v5)
    {
      int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEE80);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106C570((uint64_t)v7, v8);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEEA0);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager libraryForBundle:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"];
      +[CRLAssertionHandler handleFailureInFunction:v10, v11, 57, 0, "Failed to create library, error %@", v7 file lineNumber isFatal description];
    }
    [(NSMapTable *)self->_libraries setObject:v5 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(&self->_librariesLock);

  return v5;
}

- (id)shaderWithName:(id)a3 initBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  os_unfair_lock_lock(&self->_shadersLock);
  int v8 = [(NSMutableDictionary *)self->_shaders objectForKeyedSubscript:v6];
  if (!v8)
  {
    int v8 = v7[2](v7);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEEC0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106C628();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEEE0);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager shaderWithName:initBlock:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 70, 0, "invalid nil value for '%{public}s'", "namedShader");
    }
    [(NSMutableDictionary *)self->_shaders setObject:v8 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(&self->_shadersLock);

  return v8;
}

- (id)computeShaderWithName:(id)a3 initBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  os_unfair_lock_lock(&self->_computeShadersLock);
  int v8 = [(NSMutableDictionary *)self->_computeShaders objectForKeyedSubscript:v6];
  if (!v8)
  {
    int v8 = v7[2](v7);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEF00);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106C6C0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEF20);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager computeShaderWithName:initBlock:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 83, 0, "invalid nil value for '%{public}s'", "namedShader");
    }
    [(NSMutableDictionary *)self->_computeShaders setObject:v8 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(&self->_computeShadersLock);

  return v8;
}

- (id)samplerWithName:(id)a3 initBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  os_unfair_lock_lock(&self->_samplersLock);
  int v8 = [(NSMutableDictionary *)self->_samplers objectForKeyedSubscript:v6];
  if (!v8)
  {
    int v8 = v7[2](v7);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEF40);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106C758();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEF60);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager samplerWithName:initBlock:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 97, 0, "invalid nil value for '%{public}s'", "namedSampler");
    }
    [(NSMutableDictionary *)self->_samplers setObject:v8 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(&self->_samplersLock);

  return v8;
}

- (id)defaultSampler
{
  return [(CRLMetalShaderManager *)self linearClampToZeroSampler];
}

- (id)defaultLinearSampler
{
  return [(CRLMetalShaderManager *)self linearClampToZeroSampler];
}

- (id)defaultNearestSampler
{
  return [(CRLMetalShaderManager *)self nearestClampToZeroSampler];
}

- (id)defaultClampToEdgeSampler
{
  return [(CRLMetalShaderManager *)self linearClampToEdgeSampler];
}

- (id)defaultClampToZeroSampler
{
  return [(CRLMetalShaderManager *)self linearClampToZeroSampler];
}

- (id)linearClampToEdgeSampler
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000613B0;
  v6[3] = &unk_1014CEF88;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  id v4 = [(CRLMetalShaderManager *)self samplerWithName:@"Linear Clamp To Edge Sampler" initBlock:v3];

  return v4;
}

- (id)linearClampToZeroSampler
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061524;
  v6[3] = &unk_1014CEF88;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  id v4 = [(CRLMetalShaderManager *)self samplerWithName:@"Linear Clamp To Zero Sampler" initBlock:v3];

  return v4;
}

- (id)nearestClampToEdgeSampler
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061698;
  v6[3] = &unk_1014CEF88;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  id v4 = [(CRLMetalShaderManager *)self samplerWithName:@"Nearest Clamp To Edge Sampler" initBlock:v3];

  return v4;
}

- (id)nearestClampToZeroSampler
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006180C;
  v6[3] = &unk_1014CEF88;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  id v4 = [(CRLMetalShaderManager *)self samplerWithName:@"Nearest Clamp To Zero Sampler" initBlock:v3];

  return v4;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_samplers, 0);
  objc_storeStrong((id *)&self->_computeShaders, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_libraries, 0);
}

@end