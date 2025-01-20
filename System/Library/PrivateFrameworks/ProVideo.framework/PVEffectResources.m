@interface PVEffectResources
+ (BOOL)isInteractiveMode;
+ (float)getCVTextureCacheMaxiumumTextureAge;
+ (id)utObserver;
+ (int)memoryEnvironment;
+ (void)applicationWillTerminate;
+ (void)cleanupEffectsCache;
+ (void)clearAllCachesAndPools;
+ (void)flushEngine;
+ (void)setCVTextureCacheMaximumTextureAge:(float)a3;
+ (void)setInteractiveMode:(BOOL)a3;
+ (void)setUTObserver:(id)a3;
+ (void)shutdownEngine;
+ (void)updateMemoryEnvironment:(int)a3;
@end

@implementation PVEffectResources

+ (void)cleanupEffectsCache
{
  +[PVEffect handleCleanupEffectsCache];

  +[PVMotionEffect handleCleanupEffectsCache];
}

+ (void)setInteractiveMode:(BOOL)a3
{
  BOOL v3 = a3;
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  PVRenderManager::SetInteractiveMode(v4, v3);
  if (v4) {
    (*(void (**)(PVRenderManager *))(*(void *)v4 + 24))(v4);
  }
}

+ (BOOL)isInteractiveMode
{
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  char InteractiveMode = PVRenderManager::GetInteractiveMode(v4);
  if (v4) {
    (*(void (**)(PVRenderManager *))(*(void *)v4 + 24))(v4);
  }
  return InteractiveMode;
}

+ (void)updateMemoryEnvironment:(int)a3
{
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  PVRenderManager::updateMemoryEnvironment(v4, a3);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
  }
}

+ (int)memoryEnvironment
{
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  int MemoryEnvironment = PVRenderManager::GetMemoryEnvironment(v4);
  if (v4) {
    (*(void (**)(PVRenderManager *))(*(void *)v4 + 24))(v4);
  }
  return MemoryEnvironment;
}

+ (void)setCVTextureCacheMaximumTextureAge:(float)a3
{
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  PVRenderManager::SetCVTextureCacheMaximumTextureAge(v4, a3);
  if (v4) {
    (*(void (**)(PVRenderManager *))(*(void *)v4 + 24))(v4);
  }
}

+ (float)getCVTextureCacheMaxiumumTextureAge
{
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  float CVTextureCacheMaximumTextureAge = PVRenderManager::GetCVTextureCacheMaximumTextureAge(v4);
  if (v4) {
    (*(void (**)(PVRenderManager *))(*(void *)v4 + 24))(v4);
  }
  return CVTextureCacheMaximumTextureAge;
}

+ (void)applicationWillTerminate
{
  +[PVEffect handleApplicationWillTerminate];

  +[PVMotionEffect handleApplicationWillTerminate];
}

+ (void)clearAllCachesAndPools
{
  +[PVEffect handleApplicationDidReceiveMemoryWarning];
  +[PVMotionEffect handleApplicationDidReceiveMemoryWarning];
  +[PVCinematicEffect handleApplicationDidReceiveMemoryWarning];
  PVRenderManager::INSTANCE((PVRenderManager *)[a1 cleanupEffectsCache], &v3);
  PVRenderManager::FreeTexturePools(v3);
  if (v3) {
    (*(void (**)(PVRenderManager *))(*(void *)v3 + 24))(v3);
  }
}

+ (void)flushEngine
{
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v3) >= 1) {
    kdebug_trace();
  }
  PVRenderManager::Pause(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v4) >= 1) {
    kdebug_trace();
  }
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1) {
    kdebug_trace();
  }
  PVRenderManager::CancelAllRenderJobs(v13, 1);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1) {
    kdebug_trace();
  }
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1) {
    kdebug_trace();
  }
  PVRenderManager::WaitForCommandBuffersToComplete(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v8) >= 1) {
    kdebug_trace();
  }
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v9) >= 1) {
    kdebug_trace();
  }
  [a1 clearAllCachesAndPools];
  PVRenderManager::ForceFlushRendererResources(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v10) >= 1) {
    kdebug_trace();
  }
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v11) >= 1) {
    kdebug_trace();
  }
  PVRenderManager::Resume(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v12) >= 1) {
    kdebug_trace();
  }
  if (v13) {
    (*(void (**)(PVRenderManager *))(*(void *)v13 + 24))(v13);
  }
}

+ (void)shutdownEngine
{
  NSLog(&cfstr_ShuttingDownPv.isa, a2);
  PVRenderManager::INSTANCE(v2, &v3);
  PVRenderManager::Pause(v3);
  PVRenderManager::CancelAllRenderJobs(v3, 1);
  PVRenderManager::WaitForCommandBuffersToComplete(v3);
  PVRenderManager::Shutdown(v3);
  if (v3) {
    (*(void (**)(PVRenderManager *))(*(void *)v3 + 24))(v3);
  }
}

+ (void)setUTObserver:(id)a3
{
}

+ (id)utObserver
{
  return (id)sUTObserver;
}

@end