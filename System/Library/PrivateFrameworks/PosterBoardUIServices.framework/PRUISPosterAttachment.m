@interface PRUISPosterAttachment
+ (id)attachmentWithImage:(id)a3 level:(int64_t)a4;
+ (id)attachmentWithView:(id)a3 level:(int64_t)a4;
- (UIView)view;
- (int64_t)compare:(id)a3;
- (int64_t)level;
- (void)setView:(id)a3;
@end

@implementation PRUISPosterAttachment

+ (id)attachmentWithImage:(id)a3 level:(int64_t)a4
{
  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x263F1C6D0];
    id v7 = a3;
    v8 = (void *)[[v6 alloc] initWithImage:v7];

    [v8 sizeToFit];
    v9 = [a1 attachmentWithView:v8 level:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)attachmentWithView:(id)a3 level:(int64_t)a4
{
  id v7 = a3;
  if (PUIPosterLevelIsDefined())
  {
    v12 = NSString;
    v13 = NSStringFromPUIPosterLevel();
    v11 = [v12 stringWithFormat:@"Level %lu is already in-use as %@", a4, v13];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterAttachment attachmentWithView:level:](a2);
    }
    goto LABEL_14;
  }
  if (v7)
  {
    v8 = [v7 superview];

    if (!v8)
    {
      v9 = objc_alloc_init(PRUISPosterAttachment);
      objc_storeStrong((id *)&v9->_view, a3);
      v9->_level = a4;
      goto LABEL_6;
    }
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[view superview] == nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterAttachment attachmentWithView:level:](a2);
    }
LABEL_14:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A046668);
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (int64_t)compare:(id)a3
{
  v5 = a3;
  if (v5)
  {
    int64_t level = self->_level;
    int64_t v7 = v5[2];
    BOOL v8 = level == v7;
    BOOL v9 = level < v7;
    uint64_t v10 = -1;
    if (!v9) {
      uint64_t v10 = 1;
    }
    if (v8) {
      int64_t v11 = 0;
    }
    else {
      int64_t v11 = v10;
    }

    return v11;
  }
  else
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"other"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISPosterAttachment compare:](a2);
    }
    [v13 UTF8String];
    int64_t result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (int64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
}

+ (void)attachmentWithView:(const char *)a1 level:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)attachmentWithView:(const char *)a1 level:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)compare:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end