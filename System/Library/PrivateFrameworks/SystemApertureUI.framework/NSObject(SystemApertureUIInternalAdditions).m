@interface NSObject(SystemApertureUIInternalAdditions)
- (void)uniquelyIdentifyElement;
@end

@implementation NSObject(SystemApertureUIInternalAdditions)

- (void)uniquelyIdentifyElement
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25E6E1000, log, OS_LOG_TYPE_ERROR, "Attempt to uniquely identify element that already has a unique identifier – ignoring: element: %{public}@; uniqueID: %{public}@",
    (uint8_t *)&v3,
    0x16u);
}

@end