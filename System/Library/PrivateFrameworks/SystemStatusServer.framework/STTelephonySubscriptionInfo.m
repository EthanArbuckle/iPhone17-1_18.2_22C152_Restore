@interface STTelephonySubscriptionInfo
- (BOOL)isBootstrap;
- (BOOL)isHiddenSIM;
- (BOOL)isNetworkReselectionNeeded;
- (BOOL)isPreferredForDataConnections;
- (BOOL)isProvidingDataConnection;
- (BOOL)isRegisteredWithoutCellular;
- (NSString)SIMLabel;
- (NSString)SIMStatus;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)lastKnownNetworkCountryCode;
- (NSString)operatorName;
- (NSString)shortSIMLabel;
- (STTelephonySubscriptionInfo)init;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithSubscriptionInfo:(id)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)registrationRejectionCauseCode;
- (unint64_t)callForwardingIndicator;
- (unint64_t)cellularRegistrationStatus;
- (unint64_t)dataConnectionType;
- (unint64_t)maxSignalStrengthBars;
- (unint64_t)registrationStatus;
- (unint64_t)signalStrengthBars;
@end

@implementation STTelephonySubscriptionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownNetworkCountryCode, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_SIMStatus, 0);
  objc_storeStrong((id *)&self->_shortSIMLabel, 0);
  objc_storeStrong((id *)&self->_SIMLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithSubscriptionInfo:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)STTelephonySubscriptionInfo;
    a1 = objc_msgSendSuper2(&v23, sel_init);
    if (a1)
    {
      v4 = [v3 identifier];
      uint64_t v5 = [v4 copy];
      v6 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v5;

      v7 = [v3 SIMLabel];
      uint64_t v8 = [v7 copy];
      v9 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v8;

      v10 = [v3 shortSIMLabel];
      uint64_t v11 = [v10 copy];
      v12 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v11;

      v13 = [v3 SIMStatus];
      uint64_t v14 = [v13 copy];
      v15 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v14;

      *((unsigned char *)a1 + 40) = [v3 isHiddenSIM];
      *((void *)a1 + 6) = [v3 registrationStatus];
      *((void *)a1 + 7) = [v3 cellularRegistrationStatus];
      *((void *)a1 + 8) = [v3 dataConnectionType];
      *((unsigned char *)a1 + 72) = [v3 isPreferredForDataConnections];
      *((unsigned char *)a1 + 73) = [v3 isProvidingDataConnection];
      *((unsigned char *)a1 + 74) = [v3 isBootstrap];
      *((unsigned char *)a1 + 75) = [v3 isRegisteredWithoutCellular];
      *((void *)a1 + 10) = [v3 signalStrengthBars];
      *((void *)a1 + 11) = [v3 maxSignalStrengthBars];
      v16 = [v3 operatorName];
      uint64_t v17 = [v16 copy];
      v18 = (void *)*((void *)a1 + 12);
      *((void *)a1 + 12) = v17;

      v19 = [v3 lastKnownNetworkCountryCode];
      uint64_t v20 = [v19 copy];
      v21 = (void *)*((void *)a1 + 13);
      *((void *)a1 + 13) = v20;

      *((void *)a1 + 14) = [v3 callForwardingIndicator];
      *((unsigned char *)a1 + 120) = [v3 isNetworkReselectionNeeded];
      *((void *)a1 + 16) = [v3 registrationRejectionCauseCode];
    }
  }

  return a1;
}

- (unint64_t)dataConnectionType
{
  return self->_dataConnectionType;
}

