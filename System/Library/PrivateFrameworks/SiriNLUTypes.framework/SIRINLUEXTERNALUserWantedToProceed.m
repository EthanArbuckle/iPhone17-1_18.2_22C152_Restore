@interface SIRINLUEXTERNALUserWantedToProceed
- (BOOL)hasReference;
- (BOOL)hasTaskId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALUUID)taskId;
- (SIRINLUEXTERNALUsoGraph)reference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setReference:(id)a3;
- (void)setTaskId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUserWantedToProceed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_reference, 0);
}

- (void)setReference:(id)a3
{
}

- (SIRINLUEXTERNALUsoGraph)reference
{
  return self->_reference;
}

- (void)setTaskId:(id)a3
{
}

- (SIRINLUEXTERNALUUID)taskId
{
  return self->_taskId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  taskId = self->_taskId;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (taskId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALUUID mergeFrom:](taskId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SIRINLUEXTERNALUserWantedToProceed setTaskId:](self, "setTaskId:");
  }
  v4 = v9;
LABEL_7:
  reference = self->_reference;
  uint64_t v8 = v4[1];
  if (reference)
  {
    if (v8) {
      -[SIRINLUEXTERNALUsoGraph mergeFrom:](reference, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALUserWantedToProceed setReference:](self, "setReference:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_taskId hash];
  return [(SIRINLUEXTERNALUsoGraph *)self->_reference hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((taskId = self->_taskId, !((unint64_t)taskId | v4[2]))
     || -[SIRINLUEXTERNALUUID isEqual:](taskId, "isEqual:")))
  {
    reference = self->_reference;
    if ((unint64_t)reference | v4[1]) {
      char v7 = -[SIRINLUEXTERNALUsoGraph isEqual:](reference, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALUUID *)self->_taskId copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(SIRINLUEXTERNALUsoGraph *)self->_reference copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskId)
  {
    objc_msgSend(v4, "setTaskId:");
    id v4 = v5;
  }
  if (self->_reference)
  {
    objc_msgSend(v5, "setReference:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_reference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUserWantedToProceedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  taskId = self->_taskId;
  if (taskId)
  {
    id v5 = [(SIRINLUEXTERNALUUID *)taskId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"task_id"];
  }
  reference = self->_reference;
  if (reference)
  {
    char v7 = [(SIRINLUEXTERNALUsoGraph *)reference dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"reference"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUserWantedToProceed;
  id v4 = [(SIRINLUEXTERNALUserWantedToProceed *)&v8 description];
  id v5 = [(SIRINLUEXTERNALUserWantedToProceed *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasReference
{
  return self->_reference != 0;
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

@end