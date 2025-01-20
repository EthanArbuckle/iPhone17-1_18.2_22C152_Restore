@interface UIViewFloatAnimatableProperty(UserNotificationsUIKit)
+ (id)unui_animatablePropertyWithProgressMilestones:()UserNotificationsUIKit block:;
@end

@implementation UIViewFloatAnimatableProperty(UserNotificationsUIKit)

+ (id)unui_animatablePropertyWithProgressMilestones:()UserNotificationsUIKit block:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  id v8 = 0;
  if (v6 && v7)
  {
    v9 = (void *)[v5 mutableCopy];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    [v8 setValue:0.0];
    objc_initWeak(&location, v8);
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v23[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __109__UIViewFloatAnimatableProperty_UserNotificationsUIKit__unui_animatablePropertyWithProgressMilestones_block___block_invoke;
    v18 = &unk_1E6A949B0;
    objc_copyWeak(&v21, &location);
    id v12 = v9;
    id v19 = v12;
    id v13 = v6;
    id v20 = v13;
    [v10 _createTransformerWithInputAnimatableProperties:v11 presentationValueChangedCallback:&v15];

    if (objc_msgSend(v12, "containsObject:", &unk_1F2F84708, v15, v16, v17, v18))
    {
      (*((void (**)(id, id, double, double))v13 + 2))(v13, v8, 0.0, 0.0);
      [v12 removeObject:&unk_1F2F84708];
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

@end