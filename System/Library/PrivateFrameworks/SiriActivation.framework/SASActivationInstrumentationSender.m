@interface SASActivationInstrumentationSender
- (SASActivationInstrumentationSender)initWithAnalyticsStream:(id)a3;
- (id)_clientEventWithActivationEventIdentifier:(id)a3;
- (void)instrumentActivationMessage:(id)a3;
- (void)instrumentButtonInteractionType:(int)a3 buttonIdentifier:(id)a4 activationEventIdentifier:(id)a5;
- (void)instrumentRequestLinkToUEIWithTurnId:(id)a3 activationEventIdentifier:(id)a4;
- (void)instrumentTurnActivatedWithTurnId:(id)a3 activationEventIdentifier:(id)a4;
@end

@implementation SASActivationInstrumentationSender

- (SASActivationInstrumentationSender)initWithAnalyticsStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASActivationInstrumentationSender;
  v6 = [(SASActivationInstrumentationSender *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_analyticsStream, a3);
  }

  return v7;
}

- (void)instrumentButtonInteractionType:(int)a3 buttonIdentifier:(id)a4 activationEventIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F9FF60]);
  [v10 setButtonInteractionType:v6];
  [v10 setButtonName:v8];
  v11 = [(SASActivationInstrumentationSender *)self _clientEventWithActivationEventIdentifier:v9];
  [v11 setButtonInteractionDetected:v10];
  v12 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    if ((v6 - 1) > 2) {
      v13 = @"BUTTONINTERACTIONTYPE_UNKNOWN";
    }
    else {
      v13 = off_1E6B674C8[(int)v6 - 1];
    }
    int v16 = 136315906;
    v17 = "-[SASActivationInstrumentationSender instrumentButtonInteractionType:buttonIdentifier:activationEventIdentifier:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    v21 = v13;
    __int16 v22 = 2112;
    id v23 = v9;
    v14 = v12;
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@, %@, identifier: %@", (uint8_t *)&v16, 0x2Au);
  }
  v15 = [[SASActivationInstrumentationMessage alloc] initWithEvent:v11 activationEventIdentifier:v9 machAbsoluteTime:mach_absolute_time()];
  [(SASActivationInstrumentationSender *)self instrumentActivationMessage:v15];
}

- (void)instrumentTurnActivatedWithTurnId:(id)a3 activationEventIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F9FF78]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v6];
  [v8 setTurnId:v9];

  id v10 = [(SASActivationInstrumentationSender *)self _clientEventWithActivationEventIdentifier:v7];
  [v10 setTurnActivated:v8];
  v11 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    v14 = "-[SASActivationInstrumentationSender instrumentTurnActivatedWithTurnId:activationEventIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Turn Id: %@, activationIdentifier: %@", (uint8_t *)&v13, 0x20u);
  }
  v12 = [[SASActivationInstrumentationMessage alloc] initWithEvent:v10 activationEventIdentifier:v7 machAbsoluteTime:mach_absolute_time()];
  [(SASActivationInstrumentationSender *)self instrumentActivationMessage:v12];
}

- (void)instrumentRequestLinkToUEIWithTurnId:(id)a3 activationEventIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FA1308]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v7];
  [v8 setUuid:v9];
  [v8 setComponent:34];
  id v10 = objc_alloc_init(MEMORY[0x1E4FA1308]);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v6];
  [v10 setUuid:v11];
  [v10 setComponent:2];
  id v12 = objc_alloc_init(MEMORY[0x1E4FA12F8]);
  [v12 setSource:v8];
  [v12 setTarget:v10];
  int v13 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    __int16 v15 = "-[SASActivationInstrumentationSender instrumentRequestLinkToUEIWithTurnId:activationEventIdentifier:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Sending RequestLink event for Turn Id: %@, activationIdentifier: %@", (uint8_t *)&v14, 0x20u);
  }
  [(SiriAnalyticsClientMessageStream *)self->_analyticsStream emitMessage:v12];
}

- (void)instrumentActivationMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 event];
  id v6 = [v5 buttonInteractionDetected];

  id v7 = (void *)*MEMORY[0x1E4F4E360];
  if (v6)
  {
    id v8 = v7;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      goto LABEL_11;
    }
    id v9 = [v4 event];
    id v10 = [v9 buttonInteractionDetected];
    v11 = [v10 buttonName];
    id v12 = [v4 event];
    int v13 = [v12 buttonInteractionDetected];
    unsigned int v14 = [v13 buttonInteractionType] - 1;
    if (v14 > 2) {
      __int16 v15 = @"BUTTONINTERACTIONTYPE_UNKNOWN";
    }
    else {
      __int16 v15 = off_1E6B674C8[v14];
    }
    __int16 v18 = [v4 activationEventIdentifier];
    int v21 = 136315906;
    __int16 v22 = "-[SASActivationInstrumentationSender instrumentActivationMessage:]";
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Sending <%@, %@> for identifier %@", (uint8_t *)&v21, 0x2Au);

LABEL_9:
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    __int16 v16 = [v4 event];
    v11 = [v16 turnActivated];
    id v17 = [v4 activationEventIdentifier];
    int v21 = 136315650;
    __int16 v22 = "-[SASActivationInstrumentationSender instrumentActivationMessage:]";
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Sending %@ for identifier %@", (uint8_t *)&v21, 0x20u);

    goto LABEL_9;
  }
LABEL_11:
  analyticsStream = self->_analyticsStream;
  uint64_t v20 = [v4 event];
  -[SiriAnalyticsClientMessageStream emitMessage:timestamp:](analyticsStream, "emitMessage:timestamp:", v20, [v4 machAbsoluteTime]);
}

- (id)_clientEventWithActivationEventIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F9FF68];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F9FF70]);
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v4];

  [v6 setActivationEventId:v7];
  [v5 setEventMetadata:v6];

  return v5;
}

- (void).cxx_destruct
{
}

@end