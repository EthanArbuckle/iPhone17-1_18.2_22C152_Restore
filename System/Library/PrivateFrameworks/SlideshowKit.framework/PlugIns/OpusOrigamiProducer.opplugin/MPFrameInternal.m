@interface MPFrameInternal
- (NSString)frameID;
- (NSString)presetID;
- (void)dealloc;
- (void)setFrameID:(id)a3;
- (void)setPresetID:(id)a3;
@end

@implementation MPFrameInternal

- (void)dealloc
{
  self->frameID = 0;
  self->presetID = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPFrameInternal;
  [(MPFrameInternal *)&v3 dealloc];
}

- (NSString)frameID
{
  return self->frameID;
}

- (void)setFrameID:(id)a3
{
}

- (NSString)presetID
{
  return self->presetID;
}

- (void)setPresetID:(id)a3
{
}

@end