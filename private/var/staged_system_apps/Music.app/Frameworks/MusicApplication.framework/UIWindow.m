@interface UIWindow
+ (void)music_setWantsLayoutInsetsUsingBlock:(id)a3;
@end

@implementation UIWindow

+ (void)music_setWantsLayoutInsetsUsingBlock:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke;
  v68[3] = &unk_CCB378;
  v70 = &v72;
  v71 = "layoutSubviews";
  id v5 = v3;
  id v69 = v5;
  v6 = objc_retainBlock(v68);
  v7 = imp_implementationWithBlock(v6);
  InstanceMethod = class_getInstanceMethod(v4, "layoutSubviews");
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  IMP v10 = class_replaceMethod(v4, "layoutSubviews", v7, TypeEncoding);

  v73[3] = (uint64_t)v10;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_2;
  v60[3] = &unk_CCB3A0;
  v62 = &v64;
  v63 = "traitCollectionDidChange:";
  id v11 = v5;
  id v61 = v11;
  v12 = objc_retainBlock(v60);
  v13 = imp_implementationWithBlock(v12);
  v14 = class_getInstanceMethod(v4, "traitCollectionDidChange:");
  v15 = method_getTypeEncoding(v14);
  IMP v16 = class_replaceMethod(v4, "traitCollectionDidChange:", v13, v15);

  v65[3] = (uint64_t)v16;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_3;
  v52[3] = &unk_CCB3C8;
  v54 = &v56;
  v55 = "initWithCoder:";
  id v17 = v11;
  id v53 = v17;
  v18 = objc_retainBlock(v52);
  v19 = imp_implementationWithBlock(v18);
  v20 = class_getInstanceMethod(v4, "initWithCoder:");
  v21 = method_getTypeEncoding(v20);
  IMP v22 = class_replaceMethod(v4, "initWithCoder:", v19, v21);

  v57[3] = (uint64_t)v22;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_4;
  v44[3] = &unk_CCB3F0;
  v46 = &v48;
  v47 = "initWithFrame:";
  id v23 = v17;
  id v45 = v23;
  v24 = objc_retainBlock(v44);
  v25 = imp_implementationWithBlock(v24);
  v26 = class_getInstanceMethod(v4, "initWithFrame:");
  v27 = method_getTypeEncoding(v26);
  IMP v28 = class_replaceMethod(v4, "initWithFrame:", v25, v27);

  v49[3] = (uint64_t)v28;
  if (music_setWantsLayoutInsetsUsingBlock__onceToken != -1) {
    dispatch_once(&music_setWantsLayoutInsetsUsingBlock__onceToken, &__block_literal_global_0);
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  v29 = (objc_class *)music_setWantsLayoutInsetsUsingBlock__sPopoverViewClass;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_6;
  v36[3] = &unk_CCB458;
  v38 = &v40;
  v39 = "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:";
  id v30 = v23;
  id v37 = v30;
  v31 = objc_retainBlock(v36);
  v32 = imp_implementationWithBlock(v31);
  v33 = class_getInstanceMethod(v4, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:");
  v34 = method_getTypeEncoding(v33);
  IMP v35 = class_replaceMethod(v29, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", v32, v34);

  v41[3] = (uint64_t)v35;
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v72, 8);
}

void __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = v3;
  if (v4) {
    goto LABEL_2;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    IMP MethodImplementation = class_getMethodImplementation((Class)[v7 superclass], *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      v4 = MethodImplementation;
LABEL_2:
      v4();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v7 music_setLayoutInsets:];
}

void __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  v6 = *(void (**)(id, void, id))(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6)
  {
    v6(v9, *(void *)(a1 + 48), v5);
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    if (v7 == objc_opt_class())
    {
      IMP MethodImplementation = class_getMethodImplementation((Class)[v9 superclass], *(SEL *)(a1 + 48));
      if (MethodImplementation) {
        ((void (*)(id, void, id))MethodImplementation)(v9, *(void *)(a1 + 48), v5);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v9 music_setLayoutInsets:];
}

id __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void (**)(id, void, id))(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v7)
  {
    v7(v5, *(void *)(a1 + 48), v6);
    uint64_t v8 = LABEL_3:;

    id v5 = (id)v8;
    goto LABEL_5;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    IMP MethodImplementation = class_getMethodImplementation((Class)[v5 superclass], *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      ((void (*)(id, void, id))MethodImplementation)(v5, *(void *)(a1 + 48), v6);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v5 music_setLayoutInsets:];

  return v5;
}

id __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_4(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  v12 = *(void (**)(id, void, double, double, double, double))(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  if (v12)
  {
    v12(v11, *(void *)(a1 + 48), a3, a4, a5, a6);
    uint64_t v13 = LABEL_3:;

    id v11 = (id)v13;
    goto LABEL_5;
  }
  uint64_t v14 = objc_opt_class();
  if (v14 == objc_opt_class())
  {
    IMP MethodImplementation = class_getMethodImplementation((Class)[v11 superclass], *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      ((void (*)(id, void, double, double, double, double))MethodImplementation)(v11, *(void *)(a1 + 48), a3, a4, a5, a6);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v11 music_setLayoutInsets];

  return v11;
}

void __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_5(id a1)
{
  music_setWantsLayoutInsetsUsingBlock__sPopoverViewClass = (uint64_t)NSClassFromString(@"_UIPopoverView");
}

id __71__UIWindow_MusicLayoutAdditions__music_setWantsLayoutInsetsUsingBlock___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  id v17 = a2;
  v18 = *(void (**)(id, void, uint64_t, uint64_t, uint64_t, double, double, double, double))(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v18)
  {
    v18(v17, *(void *)(a1 + 48), a3, a4, a5, a6, a7, a8, a9);
    uint64_t v19 = LABEL_3:;

    id v17 = (id)v19;
    goto LABEL_5;
  }
  if (objc_opt_class() == music_setWantsLayoutInsetsUsingBlock__sPopoverViewClass)
  {
    IMP MethodImplementation = class_getMethodImplementation((Class)[v17 superclass], *(SEL *)(a1 + 48));
    if (MethodImplementation)
    {
      ((void (*)(id, void, uint64_t, uint64_t, uint64_t, double, double, double, double))MethodImplementation)(v17, *(void *)(a1 + 48), a3, a4, a5, a6, a7, a8, a9);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v17 music_setLayoutInsets];

  return v17;
}

@end