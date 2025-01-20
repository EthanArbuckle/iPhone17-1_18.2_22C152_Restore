@interface PVCameraPreviewRenderer
- (HGRef<HGGLContext>)rootContext;
- (HGRef<PVRenderManager>)renderManager;
- (PVCameraPreviewRenderer)init;
- (id).cxx_construct;
- (void)dealloc;
- (void)enqueueRenderRequest:(id)a3 completion:(id)a4;
@end

@implementation PVCameraPreviewRenderer

- (PVCameraPreviewRenderer)init
{
  v10.receiver = self;
  v10.super_class = (Class)PVCameraPreviewRenderer;
  v2 = [(PVCameraPreviewRenderer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    PVRenderManager::INSTANCE((PVRenderManager *)v2, &v9);
    m_Obj = v3->_renderManager.m_Obj;
    v5 = v9;
    if (m_Obj == v9)
    {
      if (m_Obj)
      {
        (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 24))(v3->_renderManager.m_Obj);
        v5 = v3->_renderManager.m_Obj;
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 24))(v3->_renderManager.m_Obj);
        v5 = v9;
      }
      v3->_renderManager.m_Obj = v5;
    }
    PVRenderManager::SetupTextureFactories(v5, 0.5);
    uint64_t v6 = +[PVVideoCompositingContext createContextForGPU];
    compositingContext = v3->_compositingContext;
    v3->_compositingContext = (PVVideoCompositingContext *)v6;
  }
  return v3;
}

- (void)dealloc
{
  PVRenderManager::TearDownTextureFactories(self->_renderManager.m_Obj);
  v3.receiver = self;
  v3.super_class = (Class)PVCameraPreviewRenderer;
  [(PVCameraPreviewRenderer *)&v3 dealloc];
}

- (HGRef<PVRenderManager>)renderManager
{
  m_Obj = self->_renderManager.m_Obj;
  PVCameraPreviewRenderer *v2 = m_Obj;
  if (m_Obj) {
    return (HGRef<PVRenderManager>)(*(uint64_t (**)(void))(*(void *)m_Obj + 16))();
  }
  return (HGRef<PVRenderManager>)m_Obj;
}

- (HGRef<HGGLContext>)rootContext
{
  return (HGRef<HGGLContext>)PVRenderManager::GetRootContext(self->_renderManager.m_Obj, v2);
}

- (void)enqueueRenderRequest:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && v6)
  {
    if (self->_currentRenderJob.m_Obj) {
      PVRenderManager::CancelRenderJob((uint64_t)self->_renderManager.m_Obj, &self->_currentRenderJob.m_Obj);
    }
    v7 = (HGRenderJob *)HGObject::operator new(0x180uLL);
    m_Obj = self->_renderManager.m_Obj;
    objc_super v10 = m_Obj;
    if (m_Obj) {
      (*(void (**)(PVRenderManager *))(*(void *)m_Obj + 16))(m_Obj);
    }
    PVCameraPreviewGraphBuildJob::PVCameraPreviewGraphBuildJob(v7, (uint64_t)&v10, v9, self->_compositingContext, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingContext, 0);
  m_Obj = self->_currentRenderJob.m_Obj;
  if (m_Obj) {
    (*(void (**)(HGRenderJob *))(*(void *)m_Obj + 24))(m_Obj);
  }
  v4 = self->_renderManager.m_Obj;
  if (v4) {
    (*(void (**)(PVRenderManager *))(*(void *)v4 + 24))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end