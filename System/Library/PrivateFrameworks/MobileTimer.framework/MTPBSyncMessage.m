@interface MTPBSyncMessage
- (BOOL)hasDismissAction;
- (BOOL)hasSnoozeAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTPBDismissAction)dismissAction;
- (MTPBSnoozeAction)snoozeAction;
- (NSString)syncID;
- (double)syncDate;
- (double)syncVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setSnoozeAction:(id)a3;
- (void)setSyncDate:(double)a3;
- (void)setSyncID:(id)a3;
- (void)setSyncVersion:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTPBSyncMessage

- (BOOL)hasSnoozeAction
{
  return self->_snoozeAction != 0;
}

- (BOOL)hasDismissAction
{
  return self->_dismissAction != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTPBSyncMessage;
  v4 = [(MTPBSyncMessage *)&v8 description];
  v5 = [(MTPBSyncMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  snoozeAction = self->_snoozeAction;
  if (snoozeAction)
  {
    v5 = [(MTPBSnoozeAction *)snoozeAction dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"snoozeAction"];
  }
  dismissAction = self->_dismissAction;
  if (dismissAction)
  {
    v7 = [(MTPBDismissAction *)dismissAction dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"dismissAction"];
  }
  objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_syncDate];
  [v3 setObject:v8 forKey:@"syncDate"];

  syncID = self->_syncID;
  if (syncID) {
    [v3 setObject:syncID forKey:@"syncID"];
  }
  v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_syncVersion];
  [v3 setObject:v10 forKey:@"syncVersion"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBSyncMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_snoozeAction) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dismissAction) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  id v4 = (double *)a3;
  v5 = v4;
  if (self->_snoozeAction)
  {
    objc_msgSend(v4, "setSnoozeAction:");
    id v4 = v5;
  }
  if (self->_dismissAction)
  {
    objc_msgSend(v5, "setDismissAction:");
    id v4 = v5;
  }
  v4[1] = self->_syncDate;
  [v4 setSyncID:self->_syncID];
  v5[2] = self->_syncVersion;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTPBSnoozeAction *)self->_snoozeAction copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(MTPBDismissAction *)self->_dismissAction copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(double *)(v5 + 8) = self->_syncDate;
  uint64_t v10 = [(NSString *)self->_syncID copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  *(double *)(v5 + 16) = self->_syncVersion;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v8 = [v4 isMemberOfClass:objc_opt_class()]
    && ((snoozeAction = self->_snoozeAction, !((unint64_t)snoozeAction | *((void *)v4 + 4)))
     || -[MTPBSnoozeAction isEqual:](snoozeAction, "isEqual:"))
    && ((dismissAction = self->_dismissAction, !((unint64_t)dismissAction | *((void *)v4 + 3)))
     || -[MTPBDismissAction isEqual:](dismissAction, "isEqual:"))
    && self->_syncDate == *((double *)v4 + 1)
    && ((syncID = self->_syncID, !((unint64_t)syncID | *((void *)v4 + 5)))
     || -[NSString isEqual:](syncID, "isEqual:"))
    && self->_syncVersion == *((double *)v4 + 2);

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTPBSnoozeAction *)self->_snoozeAction hash];
  unint64_t v4 = [(MTPBDismissAction *)self->_dismissAction hash];
  double syncDate = self->_syncDate;
  double v6 = -syncDate;
  if (syncDate >= 0.0) {
    double v6 = self->_syncDate;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  double v9 = fmod(v7, 1.84467441e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  unint64_t v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0) {
    unint64_t v11 = 2654435761u * (unint64_t)v9;
  }
  unint64_t v12 = v10 - (unint64_t)fabs(v8);
  if (v8 < 0.0) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v11;
  }
  NSUInteger v14 = [(NSString *)self->_syncID hash];
  double syncVersion = self->_syncVersion;
  double v16 = -syncVersion;
  if (syncVersion >= 0.0) {
    double v16 = self->_syncVersion;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  double v19 = fmod(v17, 1.84467441e19);
  unint64_t v20 = 2654435761u * (unint64_t)v19;
  unint64_t v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0) {
    unint64_t v21 = 2654435761u * (unint64_t)v19;
  }
  unint64_t v22 = v20 - (unint64_t)fabs(v18);
  if (v18 >= 0.0) {
    unint64_t v22 = v21;
  }
  return v4 ^ v3 ^ v22 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  snoozeAction = self->_snoozeAction;
  uint64_t v6 = *((void *)v4 + 4);
  id v9 = v4;
  if (snoozeAction)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTPBSnoozeAction mergeFrom:](snoozeAction, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTPBSyncMessage setSnoozeAction:](self, "setSnoozeAction:");
  }
  id v4 = v9;
LABEL_7:
  dismissAction = self->_dismissAction;
  uint64_t v8 = *((void *)v4 + 3);
  if (dismissAction)
  {
    if (!v8) {
      goto LABEL_13;
    }
    dismissAction = (MTPBDismissAction *)-[MTPBDismissAction mergeFrom:](dismissAction, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    dismissAction = (MTPBDismissAction *)-[MTPBSyncMessage setDismissAction:](self, "setDismissAction:");
  }
  id v4 = v9;
LABEL_13:
  self->_double syncDate = *((double *)v4 + 1);
  if (*((void *)v4 + 5))
  {
    dismissAction = (MTPBDismissAction *)-[MTPBSyncMessage setSyncID:](self, "setSyncID:");
    id v4 = v9;
  }
  self->_double syncVersion = *((double *)v4 + 2);
  MEMORY[0x1F41817F8](dismissAction, v4);
}

- (MTPBSnoozeAction)snoozeAction
{
  return self->_snoozeAction;
}

- (void)setSnoozeAction:(id)a3
{
}

- (MTPBDismissAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (double)syncDate
{
  return self->_syncDate;
}

- (void)setSyncDate:(double)a3
{
  self->_double syncDate = a3;
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
}

- (double)syncVersion
{
  return self->_syncVersion;
}

- (void)setSyncVersion:(double)a3
{
  self->_double syncVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_snoozeAction, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
}

@end