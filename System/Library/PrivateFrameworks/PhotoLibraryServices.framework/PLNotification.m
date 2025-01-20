@interface PLNotification
+ (id)_UNCategoryFromNotificationType:(int64_t)a3;
+ (id)requestIdentifierByNotificationType:(int64_t)a3 keyObjectUUID:(id)a4 photosBatchID:(id)a5;
- (BOOL)allAssetsAreFullResolution;
- (BOOL)assetWithUUID:(id)a3 didChangePlaceholderKindTo:(signed __int16)a4 fromOldKind:(signed __int16)a5;
- (BOOL)canMergeWithPersistedNotifications;
- (BOOL)hasThumbnail;
- (BOOL)isCommentPiggyBackedOnPhotosAddedNotification;
- (BOOL)offerToReportAsJunk;
- (BOOL)suppressAlert;
- (BOOL)thumbnailAssetIsPlaceholder;
- (NSArray)suppressionContexts;
- (NSData)thumbnailImageData;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSDate)notificationDeliveryDate;
- (NSDate)originalDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)albumCloudGUID;
- (NSString)albumUUID;
- (NSString)commentText;
- (NSString)destinationURLString;
- (NSString)interestingMemoryUUID;
- (NSString)keyObjectUUID;
- (NSString)mainAssetUUID;
- (NSString)message;
- (NSString)photoLibraryURLString;
- (NSString)photosBatchID;
- (NSString)requestIdentifier;
- (NSString)senderEmailAddress;
- (NSString)title;
- (PLNotification)init;
- (PLNotification)initWithAssetAdded:(id)a3 atIndex:(unint64_t)a4 toAlbum:(id)a5;
- (PLNotification)initWithAssetsAdded:(id)a3 toAlbum:(id)a4;
- (PLNotification)initWithCommentAdded:(id)a3;
- (PLNotification)initWithExpiringMomentShareUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6;
- (PLNotification)initWithExpiringMomentShares:(id)a3;
- (PLNotification)initWithInterestingMemoryNotificationWithMemoryUUID:(id)a3 keyAssetUUID:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6 photoLibraryURLString:(id)a7;
- (PLNotification)initWithInvitationAlbum:(id)a3;
- (PLNotification)initWithInvitationRecordStatusChanged:(id)a3;
- (PLNotification)initWithLikeAdded:(id)a3;
- (PLNotification)initWithMultipleContributorEnabledForAlbum:(id)a3;
- (double)completionPercentage;
- (id)_initWithCommentsCount:(int64_t)a3 commentDate:(id)a4 firstCommentGUID:(id)a5 toAssetWithUUID:(id)a6 photosBatchID:(id)a7 mainAssetIsMine:(BOOL)a8 mainAssetIsVideo:(BOOL)a9 inAlbumWithTitle:(id)a10 albumUUID:(id)a11 albumCloudGUID:(id)a12 assetUUIDs:(id)a13 placeholderAssetUUIDs:(id)a14 lowResThumbAssetUUIDs:(id)a15;
- (id)_initWithLikesCount:(int64_t)a3 commentDate:(id)a4 firstCommentGUID:(id)a5 toAssetWithUUID:(id)a6 photosBatchID:(id)a7 mainAssetIsMine:(BOOL)a8 mainAssetIsVideo:(BOOL)a9 inAlbumWithTitle:(id)a10 albumUUID:(id)a11 albumCloudGUID:(id)a12 assetUUIDs:(id)a13 placeholderAssetUUIDs:(id)a14 lowResThumbAssetUUIDs:(id)a15 senderNames:(id)a16 forMultipleAsset:(BOOL)a17 allMultipleAssetIsMine:(BOOL)a18 isMixedType:(BOOL)a19;
- (id)_initWithPhotosAddedNotification:(id)a3 mergedWithNotification:(id)a4;
- (id)_initWithPhotosAddedNotification:(id)a3 mergedWithNotificationDictionary:(id)a4;
- (id)_initWithType:(int64_t)a3;
- (id)description;
- (id)initCMMInvitationReadyToViewWithMomentShare:(id)a3;
- (id)initCMMInvitationWithMomentShare:(id)a3;
- (id)initForPhotosChallengeNewQuestions;
- (id)initForPhotosChallengeSubmission;
- (id)initForSharedLibraryExitInitatedByOwnerWithType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5;
- (id)initForSharedLibraryParticipantAssetTrashNotificationWithTrashedPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5;
- (id)initForSharedLibraryScopeAcceptWithLibraryScopeIdentifier:(id)a3 participantName:(id)a4;
- (id)initForSharedLibrarySuggestions;
- (id)notificationByMergingWithNotification:(id)a3;
- (id)notificationByMergingWithNotificationDictionary:(id)a3;
- (int64_t)notificationType;
- (void)setNotificationDeliveryDate:(id)a3;
- (void)setOriginalDate:(id)a3;
- (void)setSuppressAlert:(BOOL)a3;
- (void)setThumbnailImageData:(id)a3;
@end

@implementation PLNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURLString, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_notificationDeliveryDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_albumCloudGUID, 0);
  objc_storeStrong((id *)&self->_albumUUID, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_momentShareOwnerLocalizedName, 0);
  objc_storeStrong((id *)&self->_momentShareUUIDs, 0);
  objc_storeStrong((id *)&self->_keyMomentShareUUID, 0);
  objc_storeStrong((id *)&self->_notificationSubtitle, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_interestingMemoryUUID, 0);
  objc_storeStrong((id *)&self->_senderNames, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_commentDate, 0);
  objc_storeStrong((id *)&self->_firstCommentGUID, 0);
  objc_storeStrong((id *)&self->_lowResThumbAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_placeholderAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_mainAssetUUID, 0);
  objc_storeStrong((id *)&self->_photosBatchID, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_senderEmailAddress, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_destinationURLString, 0);
}

- (NSString)photoLibraryURLString
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (NSString)commentText
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)photosBatchID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)offerToReportAsJunk
{
  return self->_offerToReportAsJunk;
}

- (void)setThumbnailImageData:(id)a3
{
}

- (NSData)thumbnailImageData
{
  return (NSData *)objc_getProperty(self, a2, 320, 1);
}

- (NSString)interestingMemoryUUID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setNotificationDeliveryDate:(id)a3
{
}

- (NSDate)notificationDeliveryDate
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSuppressAlert:(BOOL)a3
{
  self->_suppressAlert = a3;
}

- (BOOL)suppressAlert
{
  return self->_suppressAlert;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (void)setOriginalDate:(id)a3
{
}

- (NSDate)originalDate
{
  return (NSDate *)objc_getProperty(self, a2, 296, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 288, 1);
}

- (NSString)senderEmailAddress
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)mainAssetUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)albumCloudGUID
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)albumUUID
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (BOOL)assetWithUUID:(id)a3 didChangePlaceholderKindTo:(signed __int16)a4 fromOldKind:(signed __int16)a5
{
  int v5 = a4;
  id v7 = a3;
  int v8 = [(NSMutableSet *)self->_assetUUIDs containsObject:v7];
  if (v8)
  {
    if ((v5 - 4) < 2 || v5 == 7)
    {
      [(NSMutableSet *)self->_placeholderAssetUUIDs removeObject:v7];
      [(NSMutableSet *)self->_lowResThumbAssetUUIDs removeObject:v7];
    }
    else if (v5 == 3)
    {
      [(NSMutableSet *)self->_placeholderAssetUUIDs removeObject:v7];
      [(NSMutableSet *)self->_lowResThumbAssetUUIDs addObject:v7];
    }
  }

  return v8;
}

- (NSString)requestIdentifier
{
  if (self->_notificationType == 3
    && [(NSString *)self->_photosBatchID length]
    && self->_commentIsCaption
    && [(NSString *)self->_commentText length])
  {
    v3 = self->_photosBatchID;
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_opt_class();
  int64_t v5 = [(PLNotification *)self notificationType];
  v6 = [(PLNotification *)self keyObjectUUID];
  id v7 = [v4 requestIdentifierByNotificationType:v5 keyObjectUUID:v6 photosBatchID:v3];

  return (NSString *)v7;
}

- (NSString)keyObjectUUID
{
  int64_t notificationType = self->_notificationType;
  v4 = @"PhotosChallengeSubmission";
  switch(notificationType)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      albumUUID = self->_albumUUID;
      goto LABEL_5;
    case 6:
      albumUUID = self->_interestingMemoryUUID;
      goto LABEL_5;
    case 8:
    case 9:
    case 10:
      albumUUID = self->_keyMomentShareUUID;
LABEL_5:
      v4 = albumUUID;
      break;
    case 12:
      v4 = @"SharedLibrarySuggestions";
      break;
    case 13:
      v4 = @"SharedLibraryAccepted";
      break;
    case 14:
      v4 = @"SharedLibraryParticipantAssetTrashNotification";
      break;
    case 15:
      v4 = @"PhotosChallengeNewQuestions";
      break;
    case 16:
      v4 = @"SharedLibraryExitInitatedByOwner";
      break;
    default:
      break;
  }
  return (NSString *)v4;
}

