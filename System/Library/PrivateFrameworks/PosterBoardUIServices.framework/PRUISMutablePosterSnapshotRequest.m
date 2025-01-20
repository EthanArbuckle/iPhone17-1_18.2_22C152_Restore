@interface PRUISMutablePosterSnapshotRequest
- (void)appendAttachment:(id)a3;
@end

@implementation PRUISMutablePosterSnapshotRequest

- (void)appendAttachment:(id)a3
{
  id v19 = a3;
  if (v19)
  {
    v4 = [(PRUISPosterSnapshotRequest *)self attachmentConfiguration];
    v5 = [v4 attachments];
    v6 = (void *)[v5 mutableCopy];
    v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    v9 = v8;

    [v9 addObject:v19];
    v10 = [(PRUISPosterSnapshotRequest *)self attachmentConfiguration];
    v11 = [v10 attachmentHostWindowScene];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      v14 = [(PRUISPosterSnapshotRequest *)self screen];
      v15 = v14;
      if (!v14)
      {
        v15 = [MEMORY[0x263F1C920] mainScreen];
      }
      _findUIWindowSceneForUIScreen(v15);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v14) {
    }
      }
    v16 = (void *)[v9 copy];
    v17 = +[PRUISPosterAttachmentConfiguration attachmentConfigurationWithHostWindowScene:v13 attachments:v16];

    [(PRUISPosterSnapshotRequest *)self setAttachmentConfiguration:v17];
  }
  else
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attachment"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PRUISMutablePosterSnapshotRequest appendAttachment:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)appendAttachment:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A03F000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end