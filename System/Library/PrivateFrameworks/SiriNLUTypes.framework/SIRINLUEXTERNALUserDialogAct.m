@interface SIRINLUEXTERNALUserDialogAct
- (BOOL)hasAccepted;
- (BOOL)hasAcknowledged;
- (BOOL)hasAlignment;
- (BOOL)hasCancelled;
- (BOOL)hasDelegated;
- (BOOL)hasRejected;
- (BOOL)hasUserStatedTask;
- (BOOL)hasWantedToPause;
- (BOOL)hasWantedToProceed;
- (BOOL)hasWantedToRepeat;
- (BOOL)hasWantedToUndo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALDelegatedUserDialogAct)delegated;
- (SIRINLUEXTERNALUserAccepted)accepted;
- (SIRINLUEXTERNALUserAcknowledged)acknowledged;
- (SIRINLUEXTERNALUserCancelled)cancelled;
- (SIRINLUEXTERNALUserRejected)rejected;
- (SIRINLUEXTERNALUserStatedTask)userStatedTask;
- (SIRINLUEXTERNALUserWantedToPause)wantedToPause;
- (SIRINLUEXTERNALUserWantedToProceed)wantedToProceed;
- (SIRINLUEXTERNALUserWantedToRepeat)wantedToRepeat;
- (SIRINLUEXTERNALUserWantedToUndo)wantedToUndo;
- (SIRINLUEXTERNALUtteranceAlignment)alignment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccepted:(id)a3;
- (void)setAcknowledged:(id)a3;
- (void)setAlignment:(id)a3;
- (void)setCancelled:(id)a3;
- (void)setDelegated:(id)a3;
- (void)setRejected:(id)a3;
- (void)setUserStatedTask:(id)a3;
- (void)setWantedToPause:(id)a3;
- (void)setWantedToProceed:(id)a3;
- (void)setWantedToRepeat:(id)a3;
- (void)setWantedToUndo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUserDialogAct

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wantedToUndo, 0);
  objc_storeStrong((id *)&self->_wantedToRepeat, 0);
  objc_storeStrong((id *)&self->_wantedToProceed, 0);
  objc_storeStrong((id *)&self->_wantedToPause, 0);
  objc_storeStrong((id *)&self->_userStatedTask, 0);
  objc_storeStrong((id *)&self->_rejected, 0);
  objc_storeStrong((id *)&self->_delegated, 0);
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_alignment, 0);
  objc_storeStrong((id *)&self->_acknowledged, 0);
  objc_storeStrong((id *)&self->_accepted, 0);
}

- (void)setAlignment:(id)a3
{
}

- (SIRINLUEXTERNALUtteranceAlignment)alignment
{
  return self->_alignment;
}

- (void)setWantedToUndo:(id)a3
{
}

- (SIRINLUEXTERNALUserWantedToUndo)wantedToUndo
{
  return self->_wantedToUndo;
}

- (void)setUserStatedTask:(id)a3
{
}

- (SIRINLUEXTERNALUserStatedTask)userStatedTask
{
  return self->_userStatedTask;
}

- (void)setDelegated:(id)a3
{
}

- (SIRINLUEXTERNALDelegatedUserDialogAct)delegated
{
  return self->_delegated;
}

- (void)setWantedToPause:(id)a3
{
}

- (SIRINLUEXTERNALUserWantedToPause)wantedToPause
{
  return self->_wantedToPause;
}

- (void)setWantedToProceed:(id)a3
{
}

- (SIRINLUEXTERNALUserWantedToProceed)wantedToProceed
{
  return self->_wantedToProceed;
}

- (void)setAcknowledged:(id)a3
{
}

- (SIRINLUEXTERNALUserAcknowledged)acknowledged
{
  return self->_acknowledged;
}

- (void)setWantedToRepeat:(id)a3
{
}

- (SIRINLUEXTERNALUserWantedToRepeat)wantedToRepeat
{
  return self->_wantedToRepeat;
}

- (void)setCancelled:(id)a3
{
}

- (SIRINLUEXTERNALUserCancelled)cancelled
{
  return self->_cancelled;
}

- (void)setRejected:(id)a3
{
}

- (SIRINLUEXTERNALUserRejected)rejected
{
  return self->_rejected;
}

- (void)setAccepted:(id)a3
{
}

