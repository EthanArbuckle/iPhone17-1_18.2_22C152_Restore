@interface ICAuthenticationState(Keychain)
- (void)removeAllMainKeysFromKeychain;
@end

@implementation ICAuthenticationState(Keychain)

- (void)biometricsEnabledForAccount:()Keychain .cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot retrieve biometrics enabled for account without identifier {account: %@}", v4, v5, v6, v7, v8);
}

- (void)setBiometricsEnabled:()Keychain forAccount:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot set biometrics enabled for account without identifier {account: %@}", v4, v5, v6, v7, v8);
}

- (void)addMainKeyToKeychainForObject:()Keychain .cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Cannot retrieve main key to add to Keychain {object: %@}", v4, v5, v6, v7, v8);
}

- (void)removeMainKeysFromKeychainForAccount:()Keychain .cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot remove main keys from Keychain for account without identifier {account: %@}", v4, v5, v6, v7, v8);
}

- (void)removeMainKeysFromKeychainForAccount:()Keychain .cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot remove main keys from Keychain {account: %@}", v4, v5, v6, v7, v8);
}

- (void)removeAllMainKeysFromKeychain
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Cannot remove main keys from Keychain", v1, 2u);
}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot add main key to Keychain for object without identifier {object: %@}", v4, v5, v6, v7, v8);
}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Removed main key from Keychain {object: %@}", v4, v5, v6, v7, v8);
}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Cannot set main key in Keychain {object: %@, error: %@}", v6, 0x16u);
}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.4(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot set main key in Keychain because it doesn't decrypt object {object: %@}", v4, v5, v6, v7, v8);
}

@end