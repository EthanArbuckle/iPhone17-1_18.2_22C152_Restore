@interface NEKPBCalendarAttributes
- (BOOL)canBePublished;
- (BOOL)canBeShared;
- (BOOL)hasBeenAlerted;
- (BOOL)hasCanBePublished;
- (BOOL)hasCanBeShared;
- (BOOL)hasColorString;
- (BOOL)hasDigest;
- (BOOL)hasDisplayOrder;
- (BOOL)hasExternalID;
- (BOOL)hasExternalIdentificationTag;
- (BOOL)hasExternalModificationTag;
- (BOOL)hasExternalRepresentation;
- (BOOL)hasHasBeenAlerted;
- (BOOL)hasInvitationStatus;
- (BOOL)hasIsDefaultCalendarForStore;
- (BOOL)hasIsFamilyCalendar;
- (BOOL)hasIsHidden;
- (BOOL)hasIsHolidayCalendar;
- (BOOL)hasIsIgnoringEventAlerts;
- (BOOL)hasIsIgnoringSharedCalendarNotifications;
- (BOOL)hasIsImmutable;
- (BOOL)hasIsInbox;
- (BOOL)hasIsNotificationsCollection;
- (BOOL)hasIsPublished;
- (BOOL)hasIsReadonly;
- (BOOL)hasIsSchedulingProhibited;
- (BOOL)hasIsSharingInvitation;
- (BOOL)hasIsSubscribed;
- (BOOL)hasNotes;
- (BOOL)hasOwnerIdentityAddressString;
- (BOOL)hasOwnerIdentityDisplayName;
- (BOOL)hasOwnerIdentityEmail;
- (BOOL)hasOwnerIdentityFirstName;
- (BOOL)hasOwnerIdentityLastName;
- (BOOL)hasPublishedURLString;
- (BOOL)hasPushKey;
- (BOOL)hasSelfIdentityAddressString;
- (BOOL)hasSelfIdentityDisplayName;
- (BOOL)hasSelfIdentityEmail;
- (BOOL)hasSelfIdentityFirstName;
- (BOOL)hasSelfIdentityLastName;
- (BOOL)hasSharedOwnerAddress;
- (BOOL)hasSharedOwnerName;
- (BOOL)hasSharingInvitationResponse;
- (BOOL)hasSharingStatus;
- (BOOL)hasSubCalAccountID;
- (BOOL)hasSupportedEntityTypes;
- (BOOL)hasSymbolicColorName;
- (BOOL)hasSyncToken;
- (BOOL)hasTitle;
- (BOOL)hasType;
- (BOOL)hasUUID;
- (BOOL)isDefaultCalendarForStore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilyCalendar;
- (BOOL)isHidden;
- (BOOL)isHolidayCalendar;
- (BOOL)isIgnoringEventAlerts;
- (BOOL)isIgnoringSharedCalendarNotifications;
- (BOOL)isImmutable;
- (BOOL)isInbox;
- (BOOL)isNotificationsCollection;
- (BOOL)isPublished;
- (BOOL)isReadonly;
- (BOOL)isSchedulingProhibited;
- (BOOL)isSharingInvitation;
- (BOOL)isSubscribed;
- (BOOL)readFrom:(id)a3;
- (NSData)digest;
- (NSData)externalRepresentation;
- (NSString)colorString;
- (NSString)externalID;
- (NSString)externalIdentificationTag;
- (NSString)externalModificationTag;
- (NSString)notes;
- (NSString)ownerIdentityAddressString;
- (NSString)ownerIdentityDisplayName;
- (NSString)ownerIdentityEmail;
- (NSString)ownerIdentityFirstName;
- (NSString)ownerIdentityLastName;
- (NSString)publishedURLString;
- (NSString)pushKey;
- (NSString)selfIdentityAddressString;
- (NSString)selfIdentityDisplayName;
- (NSString)selfIdentityEmail;
- (NSString)selfIdentityFirstName;
- (NSString)selfIdentityLastName;
- (NSString)sharedOwnerAddress;
- (NSString)sharedOwnerName;
- (NSString)subCalAccountID;
- (NSString)symbolicColorName;
- (NSString)syncToken;
- (NSString)title;
- (NSString)type;
- (NSString)uUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)displayOrder;
- (unint64_t)hash;
- (unint64_t)invitationStatus;
- (unint64_t)sharingInvitationResponse;
- (unint64_t)sharingStatus;
- (unint64_t)supportedEntityTypes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCanBePublished:(BOOL)a3;
- (void)setCanBeShared:(BOOL)a3;
- (void)setColorString:(id)a3;
- (void)setDigest:(id)a3;
- (void)setDisplayOrder:(int)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalIdentificationTag:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setHasBeenAlerted:(BOOL)a3;
- (void)setHasCanBePublished:(BOOL)a3;
- (void)setHasCanBeShared:(BOOL)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)setHasHasBeenAlerted:(BOOL)a3;
- (void)setHasInvitationStatus:(BOOL)a3;
- (void)setHasIsDefaultCalendarForStore:(BOOL)a3;
- (void)setHasIsFamilyCalendar:(BOOL)a3;
- (void)setHasIsHidden:(BOOL)a3;
- (void)setHasIsHolidayCalendar:(BOOL)a3;
- (void)setHasIsIgnoringEventAlerts:(BOOL)a3;
- (void)setHasIsIgnoringSharedCalendarNotifications:(BOOL)a3;
- (void)setHasIsImmutable:(BOOL)a3;
- (void)setHasIsInbox:(BOOL)a3;
- (void)setHasIsNotificationsCollection:(BOOL)a3;
- (void)setHasIsPublished:(BOOL)a3;
- (void)setHasIsReadonly:(BOOL)a3;
- (void)setHasIsSchedulingProhibited:(BOOL)a3;
- (void)setHasIsSharingInvitation:(BOOL)a3;
- (void)setHasIsSubscribed:(BOOL)a3;
- (void)setHasSharingInvitationResponse:(BOOL)a3;
- (void)setHasSharingStatus:(BOOL)a3;
- (void)setHasSupportedEntityTypes:(BOOL)a3;
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setIsDefaultCalendarForStore:(BOOL)a3;
- (void)setIsFamilyCalendar:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsHolidayCalendar:(BOOL)a3;
- (void)setIsIgnoringEventAlerts:(BOOL)a3;
- (void)setIsIgnoringSharedCalendarNotifications:(BOOL)a3;
- (void)setIsImmutable:(BOOL)a3;
- (void)setIsInbox:(BOOL)a3;
- (void)setIsNotificationsCollection:(BOOL)a3;
- (void)setIsPublished:(BOOL)a3;
- (void)setIsReadonly:(BOOL)a3;
- (void)setIsSchedulingProhibited:(BOOL)a3;
- (void)setIsSharingInvitation:(BOOL)a3;
- (void)setIsSubscribed:(BOOL)a3;
- (void)setNotes:(id)a3;
- (void)setOwnerIdentityAddressString:(id)a3;
- (void)setOwnerIdentityDisplayName:(id)a3;
- (void)setOwnerIdentityEmail:(id)a3;
- (void)setOwnerIdentityFirstName:(id)a3;
- (void)setOwnerIdentityLastName:(id)a3;
- (void)setPublishedURLString:(id)a3;
- (void)setPushKey:(id)a3;
- (void)setSelfIdentityAddressString:(id)a3;
- (void)setSelfIdentityDisplayName:(id)a3;
- (void)setSelfIdentityEmail:(id)a3;
- (void)setSelfIdentityFirstName:(id)a3;
- (void)setSelfIdentityLastName:(id)a3;
- (void)setSharedOwnerAddress:(id)a3;
- (void)setSharedOwnerName:(id)a3;
- (void)setSharingInvitationResponse:(unint64_t)a3;
- (void)setSharingStatus:(unint64_t)a3;
- (void)setSubCalAccountID:(id)a3;
- (void)setSupportedEntityTypes:(unint64_t)a3;
- (void)setSymbolicColorName:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBCalendarAttributes

- (BOOL)hasUUID
{
  return self->_uUID != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setIsReadonly:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isReadonly = a3;
}

- (void)setHasIsReadonly:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsReadonly
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIsHidden:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isHidden = a3;
}

- (void)setHasIsHidden:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsHidden
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsImmutable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isImmutable = a3;
}

- (void)setHasIsImmutable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsImmutable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsInbox:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isInbox = a3;
}

- (void)setHasIsInbox:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsInbox
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsNotificationsCollection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isNotificationsCollection = a3;
}

