@interface MHSchemaMHApplicationPlaybackAttempted
- (BOOL)hasAppBundleName;
- (BOOL)hasAppBundleVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHApplicationPlaybackAttempted)initWithDictionary:(id)a3;
- (MHSchemaMHApplicationPlaybackAttempted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)appBundleName;
- (NSString)appBundleVersion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAppBundleName;
- (void)deleteAppBundleVersion;
- (void)setAppBundleName:(id)a3;
- (void)setAppBundleVersion:(id)a3;
- (void)setHasAppBundleName:(BOOL)a3;
- (void)setHasAppBundleVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHApplicationPlaybackAttempted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MHSchemaMHApplicationPlaybackAttempted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(MHSchemaMHApplicationPlaybackAttempted *)self deleteAppBundleName];
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
  objc_storeStrong((id *)&self->_appBundleVersion, 0);
  objc_storeStrong((id *)&self->_appBundleName, 0);
}

- (void)setHasAppBundleVersion:(BOOL)a3
{
  self->_hasAppBundleVersion = a3;
}

- (void)setHasAppBundleName:(BOOL)a3
{
  self->_hasAppBundleName = a3;
}

- (void)setAppBundleVersion:(id)a3
{
}

- (NSString)appBundleVersion
{
  return self->_appBundleVersion;
}

- (void)setAppBundleName:(id)a3
{
}

- (NSString)appBundleName
{
  return self->_appBundleName;
}

- (MHSchemaMHApplicationPlaybackAttempted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MHSchemaMHApplicationPlaybackAttempted;
  v5 = [(MHSchemaMHApplicationPlaybackAttempted *)&v12 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"appBundleName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHApplicationPlaybackAttempted *)v5 setAppBundleName:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"appBundleVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(MHSchemaMHApplicationPlaybackAttempted *)v5 setAppBundleVersion:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (MHSchemaMHApplicationPlaybackAttempted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHApplicationPlaybackAttempted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHApplicationPlaybackAttempted *)self dictionaryRepresentation];
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
  if (self->_appBundleName)
  {
    id v4 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appBundleName"];
  }
  if (self->_appBundleVersion)
  {
    int v6 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleVersion];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"appBundleVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleName hash];
  return [(NSString *)self->_appBundleVersion hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleName];
  int v6 = [v4 appBundleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleName];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleName];
    v10 = [v4 appBundleName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleVersion];
  int v6 = [v4 appBundleVersion];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleVersion];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleVersion];
    v15 = [v4 appBundleVersion];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(MHSchemaMHApplicationPlaybackAttempted *)self appBundleVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHApplicationPlaybackAttemptedReadFrom(self, (uint64_t)a3);
}

- (void)deleteAppBundleVersion
{
}

- (BOOL)hasAppBundleVersion
{
  return self->_appBundleVersion != 0;
}

- (void)deleteAppBundleName
{
}

- (BOOL)hasAppBundleName
{
  return self->_appBundleName != 0;
}

@end