- (unint64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (BOOL)isHiddenSIM
{
  return self->_hiddenSIM;
}

- (BOOL)isBootstrap
{
  return self->_bootstrap;
}

- (unint64_t)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (NSString)shortSIMLabel
{
  return self->_shortSIMLabel;
}

- (int64_t)registrationRejectionCauseCode
{
  return self->_registrationRejectionCauseCode;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (unint64_t)maxSignalStrengthBars
{
  return self->_maxSignalStrengthBars;
}

- (NSString)lastKnownNetworkCountryCode
{
  return self->_lastKnownNetworkCountryCode;
}

- (BOOL)isRegisteredWithoutCellular
{
  return self->_registeredWithoutCellular;
}

- (BOOL)isProvidingDataConnection
{
  return self->_providingDataConnection;
}

- (BOOL)isPreferredForDataConnections
{
  return self->_preferredForDataConnections;
}

- (BOOL)isNetworkReselectionNeeded
{
  return self->_networkReselectionNeeded;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)cellularRegistrationStatus
{
  return self->_cellularRegistrationStatus;
}

- (unint64_t)callForwardingIndicator
{
  return self->_callForwardingIndicator;
}

- (NSString)SIMStatus
{
  return self->_SIMStatus;
}

- (NSString)SIMLabel
{
  return self->_SIMLabel;
}

- (STTelephonySubscriptionInfo)init
{
  return (STTelephonySubscriptionInfo *)-[STTelephonySubscriptionInfo initWithSubscriptionInfo:](self, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[STMutableTelephonySubscriptionInfo allocWithZone:a3];
  return -[STTelephonySubscriptionInfo initWithSubscriptionInfo:](v4, self);
}

- (NSString)description
{
  return (NSString *)[(STTelephonySubscriptionInfo *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STTelephonySubscriptionInfo *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STTelephonySubscriptionInfo *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(STTelephonySubscriptionInfo *)self SIMStatus];
  [v3 appendString:v4 withName:@"SIMStatus"];

  id v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[STTelephonySubscriptionInfo isHiddenSIM](self, "isHiddenSIM"), @"hiddenSIM", 1);
  v6 = STTelephonyRegistrationStatusDebugName([(STTelephonySubscriptionInfo *)self registrationStatus]);
  [v3 appendString:v6 withName:@"registrationStatus"];

  v7 = STTelephonyRegistrationStatusDebugName([(STTelephonySubscriptionInfo *)self cellularRegistrationStatus]);
  [v3 appendString:v7 withName:@"cellularRegistrationStatus"];

  uint64_t v8 = STTelephonyDataConnectionTypeDebugName([(STTelephonySubscriptionInfo *)self dataConnectionType]);
  [v3 appendString:v8 withName:@"dataConnectionType"];

  id v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[STTelephonySubscriptionInfo signalStrengthBars](self, "signalStrengthBars"), @"signalStrengthBars");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[STTelephonySubscriptionInfo isPreferredForDataConnections](self, "isPreferredForDataConnections"), @"isPreferredForDataConnections");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[STTelephonySubscriptionInfo isProvidingDataConnection](self, "isProvidingDataConnection"), @"isProvidingDataConnection");
  v12 = [(STTelephonySubscriptionInfo *)self operatorName];
  [v3 appendString:v12 withName:@"operatorName"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STTelephonySubscriptionInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__STTelephonySubscriptionInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AD1EE0;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __69__STTelephonySubscriptionInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) SIMStatus];
  [v2 appendString:v3 withName:@"SIMStatus"];

  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHiddenSIM"), @"hiddenSIM", 1);
  id v5 = *(void **)(a1 + 32);
  v6 = STTelephonyRegistrationStatusDebugName([*(id *)(a1 + 40) registrationStatus]);
  [v5 appendString:v6 withName:@"registrationStatus"];

  id v7 = *(void **)(a1 + 32);
  id v8 = STTelephonyRegistrationStatusDebugName([*(id *)(a1 + 40) cellularRegistrationStatus]);
  [v7 appendString:v8 withName:@"cellularRegistrationStatus"];

  id v9 = *(void **)(a1 + 32);
  id v10 = STTelephonyDataConnectionTypeDebugName([*(id *)(a1 + 40) dataConnectionType]);
  [v9 appendString:v10 withName:@"dataConnectionType"];

  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), @"signalStrengthBars");
  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPreferredForDataConnections"), @"isPreferredForDataConnections");
  id v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isProvidingDataConnection"), @"isProvidingDataConnection");
  uint64_t v14 = *(void **)(a1 + 32);
  id v15 = [*(id *)(a1 + 40) operatorName];
  [v14 appendString:v15 withName:@"operatorName"];
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = self;
  if (self)
  {
    id v4 = (void *)MEMORY[0x1E4F4F718];
    id v5 = a3;
    v6 = [v4 builderWithObject:v3];
    [v6 setUseDebugDescription:1];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __74__STTelephonySubscriptionInfo_debugDescriptionBuilderWithMultilinePrefix___block_invoke;
    id v13 = &unk_1E6AD1EE0;
    id v7 = v6;
    id v14 = v7;
    id v15 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:&v10];

    id v3 = (STTelephonySubscriptionInfo *)v7;
  }
  id v8 = [(STTelephonySubscriptionInfo *)v3 build];

  return v8;
}

id __74__STTelephonySubscriptionInfo_debugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 appendString:v3 withName:@"identifier"];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) SIMLabel];
  [v4 appendString:v5 withName:@"SIMLabel"];

  v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) shortSIMLabel];
  [v6 appendString:v7 withName:@"shortSIMLabel"];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) SIMStatus];
  [v8 appendString:v9 withName:@"SIMStatus"];

  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isHiddenSIM"), @"hiddenSIM", 1);
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = STTelephonyRegistrationStatusDebugName([*(id *)(a1 + 40) registrationStatus]);
  [v11 appendString:v12 withName:@"registrationStatus"];

  id v13 = *(void **)(a1 + 32);
  id v14 = STTelephonyRegistrationStatusDebugName([*(id *)(a1 + 40) cellularRegistrationStatus]);
  [v13 appendString:v14 withName:@"cellularRegistrationStatus"];

  id v15 = *(void **)(a1 + 32);
  v16 = STTelephonyDataConnectionTypeDebugName([*(id *)(a1 + 40) dataConnectionType]);
  [v15 appendString:v16 withName:@"dataConnectionType"];

  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPreferredForDataConnections"), @"isPreferredForDataConnections");
  id v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isProvidingDataConnection"), @"isProvidingDataConnection");
  id v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBootstrap"), @"isBootstrap");
  id v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRegisteredWithoutCellular"), @"isRegisteredWithoutCellular");
  id v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "signalStrengthBars"), @"signalStrengthBars");
  id v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maxSignalStrengthBars"), @"maxSignalStrengthBars");
  objc_super v23 = *(void **)(a1 + 32);
  v24 = [*(id *)(a1 + 40) operatorName];
  [v23 appendString:v24 withName:@"operatorName"];

  v25 = *(void **)(a1 + 32);
  v26 = [*(id *)(a1 + 40) lastKnownNetworkCountryCode];
  [v25 appendString:v26 withName:@"lastKnownNetworkCountryCode"];

  v27 = *(void **)(a1 + 32);
  v28 = STTelephonyCallForwardingIndicatorDebugName([*(id *)(a1 + 40) callForwardingIndicator]);
  [v27 appendString:v28 withName:@"callForwardingIndicator"];

  id v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isNetworkReselectionNeeded"), @"isNetworkReselectionNeeded");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "registrationRejectionCauseCode"), @"registrationRejectionCauseCode");
}

@end