- (BOOL)isCommentPiggyBackedOnPhotosAddedNotification
{
  return [(PLNotification *)self notificationType] == 3
      && [(NSString *)self->_commentText length] != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PLNotification;
  v3 = [(PLNotification *)&v7 description];
  v4 = [(PLNotification *)self message];
  int64_t v5 = [v3 stringByAppendingFormat:@" - \"%@\"", v4];

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  v4 = [NSNumber numberWithLongLong:self->_notificationType];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4F8C7A8]];

  albumUUID = self->_albumUUID;
  if (albumUUID) {
    [v3 setObject:albumUUID forKey:*MEMORY[0x1E4F8C6E8]];
  }
  albumCloudGUID = self->_albumCloudGUID;
  if (albumCloudGUID) {
    [v3 setObject:albumCloudGUID forKey:*MEMORY[0x1E4F8C6E0]];
  }
  if (self->_senderEmailAddress)
  {
    v40[0] = self->_senderEmailAddress;
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v3 setObject:v7 forKey:*MEMORY[0x1E4F8C7C0]];
  }
  int v8 = [(PLNotification *)self title];
  if (v8) {
    [v3 setObject:v8 forKey:*MEMORY[0x1E4F8C7F8]];
  }
  v9 = [(PLNotification *)self message];
  if (v9) {
    [v3 setObject:v9 forKey:*MEMORY[0x1E4F8C788]];
  }
  date = self->_date;
  if (date) {
    [v3 setObject:date forKey:*MEMORY[0x1E4F8C748]];
  }
  originalDate = self->_originalDate;
  if (originalDate) {
    [v3 setObject:originalDate forKey:*MEMORY[0x1E4F8C7B8]];
  }
  expirationDate = self->_expirationDate;
  if (expirationDate) {
    [v3 setObject:expirationDate forKey:*MEMORY[0x1E4F8C768]];
  }
  v13 = [(PLNotification *)self destinationURLString];
  if (v13) {
    [v3 setObject:v13 forKey:*MEMORY[0x1E4F8C750]];
  }
  if ([(PLNotification *)self hasThumbnail])
  {
    v14 = [NSNumber numberWithBool:1];
    [v3 setObject:v14 forKey:*MEMORY[0x1E4F8C778]];
  }
  mainAssetUUID = self->_mainAssetUUID;
  if (mainAssetUUID) {
    [v3 setObject:mainAssetUUID forKey:*MEMORY[0x1E4F8C710]];
  }
  if (self->_mainAssetIsMine)
  {
    v16 = [NSNumber numberWithBool:1];
    [v3 setObject:v16 forKey:*MEMORY[0x1E4F8C700]];
  }
  if (self->_mainAssetIsVideo)
  {
    v17 = [NSNumber numberWithBool:1];
    [v3 setObject:v17 forKey:*MEMORY[0x1E4F8C708]];
  }
  commentDate = self->_commentDate;
  if (commentDate) {
    [v3 setObject:commentDate forKey:*MEMORY[0x1E4F8C728]];
  }
  firstCommentGUID = self->_firstCommentGUID;
  if (firstCommentGUID) {
    [v3 setObject:firstCommentGUID forKey:*MEMORY[0x1E4F8C718]];
  }
  if (self->_commentCount)
  {
    v20 = (void *)MEMORY[0x1E4F8C720];
  }
  else
  {
    if (!self->_assetCount) {
      goto LABEL_36;
    }
    v20 = (void *)MEMORY[0x1E4F8C6F8];
  }
  v21 = objc_msgSend(NSNumber, "numberWithInteger:");
  [v3 setObject:v21 forKey:*v20];

LABEL_36:
  if (self->_commentIsCaption)
  {
    v22 = [NSNumber numberWithBool:1];
    [v3 setObject:v22 forKey:*MEMORY[0x1E4F8C730]];
  }
  commentText = self->_commentText;
  if (commentText) {
    [v3 setObject:commentText forKey:*MEMORY[0x1E4F8C740]];
  }
  v24 = [(PLNotification *)self suppressionContexts];
  if (v24) {
    [v3 setObject:v24 forKey:*MEMORY[0x1E4F8C7E0]];
  }
  if ([(PLNotification *)self isCommentPiggyBackedOnPhotosAddedNotification])
  {
    v25 = [NSNumber numberWithBool:1];
    [v3 setObject:v25 forKey:*MEMORY[0x1E4F8C738]];
  }
  if (self->_suppressAlert)
  {
    v26 = [NSNumber numberWithBool:1];
    [v3 setObject:v26 forKey:*MEMORY[0x1E4F8C7E8]];
  }
  senderNames = self->_senderNames;
  if (senderNames)
  {
    v28 = [(NSMutableSet *)senderNames allObjects];
    [v3 setObject:v28 forKey:*MEMORY[0x1E4F8C7D8]];
  }
  if (self->_forMultipleAsset)
  {
    v29 = [NSNumber numberWithBool:1];
    [v3 setObject:v29 forKey:*MEMORY[0x1E4F8C770]];
  }
  if (self->_allMultipleAssetIsMine)
  {
    v30 = [NSNumber numberWithBool:1];
    [v3 setObject:v30 forKey:*MEMORY[0x1E4F8C6F0]];
  }
  if (self->_isMixedType)
  {
    v31 = [NSNumber numberWithBool:1];
    [v3 setObject:v31 forKey:*MEMORY[0x1E4F8C790]];
  }
  if (self->_offerToReportAsJunk)
  {
    v32 = [NSNumber numberWithBool:1];
    [v3 setObject:v32 forKey:*MEMORY[0x1E4F8C7B0]];
  }
  interestingMemoryUUID = self->_interestingMemoryUUID;
  if (interestingMemoryUUID) {
    [v3 setObject:interestingMemoryUUID forKey:*MEMORY[0x1E4F8C780]];
  }
  notificationTitle = self->_notificationTitle;
  if (notificationTitle) {
    [v3 setObject:notificationTitle forKey:*MEMORY[0x1E4F8C7A0]];
  }
  notificationSubtitle = self->_notificationSubtitle;
  if (notificationSubtitle) {
    [v3 setObject:notificationSubtitle forKey:*MEMORY[0x1E4F8C798]];
  }
  notificationDeliveryDate = self->_notificationDeliveryDate;
  if (notificationDeliveryDate) {
    [v3 setObject:notificationDeliveryDate forKey:*MEMORY[0x1E4F8C758]];
  }
  if ([(NSData *)self->_thumbnailImageData length]) {
    [v3 setObject:self->_thumbnailImageData forKey:*MEMORY[0x1E4F8C7F0]];
  }
  v37 = [(PLNotification *)self requestIdentifier];
  if (v37) {
    [v3 setObject:v37 forKey:*MEMORY[0x1E4F8C7D0]];
  }
  v38 = v3;

  return v38;
}

- (NSArray)suppressionContexts
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(PLNotification *)self notificationType] == 6)
  {
    v4 = (void *)MEMORY[0x1E4F8C570];
LABEL_7:
    [v3 addObject:*v4];
    goto LABEL_8;
  }
  if ([(PLNotification *)self notificationType] != 10)
  {
    [v3 addObject:*MEMORY[0x1E4F8C558]];
    [v3 addObject:*MEMORY[0x1E4F8C568]];
    v4 = (void *)MEMORY[0x1E4F8C560];
    goto LABEL_7;
  }
  if (self->_keyMomentShareUUID)
  {
    int64_t v5 = PLSuppressionContextForMomentShareUUID();
    [v3 addObject:v5];
  }
LABEL_8:
  return (NSArray *)v3;
}

- (BOOL)hasThumbnail
{
  int64_t notificationType = self->_notificationType;
  return (unint64_t)(notificationType - 3) < 3 || notificationType == 6 && self->_mainAssetUUID;
}

- (NSString)destinationURLString
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  destinationURLString = self->_destinationURLString;
  if (destinationURLString)
  {
    v3 = destinationURLString;
  }
  else
  {
    int64_t notificationType = self->_notificationType;
    v3 = @"photos://cloudfeed?source=notification";
    uint64_t v7 = 272;
    int v8 = @"photos://cloudfeed?invitationalbumuuid=%@&source=notification";
    switch(notificationType)
    {
      case 0:
        goto LABEL_10;
      case 1:
      case 2:
        break;
      case 3:
        int v8 = @"photos://cloudfeed?revealassetuuid=%@&source=notification";
        uint64_t v7 = 56;
        goto LABEL_10;
      case 4:
      case 5:
        int v8 = @"photos://cloudfeed?revealcommentguid=%@&source=notification";
        uint64_t v7 = 112;
        goto LABEL_10;
      case 6:
        int v8 = @"photos://memory?uuid=%@&source=notification";
        uint64_t v7 = 168;
LABEL_10:
        objc_msgSend(NSString, "stringWithFormat:", v8, *(Class *)((char *)&self->super.isa + v7));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v3) {
          goto LABEL_11;
        }
        break;
      case 11:
        v3 = @"photos://photoschallengesubmission?source=notification";
        break;
      case 12:
        v3 = @"photos://forYou?type=sharedLibrarySuggestions&source=notification";
        break;
      case 14:
        v3 = @"photos://album?name=recently-deleted";
        break;
      case 15:
        v3 = @"photos://contentmode?id=forYou&source=notification";
        break;
      default:
LABEL_11:
        v9 = PLSharingGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int64_t v10 = self->_notificationType;
          *(_DWORD *)buf = 134217984;
          int64_t v12 = v10;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unknown notification type: %ld", buf, 0xCu);
        }

        v3 = 0;
        break;
    }
  }
  return (NSString *)v3;
}

