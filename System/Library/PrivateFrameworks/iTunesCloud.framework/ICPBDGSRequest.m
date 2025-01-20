@interface ICPBDGSRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICPBDGSRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDelegationRequest, 0);

  objc_storeStrong((id *)&self->_finishDelegationRequest, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_uniqueID;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ICPBDGSStartDelegationRequest *)self->_startDelegationRequest hash] ^ v3;
  return v4 ^ [(ICPBDGSFinishDelegationRequest *)self->_finishDelegationRequest hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_uniqueID != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  startDelegationRequest = self->_startDelegationRequest;
  if ((unint64_t)startDelegationRequest | *((void *)v4 + 2)
    && !-[ICPBDGSStartDelegationRequest isEqual:](startDelegationRequest, "isEqual:"))
  {
    goto LABEL_11;
  }
  finishDelegationRequest = self->_finishDelegationRequest;
  if ((unint64_t)finishDelegationRequest | *((void *)v4 + 1)) {
    char v7 = -[ICPBDGSFinishDelegationRequest isEqual:](finishDelegationRequest, "isEqual:");
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
    *(_DWORD *)(v5 + 24) = self->_uniqueID;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(ICPBDGSStartDelegationRequest *)self->_startDelegationRequest copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(ICPBDGSFinishDelegationRequest *)self->_finishDelegationRequest copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_startDelegationRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_finishDelegationRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_uniqueID];
    [v3 setObject:v4 forKey:@"uniqueID"];
  }
  startDelegationRequest = self->_startDelegationRequest;
  if (startDelegationRequest)
  {
    v6 = [(ICPBDGSStartDelegationRequest *)startDelegationRequest dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"startDelegationRequest"];
  }
  finishDelegationRequest = self->_finishDelegationRequest;
  if (finishDelegationRequest)
  {
    v8 = [(ICPBDGSFinishDelegationRequest *)finishDelegationRequest dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"finishDelegationRequest"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSRequest;
  id v4 = [(ICPBDGSRequest *)&v8 description];
  id v5 = [(ICPBDGSRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end