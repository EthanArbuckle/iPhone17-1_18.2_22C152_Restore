@interface CIImage(VG)
- (id)vg_surfaceWithPixelFormat:()VG colorSpaceName:;
@end

@implementation CIImage(VG)

- (id)vg_surfaceWithPixelFormat:()VG colorSpaceName:
{
  v22[4] = *MEMORY[0x263EF8340];
  v6 = a4;
  [a1 extent];
  double v8 = v7;
  [a1 extent];
  double v10 = v9;
  id v11 = objc_alloc(MEMORY[0x263F0ED00]);
  v21[0] = *MEMORY[0x263F0ECF8];
  v12 = [NSNumber numberWithUnsignedLong:(unint64_t)v8];
  v22[0] = v12;
  v21[1] = *MEMORY[0x263F0ECC0];
  v13 = [NSNumber numberWithUnsignedLong:(unint64_t)v10];
  v22[1] = v13;
  v21[2] = *MEMORY[0x263F0ECC8];
  v14 = [NSNumber numberWithUnsignedInt:a3];
  v22[2] = v14;
  v21[3] = *MEMORY[0x263F0ECA0];
  v15 = [NSNumber numberWithUnsignedLong:VGGetBytesPerElementFromPixelFormat(a3)];
  v22[3] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  v17 = (void *)[v11 initWithProperties:v16];

  v18 = CGColorSpaceCreateWithName(v6);
  v19 = objc_opt_new();
  [a1 extent];
  objc_msgSend(v19, "render:toIOSurface:bounds:colorSpace:", a1, v17, v18);
  CGColorSpaceRelease(v18);

  return v17;
}

@end