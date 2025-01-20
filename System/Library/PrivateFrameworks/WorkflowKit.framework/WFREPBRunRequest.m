@interface WFREPBRunRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)payloadTypeAsString:(int)a3;
- (int)StringAsPayloadType:(id)a3;
- (int)payloadType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBRunRequest

- (void).cxx_destruct
{
}

- (void)setPayload:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayloadType:(int)a3
{
  self->_payloadType = a3;
}

- (int)payloadType
{
  return self->_payloadType;
}

- (void)mergeFrom:(id)a3
{
  self->_payloadType = *((_DWORD *)a3 + 4);
  if (*((void *)a3 + 1)) {
    -[WFREPBRunRequest setPayload:](self, "setPayload:");
  }
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_payloadType;
  return [(NSData *)self->_payload hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_payloadType == *((_DWORD *)v4 + 4))
  {
    payload = self->_payload;
    if ((unint64_t)payload | v4[1]) {
      char v6 = -[NSData isEqual:](payload, "isEqual:");
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
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_payloadType;
  uint64_t v6 = [(NSData *)self->_payload copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_payloadType;
  [a3 setPayload:self->_payload];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_payload) {
    __assert_rtn("-[WFREPBRunRequest writeTo:]", "WFREPBRunRequest.m", 91, "nil != self->_payload");
  }
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRunRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int payloadType = self->_payloadType;
  if (payloadType == 1)
  {
    uint64_t v5 = @"SingleActionExecution";
  }
  else if (payloadType == 2)
  {
    uint64_t v5 = @"WorkflowExecution";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_payloadType);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v3 setObject:v5 forKey:@"payloadType"];

  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRunRequest;
  id v4 = [(WFREPBRunRequest *)&v8 description];
  uint64_t v5 = [(WFREPBRunRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsPayloadType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"SingleActionExecution"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"WorkflowExecution"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)payloadTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"SingleActionExecution";
  }
  else if (a3 == 2)
  {
    int v4 = @"WorkflowExecution";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end