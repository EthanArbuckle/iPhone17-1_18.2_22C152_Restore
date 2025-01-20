@interface ICPBDGSResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICPBDGSResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDelegationResponse, 0);

  objc_storeStrong((id *)&self->_finishDelegationResponse, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_requestUniqueID;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ICPBDGSStartDelegationResponse *)self->_startDelegationResponse hash] ^ v3;
  return v4 ^ [(ICPBDGSFinishDelegationResponse *)self->_finishDelegationResponse hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_requestUniqueID != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  startDelegationResponse = self->_startDelegationResponse;
  if ((unint64_t)startDelegationResponse | *((void *)v4 + 3)
    && !-[ICPBDGSStartDelegationResponse isEqual:](startDelegationResponse, "isEqual:"))
  {
    goto LABEL_11;
  }
  finishDelegationResponse = self->_finishDelegationResponse;
  if ((unint64_t)finishDelegationResponse | *((void *)v4 + 1)) {
    char v7 = -[ICPBDGSFinishDelegationResponse isEqual:](finishDelegationResponse, "isEqual:");
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
    *(_DWORD *)(v5 + 16) = self->_requestUniqueID;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(ICPBDGSStartDelegationResponse *)self->_startDelegationResponse copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(ICPBDGSFinishDelegationResponse *)self->_finishDelegationResponse copyWithZone:a3];
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
  if (self->_startDelegationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_finishDelegationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICPBDGSResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_requestUniqueID];
    [v3 setObject:v4 forKey:@"requestUniqueID"];
  }
  startDelegationResponse = self->_startDelegationResponse;
  if (startDelegationResponse)
  {
    v6 = [(ICPBDGSStartDelegationResponse *)startDelegationResponse dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"startDelegationResponse"];
  }
  finishDelegationResponse = self->_finishDelegationResponse;
  if (finishDelegationResponse)
  {
    v8 = [(ICPBDGSFinishDelegationResponse *)finishDelegationResponse dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"finishDelegationResponse"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICPBDGSResponse;
  id v4 = [(ICPBDGSResponse *)&v8 description];
  id v5 = [(ICPBDGSResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end