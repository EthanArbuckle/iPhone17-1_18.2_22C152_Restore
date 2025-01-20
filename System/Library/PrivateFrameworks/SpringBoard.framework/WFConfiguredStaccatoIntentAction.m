@interface WFConfiguredStaccatoIntentAction
- (id)sb_focusModeIdentifier;
- (void)sb_accessibilityTripleClickState;
- (void)sb_focusModeIdentifier;
- (void)sb_getCameraCaptureMode:(void *)a3 andCaptureDevice:;
@end

@implementation WFConfiguredStaccatoIntentAction

- (void)sb_accessibilityTripleClickState
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (id)sb_focusModeIdentifier
{
  id v1 = a1;
  if (!a1)
  {
LABEL_4:
    return v1;
  }
  v2 = [a1 sectionIdentifier];
  char v3 = [v2 isEqualToString:@"Focus"];

  if (v3)
  {
    uint64_t v4 = [v1 templateParameterValues];
    uint64_t v5 = [v4 objectForKey:@"focus"];
    id v1 = [v5 identifier];

    goto LABEL_4;
  }
  uint64_t v7 = [NSString stringWithFormat:@"Only query this on the Focus action"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](sel_sb_focusModeIdentifier);
  }
  [v7 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)sb_getCameraCaptureMode:(void *)a3 andCaptureDevice:
{
  if (a1)
  {
    uint64_t v6 = [a1 sectionIdentifier];
    char v7 = [v6 isEqualToString:@"Camera"];

    if ((v7 & 1) == 0)
    {
      v12 = [NSString stringWithFormat:@"Only query this on the Camera action"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[WFConfiguredStaccatoIntentAction sb_getCameraCaptureMode:andCaptureDevice:](sel_sb_getCameraCaptureMode_andCaptureDevice_);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8BC4C20);
    }
    uint64_t v8 = [a1 templateParameterValues];
    uint8_t v9 = [v8 objectForKey:@"cameraMode"];
    id v13 = [v9 identifier];

    if ([v13 hasSuffix:@"Video"])
    {
      uint64_t v10 = 1;
    }
    else if ([v13 hasSuffix:@"Portrait"])
    {
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v10 = 0;
    }
    int v11 = [v13 hasPrefix:@"front"];
    *a2 = v10;
    *a3 = v11 ^ 1u;
  }
}

- (void)sb_focusModeIdentifier
{
  id v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sb_getCameraCaptureMode:(const char *)a1 andCaptureDevice:.cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end