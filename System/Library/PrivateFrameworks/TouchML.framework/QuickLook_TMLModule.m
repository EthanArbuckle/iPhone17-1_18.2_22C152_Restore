@interface QuickLook_TMLModule
+ (BOOL)loadModule;
@end

@implementation QuickLook_TMLModule

+ (BOOL)loadModule
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23986D2A0;
  block[3] = &unk_264DAB4D8;
  block[4] = &v5;
  if (qword_268A058F0 != -1) {
    dispatch_once(&qword_268A058F0, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end