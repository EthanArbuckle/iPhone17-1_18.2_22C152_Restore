@interface VKRasterTileOverlayProviderData
- (BOOL)autoreverses;
- (BOOL)crossfadeKeyframes;
- (CGImage)colorMap;
- (NSArray)keyTimes;
- (NSString)fillMode;
- (VKRasterTileOverlayProviderData)initWithProviderID:(unsigned int)a3 tileSize:(unsigned int)a4 minimumZ:(unsigned int)a5 maximumZ:(unsigned int)a6 keyframesCount:(unsigned __int16)a7 duration:(double)a8 crossfadeKeyframes:(BOOL)a9;
- (VKRasterTileOverlayProviderDelegate)delegate;
- (double)alpha;
- (double)beginTime;
- (double)duration;
- (double)repeatDuration;
- (double)timeOffset;
- (float)repeatCount;
- (float)speed;
- (int)keyframeIndexOverride;
- (unsigned)keyframesCount;
- (unsigned)maximumZ;
- (unsigned)minimumZ;
- (unsigned)providerID;
- (unsigned)tileSize;
- (unsigned)visibleKeyframeIndex;
- (void)dealloc;
- (void)setAlpha:(double)a3;
- (void)setAutoreverses:(BOOL)a3;
- (void)setBeginTime:(double)a3;
- (void)setColorMap:(CGImage *)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFillMode:(id)a3;
- (void)setKeyTimes:(id)a3;
- (void)setKeyframeIndexOverride:(int)a3;
- (void)setKeyframesCount:(unsigned __int16)a3;
- (void)setRepeatCount:(float)a3;
- (void)setRepeatDuration:(double)a3;
- (void)setSpeed:(float)a3;
- (void)setTimeOffset:(double)a3;
- (void)setVisibleKeyframeIndex:(unsigned int)a3;
@end

@implementation VKRasterTileOverlayProviderData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTimes, 0);
  objc_storeStrong((id *)&self->_fillMode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setKeyTimes:(id)a3
{
}

- (NSArray)keyTimes
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFillMode:(id)a3
{
}

- (NSString)fillMode
{
  return self->_fillMode;
}

- (void)setAutoreverses:(BOOL)a3
{
  self->_autoreverses = a3;
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

- (void)setSpeed:(float)a3
{
  self->_speed = a3;
}

- (float)speed
{
  return self->_speed;
}

- (void)setRepeatDuration:(double)a3
{
  self->_repeatDuration = a3;
}

- (double)repeatDuration
{
  return self->_repeatDuration;
}

- (void)setRepeatCount:(float)a3
{
  self->_repeatCount = a3;
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (CGImage)colorMap
{
  return self->_colorMap;
}

- (void)setVisibleKeyframeIndex:(unsigned int)a3
{
  self->_visibleKeyframeIndex = a3;
}

- (unsigned)visibleKeyframeIndex
{
  return self->_visibleKeyframeIndex;
}

- (int)keyframeIndexOverride
{
  return self->_keyframeIndexOverride;
}

- (BOOL)crossfadeKeyframes
{
  return self->_crossfadeKeyframes;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setKeyframesCount:(unsigned __int16)a3
{
  self->_keyframesCount = a3;
}

- (unsigned)keyframesCount
{
  return self->_keyframesCount;
}

- (unsigned)maximumZ
{
  return self->_maximumZ;
}

- (unsigned)minimumZ
{
  return self->_minimumZ;
}

- (unsigned)tileSize
{
  return self->_tileSize;
}

- (unsigned)providerID
{
  return self->_providerID;
}

- (void)setDelegate:(id)a3
{
}

- (VKRasterTileOverlayProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKRasterTileOverlayProviderDelegate *)WeakRetained;
}

- (void)setKeyframeIndexOverride:(int)a3
{
  if (self->_keyframeIndexOverride != a3)
  {
    self->_keyframeIndexOverride = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained rasterTileOverlayNeedsDisplay:self];
  }
}

- (void)setColorMap:(CGImage *)a3
{
  colorMap = self->_colorMap;
  if (colorMap != a3)
  {
    CGImageRelease(colorMap);
    self->_colorMap = CGImageRetain(a3);
    id v6 = [(VKRasterTileOverlayProviderData *)self delegate];
    [v6 rasterTileOverlayNeedsInvalidate:self];
  }
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained rasterTileOverlayDidChangeAlpha:self];
}

- (double)alpha
{
  return self->_alpha;
}

- (void)dealloc
{
  CGImageRelease(self->_colorMap);
  v3.receiver = self;
  v3.super_class = (Class)VKRasterTileOverlayProviderData;
  [(VKRasterTileOverlayProviderData *)&v3 dealloc];
}

- (VKRasterTileOverlayProviderData)initWithProviderID:(unsigned int)a3 tileSize:(unsigned int)a4 minimumZ:(unsigned int)a5 maximumZ:(unsigned int)a6 keyframesCount:(unsigned __int16)a7 duration:(double)a8 crossfadeKeyframes:(BOOL)a9
{
  v20.receiver = self;
  v20.super_class = (Class)VKRasterTileOverlayProviderData;
  v16 = [(VKRasterTileOverlayProviderData *)&v20 init];
  v17 = (VKRasterTileOverlayProviderData *)v16;
  if (v16)
  {
    *((_DWORD *)v16 + 6) = a3;
    *((_DWORD *)v16 + 7) = a4;
    *((_DWORD *)v16 + 8) = a5;
    *((_DWORD *)v16 + 9) = a6;
    *((_WORD *)v16 + 20) = a7;
    *((double *)v16 + 6) = a8;
    v16[56] = a9;
    *(void *)(v16 + 60) = 0xFFFFFFFFLL;
    *((void *)v16 + 2) = 0x3FF0000000000000;
    *((void *)v16 + 12) = 0;
    *((void *)v16 + 9) = 0;
    *((void *)v16 + 10) = 0;
    *((_DWORD *)v16 + 22) = 0;
    *((_DWORD *)v16 + 26) = 1065353216;
    v16[108] = 0;
    objc_storeStrong((id *)v16 + 14, (id)*MEMORY[0x1E4F39FB0]);
    v18 = v17;
  }

  return v17;
}

@end