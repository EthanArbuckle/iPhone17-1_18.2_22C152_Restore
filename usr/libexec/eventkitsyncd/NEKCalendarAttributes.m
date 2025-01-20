@interface NEKCalendarAttributes
+ (BOOL)configureList:(id)a3 listChangeItemProvider:(id)a4 withAttributes:(id)a5;
+ (BOOL)configureList:(id)a3 withSaveRequest:(id)a4 withAttributes:(id)a5;
+ (id)createListInAccount:(id)a3 withSaveRequest:(id)a4 withAttributes:(id)a5;
+ (void)configureCalendar:(id)a3 inDatabase:(id)a4 withAttributes:(id)a5;
- (BOOL)canBePublished;
- (BOOL)canBeShared;
- (BOOL)didCalendarChange:(id)a3;
- (BOOL)hasBeenAlerted;
- (BOOL)isDefaultCalendarForStore;
- (BOOL)isFamilyCalendar;
- (BOOL)isHidden;
- (BOOL)isHolidyCalendar;
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
- (NEKCalendarAttributes)initWithCalendar:(id)a3;
- (NEKCalendarAttributes)initWithList:(id)a3;
- (NSData)digest;
- (NSData)externalRepresentation;
- (NSString)UUID;
- (NSString)colorString;
- (NSString)externalID;
- (NSString)externalIdentificationTag;
- (NSString)externalModificationTag;
- (NSString)notes;
- (NSString)ownerIdentityDisplayName;
- (NSString)ownerIdentityEmail;
- (NSString)ownerIdentityFirstName;
- (NSString)ownerIdentityLastName;
- (NSString)pushKey;
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
- (NSURL)ownerIdentityAddress;
- (NSURL)publishedURL;
- (NSURL)selfIdentityAddress;
- (int)displayOrder;
- (int)supportedEntityTypes;
- (unint64_t)invitationStatus;
- (unint64_t)sharingInvitationResponse;
- (unint64_t)sharingStatus;
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
- (void)setInvitationStatus:(unint64_t)a3;
- (void)setIsDefaultCalendarForStore:(BOOL)a3;
- (void)setIsFamilyCalendar:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsHolidyCalendar:(BOOL)a3;
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
- (void)setOwnerIdentityAddress:(id)a3;
- (void)setOwnerIdentityDisplayName:(id)a3;
- (void)setOwnerIdentityEmail:(id)a3;
- (void)setOwnerIdentityFirstName:(id)a3;
- (void)setOwnerIdentityLastName:(id)a3;
- (void)setPublishedURL:(id)a3;
- (void)setPushKey:(id)a3;
- (void)setSelfIdentityAddress:(id)a3;
- (void)setSelfIdentityDisplayName:(id)a3;
- (void)setSelfIdentityEmail:(id)a3;
- (void)setSelfIdentityFirstName:(id)a3;
- (void)setSelfIdentityLastName:(id)a3;
- (void)setSharedOwnerAddress:(id)a3;
- (void)setSharedOwnerName:(id)a3;
- (void)setSharingInvitationResponse:(unint64_t)a3;
- (void)setSharingStatus:(unint64_t)a3;
- (void)setSubCalAccountID:(id)a3;
- (void)setSupportedEntityTypes:(int)a3;
- (void)setSymbolicColorName:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation NEKCalendarAttributes

