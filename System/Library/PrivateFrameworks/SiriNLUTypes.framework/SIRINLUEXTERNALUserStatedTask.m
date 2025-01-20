@interface SIRINLUEXTERNALUserStatedTask
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALUsoGraph)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUserStatedTask

- (void).cxx_destruct
{
}

- (void)setTask:(id)a3
{
}

- (SIRINLUEXTERNALUsoGraph)task
{
  return self->_task;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  task = self->_task;
  uint64_t v6 = v4[1];
  if (task)
  {
    if (v6) {
      -[SIRINLUEXTERNALUsoGraph mergeFrom:](task, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUserStatedTask setTask:](self, "setTask:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUEXTERNALUsoGraph *)self->_task hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    task = self->_task;
    if ((unint64_t)task | v4[1]) {
      char v6 = -[SIRINLUEXTERNALUsoGraph isEqual:](task, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALUsoGraph *)self->_task copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  task = self->_task;
  if (task) {
    [a3 setTask:task];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_task) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUserStatedTaskReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  task = self->_task;
  if (task)
  {
    v5 = [(SIRINLUEXTERNALUsoGraph *)task dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"task"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUserStatedTask;
  v4 = [(SIRINLUEXTERNALUserStatedTask *)&v8 description];
  v5 = [(SIRINLUEXTERNALUserStatedTask *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end