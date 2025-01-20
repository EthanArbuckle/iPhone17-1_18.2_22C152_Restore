@interface SKADatabaseReceivedInvitation(IncomingRatchet)
- (void)incomingRatchet;
@end

@implementation SKADatabaseReceivedInvitation(IncomingRatchet)

- (void)incomingRatchet
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Failed to create incomingRatchet due to invalid data. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end