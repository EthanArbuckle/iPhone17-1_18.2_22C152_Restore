@interface UARPiCloudManager(CHIP)
- (void)performRemoteFetchForCHIPVerificationCertificateSync;
@end

@implementation UARPiCloudManager(CHIP)

- (void)handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:()CHIP productGroup:batchRequest:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3();
  v2 = @"chipAccessories";
  _os_log_error_impl(&dword_225D74000, v0, OS_LOG_TYPE_ERROR, "%s: Timed out waiting for fetchRecordZoneChangesCompletionBlock callback for zone=%@", (uint8_t *)v1, 0x16u);
}

- (void)handleRemoteFetchRequestSyncForCHIPAttestationCertificates:()CHIP subjectKeyIdentifier:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_3();
  v2 = @"chipAttestationCertificates";
  _os_log_error_impl(&dword_225D74000, v0, OS_LOG_TYPE_ERROR, "%s: Timed out waiting for fetchRecordZoneChangesCompletionBlock callback for zone=%@", (uint8_t *)v1, 0x16u);
}

- (void)performRemoteFetchForCHIPVerificationCertificateSync
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_3();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_225D74000, v3, OS_LOG_TYPE_ERROR, "%s: Timed out waiting for CHIPVerificationCertificate callback for zone=%@, record=%@", (uint8_t *)v4, 0x20u);
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.1(void *a1)
{
  __int16 v1 = [a1 recordID];
  uint64_t v2 = [v1 recordName];
  OUTLINED_FUNCTION_1_0(&dword_225D74000, v3, v4, "Stonehenge Signature validation failed, invalid digest for CHIPAccessoryRecord %@", v5, v6, v7, v8, 2u);
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.2(void *a1)
{
  __int16 v1 = [a1 recordID];
  uint64_t v2 = [v1 recordName];
  OUTLINED_FUNCTION_1_0(&dword_225D74000, v3, v4, "Stonehenge Signature validation failed, no signature found for CHIPAccessoryRecord %@", v5, v6, v7, v8, 2u);
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.3(void *a1)
{
  __int16 v1 = [a1 recordID];
  uint64_t v2 = [v1 recordName];
  OUTLINED_FUNCTION_1_0(&dword_225D74000, v3, v4, "Stonehenge Signature validation failed, no publicKey found for CHIPAccessoryRecord %@", v5, v6, v7, v8, 2u);
}

- (void)processCHIPAccessoriesRecord:()CHIP .cold.4(void *a1)
{
  __int16 v1 = [a1 recordID];
  uint64_t v2 = [v1 recordName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_225D74000, v3, v4, "Stonehenge Signature validation failed for CHIPAccessoryRecord %@, error:%@", v5, v6, v7, v8, v9);
}

- (void)processCHIPAttestationCertificateRecord:()CHIP subjectKeyIdentifier:.cold.1(void *a1)
{
  __int16 v1 = [a1 ckRecord];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_225D74000, v2, v3, "Signature validation failed for CHIPAttestationCertificateRecord %@, error:%@", v4, v5, v6, v7, v8);
}

- (void)validateCHIPFirmwareRecord:()CHIP inContainer:forAccessory:.cold.1(void *a1)
{
  __int16 v1 = [a1 ckRecord];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_225D74000, v2, v3, "Signature validation failed for CHIPFirmwareRecord %@, error:%@", v4, v5, v6, v7, v8);
}

@end