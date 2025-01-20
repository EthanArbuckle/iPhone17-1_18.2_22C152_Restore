@interface SKInvitationPayload(DictionaryPayloads)
- (void)payloadDictionary;
@end

@implementation SKInvitationPayload(DictionaryPayloads)

- (void)initWithDictionary:()DictionaryPayloads dateCreated:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E62A000, a2, OS_LOG_TYPE_ERROR, "Error serializing status payload dictionary: %@", (uint8_t *)&v2, 0xCu);
}

- (void)payloadDictionary
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E62A000, a2, OS_LOG_TYPE_ERROR, "Error deserializing status payload data as dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end