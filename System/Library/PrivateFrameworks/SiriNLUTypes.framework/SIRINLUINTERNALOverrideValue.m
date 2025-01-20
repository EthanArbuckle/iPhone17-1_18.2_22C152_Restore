@interface SIRINLUINTERNALOverrideValue
- (BOOL)hasCcqrOverrideTemplate;
- (BOOL)hasLvcOverrideValue;
- (BOOL)hasPlanOverrideValue;
- (BOOL)hasUserParse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALUserParse)userParse;
- (SIRINLUINTERNALCCQROverrideTemplate)ccqrOverrideTemplate;
- (SIRINLUINTERNALLVCOverrideValue)lvcOverrideValue;
- (SIRINLUINTERNALPlanOverrideValue)planOverrideValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCcqrOverrideTemplate:(id)a3;
- (void)setLvcOverrideValue:(id)a3;
- (void)setPlanOverrideValue:(id)a3;
- (void)setUserParse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALOverrideValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userParse, 0);
  objc_storeStrong((id *)&self->_planOverrideValue, 0);
  objc_storeStrong((id *)&self->_lvcOverrideValue, 0);
  objc_storeStrong((id *)&self->_ccqrOverrideTemplate, 0);
}

- (void)setPlanOverrideValue:(id)a3
{
}

- (SIRINLUINTERNALPlanOverrideValue)planOverrideValue
{
  return self->_planOverrideValue;
}

- (void)setLvcOverrideValue:(id)a3
{
}

- (SIRINLUINTERNALLVCOverrideValue)lvcOverrideValue
{
  return self->_lvcOverrideValue;
}

- (void)setUserParse:(id)a3
{
}

- (SIRINLUEXTERNALUserParse)userParse
{
  return self->_userParse;
}

- (void)setCcqrOverrideTemplate:(id)a3
{
}

- (SIRINLUINTERNALCCQROverrideTemplate)ccqrOverrideTemplate
{
  return self->_ccqrOverrideTemplate;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  ccqrOverrideTemplate = self->_ccqrOverrideTemplate;
  uint64_t v6 = v4[1];
  v13 = v4;
  if (ccqrOverrideTemplate)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALCCQROverrideTemplate mergeFrom:](ccqrOverrideTemplate, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUINTERNALOverrideValue setCcqrOverrideTemplate:](self, "setCcqrOverrideTemplate:");
  }
  v4 = v13;
LABEL_7:
  userParse = self->_userParse;
  uint64_t v8 = v4[4];
  if (userParse)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUEXTERNALUserParse mergeFrom:](userParse, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUINTERNALOverrideValue setUserParse:](self, "setUserParse:");
  }
  v4 = v13;
LABEL_13:
  lvcOverrideValue = self->_lvcOverrideValue;
  uint64_t v10 = v4[2];
  if (lvcOverrideValue)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[SIRINLUINTERNALLVCOverrideValue mergeFrom:](lvcOverrideValue, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[SIRINLUINTERNALOverrideValue setLvcOverrideValue:](self, "setLvcOverrideValue:");
  }
  v4 = v13;
LABEL_19:
  planOverrideValue = self->_planOverrideValue;
  uint64_t v12 = v4[3];
  if (planOverrideValue)
  {
    if (v12) {
      -[SIRINLUINTERNALPlanOverrideValue mergeFrom:](planOverrideValue, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUINTERNALOverrideValue setPlanOverrideValue:](self, "setPlanOverrideValue:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUINTERNALCCQROverrideTemplate *)self->_ccqrOverrideTemplate hash];
  unint64_t v4 = [(SIRINLUEXTERNALUserParse *)self->_userParse hash] ^ v3;
  unint64_t v5 = [(SIRINLUINTERNALLVCOverrideValue *)self->_lvcOverrideValue hash];
  return v4 ^ v5 ^ [(SIRINLUINTERNALPlanOverrideValue *)self->_planOverrideValue hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ccqrOverrideTemplate = self->_ccqrOverrideTemplate, !((unint64_t)ccqrOverrideTemplate | v4[1]))
     || -[SIRINLUINTERNALCCQROverrideTemplate isEqual:](ccqrOverrideTemplate, "isEqual:"))
    && ((userParse = self->_userParse, !((unint64_t)userParse | v4[4]))
     || -[SIRINLUEXTERNALUserParse isEqual:](userParse, "isEqual:"))
    && ((lvcOverrideValue = self->_lvcOverrideValue, !((unint64_t)lvcOverrideValue | v4[2]))
     || -[SIRINLUINTERNALLVCOverrideValue isEqual:](lvcOverrideValue, "isEqual:")))
  {
    planOverrideValue = self->_planOverrideValue;
    if ((unint64_t)planOverrideValue | v4[3]) {
      char v9 = -[SIRINLUINTERNALPlanOverrideValue isEqual:](planOverrideValue, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUINTERNALCCQROverrideTemplate *)self->_ccqrOverrideTemplate copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SIRINLUEXTERNALUserParse *)self->_userParse copyWithZone:a3];
  char v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(SIRINLUINTERNALLVCOverrideValue *)self->_lvcOverrideValue copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(SIRINLUINTERNALPlanOverrideValue *)self->_planOverrideValue copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ccqrOverrideTemplate)
  {
    objc_msgSend(v4, "setCcqrOverrideTemplate:");
    id v4 = v5;
  }
  if (self->_userParse)
  {
    objc_msgSend(v5, "setUserParse:");
    id v4 = v5;
  }
  if (self->_lvcOverrideValue)
  {
    objc_msgSend(v5, "setLvcOverrideValue:");
    id v4 = v5;
  }
  if (self->_planOverrideValue)
  {
    objc_msgSend(v5, "setPlanOverrideValue:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ccqrOverrideTemplate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userParse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_lvcOverrideValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_planOverrideValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOverrideValueReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  ccqrOverrideTemplate = self->_ccqrOverrideTemplate;
  if (ccqrOverrideTemplate)
  {
    id v5 = [(SIRINLUINTERNALCCQROverrideTemplate *)ccqrOverrideTemplate dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"ccqr_override_template"];
  }
  userParse = self->_userParse;
  if (userParse)
  {
    v7 = [(SIRINLUEXTERNALUserParse *)userParse dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"user_parse"];
  }
  lvcOverrideValue = self->_lvcOverrideValue;
  if (lvcOverrideValue)
  {
    char v9 = [(SIRINLUINTERNALLVCOverrideValue *)lvcOverrideValue dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"lvc_override_value"];
  }
  planOverrideValue = self->_planOverrideValue;
  if (planOverrideValue)
  {
    v11 = [(SIRINLUINTERNALPlanOverrideValue *)planOverrideValue dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"plan_override_value"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALOverrideValue;
  id v4 = [(SIRINLUINTERNALOverrideValue *)&v8 description];
  id v5 = [(SIRINLUINTERNALOverrideValue *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPlanOverrideValue
{
  return self->_planOverrideValue != 0;
}

- (BOOL)hasLvcOverrideValue
{
  return self->_lvcOverrideValue != 0;
}

- (BOOL)hasUserParse
{
  return self->_userParse != 0;
}

- (BOOL)hasCcqrOverrideTemplate
{
  return self->_ccqrOverrideTemplate != 0;
}

@end