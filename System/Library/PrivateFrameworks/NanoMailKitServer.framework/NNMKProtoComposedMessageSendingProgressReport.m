@interface NNMKProtoComposedMessageSendingProgressReport
- (BOOL)hasComposedMessageId;
- (BOOL)hasProgress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)composedMessageId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)progress;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setComposedMessageId:(id)a3;
- (void)setHasProgress:(BOOL)a3;
- (void)setProgress:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoComposedMessageSendingProgressReport

- (BOOL)hasComposedMessageId
{
  return self->_composedMessageId != 0;
}

- (void)setProgress:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_progress = a3;
}

- (void)setHasProgress:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProgress
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoComposedMessageSendingProgressReport;
  v4 = [(NNMKProtoComposedMessageSendingProgressReport *)&v8 description];
  v5 = [(NNMKProtoComposedMessageSendingProgressReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  composedMessageId = self->_composedMessageId;
  if (composedMessageId) {
    [v3 setObject:composedMessageId forKey:@"composedMessageId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_progress];
    [v4 setObject:v6 forKey:@"progress"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoComposedMessageSendingProgressReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_composedMessageId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_composedMessageId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setComposedMessageId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_progress;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_composedMessageId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_progress;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  composedMessageId = self->_composedMessageId;
  if ((unint64_t)composedMessageId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](composedMessageId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_progress == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_composedMessageId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_progress;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NNMKProtoComposedMessageSendingProgressReport setComposedMessageId:](self, "setComposedMessageId:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_progress = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)composedMessageId
{
  return self->_composedMessageId;
}

- (void)setComposedMessageId:(id)a3
{
}

- (int)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end