@interface CoreImageLibrary
- (CoreImageLibrary)init;
- (NSSet)availableNames;
- (id)kernelWithFunctionName:(id)a3 constants:(id)a4;
- (id)url;
- (void)setAvailableNames:(id)a3;
@end

@implementation CoreImageLibrary

- (id)url
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_262E30CC4;
  v4[3] = &unk_2655BCD10;
  v4[4] = self;
  v5 = @"CoreImageKernels.ci";
  if (qword_26B4252C0 != -1) {
    dispatch_once(&qword_26B4252C0, v4);
  }
  id v2 = (id)qword_26B4252D0;

  return v2;
}

- (CoreImageLibrary)init
{
  v21.receiver = self;
  v21.super_class = (Class)CoreImageLibrary;
  id v2 = [(CoreImageLibrary *)&v21 init];
  v5 = v2;
  if (v2)
  {
    v6 = (void *)MEMORY[0x263F00658];
    v7 = objc_msgSend_url(v2, v3, v4);
    v9 = objc_msgSend_kernelNamesFromMetalLibrary_(v6, v8, (uint64_t)v7);

    if (v9)
    {
      if (objc_msgSend_count(v9, v10, v11))
      {
        v13 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v12, (uint64_t)v9);
        objc_msgSend_setAvailableNames_(v5, v14, (uint64_t)v13);
      }
      else
      {
        v15 = uni_logger_compile();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_262E4C97C(v15);
        }

        objc_msgSend_setAvailableNames_(v5, v16, 0);
      }
    }
  }
  v17 = objc_msgSend_availableNames(v5, v3, v4);
  if (v17) {
    v18 = v5;
  }
  else {
    v18 = 0;
  }
  v19 = v18;

  return v19;
}

- (id)kernelWithFunctionName:(id)a3 constants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_availableNames(self, v8, v9);
  char v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v6);

  if (v12)
  {
    v15 = (void *)MEMORY[0x263F00658];
    v16 = objc_msgSend_url(self, v13, v14);
    id v23 = 0;
    v18 = objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_constants_error_(v15, v17, (uint64_t)v6, v16, v7, &v23);
    v19 = v23;

    if (!v18 || v19)
    {
      objc_super v21 = uni_logger_compile();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_262E4CA00((uint64_t)v6, v19, (uint64_t)v21);
      }

      id v20 = 0;
    }
    else
    {
      id v20 = v18;
    }
  }
  else
  {
    v19 = uni_logger_compile();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_262E4CAA4(v6, v19);
    }
    id v20 = 0;
  }

  return v20;
}

- (NSSet)availableNames
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvailableNames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end