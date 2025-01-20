@interface FBSDisplayConfiguration(SBDisplayManagerCallbackLogging)
- (id)_sbLoggingDescription;
@end

@implementation FBSDisplayConfiguration(SBDisplayManagerCallbackLogging)

- (id)_sbLoggingDescription
{
  v2 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __81__FBSDisplayConfiguration_SBDisplayManagerCallbackLogging___sbLoggingDescription__block_invoke;
  v9 = &unk_1E6AF5290;
  id v10 = v2;
  uint64_t v11 = a1;
  id v3 = v2;
  [v3 appendBodySectionWithName:0 multilinePrefix:@"\t" block:&v6];
  v4 = objc_msgSend(v3, "build", v6, v7, v8, v9);

  return v4;
}

@end