- (NSString)message
{
  v2 = 0;
  switch(self->_notificationType)
  {
    case 0:
      senderName = (__CFString *)self->_senderName;
      if (!senderName) {
        senderName = &stru_1EEB2EB80;
      }
      int64_t v5 = senderName;
      albumTitle = (__CFString *)self->_albumTitle;
      if (!albumTitle) {
        albumTitle = &stru_1EEB2EB80;
      }
      uint64_t v7 = albumTitle;
      if (![(__CFString *)v5 length] || ![(__CFString *)v7 length]) {
        [(__CFString *)v5 length];
      }
      v29 = PLServicesLocalizedFrameworkStringForAssetsd();
      PFLocalizedStringWithValidatedFormat();
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_78;
    case 1:
      int v8 = (__CFString *)self->_senderName;
      if (!v8) {
        int v8 = &stru_1EEB2EB80;
      }
      int64_t v5 = v8;
      v9 = (__CFString *)self->_albumTitle;
      if (!v9) {
        v9 = &stru_1EEB2EB80;
      }
      int64_t v10 = v9;
      int invitationState = self->_invitationState;
      if (invitationState == 2 || invitationState == 4)
      {
        v26 = PLServicesLocalizedFrameworkStringForAssetsd();
        goto LABEL_57;
      }
      v2 = 0;
      goto LABEL_59;
    case 2:
    case 0xBLL:
    case 0xFLL:
      goto LABEL_52;
    case 3:
      [(NSString *)self->_commentText length];
      goto LABEL_17;
    case 4:
      int64_t commentCount = self->_commentCount;
      if (commentCount == 1)
      {
        if (self->_commentText)
        {
          PLServicesLocalizedFrameworkStringForAssetsd();
          int64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_32:
          uint64_t v15 = PFStringWithValidatedFormat();
LABEL_84:
          v2 = (__CFString *)v15;
LABEL_85:

          goto LABEL_86;
        }
      }
      else if (commentCount < 1)
      {
LABEL_44:
        v2 = 0;
        goto LABEL_86;
      }
LABEL_17:
      PLServicesLocalizedFrameworkStringForAssetsd();
      int64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_83;
    case 5:
      uint64_t v13 = [(NSMutableSet *)self->_senderNames count];
      if (self->_forMultipleAsset)
      {
        if (v13 == 1)
        {
          PLServicesLocalizedFrameworkStringForAssetsd();
          int64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v7 = [(NSMutableSet *)self->_senderNames anyObject];
          PFLocalizedStringWithValidatedFormat();
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_78:

          goto LABEL_85;
        }
        if (self->_allMultipleAssetIsMine)
        {
          if (self->_isMixedType)
          {
            v27 = @"NEW_LIKES_ADDED_MY_ITEMS";
LABEL_93:
            v28 = v27;
            v33 = PLServicesLocalizedFrameworkStringForAssetsd();
            PFLocalizedStringWithValidatedFormat();
            v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_94;
          }
          BOOL mainAssetIsVideo = self->_mainAssetIsVideo;
          v31 = @"NEW_LIKES_ADDED_MY_VIDEOS";
          v30 = @"NEW_LIKES_ADDED_MY_PHOTOS";
        }
        else
        {
          if (self->_isMixedType)
          {
            v27 = @"NEW_LIKES_ADDED_NOT_MY_ITEMS";
            goto LABEL_93;
          }
          BOOL mainAssetIsVideo = self->_mainAssetIsVideo;
          v31 = @"NEW_LIKES_ADDED_NOT_MY_VIDEOS";
          v30 = @"NEW_LIKES_ADDED_NOT_MY_PHOTOS";
        }
      }
      else
      {
        BOOL mainAssetIsVideo = self->_mainAssetIsMine;
        BOOL v21 = self->_mainAssetIsVideo;
        if (v13 == 1)
        {
          v22 = @"NEW_LIKE_ADDED_NOT_MY_VIDEO";
          BOOL v23 = !v21;
          v24 = @"NEW_LIKE_ADDED_MY_VIDEO";
          if (v23)
          {
            v22 = @"NEW_LIKE_ADDED_NOT_MY_PHOTO";
            v24 = @"NEW_LIKE_ADDED_MY_PHOTO";
          }
          if (self->_mainAssetIsMine) {
            v25 = v24;
          }
          else {
            v25 = v22;
          }
          int64_t v5 = v25;
          PLServicesLocalizedFrameworkStringForAssetsd();
          int64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v26 = [(NSMutableSet *)self->_senderNames anyObject];
LABEL_57:
          PFStringWithValidatedFormat();
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_59:
          goto LABEL_85;
        }
        v30 = @"NEW_LIKES_ADDED_NOT_MY_VIDEO";
        BOOL v23 = !v21;
        v31 = @"NEW_LIKES_ADDED_MY_VIDEO";
        if (v23)
        {
          v30 = @"NEW_LIKES_ADDED_NOT_MY_PHOTO";
          v31 = @"NEW_LIKES_ADDED_MY_PHOTO";
        }
      }
      if (mainAssetIsVideo) {
        v27 = v31;
      }
      else {
        v27 = v30;
      }
      goto LABEL_93;
    case 6:
      v14 = self->_notificationSubtitle;
      goto LABEL_77;
    case 8:
      v2 = &stru_1EEB2EB80;
      goto LABEL_86;
    case 9:
      v2 = self->_notificationSubtitle;
      if (v2) {
        goto LABEL_86;
      }
      [(NSArray *)self->_momentShareUUIDs count];
      PLServicesLocalizedFrameworkStringForAssetsd();
      int64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xALL:
      if ([(NSString *)self->_momentShareOwnerLocalizedName length]) {
        goto LABEL_17;
      }
LABEL_52:
      PLServicesLocalizedFrameworkStringForAssetsd();
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    case 0xCLL:
      goto LABEL_76;
    case 0xDLL:
      if (!self->_participantName) {
        goto LABEL_44;
      }
      PLServicesSharedLibraryLocalizedFrameworkString();
      int64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 0xELL:
      unint64_t trashedAssetVideoCount = self->_trashedAssetVideoCount;
      if (trashedAssetVideoCount)
      {
        unint64_t trashedAssetPhotoCount = self->_trashedAssetPhotoCount;
        unint64_t trashedAssetItemCount = self->_trashedAssetItemCount;
        if (!(trashedAssetPhotoCount | trashedAssetItemCount))
        {
          if (trashedAssetVideoCount == 1) {
            goto LABEL_76;
          }
LABEL_82:
          PLServicesSharedLibraryLocalizedFrameworkString();
          int64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_83:
          uint64_t v15 = PFLocalizedStringWithValidatedFormat();
          goto LABEL_84;
        }
      }
      else
      {
        unint64_t trashedAssetItemCount = self->_trashedAssetItemCount;
        unint64_t trashedAssetPhotoCount = self->_trashedAssetPhotoCount;
        if (!trashedAssetItemCount)
        {
          if (trashedAssetPhotoCount == 1) {
            goto LABEL_76;
          }
          goto LABEL_82;
        }
      }
      if (trashedAssetPhotoCount + trashedAssetItemCount + trashedAssetVideoCount == 1)
      {
LABEL_76:
        PLServicesSharedLibraryLocalizedFrameworkString();
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_77:
        v2 = (__CFString *)v14;
        goto LABEL_86;
      }
      PLServicesSharedLibraryLocalizedFrameworkString();
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_94:

LABEL_86:
      return (NSString *)v2;
    case 0x10:
      int exitType = self->_exitType;
      if (exitType == 2)
      {
        if (self->_exitRetentionPolicy < 3uLL) {
          goto LABEL_61;
        }
      }
      else if (exitType == 3 && self->_exitRetentionPolicy < 3uLL)
      {
LABEL_61:
        PLServicesSharedLibraryLocalizedFrameworkString();
        int64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v5 && self->_participantName) {
          goto LABEL_32;
        }
LABEL_65:
        v2 = 0;
        goto LABEL_85;
      }
      int64_t v5 = 0;
      goto LABEL_65;
    default:
      goto LABEL_86;
  }
}

