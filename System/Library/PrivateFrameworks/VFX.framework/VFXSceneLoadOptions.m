@interface VFXSceneLoadOptions
- ($0B5AAA5EDDD3F9F6D304638ADE998406)counterStorage;
- (BOOL)allowLoadingFromFuture;
- (BOOL)automaticallyPrepareScene;
- (BOOL)doNotClearRenderOutput;
- (BOOL)enableDeferredRendering;
- (BOOL)enableParallelDecoding;
- (BOOL)enableRuntimeScriptCompilation;
- (BOOL)isAuthoringWorld;
- (BOOL)isVFX2;
- (BOOL)loadBindingsMetadata;
- (BOOL)setupAsTemplate;
- (BOOL)setupAsyncRuntime;
- (BOOL)setupRenderer;
- (BOOL)useGammaBlending;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (NSString)clientID;
- (NSURL)metalLibraryURL;
- (VFXSceneLoadOptions)init;
- (__CFXWorld)world;
- (_opaque_pthread_mutex_t)asyncRuntimeLock;
- (char)internalPixelFormatDepth;
- (int)peerPid;
- (unint64_t)colorPixelFormat;
- (unint64_t)depthPixelFormat;
- (unsigned)peerTaskIdentity;
- (void)registerVFX2AuthoringSystems:(BOOL)a3;
- (void)setAllowLoadingFromFuture:(BOOL)a3;
- (void)setAsyncRuntimeLock:(_opaque_pthread_mutex_t *)a3;
- (void)setAutomaticallyPrepareScene:(BOOL)a3;
- (void)setClientID:(id)a3;
- (void)setColorPixelFormat:(unint64_t)a3;
- (void)setCommandQueue:(id)a3;
- (void)setCounterStorage:(id)a3;
- (void)setDepthPixelFormat:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDoNotClearRenderOutput:(BOOL)a3;
- (void)setEnableDeferredRendering:(BOOL)a3;
- (void)setEnableParallelDecoding:(BOOL)a3;
- (void)setEnableRuntimeScriptCompilation:(BOOL)a3;
- (void)setInternalPixelFormatDepth:(char)a3;
- (void)setIsAuthoringWorld:(BOOL)a3;
- (void)setIsVFX2:(BOOL)a3;
- (void)setLoadBindingsMetadata:(BOOL)a3;
- (void)setMetalLibraryURL:(id)a3;
- (void)setPeerPid:(int)a3;
- (void)setPeerTaskIdentity:(unsigned int)a3;
- (void)setSetupAsTemplate:(BOOL)a3;
- (void)setSetupAsyncRuntime:(BOOL)a3;
- (void)setSetupRenderer:(BOOL)a3;
- (void)setUseGammaBlending:(BOOL)a3;
- (void)setWorld:(__CFXWorld *)a3;
@end

@implementation VFXSceneLoadOptions

- (VFXSceneLoadOptions)init
{
  return (VFXSceneLoadOptions *)VFXScene.LoadOptions.init()();
}

- (BOOL)isAuthoringWorld
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isAuthoringWorld);
}

- (void)setIsAuthoringWorld:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isAuthoringWorld) = a3;
}

- (BOOL)isVFX2
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isVFX2);
}

- (void)setIsVFX2:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_isVFX2) = a3;
}

- (BOOL)enableRuntimeScriptCompilation
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableRuntimeScriptCompilation);
}

- (void)setEnableRuntimeScriptCompilation:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableRuntimeScriptCompilation) = a3;
}

- (BOOL)allowLoadingFromFuture
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_allowLoadingFromFuture);
}

- (void)setAllowLoadingFromFuture:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_allowLoadingFromFuture) = a3;
}

- (BOOL)setupAsTemplate
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsTemplate);
}

- (void)setSetupAsTemplate:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsTemplate) = a3;
}

- (BOOL)automaticallyPrepareScene
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_automaticallyPrepareScene);
}

- (void)setAutomaticallyPrepareScene:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_automaticallyPrepareScene) = a3;
}

