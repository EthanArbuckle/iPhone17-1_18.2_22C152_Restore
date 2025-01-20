@interface SIRINLUEXTERNALTask
- (BOOL)hasScore;
- (BOOL)hasTask;
- (BOOL)hasTaskId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRICOMMONDoubleValue)score;
- (SIRINLUEXTERNALUUID)taskId;
- (SIRINLUEXTERNALUsoGraph)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setScore:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

- (void)setScore:(id)a3
{
}

- (SIRICOMMONDoubleValue)score
{
  return self->_score;
}

- (void)setTask:(id)a3
{
}

- (SIRINLUEXTERNALUsoGraph)task
{
  return self->_task;
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
  uint64_t v6 = v4[3];
  v11 = v4;
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
    -[SIRINLUEXTERNALTask setTaskId:](self, "setTaskId:");
  }
  v4 = v11;
LABEL_7:
  task = self->_task;
  uint64_t v8 = v4[2];
  if (task)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUEXTERNALUsoGraph mergeFrom:](task, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[SIRINLUEXTERNALTask setTask:](self, "setTask:");
  }
  v4 = v11;
LABEL_13:
  score = self->_score;
  uint64_t v10 = v4[1];
  if (score)
  {
    if (v10) {
      -[SIRICOMMONDoubleValue mergeFrom:](score, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALTask setScore:](self, "setScore:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_taskId hash];
  unint64_t v4 = [(SIRINLUEXTERNALUsoGraph *)self->_task hash] ^ v3;
  return v4 ^ [(SIRICOMMONDoubleValue *)self->_score hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((taskId = self->_taskId, !((unint64_t)taskId | v4[3]))
     || -[SIRINLUEXTERNALUUID isEqual:](taskId, "isEqual:"))
    && ((task = self->_task, !((unint64_t)task | v4[2])) || -[SIRINLUEXTERNALUsoGraph isEqual:](task, "isEqual:")))
  {
    score = self->_score;
    if ((unint64_t)score | v4[1]) {
      char v8 = -[SIRICOMMONDoubleValue isEqual:](score, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_taskId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(SIRINLUEXTERNALUsoGraph *)self->_task copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(SIRICOMMONDoubleValue *)self->_score copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

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
  if (self->_task)
  {
    objc_msgSend(v5, "setTask:");
    id v4 = v5;
  }
  if (self->_score)
  {
    objc_msgSend(v5, "setScore:");
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
  if (self->_task)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_score)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALTaskReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  task = self->_task;
  if (task)
  {
    v7 = [(SIRINLUEXTERNALUsoGraph *)task dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"task"];
  }
  score = self->_score;
  if (score)
  {
    v9 = [(SIRICOMMONDoubleValue *)score dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"score"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALTask;
  id v4 = [(SIRINLUEXTERNALTask *)&v8 description];
  id v5 = [(SIRINLUEXTERNALTask *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasScore
{
  return self->_score != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

@end