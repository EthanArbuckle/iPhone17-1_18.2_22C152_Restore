@interface TPPBDisposition
- (BOOL)hasAncientEpoch;
- (BOOL)hasDisallowedMachineID;
- (BOOL)hasDuplicateMachineID;
- (BOOL)hasEvictedMachineID;
- (BOOL)hasGhostedMachineID;
- (BOOL)hasPolicyProhibits;
- (BOOL)hasUnknownMachineID;
- (BOOL)hasUnknownReasonRemovalMachineID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TPPBAncientEpoch)ancientEpoch;
- (TPPBDispositionDisallowedMachineID)disallowedMachineID;
- (TPPBDispositionDuplicateMachineID)duplicateMachineID;
- (TPPBDispositionEvictedMachineID)evictedMachineID;
- (TPPBDispositionGhostedMachineID)ghostedMachineID;
- (TPPBDispositionUnknownReasonRemovalMachineID)unknownReasonRemovalMachineID;
- (TPPBPolicyProhibits)policyProhibits;
- (TPPBUnknownMachineID)unknownMachineID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAncientEpoch:(id)a3;
- (void)setDisallowedMachineID:(id)a3;
- (void)setDuplicateMachineID:(id)a3;
- (void)setEvictedMachineID:(id)a3;
- (void)setGhostedMachineID:(id)a3;
- (void)setPolicyProhibits:(id)a3;
- (void)setUnknownMachineID:(id)a3;
- (void)setUnknownReasonRemovalMachineID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBDisposition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownReasonRemovalMachineID, 0);
  objc_storeStrong((id *)&self->_unknownMachineID, 0);
  objc_storeStrong((id *)&self->_policyProhibits, 0);
  objc_storeStrong((id *)&self->_ghostedMachineID, 0);
  objc_storeStrong((id *)&self->_evictedMachineID, 0);
  objc_storeStrong((id *)&self->_duplicateMachineID, 0);
  objc_storeStrong((id *)&self->_disallowedMachineID, 0);
  objc_storeStrong((id *)&self->_ancientEpoch, 0);
}

- (void)setGhostedMachineID:(id)a3
{
}

- (TPPBDispositionGhostedMachineID)ghostedMachineID
{
  return self->_ghostedMachineID;
}

- (void)setUnknownReasonRemovalMachineID:(id)a3
{
}

- (TPPBDispositionUnknownReasonRemovalMachineID)unknownReasonRemovalMachineID
{
  return self->_unknownReasonRemovalMachineID;
}

- (void)setEvictedMachineID:(id)a3
{
}

- (TPPBDispositionEvictedMachineID)evictedMachineID
{
  return self->_evictedMachineID;
}

- (void)setDisallowedMachineID:(id)a3
{
}

- (TPPBDispositionDisallowedMachineID)disallowedMachineID
{
  return self->_disallowedMachineID;
}

- (void)setDuplicateMachineID:(id)a3
{
}

- (TPPBDispositionDuplicateMachineID)duplicateMachineID
{
  return self->_duplicateMachineID;
}

- (void)setUnknownMachineID:(id)a3
{
}

- (TPPBUnknownMachineID)unknownMachineID
{
  return self->_unknownMachineID;
}

- (void)setPolicyProhibits:(id)a3
{
}

- (TPPBPolicyProhibits)policyProhibits
{
  return self->_policyProhibits;
}

- (void)setAncientEpoch:(id)a3
{
}

