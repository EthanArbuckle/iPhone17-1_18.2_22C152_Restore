@interface _NACAudioRoutesRecord
- (NSArray)audioRoutes;
- (NSArray)deferredAudioRoutes;
- (NSMutableSet)observers;
- (double)timestamp;
- (void)setAudioRoutes:(id)a3;
- (void)setDeferredAudioRoutes:(id)a3;
- (void)setObservers:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation _NACAudioRoutesRecord

- (NSArray)audioRoutes
{
  return self->_audioRoutes;
}

- (void)setAudioRoutes:(id)a3
{
}

- (NSArray)deferredAudioRoutes
{
  return self->_deferredAudioRoutes;
}

- (void)setDeferredAudioRoutes:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_deferredAudioRoutes, 0);

  objc_storeStrong((id *)&self->_audioRoutes, 0);
}

@end