- (NSString)UUID
{
  return self->_UUID;
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

- (void)setIsReadonly:(BOOL)a3
{
  self->_isReadonly = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isImmutable
{
  return self->_isImmutable;
}

- (void)setIsImmutable:(BOOL)a3
{
  self->_isImmutable = a3;
}

- (BOOL)isInbox
{
  return self->_isInbox;
}

- (void)setIsInbox:(BOOL)a3
{
  self->_isInbox = a3;
}

- (BOOL)isNotificationsCollection
{
  return self->_isNotificationsCollection;
}

- (void)setIsNotificationsCollection:(BOOL)a3
{
  self->_isNotificationsCollection = a3;
}

- (BOOL)isSharingInvitation
{
  return self->_isSharingInvitation;
}

- (void)setIsSharingInvitation:(BOOL)a3
{
  self->_isSharingInvitation = a3;
}

- (BOOL)isSubscribed
{
  return self->_isSubscribed;
}

- (void)setIsSubscribed:(BOOL)a3
{
  self->_isSubscribed = a3;
}

- (BOOL)isHolidyCalendar
{
  return self->_isHolidyCalendar;
}

- (void)setIsHolidyCalendar:(BOOL)a3
{
  self->_isHolidyCalendar = a3;
}

- (BOOL)isFamilyCalendar
{
  return self->_isFamilyCalendar;
}

- (void)setIsFamilyCalendar:(BOOL)a3
{
  self->_isFamilyCalendar = a3;
}

- (BOOL)isIgnoringEventAlerts
{
  return self->_isIgnoringEventAlerts;
}

- (void)setIsIgnoringEventAlerts:(BOOL)a3
{
  self->_isIgnoringEventAlerts = a3;
}

- (BOOL)isIgnoringSharedCalendarNotifications
{
  return self->_isIgnoringSharedCalendarNotifications;
}

- (void)setIsIgnoringSharedCalendarNotifications:(BOOL)a3
{
  self->_isIgnoringSharedCalendarNotifications = a3;
}

- (BOOL)isSchedulingProhibited
{
  return self->_isSchedulingProhibited;
}

- (void)setIsSchedulingProhibited:(BOOL)a3
{
  self->_isSchedulingProhibited = a3;
}

- (BOOL)isDefaultCalendarForStore
{
  return self->_isDefaultCalendarForStore;
}

- (void)setIsDefaultCalendarForStore:(BOOL)a3
{
  self->_isDefaultCalendarForStore = a3;
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

- (void)setDisplayOrder:(int)a3
{
  self->_displayOrder = a3;
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (void)setSharingStatus:(unint64_t)a3
{
  self->_sharingStatus = a3;
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

- (void)setSharingInvitationResponse:(unint64_t)a3
{
  self->_sharingInvitationResponse = a3;
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)setPublishedURL:(id)a3
{
}

- (BOOL)canBePublished
{
  return self->_canBePublished;
}

- (void)setCanBePublished:(BOOL)a3
{
  self->_canBePublished = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (BOOL)isPublished
{
  return self->_isPublished;
}

- (void)setIsPublished:(BOOL)a3
{
  self->_isPublished = a3;
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

- (int)supportedEntityTypes
{
  return self->_supportedEntityTypes;
}

- (void)setSupportedEntityTypes:(int)a3
{
  self->_supportedEntityTypes = a3;
}

- (unint64_t)invitationStatus
{
  return self->_invitationStatus;
}

- (void)setInvitationStatus:(unint64_t)a3
{
  self->_invitationStatus = a3;
}

- (BOOL)hasBeenAlerted
{
  return self->_hasBeenAlerted;
}

- (void)setHasBeenAlerted:(BOOL)a3
{
  self->_hasBeenAlerted = a3;
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

- (NSURL)selfIdentityAddress
{
  return self->_selfIdentityAddress;
}

- (void)setSelfIdentityAddress:(id)a3
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

- (NSURL)ownerIdentityAddress
{
  return self->_ownerIdentityAddress;
}

- (void)setOwnerIdentityAddress:(id)a3
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
  objc_storeStrong((id *)&self->_ownerIdentityLastName, 0);
  objc_storeStrong((id *)&self->_ownerIdentityFirstName, 0);
  objc_storeStrong((id *)&self->_ownerIdentityAddress, 0);
  objc_storeStrong((id *)&self->_ownerIdentityEmail, 0);
  objc_storeStrong((id *)&self->_ownerIdentityDisplayName, 0);
  objc_storeStrong((id *)&self->_selfIdentityLastName, 0);
  objc_storeStrong((id *)&self->_selfIdentityFirstName, 0);
  objc_storeStrong((id *)&self->_selfIdentityAddress, 0);
  objc_storeStrong((id *)&self->_selfIdentityEmail, 0);
  objc_storeStrong((id *)&self->_selfIdentityDisplayName, 0);
  objc_storeStrong((id *)&self->_pushKey, 0);
  objc_storeStrong((id *)&self->_subCalAccountID, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_externalRepresentation, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_externalIdentificationTag, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_publishedURL, 0);
  objc_storeStrong((id *)&self->_sharedOwnerAddress, 0);
  objc_storeStrong((id *)&self->_sharedOwnerName, 0);
  objc_storeStrong((id *)&self->_colorString, 0);
  objc_storeStrong((id *)&self->_symbolicColorName, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NEKCalendarAttributes)initWithList:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v25.receiver = self;
    v25.super_class = (Class)NEKCalendarAttributes;
    v5 = [(NEKCalendarAttributes *)&v25 init];
    if (v5)
    {
      v6 = [v4 objectID];
      v7 = [v6 uuid];
      v8 = [v7 UUIDString];
      [(NEKCalendarAttributes *)v5 setUUID:v8];

      v9 = [v4 name];
      [(NEKCalendarAttributes *)v5 setTitle:v9];

      -[NEKCalendarAttributes setIsReadonly:](v5, "setIsReadonly:", [v4 daIsReadOnly]);
      [(NEKCalendarAttributes *)v5 setIsHidden:0];
      -[NEKCalendarAttributes setIsImmutable:](v5, "setIsImmutable:", [v4 daIsImmutable]);
      [(NEKCalendarAttributes *)v5 setIsInbox:0];
      -[NEKCalendarAttributes setIsNotificationsCollection:](v5, "setIsNotificationsCollection:", [v4 daIsNotificationsCollection]);
      [(NEKCalendarAttributes *)v5 setIsSharingInvitation:0];
      [(NEKCalendarAttributes *)v5 setIsSubscribed:0];
      [(NEKCalendarAttributes *)v5 setIsHolidyCalendar:0];
      [(NEKCalendarAttributes *)v5 setIsFamilyCalendar:0];
      [(NEKCalendarAttributes *)v5 setIsIgnoringEventAlerts:0];
      [(NEKCalendarAttributes *)v5 setIsIgnoringSharedCalendarNotifications:0];
      [(NEKCalendarAttributes *)v5 setIsSchedulingProhibited:0];
      [(NEKCalendarAttributes *)v5 setIsDefaultCalendarForStore:0];
      [(NEKCalendarAttributes *)v5 setDigest:0];
      v10 = [v4 ekColor];
      v11 = [v10 daSymbolicColorName];
      [(NEKCalendarAttributes *)v5 setSymbolicColorName:v11];

      v12 = [v4 ekColor];
      v13 = [v12 daHexString];
      [(NEKCalendarAttributes *)v5 setColorString:v13];

      -[NEKCalendarAttributes setDisplayOrder:](v5, "setDisplayOrder:", [v4 daDisplayOrder]);
      id v14 = [v4 sharingStatus];
      if (v14 == (id)2) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = v14 == (id)1;
      }
      [(NEKCalendarAttributes *)v5 setSharingStatus:v15];
      v16 = [v4 sharedOwnerName];
      [(NEKCalendarAttributes *)v5 setSharedOwnerName:v16];

      v17 = [v4 sharedOwnerAddress];
      [(NEKCalendarAttributes *)v5 setSharedOwnerAddress:v17];

      [(NEKCalendarAttributes *)v5 setSharingInvitationResponse:0];
      [(NEKCalendarAttributes *)v5 setPublishedURL:0];
      [(NEKCalendarAttributes *)v5 setCanBePublished:0];
      -[NEKCalendarAttributes setCanBeShared:](v5, "setCanBeShared:", [v4 canBeShared]);
      [(NEKCalendarAttributes *)v5 setIsPublished:0];
      v18 = [v4 externalIdentifier];
      [(NEKCalendarAttributes *)v5 setExternalID:v18];

      v19 = [v4 daExternalIdentificationTag];
      [(NEKCalendarAttributes *)v5 setExternalIdentificationTag:v19];

      v20 = [v4 daSyncToken];
      [(NEKCalendarAttributes *)v5 setSyncToken:v20];

      v21 = [v4 externalModificationTag];
      [(NEKCalendarAttributes *)v5 setExternalModificationTag:v21];

      [(NEKCalendarAttributes *)v5 setExternalRepresentation:0];
      [(NEKCalendarAttributes *)v5 setSupportedEntityTypes:2];
      [(NEKCalendarAttributes *)v5 setInvitationStatus:0];
      [(NEKCalendarAttributes *)v5 setNotes:0];
      [(NEKCalendarAttributes *)v5 setSubCalAccountID:0];
      v22 = [v4 daPushKey];
      [(NEKCalendarAttributes *)v5 setPushKey:v22];

      [(NEKCalendarAttributes *)v5 setSelfIdentityDisplayName:0];
      [(NEKCalendarAttributes *)v5 setSelfIdentityEmail:0];
      [(NEKCalendarAttributes *)v5 setSelfIdentityAddress:0];
      [(NEKCalendarAttributes *)v5 setSelfIdentityFirstName:0];
      [(NEKCalendarAttributes *)v5 setSelfIdentityLastName:0];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityDisplayName:0];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityAddress:0];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityEmail:0];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityFirstName:0];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityLastName:0];
    }
    self = v5;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)createListInAccount:(id)a3 withSaveRequest:(id)a4 withAttributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 updateAccount:a3];
  v11 = [v8 UUID];
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
  if (!v12)
  {
    v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10006F57C((uint64_t)v11, v13);
    }
  }
  id v14 = +[REMList objectIDWithUUID:v12];
  uint64_t v15 = [v8 title];
  v16 = [v9 addListWithName:v15 toAccountChangeItem:v10 listObjectID:v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004C2BC;
  v19[3] = &unk_1000A9C20;
  id v17 = v16;
  id v20 = v17;
  [a1 configureList:0 listChangeItemProvider:v19 withAttributes:v8];

  return v17;
}

