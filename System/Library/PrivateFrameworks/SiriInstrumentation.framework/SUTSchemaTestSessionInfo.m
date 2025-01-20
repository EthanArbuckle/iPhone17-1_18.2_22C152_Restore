@interface SUTSchemaTestSessionInfo
- (BOOL)hasBundleId;
- (BOOL)hasCpuArchitecture;
- (BOOL)hasDeviceName;
- (BOOL)hasHardwareModel;
- (BOOL)hasIsSimulator;
- (BOOL)hasModelNumber;
- (BOOL)hasProductType;
- (BOOL)hasProductVersion;
- (BOOL)hasSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSimulator;
- (BOOL)readFrom:(id)a3;
- (NSArray)testSessionInfoItems;
- (NSData)jsonData;
- (NSString)bundleId;
- (NSString)cpuArchitecture;
- (NSString)deviceName;
- (NSString)hardwareModel;
- (NSString)modelNumber;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)systemBuild;
- (SUTSchemaTestSessionInfo)initWithDictionary:(id)a3;
- (SUTSchemaTestSessionInfo)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (id)testSessionInfoItemAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)testSessionInfoItemCount;
- (void)addTestSessionInfoItem:(id)a3;
- (void)clearTestSessionInfoItem;
- (void)deleteBundleId;
- (void)deleteCpuArchitecture;
- (void)deleteDeviceName;
- (void)deleteHardwareModel;
- (void)deleteIsSimulator;
- (void)deleteModelNumber;
- (void)deleteProductType;
- (void)deleteProductVersion;
- (void)deleteSystemBuild;
- (void)setBundleId:(id)a3;
- (void)setCpuArchitecture:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHardwareModel:(id)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasCpuArchitecture:(BOOL)a3;
- (void)setHasDeviceName:(BOOL)a3;
- (void)setHasHardwareModel:(BOOL)a3;
- (void)setHasIsSimulator:(BOOL)a3;
- (void)setHasModelNumber:(BOOL)a3;
- (void)setHasProductType:(BOOL)a3;
- (void)setHasProductVersion:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setIsSimulator:(BOOL)a3;
- (void)setModelNumber:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setSystemBuild:(id)a3;
- (void)setTestSessionInfoItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUTSchemaTestSessionInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUTSchemaTestSessionInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SUTSchemaTestSessionInfo *)self testSessionInfoItems];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(SUTSchemaTestSessionInfo *)self setTestSessionInfoItems:v7];
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testSessionInfoItems, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_cpuArchitecture, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

- (void)setHasDeviceName:(BOOL)a3
{
  self->_hasProductType = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  self->_hasModelNumber = a3;
}

- (void)setHasProductVersion:(BOOL)a3
{
  self->_hasHardwareModel = a3;
}

- (void)setHasProductType:(BOOL)a3
{
  self->_hasCpuArchitecture = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasHardwareModel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCpuArchitecture:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTestSessionInfoItems:(id)a3
{
}

- (NSArray)testSessionInfoItems
{
  return self->_testSessionInfoItems;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (BOOL)isSimulator
{
  return self->_isSimulator;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductType:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setHardwareModel:(id)a3
{
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setCpuArchitecture:(id)a3
{
}

- (NSString)cpuArchitecture
{
  return self->_cpuArchitecture;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (SUTSchemaTestSessionInfo)initWithDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SUTSchemaTestSessionInfo;
  v5 = [(SUTSchemaTestSessionInfo *)&v45 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    v40 = v6;
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SUTSchemaTestSessionInfo *)v5 setSystemBuild:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"cpuArchitecture"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(SUTSchemaTestSessionInfo *)v5 setCpuArchitecture:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"hardwareModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(SUTSchemaTestSessionInfo *)v5 setHardwareModel:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"modelNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(SUTSchemaTestSessionInfo *)v5 setModelNumber:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"productType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(SUTSchemaTestSessionInfo *)v5 setProductType:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"productVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(SUTSchemaTestSessionInfo *)v5 setProductVersion:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"isSimulator"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUTSchemaTestSessionInfo setIsSimulator:](v5, "setIsSimulator:", [v18 BOOLValue]);
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    v39 = (void *)v19;
    if (objc_opt_isKindOfClass())
    {
      v20 = v18;
      v21 = (void *)[v39 copy];
      [(SUTSchemaTestSessionInfo *)v5 setBundleId:v21];

      v18 = v20;
    }
    v22 = [v4 objectForKeyedSubscript:@"deviceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(SUTSchemaTestSessionInfo *)v5 setDeviceName:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"testSessionInfoItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = v22;
      v35 = v18;
      v36 = v12;
      v37 = v10;
      v38 = v8;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v42 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v31 = [[SUTSchemaTestSessionInfoItem alloc] initWithDictionary:v30];
              [(SUTSchemaTestSessionInfo *)v5 addTestSessionInfoItem:v31];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v27);
      }

      v10 = v37;
      v8 = v38;
      v12 = v36;
      v18 = v35;
      v22 = v34;
    }
    v32 = v5;
  }
  return v5;
}

- (SUTSchemaTestSessionInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUTSchemaTestSessionInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUTSchemaTestSessionInfo *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_bundleId)
  {
    id v4 = [(SUTSchemaTestSessionInfo *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_cpuArchitecture)
  {
    v6 = [(SUTSchemaTestSessionInfo *)self cpuArchitecture];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"cpuArchitecture"];
  }
  if (self->_deviceName)
  {
    v8 = [(SUTSchemaTestSessionInfo *)self deviceName];
    objc_super v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"deviceName"];
  }
  if (self->_hardwareModel)
  {
    v10 = [(SUTSchemaTestSessionInfo *)self hardwareModel];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"hardwareModel"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SUTSchemaTestSessionInfo isSimulator](self, "isSimulator"));
    [v3 setObject:v12 forKeyedSubscript:@"isSimulator"];
  }
  if (self->_modelNumber)
  {
    v13 = [(SUTSchemaTestSessionInfo *)self modelNumber];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"modelNumber"];
  }
  if (self->_productType)
  {
    v15 = [(SUTSchemaTestSessionInfo *)self productType];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"productType"];
  }
  if (self->_productVersion)
  {
    v17 = [(SUTSchemaTestSessionInfo *)self productVersion];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"productVersion"];
  }
  if (self->_systemBuild)
  {
    uint64_t v19 = [(SUTSchemaTestSessionInfo *)self systemBuild];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"systemBuild"];
  }
  if ([(NSArray *)self->_testSessionInfoItems count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v22 = self->_testSessionInfoItems;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "dictionaryRepresentation", (void)v30);
          if (v27)
          {
            [v21 addObject:v27];
          }
          else
          {
            uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
            [v21 addObject:v28];
          }
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"testSessionInfoItem"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v30);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_systemBuild hash];
  NSUInteger v4 = [(NSString *)self->_cpuArchitecture hash];
  NSUInteger v5 = [(NSString *)self->_hardwareModel hash];
  NSUInteger v6 = [(NSString *)self->_modelNumber hash];
  NSUInteger v7 = [(NSString *)self->_productType hash];
  NSUInteger v8 = [(NSString *)self->_productVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_isSimulator;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v11 = [(NSString *)self->_bundleId hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_deviceName hash];
  return v10 ^ v12 ^ [(NSArray *)self->_testSessionInfoItems hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self systemBuild];
  NSUInteger v6 = [v4 systemBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v7 = [(SUTSchemaTestSessionInfo *)self systemBuild];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(SUTSchemaTestSessionInfo *)self systemBuild];
    NSUInteger v10 = [v4 systemBuild];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self cpuArchitecture];
  NSUInteger v6 = [v4 cpuArchitecture];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v12 = [(SUTSchemaTestSessionInfo *)self cpuArchitecture];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(SUTSchemaTestSessionInfo *)self cpuArchitecture];
    v15 = [v4 cpuArchitecture];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self hardwareModel];
  NSUInteger v6 = [v4 hardwareModel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v17 = [(SUTSchemaTestSessionInfo *)self hardwareModel];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(SUTSchemaTestSessionInfo *)self hardwareModel];
    v20 = [v4 hardwareModel];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self modelNumber];
  NSUInteger v6 = [v4 modelNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v22 = [(SUTSchemaTestSessionInfo *)self modelNumber];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(SUTSchemaTestSessionInfo *)self modelNumber];
    uint64_t v25 = [v4 modelNumber];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self productType];
  NSUInteger v6 = [v4 productType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v27 = [(SUTSchemaTestSessionInfo *)self productType];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    v29 = [(SUTSchemaTestSessionInfo *)self productType];
    long long v30 = [v4 productType];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self productVersion];
  NSUInteger v6 = [v4 productVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v32 = [(SUTSchemaTestSessionInfo *)self productVersion];
  if (v32)
  {
    long long v33 = (void *)v32;
    v34 = [(SUTSchemaTestSessionInfo *)self productVersion];
    uint64_t v35 = [v4 productVersion];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[88] & 1)) {
    goto LABEL_50;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isSimulator = self->_isSimulator;
    if (isSimulator != [v4 isSimulator]) {
      goto LABEL_50;
    }
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self bundleId];
  NSUInteger v6 = [v4 bundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v38 = [(SUTSchemaTestSessionInfo *)self bundleId];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(SUTSchemaTestSessionInfo *)self bundleId];
    long long v41 = [v4 bundleId];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self deviceName];
  NSUInteger v6 = [v4 deviceName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_49;
  }
  uint64_t v43 = [(SUTSchemaTestSessionInfo *)self deviceName];
  if (v43)
  {
    long long v44 = (void *)v43;
    objc_super v45 = [(SUTSchemaTestSessionInfo *)self deviceName];
    v46 = [v4 deviceName];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_50;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self testSessionInfoItems];
  NSUInteger v6 = [v4 testSessionInfoItems];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v48 = [(SUTSchemaTestSessionInfo *)self testSessionInfoItems];
    if (!v48)
    {

LABEL_53:
      BOOL v53 = 1;
      goto LABEL_51;
    }
    v49 = (void *)v48;
    v50 = [(SUTSchemaTestSessionInfo *)self testSessionInfoItems];
    v51 = [v4 testSessionInfoItems];
    char v52 = [v50 isEqual:v51];

    if (v52) {
      goto LABEL_53;
    }
  }
  else
  {
LABEL_49:
  }
