@interface SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion
- (BOOL)hasModelType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)modelType;
- (SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setModelType:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
}

- (void)setModelType:(id)a3
{
}

- (NSString)modelType
{
  return self->_modelType;
}

- (void)setVersion:(id)a3
{
}

- (SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  version = self->_version;
  uint64_t v6 = v4[2];
  v7 = v4;
  if (version)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion mergeFrom:](version, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion setVersion:](self, "setVersion:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1]) {
    -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion setModelType:](self, "setModelType:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *)self->_version hash];
  return [(NSString *)self->_modelType hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((version = self->_version, !((unint64_t)version | v4[2]))
     || -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion isEqual:](version, "isEqual:")))
  {
    modelType = self->_modelType;
    if ((unint64_t)modelType | v4[1]) {
      char v7 = -[NSString isEqual:](modelType, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *)self->_version copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_modelType copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_version)
  {
    objc_msgSend(v4, "setVersion:");
    id v4 = v5;
  }
  if (self->_modelType)
  {
    objc_msgSend(v5, "setModelType:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_version)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_modelType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  version = self->_version;
  if (version)
  {
    id v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *)version dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"version"];
  }
  modelType = self->_modelType;
  if (modelType) {
    [v3 setObject:modelType forKey:@"model_type"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion;
  id v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion *)&v8 description];
  id v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersion *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasModelType
{
  return self->_modelType != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

@end