- (SIRINLUEXTERNALUserAccepted)accepted
{
  return self->_accepted;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  accepted = self->_accepted;
  v27 = v4;
  uint64_t v6 = v4[1];
  if (accepted)
  {
    if (v6) {
      -[SIRINLUEXTERNALUserAccepted mergeFrom:](accepted, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUserDialogAct setAccepted:](self, "setAccepted:");
  }
  rejected = self->_rejected;
  uint64_t v8 = v27[6];
  if (rejected)
  {
    if (v8) {
      -[SIRINLUEXTERNALUserRejected mergeFrom:](rejected, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALUserDialogAct setRejected:](self, "setRejected:");
  }
  cancelled = self->_cancelled;
  uint64_t v10 = v27[4];
  if (cancelled)
  {
    if (v10) {
      -[SIRINLUEXTERNALUserCancelled mergeFrom:](cancelled, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALUserDialogAct setCancelled:](self, "setCancelled:");
  }
  wantedToRepeat = self->_wantedToRepeat;
  uint64_t v12 = v27[10];
  if (wantedToRepeat)
  {
    if (v12) {
      -[SIRINLUEXTERNALUserWantedToRepeat mergeFrom:](wantedToRepeat, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToRepeat:](self, "setWantedToRepeat:");
  }
  acknowledged = self->_acknowledged;
  uint64_t v14 = v27[2];
  if (acknowledged)
  {
    if (v14) {
      -[SIRINLUEXTERNALUserAcknowledged mergeFrom:](acknowledged, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALUserDialogAct setAcknowledged:](self, "setAcknowledged:");
  }
  wantedToProceed = self->_wantedToProceed;
  uint64_t v16 = v27[9];
  if (wantedToProceed)
  {
    if (v16) {
      -[SIRINLUEXTERNALUserWantedToProceed mergeFrom:](wantedToProceed, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToProceed:](self, "setWantedToProceed:");
  }
  wantedToPause = self->_wantedToPause;
  uint64_t v18 = v27[8];
  if (wantedToPause)
  {
    if (v18) {
      -[SIRINLUEXTERNALUserWantedToPause mergeFrom:](wantedToPause, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToPause:](self, "setWantedToPause:");
  }
  delegated = self->_delegated;
  uint64_t v20 = v27[5];
  if (delegated)
  {
    if (v20) {
      -[SIRINLUEXTERNALDelegatedUserDialogAct mergeFrom:](delegated, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALUserDialogAct setDelegated:](self, "setDelegated:");
  }
  userStatedTask = self->_userStatedTask;
  uint64_t v22 = v27[7];
  if (userStatedTask)
  {
    if (v22) {
      -[SIRINLUEXTERNALUserStatedTask mergeFrom:](userStatedTask, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[SIRINLUEXTERNALUserDialogAct setUserStatedTask:](self, "setUserStatedTask:");
  }
  wantedToUndo = self->_wantedToUndo;
  uint64_t v24 = v27[11];
  if (wantedToUndo)
  {
    if (v24) {
      -[SIRINLUEXTERNALUserWantedToUndo mergeFrom:](wantedToUndo, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToUndo:](self, "setWantedToUndo:");
  }
  alignment = self->_alignment;
  uint64_t v26 = v27[3];
  if (alignment)
  {
    if (v26) {
      -[SIRINLUEXTERNALUtteranceAlignment mergeFrom:](alignment, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[SIRINLUEXTERNALUserDialogAct setAlignment:](self, "setAlignment:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUserAccepted *)self->_accepted hash];
  unint64_t v4 = [(SIRINLUEXTERNALUserRejected *)self->_rejected hash] ^ v3;
  unint64_t v5 = [(SIRINLUEXTERNALUserCancelled *)self->_cancelled hash];
  unint64_t v6 = v4 ^ v5 ^ [(SIRINLUEXTERNALUserWantedToRepeat *)self->_wantedToRepeat hash];
  unint64_t v7 = [(SIRINLUEXTERNALUserAcknowledged *)self->_acknowledged hash];
  unint64_t v8 = v7 ^ [(SIRINLUEXTERNALUserWantedToProceed *)self->_wantedToProceed hash];
  unint64_t v9 = v6 ^ v8 ^ [(SIRINLUEXTERNALUserWantedToPause *)self->_wantedToPause hash];
  unint64_t v10 = [(SIRINLUEXTERNALDelegatedUserDialogAct *)self->_delegated hash];
  unint64_t v11 = v10 ^ [(SIRINLUEXTERNALUserStatedTask *)self->_userStatedTask hash];
  unint64_t v12 = v11 ^ [(SIRINLUEXTERNALUserWantedToUndo *)self->_wantedToUndo hash];
  return v9 ^ v12 ^ [(SIRINLUEXTERNALUtteranceAlignment *)self->_alignment hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  accepted = self->_accepted;
  if ((unint64_t)accepted | v4[1])
  {
    if (!-[SIRINLUEXTERNALUserAccepted isEqual:](accepted, "isEqual:")) {
      goto LABEL_24;
    }
  }
  rejected = self->_rejected;
  if ((unint64_t)rejected | v4[6] && !-[SIRINLUEXTERNALUserRejected isEqual:](rejected, "isEqual:")) {
    goto LABEL_24;
  }
  cancelled = self->_cancelled;
  if ((unint64_t)cancelled | v4[4] && !-[SIRINLUEXTERNALUserCancelled isEqual:](cancelled, "isEqual:")) {
    goto LABEL_24;
  }
  if (((wantedToRepeat = self->_wantedToRepeat, !((unint64_t)wantedToRepeat | v4[10]))
     || -[SIRINLUEXTERNALUserWantedToRepeat isEqual:](wantedToRepeat, "isEqual:"))
    && ((acknowledged = self->_acknowledged, !((unint64_t)acknowledged | v4[2]))
     || -[SIRINLUEXTERNALUserAcknowledged isEqual:](acknowledged, "isEqual:"))
    && ((wantedToProceed = self->_wantedToProceed, !((unint64_t)wantedToProceed | v4[9]))
     || -[SIRINLUEXTERNALUserWantedToProceed isEqual:](wantedToProceed, "isEqual:"))
    && ((wantedToPause = self->_wantedToPause, !((unint64_t)wantedToPause | v4[8]))
     || -[SIRINLUEXTERNALUserWantedToPause isEqual:](wantedToPause, "isEqual:"))
    && ((delegated = self->_delegated, !((unint64_t)delegated | v4[5]))
     || -[SIRINLUEXTERNALDelegatedUserDialogAct isEqual:](delegated, "isEqual:"))
    && ((userStatedTask = self->_userStatedTask, !((unint64_t)userStatedTask | v4[7]))
     || -[SIRINLUEXTERNALUserStatedTask isEqual:](userStatedTask, "isEqual:"))
    && ((wantedToUndo = self->_wantedToUndo, !((unint64_t)wantedToUndo | v4[11]))
     || -[SIRINLUEXTERNALUserWantedToUndo isEqual:](wantedToUndo, "isEqual:")))
  {
    alignment = self->_alignment;
    if ((unint64_t)alignment | v4[3]) {
      char v16 = -[SIRINLUEXTERNALUtteranceAlignment isEqual:](alignment, "isEqual:");
    }
    else {
      char v16 = 1;
    }
  }
  else
  {
LABEL_24:
    char v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUserAccepted *)self->_accepted copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SIRINLUEXTERNALUserRejected *)self->_rejected copyWithZone:a3];
  unint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(SIRINLUEXTERNALUserCancelled *)self->_cancelled copyWithZone:a3];
  unint64_t v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(SIRINLUEXTERNALUserWantedToRepeat *)self->_wantedToRepeat copyWithZone:a3];
  v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = [(SIRINLUEXTERNALUserAcknowledged *)self->_acknowledged copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(SIRINLUEXTERNALUserWantedToProceed *)self->_wantedToProceed copyWithZone:a3];
  v17 = (void *)v5[9];
  v5[9] = v16;

  id v18 = [(SIRINLUEXTERNALUserWantedToPause *)self->_wantedToPause copyWithZone:a3];
  v19 = (void *)v5[8];
  v5[8] = v18;

  id v20 = [(SIRINLUEXTERNALDelegatedUserDialogAct *)self->_delegated copyWithZone:a3];
  v21 = (void *)v5[5];
  v5[5] = v20;

  id v22 = [(SIRINLUEXTERNALUserStatedTask *)self->_userStatedTask copyWithZone:a3];
  v23 = (void *)v5[7];
  v5[7] = v22;

  id v24 = [(SIRINLUEXTERNALUserWantedToUndo *)self->_wantedToUndo copyWithZone:a3];
  v25 = (void *)v5[11];
  v5[11] = v24;

  id v26 = [(SIRINLUEXTERNALUtteranceAlignment *)self->_alignment copyWithZone:a3];
  v27 = (void *)v5[3];
  v5[3] = v26;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accepted)
  {
    objc_msgSend(v4, "setAccepted:");
    id v4 = v5;
  }
  if (self->_rejected)
  {
    objc_msgSend(v5, "setRejected:");
    id v4 = v5;
  }
  if (self->_cancelled)
  {
    objc_msgSend(v5, "setCancelled:");
    id v4 = v5;
  }
  if (self->_wantedToRepeat)
  {
    objc_msgSend(v5, "setWantedToRepeat:");
    id v4 = v5;
  }
  if (self->_acknowledged)
  {
    objc_msgSend(v5, "setAcknowledged:");
    id v4 = v5;
  }
  if (self->_wantedToProceed)
  {
    objc_msgSend(v5, "setWantedToProceed:");
    id v4 = v5;
  }
  if (self->_wantedToPause)
  {
    objc_msgSend(v5, "setWantedToPause:");
    id v4 = v5;
  }
  if (self->_delegated)
  {
    objc_msgSend(v5, "setDelegated:");
    id v4 = v5;
  }
  if (self->_userStatedTask)
  {
    objc_msgSend(v5, "setUserStatedTask:");
    id v4 = v5;
  }
  if (self->_wantedToUndo)
  {
    objc_msgSend(v5, "setWantedToUndo:");
    id v4 = v5;
  }
  if (self->_alignment)
  {
    objc_msgSend(v5, "setAlignment:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accepted)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rejected)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_cancelled)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_wantedToRepeat)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_acknowledged)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_wantedToProceed)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_wantedToPause)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_delegated)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userStatedTask)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_wantedToUndo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_alignment)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUserDialogActReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  accepted = self->_accepted;
  if (accepted)
  {
    id v5 = [(SIRINLUEXTERNALUserAccepted *)accepted dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"accepted"];
  }
  rejected = self->_rejected;
  if (rejected)
  {
    unint64_t v7 = [(SIRINLUEXTERNALUserRejected *)rejected dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"rejected"];
  }
  cancelled = self->_cancelled;
  if (cancelled)
  {
    unint64_t v9 = [(SIRINLUEXTERNALUserCancelled *)cancelled dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"cancelled"];
  }
  wantedToRepeat = self->_wantedToRepeat;
  if (wantedToRepeat)
  {
    unint64_t v11 = [(SIRINLUEXTERNALUserWantedToRepeat *)wantedToRepeat dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"wanted_to_repeat"];
  }
  acknowledged = self->_acknowledged;
  if (acknowledged)
  {
    v13 = [(SIRINLUEXTERNALUserAcknowledged *)acknowledged dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"acknowledged"];
  }
  wantedToProceed = self->_wantedToProceed;
  if (wantedToProceed)
  {
    v15 = [(SIRINLUEXTERNALUserWantedToProceed *)wantedToProceed dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"wanted_to_proceed"];
  }
  wantedToPause = self->_wantedToPause;
  if (wantedToPause)
  {
    v17 = [(SIRINLUEXTERNALUserWantedToPause *)wantedToPause dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"wanted_to_pause"];
  }
  delegated = self->_delegated;
  if (delegated)
  {
    v19 = [(SIRINLUEXTERNALDelegatedUserDialogAct *)delegated dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"delegated"];
  }
  userStatedTask = self->_userStatedTask;
  if (userStatedTask)
  {
    v21 = [(SIRINLUEXTERNALUserStatedTask *)userStatedTask dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"user_stated_task"];
  }
  wantedToUndo = self->_wantedToUndo;
  if (wantedToUndo)
  {
    v23 = [(SIRINLUEXTERNALUserWantedToUndo *)wantedToUndo dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"wanted_to_undo"];
  }
  alignment = self->_alignment;
  if (alignment)
  {
    v25 = [(SIRINLUEXTERNALUtteranceAlignment *)alignment dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"alignment"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUserDialogAct;
  id v4 = [(SIRINLUEXTERNALUserDialogAct *)&v8 description];
  id v5 = [(SIRINLUEXTERNALUserDialogAct *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAlignment
{
  return self->_alignment != 0;
}

- (BOOL)hasWantedToUndo
{
  return self->_wantedToUndo != 0;
}

- (BOOL)hasUserStatedTask
{
  return self->_userStatedTask != 0;
}

- (BOOL)hasDelegated
{
  return self->_delegated != 0;
}

- (BOOL)hasWantedToPause
{
  return self->_wantedToPause != 0;
}

- (BOOL)hasWantedToProceed
{
  return self->_wantedToProceed != 0;
}

- (BOOL)hasAcknowledged
{
  return self->_acknowledged != 0;
}

- (BOOL)hasWantedToRepeat
{
  return self->_wantedToRepeat != 0;
}

- (BOOL)hasCancelled
{
  return self->_cancelled != 0;
}

- (BOOL)hasRejected
{
  return self->_rejected != 0;
}

- (BOOL)hasAccepted
{
  return self->_accepted != 0;
}

@end