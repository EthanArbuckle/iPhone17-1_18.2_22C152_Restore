@interface UIViewFloatAnimatableProperty(SBFAdditions)
+ (id)sbf_animatablePropertyWithProgressMilestones:()SBFAdditions block:;
@end

@implementation UIViewFloatAnimatableProperty(SBFAdditions)

+ (id)sbf_animatablePropertyWithProgressMilestones:()SBFAdditions block:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  id v9 = 0;
  if (v7 && v8)
  {
    v10 = (void *)[v6 mutableCopy];
    id v9 = objc_alloc_init(a1);
    [v9 setValue:0.0];
    objc_initWeak(&location, v9);
    v11 = (void *)MEMORY[0x1E4F42FF0];
    v24[0] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __98__UIViewFloatAnimatableProperty_SBFAdditions__sbf_animatablePropertyWithProgressMilestones_block___block_invoke;
    v19 = &unk_1E548DCE0;
    objc_copyWeak(&v22, &location);
    id v13 = v10;
    id v20 = v13;
    id v14 = v7;
    id v21 = v14;
    [v11 _createTransformerWithInputAnimatableProperties:v12 presentationValueChangedCallback:&v16];

    if (objc_msgSend(v13, "containsObject:", &unk_1ED89F108, v16, v17, v18, v19))
    {
      (*((void (**)(id, id, double, double))v14 + 2))(v14, v9, 0.0, 0.0);
      [v13 removeObject:&unk_1ED89F108];
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v9;
}

@end