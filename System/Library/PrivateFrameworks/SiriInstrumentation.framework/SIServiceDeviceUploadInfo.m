@interface SIServiceDeviceUploadInfo
- (BOOL)hasNs_relative_to_boot;
- (BOOL)hasRef_id;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)ref_id;
- (SIServiceDeviceUploadInfo)initWithDictionary:(id)a3;
- (SIServiceDeviceUploadInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)ns_relative_to_boot;
- (void)deleteNs_relative_to_boot;
- (void)deleteRef_id;
- (void)setHasNs_relative_to_boot:(BOOL)a3;
- (void)setHasRef_id:(BOOL)a3;
- (void)setNs_relative_to_boot:(unint64_t)a3;
- (void)setRef_id:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIServiceDeviceUploadInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasRef_id:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)ns_relative_to_boot
{
  return self->_ns_relative_to_boot;
}

- (void)setRef_id:(id)a3
{
}

- (NSString)ref_id
{
  return self->_ref_id;
}

- (SIServiceDeviceUploadInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIServiceDeviceUploadInfo;
  v5 = [(SIServiceDeviceUploadInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"refId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SIServiceDeviceUploadInfo *)v5 setRef_id:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"nsRelativeToBoot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIServiceDeviceUploadInfo setNs_relative_to_boot:](v5, "setNs_relative_to_boot:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SIServiceDeviceUploadInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIServiceDeviceUploadInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIServiceDeviceUploadInfo *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SIServiceDeviceUploadInfo ns_relative_to_boot](self, "ns_relative_to_boot"));
    [v3 setObject:v4 forKeyedSubscript:@"nsRelativeToBoot"];
  }
  if (self->_ref_id)
  {
    v5 = [(SIServiceDeviceUploadInfo *)self ref_id];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"refId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ref_id hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_ns_relative_to_boot;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SIServiceDeviceUploadInfo *)self ref_id];
  v6 = objc_msgSend(v4, "ref_id");
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(SIServiceDeviceUploadInfo *)self ref_id];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SIServiceDeviceUploadInfo *)self ref_id];
    objc_super v11 = objc_msgSend(v4, "ref_id");
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[24] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t ns_relative_to_boot = self->_ns_relative_to_boot;
    if (ns_relative_to_boot != objc_msgSend(v4, "ns_relative_to_boot")) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(SIServiceDeviceUploadInfo *)self ref_id];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceDeviceUploadInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteNs_relative_to_boot
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNs_relative_to_boot:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNs_relative_to_boot
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNs_relative_to_boot:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t ns_relative_to_boot = a3;
}

- (void)deleteRef_id
{
}

- (BOOL)hasRef_id
{
  return self->_ref_id != 0;
}

@end