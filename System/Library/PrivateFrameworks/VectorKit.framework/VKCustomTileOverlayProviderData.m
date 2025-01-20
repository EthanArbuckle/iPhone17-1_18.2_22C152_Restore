@interface VKCustomTileOverlayProviderData
- (BOOL)forceContinuousLayout;
- (BOOL)forceNativeDisplayRate;
- (VKCustomTileOverlayProviderData)initWithProviderID:(unsigned int)a3 tileSize:(unsigned int)a4 minimumZ:(unsigned int)a5 maximumZ:(unsigned int)a6;
- (VKCustomTileOverlayProviderDelegate)delegate;
- (double)alpha;
- (unint64_t)desiredDisplayRate;
- (unsigned)maximumZ;
- (unsigned)minimumZ;
- (unsigned)providerID;
- (unsigned)tileSize;
- (void)setAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredDisplayRate:(unint64_t)a3;
- (void)setForceContinuousLayout:(BOOL)a3;
- (void)setForceNativeDisplayRate:(BOOL)a3;
@end

@implementation VKCustomTileOverlayProviderData

- (void).cxx_destruct
{
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

- (VKCustomTileOverlayProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCustomTileOverlayProviderDelegate *)WeakRetained;
}

- (void)setForceContinuousLayout:(BOOL)a3
{
  self->_forceContinuousLayout = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained customTileOverlayDidChangeDisplayRate:self];
}

- (BOOL)forceContinuousLayout
{
  return self->_forceContinuousLayout;
}

- (void)setForceNativeDisplayRate:(BOOL)a3
{
  self->_forceNativeDisplayRate = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained customTileOverlayDidChangeDisplayRate:self];
}

- (BOOL)forceNativeDisplayRate
{
  return self->_forceNativeDisplayRate;
}

- (void)setDesiredDisplayRate:(unint64_t)a3
{
  self->_desiredDisplayRate = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained customTileOverlayDidChangeDisplayRate:self];
}

- (unint64_t)desiredDisplayRate
{
  return self->_desiredDisplayRate;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained customTileOverlayDidChangeAlpha:self];
}

- (double)alpha
{
  return self->_alpha;
}

- (VKCustomTileOverlayProviderData)initWithProviderID:(unsigned int)a3 tileSize:(unsigned int)a4 minimumZ:(unsigned int)a5 maximumZ:(unsigned int)a6
{
  v14.receiver = self;
  v14.super_class = (Class)VKCustomTileOverlayProviderData;
  v10 = [(VKCustomTileOverlayProviderData *)&v14 init];
  v11 = v10;
  if (v10)
  {
    *(_WORD *)&v10->_forceNativeDisplayRate = 0;
    v10->_providerID = a3;
    v10->_tileSize = a4;
    v10->_minimumZ = a5;
    v10->_maximumZ = a6;
    v10->_desiredDisplayRate = 0;
    v10->_alpha = 1.0;
    v12 = v10;
  }

  return v11;
}

@end