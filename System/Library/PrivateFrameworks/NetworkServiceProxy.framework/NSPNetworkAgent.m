@interface NSPNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKernelActivated;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (NSData)agentData;
- (NSData)keybag;
- (NSPAppRule)appRule;
- (NSPConfiguration)configuration;
- (NSPNetworkAgent)init;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)parseAgentData;
- (void)setActive:(BOOL)a3;
- (void)setAgentData:(id)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setAppRule:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setKeybag:(id)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation NSPNetworkAgent

- (NSPNetworkAgent)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSPNetworkAgent;
  v2 = [(NSPNetworkAgent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NSPNetworkAgent *)v2 setActive:1];
    [(NSPNetworkAgent *)v3 setKernelActivated:1];
    [(NSPNetworkAgent *)v3 setUserActivated:1];
    [(NSPNetworkAgent *)v3 setVoluntary:0];
    *(_OWORD *)&v3->_dataDigest[16] = 0u;
    *(_OWORD *)v3->_dataDigest = 0u;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
    && *(void *)self->_dataDigest == v4[1]
    && *(void *)&self->_dataDigest[8] == v4[2]
    && *(void *)&self->_dataDigest[16] == v4[3]
    && *(void *)&self->_dataDigest[24] == v4[4];

  return v8;
}

+ (id)agentDomain
{
  return @"com.apple.NetworkServiceProxy";
}

+ (id)agentType
{
  return @"com.apple.NetworkServiceProxy";
}

- (NSString)agentDescription
{
  agentDescription = self->agentDescription;
  self->agentDescription = (NSString *)@"com.apple.NetworkServiceProxy";

  v4 = self->agentDescription;
  return v4;
}

- (id)copyAgentData
{
  uint64_t v3 = [(NSPNetworkAgent *)self appRule];
  if (!v3) {
    goto LABEL_11;
  }
  id v4 = (id)v3;
  objc_super v5 = [(NSPNetworkAgent *)self appRule];
  v6 = [v5 enabled];
  if (([v6 BOOLValue] & 1) == 0)
  {

    id v9 = 0;
    int v10 = 1;
LABEL_10:

    goto LABEL_12;
  }
  v7 = [(NSPNetworkAgent *)self appRule];
  BOOL v8 = [v7 useCustomProtocol];
  if (([v8 BOOLValue] & 1) == 0)
  {
    v11 = [(NSPNetworkAgent *)self appRule];
    v12 = [v11 useLocalFlowDivert];
    char v13 = [v12 BOOLValue];

    if (v13) {
      goto LABEL_7;
    }
LABEL_11:
    id v9 = 0;
    int v10 = 1;
    goto LABEL_12;
  }

LABEL_7:
  v14 = [(NSPNetworkAgent *)self appRule];
  v15 = (void *)[v14 copyTLVData];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  unsigned __int16 v16 = [v15 length];
  id v17 = v15;
  int v10 = 1;
  -[NSMutableData appendType:length:value:](v9, 1, v16, [v17 bytes]);

  if (!v9) {
    goto LABEL_12;
  }
  v18 = [(NSPNetworkAgent *)self configuration];

  if (v18)
  {
    v19 = [(NSPNetworkAgent *)self configuration];
    v20 = (void *)[v19 copyTLVData];

    unsigned __int16 v21 = [v20 length];
    id v4 = v20;
    uint64_t v22 = [v4 bytes];
    char v30 = 2;
    unsigned __int16 v29 = v21;
    [v9 appendBytes:&v30 length:1];
    [v9 appendBytes:&v29 length:2];
    [v9 appendBytes:v22 length:v29];
    int v10 = 0;
    goto LABEL_10;
  }
  int v10 = 0;
LABEL_12:
  v23 = [(NSPNetworkAgent *)self keybag];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    if (v10) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    }
    v25 = [(NSPNetworkAgent *)self keybag];
    unsigned __int16 v26 = [v25 length];
    id v27 = [(NSPNetworkAgent *)self keybag];
    -[NSMutableData appendType:length:value:](v9, 3, v26, [v27 bytes]);
  }
  return v9;
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NSPNetworkAgent);
  objc_super v5 = (unsigned __int8 *)v4;
  if (v4)
  {
    [(NSPNetworkAgent *)v4 setAgentData:v3];
    id v6 = v3;
    CC_SHA256((const void *)[v6 bytes], objc_msgSend(v6, "length"), v5 + 8);
  }

  return v5;
}

- (void)parseAgentData
{
  id v3 = [(NSPNetworkAgent *)self agentData];

  if (v3)
  {
    id v4 = [(NSPNetworkAgent *)self agentData];
    objc_super v5 = (void *)[v4 mutableCopy];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__NSPNetworkAgent_parseAgentData__block_invoke;
    v6[3] = &unk_1E5A3BB00;
    v6[4] = self;
    -[NSMutableData enumerateTLVsUsingBlock:](v5, v6);
  }
  [(NSPNetworkAgent *)self setAgentData:0];
}

uint64_t __33__NSPNetworkAgent_parseAgentData__block_invoke(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  switch(a2)
  {
    case 3:
      objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a4 length:a3];
      if (v5) {
        [*(id *)(a1 + 32) setKeybag:v5];
      }
      goto LABEL_11;
    case 2:
      objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a3 freeWhenDone:0];
      id v6 = [[NSPConfiguration alloc] initFromTLVs:v5];
      if (v6) {
        [*(id *)(a1 + 32) setConfiguration:v6];
      }
      goto LABEL_10;
    case 1:
      objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a3 freeWhenDone:0];
      id v6 = [[NSPAppRule alloc] initFromTLVs:v5];
      if (v6) {
        [*(id *)(a1 + 32) setAppRule:v6];
      }
LABEL_10:

LABEL_11:
      break;
  }
  return 1;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSPConfiguration)configuration
{
  return (NSPConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSPAppRule)appRule
{
  return (NSPAppRule *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppRule:(id)a3
{
}

- (NSData)keybag
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeybag:(id)a3
{
}

- (NSData)agentData
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAgentData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentData, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_appRule, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end