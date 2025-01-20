@interface SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRules
- (BOOL)hasModelType;
- (BOOL)hasRules;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)modelType;
- (SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules)rules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setModelType:(id)a3;
- (void)setRules:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRules

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
}

- (void)setModelType:(id)a3
{
}

- (NSString)modelType
{
  return self->_modelType;
}

- (void)setRules:(id)a3
{
}

- (SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules)rules
{
  return self->_rules;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  rules = self->_rules;
  uint64_t v6 = v4[2];
  v7 = v4;
  if (rules)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules mergeFrom:](rules, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRules setRules:](self, "setRules:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1]) {
    -[SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRules setModelType:](self, "setModelType:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *)self->_rules hash];
  return [(NSString *)self->_modelType hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((rules = self->_rules, !((unint64_t)rules | v4[2]))
     || -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules isEqual:](rules, "isEqual:")))
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
  id v6 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *)self->_rules copyWithZone:a3];
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
  if (self->_rules)
  {
    objc_msgSend(v4, "setRules:");
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
  if (self->_rules)
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
  return SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRulesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  rules = self->_rules;
  if (rules)
  {
    id v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *)rules dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"rules"];
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
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRules;
  id v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRules *)&v8 description];
  id v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATEITFMExecutedHandcraftedRules *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasModelType
{
  return self->_modelType != 0;
}

- (BOOL)hasRules
{
  return self->_rules != 0;
}

@end