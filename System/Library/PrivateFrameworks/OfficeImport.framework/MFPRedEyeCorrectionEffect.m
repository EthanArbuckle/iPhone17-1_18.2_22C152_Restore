@interface MFPRedEyeCorrectionEffect
+ (id)GUID;
- (MFPRedEyeCorrectionEffect)initWithAreas:(const void *)a3;
- (void)dealloc;
@end

@implementation MFPRedEyeCorrectionEffect

+ (id)GUID
{
  return @"74D29D05-69A4-4266-9549-3CC52836B632";
}

- (MFPRedEyeCorrectionEffect)initWithAreas:(const void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFPRedEyeCorrectionEffect;
  if ([(MFPRedEyeCorrectionEffect *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mAreas = (void **)self->mAreas;
  if (mAreas)
  {
    objc_super v4 = *mAreas;
    if (*mAreas)
    {
      mAreas[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x23EC997B0](mAreas, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFPRedEyeCorrectionEffect;
  [(MFPRedEyeCorrectionEffect *)&v5 dealloc];
}

@end