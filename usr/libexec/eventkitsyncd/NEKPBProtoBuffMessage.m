@interface NEKPBProtoBuffMessage
- (BOOL)hasCalendarWrapper;
- (BOOL)hasDeleteEvent;
- (BOOL)hasDeletionWrapper;
- (BOOL)hasICSWrapper;
- (BOOL)hasPacketNumber;
- (BOOL)hasSetAlarmSnooze;
- (BOOL)hasSetParticipantStatus;
- (BOOL)hasSetReminderComplete;
- (BOOL)hasStoreWrapper;
- (BOOL)hasValidationWrapper;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NEKPBCalendarWrapper)calendarWrapper;
- (NEKPBDeleteEvent)deleteEvent;
- (NEKPBDeletionWrapper)deletionWrapper;
- (NEKPBICSWrapper)iCSWrapper;
- (NEKPBSetAlarmSnooze)setAlarmSnooze;
- (NEKPBSetParticipantStatus)setParticipantStatus;
- (NEKPBSetReminderComplete)setReminderComplete;
- (NEKPBSourceWrapper)storeWrapper;
- (NEKPBValidationWrapper)validationWrapper;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)packetNumber;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendarWrapper:(id)a3;
- (void)setDeleteEvent:(id)a3;
- (void)setDeletionWrapper:(id)a3;
- (void)setHasPacketNumber:(BOOL)a3;
- (void)setICSWrapper:(id)a3;
- (void)setPacketNumber:(unsigned int)a3;
- (void)setSetAlarmSnooze:(id)a3;
- (void)setSetParticipantStatus:(id)a3;
- (void)setSetReminderComplete:(id)a3;
- (void)setStoreWrapper:(id)a3;
- (void)setValidationWrapper:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBProtoBuffMessage

- (void)setPacketNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_packetNumber = a3;
}

- (void)setHasPacketNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPacketNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStoreWrapper
{
  return self->_storeWrapper != 0;
}

- (BOOL)hasCalendarWrapper
{
  return self->_calendarWrapper != 0;
}

- (BOOL)hasICSWrapper
{
  return self->_iCSWrapper != 0;
}

- (BOOL)hasDeletionWrapper
{
  return self->_deletionWrapper != 0;
}

- (BOOL)hasValidationWrapper
{
  return self->_validationWrapper != 0;
}

- (BOOL)hasSetReminderComplete
{
  return self->_setReminderComplete != 0;
}

- (BOOL)hasSetParticipantStatus
{
  return self->_setParticipantStatus != 0;
}

- (BOOL)hasSetAlarmSnooze
{
  return self->_setAlarmSnooze != 0;
}

