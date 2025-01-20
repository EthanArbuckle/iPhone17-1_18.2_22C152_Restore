@interface PRUISPosterAttachmentConfiguration
+ (id)attachmentConfigurationWithHostWindowScene:(id)a3 attachments:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)attachments;
- (PRUISPosterAttachmentConfiguration)init;
- (UIWindowScene)attachmentHostWindowScene;
- (unint64_t)hash;
- (void)setAttachmentHostWindowScene:(id)a3;
- (void)setAttachments:(id)a3;
@end

@implementation PRUISPosterAttachmentConfiguration

+ (id)attachmentConfigurationWithHostWindowScene:(id)a3 attachments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Uiwindowscene.isa);
  if (!v7)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:]();
    }
LABEL_19:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A04DBE0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UIWindowSceneClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A04DC44);
  }

  id v8 = v6;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v8)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A04DCA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:attachments:]();
    }
    goto LABEL_19;
  }

  v9 = objc_alloc_init(PRUISPosterAttachmentConfiguration);
  [(PRUISPosterAttachmentConfiguration *)v9 setAttachments:v8];
  [(PRUISPosterAttachmentConfiguration *)v9 setAttachmentHostWindowScene:v7];

  return v9;
}

- (PRUISPosterAttachmentConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRUISPosterAttachmentConfiguration;
  return [(PRUISPosterAttachmentConfiguration *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = v4;
    id v8 = [v7 attachmentHostWindowScene];
    v9 = [(PRUISPosterAttachmentConfiguration *)self attachmentHostWindowScene];
    if ([v8 isEqual:v9])
    {
      v10 = [v7 attachments];
      v11 = [(PRUISPosterAttachmentConfiguration *)self attachments];
      char v12 = [v10 isEqualToArray:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)setAttachments:(id)a3
{
  id v4 = a3;
  attachments = self->_attachments;
  p_attachments = &self->_attachments;
  id v8 = v4;
  if (([v4 isEqualToArray:attachments] & 1) == 0)
  {
    if (v8) {
      id v7 = v8;
    }
    else {
      id v7 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)p_attachments, v7);
  }
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(PRUISPosterAttachmentConfiguration *)self attachments];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(PRUISPosterAttachmentConfiguration *)self attachmentHostWindowScene];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (UIWindowScene)attachmentHostWindowScene
{
  return self->_attachmentHostWindowScene;
}

- (void)setAttachmentHostWindowScene:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);

  objc_storeStrong((id *)&self->_attachmentHostWindowScene, 0);
}

+ (void)attachmentConfigurationWithHostWindowScene:attachments:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)attachmentConfigurationWithHostWindowScene:attachments:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end