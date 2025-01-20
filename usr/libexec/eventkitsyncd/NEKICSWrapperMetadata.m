@interface NEKICSWrapperMetadata
- (BOOL)attendeeComment;
- (BOOL)attendeeStatusFlag;
- (BOOL)dateChanged;
- (BOOL)hasProperInvitationStatus;
- (BOOL)locationChanged;
- (BOOL)timeChanged;
- (BOOL)titleChanged;
- (NSDate)startDate;
- (NSString)externalID;
- (NSString)identifier;
- (NSString)selfAttendeeEmail;
- (NSString)selfAttendeeUUID;
- (NSString)selfOrganizerEmail;
- (NSString)selfOrganizerUUID;
- (id)description;
- (int64_t)attendeeStatus;
- (int64_t)locationPredictionState;
- (unint64_t)entityType;
- (unint64_t)invitationStatus;
- (unint64_t)properInvitationStatus;
- (void)setAttendeeComment:(BOOL)a3;
- (void)setAttendeeStatus:(int64_t)a3;
- (void)setAttendeeStatusFlag:(BOOL)a3;
- (void)setDateChanged:(BOOL)a3;
- (void)setEntityType:(unint64_t)a3;
- (void)setExternalID:(id)a3;
- (void)setHasProperInvitationStatus:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setLocationChanged:(BOOL)a3;
- (void)setLocationPredictionState:(int64_t)a3;
- (void)setProperInvitationStatus:(unint64_t)a3;
- (void)setSelfAttendeeEmail:(id)a3;
- (void)setSelfAttendeeUUID:(id)a3;
- (void)setSelfOrganizerEmail:(id)a3;
- (void)setSelfOrganizerUUID:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTimeChanged:(BOOL)a3;
- (void)setTitleChanged:(BOOL)a3;
@end

@implementation NEKICSWrapperMetadata

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<NEKICSWrapperMetadata (%p): \n", self];
  [v3 appendFormat:@"  entityType: %d\n", self->_entityType];
  [v3 appendFormat:@"  identifier: %@\n", self->_identifier];
  [v3 appendFormat:@"  externalID: %@\n", self->_externalID];
  [v3 appendFormat:@"  selfAttendeeEmail: %@\n", self->_selfAttendeeEmail];
  [v3 appendFormat:@"  selfAttendeeUUID: %@\n", self->_selfAttendeeUUID];
  [v3 appendFormat:@"  selfOrganizerEmail: %@\n", self->_selfOrganizerEmail];
  [v3 appendFormat:@"  selfOrganizerUUID: %@\n", self->_selfOrganizerUUID];
  [v3 appendFormat:@"  attendeeStatus: %d\n", self->_attendeeStatus];
  [v3 appendFormat:@"  invitationStatus: %d\n", self->_invitationStatus];
  [v3 appendFormat:@"  properInvitationStatus: %d\n", self->_properInvitationStatus];
  [v3 appendFormat:@"  hasProperInvitationStatus: %d\n", self->_hasProperInvitationStatus];
  [v3 appendFormat:@"  locationPredictionState: %d\n", self->_locationPredictionState];
  [v3 appendFormat:@"  dateChanged: %d\n", self->_dateChanged];
  [v3 appendFormat:@"  timeChanged: %d\n", self->_timeChanged];
  [v3 appendFormat:@"  titleChanged: %d\n", self->_titleChanged];
  [v3 appendFormat:@"  locationChanged: %d\n", self->_locationChanged];
  [v3 appendFormat:@"  attendeeComment: %d\n", self->_attendeeComment];
  [v3 appendFormat:@"  attendeeStatusFlag: %d\n", self->_attendeeStatusFlag];
  [v3 appendFormat:@"  startDate: %@\n", self->_startDate];
  [v3 appendString:@">"];
  id v4 = [v3 copy];

  return v4;
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (void)setEntityType:(unint64_t)a3
{
  self->_entityType = a3;
}

- (NSString)selfAttendeeEmail
{
  return self->_selfAttendeeEmail;
}

- (void)setSelfAttendeeEmail:(id)a3
{
}

- (NSString)selfAttendeeUUID
{
  return self->_selfAttendeeUUID;
}

- (void)setSelfAttendeeUUID:(id)a3
{
}

- (NSString)selfOrganizerEmail
{
  return self->_selfOrganizerEmail;
}

- (void)setSelfOrganizerEmail:(id)a3
{
}

- (NSString)selfOrganizerUUID
{
  return self->_selfOrganizerUUID;
}

- (void)setSelfOrganizerUUID:(id)a3
{
}

- (int64_t)attendeeStatus
{
  return self->_attendeeStatus;
}

- (void)setAttendeeStatus:(int64_t)a3
{
  self->_attendeeStatus = a3;
}

- (unint64_t)invitationStatus
{
  return self->_invitationStatus;
}

- (void)setInvitationStatus:(unint64_t)a3
{
  self->_invitationStatus = a3;
}

- (unint64_t)properInvitationStatus
{
  return self->_properInvitationStatus;
}

- (void)setProperInvitationStatus:(unint64_t)a3
{
  self->_properInvitationStatus = a3;
}

- (BOOL)hasProperInvitationStatus
{
  return self->_hasProperInvitationStatus;
}

- (void)setHasProperInvitationStatus:(BOOL)a3
{
  self->_hasProperInvitationStatus = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)dateChanged
{
  return self->_dateChanged;
}

- (void)setDateChanged:(BOOL)a3
{
  self->_dateChanged = a3;
}

- (BOOL)timeChanged
{
  return self->_timeChanged;
}

- (void)setTimeChanged:(BOOL)a3
{
  self->_timeChanged = a3;
}

- (BOOL)titleChanged
{
  return self->_titleChanged;
}

- (void)setTitleChanged:(BOOL)a3
{
  self->_titleChanged = a3;
}

- (BOOL)locationChanged
{
  return self->_locationChanged;
}

- (void)setLocationChanged:(BOOL)a3
{
  self->_locationChanged = a3;
}

- (BOOL)attendeeComment
{
  return self->_attendeeComment;
}

- (void)setAttendeeComment:(BOOL)a3
{
  self->_attendeeComment = a3;
}

- (BOOL)attendeeStatusFlag
{
  return self->_attendeeStatusFlag;
}

- (void)setAttendeeStatusFlag:(BOOL)a3
{
  self->_attendeeStatusFlag = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (int64_t)locationPredictionState
{
  return self->_locationPredictionState;
}

- (void)setLocationPredictionState:(int64_t)a3
{
  self->_locationPredictionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_selfOrganizerUUID, 0);
  objc_storeStrong((id *)&self->_selfOrganizerEmail, 0);
  objc_storeStrong((id *)&self->_selfAttendeeUUID, 0);

  objc_storeStrong((id *)&self->_selfAttendeeEmail, 0);
}

@end