@interface SRUIFPlatformHostingInstrumentationHandler
- (SRUIFPlatformHostingInstrumentationHandler)init;
- (SRUIFPlatformHostingInstrumentationHandlerDelegate)testDelegate;
- (void)_computeStateAndInstrumentIfNecessaryForEvent:(unint64_t)a3;
- (void)_instrumentForappearanceEvent:(unint64_t)a3 turn:(id)a4 machAbolsuteTime:(unint64_t)a5;
- (void)appearanceDidChange:(unint64_t)a3 machAbsoluteTime:(unint64_t)a4;
- (void)hostingBringUpProcessedWithTurnIdenitfier:(id)a3;
- (void)hostingDismissalProcessedWithTurnIdenitfier:(id)a3;
- (void)setTestDelegate:(id)a3;
@end

@implementation SRUIFPlatformHostingInstrumentationHandler

- (SRUIFPlatformHostingInstrumentationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRUIFPlatformHostingInstrumentationHandler;
  v2 = [(SRUIFPlatformHostingInstrumentationHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    machAbsoluteForAppearances = v2->_machAbsoluteForAppearances;
    v2->_machAbsoluteForAppearances = v3;
  }
  return v2;
}

- (void)hostingBringUpProcessedWithTurnIdenitfier:(id)a3
{
  objc_storeStrong((id *)&self->_bringUpTurnIdentifier, a3);
  [(SRUIFPlatformHostingInstrumentationHandler *)self _computeStateAndInstrumentIfNecessaryForEvent:0];
  [(SRUIFPlatformHostingInstrumentationHandler *)self _computeStateAndInstrumentIfNecessaryForEvent:1];
}

- (void)hostingDismissalProcessedWithTurnIdenitfier:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalTurnIdentifier, a3);
  [(SRUIFPlatformHostingInstrumentationHandler *)self _computeStateAndInstrumentIfNecessaryForEvent:2];
  [(SRUIFPlatformHostingInstrumentationHandler *)self _computeStateAndInstrumentIfNecessaryForEvent:3];
}

- (void)appearanceDidChange:(unint64_t)a3 machAbsoluteTime:(unint64_t)a4
{
  machAbsoluteForAppearances = self->_machAbsoluteForAppearances;
  v7 = [NSNumber numberWithUnsignedLongLong:a4];
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)machAbsoluteForAppearances setObject:v7 forKey:v8];

  [(SRUIFPlatformHostingInstrumentationHandler *)self _computeStateAndInstrumentIfNecessaryForEvent:a3];
}

- (void)_computeStateAndInstrumentIfNecessaryForEvent:(unint64_t)a3
{
  machAbsoluteForAppearances = self->_machAbsoluteForAppearances;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v13 = [(NSMutableDictionary *)machAbsoluteForAppearances objectForKeyedSubscript:v6];

  if (a3 > 1)
  {
    dismissalTurnIdentifier = self->_dismissalTurnIdentifier;
    if (!dismissalTurnIdentifier) {
      goto LABEL_3;
    }
  }
  else
  {
    dismissalTurnIdentifier = self->_bringUpTurnIdentifier;
    if (!dismissalTurnIdentifier)
    {
LABEL_3:
      v8 = 0;
      goto LABEL_11;
    }
  }
  v8 = dismissalTurnIdentifier;
  if (v13)
  {
    -[SRUIFPlatformHostingInstrumentationHandler _instrumentForappearanceEvent:turn:machAbolsuteTime:](self, "_instrumentForappearanceEvent:turn:machAbolsuteTime:", a3, v8, [v13 longLongValue]);
    v9 = self->_machAbsoluteForAppearances;
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];

    if (a3 == 1)
    {
      uint64_t v11 = 16;
    }
    else
    {
      if (a3 != 3) {
        goto LABEL_11;
      }
      uint64_t v11 = 24;
    }
    v12 = *(Class *)((char *)&self->super.isa + v11);
    *(Class *)((char *)&self->super.isa + v11) = 0;
  }
LABEL_11:
}

- (void)_instrumentForappearanceEvent:(unint64_t)a3 turn:(id)a4 machAbolsuteTime:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  switch(a3)
  {
    case 0uLL:
      id v9 = objc_alloc_init(MEMORY[0x263F6EE10]);
      v10 = (objc_class *)MEMORY[0x263F6EE20];
      goto LABEL_5;
    case 1uLL:
      id v9 = objc_alloc_init(MEMORY[0x263F6EE10]);
      uint64_t v11 = (objc_class *)MEMORY[0x263F6EE18];
      goto LABEL_7;
    case 2uLL:
      id v9 = objc_alloc_init(MEMORY[0x263F6EE28]);
      v10 = (objc_class *)MEMORY[0x263F6EE38];
LABEL_5:
      id v12 = objc_alloc_init(v10);
      [v12 setExists:1];
      [v9 setStartedOrChanged:v12];
      goto LABEL_8;
    case 3uLL:
      id v9 = objc_alloc_init(MEMORY[0x263F6EE28]);
      uint64_t v11 = (objc_class *)MEMORY[0x263F6EE30];
LABEL_7:
      id v12 = objc_alloc_init(v11);
      [v12 setExists:1];
      [v9 setEnded:v12];
LABEL_8:

      if (v9)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_testDelegate);

        if (WeakRetained)
        {
          id v14 = objc_loadWeakRetained((id *)&self->_testDelegate);
          [v14 handler:self requestToInstrumentEvent:v9 turn:v8 machAbsoluteTime:a5];
        }
        else
        {
          v15 = (void *)*MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            v17 = [v8 turnIdentifier];
            v18 = [v9 formattedText];
            int v19 = 136315906;
            v20 = "-[SRUIFPlatformHostingInstrumentationHandler _instrumentForappearanceEvent:turn:machAbolsuteTime:]";
            __int16 v21 = 2112;
            id v22 = v9;
            __int16 v23 = 2112;
            v24 = v17;
            __int16 v25 = 2112;
            v26 = v18;
            _os_log_impl(&dword_225FBA000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v19, 0x2Au);
          }
          [v8 emitInstrumentation:v9 machAbsoluteTime:a5];
        }
      }
      break;
    default:
      break;
  }
}

- (SRUIFPlatformHostingInstrumentationHandlerDelegate)testDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testDelegate);
  return (SRUIFPlatformHostingInstrumentationHandlerDelegate *)WeakRetained;
}

- (void)setTestDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testDelegate);
  objc_storeStrong((id *)&self->_dismissalTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_bringUpTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_machAbsoluteForAppearances, 0);
}

@end