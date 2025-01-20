@interface SUICHandsOnAutoDismissalStrategy
- (BOOL)shouldDismiss;
- (double)idleTimeInterval;
- (id)_mapsNavigationStatusIsActiveBlock;
- (void)_setMapsNavigationStatusIsActiveBlock:(id)a3;
@end

@implementation SUICHandsOnAutoDismissalStrategy

- (double)idleTimeInterval
{
  [(SUICAutoDismissalStrategy *)self minimumIdleTimeInterval];
  double v4 = v3;
  [(SUICAutoDismissalStrategy *)self idleTimeout];
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (BOOL)shouldDismiss
{
  if ([(SUICAutoDismissalStrategy *)self isVideoPlaying]
    || [(SUICAutoDismissalStrategy *)self userInteractedWithTouchScreen]
    || [(SUICAutoDismissalStrategy *)self userInteractedWithTouchIDSensor]
    || ![(SUICAutoDismissalStrategy *)self deviceSupportsFaceDetection]
    && [(SUICAutoDismissalStrategy *)self deviceSupportsRaiseGestureDetection]
    && [(SUICAutoDismissalStrategy *)self latestDeviceMotionEvent] == 1
    || [(SUICAutoDismissalStrategy *)self deviceSupportsFaceDetection]
    && [(SUICAutoDismissalStrategy *)self latestFaceAwarenessEvent] == 1)
  {
    LOBYTE(v3) = 0;
    uint64_t v4 = 0;
  }
  else
  {
    v6 = [(SUICHandsOnAutoDismissalStrategy *)self _mapsNavigationStatusIsActiveBlock];
    unsigned int v3 = v6[2]();

    uint64_t v4 = v3;
  }
  [(SUICAutoDismissalStrategy *)self setAutoDismissalReason:v4];
  return v3;
}

- (id)_mapsNavigationStatusIsActiveBlock
{
  id mapsNavigationStatusIsActiveBlock = self->_mapsNavigationStatusIsActiveBlock;
  if (!mapsNavigationStatusIsActiveBlock)
  {
    self->_id mapsNavigationStatusIsActiveBlock = &__block_literal_global_3;

    id mapsNavigationStatusIsActiveBlock = self->_mapsNavigationStatusIsActiveBlock;
  }
  uint64_t v4 = (void *)MEMORY[0x1AD0BCD30](mapsNavigationStatusIsActiveBlock, a2);

  return v4;
}

uint64_t __70__SUICHandsOnAutoDismissalStrategy__mapsNavigationStatusIsActiveBlock__block_invoke()
{
  return MEMORY[0x1F410ADB0]();
}

- (void)_setMapsNavigationStatusIsActiveBlock:(id)a3
{
  self->_id mapsNavigationStatusIsActiveBlock = (id)MEMORY[0x1AD0BCD30](a3, a2);

  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end