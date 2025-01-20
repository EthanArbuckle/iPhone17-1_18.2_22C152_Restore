@interface SPISELFMessageBuilder
- (POWSchemaProvisionalPOWClientEvent)powClientEventMsg;
- (POWSchemaProvisionalPOWProcessUsage)procUsageMsg;
- (POWSchemaProvisionalPOWUsage)usageMsg;
- (SISchemaInstrumentationMessage)eventContextMsg;
- (SPISELFMessageBuilder)init;
- (id)buildMessage;
- (void)addContext:(id)a3;
- (void)addProcess:(unsigned __int8)a3;
- (void)addProcessUsage:(SPIResourceUsage *)a3;
- (void)addRequestLinkInfoForComponent:(int)a3 identifier:(id)a4;
- (void)setEventContextMsg:(id)a3;
- (void)setPowClientEventMsg:(id)a3;
- (void)setProcUsageMsg:(id)a3;
- (void)setUsageMsg:(id)a3;
@end

@implementation SPISELFMessageBuilder

- (SPISELFMessageBuilder)init
{
  v7.receiver = self;
  v7.super_class = (Class)SPISELFMessageBuilder;
  v3 = [(SPISELFMessageBuilder *)&v7 init];
  if (v3 == self)
  {
    v4 = objc_alloc_init(POWSchemaProvisionalPOWUsage);
    [(SPISELFMessageBuilder *)self setUsageMsg:v4];

    v5 = objc_alloc_init(POWSchemaProvisionalPOWClientEvent);
    [(SPISELFMessageBuilder *)self setPowClientEventMsg:v5];
  }
  return v3;
}

- (void)addProcess:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(SPISELFMessageBuilder *)self usageMsg];
  objc_msgSend(v4, "setProcess:", +[SPISELFProcessAdapter translateProcess:](SPISELFProcessAdapter, "translateProcess:", v3));
}

- (void)addProcessUsage:(SPIResourceUsage *)a3
{
  v6 = objc_alloc_init(POWSchemaProvisionalPOWProcessUsage);
  [(POWSchemaProvisionalPOWProcessUsage *)v6 setCpuCycles:a3->cpuCycles];
  [(POWSchemaProvisionalPOWProcessUsage *)v6 setCpuInstructions:a3->cpuInstructions];
  [(POWSchemaProvisionalPOWProcessUsage *)v6 setMemoryFootprint:a3->memPhysFootprint];
  v5 = [(SPISELFMessageBuilder *)self usageMsg];
  [v5 setProcessUsage:v6];
}

- (void)addContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SPISELFMessageBuilder *)self usageMsg];
  [v4 setContextForUsage:v5];
}

- (void)addRequestLinkInfoForComponent:(int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = (objc_class *)MEMORY[0x1E4FA1308];
  id v7 = a4;
  id v10 = objc_alloc_init(v6);
  [v10 setComponent:v4];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v7];

  [v10 setUuid:v8];
  v9 = [(SPISELFMessageBuilder *)self powClientEventMsg];
  [v9 setLink:v10];
}

- (id)buildMessage
{
  uint64_t v3 = [(SPISELFMessageBuilder *)self powClientEventMsg];
  uint64_t v4 = [(SPISELFMessageBuilder *)self usageMsg];
  [v3 setUsage:v4];

  return [(SPISELFMessageBuilder *)self powClientEventMsg];
}

- (POWSchemaProvisionalPOWClientEvent)powClientEventMsg
{
  return self->_powClientEventMsg;
}

- (void)setPowClientEventMsg:(id)a3
{
}

- (POWSchemaProvisionalPOWUsage)usageMsg
{
  return self->_usageMsg;
}

- (void)setUsageMsg:(id)a3
{
}

- (POWSchemaProvisionalPOWProcessUsage)procUsageMsg
{
  return self->_procUsageMsg;
}

- (void)setProcUsageMsg:(id)a3
{
}

- (SISchemaInstrumentationMessage)eventContextMsg
{
  return self->_eventContextMsg;
}

- (void)setEventContextMsg:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventContextMsg, 0);
  objc_storeStrong((id *)&self->_procUsageMsg, 0);
  objc_storeStrong((id *)&self->_usageMsg, 0);

  objc_storeStrong((id *)&self->_powClientEventMsg, 0);
}

@end