- (BOOL)hasDeleteEvent
{
  return self->_deleteEvent != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBProtoBuffMessage;
  v3 = [(NEKPBProtoBuffMessage *)&v7 description];
  v4 = [(NEKPBProtoBuffMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_packetNumber];
    [v3 setObject:v4 forKey:@"packetNumber"];
  }
  storeWrapper = self->_storeWrapper;
  if (storeWrapper)
  {
    v6 = [(NEKPBSourceWrapper *)storeWrapper dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"storeWrapper"];
  }
  calendarWrapper = self->_calendarWrapper;
  if (calendarWrapper)
  {
    v8 = [(NEKPBCalendarWrapper *)calendarWrapper dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"calendarWrapper"];
  }
  iCSWrapper = self->_iCSWrapper;
  if (iCSWrapper)
  {
    v10 = [(NEKPBICSWrapper *)iCSWrapper dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"ICSWrapper"];
  }
  deletionWrapper = self->_deletionWrapper;
  if (deletionWrapper)
  {
    v12 = [(NEKPBDeletionWrapper *)deletionWrapper dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"deletionWrapper"];
  }
  validationWrapper = self->_validationWrapper;
  if (validationWrapper)
  {
    v14 = [(NEKPBValidationWrapper *)validationWrapper dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"validationWrapper"];
  }
  setReminderComplete = self->_setReminderComplete;
  if (setReminderComplete)
  {
    v16 = [(NEKPBSetReminderComplete *)setReminderComplete dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"setReminderComplete"];
  }
  setParticipantStatus = self->_setParticipantStatus;
  if (setParticipantStatus)
  {
    v18 = [(NEKPBSetParticipantStatus *)setParticipantStatus dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"setParticipantStatus"];
  }
  setAlarmSnooze = self->_setAlarmSnooze;
  if (setAlarmSnooze)
  {
    v20 = [(NEKPBSetAlarmSnooze *)setAlarmSnooze dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"setAlarmSnooze"];
  }
  deleteEvent = self->_deleteEvent;
  if (deleteEvent)
  {
    v22 = [(NEKPBDeleteEvent *)deleteEvent dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"deleteEvent"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100043664((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_storeWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_calendarWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_iCSWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deletionWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_validationWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setReminderComplete)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setParticipantStatus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setAlarmSnooze)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deleteEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFixed32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_storeWrapper)
  {
    [v4 setStoreWrapper:];
    id v4 = v5;
  }
  if (self->_calendarWrapper)
  {
    [v5 setCalendarWrapper:];
    id v4 = v5;
  }
  if (self->_iCSWrapper)
  {
    [v5 setICSWrapper:];
    id v4 = v5;
  }
  if (self->_deletionWrapper)
  {
    [v5 setDeletionWrapper:];
    id v4 = v5;
  }
  if (self->_validationWrapper)
  {
    [v5 setValidationWrapper:];
    id v4 = v5;
  }
  if (self->_setReminderComplete)
  {
    [v5 setSetReminderComplete:];
    id v4 = v5;
  }
  if (self->_setParticipantStatus)
  {
    [v5 setSetParticipantStatus:];
    id v4 = v5;
  }
  if (self->_setAlarmSnooze)
  {
    [v5 setSetAlarmSnooze:];
    id v4 = v5;
  }
  if (self->_deleteEvent)
  {
    [v5 setDeleteEvent:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_packetNumber;
    *((unsigned char *)v4 + 88) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NEKPBSourceWrapper *)self->_storeWrapper copyWithZone:a3];
  objc_super v7 = (void *)v5[9];
  v5[9] = v6;

  id v8 = [(NEKPBCalendarWrapper *)self->_calendarWrapper copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NEKPBICSWrapper *)self->_iCSWrapper copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(NEKPBDeletionWrapper *)self->_deletionWrapper copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(NEKPBValidationWrapper *)self->_validationWrapper copyWithZone:a3];
  v15 = (void *)v5[10];
  v5[10] = v14;

  id v16 = [(NEKPBSetReminderComplete *)self->_setReminderComplete copyWithZone:a3];
  v17 = (void *)v5[8];
  v5[8] = v16;

  id v18 = [(NEKPBSetParticipantStatus *)self->_setParticipantStatus copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  id v20 = [(NEKPBSetAlarmSnooze *)self->_setAlarmSnooze copyWithZone:a3];
  v21 = (void *)v5[6];
  v5[6] = v20;

  id v22 = [(NEKPBDeleteEvent *)self->_deleteEvent copyWithZone:a3];
  v23 = (void *)v5[2];
  v5[2] = v22;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 10) = self->_packetNumber;
    *((unsigned char *)v5 + 88) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  storeWrapper = self->_storeWrapper;
  if ((unint64_t)storeWrapper | *((void *)v4 + 9))
  {
    if (!-[NEKPBSourceWrapper isEqual:](storeWrapper, "isEqual:")) {
      goto LABEL_24;
    }
  }
  calendarWrapper = self->_calendarWrapper;
  if ((unint64_t)calendarWrapper | *((void *)v4 + 1))
  {
    if (!-[NEKPBCalendarWrapper isEqual:](calendarWrapper, "isEqual:")) {
      goto LABEL_24;
    }
  }
  iCSWrapper = self->_iCSWrapper;
  if ((unint64_t)iCSWrapper | *((void *)v4 + 4))
  {
    if (!-[NEKPBICSWrapper isEqual:](iCSWrapper, "isEqual:")) {
      goto LABEL_24;
    }
  }
  deletionWrapper = self->_deletionWrapper;
  if ((unint64_t)deletionWrapper | *((void *)v4 + 3))
  {
    if (!-[NEKPBDeletionWrapper isEqual:](deletionWrapper, "isEqual:")) {
      goto LABEL_24;
    }
  }
  validationWrapper = self->_validationWrapper;
  if ((unint64_t)validationWrapper | *((void *)v4 + 10))
  {
    if (!-[NEKPBValidationWrapper isEqual:](validationWrapper, "isEqual:")) {
      goto LABEL_24;
    }
  }
  setReminderComplete = self->_setReminderComplete;
  if ((unint64_t)setReminderComplete | *((void *)v4 + 8))
  {
    if (!-[NEKPBSetReminderComplete isEqual:](setReminderComplete, "isEqual:")) {
      goto LABEL_24;
    }
  }
  setParticipantStatus = self->_setParticipantStatus;
  if ((unint64_t)setParticipantStatus | *((void *)v4 + 7))
  {
    if (!-[NEKPBSetParticipantStatus isEqual:](setParticipantStatus, "isEqual:")) {
      goto LABEL_24;
    }
  }
  setAlarmSnooze = self->_setAlarmSnooze;
  if ((unint64_t)setAlarmSnooze | *((void *)v4 + 6))
  {
    if (!-[NEKPBSetAlarmSnooze isEqual:](setAlarmSnooze, "isEqual:")) {
      goto LABEL_24;
    }
  }
  deleteEvent = self->_deleteEvent;
  if ((unint64_t)deleteEvent | *((void *)v4 + 2))
  {
    if (!-[NEKPBDeleteEvent isEqual:](deleteEvent, "isEqual:")) {
      goto LABEL_24;
    }
  }
  BOOL v14 = (*((unsigned char *)v4 + 88) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) != 0 && self->_packetNumber == *((_DWORD *)v4 + 10))
    {
      BOOL v14 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v14 = 0;
  }
