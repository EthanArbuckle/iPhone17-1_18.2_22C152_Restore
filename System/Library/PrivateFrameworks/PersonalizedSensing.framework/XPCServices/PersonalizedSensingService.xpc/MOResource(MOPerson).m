@interface MOResource(MOPerson)
@end

@implementation MOResource(MOPerson)

- (void)initWithPerson:()MOPerson .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  v5 = [a2 contactIdentifier];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "MOResource UUID, %@, person, %@", (uint8_t *)&v6, 0x16u);
}

@end