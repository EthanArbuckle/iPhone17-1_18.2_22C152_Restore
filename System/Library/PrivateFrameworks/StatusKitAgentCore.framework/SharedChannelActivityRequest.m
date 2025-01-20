@interface SharedChannelActivityRequest
- (BOOL)hasActivationRequest;
- (BOOL)hasDeactivationRequest;
- (BOOL)hasPollingRequest;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ChannelActivityActivationRequest)activationRequest;
- (ChannelActivityDeactivationRequest)deactivationRequest;
- (ChannelActivityPollingRequest)pollingRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestAsString:(int)a3;
- (int)StringAsRequest:(id)a3;
- (int)request;
- (unint64_t)hash;
- (void)clearOneofValuesForRequest;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationRequest:(id)a3;
- (void)setDeactivationRequest:(id)a3;
- (void)setHasRequest:(BOOL)a3;
- (void)setPollingRequest:(id)a3;
- (void)setRequest:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelActivityRequest

- (BOOL)hasActivationRequest
{
  return self->_activationRequest != 0;
}

- (void)setActivationRequest:(id)a3
{
  v4 = (ChannelActivityActivationRequest *)a3;
  [(SharedChannelActivityRequest *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_request = 1;
  activationRequest = self->_activationRequest;
  self->_activationRequest = v4;
}

- (BOOL)hasDeactivationRequest
{
  return self->_deactivationRequest != 0;
}

- (void)setDeactivationRequest:(id)a3
{
  v4 = (ChannelActivityDeactivationRequest *)a3;
  [(SharedChannelActivityRequest *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_request = 2;
  deactivationRequest = self->_deactivationRequest;
  self->_deactivationRequest = v4;
}

- (BOOL)hasPollingRequest
{
  return self->_pollingRequest != 0;
}

- (void)setPollingRequest:(id)a3
{
  v4 = (ChannelActivityPollingRequest *)a3;
  [(SharedChannelActivityRequest *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_request = 3;
  pollingRequest = self->_pollingRequest;
  self->_pollingRequest = v4;
}

- (int)request
{
  if (*(unsigned char *)&self->_has) {
    return self->_request;
  }
  else {
    return 0;
  }
}

- (void)setRequest:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_request = a3;
}

- (void)setHasRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)requestAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2646E24F0[a3];
  }
  return v3;
}

- (int)StringAsRequest:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"activation_request"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"deactivation_request"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"polling_request"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForRequest
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_request = 0;
  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  deactivationRequest = self->_deactivationRequest;
  self->_deactivationRequest = 0;

  pollingRequest = self->_pollingRequest;
  self->_pollingRequest = 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelActivityRequest;
  int v4 = [(SharedChannelActivityRequest *)&v8 description];
  v5 = [(SharedChannelActivityRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  activationRequest = self->_activationRequest;
  if (activationRequest)
  {
    v5 = [(ChannelActivityActivationRequest *)activationRequest dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"activation_request"];
  }
  deactivationRequest = self->_deactivationRequest;
  if (deactivationRequest)
  {
    v7 = [(ChannelActivityDeactivationRequest *)deactivationRequest dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"deactivation_request"];
  }
  pollingRequest = self->_pollingRequest;
  if (pollingRequest)
  {
    v9 = [(ChannelActivityPollingRequest *)pollingRequest dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"polling_request"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t request = self->_request;
    if (request >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_request);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_2646E24F0[request];
    }
    [v3 setObject:v11 forKey:@"request"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelActivityRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activationRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deactivationRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pollingRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_request;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v5 = v4;
  if (self->_activationRequest)
  {
    objc_msgSend(v4, "setActivationRequest:");
    id v4 = v5;
  }
  if (self->_deactivationRequest)
  {
    objc_msgSend(v5, "setDeactivationRequest:");
    id v4 = v5;
  }
  if (self->_pollingRequest)
  {
    objc_msgSend(v5, "setPollingRequest:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_request;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v7 = [(ChannelActivityActivationRequest *)self->_activationRequest copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(ChannelActivityDeactivationRequest *)self->_deactivationRequest copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(ChannelActivityPollingRequest *)self->_pollingRequest copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_request != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  activationRequest = self->_activationRequest;
  if ((unint64_t)activationRequest | *((void *)v4 + 1)
    && !-[ChannelActivityActivationRequest isEqual:](activationRequest, "isEqual:"))
  {
    goto LABEL_13;
  }
  deactivationRequest = self->_deactivationRequest;
  if ((unint64_t)deactivationRequest | *((void *)v4 + 2))
  {
    if (!-[ChannelActivityDeactivationRequest isEqual:](deactivationRequest, "isEqual:")) {
      goto LABEL_13;
    }
  }
  pollingRequest = self->_pollingRequest;
  if ((unint64_t)pollingRequest | *((void *)v4 + 3)) {
    char v8 = -[ChannelActivityPollingRequest isEqual:](pollingRequest, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_request;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ChannelActivityActivationRequest *)self->_activationRequest hash] ^ v3;
  unint64_t v5 = [(ChannelActivityDeactivationRequest *)self->_deactivationRequest hash];
  return v4 ^ v5 ^ [(ChannelActivityPollingRequest *)self->_pollingRequest hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 36))
  {
    self->_uint64_t request = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  activationRequest = self->_activationRequest;
  uint64_t v7 = v5[1];
  v12 = v5;
  if (activationRequest)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ChannelActivityActivationRequest mergeFrom:](activationRequest, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SharedChannelActivityRequest setActivationRequest:](self, "setActivationRequest:");
  }
  unint64_t v5 = v12;
LABEL_9:
  deactivationRequest = self->_deactivationRequest;
  uint64_t v9 = v5[2];
  if (deactivationRequest)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[ChannelActivityDeactivationRequest mergeFrom:](deactivationRequest, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SharedChannelActivityRequest setDeactivationRequest:](self, "setDeactivationRequest:");
  }
  unint64_t v5 = v12;
LABEL_15:
  pollingRequest = self->_pollingRequest;
  uint64_t v11 = v5[3];
  if (pollingRequest)
  {
    if (v11) {
      -[ChannelActivityPollingRequest mergeFrom:](pollingRequest, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SharedChannelActivityRequest setPollingRequest:](self, "setPollingRequest:");
  }
  MEMORY[0x270F9A758]();
}

- (ChannelActivityActivationRequest)activationRequest
{
  return self->_activationRequest;
}

- (ChannelActivityDeactivationRequest)deactivationRequest
{
  return self->_deactivationRequest;
}

- (ChannelActivityPollingRequest)pollingRequest
{
  return self->_pollingRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollingRequest, 0);
  objc_storeStrong((id *)&self->_deactivationRequest, 0);
  objc_storeStrong((id *)&self->_activationRequest, 0);
}

@end