@interface _ICLLQueueQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLQueueQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_controlSettings, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(_ICLLQueue *)self->_queue hash];
  NSUInteger v4 = [(NSString *)self->_queueContext hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_revision;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_ICLLPlaybackControlSettings *)self->_controlSettings hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  queue = self->_queue;
  if ((unint64_t)queue | *((void *)v4 + 2))
  {
    if (!-[_ICLLQueue isEqual:](queue, "isEqual:")) {
      goto LABEL_13;
    }
  }
  queueContext = self->_queueContext;
  if ((unint64_t)queueContext | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](queueContext, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_revision != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  controlSettings = self->_controlSettings;
  if ((unint64_t)controlSettings | *((void *)v4 + 1)) {
    char v8 = -[_ICLLPlaybackControlSettings isEqual:](controlSettings, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_ICLLQueue *)self->_queue copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_queueContext copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_revision;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v10 = [(_ICLLPlaybackControlSettings *)self->_controlSettings copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_queue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_queueContext)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_controlSettings)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLQueueQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  queue = self->_queue;
  if (queue)
  {
    id v5 = [(_ICLLQueue *)queue dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"queue"];
  }
  queueContext = self->_queueContext;
  if (queueContext) {
    [v3 setObject:queueContext forKey:@"queueContext"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithInt:self->_revision];
    [v3 setObject:v7 forKey:@"revision"];
  }
  controlSettings = self->_controlSettings;
  if (controlSettings)
  {
    v9 = [(_ICLLPlaybackControlSettings *)controlSettings dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"controlSettings"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLQueueQuery;
  id v4 = [(_ICLLQueueQuery *)&v8 description];
  id v5 = [(_ICLLQueueQuery *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end