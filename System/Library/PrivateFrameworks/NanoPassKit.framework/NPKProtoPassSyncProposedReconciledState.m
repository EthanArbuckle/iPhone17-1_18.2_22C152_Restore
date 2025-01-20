@interface NPKProtoPassSyncProposedReconciledState
- (BOOL)hasProposedReconciledState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoPassSyncState)proposedReconciledState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProposedReconciledState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSyncProposedReconciledState

- (BOOL)hasProposedReconciledState
{
  return self->_proposedReconciledState != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncProposedReconciledState;
  v4 = [(NPKProtoPassSyncProposedReconciledState *)&v8 description];
  v5 = [(NPKProtoPassSyncProposedReconciledState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  proposedReconciledState = self->_proposedReconciledState;
  if (proposedReconciledState)
  {
    v5 = [(NPKProtoPassSyncState *)proposedReconciledState dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"proposedReconciledState"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncProposedReconciledStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_proposedReconciledState) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  proposedReconciledState = self->_proposedReconciledState;
  if (proposedReconciledState) {
    [a3 setProposedReconciledState:proposedReconciledState];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoPassSyncState *)self->_proposedReconciledState copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    proposedReconciledState = self->_proposedReconciledState;
    if ((unint64_t)proposedReconciledState | v4[1]) {
      char v6 = -[NPKProtoPassSyncState isEqual:](proposedReconciledState, "isEqual:");
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

- (unint64_t)hash
{
  return [(NPKProtoPassSyncState *)self->_proposedReconciledState hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  proposedReconciledState = self->_proposedReconciledState;
  uint64_t v6 = v4[1];
  if (proposedReconciledState)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoPassSyncState mergeFrom:](proposedReconciledState, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoPassSyncProposedReconciledState setProposedReconciledState:](self, "setProposedReconciledState:");
  }
  v4 = v7;
LABEL_7:
}

- (NPKProtoPassSyncState)proposedReconciledState
{
  return self->_proposedReconciledState;
}

- (void)setProposedReconciledState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end