@interface NTKFace(ArgonSupport)
@end

@implementation NTKFace(ArgonSupport)

- (void)argon_notificationOverlayImageWithCompletion:()ArgonSupport .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Notification: In-bundle asset overlay missing for bundle %{public}@", (uint8_t *)&v1, 0xCu);
}

@end