@interface MLException
- (void)raise;
@end

@implementation MLException

- (void)raise
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (__exceptionsEnabled)
  {
    v5.receiver = self;
    v5.super_class = (Class)MLException;
    [(MLException *)&v5 raise];
  }
  else
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = [(MLException *)self description];
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_ERROR, "!!! ML3 raised exception while exceptions were disabled: %{public}@", buf, 0xCu);
    }
  }
}

@end