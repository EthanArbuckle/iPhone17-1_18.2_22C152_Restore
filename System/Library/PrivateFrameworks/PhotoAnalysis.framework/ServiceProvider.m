@interface ServiceProvider
- (void)executiveServiceAt:(id)a3 reply:(id)a4;
- (void)legacyStorytellingServiceAt:(id)a3 reply:(id)a4;
- (void)momentGraphServiceAt:(id)a3 reply:(id)a4;
- (void)notifyLibraryAvailableAtURL:(id)a3;
- (void)photoLibraryServiceAt:(id)a3 reply:(id)a4;
- (void)testServiceAt:(id)a3 reply:(id)a4;
- (void)wallpaperServiceAt:(id)a3 reply:(id)a4;
@end

@implementation ServiceProvider

- (void)legacyStorytellingServiceAt:(id)a3 reply:(id)a4
{
}

- (void)photoLibraryServiceAt:(id)a3 reply:(id)a4
{
}

- (void)momentGraphServiceAt:(id)a3 reply:(id)a4
{
}

- (void)testServiceAt:(id)a3 reply:(id)a4
{
}

- (void)executiveServiceAt:(id)a3 reply:(id)a4
{
}

- (void)wallpaperServiceAt:(id)a3 reply:(id)a4
{
}

- (void)notifyLibraryAvailableAtURL:(id)a3
{
  uint64_t v3 = sub_1D2423CF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D2423C90();
  swift_retain();
  sub_1D2233F04((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end