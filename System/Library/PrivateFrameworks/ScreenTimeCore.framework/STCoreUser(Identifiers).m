@interface STCoreUser(Identifiers)
@end

@implementation STCoreUser(Identifiers)

- (void)validateForUpdate:()Identifiers .cold.1(void *a1)
{
  v1 = [a1 localUserDeviceState];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for update on CoreUser failed for %{public}s user, with error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)validateForUpdate:()Identifiers .cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on CoreUser failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:()Identifiers .cold.1(void *a1)
{
  uint64_t v1 = [a1 localUserDeviceState];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for Insert on CoreUser failed for %{public}s user with error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)validateForInsert:()Identifiers .cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for Insert on CoreUser failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:()Identifiers .cold.1(void *a1)
{
  uint64_t v1 = [a1 localUserDeviceState];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_5_0(&dword_1DA519000, v2, v3, "%{public}s Validate for Delete on CoreUser failed for %{public}s user failed with error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)validateForDelete:()Identifiers .cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for Delete on CoreUser failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end