- (NSString)title
{
  v3 = 0;
  switch(self->_notificationType)
  {
    case 0:
    case 0xBLL:
    case 0xFLL:
      goto LABEL_5;
    case 1:
    case 8:
      senderName = self->_senderName;
      goto LABEL_7;
    case 2:
    case 3:
    case 4:
    case 5:
      senderName = self->_albumTitle;
      goto LABEL_7;
    case 6:
      senderName = self->_notificationTitle;
      goto LABEL_7;
    case 9:
    case 0xALL:
      senderName = self->_notificationTitle;
      if (senderName)
      {
LABEL_7:
        v3 = senderName;
      }
      else
      {
LABEL_5:
        PLServicesLocalizedFrameworkStringForAssetsd();
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      break;
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
      goto LABEL_10;
    case 0x10:
      int exitType = self->_exitType;
      if (exitType == 2 || exitType == 3)
      {
LABEL_10:
        PLServicesSharedLibraryLocalizedFrameworkString();
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
      break;
    default:
      break;
  }
  return v3;
}

- (double)completionPercentage
{
  int64_t assetCount = self->_assetCount;
  uint64_t v4 = [(NSMutableSet *)self->_placeholderAssetUUIDs count];
  uint64_t v5 = [(NSMutableSet *)self->_lowResThumbAssetUUIDs count];
  if (assetCount) {
    return (double)(unint64_t)(v5 + v4) / (double)assetCount;
  }
  else {
    return 0.0;
  }
}

- (BOOL)thumbnailAssetIsPlaceholder
{
  return [(NSMutableSet *)self->_placeholderAssetUUIDs containsObject:self->_mainAssetUUID];
}

- (BOOL)allAssetsAreFullResolution
{
  return ![(NSMutableSet *)self->_placeholderAssetUUIDs count]
      && [(NSMutableSet *)self->_lowResThumbAssetUUIDs count] == 0;
}

- (id)notificationByMergingWithNotificationDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLNotification *)self originalDate];
  uint64_t v6 = *MEMORY[0x1E4F8C7B8];
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F8C7B8]];
  int v8 = (void *)v7;
  if (v5)
  {
    if (v7)
    {
      [v5 timeIntervalSinceDate:v7];
      if (v9 > 14400.0)
      {
        id v14 = 0;
        goto LABEL_61;
      }
    }
  }
  int64_t v10 = [v4 objectForKey:*MEMORY[0x1E4F8C7A8]];
  int64_t notificationType = [v10 integerValue];

  int64_t v12 = [v4 objectForKey:*MEMORY[0x1E4F8C6E8]];
  uint64_t v13 = [v4 objectForKey:*MEMORY[0x1E4F8C7F0]];
  if (self->_notificationType == notificationType)
  {
    if (notificationType == 3)
    {
      if ([(NSString *)self->_albumUUID isEqualToString:v12])
      {
        id v14 = [[PLNotification alloc] _initWithPhotosAddedNotification:self mergedWithNotificationDictionary:v4];
        uint64_t v15 = [v14 thumbnailImageData];

        if (!v15 && v13) {
          [v14 setThumbnailImageData:v13];
        }
        v16 = [v4 objectForKey:v6];
        [v14 setOriginalDate:v16];
        goto LABEL_59;
      }
      int64_t notificationType = self->_notificationType;
    }
    if ((notificationType & 0xFFFFFFFFFFFFFFFELL) == 4
      && [(NSString *)self->_albumUUID isEqualToString:v12])
    {
      uint64_t v17 = [v4 objectForKey:*MEMORY[0x1E4F8C728]];
      v18 = [(NSDate *)self->_commentDate earlierDate:v17];
      if ([v18 isEqualToDate:v17])
      {
        v19 = [v4 objectForKey:*MEMORY[0x1E4F8C718]];
      }
      else
      {
        v19 = self->_firstCommentGUID;
      }
      v20 = v19;
      BOOL v21 = [v4 objectForKey:*MEMORY[0x1E4F8C720]];
      v58 = v21;
      if (v21) {
        uint64_t v55 = [v21 integerValue];
      }
      else {
        uint64_t v55 = 0;
      }
      v62 = v20;
      v63 = v18;
      int64_t commentCount = self->_commentCount;
      v65 = (void *)[(NSMutableSet *)self->_assetUUIDs mutableCopy];
      v61 = (void *)[(NSMutableSet *)self->_placeholderAssetUUIDs mutableCopy];
      v60 = (void *)[(NSMutableSet *)self->_lowResThumbAssetUUIDs mutableCopy];
      BOOL v23 = [MEMORY[0x1E4F1CA80] set];
      v24 = v23;
      if (self->_senderNames) {
        objc_msgSend(v23, "unionSet:");
      }
      v64 = v24;
      uint64_t v25 = *MEMORY[0x1E4F8C7D8];
      v26 = [v4 objectForKey:*MEMORY[0x1E4F8C7D8]];

      if (v26)
      {
        v27 = [v4 objectForKey:v25];
        [v64 addObjectsFromArray:v27];
      }
      uint64_t v28 = *MEMORY[0x1E4F8C770];
      v29 = [v4 objectForKey:*MEMORY[0x1E4F8C770]];

      if (v29)
      {
        v30 = [v4 objectForKey:v28];
        char v31 = [v30 BOOLValue];
      }
      else
      {
        char v31 = 0;
      }
      int v59 = 1;
      if (!self->_forMultipleAsset && (v31 & 1) == 0)
      {
        mainAssetUUID = self->_mainAssetUUID;
        v33 = [v4 objectForKey:*MEMORY[0x1E4F8C710]];
        int v59 = ![(NSString *)mainAssetUUID isEqualToString:v33];
      }
      uint64_t v34 = *MEMORY[0x1E4F8C790];
      v35 = [v4 objectForKey:*MEMORY[0x1E4F8C790]];

      if (v35)
      {
        v36 = [v4 objectForKey:v34];
        int v37 = [v36 BOOLValue];
      }
      else
      {
        int v37 = 0;
      }
      if (self->_isMixedType) {
        BOOL mainAssetIsVideo = 1;
      }
      else {
        BOOL mainAssetIsVideo = v37;
      }
      v57 = (void *)v17;
      if (!mainAssetIsVideo && ((v59 ^ 1) & 1) == 0) {
        BOOL mainAssetIsVideo = self->_mainAssetIsVideo;
      }
      HIDWORD(v54) = mainAssetIsVideo;
      int64_t v56 = commentCount + v55;
      v39 = [v4 objectForKey:*MEMORY[0x1E4F8C700]];
      char v40 = [v39 BOOLValue];

      uint64_t v41 = *MEMORY[0x1E4F8C6F0];
      v42 = [v4 objectForKey:*MEMORY[0x1E4F8C6F0]];

      if (v42) {
        BOOL v43 = 1;
      }
      else {
        BOOL v43 = v40;
      }
      if (v42 && (v40 & 1) == 0)
      {
        v44 = [v4 objectForKey:v41];
        BOOL v43 = v44 != 0;
      }
      int64_t v45 = self->_notificationType;
      if (v45 == 5)
      {
        if (!self->_allMultipleAssetIsMine) {
          BOOL v43 = 0;
        }
        v48 = [PLNotification alloc];
        BYTE2(v54) = BYTE4(v54);
        BYTE1(v54) = v43;
        LOBYTE(v54) = v59;
        LOBYTE(v53) = self->_mainAssetIsVideo;
        uint64_t v47 = -[PLNotification _initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:](v48, "_initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:", v56, v63, v62, self->_mainAssetUUID, self->_photosBatchID, self->_mainAssetIsMine, v53, self->_albumTitle, self->_albumUUID, self->_albumCloudGUID, v65, v61, v60, v64, v54);
      }
      else
      {
        if (v45 != 4)
        {
          id v14 = 0;
          goto LABEL_55;
        }
        v46 = [PLNotification alloc];
        LOBYTE(v53) = self->_mainAssetIsVideo;
        uint64_t v47 = [(PLNotification *)v46 _initWithCommentsCount:v56 commentDate:v63 firstCommentGUID:v62 toAssetWithUUID:self->_mainAssetUUID photosBatchID:self->_photosBatchID mainAssetIsMine:self->_mainAssetIsMine mainAssetIsVideo:v53 inAlbumWithTitle:self->_albumTitle albumUUID:self->_albumUUID albumCloudGUID:self->_albumCloudGUID assetUUIDs:v65 placeholderAssetUUIDs:v61 lowResThumbAssetUUIDs:v60];
      }
      id v14 = (id)v47;
LABEL_55:
      v16 = v57;
      [v14 setOriginalDate:v5];
      v49 = [v4 objectForKey:*MEMORY[0x1E4F8C7E8]];
      unsigned int v50 = [v49 BOOLValue];

      if (self->_suppressAlert) {
        uint64_t v51 = 1;
      }
      else {
        uint64_t v51 = v50;
      }
      [v14 setSuppressAlert:v51];
      [v14 setThumbnailImageData:v13];

LABEL_59:
      goto LABEL_60;
    }
  }
  id v14 = 0;
LABEL_60:

LABEL_61:
  return v14;
}

