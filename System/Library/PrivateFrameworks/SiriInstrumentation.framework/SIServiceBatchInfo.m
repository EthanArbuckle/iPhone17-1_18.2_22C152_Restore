@interface SIServiceBatchInfo
- (BOOL)hasBatch_id;
- (BOOL)hasBatch_type;
- (BOOL)hasDevice_upload_info;
- (BOOL)hasServer_upload_info;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)batch_id;
- (NSData)jsonData;
- (SIServiceBatchInfo)initWithDictionary:(id)a3;
- (SIServiceBatchInfo)initWithJSON:(id)a3;
- (SIServiceDeviceUploadInfo)device_upload_info;
- (SIServiceServerUploadInfo)server_upload_info;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)batch_type;
- (unint64_t)hash;
- (unint64_t)whichUpload_Info;
- (void)deleteBatch_id;
- (void)deleteBatch_type;
- (void)deleteDevice_upload_info;
- (void)deleteServer_upload_info;
- (void)setBatch_id:(id)a3;
- (void)setBatch_type:(int)a3;
- (void)setDevice_upload_info:(id)a3;
- (void)setHasBatch_id:(BOOL)a3;
- (void)setHasBatch_type:(BOOL)a3;
- (void)setHasDevice_upload_info:(BOOL)a3;
- (void)setHasServer_upload_info:(BOOL)a3;
- (void)setServer_upload_info:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIServiceBatchInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIServiceBatchInfo;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SIServiceBatchInfo *)self device_upload_info];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SIServiceBatchInfo *)self deleteDevice_upload_info];
  }
  v9 = [(SIServiceBatchInfo *)self server_upload_info];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SIServiceBatchInfo *)self deleteServer_upload_info];
  }

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
  objc_storeStrong((id *)&self->_server_upload_info, 0);
  objc_storeStrong((id *)&self->_device_upload_info, 0);
  objc_storeStrong((id *)&self->_batch_id, 0);
}

- (void)setHasServer_upload_info:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasServer_upload_info
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasDevice_upload_info:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasDevice_upload_info
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasBatch_id:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)batch_type
{
  return self->_batch_type;
}

- (void)setBatch_id:(id)a3
{
}

- (NSData)batch_id
{
  return self->_batch_id;
}

- (unint64_t)whichUpload_Info
{
  return *(void *)&self->_hasBatch_id;
}

- (SIServiceBatchInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIServiceBatchInfo;
  v5 = [(SIServiceBatchInfo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"batchId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(SIServiceBatchInfo *)v5 setBatch_id:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"deviceUploadInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SIServiceDeviceUploadInfo alloc] initWithDictionary:v8];
      [(SIServiceBatchInfo *)v5 setDevice_upload_info:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"serverUploadInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SIServiceServerUploadInfo alloc] initWithDictionary:v10];
      [(SIServiceBatchInfo *)v5 setServer_upload_info:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"batchType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIServiceBatchInfo setBatch_type:](v5, "setBatch_type:", [v12 intValue]);
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (SIServiceBatchInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIServiceBatchInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIServiceBatchInfo *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_batch_id)
  {
    id v4 = [(SIServiceBatchInfo *)self batch_id];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"batchId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"batchId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v7 = [(SIServiceBatchInfo *)self batch_type];
    int v8 = @"UNKNOWN";
    if (v7 == 1) {
      int v8 = @"DATA";
    }
    if (v7 == 2) {
      v9 = @"SENTINEL";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"batchType"];
  }
  if (self->_device_upload_info)
  {
    v10 = [(SIServiceBatchInfo *)self device_upload_info];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"deviceUploadInfo"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"deviceUploadInfo"];
    }
  }
  if (self->_server_upload_info)
  {
    objc_super v13 = [(SIServiceBatchInfo *)self server_upload_info];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"serverUploadInfo"];
    }
    else
    {
      objc_super v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"serverUploadInfo"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_batch_id hash];
  unint64_t v4 = [(SIServiceDeviceUploadInfo *)self->_device_upload_info hash];
  unint64_t v5 = [(SIServiceServerUploadInfo *)self->_server_upload_info hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_batch_type;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)&self->_hasBatch_id;
  if (v5 != objc_msgSend(v4, "whichUpload_Info")) {
    goto LABEL_18;
  }
  uint64_t v6 = [(SIServiceBatchInfo *)self batch_id];
  int v7 = objc_msgSend(v4, "batch_id");
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(SIServiceBatchInfo *)self batch_id];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SIServiceBatchInfo *)self batch_id];
    int v11 = objc_msgSend(v4, "batch_id");
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SIServiceBatchInfo *)self device_upload_info];
  int v7 = objc_msgSend(v4, "device_upload_info");
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(SIServiceBatchInfo *)self device_upload_info];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(SIServiceBatchInfo *)self device_upload_info];
    v16 = objc_msgSend(v4, "device_upload_info");
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SIServiceBatchInfo *)self server_upload_info];
  int v7 = objc_msgSend(v4, "server_upload_info");
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v18 = [(SIServiceBatchInfo *)self server_upload_info];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(SIServiceBatchInfo *)self server_upload_info];
    v21 = objc_msgSend(v4, "server_upload_info");
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int batch_type = self->_batch_type, batch_type == objc_msgSend(v4, "batch_type")))
    {
      BOOL v23 = 1;
      goto LABEL_19;
    }
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(SIServiceBatchInfo *)self batch_id];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  uint64_t v5 = [(SIServiceBatchInfo *)self device_upload_info];

  if (v5)
  {
    uint64_t v6 = [(SIServiceBatchInfo *)self device_upload_info];
    PBDataWriterWriteSubmessage();
  }
  int v7 = [(SIServiceBatchInfo *)self server_upload_info];

  if (v7)
  {
    uint64_t v8 = [(SIServiceBatchInfo *)self server_upload_info];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceBatchInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteBatch_type
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBatch_type:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBatch_type
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBatch_type:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int batch_type = a3;
}

- (void)deleteServer_upload_info
{
  if (*(void *)&self->_hasBatch_id == 3)
  {
    *(void *)&self->_hasBatch_id = 0;
    self->_server_upload_info = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIServiceServerUploadInfo)server_upload_info
{
  if (*(void *)&self->_hasBatch_id == 3) {
    v2 = self->_server_upload_info;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setServer_upload_info:(id)a3
{
  unint64_t v4 = (SIServiceServerUploadInfo *)a3;
  device_upload_info = self->_device_upload_info;
  self->_device_upload_info = 0;

  uint64_t v6 = 3;
  if (!v4) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_hasBatch_id = v6;
  server_upload_info = self->_server_upload_info;
  self->_server_upload_info = v4;
}

- (void)deleteDevice_upload_info
{
  if (*(void *)&self->_hasBatch_id == 2)
  {
    *(void *)&self->_hasBatch_id = 0;
    self->_device_upload_info = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SIServiceDeviceUploadInfo)device_upload_info
{
  if (*(void *)&self->_hasBatch_id == 2) {
    v2 = self->_device_upload_info;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDevice_upload_info:(id)a3
{
  unint64_t v4 = (SIServiceDeviceUploadInfo *)a3;
  server_upload_info = self->_server_upload_info;
  self->_server_upload_info = 0;

  *(void *)&self->_hasBatch_id = 2 * (v4 != 0);
  device_upload_info = self->_device_upload_info;
  self->_device_upload_info = v4;
}

- (void)deleteBatch_id
{
}

- (BOOL)hasBatch_id
{
  return self->_batch_id != 0;
}

@end