@interface SBSystemApertureViewController(Private)
@end

@implementation SBSystemApertureViewController(Private)

- (void)hostOrientationDidChangeTo:()Private withPreviousOrientation:context:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Participant's orientation is unknown?", v1, 2u);
}

- (void)hostOrientationDidChangeTo:()Private withPreviousOrientation:context:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  v0 = BSInterfaceOrientationDescription();
  v7 = BSInterfaceOrientationDescription();
  OUTLINED_FUNCTION_15(&dword_1D85BA000, v1, v2, "Participant's previous orientation:(%@) does not match our previous view controller orientation:(%@) ", v3, v4, v5, v6, 2u);
}

@end