- (void)setHasIsNotificationsCollection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsNotificationsCollection
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsSharingInvitation:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isSharingInvitation = a3;
}

- (void)setHasIsSharingInvitation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsSharingInvitation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsSubscribed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isSubscribed = a3;
}

- (void)setHasIsSubscribed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsSubscribed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIsHolidayCalendar:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isHolidayCalendar = a3;
}

- (void)setHasIsHolidayCalendar:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsHolidayCalendar
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsFamilyCalendar:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isFamilyCalendar = a3;
}

- (void)setHasIsFamilyCalendar:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsFamilyCalendar
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setIsIgnoringEventAlerts:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isIgnoringEventAlerts = a3;
}

- (void)setHasIsIgnoringEventAlerts:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsIgnoringEventAlerts
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsIgnoringSharedCalendarNotifications:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isIgnoringSharedCalendarNotifications = a3;
}

- (void)setHasIsIgnoringSharedCalendarNotifications:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsIgnoringSharedCalendarNotifications
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsSchedulingProhibited:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isSchedulingProhibited = a3;
}

- (void)setHasIsSchedulingProhibited:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsSchedulingProhibited
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsDefaultCalendarForStore:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_isDefaultCalendarForStore = a3;
}

- (void)setHasIsDefaultCalendarForStore:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsDefaultCalendarForStore
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasDigest
{
  return self->_digest != 0;
}

- (BOOL)hasSymbolicColorName
{
  return self->_symbolicColorName != 0;
}

- (BOOL)hasColorString
{
  return self->_colorString != 0;
}

- (void)setDisplayOrder:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_displayOrder = a3;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDisplayOrder
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSharingStatus:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_sharingStatus = a3;
}

- (void)setHasSharingStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasSharingStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSharedOwnerName
{
  return self->_sharedOwnerName != 0;
}

- (BOOL)hasSharedOwnerAddress
{
  return self->_sharedOwnerAddress != 0;
}

- (void)setSharingInvitationResponse:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_sharingInvitationResponse = a3;
}

- (void)setHasSharingInvitationResponse:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasSharingInvitationResponse
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPublishedURLString
{
  return self->_publishedURLString != 0;
}

- (void)setCanBePublished:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_canBePublished = a3;
}

- (void)setHasCanBePublished:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCanBePublished
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCanBeShared:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_canBeShared = a3;
}

- (void)setHasCanBeShared:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCanBeShared
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsPublished:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isPublished = a3;
}

- (void)setHasIsPublished:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsPublished
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasExternalID
{
  return self->_externalID != 0;
}

- (BOOL)hasExternalIdentificationTag
{
  return self->_externalIdentificationTag != 0;
}

- (BOOL)hasSyncToken
{
  return self->_syncToken != 0;
}

- (BOOL)hasExternalModificationTag
{
  return self->_externalModificationTag != 0;
}

- (BOOL)hasExternalRepresentation
{
  return self->_externalRepresentation != 0;
}

- (void)setSupportedEntityTypes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_supportedEntityTypes = a3;
}

- (void)setHasSupportedEntityTypes:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasSupportedEntityTypes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInvitationStatus:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_invitationStatus = a3;
}

- (void)setHasInvitationStatus:(BOOL)a3
{
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasInvitationStatus
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasBeenAlerted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hasBeenAlerted = a3;
}

- (void)setHasHasBeenAlerted:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9FDA1B53DE231344078DCB732B99F2D2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHasBeenAlerted
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasNotes
{
  return self->_notes != 0;
}

- (BOOL)hasSubCalAccountID
{
  return self->_subCalAccountID != 0;
}

- (BOOL)hasPushKey
{
  return self->_pushKey != 0;
}

- (BOOL)hasSelfIdentityDisplayName
{
  return self->_selfIdentityDisplayName != 0;
}

- (BOOL)hasSelfIdentityEmail
{
  return self->_selfIdentityEmail != 0;
}

- (BOOL)hasSelfIdentityAddressString
{
  return self->_selfIdentityAddressString != 0;
}

- (BOOL)hasSelfIdentityFirstName
{
  return self->_selfIdentityFirstName != 0;
}

- (BOOL)hasSelfIdentityLastName
{
  return self->_selfIdentityLastName != 0;
}

- (BOOL)hasOwnerIdentityDisplayName
{
  return self->_ownerIdentityDisplayName != 0;
}

- (BOOL)hasOwnerIdentityEmail
{
  return self->_ownerIdentityEmail != 0;
}

- (BOOL)hasOwnerIdentityAddressString
{
  return self->_ownerIdentityAddressString != 0;
}

- (BOOL)hasOwnerIdentityFirstName
{
  return self->_ownerIdentityFirstName != 0;
}

