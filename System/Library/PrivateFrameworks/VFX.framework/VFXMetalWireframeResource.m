@interface VFXMetalWireframeResource
- (void)dealloc;
@end

@implementation VFXMetalWireframeResource

- (void)dealloc
{
  CFRelease(self->material);
  CFRelease(self->program);
  programHashCode = self->programHashCode;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B6539FF0;
  block[3] = &unk_1E6143EB8;
  block[4] = programHashCode;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v4.receiver = self;
  v4.super_class = (Class)VFXMetalWireframeResource;
  [(VFXMetalWireframeResource *)&v4 dealloc];
}

@end