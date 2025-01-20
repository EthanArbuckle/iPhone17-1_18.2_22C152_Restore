@interface STCoreUser(UnmodeledProperties)
- (void)contactsEditable;
- (void)screenTimeEnabled;
@end

@implementation STCoreUser(UnmodeledProperties)

- (void)screenTimeEnabled
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "Failed to fetch local settings: %{public}@", v2, v3, v4, v5, v6);
}

- (void)contactsEditable
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch contacts container to get managed state: %{public}@", v2, v3, v4, v5, v6);
}

@end