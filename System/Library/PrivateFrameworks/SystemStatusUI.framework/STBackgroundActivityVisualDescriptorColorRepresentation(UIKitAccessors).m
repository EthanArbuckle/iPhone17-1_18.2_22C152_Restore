@interface STBackgroundActivityVisualDescriptorColorRepresentation(UIKitAccessors)
- (id)UIColor;
@end

@implementation STBackgroundActivityVisualDescriptorColorRepresentation(UIKitAccessors)

- (id)UIColor
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [a1 systemColorName];
  v3 = v2;
  if (v2)
  {
    SEL v4 = NSSelectorFromString(v2);
    if (objc_opt_respondsToSelector())
    {
      v5 = [MEMORY[0x1E4FB1618] performSelector:v4];
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      v9 = STSystemStatusLogBundleLoading();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543362;
        v13 = v3;
        _os_log_error_impl(&dword_1D7E39000, v9, OS_LOG_TYPE_ERROR, "UIColor does not implement a method for systemColorName '%{public}@'", (uint8_t *)&v12, 0xCu);
      }
    }
    v7 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      v13 = v3;
      _os_log_error_impl(&dword_1D7E39000, v7, OS_LOG_TYPE_ERROR, "UIColor does not return anything for systemColorName '%{public}@'", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_13;
  }
  v6 = [a1 BSColor];
  v7 = v6;
  if (!v6)
  {
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = [v6 UIColor];
  if (!v8)
  {
    v11 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      v13 = v7;
      _os_log_error_impl(&dword_1D7E39000, v11, OS_LOG_TYPE_ERROR, "Could not create a UIColor from customColor '%{public}@'", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_13;
  }
  v5 = (void *)v8;
LABEL_14:

LABEL_15:
  return v5;
}

@end