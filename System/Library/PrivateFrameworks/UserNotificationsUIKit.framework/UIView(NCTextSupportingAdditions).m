@interface UIView(NCTextSupportingAdditions)
- (BOOL)nc_isMenuEnabled;
- (id)_interactionForClass:()NCTextSupportingAdditions;
- (uint64_t)canBecomeFirstResponder;
- (uint64_t)nc_setMenuEnabled:()NCTextSupportingAdditions;
@end

@implementation UIView(NCTextSupportingAdditions)

- (uint64_t)canBecomeFirstResponder
{
  v3.receiver = a1;
  v3.super_class = (Class)UIView_0;
  if (objc_msgSendSuper2(&v3, sel_canBecomeFirstResponder)) {
    return 1;
  }
  else {
    return objc_msgSend(a1, "nc_isMenuEnabled");
  }
}

- (BOOL)nc_isMenuEnabled
{
  v1 = [a1 _interactionForClass:objc_opt_class()];
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)_interactionForClass:()NCTextSupportingAdditions
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  v4 = [a1 interactions];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UIView_NCTextSupportingAdditions___interactionForClass___block_invoke;
  v7[3] = &unk_1E6A94058;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (uint64_t)nc_setMenuEnabled:()NCTextSupportingAdditions
{
  uint64_t result = objc_msgSend(a1, "nc_isMenuEnabled");
  if (result != a3)
  {
    if (a3)
    {
      v6 = objc_alloc_init(NCTextMenuInteraction);
      [a1 addInteraction:v6];
    }
    else
    {
      v6 = [a1 _interactionForClass:objc_opt_class()];
      if (v6) {
        [a1 removeInteraction:v6];
      }
    }

    return [a1 setUserInteractionEnabled:a3];
  }
  return result;
}

@end