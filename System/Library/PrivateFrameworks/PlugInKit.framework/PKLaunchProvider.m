@interface PKLaunchProvider
- (id)copy_busy_extension_instances:(const char *)a3 cnt:(unint64_t)a4;
- (id)copy_extension_properties:(id)a3;
- (id)copy_extension_properties_for_pid:(int)a3;
- (int)add_external_service:(int)a3 path:(const char *)a4 overlay:(id)a5;
- (void)remove_external_service:(const char *)a3 version:(const char *)a4 targetq:(id)a5 callback:(id)a6;
@end

@implementation PKLaunchProvider

- (int)add_external_service:(int)a3 path:(const char *)a4 overlay:(id)a5
{
  return MEMORY[0x1F40CC758](*(void *)&a3, a4, a5);
}

- (void)remove_external_service:(const char *)a3 version:(const char *)a4 targetq:(id)a5 callback:(id)a6
{
}

- (id)copy_extension_properties:(id)a3
{
  return (id)MEMORY[0x1F40CC768](a3, a2);
}

- (id)copy_extension_properties_for_pid:(int)a3
{
  return (id)MEMORY[0x1F40CC770](*(void *)&a3, a2);
}

- (id)copy_busy_extension_instances:(const char *)a3 cnt:(unint64_t)a4
{
  return (id)MEMORY[0x1F40CC760](a3, a4);
}

@end