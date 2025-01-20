@interface VKPlatform
+ (id)sharedPlatform;
- (BOOL)allows3DPuck;
- (BOOL)canMakeSharingThumbnails;
- (BOOL)isIphone;
- (BOOL)isMac;
- (BOOL)isPad;
- (BOOL)lowPerformanceDevice;
- (BOOL)proceduralRoadAlpha;
- (BOOL)reduceMotionEnabled;
- (BOOL)roadsWithSimpleLineMeshesAvailable;
- (BOOL)shouldDrawWhenReady;
- (BOOL)shouldStyleLabelsInParallel;
- (BOOL)supports3DBuildingStrokes;
- (BOOL)supports3DBuildings;
- (BOOL)supportsARMode;
- (BOOL)supportsBuildingShadows;
- (BOOL)supportsBuildingStrokes;
- (BOOL)supportsCoastlineGlows;
- (BOOL)supportsHiResBuildings;
- (BOOL)supportsHiResRTT;
- (BOOL)supportsPerFragmentLighting;
- (BOOL)useCheapTrafficShader;
- (VKPlatform)init;
- (char)tileZBias;
- (double)routeLineSimplificationEpsilon;
- (unint64_t)_calculateMemSize;
- (unint64_t)memorySize;
- (unint64_t)tileMaximumLimit:(unint64_t)a3;
- (unsigned)explicitDefaultRefreshRate;
- (unsigned)preferredFrequencyUpdate;
- (unsigned)processingQueueWidth;
- (unsigned)tileDecodeQueueWidth;
- (unsigned)tilePrefetchNumberOfScreens;
- (void)_determineHardware;
@end

@implementation VKPlatform

void __19__VKPlatform_isPad__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v1 = v0;
    -[VKPlatform isPad]::deviceClass = [v0 intValue];
    v0 = v1;
  }
}

void __22__VKPlatform_isIphone__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v1 = v0;
    -[VKPlatform isIphone]::deviceClass = [v0 intValue];
    v0 = v1;
  }
}

- (BOOL)isPad
{
  if (-[VKPlatform isPad]::once != -1) {
    dispatch_once(&-[VKPlatform isPad]::once, &__block_literal_global_37);
  }
  return -[VKPlatform isPad]::deviceClass == 3;
}

- (BOOL)supportsPerFragmentLighting
{
  return self->_supportsPerFragmentLighting;
}

- (BOOL)lowPerformanceDevice
{
  return self->_lowPerformanceDevice;
}

- (char)tileZBias
{
  return 0;
}

- (BOOL)allows3DPuck
{
  return 1;
}

- (unsigned)preferredFrequencyUpdate
{
  char v3 = MGGetBoolAnswer();
  if (![(VKPlatform *)self isIphone] || (v3 & 1) == 0) {
    [(VKPlatform *)self isPad];
  }
  return 4;
}

- (unsigned)explicitDefaultRefreshRate
{
  int v3 = MGGetBoolAnswer();
  if (([(VKPlatform *)self isIphone] & v3) != 0) {
    return 60;
  }
  else {
    return 0;
  }
}

- (BOOL)isIphone
{
  if (-[VKPlatform isIphone]::once != -1) {
    dispatch_once(&-[VKPlatform isIphone]::once, &__block_literal_global_42);
  }
  return -[VKPlatform isIphone]::deviceClass == 1;
}

- (unsigned)tilePrefetchNumberOfScreens
{
  return 3;
}

+ (id)sharedPlatform
{
  if (+[VKPlatform sharedPlatform]::onceToken != -1) {
    dispatch_once(&+[VKPlatform sharedPlatform]::onceToken, &__block_literal_global_11798);
  }
  v2 = (void *)_singleton;
  return v2;
}

- (unsigned)tileDecodeQueueWidth
{
  if (self->_numCPUs <= 1) {
    return 2;
  }
  else {
    return 6;
  }
}

- (BOOL)shouldStyleLabelsInParallel
{
  return 0;
}

void __28__VKPlatform_sharedPlatform__block_invoke()
{
  v0 = objc_alloc_init(VKPlatform);
  id v1 = (void *)_singleton;
  _singleton = (uint64_t)v0;
}