- (BOOL)setupAsyncRuntime
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsyncRuntime);
}

- (void)setSetupAsyncRuntime:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupAsyncRuntime) = a3;
}

- (__CFXWorld)world
{
  return (__CFXWorld *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___VFXSceneLoadOptions_world));
}

- (void)setWorld:(__CFXWorld *)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_world) = (Class)a3;
}

- (_opaque_pthread_mutex_t)asyncRuntimeLock
{
  return *(_opaque_pthread_mutex_t **)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_asyncRuntimeLock);
}

- (void)setAsyncRuntimeLock:(_opaque_pthread_mutex_t *)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_asyncRuntimeLock) = (Class)a3;
}

- (BOOL)loadBindingsMetadata
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_loadBindingsMetadata);
}

- (void)setLoadBindingsMetadata:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_loadBindingsMetadata) = a3;
}

- (BOOL)enableParallelDecoding
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableParallelDecoding);
}

- (void)setEnableParallelDecoding:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableParallelDecoding) = a3;
}

- (BOOL)setupRenderer
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupRenderer);
}

- (void)setSetupRenderer:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_setupRenderer) = a3;
}

- (unint64_t)colorPixelFormat
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_colorPixelFormat);
}

- (void)setColorPixelFormat:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_colorPixelFormat) = (Class)a3;
}

- (unint64_t)depthPixelFormat
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_depthPixelFormat);
}

- (void)setDepthPixelFormat:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_depthPixelFormat) = (Class)a3;
}

- (BOOL)enableDeferredRendering
{
  return (*((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableDeferredRendering) == 2) | *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableDeferredRendering) & 1;
}

- (void)setEnableDeferredRendering:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_enableDeferredRendering) = a3;
}

- (char)internalPixelFormatDepth
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_internalPixelFormatDepth);
}

- (void)setInternalPixelFormatDepth:(char)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_internalPixelFormatDepth) = a3;
}

- (BOOL)useGammaBlending
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_useGammaBlending);
}

- (void)setUseGammaBlending:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_useGammaBlending) = a3;
}

- (BOOL)doNotClearRenderOutput
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_doNotClearRenderOutput);
}

- (void)setDoNotClearRenderOutput:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_doNotClearRenderOutput) = a3;
}

- (MTLDevice)device
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MTLDevice *)v2;
}

- (void)setDevice:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MTLCommandQueue *)v2;
}

- (void)setCommandQueue:(id)a3
{
}

- (NSString)clientID
{
  if (*(void *)&self->isAuthoringWorld[OBJC_IVAR___VFXSceneLoadOptions_clientID])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B6E31768();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setClientID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B6E31798();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___VFXSceneLoadOptions_clientID);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSURL)metalLibraryURL
{
  return (NSURL *)sub_1B6882D4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___VFXSceneLoadOptions_metalLibraryURL);
}

- (void)setMetalLibraryURL:(id)a3
{
}

- ($0B5AAA5EDDD3F9F6D304638ADE998406)counterStorage
{
  return *($0B5AAA5EDDD3F9F6D304638ADE998406 *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_counterStorage);
}

- (void)setCounterStorage:(id)a3
{
  *($0B5AAA5EDDD3F9F6D304638ADE998406 *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_counterStorage) = a3;
}

- (int)peerPid
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerPid);
}

- (void)setPeerPid:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerPid) = a3;
}

- (unsigned)peerTaskIdentity
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerTaskIdentity);
}

- (void)setPeerTaskIdentity:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_peerTaskIdentity) = a3;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___VFXSceneLoadOptions_metalLibraryURL;

  sub_1B663ABE8((uint64_t)v3);
}

- (void)registerVFX2AuthoringSystems:(BOOL)a3
{
  uint64_t v3 = 2147517449;
  if (a3) {
    uint64_t v3 = 0x1008000840FLL;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXSceneLoadOptions_systemRegistrationOptions) = (Class)v3;
}

@end