- (BOOL)hasOwnerIdentityLastName
{
  return self->_ownerIdentityLastName != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBCalendarAttributes;
  int v3 = [(NEKPBCalendarAttributes *)&v7 description];
  v4 = [(NEKPBCalendarAttributes *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uUID = self->_uUID;
  if (uUID) {
    [v3 setObject:uUID forKey:@"UUID"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v44 = +[NSNumber numberWithBool:self->_isReadonly];
    [v4 setObject:v44 forKey:@"isReadonly"];

    $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  v45 = +[NSNumber numberWithBool:self->_isHidden];
  [v4 setObject:v45 forKey:@"isHidden"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_87;
  }
LABEL_86:
  v46 = +[NSNumber numberWithBool:self->_isImmutable];
  [v4 setObject:v46 forKey:@"isImmutable"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_88;
  }
LABEL_87:
  v47 = +[NSNumber numberWithBool:self->_isInbox];
  [v4 setObject:v47 forKey:@"isInbox"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_89;
  }
LABEL_88:
  v48 = +[NSNumber numberWithBool:self->_isNotificationsCollection];
  [v4 setObject:v48 forKey:@"isNotificationsCollection"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_90;
  }
LABEL_89:
  v49 = +[NSNumber numberWithBool:self->_isSharingInvitation];
  [v4 setObject:v49 forKey:@"isSharingInvitation"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_91;
  }
LABEL_90:
  v50 = +[NSNumber numberWithBool:self->_isSubscribed];
  [v4 setObject:v50 forKey:@"isSubscribed"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_92;
  }
LABEL_91:
  v51 = +[NSNumber numberWithBool:self->_isHolidayCalendar];
  [v4 setObject:v51 forKey:@"isHolidayCalendar"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_93;
  }
LABEL_92:
  v52 = +[NSNumber numberWithBool:self->_isFamilyCalendar];
  [v4 setObject:v52 forKey:@"isFamilyCalendar"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_94;
  }
LABEL_93:
  v53 = +[NSNumber numberWithBool:self->_isIgnoringEventAlerts];
  [v4 setObject:v53 forKey:@"isIgnoringEventAlerts"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_95;
  }
LABEL_94:
  v54 = +[NSNumber numberWithBool:self->_isIgnoringSharedCalendarNotifications];
  [v4 setObject:v54 forKey:@"isIgnoringSharedCalendarNotifications"];

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_95:
  v55 = +[NSNumber numberWithBool:self->_isSchedulingProhibited];
  [v4 setObject:v55 forKey:@"isSchedulingProhibited"];

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_18:
    v8 = +[NSNumber numberWithBool:self->_isDefaultCalendarForStore];
    [v4 setObject:v8 forKey:@"isDefaultCalendarForStore"];
  }
LABEL_19:
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  digest = self->_digest;
  if (digest) {
    [v4 setObject:digest forKey:@"digest"];
  }
  symbolicColorName = self->_symbolicColorName;
  if (symbolicColorName) {
    [v4 setObject:symbolicColorName forKey:@"symbolicColorName"];
  }
  colorString = self->_colorString;
  if (colorString) {
    [v4 setObject:colorString forKey:@"colorString"];
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
    v14 = +[NSNumber numberWithInt:self->_displayOrder];
    [v4 setObject:v14 forKey:@"displayOrder"];

    $9FDA1B53DE231344078DCB732B99F2D2 v13 = self->_has;
  }
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    v15 = +[NSNumber numberWithUnsignedLongLong:self->_sharingStatus];
    [v4 setObject:v15 forKey:@"sharingStatus"];
  }
  sharedOwnerName = self->_sharedOwnerName;
  if (sharedOwnerName) {
    [v4 setObject:sharedOwnerName forKey:@"sharedOwnerName"];
  }
  sharedOwnerAddress = self->_sharedOwnerAddress;
  if (sharedOwnerAddress) {
    [v4 setObject:sharedOwnerAddress forKey:@"sharedOwnerAddress"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v18 = +[NSNumber numberWithUnsignedLongLong:self->_sharingInvitationResponse];
    [v4 setObject:v18 forKey:@"sharingInvitationResponse"];
  }
  publishedURLString = self->_publishedURLString;
  if (publishedURLString) {
    [v4 setObject:publishedURLString forKey:@"publishedURLString"];
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 0x20) != 0)
  {
    v56 = +[NSNumber numberWithBool:self->_canBePublished];
    [v4 setObject:v56 forKey:@"canBePublished"];

    $9FDA1B53DE231344078DCB732B99F2D2 v20 = self->_has;
    if ((*(unsigned char *)&v20 & 0x40) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v20 & 0x20000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&v20 & 0x40) == 0)
  {
    goto LABEL_41;
  }
  v57 = +[NSNumber numberWithBool:self->_canBeShared];
  [v4 setObject:v57 forKey:@"canBeShared"];

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_42:
    v21 = +[NSNumber numberWithBool:self->_isPublished];
    [v4 setObject:v21 forKey:@"isPublished"];
  }
LABEL_43:
  externalID = self->_externalID;
  if (externalID) {
    [v4 setObject:externalID forKey:@"externalID"];
  }
  externalIdentificationTag = self->_externalIdentificationTag;
  if (externalIdentificationTag) {
    [v4 setObject:externalIdentificationTag forKey:@"externalIdentificationTag"];
  }
  syncToken = self->_syncToken;
  if (syncToken) {
    [v4 setObject:syncToken forKey:@"syncToken"];
  }
  externalModificationTag = self->_externalModificationTag;
  if (externalModificationTag) {
    [v4 setObject:externalModificationTag forKey:@"externalModificationTag"];
  }
  externalRepresentation = self->_externalRepresentation;
  if (externalRepresentation) {
    [v4 setObject:externalRepresentation forKey:@"externalRepresentation"];
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v27 = self->_has;
  if ((*(unsigned char *)&v27 & 8) != 0)
  {
    v58 = +[NSNumber numberWithUnsignedLongLong:self->_supportedEntityTypes];
    [v4 setObject:v58 forKey:@"supportedEntityTypes"];

    $9FDA1B53DE231344078DCB732B99F2D2 v27 = self->_has;
    if ((*(unsigned char *)&v27 & 1) == 0)
    {
LABEL_55:
      if ((*(unsigned char *)&v27 & 0x80) == 0) {
        goto LABEL_57;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&v27 & 1) == 0)
  {
    goto LABEL_55;
  }
  v59 = +[NSNumber numberWithUnsignedLongLong:self->_invitationStatus];
  [v4 setObject:v59 forKey:@"invitationStatus"];

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_56:
    v28 = +[NSNumber numberWithBool:self->_hasBeenAlerted];
    [v4 setObject:v28 forKey:@"hasBeenAlerted"];
  }
LABEL_57:
  notes = self->_notes;
  if (notes) {
    [v4 setObject:notes forKey:@"notes"];
  }
  subCalAccountID = self->_subCalAccountID;
  if (subCalAccountID) {
    [v4 setObject:subCalAccountID forKey:@"subCalAccountID"];
  }
  pushKey = self->_pushKey;
  if (pushKey) {
    [v4 setObject:pushKey forKey:@"pushKey"];
  }
  selfIdentityDisplayName = self->_selfIdentityDisplayName;
  if (selfIdentityDisplayName) {
    [v4 setObject:selfIdentityDisplayName forKey:@"selfIdentityDisplayName"];
  }
  selfIdentityEmail = self->_selfIdentityEmail;
  if (selfIdentityEmail) {
    [v4 setObject:selfIdentityEmail forKey:@"selfIdentityEmail"];
  }
  selfIdentityAddressString = self->_selfIdentityAddressString;
  if (selfIdentityAddressString) {
    [v4 setObject:selfIdentityAddressString forKey:@"selfIdentityAddressString"];
  }
  selfIdentityFirstName = self->_selfIdentityFirstName;
  if (selfIdentityFirstName) {
    [v4 setObject:selfIdentityFirstName forKey:@"selfIdentityFirstName"];
  }
  selfIdentityLastName = self->_selfIdentityLastName;
  if (selfIdentityLastName) {
    [v4 setObject:selfIdentityLastName forKey:@"selfIdentityLastName"];
  }
  ownerIdentityDisplayName = self->_ownerIdentityDisplayName;
  if (ownerIdentityDisplayName) {
    [v4 setObject:ownerIdentityDisplayName forKey:@"ownerIdentityDisplayName"];
  }
  ownerIdentityEmail = self->_ownerIdentityEmail;
  if (ownerIdentityEmail) {
    [v4 setObject:ownerIdentityEmail forKey:@"ownerIdentityEmail"];
  }
  ownerIdentityAddressString = self->_ownerIdentityAddressString;
  if (ownerIdentityAddressString) {
    [v4 setObject:ownerIdentityAddressString forKey:@"ownerIdentityAddressString"];
  }
  ownerIdentityFirstName = self->_ownerIdentityFirstName;
  if (ownerIdentityFirstName) {
    [v4 setObject:ownerIdentityFirstName forKey:@"ownerIdentityFirstName"];
  }
  ownerIdentityLastName = self->_ownerIdentityLastName;
  if (ownerIdentityLastName) {
    [v4 setObject:ownerIdentityLastName forKey:@"ownerIdentityLastName"];
  }
  id v42 = v4;

  return v42;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000D87C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_uUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_88;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_97:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_18:
    PBDataWriterWriteBOOLField();
    id v4 = v9;
  }
LABEL_19:
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_digest)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  if (self->_symbolicColorName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_colorString)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    $9FDA1B53DE231344078DCB732B99F2D2 v6 = self->_has;
  }
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  if (self->_sharedOwnerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_sharedOwnerAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  if (self->_publishedURLString)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    $9FDA1B53DE231344078DCB732B99F2D2 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x40) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v7 & 0x20000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_42:
    PBDataWriterWriteBOOLField();
    id v4 = v9;
  }
LABEL_43:
  if (self->_externalID)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_externalIdentificationTag)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_syncToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_externalModificationTag)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_externalRepresentation)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
    $9FDA1B53DE231344078DCB732B99F2D2 v8 = self->_has;
    if ((*(unsigned char *)&v8 & 1) == 0)
    {
LABEL_55:
      if ((*(unsigned char *)&v8 & 0x80) == 0) {
        goto LABEL_57;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&v8 & 1) == 0)
  {
    goto LABEL_55;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_56:
    PBDataWriterWriteBOOLField();
    id v4 = v9;
  }
LABEL_57:
  if (self->_notes)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_subCalAccountID)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_pushKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_selfIdentityDisplayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_selfIdentityEmail)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_selfIdentityAddressString)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_selfIdentityFirstName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_selfIdentityLastName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_ownerIdentityDisplayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_ownerIdentityEmail)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_ownerIdentityAddressString)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_ownerIdentityFirstName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_ownerIdentityLastName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_uUID)
  {
    [v4 setUUID:];
    id v4 = v9;
  }
  if (self->_title)
  {
    [v9 setTitle:];
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((unsigned char *)v4 + 277) = self->_isReadonly;
    *((_DWORD *)v4 + 71) |= 0x40000u;
    $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_88;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 269) = self->_isHidden;
  *((_DWORD *)v4 + 71) |= 0x400u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((unsigned char *)v4 + 273) = self->_isImmutable;
  *((_DWORD *)v4 + 71) |= 0x4000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((unsigned char *)v4 + 274) = self->_isInbox;
  *((_DWORD *)v4 + 71) |= 0x8000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((unsigned char *)v4 + 275) = self->_isNotificationsCollection;
  *((_DWORD *)v4 + 71) |= 0x10000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((unsigned char *)v4 + 279) = self->_isSharingInvitation;
  *((_DWORD *)v4 + 71) |= 0x100000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((unsigned char *)v4 + 280) = self->_isSubscribed;
  *((_DWORD *)v4 + 71) |= 0x200000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((unsigned char *)v4 + 270) = self->_isHolidayCalendar;
  *((_DWORD *)v4 + 71) |= 0x800u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((unsigned char *)v4 + 268) = self->_isFamilyCalendar;
  *((_DWORD *)v4 + 71) |= 0x200u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((unsigned char *)v4 + 271) = self->_isIgnoringEventAlerts;
  *((_DWORD *)v4 + 71) |= 0x1000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((unsigned char *)v4 + 272) = self->_isIgnoringSharedCalendarNotifications;
  *((_DWORD *)v4 + 71) |= 0x2000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_97:
  *((unsigned char *)v4 + 278) = self->_isSchedulingProhibited;
  *((_DWORD *)v4 + 71) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_18:
    *((unsigned char *)v4 + 267) = self->_isDefaultCalendarForStore;
    *((_DWORD *)v4 + 71) |= 0x100u;
  }
