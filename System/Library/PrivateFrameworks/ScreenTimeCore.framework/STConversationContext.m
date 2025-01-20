@interface STConversationContext
- (BOOL)allowedByScreenTime;
- (BOOL)applicationCurrentlyLimited;
- (BOOL)emergencyModeEnabled;
- (BOOL)shouldBeAllowedByScreenTimeWhenLimited;
- (BOOL)shouldBeAllowedDuringGeneralScreenTime;
- (NSArray)whitelistedHandles;
- (NSDictionary)allowedByContactsHandle;
- (NSDictionary)contactsByHandle;
- (STConversationContext)init;
- (unint64_t)currentApplicationState;
- (void)setAllowedByContactsHandle:(id)a3;
- (void)setAllowedByScreenTime:(BOOL)a3;
- (void)setApplicationCurrentlyLimited:(BOOL)a3;
- (void)setContactsByHandle:(id)a3;
- (void)setCurrentApplicationState:(unint64_t)a3;
- (void)setEmergencyModeEnabled:(BOOL)a3;
- (void)setShouldBeAllowedByScreenTimeWhenLimited:(BOOL)a3;
- (void)setShouldBeAllowedDuringGeneralScreenTime:(BOOL)a3;
- (void)setWhitelistedHandles:(id)a3;
- (void)updateForThirdPartyApplicationState:(int64_t)a3;
- (void)updateShouldBeAllowedDuringGeneralScreenTime:(BOOL)a3 shouldBeAllowedByScreenTimeWhenLimited:(BOOL)a4 currentApplicationState:(unint64_t)a5 emergencyModeEnabled:(BOOL)a6;
@end

@implementation STConversationContext

- (STConversationContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)STConversationContext;
  result = [(STConversationContext *)&v3 init];
  if (result)
  {
    result->_allowedByScreenTime = 1;
    *(_WORD *)&result->_shouldBeAllowedByScreenTimeWhenLimited = 257;
  }
  return result;
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (BOOL)shouldBeAllowedByScreenTimeWhenLimited
{
  return self->_shouldBeAllowedByScreenTimeWhenLimited;
}

- (BOOL)emergencyModeEnabled
{
  return self->_emergencyModeEnabled;
}

- (BOOL)applicationCurrentlyLimited
{
  return self->_applicationCurrentlyLimited;
}

- (NSDictionary)allowedByContactsHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)updateShouldBeAllowedDuringGeneralScreenTime:(BOOL)a3 shouldBeAllowedByScreenTimeWhenLimited:(BOOL)a4 currentApplicationState:(unint64_t)a5 emergencyModeEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  BOOL v9 = a3;
  if ([(STConversationContext *)self shouldBeAllowedDuringGeneralScreenTime] != a3) {
    [(STConversationContext *)self setShouldBeAllowedDuringGeneralScreenTime:v9];
  }
  if ([(STConversationContext *)self shouldBeAllowedByScreenTimeWhenLimited] != v8) {
    [(STConversationContext *)self setShouldBeAllowedByScreenTimeWhenLimited:v8];
  }
  if ([(STConversationContext *)self currentApplicationState] != a5) {
    [(STConversationContext *)self setCurrentApplicationState:a5];
  }
  if ([(STConversationContext *)self emergencyModeEnabled] != v6) {
    [(STConversationContext *)self setEmergencyModeEnabled:v6];
  }
  if ((a5 == 1) != [(STConversationContext *)self applicationCurrentlyLimited]) {
    [(STConversationContext *)self setApplicationCurrentlyLimited:a5 == 1];
  }
  if (!v6)
  {
    if (!a5) {
      goto LABEL_17;
    }
    if (a5 == 2)
    {
      if (![(STConversationContext *)self allowedByScreenTime]) {
        return;
      }
      BOOL v9 = 0;
      goto LABEL_21;
    }
    BOOL v9 = v8;
    if (a5 == 1)
    {
LABEL_17:
      if (v9 == [(STConversationContext *)self allowedByScreenTime]) {
        return;
      }
      goto LABEL_21;
    }
  }
  if ([(STConversationContext *)self allowedByScreenTime]) {
    return;
  }
  BOOL v9 = 1;
LABEL_21:
  [(STConversationContext *)self setAllowedByScreenTime:v9];
}

- (BOOL)shouldBeAllowedDuringGeneralScreenTime
{
  return self->_shouldBeAllowedDuringGeneralScreenTime;
}

- (unint64_t)currentApplicationState
{
  return self->_currentApplicationState;
}

- (NSArray)whitelistedHandles
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllowedByContactsHandle:(id)a3
{
}

- (NSDictionary)contactsByHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)updateForThirdPartyApplicationState:(int64_t)a3
{
  if ((a3 == 0) != [(STConversationContext *)self allowedByScreenTime])
  {
    [(STConversationContext *)self setAllowedByScreenTime:a3 == 0];
  }
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (void)setApplicationCurrentlyLimited:(BOOL)a3
{
  self->_applicationCurrentlyLimited = a3;
}

- (void)setShouldBeAllowedByScreenTimeWhenLimited:(BOOL)a3
{
  self->_shouldBeAllowedByScreenTimeWhenLimited = a3;
}

- (void)setShouldBeAllowedDuringGeneralScreenTime:(BOOL)a3
{
  self->_shouldBeAllowedDuringGeneralScreenTime = a3;
}

- (void)setContactsByHandle:(id)a3
{
}

- (void)setWhitelistedHandles:(id)a3
{
}

- (void)setCurrentApplicationState:(unint64_t)a3
{
  self->_currentApplicationState = a3;
}

- (void)setEmergencyModeEnabled:(BOOL)a3
{
  self->_emergencyModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedHandles, 0);
  objc_storeStrong((id *)&self->_contactsByHandle, 0);
  objc_storeStrong((id *)&self->_allowedByContactsHandle, 0);
}

@end