LABEL_50:
  BOOL v53 = 0;
LABEL_51:

  return v53;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(SUTSchemaTestSessionInfo *)self systemBuild];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(SUTSchemaTestSessionInfo *)self cpuArchitecture];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(SUTSchemaTestSessionInfo *)self hardwareModel];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(SUTSchemaTestSessionInfo *)self modelNumber];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  uint64_t v9 = [(SUTSchemaTestSessionInfo *)self productType];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v10 = [(SUTSchemaTestSessionInfo *)self productVersion];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  int v11 = [(SUTSchemaTestSessionInfo *)self bundleId];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(SUTSchemaTestSessionInfo *)self deviceName];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v13 = self->_testSessionInfoItems;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUTSchemaTestSessionInfoReadFrom(self, (uint64_t)a3);
}

- (id)testSessionInfoItemAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_testSessionInfoItems objectAtIndexedSubscript:a3];
}

- (unint64_t)testSessionInfoItemCount
{
  return [(NSArray *)self->_testSessionInfoItems count];
}

- (void)addTestSessionInfoItem:(id)a3
{
  id v4 = a3;
  testSessionInfoItems = self->_testSessionInfoItems;
  id v8 = v4;
  if (!testSessionInfoItems)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_testSessionInfoItems;
    self->_testSessionInfoItems = v6;

    id v4 = v8;
    testSessionInfoItems = self->_testSessionInfoItems;
  }
  [(NSArray *)testSessionInfoItems addObject:v4];
}

- (void)clearTestSessionInfoItem
{
}

- (void)deleteDeviceName
{
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)deleteIsSimulator
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSimulator:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSimulator
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSimulator:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSimulator = a3;
}

- (void)deleteProductVersion
{
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (void)deleteProductType
{
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (void)deleteModelNumber
{
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (void)deleteHardwareModel
{
}

- (BOOL)hasHardwareModel
{
  return self->_hardwareModel != 0;
}

- (void)deleteCpuArchitecture
{
}

- (BOOL)hasCpuArchitecture
{
  return self->_cpuArchitecture != 0;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

@end