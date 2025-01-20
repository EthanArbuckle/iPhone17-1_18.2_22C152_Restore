@interface LibDataSourceManager
- (void)appDidEnterBackground;
- (void)appWillEnterForeground;
- (void)handleAccountChanges;
- (void)handleHomeSharingUpdates;
- (void)handleNetworkChanges;
- (void)isLibraryOnlyCountryChanged:(id)a3;
@end

@implementation LibDataSourceManager

- (void)handleHomeSharingUpdates
{
}

- (void)appWillEnterForeground
{
}

- (void)appDidEnterBackground
{
  swift_retain();
  sub_1E32FBCB8();
  swift_release();
}

- (void)handleAccountChanges
{
}

- (void)handleNetworkChanges
{
}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  swift_retain();
  sub_1E32FCBE4();
  swift_release();
  uint64_t v4 = OUTLINED_FUNCTION_55_0();
  v5(v4);
}

@end