LABEL_25:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NEKPBSourceWrapper *)self->_storeWrapper hash];
  unint64_t v4 = [(NEKPBCalendarWrapper *)self->_calendarWrapper hash];
  unint64_t v5 = [(NEKPBICSWrapper *)self->_iCSWrapper hash];
  unint64_t v6 = [(NEKPBDeletionWrapper *)self->_deletionWrapper hash];
  unint64_t v7 = [(NEKPBValidationWrapper *)self->_validationWrapper hash];
  unint64_t v8 = [(NEKPBSetReminderComplete *)self->_setReminderComplete hash];
  unint64_t v9 = [(NEKPBSetParticipantStatus *)self->_setParticipantStatus hash];
  unint64_t v10 = [(NEKPBSetAlarmSnooze *)self->_setAlarmSnooze hash];
  unint64_t v11 = [(NEKPBDeleteEvent *)self->_deleteEvent hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v12 = 2654435761 * self->_packetNumber;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  storeWrapper = self->_storeWrapper;
  uint64_t v6 = *((void *)v4 + 9);
  id v23 = v4;
  if (storeWrapper)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NEKPBSourceWrapper mergeFrom:](storeWrapper, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NEKPBProtoBuffMessage setStoreWrapper:](self, "setStoreWrapper:");
  }
  id v4 = v23;
LABEL_7:
  calendarWrapper = self->_calendarWrapper;
  uint64_t v8 = *((void *)v4 + 1);
  if (calendarWrapper)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NEKPBCalendarWrapper mergeFrom:](calendarWrapper, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NEKPBProtoBuffMessage setCalendarWrapper:](self, "setCalendarWrapper:");
  }
  id v4 = v23;
LABEL_13:
  iCSWrapper = self->_iCSWrapper;
  uint64_t v10 = *((void *)v4 + 4);
  if (iCSWrapper)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[NEKPBICSWrapper mergeFrom:](iCSWrapper, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[NEKPBProtoBuffMessage setICSWrapper:](self, "setICSWrapper:");
  }
  id v4 = v23;
LABEL_19:
  deletionWrapper = self->_deletionWrapper;
  uint64_t v12 = *((void *)v4 + 3);
  if (deletionWrapper)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[NEKPBDeletionWrapper mergeFrom:](deletionWrapper, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[NEKPBProtoBuffMessage setDeletionWrapper:](self, "setDeletionWrapper:");
  }
  id v4 = v23;
LABEL_25:
  validationWrapper = self->_validationWrapper;
  uint64_t v14 = *((void *)v4 + 10);
  if (validationWrapper)
  {
    if (!v14) {
      goto LABEL_31;
    }
    -[NEKPBValidationWrapper mergeFrom:](validationWrapper, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_31;
    }
    -[NEKPBProtoBuffMessage setValidationWrapper:](self, "setValidationWrapper:");
  }
  id v4 = v23;