LABEL_19:
  if (self->_type)
  {
    [v9 setType:];
    id v4 = v9;
  }
  if (self->_digest)
  {
    [v9 setDigest:];
    id v4 = v9;
  }
  if (self->_symbolicColorName)
  {
    [v9 setSymbolicColorName:];
    id v4 = v9;
  }
  if (self->_colorString)
  {
    [v9 setColorString:];
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_displayOrder;
    *((_DWORD *)v4 + 71) |= 0x10u;
    $9FDA1B53DE231344078DCB732B99F2D2 v6 = self->_has;
  }
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    *((void *)v4 + 3) = self->_sharingStatus;
    *((_DWORD *)v4 + 71) |= 4u;
  }
  if (self->_sharedOwnerName)
  {
    [v9 setSharedOwnerName:];
    id v4 = v9;
  }
  if (self->_sharedOwnerAddress)
  {
    [v9 setSharedOwnerAddress:];
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_sharingInvitationResponse;
    *((_DWORD *)v4 + 71) |= 2u;
  }
  if (self->_publishedURLString)
  {
    [v9 setPublishedURLString:];
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
    *((unsigned char *)v4 + 264) = self->_canBePublished;
    *((_DWORD *)v4 + 71) |= 0x20u;
    $9FDA1B53DE231344078DCB732B99F2D2 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x40) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v7 & 0x20000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
    goto LABEL_41;
  }
  *((unsigned char *)v4 + 265) = self->_canBeShared;
  *((_DWORD *)v4 + 71) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_42:
    *((unsigned char *)v4 + 276) = self->_isPublished;
    *((_DWORD *)v4 + 71) |= 0x20000u;
  }
LABEL_43:
  if (self->_externalID)
  {
    [v9 setExternalID:];
    id v4 = v9;
  }
  if (self->_externalIdentificationTag)
  {
    [v9 setExternalIdentificationTag:];
    id v4 = v9;
  }
  if (self->_syncToken)
  {
    [v9 setSyncToken:];
    id v4 = v9;
  }
  if (self->_externalModificationTag)
  {
    [v9 setExternalModificationTag:];
    id v4 = v9;
  }
  if (self->_externalRepresentation)
  {
    [v9 setExternalRepresentation:];
    id v4 = v9;
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) != 0)
  {
    *((void *)v4 + 4) = self->_supportedEntityTypes;
    *((_DWORD *)v4 + 71) |= 8u;
    $9FDA1B53DE231344078DCB732B99F2D2 v8 = self->_has;
    if ((*(unsigned char *)&v8 & 1) == 0)
    {
LABEL_55:
      if ((*(unsigned char *)&v8 & 0x80) == 0) {
        goto LABEL_57;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&v8 & 1) == 0)
  {
    goto LABEL_55;
  }
  *((void *)v4 + 1) = self->_invitationStatus;
  *((_DWORD *)v4 + 71) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_56:
    *((unsigned char *)v4 + 266) = self->_hasBeenAlerted;
    *((_DWORD *)v4 + 71) |= 0x80u;
  }
LABEL_57:
  if (self->_notes)
  {
    [v9 setNotes:];
    id v4 = v9;
  }
  if (self->_subCalAccountID)
  {
    [v9 setSubCalAccountID:];
    id v4 = v9;
  }
  if (self->_pushKey)
  {
    [v9 setPushKey:];
    id v4 = v9;
  }
  if (self->_selfIdentityDisplayName)
  {
    [v9 setSelfIdentityDisplayName:];
    id v4 = v9;
  }
  if (self->_selfIdentityEmail)
  {
    [v9 setSelfIdentityEmail:];
    id v4 = v9;
  }
  if (self->_selfIdentityAddressString)
  {
    [v9 setSelfIdentityAddressString:];
    id v4 = v9;
  }
  if (self->_selfIdentityFirstName)
  {
    [v9 setSelfIdentityFirstName:];
    id v4 = v9;
  }
  if (self->_selfIdentityLastName)
  {
    [v9 setSelfIdentityLastName:];
    id v4 = v9;
  }
  if (self->_ownerIdentityDisplayName)
  {
    [v9 setOwnerIdentityDisplayName:];
    id v4 = v9;
  }
  if (self->_ownerIdentityEmail)
  {
    [v9 setOwnerIdentityEmail:];
    id v4 = v9;
  }
  if (self->_ownerIdentityAddressString)
  {
    [v9 setOwnerIdentityAddressString:];
    id v4 = v9;
  }
  if (self->_ownerIdentityFirstName)
  {
    [v9 setOwnerIdentityFirstName:];
    id v4 = v9;
  }
  if (self->_ownerIdentityLastName)
  {
    [v9 setOwnerIdentityLastName:];
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_uUID copyWithZone:a3];
  $9FDA1B53DE231344078DCB732B99F2D2 v7 = (void *)v5[32];
  v5[32] = v6;

  id v8 = [(NSString *)self->_title copyWithZone:a3];
  id v9 = (void *)v5[30];
  v5[30] = v8;

  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((unsigned char *)v5 + 277) = self->_isReadonly;
    *((_DWORD *)v5 + 71) |= 0x40000u;
    $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 269) = self->_isHidden;
  *((_DWORD *)v5 + 71) |= 0x400u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)v5 + 273) = self->_isImmutable;
  *((_DWORD *)v5 + 71) |= 0x4000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((unsigned char *)v5 + 274) = self->_isInbox;
  *((_DWORD *)v5 + 71) |= 0x8000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((unsigned char *)v5 + 275) = self->_isNotificationsCollection;
  *((_DWORD *)v5 + 71) |= 0x10000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((unsigned char *)v5 + 279) = self->_isSharingInvitation;
  *((_DWORD *)v5 + 71) |= 0x100000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v5 + 280) = self->_isSubscribed;
  *((_DWORD *)v5 + 71) |= 0x200000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)v5 + 270) = self->_isHolidayCalendar;
  *((_DWORD *)v5 + 71) |= 0x800u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v5 + 268) = self->_isFamilyCalendar;
  *((_DWORD *)v5 + 71) |= 0x200u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((unsigned char *)v5 + 271) = self->_isIgnoringEventAlerts;
  *((_DWORD *)v5 + 71) |= 0x1000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)v5 + 272) = self->_isIgnoringSharedCalendarNotifications;
  *((_DWORD *)v5 + 71) |= 0x2000u;
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_41:
  *((unsigned char *)v5 + 278) = self->_isSchedulingProhibited;
  *((_DWORD *)v5 + 71) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    *((unsigned char *)v5 + 267) = self->_isDefaultCalendarForStore;
    *((_DWORD *)v5 + 71) |= 0x100u;
  }
