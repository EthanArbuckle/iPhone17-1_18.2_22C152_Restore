@interface TRILogEvent
- (BOOL)hasContext;
- (BOOL)hasDenormalizedEvent;
- (BOOL)hasLogEventId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)logEventId;
- (TRIDenormalizedEvent)denormalizedEvent;
- (TRILogContext)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContext:(id)a3;
- (void)setDenormalizedEvent:(id)a3;
- (void)setLogEventId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRILogEvent

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasLogEventId
{
  return self->_logEventId != 0;
}

- (BOOL)hasDenormalizedEvent
{
  return self->_denormalizedEvent != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRILogEvent;
  v4 = [(TRILogEvent *)&v8 description];
  v5 = [(TRILogEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  context = self->_context;
  if (context)
  {
    v5 = [(TRILogContext *)context dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"context"];
  }
  logEventId = self->_logEventId;
  if (logEventId) {
    [v3 setObject:logEventId forKey:@"log_event_id"];
  }
  denormalizedEvent = self->_denormalizedEvent;
  if (denormalizedEvent)
  {
    objc_super v8 = [(TRIDenormalizedEvent *)denormalizedEvent dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"denormalized_event"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_context)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_logEventId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_denormalizedEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_context)
  {
    objc_msgSend(v4, "setContext:");
    id v4 = v5;
  }
  if (self->_logEventId)
  {
    objc_msgSend(v5, "setLogEventId:");
    id v4 = v5;
  }
  if (self->_denormalizedEvent)
  {
    objc_msgSend(v5, "setDenormalizedEvent:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TRILogContext *)self->_context copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_logEventId copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(TRIDenormalizedEvent *)self->_denormalizedEvent copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((context = self->_context, !((unint64_t)context | v4[1]))
     || -[TRILogContext isEqual:](context, "isEqual:"))
    && ((logEventId = self->_logEventId, !((unint64_t)logEventId | v4[3]))
     || -[NSString isEqual:](logEventId, "isEqual:")))
  {
    denormalizedEvent = self->_denormalizedEvent;
    if ((unint64_t)denormalizedEvent | v4[2]) {
      char v8 = -[TRIDenormalizedEvent isEqual:](denormalizedEvent, "isEqual:");
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

- (unint64_t)hash
{
  unint64_t v3 = [(TRILogContext *)self->_context hash];
  NSUInteger v4 = [(NSString *)self->_logEventId hash] ^ v3;
  return v4 ^ [(TRIDenormalizedEvent *)self->_denormalizedEvent hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  context = self->_context;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (context)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TRILogContext mergeFrom:](context, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[TRILogEvent setContext:](self, "setContext:");
  }
  NSUInteger v4 = v9;
LABEL_7:
  if (v4[3])
  {
    -[TRILogEvent setLogEventId:](self, "setLogEventId:");
    NSUInteger v4 = v9;
  }
  denormalizedEvent = self->_denormalizedEvent;
  uint64_t v8 = v4[2];
  if (denormalizedEvent)
  {
    if (v8) {
      -[TRIDenormalizedEvent mergeFrom:](denormalizedEvent, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[TRILogEvent setDenormalizedEvent:](self, "setDenormalizedEvent:");
  }
  MEMORY[0x1F41817F8]();
}

- (TRILogContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)logEventId
{
  return self->_logEventId;
}

- (void)setLogEventId:(id)a3
{
}

- (TRIDenormalizedEvent)denormalizedEvent
{
  return self->_denormalizedEvent;
}

- (void)setDenormalizedEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventId, 0);
  objc_storeStrong((id *)&self->_denormalizedEvent, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end