- (VKPlatform)init
{
  v5.receiver = self;
  v5.super_class = (Class)VKPlatform;
  v2 = [(VKPlatform *)&v5 init];
  int v3 = v2;
  if (v2)
  {
    [(VKPlatform *)v2 _determineHardware];
    v3->_proceduralRoadAlpha = MGGetBoolAnswer();
    v3->_useCheapTrafficShader = MGGetBoolAnswer();
    v3->_supportsBuildingStrokes = MGGetBoolAnswer();
    v3->_supports3DBuildingStrokes = MGGetBoolAnswer();
    v3->_supportsCoastlineGlows = MGGetBoolAnswer();
    v3->_lowPerformanceDevice = 0;
    v3->_supportsPerFragmentLighting = MGGetBoolAnswer();
    v3->_supportsARMode = MGGetBoolAnswer();
  }
  return v3;
}

- (void)_determineHardware
{
  self->_memSize = [(VKPlatform *)self _calculateMemSize];
  size_t v4 = 4;
  p_numCPUs = &self->_numCPUs;
  if (sysctlbyname("hw.ncpu", p_numCPUs, &v4, 0, 0)) {
    int *p_numCPUs = 1;
  }
}

- (unint64_t)_calculateMemSize
{
  size_t v3 = 8;
  unint64_t v4 = 0;
  sysctlbyname("hw.memsize", &v4, &v3, 0, 0);
  return v4 >> 20;
}

- (BOOL)supportsBuildingStrokes
{
  return self->_supportsBuildingStrokes;
}

- (BOOL)supportsBuildingShadows
{
  return 1;
}

- (BOOL)supports3DBuildings
{
  return 1;
}

- (BOOL)supports3DBuildingStrokes
{
  return self->_supports3DBuildingStrokes;
}

- (double)routeLineSimplificationEpsilon
{
  return 5.0;
}

- (BOOL)supportsARMode
{
  return self->_supportsARMode;
}

- (BOOL)supportsCoastlineGlows
{
  return self->_supportsCoastlineGlows;
}

- (BOOL)useCheapTrafficShader
{
  return self->_useCheapTrafficShader;
}

- (BOOL)proceduralRoadAlpha
{
  return self->_proceduralRoadAlpha;
}

- (unint64_t)memorySize
{
  return self->_memSize;
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabled() != 0;
}

- (unsigned)processingQueueWidth
{
  int numCPUs = self->_numCPUs;
  if (numCPUs <= 2) {
    LOBYTE(numCPUs) = 2;
  }
  return numCPUs - 1;
}

- (BOOL)supportsHiResBuildings
{
  return 0;
}

- (BOOL)shouldDrawWhenReady
{
  return self->_numCPUs > 1;
}

- (BOOL)isMac
{
  return self->_isMac;
}

- (BOOL)canMakeSharingThumbnails
{
  return self->_memSize > 0x100;
}

- (BOOL)supportsHiResRTT
{
  return 1;
}

- (unint64_t)tileMaximumLimit:(unint64_t)a3
{
  unint64_t memSize = self->_memSize;
  if (self->_isMac)
  {
    double v4 = *((double *)&xmmword_1A28FC7D0 + (memSize <= 0x2000));
    if (memSize <= 0x1000) {
      double v4 = 0.3;
    }
    double v5 = (double)memSize * (v4 + v4);
  }
  else
  {
    double v5 = (double)memSize + (double)memSize;
  }
  if (a3 <= 1) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = a3;
  }
  return (unint64_t)(v5 / (double)v6);
}

- (BOOL)roadsWithSimpleLineMeshesAvailable
{
  if (-[VKPlatform roadsWithSimpleLineMeshesAvailable]::once != -1) {
    dispatch_once(&-[VKPlatform roadsWithSimpleLineMeshesAvailable]::once, &__block_literal_global_32_11765);
  }
  return -[VKPlatform roadsWithSimpleLineMeshesAvailable]::_simpleLineRoads;
}

void __48__VKPlatform_roadsWithSimpleLineMeshesAvailable__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  id v1 = v0;
  if (v0) {
    char v2 = [v0 BOOLValue];
  }
  else {
    char v2 = 0;
  }

  -[VKPlatform roadsWithSimpleLineMeshesAvailable]::_simpleLineRoads = v2;
}

@end