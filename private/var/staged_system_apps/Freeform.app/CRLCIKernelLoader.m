@interface CRLCIKernelLoader
+ (id)loadKernelWithMetalName:(id)a3 legacyName:(id)a4;
+ (id)p_loadLegacyKernelWithName:(id)a3;
+ (id)p_loadMetalKernelWithName:(id)a3;
@end

@implementation CRLCIKernelLoader

+ (id)loadKernelWithMetalName:(id)a3 legacyName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[CRLCapabilities currentCapabilities];
  if ([v8 isMetalCapable])
  {
    v9 = +[CRLCapabilities currentCapabilities];
    v10 = sub_1000B0C90();
    v11 = [v9 metalCapabilitiesForDevice:v10];
    unsigned int v12 = [v11 isCoreImageMetalCapable];

    if (v12)
    {
      v13 = [a1 p_loadMetalKernelWithName:v6];
      if (v13) {
        goto LABEL_25;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE210);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B9A14();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE230);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader loadKernelWithMetalName:legacyName:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 27, 0, "Unable to load Metal CIKernel with name: %{public}@", v6);
      goto LABEL_24;
    }
  }
  else
  {
  }
  v13 = [a1 p_loadLegacyKernelWithName:v7];
  if (v13) {
    goto LABEL_25;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FE250);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B9AA4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FE270);
  }
  v17 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v17);
  }
  v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader loadKernelWithMetalName:legacyName:]");
  v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 30, 0, "Unable to load legacy CIKernel with name: %{public}@", v7);
LABEL_24:

  v13 = 0;
LABEL_25:

  return v13;
}

+ (id)p_loadMetalKernelWithName:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  p_vtable = CRLiOSImageHUDSlider.vtable;
  id v6 = &off_1014C1000;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE290);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9CF0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE2B0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 40, 0, "invalid nil value for '%{public}s'", "tsdBundle");
  }
  v10 = [v4 URLForResource:@"coreimage" withExtension:@"metallib"];
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE2D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9C5C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE2F0);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    unsigned int v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 42, 0, "invalid nil value for '%{public}s'", "metalLibraryURL");
  }
  v14 = +[NSData dataWithContentsOfURL:v10];
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE310);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9B34();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE330);
    }
    v29 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v29);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v23, 44, 0, "invalid nil value for '%{public}s'", "metalLibraryData");
    v15 = 0;
    goto LABEL_51;
  }
  id v39 = 0;
  v15 = +[CIKernel kernelWithFunctionName:v3 fromMetalLibraryData:v14 error:&v39];
  id v16 = v39;
  id v38 = v3;
  if (!v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE350);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9BC8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE370);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadMetalKernelWithName:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 48, 0, "invalid nil value for '%{public}s'", "kernelToReturn");

    id v6 = &off_1014C1000;
    p_vtable = CRLiOSImageHUDSlider.vtable;

    id v3 = v38;
  }
  if (v16)
  {
    unsigned int v37 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE390);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      v31 = v20;
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      v34 = [v16 domain];
      id v35 = [v16 code];
      *(_DWORD *)buf = 67111170;
      unsigned int v41 = v37;
      __int16 v42 = 2082;
      v43 = "+[CRLCIKernelLoader p_loadMetalKernelWithName:]";
      __int16 v44 = 2082;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m";
      __int16 v46 = 1024;
      int v47 = 49;
      __int16 v48 = 2112;
      id v49 = v38;
      __int16 v50 = 2114;
      v51 = v33;
      __int16 v52 = 2114;
      v53 = v34;
      __int16 v54 = 2048;
      id v55 = v35;
      __int16 v56 = 2112;
      id v57 = v16;

      id v6 = &off_1014C1000;
      p_vtable = (void **)(CRLiOSImageHUDSlider + 24);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE3B0);
    }
    v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v21);
    }
    v22 = p_vtable + 152;
    v23 = [(__objc2_class *)v6[107] stringWithUTF8String:"+[CRLCIKernelLoader p_loadMetalKernelWithName:]"];
    v24 = [(__objc2_class *)v6[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = [v16 domain];
    id v36 = [v16 code];
    v28 = v22;
    id v3 = v38;

LABEL_51:
  }

  return v15;
}

+ (id)p_loadLegacyKernelWithName:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = &off_1014C1000;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE3D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA000();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE3F0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 60, 0, "invalid nil value for '%{public}s'", "tsdBundle");
  }
  v9 = [v4 URLForResource:v3 withExtension:@"cikernel"];
  if (v9)
  {
    id v42 = 0;
    v10 = +[NSString stringWithContentsOfURL:v9 encoding:4 error:&v42];
    id v11 = v42;
    v40 = v10;
    if (!v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE450);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B9F6C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE470);
      }
      unsigned int v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 66, 0, "invalid nil value for '%{public}s'", "kernelCodeString");

      v10 = 0;
    }
    id v41 = v3;
    if (v11)
    {
      unsigned int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE490);
      }
      id v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        id v35 = v16;
        id v36 = (objc_class *)objc_opt_class();
        unsigned int v37 = NSStringFromClass(v36);
        id v38 = [v11 domain];
        id v39 = [v11 code];
        *(_DWORD *)buf = 67111170;
        unsigned int v44 = v15;
        __int16 v45 = 2082;
        __int16 v46 = "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]";
        v5 = &off_1014C1000;
        __int16 v47 = 2082;
        __int16 v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m";
        __int16 v49 = 1024;
        int v50 = 67;
        __int16 v51 = 2112;
        id v52 = v3;
        __int16 v53 = 2114;
        __int16 v54 = v37;
        __int16 v55 = 2114;
        __int16 v56 = v38;
        __int16 v57 = 2048;
        id v58 = v39;
        __int16 v59 = 2112;
        id v60 = v11;
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FE4B0);
      }
      v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      v18 = [(__objc2_class *)v5[107] stringWithUTF8String:"+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"];
      v19 = [(__objc2_class *)v5[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      [v11 domain];
      v23 = v22 = v5;

      v5 = v22;
      v10 = v40;
    }
    if (v10)
    {
      v24 = +[CIKernel kernelsWithString:v10];
      if ([v24 count] != (id)1)
      {
        int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FE4D0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B9EAC(v25);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FE4F0);
        }
        v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v26);
        }
        v27 = [(__objc2_class *)v5[107] stringWithUTF8String:"+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"];
        v28 = [(__objc2_class *)v5[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 74, 0, "expected equality between %{public}s and %{public}s", "kernelsFromString.count", "1U");
      }
      v29 = [v24 firstObject];
      id v3 = v41;
      if (!v29)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FE510);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B9E18();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FE530);
        }
        v30 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v30);
        }
        v31 = [(__objc2_class *)v5[107] stringWithUTF8String:"+[CRLCIKernelLoader p_loadLegacyKernelWithName:]"];
        v32 = [(__objc2_class *)v5[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 76, 0, "invalid nil value for '%{public}s'", "kernelToReturn");

        id v3 = v41;
      }

      v10 = v40;
    }
    else
    {
      v29 = 0;
      id v3 = v41;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE410);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B9D84();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE430);
    }
    v33 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v33);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCIKernelLoader p_loadLegacyKernelWithName:]");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCIKernelLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v10, 62, 0, "invalid nil value for '%{public}s'", "kernelURL");
    v29 = 0;
  }

  return v29;
}

@end