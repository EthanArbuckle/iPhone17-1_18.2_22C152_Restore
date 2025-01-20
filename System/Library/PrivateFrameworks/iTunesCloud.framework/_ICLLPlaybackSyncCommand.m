@interface _ICLLPlaybackSyncCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)clearOneofValuesForPayload;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLPlaybackSyncCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportControlState, 0);

  objc_storeStrong((id *)&self->_participantState, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_payload;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_participantState hash] ^ v3;
  return v4 ^ [(NSString *)self->_transportControlState hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_payload != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  participantState = self->_participantState;
  if ((unint64_t)participantState | *((void *)v4 + 1)
    && !-[NSString isEqual:](participantState, "isEqual:"))
  {
    goto LABEL_11;
  }
  transportControlState = self->_transportControlState;
  if ((unint64_t)transportControlState | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](transportControlState, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_payload;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_participantState copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_transportControlState copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_participantState)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_transportControlState)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackSyncCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)clearOneofValuesForPayload
{
  if (a1)
  {
    *(unsigned char *)(a1 + 32) &= ~1u;
    *(_DWORD *)(a1 + 16) = 0;
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    uint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  participantState = self->_participantState;
  if (participantState) {
    [v3 setObject:participantState forKey:@"participantState"];
  }
  transportControlState = self->_transportControlState;
  if (transportControlState) {
    [v4 setObject:transportControlState forKey:@"transportControlState"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = [NSNumber numberWithInt:self->_payload];
    [v4 setObject:v7 forKey:@"payload"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackSyncCommand;
  id v4 = [(_ICLLPlaybackSyncCommand *)&v8 description];
  id v5 = [(_ICLLPlaybackSyncCommand *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end