- (id)notificationByMergingWithNotification:(id)a3
{
  id v4 = (PLNotification *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_26;
  }
  uint64_t v6 = [(PLNotification *)v4 notificationType];
  int64_t notificationType = self->_notificationType;
  if (notificationType != 3
    || (BOOL v8 = [(NSString *)self->_albumUUID isEqualToString:v5->_albumUUID],
        int64_t notificationType = self->_notificationType,
        !v8))
  {
    BOOL v12 = v6 == notificationType && (notificationType & 0xFFFFFFFFFFFFFFFELL) == 4;
    if (!v12
      || ![(NSString *)self->_albumUUID isEqualToString:v5->_albumUUID]
      || self->_commentIsCaption
      || v5->_commentIsCaption)
    {
      goto LABEL_26;
    }
    uint64_t v13 = self;
    v11 = [(NSDate *)v13->_commentDate earlierDate:v5->_commentDate];
    double v9 = v13;
    if ([(PLNotification *)v11 isEqualToDate:v5->_commentDate])
    {
      double v9 = v5;
    }
    int64_t commentCount = v13->_commentCount;
    originalDate = v13->_originalDate;
    v16 = v5->_originalDate;
    int64_t v46 = v5->_commentCount;
    if (originalDate)
    {
      uint64_t v17 = [(NSDate *)originalDate earlierDate:v16];
      v18 = (void *)[v17 copy];
    }
    else
    {
      v18 = (void *)[(NSDate *)v16 copy];
    }
    v26 = (void *)[(NSMutableSet *)v13->_assetUUIDs mutableCopy];
    [v26 unionSet:v5->_assetUUIDs];
    v27 = (void *)[(NSMutableSet *)v13->_placeholderAssetUUIDs mutableCopy];
    [v27 unionSet:v5->_placeholderAssetUUIDs];
    uint64_t v47 = (void *)[(NSMutableSet *)v13->_lowResThumbAssetUUIDs mutableCopy];
    [v47 unionSet:v5->_lowResThumbAssetUUIDs];
    uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
    v29 = v28;
    if (v13->_senderNames) {
      objc_msgSend(v28, "unionSet:");
    }
    if (v5->_senderNames) {
      objc_msgSend(v29, "unionSet:");
    }
    v48 = v26;
    v49 = v29;
    if (v13->_forMultipleAsset || v5->_forMultipleAsset) {
      int v30 = 1;
    }
    else {
      int v30 = ![(NSString *)v13->_mainAssetUUID isEqualToString:v5->_mainAssetUUID];
    }
    int64_t v31 = commentCount;
    if (v13->_isMixedType)
    {
      v32 = v27;
      BOOL isMixedType = 1;
    }
    else
    {
      v32 = v27;
      BOOL isMixedType = v5->_isMixedType;
      if (!v5->_isMixedType && ((v30 ^ 1) & 1) == 0) {
        BOOL isMixedType = v13->_mainAssetIsVideo != v5->_mainAssetIsVideo;
      }
    }
    int64_t v34 = v46 + v31;
    BOOL v35 = v13->_allMultipleAssetIsMine && v5->_allMultipleAssetIsMine;
    int64_t v36 = self->_notificationType;
    if (v36 == 5)
    {
      uint64_t v41 = [PLNotification alloc];
      BYTE2(v45) = isMixedType;
      BYTE1(v45) = v35;
      LOBYTE(v45) = v30;
      v39 = v47;
      v38 = v48;
      LOBYTE(v44) = v9->_mainAssetIsVideo;
      uint64_t v40 = -[PLNotification _initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:](v41, "_initWithLikesCount:commentDate:firstCommentGUID:toAssetWithUUID:photosBatchID:mainAssetIsMine:mainAssetIsVideo:inAlbumWithTitle:albumUUID:albumCloudGUID:assetUUIDs:placeholderAssetUUIDs:lowResThumbAssetUUIDs:senderNames:forMultipleAsset:allMultipleAssetIsMine:isMixedType:", v34, v9->_commentDate, v9->_firstCommentGUID, v9->_mainAssetUUID, v9->_photosBatchID, v9->_mainAssetIsMine, v44, v9->_albumTitle, v9->_albumUUID, v9->_albumCloudGUID, v48, v32, v47, v49, v45);
    }
    else
    {
      if (v36 != 4)
      {
        id v20 = 0;
        v39 = v47;
        v38 = v48;
        goto LABEL_58;
      }
      int v37 = [PLNotification alloc];
      v39 = v47;
      v38 = v48;
      LOBYTE(v44) = v9->_mainAssetIsVideo;
      uint64_t v40 = [(PLNotification *)v37 _initWithCommentsCount:v34 commentDate:v9->_commentDate firstCommentGUID:v9->_firstCommentGUID toAssetWithUUID:v9->_mainAssetUUID photosBatchID:v9->_photosBatchID mainAssetIsMine:v9->_mainAssetIsMine mainAssetIsVideo:v44 inAlbumWithTitle:v9->_albumTitle albumUUID:v9->_albumUUID albumCloudGUID:v9->_albumCloudGUID assetUUIDs:v48 placeholderAssetUUIDs:v32 lowResThumbAssetUUIDs:v47];
    }
    id v20 = (id)v40;
LABEL_58:
    [v20 setOriginalDate:v18];
    BOOL v42 = v9->_suppressAlert || v5->_suppressAlert;
    [v20 setSuppressAlert:v42];
    BOOL v43 = [(PLNotification *)v5 thumbnailImageData];
    [v20 setThumbnailImageData:v43];

    goto LABEL_35;
  }
  if (v6 != notificationType)
  {
    if (v6 == 4 && v5->_commentIsCaption)
    {
      v11 = self;
      double v9 = v5;
      goto LABEL_23;
    }
LABEL_26:
    id v20 = 0;
    goto LABEL_27;
  }
  double v9 = self;
  int64_t v10 = v5;
  v11 = v10;
  if (v6 != 4 && v10->_containsBatchFirstKnownAsset)
  {

LABEL_23:
    v19 = v11;
    v11 = v9;
    double v9 = v19;
  }
  id v20 = [[PLNotification alloc] _initWithPhotosAddedNotification:v9 mergedWithNotification:v11];
  BOOL v21 = v9->_originalDate;
  v22 = v11->_originalDate;
  if (v21)
  {
    BOOL v23 = [(NSDate *)v21 earlierDate:v22];
    [v20 setOriginalDate:v23];
  }
  else
  {
    [v20 setOriginalDate:v22];
  }
  BOOL v25 = v9->_suppressAlert || v11->_suppressAlert;
  [v20 setSuppressAlert:v25];
  v18 = [(PLNotification *)v5 thumbnailImageData];
  [v20 setThumbnailImageData:v18];
LABEL_35:

LABEL_27:
  return v20;
}

- (BOOL)canMergeWithPersistedNotifications
{
  int64_t notificationType = self->_notificationType;
  return notificationType == 4 && !self->_commentIsCaption || ((notificationType - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)initForSharedLibraryExitInitatedByOwnerWithType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5
{
  unsigned int v6 = a3;
  id v8 = a5;
  if (v6 >= 2)
  {
    int64_t v10 = [(PLNotification *)self _initWithType:16];
    v11 = v10;
    if (v10)
    {
      *((_WORD *)v10 + 128) = v6;
      v10[33] = a4;
      uint64_t v12 = [v8 copy];
      uint64_t v13 = (void *)v11[28];
      v11[28] = v12;
    }
    self = v11;
    double v9 = self;
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)initForSharedLibraryParticipantAssetTrashNotificationWithTrashedPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5
{
  id result = [(PLNotification *)self _initWithType:14];
  if (result)
  {
    *((void *)result + 29) = a3;
    *((void *)result + 30) = a4;
    *((void *)result + 31) = a5;
  }
  return result;
}

- (id)initForSharedLibraryScopeAcceptWithLibraryScopeIdentifier:(id)a3 participantName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLNotification.m", 676, @"Invalid parameter not satisfying: %@", @"scopeIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PLNotification.m", 677, @"Invalid parameter not satisfying: %@", @"participantName" object file lineNumber description];

LABEL_3:
  int64_t v10 = [(PLNotification *)self _initWithType:13];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    uint64_t v12 = (void *)v10[27];
    v10[27] = v11;

    uint64_t v13 = [v9 copy];
    id v14 = (void *)v10[28];
    v10[28] = v13;
  }
  return v10;
}

- (id)initForSharedLibrarySuggestions
{
  return [(PLNotification *)self _initWithType:12];
}

- (id)initForPhotosChallengeNewQuestions
{
  return [(PLNotification *)self _initWithType:15];
}

- (id)initForPhotosChallengeSubmission
{
  return [(PLNotification *)self _initWithType:11];
}

- (PLNotification)initWithExpiringMomentShareUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (![v12 count])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLNotification.m", 644, @"Invalid parameter not satisfying: %@", @"UUIDs.count" object file lineNumber description];
  }
  v16 = [(PLNotification *)self _initWithType:9];
  uint64_t v17 = (PLNotification *)v16;
  if (v16)
  {
    objc_storeStrong(v16 + 25, a3);
    v18 = [v12 firstObject];
    uint64_t v19 = [v18 copy];
    keyMomentShareUUID = v17->_keyMomentShareUUID;
    v17->_keyMomentShareUUID = (NSString *)v19;

    objc_storeStrong((id *)&v17->_thumbnailImageData, a4);
    uint64_t v21 = [v14 copy];
    notificationTitle = v17->_notificationTitle;
    v17->_notificationTitle = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    notificationSubtitle = v17->_notificationSubtitle;
    v17->_notificationSubtitle = (NSString *)v23;
  }
  return v17;
}

- (PLNotification)initWithExpiringMomentShares:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [v5 firstObject];
  if (!v6)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PLNotification.m", 622, @"Invalid parameter not satisfying: %@", @"firstMomentShare" object file lineNumber description];
  }
  id v7 = [v6 thumbnailImageData];

  if (!v7)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLNotification.m", 623, @"Invalid parameter not satisfying: %@", @"firstMomentShare.thumbnailImageData" object file lineNumber description];
  }
  id v8 = [(PLNotification *)self _initWithType:9];
  if (v8)
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __47__PLNotification_initWithExpiringMomentShares___block_invoke;
    v24[3] = &unk_1E586F8A0;
    int64_t v10 = v9;
    BOOL v25 = v10;
    [v5 enumerateObjectsUsingBlock:v24];
    momentShareUUIDs = v8->_momentShareUUIDs;
    v8->_momentShareUUIDs = v10;
    id v12 = v10;

    id v13 = [v6 shareURL];
    uint64_t v14 = [v13 absoluteString];
    destinationURLString = v8->_destinationURLString;
    v8->_destinationURLString = (NSString *)v14;

    v16 = [v6 uuid];
    uint64_t v17 = [v16 copy];
    keyMomentShareUUID = v8->_keyMomentShareUUID;
    v8->_keyMomentShareUUID = (NSString *)v17;

    uint64_t v19 = [v6 thumbnailImageData];
    thumbnailImageData = v8->_thumbnailImageData;
    v8->_thumbnailImageData = (NSData *)v19;
  }
  return v8;
}

void __47__PLNotification_initWithExpiringMomentShares___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

- (id)initCMMInvitationReadyToViewWithMomentShare:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PLNotification.m", 596, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  unsigned int v6 = [v5 previewData];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F598E0]) initWithData:v6];
  id v8 = [v7 previewImageDatas];
  double v9 = [v8 firstObject];

  if (!v9)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLNotification.m", 600, @"Invalid parameter not satisfying: %@", @"thumbnailImageData" object file lineNumber description];
  }
  int64_t v10 = [v5 owner];
  uint64_t v11 = [v10 nameComponents];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    [v12 setStyle:1];
    id v13 = [v12 stringFromPersonNameComponents:v11];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = [(PLNotification *)self _initWithType:10];
  if (v14)
  {
    id v15 = [v5 shareURL];
    uint64_t v16 = [v15 absoluteString];
    uint64_t v17 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v16;

    v18 = [v5 uuid];
    uint64_t v19 = [v18 copy];
    id v20 = (void *)*((void *)v14 + 24);
    *((void *)v14 + 24) = v19;

    objc_storeStrong((id *)v14 + 40, v9);
    objc_storeStrong((id *)v14 + 26, v13);
  }

  return v14;
}

- (id)initCMMInvitationWithMomentShare:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLNotification.m", 583, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  unsigned int v6 = [(PLNotification *)self _initWithType:8];
  if (v6)
  {
    id v7 = [v5 shareURL];
    uint64_t v8 = [v7 absoluteString];
    double v9 = (void *)v6[2];
    v6[2] = v8;

    int64_t v10 = [v5 uuid];
    uint64_t v11 = [v10 copy];
    id v12 = (void *)v6[24];
    v6[24] = v11;

    id v13 = [v5 owner];
    uint64_t v14 = [v13 emailAddress];
    id v15 = (void *)v6[4];
    v6[4] = v14;
  }
  return v6;
}