LABEL_31:
  setReminderComplete = self->_setReminderComplete;
  uint64_t v16 = *((void *)v4 + 8);
  if (setReminderComplete)
  {
    if (!v16) {
      goto LABEL_37;
    }
    -[NEKPBSetReminderComplete mergeFrom:](setReminderComplete, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_37;
    }
    -[NEKPBProtoBuffMessage setSetReminderComplete:](self, "setSetReminderComplete:");
  }
  id v4 = v23;
LABEL_37:
  setParticipantStatus = self->_setParticipantStatus;
  uint64_t v18 = *((void *)v4 + 7);
  if (setParticipantStatus)
  {
    if (!v18) {
      goto LABEL_43;
    }
    -[NEKPBSetParticipantStatus mergeFrom:](setParticipantStatus, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_43;
    }
    -[NEKPBProtoBuffMessage setSetParticipantStatus:](self, "setSetParticipantStatus:");
  }
  id v4 = v23;
LABEL_43:
  setAlarmSnooze = self->_setAlarmSnooze;
  uint64_t v20 = *((void *)v4 + 6);
  if (setAlarmSnooze)
  {
    if (!v20) {
      goto LABEL_49;
    }
    -[NEKPBSetAlarmSnooze mergeFrom:](setAlarmSnooze, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_49;
    }
    -[NEKPBProtoBuffMessage setSetAlarmSnooze:](self, "setSetAlarmSnooze:");
  }
  id v4 = v23;
LABEL_49:
  deleteEvent = self->_deleteEvent;
  uint64_t v22 = *((void *)v4 + 2);
  if (deleteEvent)
  {
    if (!v22) {
      goto LABEL_55;
    }
    -[NEKPBDeleteEvent mergeFrom:](deleteEvent, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_55;
    }
    -[NEKPBProtoBuffMessage setDeleteEvent:](self, "setDeleteEvent:");
  }
  id v4 = v23;
LABEL_55:
  if (*((unsigned char *)v4 + 88))
  {
    self->_packetNumber = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }

  _objc_release_x1();
}

- (unsigned)packetNumber
{
  return self->_packetNumber;
}

- (NEKPBSourceWrapper)storeWrapper
{
  return self->_storeWrapper;
}

- (void)setStoreWrapper:(id)a3
{
}

- (NEKPBCalendarWrapper)calendarWrapper
{
  return self->_calendarWrapper;
}

- (void)setCalendarWrapper:(id)a3
{
}

- (NEKPBICSWrapper)iCSWrapper
{
  return self->_iCSWrapper;
}

- (void)setICSWrapper:(id)a3
{
}

- (NEKPBDeletionWrapper)deletionWrapper
{
  return self->_deletionWrapper;
}

- (void)setDeletionWrapper:(id)a3
{
}

- (NEKPBValidationWrapper)validationWrapper
{
  return self->_validationWrapper;
}

- (void)setValidationWrapper:(id)a3
{
}

- (NEKPBSetReminderComplete)setReminderComplete
{
  return self->_setReminderComplete;
}

- (void)setSetReminderComplete:(id)a3
{
}

- (NEKPBSetParticipantStatus)setParticipantStatus
{
  return self->_setParticipantStatus;
}

- (void)setSetParticipantStatus:(id)a3
{
}

- (NEKPBSetAlarmSnooze)setAlarmSnooze
{
  return self->_setAlarmSnooze;
}

- (void)setSetAlarmSnooze:(id)a3
{
}

- (NEKPBDeleteEvent)deleteEvent
{
  return self->_deleteEvent;
}

- (void)setDeleteEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationWrapper, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_setReminderComplete, 0);
  objc_storeStrong((id *)&self->_setParticipantStatus, 0);
  objc_storeStrong((id *)&self->_setAlarmSnooze, 0);
  objc_storeStrong((id *)&self->_iCSWrapper, 0);
  objc_storeStrong((id *)&self->_deletionWrapper, 0);
  objc_storeStrong((id *)&self->_deleteEvent, 0);

  objc_storeStrong((id *)&self->_calendarWrapper, 0);
}

@end