@interface TSDMetalShaderLibraryLoader
+ (id)loadApplicationLibraryWithDevice:(id)a3 library:(id)a4;
+ (id)loadDefaultLibraryWithDevice:(id)a3;
+ (id)loadLibraryWithDevice:(id)a3 path:(id)a4;
@end

@implementation TSDMetalShaderLibraryLoader

+ (id)loadLibraryWithDevice:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v14 = [MEMORY[0x263F7C7F0] currentHandler];
    v15 = [NSString stringWithUTF8String:"+[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:]"];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
    v17 = @"Can't initialize shader library with nil device";
    v18 = v14;
    v19 = v15;
    v20 = v16;
    uint64_t v21 = 26;
LABEL_8:
    [v18 handleFailureInFunction:v19 file:v20 lineNumber:v21 description:v17];

    v9 = 0;
    goto LABEL_9;
  }
  if (!v6)
  {
    v14 = [MEMORY[0x263F7C7F0] currentHandler];
    v15 = [NSString stringWithUTF8String:"+[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:]"];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
    v17 = @"Couldn't find path to shader library";
    v18 = v14;
    v19 = v15;
    v20 = v16;
    uint64_t v21 = 31;
    goto LABEL_8;
  }
  v8 = [NSURL fileURLWithPath:v6];
  id v23 = 0;
  v9 = (void *)[v5 newLibraryWithURL:v8 error:&v23];
  id v10 = v23;
  if (!v9)
  {
    v11 = [MEMORY[0x263F7C7F0] currentHandler];
    v12 = [NSString stringWithUTF8String:"+[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:]"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m"];
    [v11 handleFailureInFunction:v12, v13, 38, @"Failed to create library, error %@", v10 file lineNumber description];
  }
LABEL_9:

  return v9;
}

+ (id)loadDefaultLibraryWithDevice:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 pathForResource:@"TSDDefaultMetalLibrary" ofType:@"metallib"];
  v7 = +[TSDMetalShaderLibraryLoader loadLibraryWithDevice:v4 path:v6];

  return v7;
}

+ (id)loadApplicationLibraryWithDevice:(id)a3 library:(id)a4
{
  id v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 bundleForClass:objc_opt_class()];
  v9 = [v8 pathForResource:v6 ofType:@"metallib"];

  id v10 = +[TSDMetalShaderLibraryLoader loadLibraryWithDevice:v7 path:v9];

  return v10;
}

@end