LABEL_15:
  id v11 = [(NSString *)self->_type copyWithZone:a3];
  v12 = (void *)v5[31];
  v5[31] = v11;

  id v13 = [(NSData *)self->_digest copyWithZone:a3];
  v14 = (void *)v5[6];
  v5[6] = v13;

  id v15 = [(NSString *)self->_symbolicColorName copyWithZone:a3];
  v16 = (void *)v5[28];
  v5[28] = v15;

  id v17 = [(NSString *)self->_colorString copyWithZone:a3];
  v18 = (void *)v5[5];
  v5[5] = v17;

  $9FDA1B53DE231344078DCB732B99F2D2 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_displayOrder;
    *((_DWORD *)v5 + 71) |= 0x10u;
    $9FDA1B53DE231344078DCB732B99F2D2 v19 = self->_has;
  }
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    v5[3] = self->_sharingStatus;
    *((_DWORD *)v5 + 71) |= 4u;
  }
  id v20 = [(NSString *)self->_sharedOwnerName copyWithZone:a3];
  v21 = (void *)v5[26];
  v5[26] = v20;

  id v22 = [(NSString *)self->_sharedOwnerAddress copyWithZone:a3];
  v23 = (void *)v5[25];
  v5[25] = v22;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = self->_sharingInvitationResponse;
    *((_DWORD *)v5 + 71) |= 2u;
  }
  id v24 = [(NSString *)self->_publishedURLString copyWithZone:a3];
  v25 = (void *)v5[18];
  v5[18] = v24;

  $9FDA1B53DE231344078DCB732B99F2D2 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x20) != 0)
  {
    *((unsigned char *)v5 + 264) = self->_canBePublished;
    *((_DWORD *)v5 + 71) |= 0x20u;
    $9FDA1B53DE231344078DCB732B99F2D2 v26 = self->_has;
    if ((*(unsigned char *)&v26 & 0x40) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v26 & 0x20000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&v26 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  *((unsigned char *)v5 + 265) = self->_canBeShared;
  *((_DWORD *)v5 + 71) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_24:
    *((unsigned char *)v5 + 276) = self->_isPublished;
    *((_DWORD *)v5 + 71) |= 0x20000u;
  }
LABEL_25:
  id v27 = [(NSString *)self->_externalID copyWithZone:a3];
  v28 = (void *)v5[8];
  v5[8] = v27;

  id v29 = [(NSString *)self->_externalIdentificationTag copyWithZone:a3];
  v30 = (void *)v5[9];
  v5[9] = v29;

  id v31 = [(NSString *)self->_syncToken copyWithZone:a3];
  v32 = (void *)v5[29];
  v5[29] = v31;

  id v33 = [(NSString *)self->_externalModificationTag copyWithZone:a3];
  v34 = (void *)v5[10];
  v5[10] = v33;

  id v35 = [(NSData *)self->_externalRepresentation copyWithZone:a3];
  v36 = (void *)v5[11];
  v5[11] = v35;

  $9FDA1B53DE231344078DCB732B99F2D2 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 8) == 0)
  {
    if ((*(unsigned char *)&v37 & 1) == 0) {
      goto LABEL_27;
    }
LABEL_47:
    v5[1] = self->_invitationStatus;
    *((_DWORD *)v5 + 71) |= 1u;
    if ((*(_DWORD *)&self->_has & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v5[4] = self->_supportedEntityTypes;
  *((_DWORD *)v5 + 71) |= 8u;
  $9FDA1B53DE231344078DCB732B99F2D2 v37 = self->_has;
  if (*(unsigned char *)&v37) {
    goto LABEL_47;
  }
LABEL_27:
  if ((*(unsigned char *)&v37 & 0x80) != 0)
  {
LABEL_28:
    *((unsigned char *)v5 + 266) = self->_hasBeenAlerted;
    *((_DWORD *)v5 + 71) |= 0x80u;
  }
LABEL_29:
  id v38 = [(NSString *)self->_notes copyWithZone:a3];
  v39 = (void *)v5[12];
  v5[12] = v38;

  id v40 = [(NSString *)self->_subCalAccountID copyWithZone:a3];
  v41 = (void *)v5[27];
  v5[27] = v40;

  id v42 = [(NSString *)self->_pushKey copyWithZone:a3];
  v43 = (void *)v5[19];
  v5[19] = v42;

  id v44 = [(NSString *)self->_selfIdentityDisplayName copyWithZone:a3];
  v45 = (void *)v5[21];
  v5[21] = v44;

  id v46 = [(NSString *)self->_selfIdentityEmail copyWithZone:a3];
  v47 = (void *)v5[22];
  v5[22] = v46;

  id v48 = [(NSString *)self->_selfIdentityAddressString copyWithZone:a3];
  v49 = (void *)v5[20];
  v5[20] = v48;

  id v50 = [(NSString *)self->_selfIdentityFirstName copyWithZone:a3];
  v51 = (void *)v5[23];
  v5[23] = v50;

  id v52 = [(NSString *)self->_selfIdentityLastName copyWithZone:a3];
  v53 = (void *)v5[24];
  v5[24] = v52;

  id v54 = [(NSString *)self->_ownerIdentityDisplayName copyWithZone:a3];
  v55 = (void *)v5[14];
  v5[14] = v54;

  id v56 = [(NSString *)self->_ownerIdentityEmail copyWithZone:a3];
  v57 = (void *)v5[15];
  v5[15] = v56;

  id v58 = [(NSString *)self->_ownerIdentityAddressString copyWithZone:a3];
  v59 = (void *)v5[13];
  v5[13] = v58;

  id v60 = [(NSString *)self->_ownerIdentityFirstName copyWithZone:a3];
  v61 = (void *)v5[16];
  v5[16] = v60;

  id v62 = [(NSString *)self->_ownerIdentityLastName copyWithZone:a3];
  v63 = (void *)v5[17];
  v5[17] = v62;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_218;
  }
  uUID = self->_uUID;
  if ((unint64_t)uUID | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](uUID, "isEqual:")) {
      goto LABEL_218;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_218;
    }
  }
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  int v8 = *((_DWORD *)v4 + 71);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0) {
      goto LABEL_218;
    }
    if (self->_isReadonly)
    {
      if (!*((unsigned char *)v4 + 277)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 277))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0) {
      goto LABEL_218;
    }
    if (self->_isHidden)
    {
      if (!*((unsigned char *)v4 + 269)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 269))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0) {
      goto LABEL_218;
    }
    if (self->_isImmutable)
    {
      if (!*((unsigned char *)v4 + 273)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 273))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0) {
      goto LABEL_218;
    }
    if (self->_isInbox)
    {
      if (!*((unsigned char *)v4 + 274)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 274))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0) {
      goto LABEL_218;
    }
    if (self->_isNotificationsCollection)
    {
      if (!*((unsigned char *)v4 + 275)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 275))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0) {
      goto LABEL_218;
    }
    if (self->_isSharingInvitation)
    {
      if (!*((unsigned char *)v4 + 279)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 279))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0) {
      goto LABEL_218;
    }
    if (self->_isSubscribed)
    {
      if (!*((unsigned char *)v4 + 280)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 280))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0) {
      goto LABEL_218;
    }
    if (self->_isHolidayCalendar)
    {
      if (!*((unsigned char *)v4 + 270)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 270))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0) {
      goto LABEL_218;
    }
    if (self->_isFamilyCalendar)
    {
      if (!*((unsigned char *)v4 + 268)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 268))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0) {
      goto LABEL_218;
    }
    if (self->_isIgnoringEventAlerts)
    {
      if (!*((unsigned char *)v4 + 271)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 271))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0) {
      goto LABEL_218;
    }
    if (self->_isIgnoringSharedCalendarNotifications)
    {
      if (!*((unsigned char *)v4 + 272)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 272))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0) {
      goto LABEL_218;
    }
    if (self->_isSchedulingProhibited)
    {
      if (!*((unsigned char *)v4 + 278)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 278))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0) {
      goto LABEL_218;
    }
    if (self->_isDefaultCalendarForStore)
    {
      if (!*((unsigned char *)v4 + 267)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 267))
    {
      goto LABEL_218;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_218;
  }
  type = self->_type;
  if ((unint64_t)type | *((void *)v4 + 31) && !-[NSString isEqual:](type, "isEqual:")) {
    goto LABEL_218;
  }
  digest = self->_digest;
  if ((unint64_t)digest | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](digest, "isEqual:")) {
      goto LABEL_218;
    }
  }
  symbolicColorName = self->_symbolicColorName;
  if ((unint64_t)symbolicColorName | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](symbolicColorName, "isEqual:")) {
      goto LABEL_218;
    }
  }
  colorString = self->_colorString;
  if ((unint64_t)colorString | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](colorString, "isEqual:")) {
      goto LABEL_218;
    }
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v13 = self->_has;
  int v14 = *((_DWORD *)v4 + 71);
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_displayOrder != *((_DWORD *)v4 + 14)) {
      goto LABEL_218;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_218;
  }
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_sharingStatus != *((void *)v4 + 3)) {
      goto LABEL_218;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_218;
  }
  sharedOwnerName = self->_sharedOwnerName;
  if ((unint64_t)sharedOwnerName | *((void *)v4 + 26)
    && !-[NSString isEqual:](sharedOwnerName, "isEqual:"))
  {
    goto LABEL_218;
  }
  sharedOwnerAddress = self->_sharedOwnerAddress;
  if ((unint64_t)sharedOwnerAddress | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](sharedOwnerAddress, "isEqual:")) {
      goto LABEL_218;
    }
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v17 = self->_has;
  int v18 = *((_DWORD *)v4 + 71);
  if ((*(unsigned char *)&v17 & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_sharingInvitationResponse != *((void *)v4 + 2)) {
      goto LABEL_218;
    }
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_218;
  }
  publishedURLString = self->_publishedURLString;
  if ((unint64_t)publishedURLString | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](publishedURLString, "isEqual:")) {
      goto LABEL_218;
    }
    $9FDA1B53DE231344078DCB732B99F2D2 v17 = self->_has;
  }
  int v20 = *((_DWORD *)v4 + 71);
  if ((*(unsigned char *)&v17 & 0x20) != 0)
  {
    if ((v20 & 0x20) == 0) {
      goto LABEL_218;
    }
    if (self->_canBePublished)
    {
      if (!*((unsigned char *)v4 + 264)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 264))
    {
      goto LABEL_218;
    }
  }
  else if ((v20 & 0x20) != 0)
  {
    goto LABEL_218;
  }
  if ((*(unsigned char *)&v17 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0) {
      goto LABEL_218;
    }
    if (self->_canBeShared)
    {
      if (!*((unsigned char *)v4 + 265)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 265))
    {
      goto LABEL_218;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_218;
  }
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    if ((v20 & 0x20000) == 0) {
      goto LABEL_218;
    }
    if (self->_isPublished)
    {
      if (!*((unsigned char *)v4 + 276)) {
        goto LABEL_218;
      }
    }
    else if (*((unsigned char *)v4 + 276))
    {
      goto LABEL_218;
    }
  }
  else if ((v20 & 0x20000) != 0)
  {
    goto LABEL_218;
  }
  externalID = self->_externalID;
  if ((unint64_t)externalID | *((void *)v4 + 8) && !-[NSString isEqual:](externalID, "isEqual:")) {
    goto LABEL_218;
  }
  externalIdentificationTag = self->_externalIdentificationTag;
  if ((unint64_t)externalIdentificationTag | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](externalIdentificationTag, "isEqual:")) {
      goto LABEL_218;
    }
  }
  syncToken = self->_syncToken;
  if ((unint64_t)syncToken | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](syncToken, "isEqual:")) {
      goto LABEL_218;
    }
  }
  externalModificationTag = self->_externalModificationTag;
  if ((unint64_t)externalModificationTag | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](externalModificationTag, "isEqual:")) {
      goto LABEL_218;
    }
  }
  externalRepresentation = self->_externalRepresentation;
  if ((unint64_t)externalRepresentation | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](externalRepresentation, "isEqual:")) {
      goto LABEL_218;
    }
  }
  $9FDA1B53DE231344078DCB732B99F2D2 v26 = self->_has;
  int v27 = *((_DWORD *)v4 + 71);
  if ((*(unsigned char *)&v26 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_supportedEntityTypes != *((void *)v4 + 4)) {
      goto LABEL_218;
    }
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_218;
  }
  if (*(unsigned char *)&v26)
  {
    if ((v27 & 1) == 0 || self->_invitationStatus != *((void *)v4 + 1)) {
      goto LABEL_218;
    }
  }
  else if (v27)
  {
    goto LABEL_218;
  }
  if ((*(unsigned char *)&v26 & 0x80) != 0)
  {
    if ((v27 & 0x80) != 0)
    {
      if (self->_hasBeenAlerted)
      {
        if (!*((unsigned char *)v4 + 266)) {
          goto LABEL_218;
        }
        goto LABEL_192;
      }
      if (!*((unsigned char *)v4 + 266)) {
        goto LABEL_192;
      }
    }
LABEL_218:
    unsigned __int8 v41 = 0;
    goto LABEL_219;
  }
  if ((v27 & 0x80) != 0) {
    goto LABEL_218;
  }
