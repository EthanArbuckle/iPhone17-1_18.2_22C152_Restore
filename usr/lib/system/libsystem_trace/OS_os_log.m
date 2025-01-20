@interface OS_os_log
- (void)dealloc;
@end

@implementation OS_os_log

- (void)dealloc
{
  qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: os log handles are never freed";
  __break(1u);
}

@end