+ (BOOL)configureList:(id)a3 withSaveRequest:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004C398;
  v12[3] = &unk_1000A9C48;
  id v13 = a4;
  id v14 = v8;
  id v9 = v8;
  id v10 = v13;
  LOBYTE(a5) = [a1 configureList:v9 listChangeItemProvider:v12 withAttributes:a5];

  return (char)a5;
}

+ (BOOL)configureList:(id)a3 listChangeItemProvider:(id)a4 withAttributes:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id))a4;
  id v9 = a5;
  uint64_t v10 = [v9 UUID];
  v11 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v210 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting configuration of list with UUID: [%{public}@].", buf, 0xCu);
  }

  id v12 = [v7 objectID];
  id v13 = [v12 uuid];
  id v14 = [v13 UUIDString];

  uint64_t v15 = [v9 UUID];
  v16 = (void *)v15;
  if (v14)
  {
    if ([v14 isEqualToString:v15]) {
      goto LABEL_10;
    }
  }
  else if (!v15)
  {
    goto LABEL_10;
  }
  id v17 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v14;
    __int16 v211 = 2112;
    *(void *)v212 = v16;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'UUID' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_10:
  v18 = [v7 name];
  uint64_t v19 = [v9 title];
  uint64_t v20 = v19;
  v184 = v16;
  v185 = v14;
  if (v18)
  {
    if ([v18 isEqualToString:v19])
    {
LABEL_12:
      v208 = 0;
      goto LABEL_17;
    }
  }
  else if (!v19)
  {
    goto LABEL_12;
  }
  v8[2](v8);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  v208 = v21;
  [v21 setName:v20];
  v22 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v18;
    __int16 v211 = 2112;
    *(void *)v212 = v20;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v10;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "List's 'title' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_17:
  id v23 = [v7 daIsReadOnly];
  id v24 = [v9 isReadonly];
  if (v23 != v24)
  {
    id v25 = v24;
    v26 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = +[NSNumber numberWithBool:v23];
      v28 = +[NSNumber numberWithBool:v25];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v27;
      __int16 v211 = 2112;
      *(void *)v212 = v28;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isReadOnly' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isHidden])
  {
    v29 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = +[NSNumber numberWithBool:0];
      v31 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v30;
      __int16 v211 = 2112;
      *(void *)v212 = v31;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isHidden' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  id v32 = [v7 daIsImmutable];
  id v33 = [v9 isImmutable];
  if (v32 != v33)
  {
    id v34 = v33;
    v35 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = +[NSNumber numberWithBool:v32];
      v37 = +[NSNumber numberWithBool:v34];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v36;
      __int16 v211 = 2112;
      *(void *)v212 = v37;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isImmutable' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isInbox])
  {
    v38 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = +[NSNumber numberWithBool:0];
      v40 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v39;
      __int16 v211 = 2112;
      *(void *)v212 = v40;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isInbox' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  id v41 = [v7 daIsNotificationsCollection];
  id v42 = [v9 isNotificationsCollection];
  if (v41 != v42)
  {
    id v43 = v42;
    v44 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = +[NSNumber numberWithBool:v41];
      v46 = +[NSNumber numberWithBool:v43];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v45;
      __int16 v211 = 2112;
      *(void *)v212 = v46;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isNotificationsCollection' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isSharingInvitation])
  {
    v47 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = +[NSNumber numberWithBool:0];
      v49 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v48;
      __int16 v211 = 2112;
      *(void *)v212 = v49;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isSharingInvitation' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isSubscribed])
  {
    v50 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = +[NSNumber numberWithBool:0];
      v52 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v51;
      __int16 v211 = 2112;
      *(void *)v212 = v52;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isSubscribed' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isHolidyCalendar])
  {
    v53 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = +[NSNumber numberWithBool:0];
      v55 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v54;
      __int16 v211 = 2112;
      *(void *)v212 = v55;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isHolidayCalendar' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isFamilyCalendar])
  {
    v56 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = +[NSNumber numberWithBool:0];
      v58 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v57;
      __int16 v211 = 2112;
      *(void *)v212 = v58;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isFamilyCalendar' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isIgnoringEventAlerts])
  {
    v59 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = +[NSNumber numberWithBool:0];
      v61 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v60;
      __int16 v211 = 2112;
      *(void *)v212 = v61;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isIgnoringEventAlerts' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isIgnoringSharedCalendarNotifications])
  {
    v62 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = +[NSNumber numberWithBool:0];
      v64 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v63;
      __int16 v211 = 2112;
      *(void *)v212 = v64;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isIgnoringSharedCalendarNotifications' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v9 isSchedulingProhibited])
  {
    v65 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = +[NSNumber numberWithBool:0];
      v67 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v66;
      __int16 v211 = 2112;
      *(void *)v212 = v67;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isSchedulingProhibited' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  id v205 = v9;
  if ([v9 isDefaultCalendarForStore])
  {
    v68 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = +[NSNumber numberWithBool:0];
      v70 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v69;
      __int16 v211 = 2112;
      *(void *)v212 = v70;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isDefaultCalendarForStore' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v207 = v7;
  uint64_t v71 = [v9 digest];
  if (v71)
  {
    v72 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v71;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'digest' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v181 = (void *)v71;
  uint64_t v73 = v10;
  v74 = v18;
  v75 = (void *)v20;
  v76 = v8;
  v77 = [v207 ekColor];
  v78 = [v77 daSymbolicColorName];

  uint64_t v79 = [v9 symbolicColorName];
  v80 = [v207 ekColor];
  v204 = [v80 daHexString];

  uint64_t v81 = [v9 colorString];
  v182 = v75;
  v203 = (void *)v79;
  if (v78)
  {
    v82 = v78;
    unsigned __int8 v83 = [v78 isEqualToString:v79];
    uint64_t v84 = v79;
    v85 = v76;
    v86 = v74;
    v87 = (void *)v73;
    v89 = v205;
    v88 = v207;
    if ((v83 & 1) == 0) {
      goto LABEL_81;
    }
  }
  else
  {
    v82 = 0;
    uint64_t v84 = v79;
    v85 = v76;
    v86 = v74;
    v87 = (void *)v73;
    v89 = v205;
    v88 = v207;
    if (v84) {
      goto LABEL_81;
    }
  }
  if (v204)
  {
    if ([v204 isEqualToString:v81]) {
      goto LABEL_87;
    }
  }
  else if (!v81)
  {
    goto LABEL_87;
  }
LABEL_81:
  if (v208)
  {
    id v90 = v208;
  }
  else
  {
    v85[2](v85);
    id v90 = (id)objc_claimAutoreleasedReturnValue();
  }
  v91 = v90;

  id v92 = [objc_alloc((Class)REMColor) initWithDASymbolicColorName:v84 daHexString:v81];
  v208 = v91;
  [v91 setColor:v92];

  v93 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    uint64_t v210 = (uint64_t)v82;
    __int16 v211 = 2112;
    *(void *)v212 = v204;
    *(_WORD *)&v212[8] = 2112;
    *(void *)&v212[10] = v203;
    __int16 v213 = 2112;
    uint64_t v214 = v81;
    __int16 v215 = 2114;
    v216 = v87;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "List's 'symbolicColorName/colorString' has changed from [%@/%@] to [%@/%@].  List's UUID: [%{public}@]", buf, 0x34u);
  }

LABEL_87:
  id v94 = [v88 daDisplayOrder];
  unsigned int v95 = [v89 displayOrder];
  v179 = (void *)v81;
  v180 = v82;
  if (v94 != (id)(int)v95)
  {
    unsigned int v96 = v95;
    if (v208)
    {
      id v97 = v208;
    }
    else
    {
      v85[2](v85);
      id v97 = (id)objc_claimAutoreleasedReturnValue();
    }
    v98 = v97;

    v208 = v98;
    [v98 setDaDisplayOrder:(int)[v89 displayOrder]];
    v99 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v210 = (uint64_t)v94;
      __int16 v211 = 1024;
      *(_DWORD *)v212 = v96;
      *(_WORD *)&v212[4] = 2114;
      *(void *)&v212[6] = v87;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "List's 'displayOrder' has changed from %ld to %d.  List's UUID: [%{public}@]", buf, 0x1Cu);
    }
  }
  id v100 = [v88 sharingStatus];
  id v101 = [v89 sharingStatus];
  if (v101 == (id)2) {
    uint64_t v102 = 2;
  }
  else {
    uint64_t v102 = v101 == (id)1;
  }
  if (v100 != (id)v102)
  {
    v103 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      v104 = +[NSNumber numberWithInteger:v100];
      v105 = +[NSNumber numberWithInteger:v102];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v104;
      __int16 v211 = 2112;
      *(void *)v212 = v105;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'sharingStatus' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v106 = [v88 sharedOwnerName];
  uint64_t v107 = [v89 sharedOwnerName];
  v108 = (void *)v107;
  if (v106)
  {
    if ([v106 isEqualToString:v107]) {
      goto LABEL_108;
    }
  }
  else if (!v107)
  {
    goto LABEL_108;
  }
  v109 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v106;
    __int16 v211 = 2112;
    *(void *)v212 = v108;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'sharedOwnerName' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_108:
  v110 = [v88 sharedOwnerAddress];
  uint64_t v111 = [v89 sharedOwnerAddress];
  v196 = (void *)v111;
  v197 = v110;
  if (v110)
  {
    if ([v110 isEqualToString:v111]) {
      goto LABEL_115;
    }
  }
  else if (!v111)
  {
    goto LABEL_115;
  }
  v112 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v197;
    __int16 v211 = 2112;
    *(void *)v212 = v196;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'sharedOwnerAddress' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_115:
  v178 = v106;
  id v113 = [v89 sharingInvitationResponse];
  if (v113)
  {
    id v114 = v113;
    v115 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      v116 = +[NSNumber numberWithUnsignedInteger:0];
      v117 = +[NSNumber numberWithUnsignedInteger:v114];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v116;
      __int16 v211 = 2112;
      *(void *)v212 = v117;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'sharingInvitationResponse' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v202 = [v89 publishedURL];
  if (v202)
  {
    v118 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v202;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'publishedURL' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v89 canBePublished])
  {
    v119 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      v120 = +[NSNumber numberWithBool:0];
      v121 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v120;
      __int16 v211 = 2112;
      *(void *)v212 = v121;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'canBePublished' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  id v122 = [v88 canBeShared];
  id v123 = [v89 canBeShared];
  if (v122 != v123)
  {
    id v124 = v123;
    v125 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = +[NSNumber numberWithBool:v122];
      v127 = +[NSNumber numberWithBool:v124];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v126;
      __int16 v211 = 2112;
      *(void *)v212 = v127;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'canBeShared' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v89 isPublished])
  {
    v128 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      v129 = +[NSNumber numberWithBool:0];
      v130 = +[NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v129;
      __int16 v211 = 2112;
      *(void *)v212 = v130;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'isPublished' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v131 = [v88 externalIdentifier];
  uint64_t v132 = [v89 externalID];
  v195 = (void *)v132;
  if (v131)
  {
    if ([v131 isEqualToString:v132]) {
      goto LABEL_142;
    }
  }
  else if (!v132)
  {
    goto LABEL_142;
  }
  v133 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v131;
    __int16 v211 = 2112;
    *(void *)v212 = v195;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'externalID' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_142:
  v134 = [v88 daExternalIdentificationTag];
  uint64_t v135 = [v89 externalIdentificationTag];
  v193 = (void *)v135;
  v194 = v134;
  if (v134)
  {
    if ([v134 isEqualToString:v135]) {
      goto LABEL_149;
    }
  }
  else if (!v135)
  {
    goto LABEL_149;
  }
  v136 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v194;
    __int16 v211 = 2112;
    *(void *)v212 = v193;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'externalIdentificationTag' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_149:
  v137 = [v88 daSyncToken];
  uint64_t v138 = [v89 syncToken];
  v191 = (void *)v138;
  v192 = v137;
  if (v137)
  {
    if ([v137 isEqualToString:v138]) {
      goto LABEL_156;
    }
  }
  else if (!v138)
  {
    goto LABEL_156;
  }
  v139 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v192;
    __int16 v211 = 2112;
    *(void *)v212 = v191;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'daSyncToken' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_156:
  v140 = [v88 externalModificationTag];
  uint64_t v141 = [v89 externalModificationTag];
  v189 = (void *)v141;
  v190 = v140;
  if (v140)
  {
    if ([v140 isEqualToString:v141]) {
      goto LABEL_163;
    }
  }
  else if (!v141)
  {
    goto LABEL_163;
  }
  v142 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v190;
    __int16 v211 = 2112;
    *(void *)v212 = v189;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'externalModificationTag' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_163:
  v201 = [v89 externalRepresentation];
  if (v201)
  {
    v143 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v201;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'externalRepresentation' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v176 = v131;
  id v144 = [v89 invitationStatus];
  if (v144)
  {
    id v145 = v144;
    v146 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
    {
      v147 = +[NSNumber numberWithUnsignedInteger:0];
      v148 = +[NSNumber numberWithUnsignedInteger:v145];
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = (uint64_t)v147;
      __int16 v211 = 2112;
      *(void *)v212 = v148;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'invitationStatus' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v149 = [v89 notes];
  if (v149)
  {
    v150 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v149;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'notes' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  uint64_t v151 = [v89 subCalAccountID];
  if (v151)
  {
    v152 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v151;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'subCalAccountID' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v153 = [v88 daPushKey];
  uint64_t v154 = [v89 pushKey];
  v187 = (void *)v154;
  v188 = v153;
  if (v153)
  {
    if ([v153 isEqualToString:v154]) {
      goto LABEL_186;
    }
  }
  else if (!v154)
  {
    goto LABEL_186;
  }
  v155 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v210 = (uint64_t)v188;
    __int16 v211 = 2112;
    *(void *)v212 = v187;
    *(_WORD *)&v212[8] = 2114;
    *(void *)&v212[10] = v87;
    _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'pushKey' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
  }

LABEL_186:
  v200 = [v89 selfIdentityDisplayName];
  if (v200)
  {
    v156 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v200;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'selfIdentityDisplayName' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v199 = [v89 selfIdentityEmail];
  if (v199)
  {
    v157 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v199;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'selfIdentityEmail' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v198 = [v89 selfIdentityAddress];
  if (v198)
  {
    v158 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v198;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'selfIdentityAddress' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v159 = [v89 selfIdentityFirstName];
  if (v159)
  {
    v160 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v159;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'selfIdentityFirstName' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v177 = v108;
  v183 = v86;
  v161 = [v89 selfIdentityLastName];
  if (v161)
  {
    v162 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v161;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'selfIdentityLastName' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v175 = (void *)v151;
  v163 = [v89 ownerIdentityDisplayName];
  if (v163)
  {
    v164 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v163;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'ownerIdentityDisplayName' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v165 = [v89 ownerIdentityEmail];
  if (v165)
  {
    v166 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v165;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'ownerIdentityEmail' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v167 = [v89 ownerIdentityAddress];
  if (v167)
  {
    v168 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v167;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'ownerIdentityAddress' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v186 = v85;
  v169 = [v89 ownerIdentityFirstName];
  if (v169)
  {
    v170 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v169;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v87;
      _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'ownerIdentityFirstName' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v206 = v87;
  v171 = [v89 ownerIdentityLastName];
  if (v171)
  {
    v172 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v210 = 0;
      __int16 v211 = 2112;
      *(void *)v212 = v171;
      *(_WORD *)&v212[8] = 2114;
      *(void *)&v212[10] = v206;
      _os_log_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: List's 'ownerIdentityLastName' has changed from [%@] to [%@].  List's UUID: [%{public}@]", buf, 0x20u);
    }
  }
  v173 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v210 = (uint64_t)v206;
    _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "Completed configuration of list with UUID: [%{public}@].", buf, 0xCu);
  }

  return v208 != 0;
}

- (NEKCalendarAttributes)initWithCalendar:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v35.receiver = self;
    v35.super_class = (Class)NEKCalendarAttributes;
    v5 = [(NEKCalendarAttributes *)&v35 init];
    if (v5)
    {
      v6 = [v4 calendarIdentifier];
      [(NEKCalendarAttributes *)v5 setUUID:v6];

      id v7 = [v4 title];
      [(NEKCalendarAttributes *)v5 setTitle:v7];

      -[NEKCalendarAttributes setIsReadonly:](v5, "setIsReadonly:", [v4 readOnly]);
      -[NEKCalendarAttributes setIsHidden:](v5, "setIsHidden:", [v4 isHidden]);
      -[NEKCalendarAttributes setIsImmutable:](v5, "setIsImmutable:", [v4 isImmutableRaw]);
      -[NEKCalendarAttributes setIsInbox:](v5, "setIsInbox:", [v4 isInbox]);
      -[NEKCalendarAttributes setIsNotificationsCollection:](v5, "setIsNotificationsCollection:", [v4 isNotificationsCollection]);
      -[NEKCalendarAttributes setIsSharingInvitation:](v5, "setIsSharingInvitation:", [v4 isSharingInvitation]);
      -[NEKCalendarAttributes setIsSubscribed:](v5, "setIsSubscribed:", [v4 isSubscribed]);
      -[NEKCalendarAttributes setIsHolidyCalendar:](v5, "setIsHolidyCalendar:", [v4 isSubscribedHolidayCalendar]);
      -[NEKCalendarAttributes setIsFamilyCalendar:](v5, "setIsFamilyCalendar:", [v4 isFamilyCalendar]);
      -[NEKCalendarAttributes setIsIgnoringEventAlerts:](v5, "setIsIgnoringEventAlerts:", [v4 isIgnoringEventAlerts]);
      -[NEKCalendarAttributes setIsIgnoringSharedCalendarNotifications:](v5, "setIsIgnoringSharedCalendarNotifications:", [v4 isIgnoringSharedCalendarNotifications]);
      -[NEKCalendarAttributes setIsSchedulingProhibited:](v5, "setIsSchedulingProhibited:", [v4 allowsScheduling] ^ 1);
      -[NEKCalendarAttributes setIsDefaultCalendarForStore:](v5, "setIsDefaultCalendarForStore:", [v4 isDefaultSchedulingCalendar]);
      id v8 = [v4 digest];
      [(NEKCalendarAttributes *)v5 setDigest:v8];

      id v9 = [v4 symbolicColorName];
      [(NEKCalendarAttributes *)v5 setSymbolicColorName:v9];

      uint64_t v10 = [v4 colorString];
      [(NEKCalendarAttributes *)v5 setColorString:v10];

      -[NEKCalendarAttributes setDisplayOrder:](v5, "setDisplayOrder:", [v4 displayOrder]);
      -[NEKCalendarAttributes setSharingStatus:](v5, "setSharingStatus:", [v4 sharingStatus]);
      v11 = [v4 sharedOwnerName];
      [(NEKCalendarAttributes *)v5 setSharedOwnerName:v11];

      id v12 = [v4 sharedOwnerAddress];
      [(NEKCalendarAttributes *)v5 setSharedOwnerAddress:v12];

      -[NEKCalendarAttributes setSharingInvitationResponse:](v5, "setSharingInvitationResponse:", [v4 sharingInvitationResponse]);
      id v13 = [v4 publishURL];
      [(NEKCalendarAttributes *)v5 setPublishedURL:v13];

      -[NEKCalendarAttributes setCanBePublished:](v5, "setCanBePublished:", [v4 canBePublished]);
      -[NEKCalendarAttributes setCanBeShared:](v5, "setCanBeShared:", [v4 canBeShared]);
      -[NEKCalendarAttributes setIsPublished:](v5, "setIsPublished:", [v4 isPublished]);
      id v14 = [v4 externalID];
      [(NEKCalendarAttributes *)v5 setExternalID:v14];

      uint64_t v15 = [v4 externalIDTag];
      [(NEKCalendarAttributes *)v5 setExternalIdentificationTag:v15];

      v16 = [v4 syncToken];
      [(NEKCalendarAttributes *)v5 setSyncToken:v16];

      id v17 = [v4 externalModificationTag];
      [(NEKCalendarAttributes *)v5 setExternalModificationTag:v17];

      v18 = [v4 externalRepresentation];
      [(NEKCalendarAttributes *)v5 setExternalRepresentation:v18];

      if ([v4 allowEvents]) {
        [(NEKCalendarAttributes *)v5 setSupportedEntityTypes:[(NEKCalendarAttributes *)v5 supportedEntityTypes] | 1];
      }
      if ([v4 allowReminders]) {
        [(NEKCalendarAttributes *)v5 setSupportedEntityTypes:[(NEKCalendarAttributes *)v5 supportedEntityTypes] | 2];
      }
      if (![(NEKCalendarAttributes *)v5 supportedEntityTypes])
      {
        uint64_t v19 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10006F608(v19, v4);
        }
      }
      -[NEKCalendarAttributes setInvitationStatus:](v5, "setInvitationStatus:", [v4 invitationStatus]);
      uint64_t v20 = [v4 notes];
      [(NEKCalendarAttributes *)v5 setNotes:v20];

      id v21 = [v4 subcalAccountID];
      [(NEKCalendarAttributes *)v5 setSubCalAccountID:v21];

      v22 = [v4 pushKey];
      [(NEKCalendarAttributes *)v5 setPushKey:v22];

      id v23 = [v4 selfIdentityDisplayName];
      [(NEKCalendarAttributes *)v5 setSelfIdentityDisplayName:v23];

      id v24 = [v4 selfIdentityEmail];
      [(NEKCalendarAttributes *)v5 setSelfIdentityEmail:v24];

      id v25 = [v4 selfIdentityAddress];
      [(NEKCalendarAttributes *)v5 setSelfIdentityAddress:v25];

      v26 = [v4 selfIdentityFirstName];
      [(NEKCalendarAttributes *)v5 setSelfIdentityFirstName:v26];

      v27 = [v4 selfIdentityLastName];
      [(NEKCalendarAttributes *)v5 setSelfIdentityLastName:v27];

      v28 = [v4 ownerIdentityDisplayName];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityDisplayName:v28];

      v29 = [v4 ownerIdentityAddress];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityAddress:v29];

      v30 = [v4 ownerIdentityEmail];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityEmail:v30];

      v31 = [v4 ownerIdentityFirstName];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityFirstName:v31];

      id v32 = [v4 ownerIdentityLastName];
      [(NEKCalendarAttributes *)v5 setOwnerIdentityLastName:v32];
    }
    self = v5;
    id v33 = self;
  }
  else
  {
    id v33 = 0;
  }

  return v33;
}

- (BOOL)didCalendarChange:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_27;
  }
  v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = [(NEKCalendarAttributes *)self title];
    id v8 = sub_10002D3E0(v7);
    id v9 = [(NEKCalendarAttributes *)self UUID];
    int v115 = 138543618;
    v116 = v8;
    __int16 v117 = 2114;
    v118 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didCalendarChange: title:%{public}@ identifier:%{public}@", (uint8_t *)&v115, 0x16u);
  }
  uint64_t v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    id v12 = [v4 syncToken];
    id v13 = [v4 externalModificationTag];
    id v14 = [v4 externalIDTag];
    int v115 = 138543874;
    v116 = v12;
    __int16 v117 = 2114;
    v118 = v13;
    __int16 v119 = 2114;
    v120 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didCalendarChange: local->syncToken:%{public}@ externalModificationTag:%{public}@ externalIdentificationTag:%{public}@", (uint8_t *)&v115, 0x20u);
  }
  uint64_t v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    id v17 = [(NEKCalendarAttributes *)self syncToken];
    v18 = [(NEKCalendarAttributes *)self externalModificationTag];
    uint64_t v19 = [(NEKCalendarAttributes *)self externalIdentificationTag];
    int v115 = 138543874;
    v116 = v17;
    __int16 v117 = 2114;
    v118 = v18;
    __int16 v119 = 2114;
    v120 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didCalendarChange: incmg->syncToken:%{public}@ externalModificationTag:%{public}@ externalIdentificationTag:%{public}@", (uint8_t *)&v115, 0x20u);
  }
  unsigned int v20 = [(NEKCalendarAttributes *)self isReadonly];
  if (v20 != [v4 readOnly]) {
    goto LABEL_27;
  }
  unsigned int v21 = [(NEKCalendarAttributes *)self isHidden];
  if (v21 != [v4 isHidden]) {
    goto LABEL_27;
  }
  unsigned int v22 = [(NEKCalendarAttributes *)self isImmutable];
  if (v22 != [v4 isImmutableRaw]) {
    goto LABEL_27;
  }
  unsigned int v23 = [(NEKCalendarAttributes *)self isInbox];
  if (v23 != [v4 isInbox]) {
    goto LABEL_27;
  }
  unsigned int v24 = [(NEKCalendarAttributes *)self isNotificationsCollection];
  if (v24 != [v4 isNotificationsCollection]) {
    goto LABEL_27;
  }
  unsigned int v25 = [(NEKCalendarAttributes *)self isSharingInvitation];
  if (v25 != [v4 isSharingInvitation]) {
    goto LABEL_27;
  }
  unsigned int v26 = [(NEKCalendarAttributes *)self isSubscribed];
  if (v26 != [v4 isSubscribed]) {
    goto LABEL_27;
  }
  unsigned int v27 = [(NEKCalendarAttributes *)self isHolidyCalendar];
  if (v27 != [v4 isSubscribedHolidayCalendar]) {
    goto LABEL_27;
  }
  unsigned int v28 = [(NEKCalendarAttributes *)self isFamilyCalendar];
  if (v28 != [v4 isFamilyCalendar]) {
    goto LABEL_27;
  }
  unsigned int v29 = [(NEKCalendarAttributes *)self isIgnoringEventAlerts];
  if (v29 != [v4 isIgnoringEventAlerts]) {
    goto LABEL_27;
  }
  unsigned int v30 = [(NEKCalendarAttributes *)self isIgnoringSharedCalendarNotifications];
  if (v30 != [v4 isIgnoringSharedCalendarNotifications]) {
    goto LABEL_27;
  }
  unsigned int v31 = [(NEKCalendarAttributes *)self isSchedulingProhibited];
  if (v31 == [v4 allowsScheduling]) {
    goto LABEL_27;
  }
  unsigned int v32 = [(NEKCalendarAttributes *)self isDefaultCalendarForStore];
  if (v32 != [v4 isDefaultSchedulingCalendar]) {
    goto LABEL_27;
  }
  unsigned int v33 = [(NEKCalendarAttributes *)self displayOrder];
  if (v33 != [v4 displayOrder]) {
    goto LABEL_27;
  }
  id v34 = [(NEKCalendarAttributes *)self sharingStatus];
  if (v34 != [v4 sharingStatus]) {
    goto LABEL_27;
  }
  id v35 = [(NEKCalendarAttributes *)self sharingInvitationResponse];
  if (v35 != [v4 sharingInvitationResponse]) {
    goto LABEL_27;
  }
  unsigned int v36 = [(NEKCalendarAttributes *)self canBePublished];
  if (v36 != [v4 canBePublished]) {
    goto LABEL_27;
  }
  unsigned int v37 = [(NEKCalendarAttributes *)self canBeShared];
  if (v37 != [v4 canBeShared]) {
    goto LABEL_27;
  }
  unsigned int v38 = [(NEKCalendarAttributes *)self isPublished];
  if (v38 != [v4 isPublished]) {
    goto LABEL_27;
  }
  id v41 = [(NEKCalendarAttributes *)self invitationStatus];
  BOOL v39 = 1;
  if (v41 == [v4 invitationStatus])
  {
    unsigned int v42 = [v4 allowEvents] ^ 1;
    if ((([(NEKCalendarAttributes *)self supportedEntityTypes] & 1) == 0) == v42)
    {
      unsigned int v43 = [v4 allowReminders] ^ 1;
      if ((([(NEKCalendarAttributes *)self supportedEntityTypes] & 1) == 0) == v43)
      {
        v44 = [(NEKCalendarAttributes *)self title];
        v45 = [v4 unlocalizedTitle];
        int v46 = sub_1000518F0(v44, v45, @"title");

        if (!v46) {
          goto LABEL_27;
        }
        v47 = [(NEKCalendarAttributes *)self digest];
        v48 = [v4 digest];
        int v49 = sub_1000518F0(v47, v48, @"digest");

        if (!v49) {
          goto LABEL_27;
        }
        v50 = [(NEKCalendarAttributes *)self symbolicColorName];
        v51 = [v4 symbolicColorName];
        int v52 = sub_1000518F0(v50, v51, @"symbolicColorName");

        if (!v52) {
          goto LABEL_27;
        }
        v53 = [(NEKCalendarAttributes *)self colorString];
        v54 = [v4 colorString];
        int v55 = sub_1000518F0(v53, v54, @"colorString");

        if (!v55) {
          goto LABEL_27;
        }
        v56 = [(NEKCalendarAttributes *)self notes];
        v57 = [v4 notes];
        int v58 = sub_1000518F0(v56, v57, @"notes");

        if (!v58) {
          goto LABEL_27;
        }
        v59 = [(NEKCalendarAttributes *)self subCalAccountID];
        v60 = [v4 subcalAccountID];
        int v61 = sub_1000518F0(v59, v60, @"subCalAccountID");

        if (!v61) {
          goto LABEL_27;
        }
        v62 = [(NEKCalendarAttributes *)self pushKey];
        v63 = [v4 pushKey];
        int v64 = sub_1000518F0(v62, v63, @"pushKey");

        if (!v64) {
          goto LABEL_27;
        }
        v65 = [(NEKCalendarAttributes *)self sharedOwnerName];
        v66 = [v4 sharedOwnerName];
        int v67 = sub_1000518F0(v65, v66, @"sharedOwnerName");

        if (!v67) {
          goto LABEL_27;
        }
        v68 = [(NEKCalendarAttributes *)self sharedOwnerAddress];
        v69 = [v4 sharedOwnerAddress];
        int v70 = sub_1000518F0(v68, v69, @"sharedOwnerAddress");

        if (!v70) {
          goto LABEL_27;
        }
        uint64_t v71 = [(NEKCalendarAttributes *)self publishedURL];
        v72 = [v4 publishURL];
        int v73 = sub_1000518F0(v71, v72, @"publishedURL");

        if (!v73) {
          goto LABEL_27;
        }
        v74 = [(NEKCalendarAttributes *)self externalID];
        v75 = [v4 externalID];
        int v76 = sub_1000518F0(v74, v75, @"externalID");

        if (!v76) {
          goto LABEL_27;
        }
        v77 = [(NEKCalendarAttributes *)self externalRepresentation];
        v78 = [v4 externalRepresentation];
        int v79 = sub_1000518F0(v77, v78, @"externalRepresentation");

        if (!v79) {
          goto LABEL_27;
        }
        v80 = [(NEKCalendarAttributes *)self selfIdentityDisplayName];
        uint64_t v81 = [v4 selfIdentityDisplayName];
        int v82 = sub_1000518F0(v80, v81, @"selfIdentityDisplayName");

        if (!v82) {
          goto LABEL_27;
        }
        unsigned __int8 v83 = [(NEKCalendarAttributes *)self selfIdentityEmail];
        uint64_t v84 = [v4 selfIdentityEmail];
        int v85 = sub_1000518F0(v83, v84, @"selfIdentityEmail");

        if (!v85) {
          goto LABEL_27;
        }
        v86 = [(NEKCalendarAttributes *)self selfIdentityAddress];
        v87 = [v4 selfIdentityAddress];
        int v88 = sub_1000518F0(v86, v87, @"selfIdentityAddress");

        if (!v88) {
          goto LABEL_27;
        }
        v89 = [(NEKCalendarAttributes *)self selfIdentityFirstName];
        id v90 = [v4 selfIdentityFirstName];
        int v91 = sub_1000518F0(v89, v90, @"selfIdentityFirstName");

        if (!v91) {
          goto LABEL_27;
        }
        id v92 = [(NEKCalendarAttributes *)self selfIdentityLastName];
        v93 = [v4 selfIdentityLastName];
        int v94 = sub_1000518F0(v92, v93, @"selfIdentityLastName");

        if (!v94) {
          goto LABEL_27;
        }
        unsigned int v95 = [(NEKCalendarAttributes *)self ownerIdentityDisplayName];
        unsigned int v96 = [v4 ownerIdentityDisplayName];
        int v97 = sub_1000518F0(v95, v96, @"ownerIdentityDisplayName");

        if (!v97) {
          goto LABEL_27;
        }
        v98 = [(NEKCalendarAttributes *)self ownerIdentityAddress];
        v99 = [v4 ownerIdentityAddress];
        int v100 = sub_1000518F0(v98, v99, @"ownerIdentityAddress");

        if (!v100) {
          goto LABEL_27;
        }
        id v101 = [(NEKCalendarAttributes *)self ownerIdentityEmail];
        uint64_t v102 = [v4 ownerIdentityEmail];
        int v103 = sub_1000518F0(v101, v102, @"ownerIdentityEmail");

        if (!v103) {
          goto LABEL_27;
        }
        v104 = [(NEKCalendarAttributes *)self ownerIdentityFirstName];
        v105 = [v4 ownerIdentityFirstName];
        int v106 = sub_1000518F0(v104, v105, @"ownerIdentityFirstName");

        if (!v106
          || ([(NEKCalendarAttributes *)self ownerIdentityLastName],
              uint64_t v107 = objc_claimAutoreleasedReturnValue(),
              [v4 ownerIdentityLastName],
              v108 = objc_claimAutoreleasedReturnValue(),
              int v109 = sub_1000518F0(v107, v108, @"ownerIdentityLastName"),
              v108,
              v107,
              !v109))
        {
LABEL_27:
          BOOL v39 = 1;
          goto LABEL_28;
        }
        v110 = *(NSObject **)(qword_1000C6CA8 + 8);
        BOOL v39 = 0;
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v111 = v110;
          v112 = [(NEKCalendarAttributes *)self title];
          id v113 = sub_10002D3E0(v112);
          id v114 = [(NEKCalendarAttributes *)self UUID];
          int v115 = 138543618;
          v116 = v113;
          __int16 v117 = 2114;
          v118 = v114;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "No changes for calendar with title %{public}@, identifier %{public}@", (uint8_t *)&v115, 0x16u);

          BOOL v39 = 0;
        }
      }
    }
  }
LABEL_28:

  return v39;
}

+ (void)configureCalendar:(id)a3 inDatabase:(id)a4 withAttributes:(id)a5
{
  if (a3 && a4 && a5)
  {
    id v6 = a5;
    id v7 = a3;
    id v8 = [v6 UUID];
    [v7 setCalendarIdentifier:v8];

    id v9 = [v6 title];
    [v7 setTitle:v9];

    [v7 setReadOnly:[v6 isReadonly]];
    [v7 setHidden:[v6 isHidden]];
    [v7 setImmutable:[v6 isImmutable]];
    [v7 setInbox:[v6 isInbox]];
    [v7 setNotificationsCollection:[v6 isNotificationsCollection]];
    [v7 setSharingInvitation:[v6 isSharingInvitation]];
    [v7 setSubscribed:[v6 isSubscribed]];
    [v7 setSubscribedHolidayCalendar:[v6 isHolidyCalendar]];
    [v7 setFamilyCalendar:[v6 isFamilyCalendar]];
    [v7 setIsIgnoringEventAlerts:[v6 isIgnoringEventAlerts]];
    [v7 setIsIgnoringSharedCalendarNotifications:[v6 isIgnoringSharedCalendarNotifications]];
    [v7 setAllowsScheduling:objc_msgSend(v6, "isSchedulingProhibited") ^ 1];
    [v7 setIsDefaultSchedulingCalendar:[v6 isDefaultCalendarForStore]];
    uint64_t v10 = [v6 digest];
    [v7 setDigest:v10];

    v11 = [v6 symbolicColorName];
    [v7 setSymbolicColorName:v11];

    id v12 = [v6 colorString];
    [v7 setColorString:v12];

    [v7 setDisplayOrder:[v6 displayOrder]];
    [v7 setSharingStatus:[v6 sharingStatus]];
    id v13 = [v6 sharedOwnerName];
    [v7 setSharedOwnerName:v13];

    id v14 = [v6 sharedOwnerAddress];
    [v7 setSharedOwnerAddress:v14];

    [v7 setSharingInvitationResponse:[v6 sharingInvitationResponse]];
    uint64_t v15 = [v6 publishedURL];
    [v7 setPublishURL:v15];

    [v7 setCanBePublished:[v6 canBePublished]];
    [v7 setCanBeShared:[v6 canBeShared]];
    [v7 setIsPublished:[v6 isPublished]];
    v16 = [v6 externalID];
    [v7 setExternalID:v16];

    id v17 = [v6 externalIdentificationTag];
    [v7 setExternalIDTag:v17];

    v18 = [v6 syncToken];
    [v7 setSyncToken:v18];

    uint64_t v19 = [v6 externalRepresentation];
    [v7 setExternalRepresentation:v19];

    [v7 setInvitationStatus:[v6 invitationStatus]];
    unsigned int v20 = [v6 notes];
    [v7 setNotes:v20];

    unsigned int v21 = [v6 subCalAccountID];
    [v7 setSubcalAccountID:v21];

    unsigned int v22 = [v6 pushKey];
    [v7 setPushKey:v22];

    unsigned int v23 = [v6 selfIdentityDisplayName];
    [v7 setSelfIdentityDisplayName:v23];

    unsigned int v24 = [v6 selfIdentityEmail];
    [v7 setSelfIdentityEmail:v24];

    unsigned int v25 = [v6 selfIdentityAddress];
    [v7 setSelfIdentityAddress:v25];

    unsigned int v26 = [v6 selfIdentityFirstName];
    [v7 setSelfIdentityFirstName:v26];

    unsigned int v27 = [v6 selfIdentityLastName];
    [v7 setSelfIdentityLastName:v27];

    unsigned int v28 = [v6 ownerIdentityDisplayName];
    [v7 setOwnerIdentityDisplayName:v28];

    unsigned int v29 = [v6 ownerIdentityEmail];
    [v7 setOwnerIdentityEmail:v29];

    unsigned int v30 = [v6 ownerIdentityAddress];
    [v7 setOwnerIdentityAddress:v30];

    unsigned int v31 = [v6 ownerIdentityFirstName];
    [v7 setOwnerIdentityFirstName:v31];

    id v32 = [v6 ownerIdentityLastName];

    [v7 setOwnerIdentityLastName:v32];
  }
}

@end