LABEL_192:
  notes = self->_notes;
  if ((unint64_t)notes | *((void *)v4 + 12) && !-[NSString isEqual:](notes, "isEqual:")) {
    goto LABEL_218;
  }
  subCalAccountID = self->_subCalAccountID;
  if ((unint64_t)subCalAccountID | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](subCalAccountID, "isEqual:")) {
      goto LABEL_218;
    }
  }
  pushKey = self->_pushKey;
  if ((unint64_t)pushKey | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](pushKey, "isEqual:")) {
      goto LABEL_218;
    }
  }
  selfIdentityDisplayName = self->_selfIdentityDisplayName;
  if ((unint64_t)selfIdentityDisplayName | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](selfIdentityDisplayName, "isEqual:")) {
      goto LABEL_218;
    }
  }
  selfIdentityEmail = self->_selfIdentityEmail;
  if ((unint64_t)selfIdentityEmail | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](selfIdentityEmail, "isEqual:")) {
      goto LABEL_218;
    }
  }
  selfIdentityAddressString = self->_selfIdentityAddressString;
  if ((unint64_t)selfIdentityAddressString | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](selfIdentityAddressString, "isEqual:")) {
      goto LABEL_218;
    }
  }
  selfIdentityFirstName = self->_selfIdentityFirstName;
  if ((unint64_t)selfIdentityFirstName | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](selfIdentityFirstName, "isEqual:")) {
      goto LABEL_218;
    }
  }
  selfIdentityLastName = self->_selfIdentityLastName;
  if ((unint64_t)selfIdentityLastName | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](selfIdentityLastName, "isEqual:")) {
      goto LABEL_218;
    }
  }
  ownerIdentityDisplayName = self->_ownerIdentityDisplayName;
  if ((unint64_t)ownerIdentityDisplayName | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](ownerIdentityDisplayName, "isEqual:")) {
      goto LABEL_218;
    }
  }
  ownerIdentityEmail = self->_ownerIdentityEmail;
  if ((unint64_t)ownerIdentityEmail | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](ownerIdentityEmail, "isEqual:")) {
      goto LABEL_218;
    }
  }
  ownerIdentityAddressString = self->_ownerIdentityAddressString;
  if ((unint64_t)ownerIdentityAddressString | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](ownerIdentityAddressString, "isEqual:")) {
      goto LABEL_218;
    }
  }
  ownerIdentityFirstName = self->_ownerIdentityFirstName;
  if ((unint64_t)ownerIdentityFirstName | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](ownerIdentityFirstName, "isEqual:")) {
      goto LABEL_218;
    }
  }
  ownerIdentityLastName = self->_ownerIdentityLastName;
  if ((unint64_t)ownerIdentityLastName | *((void *)v4 + 17)) {
    unsigned __int8 v41 = -[NSString isEqual:](ownerIdentityLastName, "isEqual:");
  }
  else {
    unsigned __int8 v41 = 1;
  }
LABEL_219:

  return v41;
}

- (unint64_t)hash
{
  NSUInteger v57 = [(NSString *)self->_uUID hash];
  NSUInteger v56 = [(NSString *)self->_title hash];
  $9FDA1B53DE231344078DCB732B99F2D2 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v55 = 2654435761 * self->_isReadonly;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v54 = 2654435761 * self->_isHidden;
      if ((*(_WORD *)&has & 0x4000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v55 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v54 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_4:
    uint64_t v53 = 2654435761 * self->_isImmutable;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v53 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_5:
    uint64_t v52 = 2654435761 * self->_isInbox;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_6:
    uint64_t v51 = 2654435761 * self->_isNotificationsCollection;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v51 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_7:
    uint64_t v50 = 2654435761 * self->_isSharingInvitation;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v50 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_8:
    uint64_t v49 = 2654435761 * self->_isSubscribed;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v49 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v48 = 2654435761 * self->_isHolidayCalendar;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v48 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v47 = 2654435761 * self->_isFamilyCalendar;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v47 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v46 = 2654435761 * self->_isIgnoringEventAlerts;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v46 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_12:
    uint64_t v45 = 2654435761 * self->_isIgnoringSharedCalendarNotifications;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v44 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v45 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v44 = 2654435761 * self->_isSchedulingProhibited;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_14:
    uint64_t v43 = 2654435761 * self->_isDefaultCalendarForStore;
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v43 = 0;
LABEL_28:
  NSUInteger v42 = [(NSString *)self->_type hash];
  unint64_t v41 = (unint64_t)[(NSData *)self->_digest hash];
  NSUInteger v40 = [(NSString *)self->_symbolicColorName hash];
  NSUInteger v39 = [(NSString *)self->_colorString hash];
  $9FDA1B53DE231344078DCB732B99F2D2 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
    uint64_t v38 = 2654435761 * self->_displayOrder;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v38 = 0;
    if ((*(unsigned char *)&v4 & 4) != 0)
    {
LABEL_30:
      unint64_t v37 = 2654435761u * self->_sharingStatus;
      goto LABEL_33;
    }
  }
  unint64_t v37 = 0;
LABEL_33:
  NSUInteger v36 = [(NSString *)self->_sharedOwnerName hash];
  NSUInteger v35 = [(NSString *)self->_sharedOwnerAddress hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v34 = 2654435761u * self->_sharingInvitationResponse;
  }
  else {
    unint64_t v34 = 0;
  }
  NSUInteger v32 = [(NSString *)self->_publishedURLString hash];
  $9FDA1B53DE231344078DCB732B99F2D2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&v5 & 0x40) != 0) {
      goto LABEL_38;
    }
