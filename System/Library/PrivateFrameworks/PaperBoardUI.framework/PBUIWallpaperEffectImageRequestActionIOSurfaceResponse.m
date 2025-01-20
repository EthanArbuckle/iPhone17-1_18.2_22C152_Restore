@interface PBUIWallpaperEffectImageRequestActionIOSurfaceResponse
- (IOSurface)ioSurface;
- (PBUIWallpaperEffectImageRequestActionIOSurfaceResponse)initWithActualStyle:(int64_t)a3 size:(CGSize)a4 ioSurface:(id)a5;
@end

@implementation PBUIWallpaperEffectImageRequestActionIOSurfaceResponse

- (PBUIWallpaperEffectImageRequestActionIOSurfaceResponse)initWithActualStyle:(int64_t)a3 size:(CGSize)a4 ioSurface:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v9 = (objc_class *)MEMORY[0x1E4F4F7A0];
  v10 = (__IOSurface *)a5;
  id v11 = objc_alloc_init(v9);
  v12 = [NSNumber numberWithInteger:a3];
  [v11 setObject:v12 forSetting:1];

  v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", width, height);
  [v11 setObject:v13 forSetting:2];

  xpc_object_t XPCObject = IOSurfaceCreateXPCObject(v10);
  [v11 setObject:XPCObject forSetting:4];
  v17.receiver = self;
  v17.super_class = (Class)PBUIWallpaperEffectImageRequestActionIOSurfaceResponse;
  v15 = [(PBUIWallpaperEffectImageRequestActionIOSurfaceResponse *)&v17 initWithInfo:v11 error:0];

  return v15;
}

- (IOSurface)ioSurface
{
  v2 = [(PBUIWallpaperEffectImageRequestActionIOSurfaceResponse *)self info];
  v3 = [v2 objectForSetting:4];

  IOSurfaceRef v4 = IOSurfaceLookupFromXPCObject(v3);
  return (IOSurface *)v4;
}

@end