- (PLNotification)initWithInterestingMemoryNotificationWithMemoryUUID:(id)a3 keyAssetUUID:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6 photoLibraryURLString:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    int v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLNotification.m", 563, @"Invalid parameter not satisfying: %@", @"memoryUUID" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
LABEL_12:
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, self, @"PLNotification.m", 565, @"Invalid parameter not satisfying: %@", @"notificationSubtitle" object file lineNumber description];

      if (v18) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  int64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"PLNotification.m", 564, @"Invalid parameter not satisfying: %@", @"notificationTitle" object file lineNumber description];

  if (!v17) {
    goto LABEL_12;
  }
LABEL_4:
  if (v18) {
    goto LABEL_5;
  }
LABEL_13:
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"PLNotification.m", 566, @"Invalid parameter not satisfying: %@", @"photoLibraryURLString" object file lineNumber description];

LABEL_5:
  uint64_t v19 = [(PLNotification *)self _initWithType:6];
  id v20 = (PLNotification *)v19;
  if (v19)
  {
    objc_storeStrong(v19 + 21, a3);
    if (v15)
    {
      uint64_t v21 = [v15 copy];
      mainAssetUUID = v20->_mainAssetUUID;
      v20->_mainAssetUUID = (NSString *)v21;

      [(NSMutableSet *)v20->_lowResThumbAssetUUIDs addObject:v20->_mainAssetUUID];
    }
    uint64_t v23 = [v16 copy];
    notificationTitle = v20->_notificationTitle;
    v20->_notificationTitle = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    notificationSubtitle = v20->_notificationSubtitle;
    v20->_notificationSubtitle = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    photoLibraryURLString = v20->_photoLibraryURLString;
    v20->_photoLibraryURLString = (NSString *)v27;
  }
  return v20;
}

- (id)_initWithLikesCount:(int64_t)a3 commentDate:(id)a4 firstCommentGUID:(id)a5 toAssetWithUUID:(id)a6 photosBatchID:(id)a7 mainAssetIsMine:(BOOL)a8 mainAssetIsVideo:(BOOL)a9 inAlbumWithTitle:(id)a10 albumUUID:(id)a11 albumCloudGUID:(id)a12 assetUUIDs:(id)a13 placeholderAssetUUIDs:(id)a14 lowResThumbAssetUUIDs:(id)a15 senderNames:(id)a16 forMultipleAsset:(BOOL)a17 allMultipleAssetIsMine:(BOOL)a18 isMixedType:(BOOL)a19
{
  id v43 = a4;
  id obj = a5;
  id v22 = a5;
  id v23 = a7;
  id v41 = v22;
  id v40 = a6;
  id v39 = a7;
  id v44 = a10;
  id v42 = a11;
  id v38 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  uint64_t v28 = [(PLNotification *)self _initWithType:5];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong(v28 + 7, a6);
    objc_storeStrong(v29 + 6, v23);
    *((unsigned char *)v29 + 64) = a8;
    *((unsigned char *)v29 + 65) = a9;
    objc_storeStrong(v29 + 14, obj);
    objc_storeStrong(v29 + 15, a4);
    objc_storeStrong(v29 + 5, a10);
    v29[17] = (id)a3;
    id v30 = v29[3];
    v29[3] = 0;

    objc_storeStrong(v29 + 19, a16);
    id v31 = v29[4];
    v29[4] = 0;

    objc_storeStrong(v29 + 9, a13);
    v29[10] = (id)[v24 count];
    objc_storeStrong(v29 + 34, a11);
    objc_storeStrong(v29 + 35, a12);
    objc_storeStrong(v29 + 11, a14);
    objc_storeStrong(v29 + 12, a15);
    *((unsigned char *)v29 + 160) = a17;
    *((unsigned char *)v29 + 161) = a18;
    *((unsigned char *)v29 + 162) = a19;
  }

  return v29;
}

- (id)_initWithCommentsCount:(int64_t)a3 commentDate:(id)a4 firstCommentGUID:(id)a5 toAssetWithUUID:(id)a6 photosBatchID:(id)a7 mainAssetIsMine:(BOOL)a8 mainAssetIsVideo:(BOOL)a9 inAlbumWithTitle:(id)a10 albumUUID:(id)a11 albumCloudGUID:(id)a12 assetUUIDs:(id)a13 placeholderAssetUUIDs:(id)a14 lowResThumbAssetUUIDs:(id)a15
{
  id v38 = a4;
  id v36 = a5;
  id v34 = a6;
  id v33 = a7;
  id v37 = a10;
  id v35 = a11;
  id v19 = a12;
  id v20 = a13;
  id v21 = a14;
  id v32 = a15;
  id v22 = [(PLNotification *)self _initWithType:4];
  id v23 = v22;
  if (v22)
  {
    objc_storeStrong(v22 + 7, a6);
    objc_storeStrong(v23 + 6, a7);
    *((unsigned char *)v23 + 64) = a8;
    *((unsigned char *)v23 + 65) = a9;
    objc_storeStrong(v23 + 14, a5);
    objc_storeStrong(v23 + 15, a4);
    objc_storeStrong(v23 + 5, a10);
    id v24 = v23[16];
    v23[16] = 0;
    v23[17] = (id)a3;

    id v25 = v23[3];
    v23[3] = 0;

    id v26 = v23[19];
    v23[19] = 0;

    id v27 = v23[4];
    v23[4] = 0;

    objc_storeStrong(v23 + 9, a13);
    v23[10] = (id)[v20 count];
    objc_storeStrong(v23 + 34, a11);
    objc_storeStrong(v23 + 35, a12);
    objc_storeStrong(v23 + 11, a14);
    objc_storeStrong(v23 + 12, a15);
  }

  return v23;
}

