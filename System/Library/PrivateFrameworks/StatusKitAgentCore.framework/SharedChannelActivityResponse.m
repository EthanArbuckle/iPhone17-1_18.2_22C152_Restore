@interface SharedChannelActivityResponse
- (BOOL)hasActivationResponse;
- (BOOL)hasDeactivationResponse;
- (BOOL)hasPollingResponse;
- (BOOL)hasResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ChannelActivityActivationResponse)activationResponse;
- (ChannelActivityDeactivationResponse)deactivationResponse;
- (ChannelActivityPollingResponse)pollingResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)responseAsString:(int)a3;
- (int)StringAsResponse:(id)a3;
- (int)response;
- (unint64_t)hash;
- (void)clearOneofValuesForResponse;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationResponse:(id)a3;
- (void)setDeactivationResponse:(id)a3;
- (void)setHasResponse:(BOOL)a3;
- (void)setPollingResponse:(id)a3;
- (void)setResponse:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelActivityResponse

- (BOOL)hasActivationResponse
{
  return self->_activationResponse != 0;
}

- (void)setActivationResponse:(id)a3
{
  v4 = (ChannelActivityActivationResponse *)a3;
  [(SharedChannelActivityResponse *)self clearOneofValuesForResponse];
  *(unsigned char *)&self->_has |= 1u;
  self->_response = 1;
  activationResponse = self->_activationResponse;
  self->_activationResponse = v4;
}

- (BOOL)hasDeactivationResponse
{
  return self->_deactivationResponse != 0;
}

- (void)setDeactivationResponse:(id)a3
{
  v4 = (ChannelActivityDeactivationResponse *)a3;
  [(SharedChannelActivityResponse *)self clearOneofValuesForResponse];
  *(unsigned char *)&self->_has |= 1u;
  self->_response = 2;
  deactivationResponse = self->_deactivationResponse;
  self->_deactivationResponse = v4;
}

- (BOOL)hasPollingResponse
{
  return self->_pollingResponse != 0;
}

- (void)setPollingResponse:(id)a3
{
  v4 = (ChannelActivityPollingResponse *)a3;
  [(SharedChannelActivityResponse *)self clearOneofValuesForResponse];
  *(unsigned char *)&self->_has |= 1u;
  self->_response = 3;
  pollingResponse = self->_pollingResponse;
  self->_pollingResponse = v4;
}

- (int)response
{
  if (*(unsigned char *)&self->_has) {
    return self->_response;
  }
  else {
    return 0;
  }
}

- (void)setResponse:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_response = a3;
}

- (void)setHasResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponse
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)responseAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2646E2468[a3];
  }
  return v3;
}

- (int)StringAsResponse:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"activation_response"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"deactivation_response"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"polling_response"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForResponse
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_response = 0;
  activationResponse = self->_activationResponse;
  self->_activationResponse = 0;

  deactivationResponse = self->_deactivationResponse;
  self->_deactivationResponse = 0;

  pollingResponse = self->_pollingResponse;
  self->_pollingResponse = 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelActivityResponse;
  int v4 = [(SharedChannelActivityResponse *)&v8 description];
  v5 = [(SharedChannelActivityResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  activationResponse = self->_activationResponse;
  if (activationResponse)
  {
    v5 = [(ChannelActivityActivationResponse *)activationResponse dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"activation_response"];
  }
  deactivationResponse = self->_deactivationResponse;
  if (deactivationResponse)
  {
    v7 = [(ChannelActivityDeactivationResponse *)deactivationResponse dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"deactivation_response"];
  }
  pollingResponse = self->_pollingResponse;
  if (pollingResponse)
  {
    v9 = [(ChannelActivityPollingResponse *)pollingResponse dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"polling_response"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t response = self->_response;
    if (response >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_response);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_2646E2468[response];
    }
    [v3 setObject:v11 forKey:@"response"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelActivityResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deactivationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pollingResponse)
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
    v4[8] = self->_response;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v5 = v4;
  if (self->_activationResponse)
  {
    objc_msgSend(v4, "setActivationResponse:");
    id v4 = v5;
  }
  if (self->_deactivationResponse)
  {
    objc_msgSend(v5, "setDeactivationResponse:");
    id v4 = v5;
  }
  if (self->_pollingResponse)
  {
    objc_msgSend(v5, "setPollingResponse:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_response;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v7 = [(ChannelActivityActivationResponse *)self->_activationResponse copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(ChannelActivityDeactivationResponse *)self->_deactivationResponse copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(ChannelActivityPollingResponse *)self->_pollingResponse copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_response != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  activationResponse = self->_activationResponse;
  if ((unint64_t)activationResponse | *((void *)v4 + 1)
    && !-[ChannelActivityActivationResponse isEqual:](activationResponse, "isEqual:"))
  {
    goto LABEL_13;
  }
  deactivationResponse = self->_deactivationResponse;
  if ((unint64_t)deactivationResponse | *((void *)v4 + 2))
  {
    if (!-[ChannelActivityDeactivationResponse isEqual:](deactivationResponse, "isEqual:")) {
      goto LABEL_13;
    }
  }
  pollingResponse = self->_pollingResponse;
  if ((unint64_t)pollingResponse | *((void *)v4 + 3)) {
    char v8 = -[ChannelActivityPollingResponse isEqual:](pollingResponse, "isEqual:");
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
    uint64_t v3 = 2654435761 * self->_response;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ChannelActivityActivationResponse *)self->_activationResponse hash] ^ v3;
  unint64_t v5 = [(ChannelActivityDeactivationResponse *)self->_deactivationResponse hash];
  return v4 ^ v5 ^ [(ChannelActivityPollingResponse *)self->_pollingResponse hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 36))
  {
    self->_uint64_t response = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  activationResponse = self->_activationResponse;
  uint64_t v7 = v5[1];
  v12 = v5;
  if (activationResponse)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ChannelActivityActivationResponse mergeFrom:](activationResponse, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[SharedChannelActivityResponse setActivationResponse:](self, "setActivationResponse:");
  }
  unint64_t v5 = v12;
LABEL_9:
  deactivationResponse = self->_deactivationResponse;
  uint64_t v9 = v5[2];
  if (deactivationResponse)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[ChannelActivityDeactivationResponse mergeFrom:](deactivationResponse, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[SharedChannelActivityResponse setDeactivationResponse:](self, "setDeactivationResponse:");
  }
  unint64_t v5 = v12;
LABEL_15:
  pollingResponse = self->_pollingResponse;
  uint64_t v11 = v5[3];
  if (pollingResponse)
  {
    if (v11) {
      -[ChannelActivityPollingResponse mergeFrom:](pollingResponse, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SharedChannelActivityResponse setPollingResponse:](self, "setPollingResponse:");
  }
  MEMORY[0x270F9A758]();
}

- (ChannelActivityActivationResponse)activationResponse
{
  return self->_activationResponse;
}

- (ChannelActivityDeactivationResponse)deactivationResponse
{
  return self->_deactivationResponse;
}

- (ChannelActivityPollingResponse)pollingResponse
{
  return self->_pollingResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollingResponse, 0);
  objc_storeStrong((id *)&self->_deactivationResponse, 0);
  objc_storeStrong((id *)&self->_activationResponse, 0);
}

@end