@interface SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent
- (BOOL)hasEventDescription;
- (BOOL)hasProtoEncoding;
- (BOOL)hasRuntimeEncoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)protoEncoding;
- (NSData)runtimeEncoding;
- (NSString)eventDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventDescription:(id)a3;
- (void)setProtoEncoding:(id)a3;
- (void)setRuntimeEncoding:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimeEncoding, 0);
  objc_storeStrong((id *)&self->_protoEncoding, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
}

- (void)setEventDescription:(id)a3
{
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void)setRuntimeEncoding:(id)a3
{
}

- (NSData)runtimeEncoding
{
  return self->_runtimeEncoding;
}

- (void)setProtoEncoding:(id)a3
{
}

- (NSData)protoEncoding
{
  return self->_protoEncoding;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent setProtoEncoding:](self, "setProtoEncoding:");
  }
  if (v4[3]) {
    -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent setRuntimeEncoding:](self, "setRuntimeEncoding:");
  }
  if (v4[1]) {
    -[SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent setEventDescription:](self, "setEventDescription:");
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_protoEncoding hash];
  uint64_t v4 = [(NSData *)self->_runtimeEncoding hash] ^ v3;
  return v4 ^ [(NSString *)self->_eventDescription hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((protoEncoding = self->_protoEncoding, !((unint64_t)protoEncoding | v4[2]))
     || -[NSData isEqual:](protoEncoding, "isEqual:"))
    && ((runtimeEncoding = self->_runtimeEncoding, !((unint64_t)runtimeEncoding | v4[3]))
     || -[NSData isEqual:](runtimeEncoding, "isEqual:")))
  {
    eventDescription = self->_eventDescription;
    if ((unint64_t)eventDescription | v4[1]) {
      char v8 = -[NSString isEqual:](eventDescription, "isEqual:");
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
  uint64_t v6 = [(NSData *)self->_protoEncoding copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_runtimeEncoding copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_eventDescription copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_protoEncoding)
  {
    objc_msgSend(v4, "setProtoEncoding:");
    id v4 = v5;
  }
  if (self->_runtimeEncoding)
  {
    objc_msgSend(v5, "setRuntimeEncoding:");
    id v4 = v5;
  }
  if (self->_eventDescription)
  {
    objc_msgSend(v5, "setEventDescription:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_protoEncoding)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_runtimeEncoding)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_eventDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  protoEncoding = self->_protoEncoding;
  if (protoEncoding) {
    [v3 setObject:protoEncoding forKey:@"proto_encoding"];
  }
  runtimeEncoding = self->_runtimeEncoding;
  if (runtimeEncoding) {
    [v4 setObject:runtimeEncoding forKey:@"runtime_encoding"];
  }
  eventDescription = self->_eventDescription;
  if (eventDescription) {
    [v4 setObject:eventDescription forKey:@"event_description"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent;
  id v4 = [(SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent *)&v8 description];
  id v5 = [(SIRINLUEXTERNALCDM_PLANNERCDMTranscriptEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEventDescription
{
  return self->_eventDescription != 0;
}

- (BOOL)hasRuntimeEncoding
{
  return self->_runtimeEncoding != 0;
}

- (BOOL)hasProtoEncoding
{
  return self->_protoEncoding != 0;
}

@end