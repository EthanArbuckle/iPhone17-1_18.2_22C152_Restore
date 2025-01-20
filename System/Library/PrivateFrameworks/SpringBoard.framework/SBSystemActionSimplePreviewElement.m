@interface SBSystemActionSimplePreviewElement
+ (id)defaultSymbolFont;
- (BOOL)isMinimalPresentationPossible;
- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3;
- (SBSystemActionSimplePreviewElement)initWithSystemAction:(id)a3;
- (SBSystemActionSimplePreviewElement)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5;
- (UIColor)keyColor;
- (uint64_t)systemAction;
- (void)setKeyColor:(uint64_t)a1;
@end

@implementation SBSystemActionSimplePreviewElement

- (SBSystemActionSimplePreviewElement)initWithSystemAction:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemAction != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSimplePreviewElement initWithSystemAction:](a2);
    }
LABEL_12:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8A3C878);
  }
  v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  v8 = [v6 configuredAction];
  uint64_t v9 = [v8 leadingApertureView];
  if (!v9)
  {
    v21 = [NSString stringWithFormat:@"A leading view should be provided for this action"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSimplePreviewElement initWithSystemAction:](a2);
    }
    goto LABEL_12;
  }
  v10 = (void *)v9;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v9];
  [v7 setLeadingContentViewProvider:v11];
  v12 = [v8 trailingApertureView];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F42FF0]);
    id v14 = (id)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v16 = v14;

  v17 = (void *)[objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v16];
  [v7 setTrailingContentViewProvider:v17];
  v18 = [v10 keyColor];
  v19 = [(SBSystemActionSimplePreviewElement *)self initWithSystemAction:v6 contentProvider:v7 keyColor:v18];

  return v19;
}

- (SBSystemActionSimplePreviewElement)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    v13 = v12;
    id v14 = [v10 configuredAction];
    id v15 = [v14 identifier];

    v16 = [v15 componentsSeparatedByString:@"."];
    v17 = [v16 lastObject];
    v18 = [@"SBSystemAction-" stringByAppendingString:v17];

    v19 = [SBSAElementIdentification alloc];
    v20 = [v10 hostBundleIdentifier];
    v21 = [(SBSAElementIdentification *)v19 initWithClientIdentifier:v20 elementIdentifier:v18];

    v26.receiver = self;
    v26.super_class = (Class)SBSystemActionSimplePreviewElement;
    v22 = [(SBSystemApertureProvidedContentElement *)&v26 initWithIdentifier:v21 contentProvider:v11];
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_keyColor, a5);
      objc_storeStrong((id *)&v23->_systemAction, a3);
      [(SBSystemApertureProvidedContentElement *)v23 setMinimumSupportedLayoutMode:1];
      [(SBSystemApertureProvidedContentElement *)v23 setMaximumSupportedLayoutMode:2];
      [(SBSystemApertureProvidedContentElement *)v23 setPreferredLayoutMode:2];
    }

    return v23;
  }
  else
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemAction != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSimplePreviewElement initWithSystemAction:contentProvider:keyColor:](a2);
    }
    [v25 UTF8String];
    result = (SBSystemActionSimplePreviewElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)defaultSymbolFont
{
  uint64_t v0 = self;
  v1 = [MEMORY[0x1E4FB74C8] defaultSymbolConfiguration];
  switch([v1 weight])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      break;
    default:
      v2 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", sel_defaultSymbolFont, v0, @"SBSystemActionSimplePreviewElement.m", 107, @"Unhandled symbol weight: %ld", objc_msgSend(v1, "weight"));

      break;
  }
  v3 = (void *)MEMORY[0x1E4F42A30];
  [v1 pointSize];
  v4 = objc_msgSend(v3, "systemFontOfSize:weight:");

  return v4;
}

- (void)setKeyColor:(uint64_t)a1
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1 && (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(a1 + 168), a2);
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = @"SBSystemApertureNotificationUserInfoElementKey";
    v8[0] = a1;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v5 postNotificationName:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0 userInfo:v6];
  }
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSystemApertureProvidedContentElement *)self clientIdentifier];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (uint64_t)systemAction
{
  if (result) {
    return *(void *)(result + 176);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAction, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
}

- (void)initWithSystemAction:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSystemAction:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSystemAction:(const char *)a1 contentProvider:keyColor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end