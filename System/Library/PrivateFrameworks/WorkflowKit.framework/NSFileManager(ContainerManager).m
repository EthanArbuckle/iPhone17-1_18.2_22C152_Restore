@interface NSFileManager(ContainerManager)
- (id)wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:()ContainerManager error:;
@end

@implementation NSFileManager(ContainerManager)

- (id)wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:()ContainerManager error:
{
  id v5 = a3;
  if (![v5 length])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSFileManager+ContainerManager.m", 25, @"Invalid parameter not satisfying: %@", @"groupIdentifier.length" object file lineNumber description];
  }
  id v6 = v5;
  [v6 UTF8String];
  uint64_t v7 = container_create_or_lookup_path_for_current_user();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v7 isDirectory:1 relativeToURL:0];
    free(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end