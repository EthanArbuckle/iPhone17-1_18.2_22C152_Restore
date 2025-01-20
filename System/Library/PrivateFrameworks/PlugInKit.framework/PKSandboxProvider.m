@interface PKSandboxProvider
- (char)sandbox_extension_issue_file:(const char *)a3 path:(const char *)a4 flags:(unsigned int)a5;
- (int)sandbox_container_path_for_pid:(int)a3 buffer:(char *)a4 bufsize:(unint64_t)a5;
- (int)sandbox_extension_release:(int64_t)a3;
- (int64_t)sandbox_extension_consume:(const char *)a3;
@end

@implementation PKSandboxProvider

- (int64_t)sandbox_extension_consume:(const char *)a3
{
  return MEMORY[0x1F40CDDF8](a3, a2);
}

- (int)sandbox_extension_release:(int64_t)a3
{
  return MEMORY[0x1F40CDE50](a3, a2);
}

- (int)sandbox_container_path_for_pid:(int)a3 buffer:(char *)a4 bufsize:(unint64_t)a5
{
  return MEMORY[0x1F40CDDE8](*(void *)&a3, a4, a5);
}

- (char)sandbox_extension_issue_file:(const char *)a3 path:(const char *)a4 flags:(unsigned int)a5
{
  return (char *)MEMORY[0x1F40CDE00](a3, a4, *(void *)&a5);
}

@end