- (TPPBAncientEpoch)ancientEpoch
{
  return self->_ancientEpoch;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  ancientEpoch = self->_ancientEpoch;
  v21 = v4;
  uint64_t v6 = v4[1];
  if (ancientEpoch)
  {
    if (v6) {
      -[TPPBAncientEpoch mergeFrom:](ancientEpoch, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[TPPBDisposition setAncientEpoch:](self, "setAncientEpoch:");
  }
  policyProhibits = self->_policyProhibits;
  uint64_t v8 = v21[6];
  if (policyProhibits)
  {
    if (v8) {
      -[TPPBPolicyProhibits mergeFrom:](policyProhibits, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[TPPBDisposition setPolicyProhibits:](self, "setPolicyProhibits:");
  }
  unknownMachineID = self->_unknownMachineID;
  uint64_t v10 = v21[7];
  if (unknownMachineID)
  {
    if (v10) {
      -[TPPBUnknownMachineID mergeFrom:](unknownMachineID, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[TPPBDisposition setUnknownMachineID:](self, "setUnknownMachineID:");
  }
  duplicateMachineID = self->_duplicateMachineID;
  uint64_t v12 = v21[3];
  if (duplicateMachineID)
  {
    if (v12) {
      -[TPPBDispositionDuplicateMachineID mergeFrom:](duplicateMachineID, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[TPPBDisposition setDuplicateMachineID:](self, "setDuplicateMachineID:");
  }
  disallowedMachineID = self->_disallowedMachineID;
  uint64_t v14 = v21[2];
  if (disallowedMachineID)
  {
    if (v14) {
      -[TPPBDispositionDisallowedMachineID mergeFrom:](disallowedMachineID, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[TPPBDisposition setDisallowedMachineID:](self, "setDisallowedMachineID:");
  }
  evictedMachineID = self->_evictedMachineID;
  uint64_t v16 = v21[4];
  if (evictedMachineID)
  {
    if (v16) {
      -[TPPBDispositionEvictedMachineID mergeFrom:](evictedMachineID, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[TPPBDisposition setEvictedMachineID:](self, "setEvictedMachineID:");
  }
  unknownReasonRemovalMachineID = self->_unknownReasonRemovalMachineID;
  uint64_t v18 = v21[8];
  if (unknownReasonRemovalMachineID)
  {
    if (v18) {
      -[TPPBDispositionUnknownReasonRemovalMachineID mergeFrom:](unknownReasonRemovalMachineID, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[TPPBDisposition setUnknownReasonRemovalMachineID:](self, "setUnknownReasonRemovalMachineID:");
  }
  ghostedMachineID = self->_ghostedMachineID;
  uint64_t v20 = v21[5];
  if (ghostedMachineID)
  {
    if (v20) {
      -[TPPBDispositionGhostedMachineID mergeFrom:](ghostedMachineID, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[TPPBDisposition setGhostedMachineID:](self, "setGhostedMachineID:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(TPPBAncientEpoch *)self->_ancientEpoch hash];
  unint64_t v4 = [(TPPBPolicyProhibits *)self->_policyProhibits hash] ^ v3;
  unint64_t v5 = [(TPPBUnknownMachineID *)self->_unknownMachineID hash];
  unint64_t v6 = v4 ^ v5 ^ [(TPPBDispositionDuplicateMachineID *)self->_duplicateMachineID hash];
  unint64_t v7 = [(TPPBDispositionDisallowedMachineID *)self->_disallowedMachineID hash];
  unint64_t v8 = v7 ^ [(TPPBDispositionEvictedMachineID *)self->_evictedMachineID hash];
  unint64_t v9 = v6 ^ v8 ^ [(TPPBDispositionUnknownReasonRemovalMachineID *)self->_unknownReasonRemovalMachineID hash];
  return v9 ^ [(TPPBDispositionGhostedMachineID *)self->_ghostedMachineID hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ancientEpoch = self->_ancientEpoch, !((unint64_t)ancientEpoch | v4[1]))
     || -[TPPBAncientEpoch isEqual:](ancientEpoch, "isEqual:"))
    && ((policyProhibits = self->_policyProhibits, !((unint64_t)policyProhibits | v4[6]))
     || -[TPPBPolicyProhibits isEqual:](policyProhibits, "isEqual:"))
    && ((unknownMachineID = self->_unknownMachineID, !((unint64_t)unknownMachineID | v4[7]))
     || -[TPPBUnknownMachineID isEqual:](unknownMachineID, "isEqual:"))
    && ((duplicateMachineID = self->_duplicateMachineID, !((unint64_t)duplicateMachineID | v4[3]))
     || -[TPPBDispositionDuplicateMachineID isEqual:](duplicateMachineID, "isEqual:"))
    && ((disallowedMachineID = self->_disallowedMachineID, !((unint64_t)disallowedMachineID | v4[2]))
     || -[TPPBDispositionDisallowedMachineID isEqual:](disallowedMachineID, "isEqual:"))
    && ((evictedMachineID = self->_evictedMachineID, !((unint64_t)evictedMachineID | v4[4]))
     || -[TPPBDispositionEvictedMachineID isEqual:](evictedMachineID, "isEqual:"))
    && ((unknownReasonRemovalMachineID = self->_unknownReasonRemovalMachineID,
         !((unint64_t)unknownReasonRemovalMachineID | v4[8]))
     || -[TPPBDispositionUnknownReasonRemovalMachineID isEqual:](unknownReasonRemovalMachineID, "isEqual:")))
  {
    ghostedMachineID = self->_ghostedMachineID;
    if ((unint64_t)ghostedMachineID | v4[5]) {
      char v13 = -[TPPBDispositionGhostedMachineID isEqual:](ghostedMachineID, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TPPBAncientEpoch *)self->_ancientEpoch copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(TPPBPolicyProhibits *)self->_policyProhibits copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(TPPBUnknownMachineID *)self->_unknownMachineID copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(TPPBDispositionDuplicateMachineID *)self->_duplicateMachineID copyWithZone:a3];
  char v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(TPPBDispositionDisallowedMachineID *)self->_disallowedMachineID copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(TPPBDispositionEvictedMachineID *)self->_evictedMachineID copyWithZone:a3];
  v17 = (void *)v5[4];
  v5[4] = v16;

  id v18 = [(TPPBDispositionUnknownReasonRemovalMachineID *)self->_unknownReasonRemovalMachineID copyWithZone:a3];
  v19 = (void *)v5[8];
  v5[8] = v18;

  id v20 = [(TPPBDispositionGhostedMachineID *)self->_ghostedMachineID copyWithZone:a3];
  v21 = (void *)v5[5];
  v5[5] = v20;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ancientEpoch)
  {
    objc_msgSend(v4, "setAncientEpoch:");
    id v4 = v5;
  }
  if (self->_policyProhibits)
  {
    objc_msgSend(v5, "setPolicyProhibits:");
    id v4 = v5;
  }
  if (self->_unknownMachineID)
  {
    objc_msgSend(v5, "setUnknownMachineID:");
    id v4 = v5;
  }
  if (self->_duplicateMachineID)
  {
    objc_msgSend(v5, "setDuplicateMachineID:");
    id v4 = v5;
  }
  if (self->_disallowedMachineID)
  {
    objc_msgSend(v5, "setDisallowedMachineID:");
    id v4 = v5;
  }
  if (self->_evictedMachineID)
  {
    objc_msgSend(v5, "setEvictedMachineID:");
    id v4 = v5;
  }
  if (self->_unknownReasonRemovalMachineID)
  {
    objc_msgSend(v5, "setUnknownReasonRemovalMachineID:");
    id v4 = v5;
  }
  if (self->_ghostedMachineID)
  {
    objc_msgSend(v5, "setGhostedMachineID:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ancientEpoch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_policyProhibits)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_unknownMachineID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_duplicateMachineID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_disallowedMachineID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_evictedMachineID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_unknownReasonRemovalMachineID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_ghostedMachineID)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDispositionReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  ancientEpoch = self->_ancientEpoch;
  if (ancientEpoch)
  {
    id v5 = [(TPPBAncientEpoch *)ancientEpoch dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"ancientEpoch"];
  }
  policyProhibits = self->_policyProhibits;
  if (policyProhibits)
  {
    unint64_t v7 = [(TPPBPolicyProhibits *)policyProhibits dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"policyProhibits"];
  }
  unknownMachineID = self->_unknownMachineID;
  if (unknownMachineID)
  {
    unint64_t v9 = [(TPPBUnknownMachineID *)unknownMachineID dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"unknownMachineID"];
  }
  duplicateMachineID = self->_duplicateMachineID;
  if (duplicateMachineID)
  {
    v11 = [(TPPBDispositionDuplicateMachineID *)duplicateMachineID dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"duplicateMachineID"];
  }
  disallowedMachineID = self->_disallowedMachineID;
  if (disallowedMachineID)
  {
    char v13 = [(TPPBDispositionDisallowedMachineID *)disallowedMachineID dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"disallowedMachineID"];
  }
  evictedMachineID = self->_evictedMachineID;
  if (evictedMachineID)
  {
    v15 = [(TPPBDispositionEvictedMachineID *)evictedMachineID dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"evictedMachineID"];
  }
  unknownReasonRemovalMachineID = self->_unknownReasonRemovalMachineID;
  if (unknownReasonRemovalMachineID)
  {
    v17 = [(TPPBDispositionUnknownReasonRemovalMachineID *)unknownReasonRemovalMachineID dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"unknownReasonRemovalMachineID"];
  }
  ghostedMachineID = self->_ghostedMachineID;
  if (ghostedMachineID)
  {
    v19 = [(TPPBDispositionGhostedMachineID *)ghostedMachineID dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"ghostedMachineID"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBDisposition;
  id v4 = [(TPPBDisposition *)&v8 description];
  id v5 = [(TPPBDisposition *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGhostedMachineID
{
  return self->_ghostedMachineID != 0;
}

- (BOOL)hasUnknownReasonRemovalMachineID
{
  return self->_unknownReasonRemovalMachineID != 0;
}

- (BOOL)hasEvictedMachineID
{
  return self->_evictedMachineID != 0;
}

- (BOOL)hasDisallowedMachineID
{
  return self->_disallowedMachineID != 0;
}

- (BOOL)hasDuplicateMachineID
{
  return self->_duplicateMachineID != 0;
}

- (BOOL)hasUnknownMachineID
{
  return self->_unknownMachineID != 0;
}

- (BOOL)hasPolicyProhibits
{
  return self->_policyProhibits != 0;
}

- (BOOL)hasAncientEpoch
{
  return self->_ancientEpoch != 0;
}

@end