- (PLNotification)initWithLikeAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(PLNotification *)self _initWithType:5];
  if (v5)
  {
    unsigned int v6 = [v4 asset];
    id v7 = [v6 uuid];
    uint64_t v8 = [v7 copy];
    mainAssetUUID = v5->_mainAssetUUID;
    v5->_mainAssetUUID = (NSString *)v8;

    int64_t v10 = [v6 cloudBatchID];
    uint64_t v11 = [v10 copy];
    photosBatchID = v5->_photosBatchID;
    v5->_photosBatchID = (NSString *)v11;

    id v13 = [v4 cloudGUID];
    uint64_t v14 = [v13 copy];
    firstCommentGUID = v5->_firstCommentGUID;
    v5->_firstCommentGUID = (NSString *)v14;

    id v16 = [v4 commentDate];
    uint64_t v17 = [v16 copy];
    commentDate = v5->_commentDate;
    v5->_commentDate = (NSDate *)v17;

    id v19 = [v4 commenterDisplayName];
    uint64_t v20 = [v19 copy];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v20;

    id v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v22;

    if (v5->_senderName) {
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    }
    id v24 = [v4 commenterEmail];
    uint64_t v25 = [v24 copy];
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v25;

    id v27 = [v6 cloudShareAlbum];
    uint64_t v28 = [v27 localizedTitle];
    uint64_t v29 = [v28 copy];
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v29;

    v5->_int64_t commentCount = 1;
    id v31 = [v6 cloudShareAlbum];
    id v32 = [v31 uuid];
    uint64_t v33 = [v32 copy];
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v33;

    id v35 = [v6 cloudShareAlbum];
    id v36 = [v35 cloudGUID];
    uint64_t v37 = [v36 copy];
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v37;

    char v39 = [v6 cloudIsMyAsset];
    v5->_mainAssetIsMine = v39;
    v5->_allMultipleAssetIsMine = v39;
    v5->_BOOL mainAssetIsVideo = [v6 isVideo];
    id v40 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    assetUUIDs = v5->_assetUUIDs;
    v5->_assetUUIDs = v40;

    id v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    p_placeholderAssetUUIDs = (id *)&v5->_placeholderAssetUUIDs;
    placeholderAssetUUIDs = v5->_placeholderAssetUUIDs;
    v5->_placeholderAssetUUIDs = v42;

    uint64_t v45 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lowResThumbAssetUUIDs = v5->_lowResThumbAssetUUIDs;
    v5->_lowResThumbAssetUUIDs = v45;

    [(NSMutableSet *)v5->_assetUUIDs addObject:v5->_mainAssetUUID];
    v5->_int64_t assetCount = 1;
    int v47 = [v6 cloudPlaceholderKind];
    if (v47 != 2)
    {
      if ((unsigned __int16)v47 != 3)
      {
LABEL_8:

        goto LABEL_9;
      }
      p_placeholderAssetUUIDs = (id *)&v5->_lowResThumbAssetUUIDs;
    }
    [*p_placeholderAssetUUIDs addObject:v5->_mainAssetUUID];
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (PLNotification)initWithCommentAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(PLNotification *)self _initWithType:4];
  if (v5)
  {
    unsigned int v6 = [v4 asset];
    id v7 = [v6 uuid];
    uint64_t v8 = [v7 copy];
    mainAssetUUID = v5->_mainAssetUUID;
    v5->_mainAssetUUID = (NSString *)v8;

    int64_t v10 = [v6 cloudBatchID];
    uint64_t v11 = [v10 copy];
    photosBatchID = v5->_photosBatchID;
    v5->_photosBatchID = (NSString *)v11;

    id v13 = [v4 cloudGUID];
    uint64_t v14 = [v13 copy];
    firstCommentGUID = v5->_firstCommentGUID;
    v5->_firstCommentGUID = (NSString *)v14;

    id v16 = [v4 commentDate];
    uint64_t v17 = [v16 copy];
    commentDate = v5->_commentDate;
    v5->_commentDate = (NSDate *)v17;

    id v19 = [v4 commenterDisplayName];
    uint64_t v20 = [v19 copy];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v20;

    id v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v22;

    if (v5->_senderName) {
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    }
    id v24 = [v4 commenterEmail];
    uint64_t v25 = [v24 copy];
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v25;

    id v27 = [v6 cloudShareAlbum];
    uint64_t v28 = [v27 localizedTitle];
    uint64_t v29 = [v28 copy];
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v29;

    id v31 = [v4 commentText];
    uint64_t v32 = [v31 copy];
    commentText = v5->_commentText;
    v5->_commentText = (NSString *)v32;

    v5->_int64_t commentCount = 1;
    id v34 = [v4 isCaption];
    v5->_commentIsCaption = [v34 BOOLValue];

    id v35 = [v6 cloudShareAlbum];
    id v36 = [v35 uuid];
    uint64_t v37 = [v36 copy];
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v37;

    char v39 = [v6 cloudShareAlbum];
    id v40 = [v39 cloudGUID];
    uint64_t v41 = [v40 copy];
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v41;

    v5->_mainAssetIsMine = [v6 cloudIsMyAsset];
    v5->_BOOL mainAssetIsVideo = [v6 isVideo];
    id v43 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    assetUUIDs = v5->_assetUUIDs;
    v5->_assetUUIDs = v43;

    uint64_t v45 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    p_placeholderAssetUUIDs = (id *)&v5->_placeholderAssetUUIDs;
    placeholderAssetUUIDs = v5->_placeholderAssetUUIDs;
    v5->_placeholderAssetUUIDs = v45;

    v48 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lowResThumbAssetUUIDs = v5->_lowResThumbAssetUUIDs;
    v5->_lowResThumbAssetUUIDs = v48;

    [(NSMutableSet *)v5->_assetUUIDs addObject:v5->_mainAssetUUID];
    v5->_int64_t assetCount = 1;
    int v50 = [v6 cloudPlaceholderKind];
    if (v50 != 2)
    {
      if ((unsigned __int16)v50 != 3)
      {
LABEL_8:

        goto LABEL_9;
      }
      p_placeholderAssetUUIDs = (id *)&v5->_lowResThumbAssetUUIDs;
    }
    [*p_placeholderAssetUUIDs addObject:v5->_mainAssetUUID];
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)_initWithPhotosAddedNotification:(id)a3 mergedWithNotificationDictionary:(id)a4
{
  unsigned int v6 = (id *)a3;
  id v7 = a4;
  uint64_t v8 = [(PLNotification *)self _initWithType:3];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 3, v6[3]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v11 = v9[19];
    v9[19] = v10;

    if (v9[3]) {
      objc_msgSend(v9[19], "addObject:");
    }
    objc_storeStrong(v9 + 4, v6[4]);
    objc_storeStrong(v9 + 5, v6[5]);
    objc_storeStrong(v9 + 34, v6[34]);
    objc_storeStrong(v9 + 35, v6[35]);
    objc_storeStrong(v9 + 7, v6[7]);
    objc_storeStrong(v9 + 6, v6[6]);
    *((unsigned char *)v9 + 64) = *((unsigned char *)v6 + 64);
    *((unsigned char *)v9 + 65) = *((unsigned char *)v6 + 65);
    *((unsigned char *)v9 + 66) = *((unsigned char *)v6 + 66);
    uint64_t v12 = [v6[9] mutableCopy];
    id v13 = v9[9];
    v9[9] = (id)v12;

    uint64_t v14 = (char *)v6[10];
    id v15 = [v7 objectForKey:*MEMORY[0x1E4F8C6F8]];
    v9[10] = &v14[[v15 integerValue]];

    uint64_t v16 = [v6[11] mutableCopy];
    id v17 = v9[11];
    v9[11] = (id)v16;

    uint64_t v18 = [v6[12] mutableCopy];
    id v19 = v9[12];
    v9[12] = (id)v18;

    uint64_t v20 = v6;
    objc_storeStrong(v9 + 14, v20[14]);
    objc_storeStrong(v9 + 15, v20[15]);
    objc_storeStrong(v9 + 16, v20[16]);
    *((unsigned char *)v9 + 144) = *((unsigned char *)v20 + 144);
    id v21 = [v7 objectForKey:*MEMORY[0x1E4F8C7A8]];
    uint64_t v22 = [v21 integerValue];

    id v23 = [v7 objectForKey:*MEMORY[0x1E4F8C730]];
    int v24 = [v23 BOOLValue];

    if (v22 == 4 || v22 == 3 && v24)
    {
      uint64_t v25 = [v7 objectForKey:*MEMORY[0x1E4F8C718]];
      id v26 = [v7 objectForKey:*MEMORY[0x1E4F8C728]];
      uint64_t v27 = [v7 objectForKey:*MEMORY[0x1E4F8C740]];
      id v28 = v9[14];
      v9[14] = v25;
      id v29 = v25;

      id v30 = v9[15];
      v9[15] = v26;
      id v31 = v26;

      id v32 = v9[16];
      v9[16] = (id)v27;

      *((unsigned char *)v9 + 144) = v24;
    }
  }
  return v9;
}

- (id)_initWithPhotosAddedNotification:(id)a3 mergedWithNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PLNotification *)self _initWithType:3];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 3, *((id *)v6 + 3));
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v11 = v9[19];
    v9[19] = v10;

    if (v9[3]) {
      objc_msgSend(v9[19], "addObject:");
    }
    objc_storeStrong(v9 + 4, *((id *)v6 + 4));
    objc_storeStrong(v9 + 5, *((id *)v6 + 5));
    objc_storeStrong(v9 + 34, *((id *)v6 + 34));
    objc_storeStrong(v9 + 35, *((id *)v6 + 35));
    objc_storeStrong(v9 + 7, *((id *)v6 + 7));
    objc_storeStrong(v9 + 6, *((id *)v6 + 6));
    *((unsigned char *)v9 + 64) = *((unsigned char *)v6 + 64);
    *((unsigned char *)v9 + 65) = *((unsigned char *)v6 + 65);
    *((unsigned char *)v9 + 66) = *((unsigned char *)v6 + 66);
    uint64_t v12 = (void *)v7[40];
    if (v12) {
      objc_storeStrong(v9 + 40, v12);
    }
    uint64_t v13 = [*((id *)v6 + 9) mutableCopy];
    id v14 = v9[9];
    v9[9] = (id)v13;

    [v9[9] unionSet:v7[9]];
    uint64_t v15 = [v6 notificationType];
    if (v15 == [v7 notificationType]) {
      uint64_t v16 = [v9[9] count];
    }
    else {
      uint64_t v16 = *((void *)v6 + 10);
    }
    v9[10] = (id)v16;
    uint64_t v17 = [*((id *)v6 + 11) mutableCopy];
    id v18 = v9[11];
    v9[11] = (id)v17;

    [v9[11] unionSet:v7[11]];
    uint64_t v19 = [*((id *)v6 + 12) mutableCopy];
    id v20 = v9[12];
    v9[12] = (id)v19;

    [v9[12] unionSet:v7[12]];
    id v21 = (id *)v6;
    if ([v7 notificationType] == 4)
    {
      uint64_t v22 = v7;

      id v21 = v22;
    }
    objc_storeStrong(v9 + 14, v21[14]);
    objc_storeStrong(v9 + 15, v21[15]);
    objc_storeStrong(v9 + 16, v21[16]);
    *((unsigned char *)v9 + 144) = *((unsigned char *)v21 + 144);
  }
  return v9;
}

- (PLNotification)initWithAssetsAdded:(id)a3 toAlbum:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PLNotification.m", 252, @"Invalid parameter not satisfying: %@", @"assetsAdded" object file lineNumber description];
  }
  if ([v7 count])
  {
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    id v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PLNotification.m", 253, @"Invalid parameter not satisfying: %@", @"[assetsAdded count]" object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"PLNotification.m", 254, @"Invalid parameter not satisfying: %@", @"album" object file lineNumber description];

LABEL_5:
  double v9 = [(PLNotification *)self _initWithType:3];
  if (v9)
  {
    uint64_t v50 = 0;
    uint64_t v51 = &v50;
    uint64_t v52 = 0x3032000000;
    uint64_t v53 = __Block_byref_object_copy__78111;
    uint64_t v54 = __Block_byref_object_dispose__78112;
    id v55 = [v7 firstObject];
    id v10 = [v8 assets];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke;
    v47[3] = &unk_1E586F878;
    id v11 = v7;
    id v48 = v11;
    v49 = &v50;
    [v10 enumerateObjectsUsingBlock:v47];

    uint64_t v12 = [(id)v51[5] cloudOwnerFullName];
    uint64_t v13 = [v12 copy];
    senderName = v9->_senderName;
    v9->_senderName = (NSString *)v13;

    uint64_t v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    senderNames = v9->_senderNames;
    v9->_senderNames = v15;

    if (v9->_senderName) {
      -[NSMutableSet addObject:](v9->_senderNames, "addObject:");
    }
    uint64_t v17 = [(id)v51[5] cloudOwnerEmail];
    uint64_t v18 = [v17 copy];
    senderEmailAddress = v9->_senderEmailAddress;
    v9->_senderEmailAddress = (NSString *)v18;

    id v20 = [v8 localizedTitle];
    uint64_t v21 = [v20 copy];
    albumTitle = v9->_albumTitle;
    v9->_albumTitle = (NSString *)v21;

    id v23 = [v8 uuid];
    uint64_t v24 = [v23 copy];
    albumUUID = v9->_albumUUID;
    v9->_albumUUID = (NSString *)v24;

    id v26 = [v8 cloudGUID];
    uint64_t v27 = [v26 copy];
    albumCloudGUID = v9->_albumCloudGUID;
    v9->_albumCloudGUID = (NSString *)v27;

    id v29 = [(id)v51[5] uuid];
    uint64_t v30 = [v29 copy];
    mainAssetUUID = v9->_mainAssetUUID;
    v9->_mainAssetUUID = (NSString *)v30;

    id v32 = [(id)v51[5] cloudBatchID];
    uint64_t v33 = [v32 copy];
    photosBatchID = v9->_photosBatchID;
    v9->_photosBatchID = (NSString *)v33;

    v9->_mainAssetIsMine = [(id)v51[5] cloudIsMyAsset];
    v9->_BOOL mainAssetIsVideo = [(id)v51[5] isVideo];
    id v35 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    assetUUIDs = v9->_assetUUIDs;
    v9->_assetUUIDs = v35;

    v9->_int64_t assetCount = [v11 count];
    uint64_t v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    placeholderAssetUUIDs = v9->_placeholderAssetUUIDs;
    v9->_placeholderAssetUUIDs = v37;

    char v39 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lowResThumbAssetUUIDs = v9->_lowResThumbAssetUUIDs;
    v9->_lowResThumbAssetUUIDs = v39;

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke_2;
    v45[3] = &unk_1E5872990;
    int64_t v46 = v9;
    [v11 enumerateObjectsUsingBlock:v45];

    _Block_object_dispose(&v50, 8);
  }

  return v9;
}