LABEL_41:
    uint64_t v7 = 0;
    if ((*(_DWORD *)&v5 & 0x20000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_42;
  }
  uint64_t v6 = 2654435761 * self->_canBePublished;
  if ((*(unsigned char *)&v5 & 0x40) == 0) {
    goto LABEL_41;
  }
LABEL_38:
  uint64_t v7 = 2654435761 * self->_canBeShared;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
LABEL_39:
    uint64_t v8 = 2654435761 * self->_isPublished;
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v8 = 0;
LABEL_43:
  NSUInteger v9 = [(NSString *)self->_externalID hash];
  NSUInteger v10 = [(NSString *)self->_externalIdentificationTag hash];
  NSUInteger v11 = [(NSString *)self->_syncToken hash];
  NSUInteger v12 = [(NSString *)self->_externalModificationTag hash];
  unint64_t v13 = (unint64_t)[(NSData *)self->_externalRepresentation hash];
  $9FDA1B53DE231344078DCB732B99F2D2 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) == 0)
  {
    unint64_t v15 = 0;
    if (*(unsigned char *)&v14) {
      goto LABEL_45;
    }
LABEL_48:
    unint64_t v16 = 0;
    if ((*(unsigned char *)&v14 & 0x80) != 0) {
      goto LABEL_46;
    }
LABEL_49:
    uint64_t v17 = 0;
    goto LABEL_50;
  }
  unint64_t v15 = 2654435761u * self->_supportedEntityTypes;
  if ((*(unsigned char *)&v14 & 1) == 0) {
    goto LABEL_48;
  }
LABEL_45:
  unint64_t v16 = 2654435761u * self->_invitationStatus;
  if ((*(unsigned char *)&v14 & 0x80) == 0) {
    goto LABEL_49;
  }
LABEL_46:
  uint64_t v17 = 2654435761 * self->_hasBeenAlerted;
