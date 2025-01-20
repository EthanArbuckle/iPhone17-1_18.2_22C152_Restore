@interface SIRINLUEXTERNALSystemPrompted
- (BOOL)hasTarget;
- (BOOL)hasTaskId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALUUID)taskId;
- (SIRINLUEXTERNALUsoGraph)target;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTaskId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSystemPrompted

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)setTarget:(id)a3
{
}

- (SIRINLUEXTERNALUsoGraph)target
{
  return self->_target;
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
    -[SIRINLUEXTERNALSystemPrompted setTaskId:](self, "setTaskId:");
  }
  v4 = v9;
LABEL_7:
  target = self->_target;
  uint64_t v8 = v4[1];
  if (target)
  {
    if (v8) {
      -[SIRINLUEXTERNALUsoGraph mergeFrom:](target, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALSystemPrompted setTarget:](self, "setTarget:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_taskId hash];
  return [(SIRINLUEXTERNALUsoGraph *)self->_target hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((taskId = self->_taskId, !((unint64_t)taskId | v4[2]))
     || -[SIRINLUEXTERNALUUID isEqual:](taskId, "isEqual:")))
  {
    target = self->_target;
    if ((unint64_t)target | v4[1]) {
      char v7 = -[SIRINLUEXTERNALUsoGraph isEqual:](target, "isEqual:");
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

  id v8 = [(SIRINLUEXTERNALUsoGraph *)self->_target copyWithZone:a3];
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
  if (self->_target)
  {
    objc_msgSend(v5, "setTarget:");
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
  if (self->_target)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemPromptedReadFrom((uint64_t)self, (uint64_t)a3);
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
  target = self->_target;
  if (target)
  {
    char v7 = [(SIRINLUEXTERNALUsoGraph *)target dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"target"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSystemPrompted;
  id v4 = [(SIRINLUEXTERNALSystemPrompted *)&v8 description];
  id v5 = [(SIRINLUEXTERNALSystemPrompted *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

@end