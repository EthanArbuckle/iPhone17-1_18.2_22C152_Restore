@interface CoreImageOnlyLibrary
+ (id)colorKernelWithName:(id)a3;
+ (id)colorKernelWithName:(id)a3 andOutputFormat:(int)a4;
+ (id)kernelWithName:(id)a3;
+ (id)kernelWithName:(id)a3 andOutputFormat:(int)a4;
+ (id)url;
+ (id)warpKernelWithName:(id)a3;
+ (id)warpKernelWithName:(id)a3 andOutputFormat:(int)a4;
@end

@implementation CoreImageOnlyLibrary

+ (id)url
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_262E310B8;
  v4[3] = &unk_2655BCD38;
  v5 = @"CoreImageKernels_only.ci";
  id v6 = a1;
  if (qword_26B4252C8 != -1) {
    dispatch_once(&qword_26B4252C8, v4);
  }
  id v2 = (id)qword_26B4252D8;

  return v2;
}

+ (id)kernelWithName:(id)a3
{
  v4 = (void *)MEMORY[0x263F00658];
  id v5 = a3;
  v8 = objc_msgSend_url(a1, v6, v7);
  v10 = objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_error_(v4, v9, (uint64_t)v5, v8, 0);

  return v10;
}

+ (id)kernelWithName:(id)a3 andOutputFormat:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (void *)MEMORY[0x263F00658];
  id v7 = a3;
  v10 = objc_msgSend_url(a1, v8, v9);
  v12 = objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_outputPixelFormat_error_(v6, v11, (uint64_t)v7, v10, v4, 0);

  return v12;
}

+ (id)colorKernelWithName:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F00618];
  id v5 = a3;
  v8 = objc_msgSend_url(a1, v6, v7);
  v10 = objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_error_(v4, v9, (uint64_t)v5, v8, 0);

  return v10;
}

+ (id)colorKernelWithName:(id)a3 andOutputFormat:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (void *)MEMORY[0x263F00618];
  id v7 = a3;
  v10 = objc_msgSend_url(a1, v8, v9);
  v12 = objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_outputPixelFormat_error_(v6, v11, (uint64_t)v7, v10, v4, 0);

  return v12;
}

+ (id)warpKernelWithName:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F00688];
  id v5 = a3;
  v8 = objc_msgSend_url(a1, v6, v7);
  v10 = objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_error_(v4, v9, (uint64_t)v5, v8, 0);

  return v10;
}

+ (id)warpKernelWithName:(id)a3 andOutputFormat:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (void *)MEMORY[0x263F00688];
  id v7 = a3;
  v10 = objc_msgSend_url(a1, v8, v9);
  v12 = objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_outputPixelFormat_error_(v6, v11, (uint64_t)v7, v10, v4, 0);

  return v12;
}

@end