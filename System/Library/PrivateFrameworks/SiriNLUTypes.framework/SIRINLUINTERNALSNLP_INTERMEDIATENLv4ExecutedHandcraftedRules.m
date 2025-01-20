@interface SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules
- (BOOL)hasRules;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules)rules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRules:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules

- (void).cxx_destruct
{
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
  uint64_t v6 = v4[1];
  if (rules)
  {
    if (v6) {
      -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules mergeFrom:](rules, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules setRules:](self, "setRules:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *)self->_rules hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    rules = self->_rules;
    if ((unint64_t)rules | v4[1]) {
      char v6 = -[SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules isEqual:](rules, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *)self->_rules copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  rules = self->_rules;
  if (rules) {
    [a3 setRules:rules];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_rules) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRulesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  rules = self->_rules;
  if (rules)
  {
    v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATESNLPHandcraftedRules *)rules dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"rules"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules;
  v4 = [(SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules *)&v8 description];
  v5 = [(SIRINLUINTERNALSNLP_INTERMEDIATENLv4ExecutedHandcraftedRules *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRules
{
  return self->_rules != 0;
}

@end