LABEL_50:
  NSUInteger v18 = v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  unint64_t v19 = v15 ^ v16 ^ v17 ^ [(NSString *)self->_notes hash];
  unint64_t v20 = v19 ^ [(NSString *)self->_subCalAccountID hash];
  unint64_t v21 = v20 ^ [(NSString *)self->_pushKey hash];
  unint64_t v22 = v21 ^ [(NSString *)self->_selfIdentityDisplayName hash];
  unint64_t v23 = v22 ^ [(NSString *)self->_selfIdentityEmail hash];
  unint64_t v24 = v18 ^ v23 ^ [(NSString *)self->_selfIdentityAddressString hash];
  NSUInteger v25 = [(NSString *)self->_selfIdentityFirstName hash];
  unint64_t v26 = v25 ^ [(NSString *)self->_selfIdentityLastName hash];
  unint64_t v27 = v26 ^ [(NSString *)self->_ownerIdentityDisplayName hash];
  unint64_t v28 = v27 ^ [(NSString *)self->_ownerIdentityEmail hash];
  unint64_t v29 = v28 ^ [(NSString *)self->_ownerIdentityAddressString hash];
  unint64_t v30 = v29 ^ [(NSString *)self->_ownerIdentityFirstName hash];
  return v24 ^ v30 ^ [(NSString *)self->_ownerIdentityLastName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 32))
  {
    -[NEKPBCalendarAttributes setUUID:](self, "setUUID:");
    id v4 = v9;
  }
  if (*((void *)v4 + 30))
  {
    -[NEKPBCalendarAttributes setTitle:](self, "setTitle:");
    id v4 = v9;
  }
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x40000) != 0)
  {
    self->_isReadonly = *((unsigned char *)v4 + 277);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v5 = *((_DWORD *)v4 + 71);
    if ((v5 & 0x400) == 0)
    {
LABEL_7:
      if ((v5 & 0x4000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_88;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_7;
  }
  self->_isHidden = *((unsigned char *)v4 + 269);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x4000) == 0)
  {
LABEL_8:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_isImmutable = *((unsigned char *)v4 + 273);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x8000) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_isInbox = *((unsigned char *)v4 + 274);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x10000) == 0)
  {
LABEL_10:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_isNotificationsCollection = *((unsigned char *)v4 + 275);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x100000) == 0)
  {
LABEL_11:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_isSharingInvitation = *((unsigned char *)v4 + 279);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x200000) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_isSubscribed = *((unsigned char *)v4 + 280);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_isHolidayCalendar = *((unsigned char *)v4 + 270);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_isFamilyCalendar = *((unsigned char *)v4 + 268);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_isIgnoringEventAlerts = *((unsigned char *)v4 + 271);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_isIgnoringSharedCalendarNotifications = *((unsigned char *)v4 + 272);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 71);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_97:
  self->_isSchedulingProhibited = *((unsigned char *)v4 + 278);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)v4 + 71) & 0x100) != 0)
  {
LABEL_18:
    self->_isDefaultCalendarForStore = *((unsigned char *)v4 + 267);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_19:
  if (*((void *)v4 + 31))
  {
    -[NEKPBCalendarAttributes setType:](self, "setType:");
    id v4 = v9;
  }
  if (*((void *)v4 + 6))
  {
    -[NEKPBCalendarAttributes setDigest:](self, "setDigest:");
    id v4 = v9;
  }
  if (*((void *)v4 + 28))
  {
    -[NEKPBCalendarAttributes setSymbolicColorName:](self, "setSymbolicColorName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 5))
  {
    -[NEKPBCalendarAttributes setColorString:](self, "setColorString:");
    id v4 = v9;
  }
  int v6 = *((_DWORD *)v4 + 71);
  if ((v6 & 0x10) != 0)
  {
    self->_displayOrder = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x10u;
    int v6 = *((_DWORD *)v4 + 71);
  }
  if ((v6 & 4) != 0)
  {
    self->_sharingStatus = *((void *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 26))
  {
    -[NEKPBCalendarAttributes setSharedOwnerName:](self, "setSharedOwnerName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 25))
  {
    -[NEKPBCalendarAttributes setSharedOwnerAddress:](self, "setSharedOwnerAddress:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 284) & 2) != 0)
  {
    self->_sharingInvitationResponse = *((void *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 18))
  {
    -[NEKPBCalendarAttributes setPublishedURLString:](self, "setPublishedURLString:");
    id v4 = v9;
  }
  int v7 = *((_DWORD *)v4 + 71);
  if ((v7 & 0x20) != 0)
  {
    self->_canBePublished = *((unsigned char *)v4 + 264);
    *(_DWORD *)&self->_has |= 0x20u;
    int v7 = *((_DWORD *)v4 + 71);
    if ((v7 & 0x40) == 0)
    {
LABEL_41:
      if ((v7 & 0x20000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_41;
  }
  self->_canBeShared = *((unsigned char *)v4 + 265);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v4 + 71) & 0x20000) != 0)
  {
LABEL_42:
    self->_isPublished = *((unsigned char *)v4 + 276);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_43:
  if (*((void *)v4 + 8))
  {
    -[NEKPBCalendarAttributes setExternalID:](self, "setExternalID:");
    id v4 = v9;
  }
  if (*((void *)v4 + 9))
  {
    -[NEKPBCalendarAttributes setExternalIdentificationTag:](self, "setExternalIdentificationTag:");
    id v4 = v9;
  }
  if (*((void *)v4 + 29))
  {
    -[NEKPBCalendarAttributes setSyncToken:](self, "setSyncToken:");
    id v4 = v9;
  }
  if (*((void *)v4 + 10))
  {
    -[NEKPBCalendarAttributes setExternalModificationTag:](self, "setExternalModificationTag:");
    id v4 = v9;
  }
  if (*((void *)v4 + 11))
  {
    -[NEKPBCalendarAttributes setExternalRepresentation:](self, "setExternalRepresentation:");
    id v4 = v9;
  }
  int v8 = *((_DWORD *)v4 + 71);
  if ((v8 & 8) != 0)
  {
    self->_supportedEntityTypes = *((void *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    int v8 = *((_DWORD *)v4 + 71);
    if ((v8 & 1) == 0)
    {
LABEL_55:
      if ((v8 & 0x80) == 0) {
        goto LABEL_57;
      }
      goto LABEL_56;
    }
  }
  else if ((v8 & 1) == 0)
  {
    goto LABEL_55;
  }
  self->_invitationStatus = *((void *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v4 + 71) & 0x80) != 0)
  {
LABEL_56:
    self->_hasBeenAlerted = *((unsigned char *)v4 + 266);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_57:
  if (*((void *)v4 + 12))
  {
    -[NEKPBCalendarAttributes setNotes:](self, "setNotes:");
    id v4 = v9;
  }
  if (*((void *)v4 + 27))
  {
    -[NEKPBCalendarAttributes setSubCalAccountID:](self, "setSubCalAccountID:");
    id v4 = v9;
  }
  if (*((void *)v4 + 19))
  {
    -[NEKPBCalendarAttributes setPushKey:](self, "setPushKey:");
    id v4 = v9;
  }
  if (*((void *)v4 + 21))
  {
    -[NEKPBCalendarAttributes setSelfIdentityDisplayName:](self, "setSelfIdentityDisplayName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 22))
  {
    -[NEKPBCalendarAttributes setSelfIdentityEmail:](self, "setSelfIdentityEmail:");
    id v4 = v9;
  }
  if (*((void *)v4 + 20))
  {
    -[NEKPBCalendarAttributes setSelfIdentityAddressString:](self, "setSelfIdentityAddressString:");
    id v4 = v9;
  }
  if (*((void *)v4 + 23))
  {
    -[NEKPBCalendarAttributes setSelfIdentityFirstName:](self, "setSelfIdentityFirstName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 24))
  {
    -[NEKPBCalendarAttributes setSelfIdentityLastName:](self, "setSelfIdentityLastName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 14))
  {
    -[NEKPBCalendarAttributes setOwnerIdentityDisplayName:](self, "setOwnerIdentityDisplayName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 15))
  {
    -[NEKPBCalendarAttributes setOwnerIdentityEmail:](self, "setOwnerIdentityEmail:");
    id v4 = v9;
  }
  if (*((void *)v4 + 13))
  {
    -[NEKPBCalendarAttributes setOwnerIdentityAddressString:](self, "setOwnerIdentityAddressString:");
    id v4 = v9;
  }
  if (*((void *)v4 + 16))
  {
    -[NEKPBCalendarAttributes setOwnerIdentityFirstName:](self, "setOwnerIdentityFirstName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 17))
  {
    -[NEKPBCalendarAttributes setOwnerIdentityLastName:](self, "setOwnerIdentityLastName:");
    id v4 = v9;
  }
}

- (NSString)uUID
{
  return self->_uUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isReadonly
{
  return self->_isReadonly;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (BOOL)isImmutable
{
  return self->_isImmutable;
}

- (BOOL)isInbox
{
  return self->_isInbox;
}

- (BOOL)isNotificationsCollection
{
  return self->_isNotificationsCollection;
}

- (BOOL)isSharingInvitation
{
  return self->_isSharingInvitation;
}

- (BOOL)isSubscribed
{
  return self->_isSubscribed;
}

- (BOOL)isHolidayCalendar
{
  return self->_isHolidayCalendar;
}

- (BOOL)isFamilyCalendar
{
  return self->_isFamilyCalendar;
}

- (BOOL)isIgnoringEventAlerts
{
  return self->_isIgnoringEventAlerts;
}

- (BOOL)isIgnoringSharedCalendarNotifications
{
  return self->_isIgnoringSharedCalendarNotifications;
}

- (BOOL)isSchedulingProhibited
{
  return self->_isSchedulingProhibited;
}

- (BOOL)isDefaultCalendarForStore
{
  return self->_isDefaultCalendarForStore;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSData)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
}

- (NSString)symbolicColorName
{
  return self->_symbolicColorName;
}

- (void)setSymbolicColorName:(id)a3
{
}

- (NSString)colorString
{
  return self->_colorString;
}

- (void)setColorString:(id)a3
{
}

- (int)displayOrder
{
  return self->_displayOrder;
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (NSString)sharedOwnerName
{
  return self->_sharedOwnerName;
}

- (void)setSharedOwnerName:(id)a3
{
}

- (NSString)sharedOwnerAddress
{
  return self->_sharedOwnerAddress;
}

- (void)setSharedOwnerAddress:(id)a3
{
}

- (unint64_t)sharingInvitationResponse
{
  return self->_sharingInvitationResponse;
}

- (NSString)publishedURLString
{
  return self->_publishedURLString;
}

- (void)setPublishedURLString:(id)a3
{
}

- (BOOL)canBePublished
{
  return self->_canBePublished;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (BOOL)isPublished
{
  return self->_isPublished;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (NSString)externalIdentificationTag
{
  return self->_externalIdentificationTag;
}

- (void)setExternalIdentificationTag:(id)a3
{
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSData)externalRepresentation
{
  return self->_externalRepresentation;
}

- (void)setExternalRepresentation:(id)a3
{
}

- (unint64_t)supportedEntityTypes
{
  return self->_supportedEntityTypes;
}

- (unint64_t)invitationStatus
{
  return self->_invitationStatus;
}

- (BOOL)hasBeenAlerted
{
  return self->_hasBeenAlerted;
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSString)subCalAccountID
{
  return self->_subCalAccountID;
}

- (void)setSubCalAccountID:(id)a3
{
}

- (NSString)pushKey
{
  return self->_pushKey;
}

- (void)setPushKey:(id)a3
{
}

- (NSString)selfIdentityDisplayName
{
  return self->_selfIdentityDisplayName;
}

- (void)setSelfIdentityDisplayName:(id)a3
{
}

- (NSString)selfIdentityEmail
{
  return self->_selfIdentityEmail;
}

- (void)setSelfIdentityEmail:(id)a3
{
}

- (NSString)selfIdentityAddressString
{
  return self->_selfIdentityAddressString;
}

- (void)setSelfIdentityAddressString:(id)a3
{
}

- (NSString)selfIdentityFirstName
{
  return self->_selfIdentityFirstName;
}

- (void)setSelfIdentityFirstName:(id)a3
{
}

- (NSString)selfIdentityLastName
{
  return self->_selfIdentityLastName;
}

- (void)setSelfIdentityLastName:(id)a3
{
}

- (NSString)ownerIdentityDisplayName
{
  return self->_ownerIdentityDisplayName;
}

- (void)setOwnerIdentityDisplayName:(id)a3
{
}

- (NSString)ownerIdentityEmail
{
  return self->_ownerIdentityEmail;
}

- (void)setOwnerIdentityEmail:(id)a3
{
}

- (NSString)ownerIdentityAddressString
{
  return self->_ownerIdentityAddressString;
}

- (void)setOwnerIdentityAddressString:(id)a3
{
}

- (NSString)ownerIdentityFirstName
{
  return self->_ownerIdentityFirstName;
}

- (void)setOwnerIdentityFirstName:(id)a3
{
}

- (NSString)ownerIdentityLastName
{
  return self->_ownerIdentityLastName;
}

- (void)setOwnerIdentityLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_symbolicColorName, 0);
  objc_storeStrong((id *)&self->_subCalAccountID, 0);
  objc_storeStrong((id *)&self->_sharedOwnerName, 0);
  objc_storeStrong((id *)&self->_sharedOwnerAddress, 0);
  objc_storeStrong((id *)&self->_selfIdentityLastName, 0);
  objc_storeStrong((id *)&self->_selfIdentityFirstName, 0);
  objc_storeStrong((id *)&self->_selfIdentityEmail, 0);
  objc_storeStrong((id *)&self->_selfIdentityDisplayName, 0);
  objc_storeStrong((id *)&self->_selfIdentityAddressString, 0);
  objc_storeStrong((id *)&self->_pushKey, 0);
  objc_storeStrong((id *)&self->_publishedURLString, 0);
  objc_storeStrong((id *)&self->_ownerIdentityLastName, 0);
  objc_storeStrong((id *)&self->_ownerIdentityFirstName, 0);
  objc_storeStrong((id *)&self->_ownerIdentityEmail, 0);
  objc_storeStrong((id *)&self->_ownerIdentityDisplayName, 0);
  objc_storeStrong((id *)&self->_ownerIdentityAddressString, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_externalRepresentation, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalIdentificationTag, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_digest, 0);

  objc_storeStrong((id *)&self->_colorString, 0);
}

@end