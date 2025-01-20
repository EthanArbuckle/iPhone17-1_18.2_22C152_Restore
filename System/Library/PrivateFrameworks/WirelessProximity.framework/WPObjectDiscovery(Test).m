@interface WPObjectDiscovery(Test)
- (void)startTest;
- (void)stopTest;
@end

@implementation WPObjectDiscovery(Test)

- (void)receivedTestResponse:()Test .cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2144AA000, v3, v4, "ObjectDiscovery Client %@ (test: %d) NOOP receieved test response: %@", v5, v6, v7, v8, v9);
}

- (void)startTest
{
  id v3 = a2;
  [a1 isTestClient];
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0(&dword_2144AA000, v4, v5, "Client %@ (test: %d) calling startTest", v6, v7, v8, v9, v10);
}

- (void)stopTest
{
  id v3 = a2;
  [a1 isTestClient];
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_0(&dword_2144AA000, v4, v5, "Client %@ (test: %d) calling stopTest", v6, v7, v8, v9, v10);
}

- (void)updateBeaconingState:()Test .cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v3 = v2;
  OUTLINED_FUNCTION_4_0();
  [v0 BOOLValue];
  OUTLINED_FUNCTION_1_2(&dword_2144AA000, v4, v5, "Client %@ (test: %d) calling updateBeaconingState with state: %s", v6, v7, v8, v9, 2u);
}

- (void)updateBeaconingKeys:()Test .cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2144AA000, v3, v4, "Client %@ (test: %d) calling updateBeaconingKeys with keys: %@", v5, v6, v7, v8, v9);
}

- (void)updateBeaconingStatus:()Test .cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v3 = v2;
  OUTLINED_FUNCTION_4_0();
  [v0 unsignedCharValue];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_0(&dword_2144AA000, v4, v5, "Client %@ (test: %d) calling updateBeaconingStatus with status: 0x%2x", v6, v7, v8, v9, v10);
}

- (void)updateBeaconingExtended:()Test .cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2144AA000, v3, v4, "Client %@ (test: %d) calling updateBeaconingExtended with data: %@", v5, v6, v7, v8, v9);
}

- (void)updateNearOwnerTokens:()Test .cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_2144AA000, v3, v4, "Client %@ (test: %d) calling updateNearOwnerTokens with tokens: %@", v5, v6, v7, v8, v9);
}

- (void)updateBeaconingInterval:()Test .cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v3 = v2;
  OUTLINED_FUNCTION_4_0();
  [v0 intValue];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_0(&dword_2144AA000, v4, v5, "Client %@ (test: %d) calling updateBeaconingInterval with interval: %d", v6, v7, v8, v9, v10);
}

@end