void __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __46__PLNotification_initWithAssetsAdded_toAlbum___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  int v3 = [v8 cloudPlaceholderKind];
  if (v3 == 3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  else
  {
    if ((unsigned __int16)v3 != 2) {
      goto LABEL_6;
    }
    id v4 = *(void **)(*(void *)(a1 + 32) + 88);
  }
  id v5 = [v8 uuid];
  [v4 addObject:v5];

LABEL_6:
  id v6 = *(void **)(*(void *)(a1 + 32) + 72);
  id v7 = [v8 uuid];
  [v6 addObject:v7];
}

- (PLNotification)initWithAssetAdded:(id)a3 atIndex:(unint64_t)a4 toAlbum:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"PLNotification.m", 202, @"Invalid parameter not satisfying: %@", @"assetAdded" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
  [v50 handleFailureInMethod:a2, self, @"PLNotification.m", 203, @"Invalid parameter not satisfying: %@", @"album" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [(PLNotification *)self _initWithType:3];
  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v13 = [v9 cloudOwnerFullName];
  uint64_t v14 = [v13 copy];
  senderName = v12->_senderName;
  v12->_senderName = (NSString *)v14;

  uint64_t v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  senderNames = v12->_senderNames;
  v12->_senderNames = v16;

  if (v12->_senderName) {
    -[NSMutableSet addObject:](v12->_senderNames, "addObject:");
  }
  uint64_t v18 = [v9 cloudOwnerEmail];
  uint64_t v19 = [v18 copy];
  senderEmailAddress = v12->_senderEmailAddress;
  v12->_senderEmailAddress = (NSString *)v19;

  uint64_t v21 = [v11 localizedTitle];
  uint64_t v22 = [v21 copy];
  albumTitle = v12->_albumTitle;
  v12->_albumTitle = (NSString *)v22;

  uint64_t v24 = [v11 uuid];
  uint64_t v25 = [v24 copy];
  albumUUID = v12->_albumUUID;
  v12->_albumUUID = (NSString *)v25;

  uint64_t v27 = [v11 cloudGUID];
  uint64_t v28 = [v27 copy];
  albumCloudGUID = v12->_albumCloudGUID;
  v12->_albumCloudGUID = (NSString *)v28;

  uint64_t v30 = [v9 uuid];
  uint64_t v31 = [v30 copy];
  mainAssetUUID = v12->_mainAssetUUID;
  v12->_mainAssetUUID = (NSString *)v31;

  uint64_t v33 = [v9 cloudBatchID];
  uint64_t v34 = [v33 copy];
  photosBatchID = v12->_photosBatchID;
  v12->_photosBatchID = (NSString *)v34;

  v12->_mainAssetIsMine = [v9 cloudIsMyAsset];
  v12->_BOOL mainAssetIsVideo = [v9 isVideo];
  uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v12->_mainAssetUUID, 0);
  assetUUIDs = v12->_assetUUIDs;
  v12->_assetUUIDs = (NSMutableSet *)v36;

  v12->_int64_t assetCount = 1;
  id v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  p_placeholderAssetUUIDs = (id *)&v12->_placeholderAssetUUIDs;
  placeholderAssetUUIDs = v12->_placeholderAssetUUIDs;
  v12->_placeholderAssetUUIDs = v38;

  uint64_t v41 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  lowResThumbAssetUUIDs = v12->_lowResThumbAssetUUIDs;
  v12->_lowResThumbAssetUUIDs = v41;

  int v43 = [v9 cloudPlaceholderKind];
  if (v43 != 2)
  {
    if ((unsigned __int16)v43 != 3) {
      goto LABEL_10;
    }
    p_placeholderAssetUUIDs = (id *)&v12->_lowResThumbAssetUUIDs;
  }
  [*p_placeholderAssetUUIDs addObject:v12->_mainAssetUUID];
LABEL_10:
  v12->_containsBatchFirstKnownAsset = 1;
  if (a4)
  {
    id v44 = [v11 assets];
    uint64_t v45 = [v44 objectAtIndex:a4 - 1];

    int64_t v46 = [v9 cloudBatchID];
    int v47 = [v45 cloudBatchID];
    v12->_containsBatchFirstKnownAsset = [v46 isEqualToString:v47] ^ 1;
  }
LABEL_12:

  return v12;
}

- (PLNotification)initWithMultipleContributorEnabledForAlbum:(id)a3
{
  id v4 = a3;
  id v5 = [(PLNotification *)self _initWithType:2];
  if (v5)
  {
    id v6 = [v4 cloudOwnerDisplayNameIncludingEmail:0 allowsEmail:1];
    uint64_t v7 = [v6 copy];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v7;

    id v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v9;

    if (v5->_senderName) {
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    }
    id v11 = [v4 cloudOwnerEmail];
    uint64_t v12 = [v11 copy];
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v12;

    uint64_t v14 = [v4 localizedTitle];
    uint64_t v15 = [v14 copy];
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v15;

    uint64_t v17 = [v4 uuid];
    uint64_t v18 = [v17 copy];
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v18;

    id v20 = [v4 cloudGUID];
    uint64_t v21 = [v20 copy];
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v21;
  }
  return v5;
}

- (PLNotification)initWithInvitationRecordStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PLNotification *)self _initWithType:1];
  if (v5)
  {
    id v6 = [v4 album];
    uint64_t v7 = [v4 inviteeDisplayNameIncludingEmail:0];
    uint64_t v8 = [v7 copy];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v8;

    id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v10;

    if (v5->_senderName) {
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    }
    uint64_t v12 = [v4 inviteeEmails];
    uint64_t v13 = [v12 firstObject];
    uint64_t v14 = [v13 copy];
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v14;

    uint64_t v16 = [v6 localizedTitle];
    uint64_t v17 = [v16 copy];
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v17;

    uint64_t v19 = [v6 uuid];
    uint64_t v20 = [v19 copy];
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v20;

    uint64_t v22 = [v4 invitationState];
    v5->_int invitationState = [v22 intValue];

    id v23 = [v6 cloudGUID];
    uint64_t v24 = [v23 copy];
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v24;
  }
  return v5;
}

- (PLNotification)initWithInvitationAlbum:(id)a3
{
  id v4 = a3;
  id v5 = [(PLNotification *)self _initWithType:0];
  if (v5)
  {
    id v6 = [v4 cloudOwnerDisplayNameIncludingEmail:0 allowsEmail:1];
    uint64_t v7 = [v6 copy];
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v7;

    id v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    senderNames = v5->_senderNames;
    v5->_senderNames = v9;

    if (v5->_senderName) {
      -[NSMutableSet addObject:](v5->_senderNames, "addObject:");
    }
    id v11 = [v4 cloudOwnerEmail];
    uint64_t v12 = [v11 copy];
    senderEmailAddress = v5->_senderEmailAddress;
    v5->_senderEmailAddress = (NSString *)v12;

    uint64_t v14 = [v4 localizedTitle];
    uint64_t v15 = [v14 copy];
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v15;

    uint64_t v17 = [v4 uuid];
    uint64_t v18 = [v17 copy];
    albumUUID = v5->_albumUUID;
    v5->_albumUUID = (NSString *)v18;

    uint64_t v20 = [v4 cloudGUID];
    uint64_t v21 = [v20 copy];
    albumCloudGUID = v5->_albumCloudGUID;
    v5->_albumCloudGUID = (NSString *)v21;

    v5->_offerToReportAsJunk = [v4 cloudOwnerIsWhitelisted] ^ 1;
  }

  return v5;
}

- (id)_initWithType:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PLNotification;
  id v4 = [(PLNotification *)&v15 init];
  id v5 = v4;
  if (v4)
  {
    v4->_int64_t notificationType = a3;
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v7 = [v6 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v7;

    uint64_t v9 = [(NSDate *)v5->_date copy];
    originalDate = v5->_originalDate;
    v5->_originalDate = (NSDate *)v9;

    id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:604800.0];
    uint64_t v12 = [v11 copy];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;
  }
  return v5;
}

- (PLNotification)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLNotification.m" lineNumber:124 description:@"Do not use this initializer"];

  return 0;
}

+ (id)_UNCategoryFromNotificationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xF) {
    return @"PLUNCategoryInvitationReceived";
  }
  else {
    return off_1E586F8F0[a3 - 1];
  }
}

+ (id)requestIdentifierByNotificationType:(int64_t)a3 keyObjectUUID:(id)a4 photosBatchID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _UNCategoryFromNotificationType:a3];
  if ([v8 length]) {
    [NSString stringWithFormat:@"%@_%@_%@", v10, v9, v8];
  }
  else {
  id v11 = [NSString stringWithFormat:@"%@_%@", v10, v9, v13];
  }

  return v11;
}

@end