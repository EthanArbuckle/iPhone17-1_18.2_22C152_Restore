@interface SPIPowerLoggerSnapshot
- (SPIPowerLogger)powerLogger;
- (SPIPowerLoggerSnapshot)init;
- (SPIPowerLoggerSnapshot)initWithPowerLogger:(id)a3 usage:(SPIResourceUsage *)a4 captureTimestamp:(unint64_t)a5;
- (SPIResourceUsage)usage;
- (unint64_t)captureTimestamp;
- (void)buildAndEmitWithMessageBuilder:(id)a3 eventContext:(id)a4;
- (void)logWithEventContext:(id)a3;
- (void)logWithEventContext:(id)a3 asrIdentifier:(id)a4;
- (void)logWithEventContext:(id)a3 componentName:(int)a4 identifier:(id)a5;
- (void)logWithEventContext:(id)a3 requestIdentifier:(id)a4;
- (void)logWithEventContext:(id)a3 ttsIdentifier:(id)a4;
- (void)logWithEventContext:(id)a3 turnIdentifier:(id)a4;
@end

@implementation SPIPowerLoggerSnapshot

- (SPIPowerLoggerSnapshot)init
{
  return 0;
}

- (SPIPowerLoggerSnapshot)initWithPowerLogger:(id)a3 usage:(SPIResourceUsage *)a4 captureTimestamp:(unint64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPIPowerLoggerSnapshot;
  v10 = [(SPIPowerLoggerSnapshot *)&v14 init];
  v11 = (SPIPowerLoggerSnapshot *)v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a4->cpuCycles;
    *((void *)v10 + 3) = a4->memPhysFootprint;
    *(_OWORD *)(v10 + 8) = v12;
    objc_storeStrong((id *)v10 + 4, a3);
    v11->_captureTimestamp = a5;
  }

  return v11;
}

- (void)logWithEventContext:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SPISELFMessageBuilder);
  [(SPIPowerLoggerSnapshot *)self buildAndEmitWithMessageBuilder:v5 eventContext:v4];
}

- (void)logWithEventContext:(id)a3 componentName:(int)a4 identifier:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(SPISELFMessageBuilder);
  v10 = v9;
  if (v8) {
    [(SPISELFMessageBuilder *)v9 addRequestLinkInfoForComponent:v6 identifier:v8];
  }
  [(SPIPowerLoggerSnapshot *)self buildAndEmitWithMessageBuilder:v10 eventContext:v11];
}

- (void)buildAndEmitWithMessageBuilder:(id)a3 eventContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SPIPowerLoggerSnapshot *)self powerLogger];
  objc_msgSend(v7, "addProcess:", objc_msgSend(v8, "process"));

  [(SPIPowerLoggerSnapshot *)self usage];
  [v7 addProcessUsage:v11];
  [v7 addContext:v6];

  id v9 = [v7 buildMessage];

  v10 = [MEMORY[0x1E4F9F9A8] sharedStream];
  objc_msgSend(v10, "emitMessage:timestamp:", v9, -[SPIPowerLoggerSnapshot captureTimestamp](self, "captureTimestamp"));
}

- (void)logWithEventContext:(id)a3 turnIdentifier:(id)a4
{
}

- (void)logWithEventContext:(id)a3 asrIdentifier:(id)a4
{
}

- (void)logWithEventContext:(id)a3 ttsIdentifier:(id)a4
{
}

- (void)logWithEventContext:(id)a3 requestIdentifier:(id)a4
{
}

- (SPIResourceUsage)usage
{
  *retstr = *(SPIResourceUsage *)&self->cpuInstructions;
  return self;
}

- (SPIPowerLogger)powerLogger
{
  return self->_powerLogger;
}

- (unint64_t)captureTimestamp
{
  return self->_captureTimestamp;
}

- (void).cxx_destruct
{
}

@end