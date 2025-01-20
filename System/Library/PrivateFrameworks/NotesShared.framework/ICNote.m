@interface ICNote
+ (BOOL)containsUndeletableNotes:(id)a3;
+ (BOOL)containsUnduplicatableNotes:(id)a3;
+ (BOOL)containsUnmovableNotes:(id)a3;
+ (BOOL)didShowExceededStorageQuotaAlertForNoteWithIdentifier:(id)a3;
+ (BOOL)notes:(id)a3 containSharedNotesNotSharedViaFolder:(id)a4;
+ (BOOL)supportsActivityEvents;
+ (BOOL)supportsNotesVersionTracking;
+ (BOOL)supportsUserSpecificRecords;
+ (ICNote)noteWithIdentifier:(id)a3 accountID:(id)a4 context:(id)a5;
+ (ICNote)noteWithIdentifier:(id)a3 context:(id)a4;
+ (ICNote)noteWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 accountID:(id)a5 context:(id)a6;
+ (ICNote)noteWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 context:(id)a5;
+ (ICNote)noteWithLegacyManagedObjectID:(id)a3 context:(id)a4;
+ (ICNote)noteWithUUID:(id)a3 context:(id)a4;
+ (id)accountIdentifiersOfNotes:(id)a3;
+ (id)allNotesInContext:(id)a3;
+ (id)allPasswordProtectedNoteIdentifiersInContext:(id)a3;
+ (id)contentInfoAttributedTextWithSnippet:(id)a3 attachmentContentInfoType:(signed __int16)a4 attachmentContentInfoCount:(int64_t)a5 account:(id)a6;
+ (id)contentInfoTextWithSnippet:(id)a3 attachmentContentInfoType:(signed __int16)a4 attachmentContentInfoCount:(int64_t)a5 account:(id)a6;
+ (id)defaultTitleForEmptyNote;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud;
+ (id)keyPathsForValuesAffectingCloudAccount;
+ (id)keyPathsForValuesAffectingHasUnreadChanges;
+ (id)keyPathsForValuesAffectingIsDeletable;
+ (id)keyPathsForValuesAffectingIsEditable;
+ (id)keyPathsForValuesAffectingPrefersLightBackground;
+ (id)keyPathsForValuesAffectingRecentUpdatesGenerationDate;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newEmptyNoteInContext:(id)a3;
+ (id)newEmptyNoteInFolder:(id)a3;
+ (id)newEmptyNoteWithIdentifier:(id)a3 folder:(id)a4;
+ (id)newEmptyNoteWithUUID:(id)a3 folder:(id)a4;
+ (id)newFetchRequestForNotes;
+ (id)newNoteWithoutIdentifierInAccount:(id)a3;
+ (id)newNoteWithoutIdentifierInFolder:(id)a3;
+ (id)newObjectWithIdentifier:(id)a3 context:(id)a4;
+ (id)newObjectWithIdentifier:(id)a3 folder:(id)a4;
+ (id)newPlaceholderObjectForRecordName:(id)a3 account:(id)a4;
+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)noteIdentifiersMatchingPredicate:(id)a3 context:(id)a4;
+ (id)notesContainingHashtagWithStandarizedContent:(id)a3 context:(id)a4;
+ (id)notesMatchingPredicate:(id)a3 context:(id)a4;
+ (id)passwordProtectedNoteIdentifiersForAccount:(id)a3;
+ (id)predicateForNote:(id)a3;
+ (id)predicateForNotesInAccountWithIdentifier:(id)a3;
+ (id)predicateForNotesWithChecklists;
+ (id)predicateForPinnedNotes;
+ (id)predicateForSearchableNotesInContext:(id)a3;
+ (id)predicateForSystemPaperNotes;
+ (id)predicateForSystemPaperNotesNotInTrash;
+ (id)predicateForVisibleNotesInContext:(id)a3;
+ (id)predicateForVisibleNotesIncludingTrash:(BOOL)a3 includingSystemPaper:(BOOL)a4 includingMathNotes:(BOOL)a5 includingCallNotes:(BOOL)a6 inContext:(id)a7;
+ (id)refreshAllOfNoteWithIdentifier:(id)a3 context:(id)a4;
+ (id)snippetForPasswordProtectedNote:(id)a3;
+ (id)systemPaperNotesFetchRequest;
+ (id)visibleNoteWithIdentifier:(id)a3 context:(id)a4;
+ (id)visibleNotesInContext:(id)a3;
+ (unint64_t)countOfAllNotesInContext:(id)a3;
+ (unint64_t)countOfNotesMatchingPredicate:(id)a3 context:(id)a4;
+ (unint64_t)countOfPasswordProtectedNotesInContext:(id)a3;
+ (unint64_t)countOfVisibleNotesInContext:(id)a3;
+ (unint64_t)countOfVisiblePasswordProtectedNotesInAccount:(id)a3;
+ (unint64_t)maxNoteAttachments;
+ (unint64_t)maxNoteTextLength;
+ (void)createNoteForAirDropDocument:(id)a3 legacyContext:(id)a4 processAttributedString:(id)a5 completion:(id)a6;
+ (void)deleteEmptyNote:(id)a3;
+ (void)deleteNote:(id)a3;
+ (void)enumerateNotesInContext:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 usingBlock:(id)a7;
+ (void)purgeNote:(id)a3;
+ (void)setDidShowExceededStorageQuotaAlert:(BOOL)a3 forNoteWithIdentifier:(id)a4;
- (BOOL)addUserID:(id)a3 forReplicaID:(id)a4;
- (BOOL)allowsNewTextLength:(unint64_t)a3;
- (BOOL)attachmentCountExceeded;
- (BOOL)attachmentExceedsMaxSizeAllowed:(unint64_t)a3;
- (BOOL)canAddAttachment;
- (BOOL)canAddAttachments:(unint64_t)a3;
- (BOOL)canBeRootShareObject;
- (BOOL)canBeSharedViaICloud;
- (BOOL)containsAttachmentWithDeepLink;
- (BOOL)containsAttachmentsUnsupportedInPasswordProtection;
- (BOOL)containsPlaceholderBlockOrInlineAttachments;
- (BOOL)hasAllMandatoryFields;
- (BOOL)hasChecklistOnlyInProgress:(BOOL)a3;
- (BOOL)hasLoadedDocument;
- (BOOL)hasTags;
- (BOOL)hasThumbnailImage;
- (BOOL)hasUnreadChanges;
- (BOOL)hasVisibleInlineAttachments;
- (BOOL)isCallNote;
- (BOOL)isDeletable;
- (BOOL)isDeletedOrInTrash;
- (BOOL)isDuplicatable;
- (BOOL)isEditable;
- (BOOL)isEmpty;
- (BOOL)isHiddenFromIndexing;
- (BOOL)isInICloudAccount;
- (BOOL)isLockable;
- (BOOL)isMathNote;
- (BOOL)isModernNote;
- (BOOL)isMovable;
- (BOOL)isNewNoteWithHashtagsInsertedIntoBody;
- (BOOL)isPerformingMerge;
- (BOOL)isPinnable;
- (BOOL)isRecoveringCryptoWrappedKey;
- (BOOL)isSearchIndexableNote;
- (BOOL)isSharable;
- (BOOL)isSharedAndEmpty;
- (BOOL)isSharedViaICloudFolder;
- (BOOL)isVisible;
- (BOOL)mergeCloudKitRecord:(id)a3 account:(id)a4 approach:(int64_t)a5;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)mergeCloudKitRecord:(id)a3 mergePolicy:(int64_t)a4 account:(id)a5 approach:(int64_t)a6 mergeableFieldState:(id)a7;
- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4;
- (BOOL)mergeEncryptedDataFromRecord:(id)a3;
- (BOOL)needsInitialDerivedAttributesUpdate;
- (BOOL)needsRefresh;
- (BOOL)needsToBeDeletedFromCloud;
- (BOOL)needsToDeleteShare;
- (BOOL)needsToSaveLastViewedTimestamp;
- (BOOL)objc_hasRecentExternalEdits;
- (BOOL)prefersLightBackground;
- (BOOL)preventReleasingTextStorage;
- (BOOL)regenerateTitle:(BOOL)a3 snippet:(BOOL)a4;
- (BOOL)regenerateTitle:(BOOL)a3 snippet:(BOOL)a4 isNewNote:(BOOL)a5;
- (BOOL)regenerateTitleAndSnippetIfNecessaryForEdit:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (BOOL)requiresLegacyTombstoneAfterDeletion;
- (BOOL)saveNoteData;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (BOOL)shouldAddMediaAsynchronously;
- (BOOL)shouldReleaseDocumentWhenTurningIntoFault;
- (BOOL)shouldSyncMinimumSupportedNotesVersion;
- (BOOL)showsCollaboratorCursors;
- (BOOL)supportsDeletionByTTL;
- (BOOL)textStorageHasAttribute:(id)a3;
- (BOOL)updateDeviceReplicaIDsToUserIDIfNeeded;
- (BOOL)updateLastViewedTimestampWithCurrentTimestamp;
- (BOOL)wantsUndoCommands;
- (BOOL)wantsUserSpecificRecord;
- (BOOL)wasAuthenticatedBeforeTurningIntoFault;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (ICMergeableDictionary)replicaIDToUserID;
- (ICNote)noteWithoutTitle;
- (ICOutlineState)outlineState;
- (ICSelectorDelayer)updateLinksSelectorDelayer;
- (ICTTMergeableStringVersionedDocument)document;
- (ICTTMergeableStringVersionedDocument)documentWithoutCreating;
- (ICTTVectorMultiTimestamp)archivedTimestamp;
- (ICTTVectorMultiTimestamp)lastNotifiedTimestamp;
- (ICTTVectorMultiTimestamp)lastViewedTimestamp;
- (ICTTVectorMultiTimestamp)timestamp;
- (NSArray)allDocumentMergeControllers;
- (NSArray)authorsExcludingCurrentUser;
- (NSAttributedString)attributedContentInfoText;
- (NSAttributedString)trimmedAttributedTitle;
- (NSData)decryptedData;
- (NSDate)recentUpdatesFirstSeenDate;
- (NSDate)recentUpdatesGenerationDate;
- (NSSet)distinctAttachmentViewTypes;
- (NSSet)noteCellKeyPaths;
- (NSString)accountName;
- (NSString)contentInfoText;
- (NSString)dataSourceIdentifier;
- (NSString)folderManagedIdentifier;
- (NSString)folderName;
- (NSString)folderNameForNoteList;
- (NSString)noteAsPlainTextWithoutTitle;
- (NSString)recordType;
- (NSString)searchDomainIdentifier;
- (NSString)searchIndexingIdentifier;
- (NSString)trimmedTitle;
- (NSString)widgetInfoText;
- (NSURL)paperCoherenceContextURL;
- (_NSRange)rangeForAttachment:(id)a3;
- (_NSRange)rangeForSnippetWithTitleRange:(_NSRange)a3;
- (_NSRange)rangeForTitle:(BOOL *)a3;
- (_NSRange)textRangeForSearchRange:(_NSRange)a3 inSearchableString:(id)a4;
- (id)addAttachment;
- (id)addAttachmentWithData:(id)a3 filename:(id)a4;
- (id)addAttachmentWithFileURL:(id)a3;
- (id)addAttachmentWithFileURL:(id)a3 updateFileBasedAttributes:(BOOL)a4 analytics:(BOOL)a5;
- (id)addAttachmentWithFileWrapper:(id)a3;
- (id)addAttachmentWithIdentifier:(id)a3;
- (id)addAttachmentWithRemoteFileURL:(id)a3;
- (id)addAttachmentWithUTI:(id)a3;
- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filename:(id)a5;
- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filename:(id)a5 updateFileBasedAttributes:(BOOL)a6 analytics:(BOOL)a7 regulatoryLogging:(BOOL)a8;
- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filenameExtension:(id)a5;
- (id)addAttachmentWithUTI:(id)a3 identifier:(id)a4 urlString:(id)a5 analytics:(BOOL)a6;
- (id)addAttachmentWithUTI:(id)a3 identifier:(id)a4 urlString:(id)a5 analytics:(BOOL)a6 regulatoryLogging:(BOOL)a7;
- (id)addAttachmentWithUTI:(id)a3 withURL:(id)a4;
- (id)addAttachmentWithUTI:(id)a3 withURL:(id)a4 updateFileBasedAttributes:(BOOL)a5 analytics:(BOOL)a6;
- (id)addAudioAttachmentWithIdentifier:(id)a3;
- (id)addGalleryAttachmentWithIdentifier:(id)a3;
- (id)addInlineAttachmentWithIdentifier:(id)a3;
- (id)addInlineDrawingAttachmentWithAnalytics:(BOOL)a3;
- (id)addPaperDocumentAttachmentWithIdentifier:(id)a3 subtype:(id)a4;
- (id)addSynapseLinkAttachmentWithContentItem:(id)a3;
- (id)addSystemPaperAttachmentWithIdentifier:(id)a3;
- (id)addTableAttachment;
- (id)addTableAttachmentWithTableData:(id)a3;
- (id)addTableAttachmentWithText:(id)a3;
- (id)addURLAttachmentWithURL:(id)a3;
- (id)additionalSearchIndexablesForChangedKeys:(id)a3;
- (id)allAttachmentsIncludingSubAttachments;
- (id)allDrawings;
- (id)allNoteTextAttachmentsIncludingSubAttachments:(BOOL)a3;
- (id)allNoteTextInlineAttachments;
- (id)anyVisibleInstanceOfHashtag:(id)a3;
- (id)attachmentForWebThumbnail;
- (id)attachmentWithIdentifier:(id)a3;
- (id)attachmentsInOrder;
- (id)attachmentsWithUTType:(id)a3;
- (id)attributedString;
- (id)childCloudObjects;
- (id)childCloudObjectsForMinimumSupportedVersionPropagation;
- (id)cloudAccount;
- (id)cryptoStrategyProtocol;
- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3;
- (id)folderReferenceFromRecord:(id)a3;
- (id)ic_loggingValues;
- (id)inlineAttachmentWithICTTAttachment:(id)a3;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3;
- (id)mergeableString;
- (id)minimumNotesVersionForAllParticipants;
- (id)minimumNotesVersionForUserIDs:(id)a3;
- (id)newAirDropDocument;
- (id)noteAsPlainText;
- (id)notesVersionForParticipant:(id)a3;
- (id)notesVersionForUserID:(id)a3;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)participantForReplicaID:(id)a3;
- (id)primaryEncryptedData;
- (id)primaryEncryptedDataFromRecord:(id)a3;
- (id)quotedTitle;
- (id)recordZoneName;
- (id)reservedForCollaborationColorManager;
- (id)reservedForTextContentStorage;
- (id)searchableString;
- (id)shareType;
- (id)showsCollaboratorCursorsUserDefaultsKey;
- (id)textDataDecryptedIfNecessary;
- (id)userIDForReplicaID:(id)a3;
- (id)uuid;
- (id)visibleAttachments;
- (id)visibleAttachmentsWithType:(signed __int16)a3;
- (id)visibleInlineAttachments;
- (id)visibleTopLevelAttachments;
- (id)widgetSnippetByEnumeratingAttachments;
- (int64_t)attachmentContentInfoCount;
- (int64_t)currentStatus;
- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3;
- (int64_t)mergePolicyForRecord:(id)a3;
- (int64_t)visibilityTestingType;
- (signed)attachmentContentInfoType;
- (unint64_t)mergeReplicaIDToUserID:(id)a3;
- (unint64_t)mergeWithNoteData:(id)a3;
- (unint64_t)performMerge:(id)a3;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (unint64_t)textOffsetAtSearchIndex:(unint64_t)a3 inSearchableString:(id)a4;
- (unint64_t)visibleTopLevelAttachmentsCount;
- (void)_updateLinksOnMainThreadSelectorDelayer;
- (void)addInlineAttachments:(id)a3;
- (void)addInlineAttachmentsObject:(id)a3;
- (void)addMediaToAttachment:(id)a3 withBlock:(id)a4;
- (void)addNoteBodyToRecord:(id)a3 forApproach:(int64_t)a4 mergeableFieldState:(id)a5;
- (void)addShareParticipantsToAttributeSet:(id)a3;
- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3;
- (void)awakeFromFetch;
- (void)changePinStatusIfPossible;
- (void)clearDecryptedData;
- (void)clearRecentUpdatesGenerationDateIfNeeded;
- (void)dealloc;
- (void)deduplicateSelfAndCreateNewObjectFromRecord:(id)a3;
- (void)deleteFromLocalDatabase;
- (void)didAcceptShare:(id)a3;
- (void)didChangeNoteText;
- (void)didFetchUserSpecificRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5;
- (void)didRefresh:(BOOL)a3;
- (void)didSave;
- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)enumerateAbstractAttachmentsInOrderUsingBlock:(id)a3;
- (void)enumerateAttachmentsInOrderUsingBlock:(id)a3;
- (void)enumerateInlineAttachmentsInOrderUsingBlock:(id)a3;
- (void)fixBrokenReferences;
- (void)inlineAssetsForRecord:(id)a3;
- (void)markActivitySummaryViewed;
- (void)markAsCallNoteIfAttachmentIsCallRecording;
- (void)markAsCallNoteIfNeeded:(BOOL)a3;
- (void)markAsMathNoteIfNeeded:(BOOL)a3;
- (void)markAsSystemPaperIfNeeded:(BOOL)a3;
- (void)markForDeletion;
- (void)markLastActivityRecentUpdatesViewed;
- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4;
- (void)mergeFoldersFromRecord:(id)a3 account:(id)a4;
- (void)mergeNotePrimitiveData;
- (void)mergeTextDataFromRecord:(id)a3 mergePolicy:(int64_t)a4 mergeableFieldState:(id)a5;
- (void)notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5;
- (void)persistPendingChanges;
- (void)prepareForDeletion;
- (void)refreshNoteTextFromDataStore;
- (void)removeInlineAttachments:(id)a3;
- (void)removeInlineAttachmentsObject:(id)a3;
- (void)replaceWithDocument:(id)a3;
- (void)saveNoteData;
- (void)setAccount:(id)a3;
- (void)setArchivedTimestamp:(id)a3;
- (void)setAttachmentViewType:(signed __int16)a3;
- (void)setCryptoInitializationVector:(id)a3;
- (void)setCryptoTag:(id)a3;
- (void)setDecryptedData:(id)a3;
- (void)setDocument:(id)a3;
- (void)setFolder:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setIsNewNoteWithHashtagsInsertedIntoBody:(BOOL)a3;
- (void)setIsPerformingMerge:(BOOL)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setIsRecoveringCryptoWrappedKey:(BOOL)a3;
- (void)setLastActivityRecentUpdatesViewedDate:(id)a3;
- (void)setLastNotifiedTimestamp:(id)a3;
- (void)setLastViewedTimestamp:(id)a3;
- (void)setLegacyManagedObjectID:(id)a3;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)setNeedsInitialFetchFromCloud:(BOOL)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setNeedsToSaveLastViewedTimestamp:(BOOL)a3;
- (void)setOutlineState:(id)a3;
- (void)setOutlineStateData:(id)a3;
- (void)setPreventReleasingTextStorage:(BOOL)a3;
- (void)setPrimaryEncryptedData:(id)a3;
- (void)setRecentUpdatesFirstSeenDate:(id)a3;
- (void)setRecentUpdatesGenerationDate:(id)a3;
- (void)setReservedForCollaborationColorManager:(id)a3;
- (void)setReservedForTextContentStorage:(id)a3;
- (void)setShouldAddMediaAsynchronously:(BOOL)a3;
- (void)setShowsCollaboratorCursors:(BOOL)a3;
- (void)setUpdateLinksSelectorDelayer:(id)a3;
- (void)setWasAuthenticatedBeforeTurningIntoFault:(BOOL)a3;
- (void)turnAttachmentsIntoFaults;
- (void)unmarkForDeletion;
- (void)updateArchivedAndLastViewedTimeStampsAfterSavingNoteData;
- (void)updateAttachmentViewTypeAndPropagateToAttachments:(signed __int16)a3;
- (void)updateChangeCountWithReason:(id)a3;
- (void)updateDerivedAttributesIfNeeded;
- (void)updateDeviceReplicaIDsToUserIDIfNeeded;
- (void)updateLastViewedTimestampWithCurrentTimestamp;
- (void)updateLinksWhenPossible;
- (void)updateTimestampWithUnserializedChanges;
- (void)visibleTopLevelAttachmentsCount;
- (void)widgetSnippetByEnumeratingAttachments;
- (void)willRefresh:(BOOL)a3;
- (void)willSave;
- (void)willTurnIntoFault;
- (void)willUpdateDeviceReplicaIDsToNotesVersion:(int64_t)a3;
- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(id)a3;
@end

@implementation ICNote

- (id)reservedForTextContentStorage
{
  return self->_reservedForTextContentStorage;
}

- (BOOL)isEditable
{
  v3 = [(ICNote *)self folder];
  int v4 = [v3 supportsEditingNotes];

  if (v4 && ![(ICCloudSyncingObject *)self isSharedReadOnly]) {
    return ![(ICCloudSyncingObject *)self isUnsupported];
  }
  else {
    return 0;
  }
}

- (ICTTMergeableStringVersionedDocument)documentWithoutCreating
{
  return self->_document;
}

- (BOOL)prefersLightBackground
{
  return [(ICNote *)self preferredBackgroundType] == 2;
}

uint64_t __48__ICNote_enumerateAttachmentsInOrderUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setReservedForTextContentStorage:(id)a3
{
}

- (BOOL)isEmpty
{
  v3 = [(ICNote *)self managedObjectContext];

  if (!v3) {
    return 0;
  }
  if ([(ICNote *)self isPasswordProtected]) {
    return 0;
  }
  if ([(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    int v4 = [(ICNote *)self folder];
    int v5 = [v4 isSharedViaICloud];

    if (!v5) {
      return 0;
    }
  }
  v6 = [(ICNote *)self mergeableString];
  if (v6)
  {
    v7 = [(ICNote *)self mergeableString];
    BOOL v8 = [v7 length] == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)mergeableString
{
  v2 = [(ICNote *)self document];
  v3 = [v2 mergeableString];

  return v3;
}

- (ICTTMergeableStringVersionedDocument)document
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(ICNote *)self managedObjectContext];

  if (v3)
  {
    if (!self->_document)
    {
      int v4 = [(ICNote *)self textDataDecryptedIfNecessary];
      if (![(ICNote *)self isPasswordProtected]
        || ([(ICNote *)self noteData],
            int v5 = objc_claimAutoreleasedReturnValue(),
            [v5 data],
            v6 = objc_claimAutoreleasedReturnValue(),
            v6,
            v5,
            v4)
        || !v6)
      {
        v7 = [ICTTMergeableStringVersionedDocument alloc];
        BOOL v8 = [(ICCloudSyncingObject *)self currentReplicaID];
        v9 = [(ICTTVersionedDocument *)v7 initWithData:v4 replicaID:v8];
        document = self->_document;
        self->_document = v9;

        v11 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
        [v11 setDelegate:self];

        v12 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
        v13 = [v12 timestamp];
        [(ICNote *)self setArchivedTimestamp:v13];

        if (objc_opt_respondsToSelector()) {
          [(ICNote *)self noteDidReplaceDocument];
        }
        [(ICCloudSyncingObject *)self mergeUnappliedEncryptedRecord];
      }
    }
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v18 = 138412290;
      v19 = v15;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Trying to access the text storage on a note that has no managed object context: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  v16 = self->_document;
  return v16;
}

- (id)userIDForReplicaID:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
  if ([v4 isEqual:v5])
  {
    v6 = [(ICNote *)self account];
    v7 = [v6 userRecordName];
  }
  else
  {
    v6 = [(ICNote *)self replicaIDToUserID];
    BOOL v8 = [v4 UUIDString];
    v7 = [v6 objectForKeyedSubscript:v8];
  }
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unknown");
    id v9 = [v10 UUIDString];
  }
  return v9;
}

- (ICMergeableDictionary)replicaIDToUserID
{
  replicaIDToUserID = self->_replicaIDToUserID;
  if (replicaIDToUserID)
  {
    id v4 = replicaIDToUserID;
    int v5 = self->_replicaIDToUserID;
    self->_replicaIDToUserID = v4;
  }
  else
  {
    v6 = [ICMergeableDictionary alloc];
    int v5 = [(ICNote *)self replicaIDToUserIDDictData];
    v7 = [(ICCloudSyncingObject *)self currentReplicaID];
    BOOL v8 = [(ICMergeableDictionary *)v6 initWithData:v5 replicaID:v7];
    id v9 = self->_replicaIDToUserID;
    self->_replicaIDToUserID = v8;
  }
  v10 = self->_replicaIDToUserID;
  return v10;
}

+ (BOOL)supportsNotesVersionTracking
{
  return 1;
}

- (id)cloudAccount
{
  v3 = [(ICNote *)self account];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(ICNote *)self folder];
    id v5 = [v6 cloudAccount];
  }
  return v5;
}

- (void)setArchivedTimestamp:(id)a3
{
}

- (id)childCloudObjects
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(ICNote *)self attachments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v3 addObject:v9];
        v10 = [v9 media];

        if (v10)
        {
          v11 = [v9 media];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v12 = [(ICNote *)self inlineAttachments];
  v13 = [v12 allObjects];
  [v3 addObjectsFromArray:v13];

  v14 = (void *)[v3 copy];
  return v14;
}

- (id)attachmentWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(ICNote *)self attachments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      v11 = [v10 identifier];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v14 = [(ICNote *)self managedObjectContext];
  id v13 = +[ICBaseAttachment attachmentWithIdentifier:v4 context:v14];

LABEL_12:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaIDToUserID, 0);
  objc_storeStrong((id *)&self->updateLinksSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_outlineState, 0);
  objc_storeStrong((id *)&self->_recentUpdatesFirstSeenDate, 0);
  objc_storeStrong((id *)&self->_recentUpdatesGenerationDate, 0);
  objc_storeStrong(&self->_reservedForTextContentStorage, 0);
  objc_storeStrong(&self->_reservedForCollaborationColorManager, 0);
  objc_storeStrong((id *)&self->_lastViewedTimestamp, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTimestamp, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->decryptedData, 0);
  objc_storeStrong((id *)&self->archivedTimestamp, 0);
  objc_storeStrong((id *)&self->_noteDidSaveBlocks, 0);
  objc_destroyWeak(&self->_noteDidSaveObserver);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)enumerateAttachmentsInOrderUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNote *)self attributedString];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(ICNote *)self uiAttributedString];

    uint64_t v5 = (void *)v6;
  }
  uint64_t v7 = [(ICNote *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ICNote_enumerateAttachmentsInOrderUsingBlock___block_invoke;
  v9[3] = &unk_1E64A4C08;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v5, "ic_enumerateAttachmentsInContext:usingBlock:", v7, v9);
}

- (id)attributedString
{
  v2 = [(ICNote *)self mergeableString];
  v3 = [v2 attributedString];

  return v3;
}

+ (ICNote)noteWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 accountID:(id)a5 context:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v11 = (objc_class *)MEMORY[0x1E4F28E78];
  id v12 = a6;
  id v13 = a3;
  v14 = (void *)[[v11 alloc] initWithString:@"identifier ==[c] %@"];
  v15 = v14;
  if (!a4) {
    [v14 appendString:@" AND markedForDeletion = NO"];
  }
  long long v16 = (void *)MEMORY[0x1E4F1CA48];
  long long v17 = (void *)MEMORY[0x1E4F28F60];
  long long v18 = (void *)[v15 copy];
  long long v19 = objc_msgSend(v17, "predicateWithFormat:", v18, v13);

  v27[0] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v21 = [v16 arrayWithArray:v20];

  if ([v10 length])
  {
    v22 = [a1 predicateForNotesInAccountWithIdentifier:v10];
    [v21 addObject:v22];
  }
  v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v21];
  v24 = [a1 notesMatchingPredicate:v23 context:v12];

  v25 = [v24 lastObject];

  return (ICNote *)v25;
}

+ (id)notesMatchingPredicate:(id)a3 context:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F83790];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 sortDescriptorsForCurrentTypeIncludingPinnedNotes:1];
  id v10 = objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", v8, v9, v7);

  return v10;
}

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)ICNote;
  [(ICNote *)&v3 dealloc];
}

- (void)willTurnIntoFault
{
  if (([(ICNote *)self ic_isTransitioning] & 1) == 0
    && ([(ICNote *)self isFault] & 1) == 0)
  {
    [(ICNote *)self setWasAuthenticatedBeforeTurningIntoFault:[(ICCloudSyncingObject *)self isAuthenticated]];
  }
  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  [(ICNote *)&v8 willTurnIntoFault];
  if (self->_document)
  {
    if (objc_opt_respondsToSelector())
    {
      if (([(ICNote *)self shouldReleaseTextStorageWhenTurningIntoFault] & 1) == 0) {
        goto LABEL_12;
      }
    }
    else if (![(ICNote *)self shouldReleaseDocumentWhenTurningIntoFault])
    {
      goto LABEL_12;
    }
    if (objc_opt_respondsToSelector()) {
      [(ICNote *)self noteWillReleaseTextStorage];
    }
    document = self->_document;
    self->_document = 0;
  }
LABEL_12:
  if (objc_opt_respondsToSelector()) {
    [(ICNote *)self noteWillTurnIntoFault];
  }
  lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  self->_lastNotifiedTimestamp = 0;

  lastViewedTimestamp = self->_lastViewedTimestamp;
  self->_lastViewedTimestamp = 0;

  replicaIDToUserID = self->_replicaIDToUserID;
  self->_replicaIDToUserID = 0;

  outlineState = self->_outlineState;
  self->_outlineState = 0;
}

+ (id)predicateForPinnedNotes
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"isPinned == YES"];
}

- (BOOL)hasVisibleInlineAttachments
{
  v2 = [(ICNote *)self inlineAttachments];
  objc_super v3 = +[ICBaseAttachment predicateForVisibleObjects];
  char v4 = objc_msgSend(v2, "ic_containsObjectMatchingPredicate:", v3);

  return v4;
}

+ (unint64_t)countOfNotesMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)[a1 newFetchRequestForNotes];
  [v8 setPredicate:v7];

  unint64_t v9 = [v6 countForFetchRequest:v8 error:0];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)newFetchRequestForNotes
{
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ICNote"];
  objc_super v3 = [MEMORY[0x1E4F83790] sortDescriptorsForCurrentTypeIncludingPinnedNotes:1];
  [v2 setSortDescriptors:v3];

  return v2;
}

+ (id)predicateForVisibleNotesIncludingTrash:(BOOL)a3 includingSystemPaper:(BOOL)a4 includingMathNotes:(BOOL)a5 includingCallNotes:(BOOL)a6 inContext:(id)a7
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v11 = objc_msgSend(a1, "predicateForVisibleObjects", a3, a4, a5, a6, a7);
  v40[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  id v13 = (void *)[v12 mutableCopy];

  if (!a3)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"folder.folderType != %d", 1);
    [v13 addObject:v14];
  }
  if (!a4)
  {
    v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isSystemPaper == NO"];
    [v13 addObject:v15];
  }
  if (!a5)
  {
    long long v16 = (void *)MEMORY[0x1E4F28BA0];
    long long v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"hostApplicationIdentifier = NIL"];
    long long v18 = (void *)MEMORY[0x1E4F28BA0];
    long long v19 = (void *)MEMORY[0x1E4F28F60];
    v38[0] = @"com.apple.greyparrot";
    v38[1] = @"com.apple.calculator";
    v39[0] = v17;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    uint64_t v21 = [v19 predicateWithFormat:@"hostApplicationIdentifier IN %@", v20];
    v22 = [v18 notPredicateWithSubpredicate:v21];
    v39[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v24 = [v16 orPredicateWithSubpredicates:v23];

    [v13 addObject:v24];
  }
  if (!a6)
  {
    v25 = (void *)MEMORY[0x1E4F28BA0];
    v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"hostApplicationIdentifier = NIL"];
    v27 = (void *)MEMORY[0x1E4F28BA0];
    v28 = (void *)MEMORY[0x1E4F28F60];
    v36 = @"com.apple.mobilephone";
    v37[0] = v26;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    v30 = [v28 predicateWithFormat:@"hostApplicationIdentifier IN %@", v29];
    v31 = [v27 notPredicateWithSubpredicate:v30];
    v37[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v33 = [v25 orPredicateWithSubpredicates:v32];

    [v13 addObject:v33];
  }
  v34 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];

  return v34;
}

- (BOOL)isSharable
{
  if (![(ICNote *)self isPasswordProtected]
    || (BOOL v3 = [(ICCloudSyncingObject *)self isAuthenticated]))
  {
    if ([(ICNote *)self isDeletedOrInTrash] || [(ICNote *)self isEmpty]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(ICCloudSyncingObject *)self isUnsupported];
    }
  }
  return v3;
}

- (BOOL)isDeletedOrInTrash
{
  if ([(ICNote *)self markedForDeletion]) {
    return 1;
  }
  char v4 = [(ICNote *)self folder];
  char v5 = [v4 isTrashFolder];

  return v5;
}

void __27__ICNote_didChangeNoteText__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mergeableString];
  if ([v2 hasLocalChanges])
  {
  }
  else
  {
    BOOL v3 = [*(id *)(a1 + 32) mergeableString];
    char v4 = [v3 timestamp];
    char v5 = [*(id *)(a1 + 32) archivedTimestamp];
    char v6 = [v4 compareTo:v5];

    if ((v6 & 4) == 0) {
      return;
    }
  }
  [*(id *)(a1 + 32) willChangeValueForKey:@"isEmpty"];
  id v7 = [*(id *)(a1 + 32) noteData];
  char v8 = [v7 needsToBeSaved];

  if ((v8 & 1) == 0)
  {
    unint64_t v9 = [*(id *)(a1 + 32) noteData];
    [v9 willChangeValueForKey:@"data"];

    id v10 = [*(id *)(a1 + 32) noteData];
    [v10 setNeedsToBeSaved:1];

    v11 = [*(id *)(a1 + 32) noteData];
    [v11 didChangeValueForKey:@"data"];
  }
  [*(id *)(a1 + 32) didChangeValueForKey:@"isEmpty"];
  id v12 = *(void **)(a1 + 32);
  [v12 setThumbnailAttachmentIdentifier:0];
}

- (ICTTVectorMultiTimestamp)archivedTimestamp
{
  return self->archivedTimestamp;
}

- (BOOL)isSharedAndEmpty
{
  BOOL v3 = [(ICCloudSyncingObject *)self isSharedViaICloud];
  if (v3)
  {
    LOBYTE(v3) = [(ICNote *)self isEmpty];
  }
  return v3;
}

- (void)awakeFromFetch
{
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v6 awakeFromFetch];
  if (self->_document)
  {
    if (objc_opt_respondsToSelector())
    {
      BOOL v3 = [(ICNote *)self documentMergeController];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __24__ICNote_awakeFromFetch__block_invoke;
      v5[3] = &unk_1E64A4240;
      v5[4] = self;
      [v3 requestMergeWithBlock:v5];
    }
    else
    {
      [(ICNote *)self mergeNotePrimitiveData];
    }
    if ([(ICNote *)self wasAuthenticatedBeforeTurningIntoFault])
    {
      if ([(ICCloudSyncingObject *)self isPasswordProtectedAndLocked])
      {
        char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v4 postNotificationName:@"ICNoteDidDeauthenticateAfterMergeNotification" object:self];
      }
    }
  }
}

- (BOOL)needsRefresh
{
  return self->needsRefresh;
}

- (BOOL)showsCollaboratorCursors
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [(ICNote *)self showsCollaboratorCursorsUserDefaultsKey];
  unint64_t v9 = v4;
  v10[0] = MEMORY[0x1E4F1CC38];
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v3 registerDefaults:v5];

  objc_super v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = [(ICNote *)self showsCollaboratorCursorsUserDefaultsKey];
  LOBYTE(self) = [v6 BOOLForKey:v7];

  return (char)self;
}

- (id)showsCollaboratorCursorsUserDefaultsKey
{
  v2 = NSString;
  BOOL v3 = [(ICNote *)self identifier];
  char v4 = [v2 stringWithFormat:@"%@-%@", v3, @"ICNoteShouldShowCollaboratorCursors"];

  return v4;
}

+ (ICNote)noteWithIdentifier:(id)a3 includeDeleted:(BOOL)a4 context:(id)a5
{
  return (ICNote *)[a1 noteWithIdentifier:a3 includeDeleted:a4 accountID:0 context:a5];
}

- (BOOL)isNewNoteWithHashtagsInsertedIntoBody
{
  return self->_isNewNoteWithHashtagsInsertedIntoBody;
}

+ (id)keyPathsForValuesAffectingPrefersLightBackground
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"preferredBackgroundType"];
}

- (void)didChangeNoteText
{
  BOOL v3 = [(ICNote *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__ICNote_didChangeNoteText__block_invoke;
  v4[3] = &unk_1E64A4240;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

- (BOOL)needsInitialDerivedAttributesUpdate
{
  BOOL v3 = [(ICNote *)self hasChecklist];
  if (v3)
  {
    char v4 = [(ICNote *)self hasChecklistInProgress];
    if (v4)
    {
      char v5 = [(ICNote *)self hasSystemTextAttachments];
      if (v5)
      {
        objc_super v6 = [(ICNote *)self hasEmphasis];
        BOOL v7 = v6 == 0;
      }
      else
      {
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)regenerateTitleAndSnippetIfNecessaryForEdit:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  if ((a3 & 2) == 0) {
    return 0;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = -[ICNote rangeForTitle:](self, "rangeForTitle:", 0, a4.location, a4.length, a5);
  v11.NSUInteger length = v10 + v9 + 1;
  if (location >= v11.length)
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    v18.NSUInteger location = location;
    v18.NSUInteger length = length;
    v11.NSUInteger location = 0;
    if (!NSIntersectionRange(v18, v11).length)
    {
      uint64_t v14 = -[ICNote rangeForSnippetWithTitleRange:](self, "rangeForSnippetWithTitleRange:", v12, v13);
      v16.NSUInteger length = v15 + v14 + 1;
      if (location >= v16.length)
      {
        v19.NSUInteger location = location;
        v19.NSUInteger length = length;
        v16.NSUInteger location = 0;
        if (!NSIntersectionRange(v19, v16).length) {
          return 0;
        }
      }
    }
  }
  return [(ICNote *)self regenerateTitle:1 snippet:1];
}

- (id)textDataDecryptedIfNecessary
{
  if ([(ICNote *)self isPasswordProtected])
  {
    if ([(ICCloudSyncingObject *)self isAuthenticated]
      && ![(ICCloudSyncingObject *)self isUnsupported])
    {
      objc_super v6 = [(ICNote *)self decryptedData];

      if (!v6)
      {
        BOOL v7 = [(ICCloudSyncingObject *)self cryptoStrategy];
        [v7 decrypt];
      }
      BOOL v3 = [(ICNote *)self decryptedData];
      [(ICNote *)self setDecryptedData:0];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    char v4 = [(ICNote *)self noteData];
    BOOL v3 = [v4 data];
  }
  return v3;
}

- (ICOutlineState)outlineState
{
  outlineState = self->_outlineState;
  if (!outlineState)
  {
    char v4 = [ICOutlineState alloc];
    char v5 = [(ICNote *)self outlineStateData];
    objc_super v6 = [(ICOutlineState *)v4 initWithData:v5];
    BOOL v7 = self->_outlineState;
    self->_outlineState = v6;

    outlineState = self->_outlineState;
  }
  return outlineState;
}

- (void)mergeNotePrimitiveData
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not decrypting %@ for merging note primitive data because we are not authenticated", v4, v5, v6, v7, v8);
}

- (void)prepareForDeletion
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error removing paper coherence file: %@", v2, v3, v4, v5, v6);
}

uint64_t __24__ICNote_awakeFromFetch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mergeNotePrimitiveData];
}

- (void)willSave
{
  uint64_t v3 = [(ICNote *)self changedValues];
  uint64_t v4 = [v3 allKeys];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(ICNote *)self updateDeviceReplicaIDsToUserIDIfNeeded];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v6 willSave];
}

- (BOOL)shouldReleaseDocumentWhenTurningIntoFault
{
  if (!self->_document || [(ICNote *)self preventReleasingTextStorage]) {
    return 0;
  }
  uint64_t v4 = [(ICNote *)self noteData];
  char v5 = [v4 needsToBeSaved];

  return v5 ^ 1;
}

- (void)didSave
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)ICNote;
  [(ICNote *)&v14 didSave];
  id WeakRetained = objc_loadWeakRetained(&self->_noteDidSaveObserver);

  if (!WeakRetained)
  {
    uint64_t v4 = [(ICNote *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICNoteDidSaveNotification"];
    objc_storeWeak(&self->_noteDidSaveObserver, v4);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v5 = self->_noteDidSaveBlocks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_noteDidSaveBlocks removeAllObjects];
}

- (void)willRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  -[ICNote willRefresh:](&v8, sel_willRefresh_);
  if (self->_document)
  {
    char v5 = [(ICNote *)self noteData];
    uint64_t v6 = [v5 managedObjectContext];
    uint64_t v7 = [(ICNote *)self noteData];
    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v7, v3);
  }
}

- (void)didRefresh:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICNote;
  [(ICNote *)&v13 didRefresh:a3];
  if (self->_document)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
    char v5 = [(ICNote *)self noteData];
    uint64_t v6 = [v4 predicateWithFormat:@"self == %@", v5];
    uint64_t v7 = [(ICNote *)self managedObjectContext];
    objc_super v8 = +[ICNoteData ic_objectsMatchingPredicate:v6 context:v7];

    if (!v8)
    {
      uint64_t v9 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ICNote didRefresh:](self, v9);
      }
    }
    long long v10 = [(ICNote *)self identifier];

    long long v11 = os_log_create("com.apple.notes", "CoreData");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        -[ICNote didRefresh:](self);
      }
    }
    else if (v12)
    {
      -[ICNote didRefresh:](self);
    }
  }
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  if ([(ICCloudSyncingObject *)self isUnsupported]
    || [(ICCloudSyncingObject *)self needsInitialFetchFromCloudCheckingParent])
  {
    return [(ICNote *)self minimumSupportedNotesVersion];
  }
  else
  {
    uint64_t v6 = [(ICNote *)self hasEmphasis];
    char v7 = [v6 BOOLValue];

    if ((v7 & 1) != 0
      || ([(ICNote *)self hasSystemTextAttachments],
          objc_super v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 BOOLValue],
          v8,
          (v9 & 1) != 0))
    {
      int64_t v10 = 14;
    }
    else if ([(ICNote *)self hasVisibleInlineAttachments])
    {
      if ([(ICNote *)self isPasswordProtected]) {
        int64_t v10 = 13;
      }
      else {
        int64_t v10 = 6;
      }
    }
    else
    {
      int64_t v10 = [(ICCloudSyncingObject *)self isSharedReadOnly];
    }
    v11.receiver = self;
    v11.super_class = (Class)ICNote;
    int64_t result = [(ICCloudSyncingObject *)&v11 intrinsicNotesVersionForScenario:a3];
    if (v10 > result) {
      return v10;
    }
  }
  return result;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

- (void)setAttachmentViewType:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ([(ICNote *)self attachmentViewType] != a3)
  {
    NSStringFromSelector(sel_attachmentViewType);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(ICNote *)self willChangeValueForKey:v7];
    performBlockOnMainThread();
    char v5 = [MEMORY[0x1E4F28ED0] numberWithShort:v3];
    [(ICNote *)self setPrimitiveValue:v5 forKey:v7];

    id v6 = (id)[(ICNote *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentDidChangePreferredSizeNotification"];
    [(ICNote *)self didChangeValueForKey:v7];
  }
}

void __32__ICNote_setAttachmentViewType___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"ICAttachmentWillChangePreferredSizeNotification" object:0];
}

- (void)updateAttachmentViewTypeAndPropagateToAttachments:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(ICNote *)self attachmentViewType] != a3) {
    goto LABEL_4;
  }
  id v12 = [(ICNote *)self distinctAttachmentViewTypes];
  if ((unint64_t)[v12 count] >= 2)
  {

LABEL_4:
    if ([(ICNote *)self attachmentViewType] != v3)
    {
      [(ICNote *)self setAttachmentViewType:v3];
      [(ICNote *)self updateChangeCountWithReason:@"User chose a new attachmentViewType"];
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v5 = [(ICNote *)self visibleTopLevelAttachments];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) resetPreferredViewSizeIfNecessary];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (objc_opt_respondsToSelector()) {
      [(ICNote *)self noteDidApplyAttachmentViewTypeToAllAttachments];
    }
    return;
  }
  if ([v12 count] == 1)
  {
    int64_t v10 = [v12 anyObject];
    uint64_t v11 = [v10 integerValue];

    if (v11 == (int)v3) {
      return;
    }
    goto LABEL_4;
  }
}

- (NSSet)distinctAttachmentViewTypes
{
  uint64_t v2 = [(ICNote *)self visibleTopLevelAttachments];
  uint64_t v3 = objc_msgSend(v2, "ic_map:", &__block_literal_global_123);

  return (NSSet *)v3;
}

uint64_t __37__ICNote_distinctAttachmentViewTypes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = [a2 preferredViewSize];
  return [v2 numberWithShort:v3];
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v6 objectWasFetchedFromCloudWithRecord:a3 accountID:a4];
  if (![(ICNote *)self wantsUserSpecificRecord]
    || ([(ICCloudSyncingObject *)self userSpecificServerRecord],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    [(ICNote *)self clearRecentUpdatesGenerationDateIfNeeded];
  }
}

- (void)didFetchUserSpecificRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v16 didFetchUserSpecificRecord:v8 accountID:a4 force:v5];
  if ([(ICNote *)self needsInitialFetchFromCloud])
  {
    char v9 = [ICUserSpecificRecordIDParser alloc];
    int64_t v10 = [v8 recordID];
    uint64_t v11 = [v10 recordName];
    id v12 = [(ICUserSpecificRecordIDParser *)v9 initWithRecordName:v11];

    long long v13 = [(ICUserSpecificRecordIDParser *)v12 sharedRecordType];
    LODWORD(v11) = [v13 isEqual:@"PasswordProtectedNote"];

    if (v11)
    {
      long long v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = [(ICCloudSyncingObject *)self shortLoggingDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v15;
        _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Deriving that placeholder note is password-protected from user-specific record {noteID: %@}", buf, 0xCu);
      }
      [(ICNote *)self setIsPasswordProtected:1];
    }
  }
  else
  {
    [(ICNote *)self clearRecentUpdatesGenerationDateIfNeeded];
  }
}

+ (unint64_t)maxNoteTextLength
{
  return 15728640;
}

+ (unint64_t)maxNoteAttachments
{
  uint64_t v2 = +[ICCloudConfiguration sharedConfiguration];
  unint64_t v3 = [v2 maxAttachmentsPerNote];

  return v3;
}

- (id)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    BOOL v5 = [(ICNote *)self identifier];
    objc_super v6 = (NSUUID *)[v4 initWithUUIDString:v5];
    uint64_t v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)noteAsPlainText
{
  uint64_t v2 = [(ICNote *)self attributedString];
  unint64_t v3 = [v2 string];

  return v3;
}

- (id)quotedTitle
{
  uint64_t v2 = [(ICNote *)self title];
  unint64_t v3 = objc_msgSend(v2, "ic_quotedString");

  return v3;
}

- (NSString)noteAsPlainTextWithoutTitle
{
  unint64_t v3 = [(ICNote *)self searchableString];
  id v4 = [v3 string];

  BOOL v5 = (void *)MEMORY[0x1E4F83798];
  objc_super v6 = [(ICNote *)self title];
  uint64_t v7 = [v5 stringByRemovingTitle:v6 fromString:v4];

  return (NSString *)v7;
}

- (ICNote)noteWithoutTitle
{
  unint64_t v3 = [(ICNote *)self searchableString];
  id v4 = (void *)MEMORY[0x1E4F83798];
  BOOL v5 = [(ICNote *)self title];
  objc_super v6 = [v4 attributedStringByRemovingTitle:v5 fromAttributedString:v3];

  return (ICNote *)v6;
}

- (void)updateTimestampWithUnserializedChanges
{
  id v2 = [(ICNote *)self mergeableString];
  [v2 generateIdsForLocalChanges];
}

- (BOOL)updateLastViewedTimestampWithCurrentTimestamp
{
  if (![(ICCloudSyncingObject *)self isSharedViaICloud]) {
    return 0;
  }
  unint64_t v3 = [(ICNote *)self mergeableString];
  if ([v3 hasLocalChanges])
  {
    BOOL v4 = [(ICNote *)self needsToSaveLastViewedTimestamp];

    if (!v4)
    {
      BOOL v5 = os_log_create("com.apple.notes", "Collaboration");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[ICNote updateLastViewedTimestampWithCurrentTimestamp](self);
      }

      [(ICNote *)self setNeedsToSaveLastViewedTimestamp:1];
      objc_super v6 = @"Need to save last viewed timestamp on next save";
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v8 = [(ICNote *)self lastViewedTimestamp];
  if (v8)
  {
    char v9 = (void *)v8;
    int64_t v10 = [(ICNote *)self timestamp];
    uint64_t v11 = [(ICNote *)self lastViewedTimestamp];
    char v12 = [v10 compareTo:v11];

    if ((v12 & 4) == 0)
    {
      BOOL v7 = 0;
      goto LABEL_16;
    }
  }
  long long v13 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ICNote updateLastViewedTimestampWithCurrentTimestamp]();
  }

  long long v14 = [(ICNote *)self timestamp];
  [(ICNote *)self setLastViewedTimestamp:v14];

  objc_super v6 = @"Setting last viewed timestamp";
LABEL_15:
  [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:v6];
  BOOL v7 = 1;
LABEL_16:
  if ([(ICNote *)self hasUnreadChanges])
  {
    long long v15 = [(ICCloudSyncingObject *)self modificationDate];
    [(ICNote *)self setLastViewedModificationDate:v15];

    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"Updated last viewed modification date"];
    objc_super v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ICNote updateLastViewedTimestampWithCurrentTimestamp]();
    }

    return 1;
  }
  return v7;
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  if (-[ICNote regenerateTitleAndSnippetIfNecessaryForEdit:range:changeInLength:](self, "regenerateTitleAndSnippetIfNecessaryForEdit:range:changeInLength:", a3, a4.location, a4.length, a5)&& ![(ICCloudSyncingObject *)self isMergingRecord])
  {
    [(ICCloudSyncingObject *)self markShareDirtyIfNeededWithReason:@"Updated title after edit"];
    [(ICNote *)self updateChangeCountWithReason:@"Updated title after edit"];
  }
}

- (BOOL)wantsUndoCommands
{
  return 0;
}

- (BOOL)isVisible
{
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  if (![(ICCloudSyncingObject *)&v6 isVisible]) {
    return 0;
  }
  unint64_t v3 = [(ICNote *)self folder];
  BOOL v4 = [v3 folderType] != 1;

  return v4;
}

+ (id)keyPathsForValuesAffectingIsEditable
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"folder", @"isSharedReadOnly", 0);
}

+ (id)keyPathsForValuesAffectingIsDeletable
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"folder.isSharedReadonly"];
}

- (BOOL)isDeletable
{
  id v2 = [(ICNote *)self folder];
  char v3 = [v2 isSharedReadOnly] ^ 1;

  return v3;
}

+ (BOOL)containsUndeletableNotes:(id)a3
{
  return objc_msgSend(a3, "ic_containsObjectPassingTest:", &__block_literal_global_164);
}

uint64_t __35__ICNote_containsUndeletableNotes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDeletable] ^ 1;
}

- (BOOL)isDuplicatable
{
  if ([(ICCloudSyncingObject *)self isSharedReadOnly]
    || ([(ICNote *)self isPasswordProtected] & 1) != 0
    || [(ICNote *)self isDeletedOrInTrash])
  {
    return 0;
  }
  else
  {
    return ![(ICNote *)self isEmpty];
  }
}

+ (BOOL)containsUnduplicatableNotes:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    char v4 = objc_msgSend(v3, "ic_containsObjectPassingTest:", &__block_literal_global_166);
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __38__ICNote_containsUnduplicatableNotes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isDuplicatable] ^ 1;
}

- (BOOL)isLockable
{
  if ([(ICNote *)self isDeletedOrInTrash] || [(ICNote *)self isEmpty]) {
    return 0;
  }
  else {
    return ![(ICCloudSyncingObject *)self isUnsupported];
  }
}

- (BOOL)isMovable
{
  id v3 = [(ICNote *)self folder];
  if (([v3 isSharedReadOnly] & 1) != 0 || -[ICNote isEmpty](self, "isEmpty")) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = ![(ICCloudSyncingObject *)self isUnsupported];
  }

  return v4;
}

- (BOOL)isPinnable
{
  if ([(ICNote *)self isDeletedOrInTrash] || [(ICNote *)self isEmpty]) {
    return 0;
  }
  else {
    return ![(ICCloudSyncingObject *)self isUnsupported];
  }
}

+ (BOOL)containsUnmovableNotes:(id)a3
{
  return objc_msgSend(a3, "ic_containsObjectPassingTest:", &__block_literal_global_168);
}

uint64_t __33__ICNote_containsUnmovableNotes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMovable] ^ 1;
}

- (BOOL)allowsNewTextLength:(unint64_t)a3
{
  return a3 < 0xF00000;
}

- (BOOL)requiresLegacyTombstoneAfterDeletion
{
  id v3 = [(ICNote *)self legacyContentHashAtImport];
  if ([v3 length])
  {
    BOOL v4 = [(ICNote *)self account];
    char v5 = [v4 supportsLegacyTombstones];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)hasChecklistOnlyInProgress:(BOOL)a3
{
  char v5 = [(ICNote *)self attributedString];
  uint64_t v6 = [v5 length];

  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v7 = [(ICNote *)self attributedString];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__ICNote_hasChecklistOnlyInProgress___block_invoke;
  v9[3] = &unk_1E64A4A10;
  BOOL v10 = a3;
  void v9[4] = &v11;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", ICTTAttributeNameParagraphStyle, 0, v6, 0, v9);

  LOBYTE(v6) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37__ICNote_hasChecklistOnlyInProgress___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if ([v10 style] == 103)
  {
    if (!*(unsigned char *)(a1 + 40)
      || ([v10 todo],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 done],
          v8,
          (v9 & 1) == 0))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
}

- (void)markForDeletion
{
  if (([(ICNote *)self markedForDeletion] & 1) == 0)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 postNotificationName:@"ICNoteWillBeDeletedNotification" object:self];
    }
    BOOL v4 = [(ICCloudSyncingObject *)self modificationDate];
    [(ICNote *)self setModificationDate:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v5 markForDeletion];
}

- (void)unmarkForDeletion
{
  if ([(ICNote *)self markedForDeletion])
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 postNotificationName:@"ICNoteWillBeUndeletedNotification" object:self];
    }
    BOOL v4 = [(ICCloudSyncingObject *)self modificationDate];
    [(ICNote *)self setModificationDate:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v5 unmarkForDeletion];
}

- (void)updateChangeCountWithReason:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v6 updateChangeCountWithReason:a3];
  if ([(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    BOOL v4 = [(ICNote *)self managedObjectContext];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__ICNote_updateChangeCountWithReason___block_invoke;
    v5[3] = &unk_1E64A4240;
    v5[4] = self;
    [v4 performBlockAndWait:v5];
  }
}

void __38__ICNote_updateChangeCountWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changedValues];
  id v3 = [v2 objectForKeyedSubscript:@"folder"];
  if (v3)
  {
  }
  else
  {
    BOOL v4 = [*(id *)(a1 + 32) changedValues];
    objc_super v5 = [v4 objectForKeyedSubscript:@"folderModificationDate"];

    if (!v5) {
      goto LABEL_6;
    }
  }
  objc_super v6 = [*(id *)(a1 + 32) folder];
  int v7 = [v6 isOwnedByCurrentUser];

  if (v7) {
    [*(id *)(a1 + 32) updateUserSpecificChangeCountWithReason:@"Side effect of changing folder or folderModificationDate"];
  }
LABEL_6:
  uint64_t v8 = [*(id *)(a1 + 32) changedValues];
  char v9 = [v8 objectForKeyedSubscript:@"lastActivitySummaryViewedDate"];
  if (!v9)
  {
    char v9 = [*(id *)(a1 + 32) changedValues];
    id v10 = [v9 objectForKeyedSubscript:@"lastActivityRecentUpdatesViewedDate"];
    if (!v10)
    {
      char v12 = [*(id *)(a1 + 32) changedValues];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"lastAttributionsViewedDate"];

      if (!v13) {
        return;
      }
      goto LABEL_10;
    }
  }
LABEL_10:
  uint64_t v11 = *(void **)(a1 + 32);
  [v11 updateUserSpecificChangeCountWithReason:@"Side effect of changing activity timestamps"];
}

- (BOOL)attachmentCountExceeded
{
  unint64_t v2 = [(ICNote *)self visibleTopLevelAttachmentsCount];
  return v2 > +[ICNote maxNoteAttachments];
}

- (BOOL)canAddAttachment
{
  return [(ICNote *)self canAddAttachments:1];
}

- (BOOL)canAddAttachments:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(ICNote *)self visibleTopLevelAttachmentsCount];
  unint64_t v5 = [(id)objc_opt_class() maxNoteAttachments];
  if (v4 + a3 > v5)
  {
    objc_super v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [(id)objc_opt_class() maxNoteAttachments];
      char v9 = +[ICCloudConfiguration sharedConfiguration];
      int v10 = 134218752;
      unint64_t v11 = a3;
      __int16 v12 = 2048;
      unint64_t v13 = v4;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      long long v17 = v9;
      _os_log_debug_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEBUG, "Can't add attachments %lu %lu %lu %p", (uint8_t *)&v10, 0x2Au);
    }
  }
  return v4 + a3 <= v5;
}

- (BOOL)attachmentExceedsMaxSizeAllowed:(unint64_t)a3
{
  BOOL v3 = a3 != 0;
  if (a3)
  {
    unint64_t v5 = +[ICCloudConfiguration sharedConfiguration];
    objc_super v6 = [v5 maximumAttachmentSizeMB];
    unint64_t v7 = [v6 unsignedLongLongValue] << 20;

    if (v7 >= a3) {
      return 0;
    }
    uint64_t v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICNote attachmentExceedsMaxSizeAllowed:]();
    }
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICNote attachmentExceedsMaxSizeAllowed:]();
    }
  }

  return v3;
}

- (BOOL)containsAttachmentsUnsupportedInPasswordProtection
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  BOOL v3 = [(ICNote *)self attributedString];
  unint64_t v4 = [(ICNote *)self attributedString];
  uint64_t v5 = [v4 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke;
  v7[3] = &unk_1E64A4A88;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v5, 0, v7);

  LOBYTE(v3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v3;
}

void __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (v7 && [v7 conformsToProtocol:&unk_1F1F80810])
  {
    id v9 = v8;
    uint64_t v10 = [v9 attachmentUTI];
    if (!+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:v10])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a5 = 1;
    }
    char v11 = *(void **)(a1 + 32);
    __int16 v12 = [v9 attachmentIdentifier];
    unint64_t v13 = [v11 attachmentWithIdentifier:v12];

    if ([v13 isUnsupported])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a5 = 1;
    }
    if ([v10 isEqualToString:@"com.apple.notes.table"])
    {
      objc_opt_class();
      __int16 v14 = [v13 attachmentModel];
      uint64_t v15 = ICDynamicCast();
      __int16 v16 = [v15 table];

      if (v16)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_2;
        v17[3] = &unk_1E64A4A60;
        uint64_t v19 = a5;
        long long v18 = *(_OWORD *)(a1 + 32);
        [v16 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v17];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a5 = 1;
      }
    }
  }
}

uint64_t __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 attributedString];
  uint64_t v4 = [v3 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_3;
  v6[3] = &unk_1E64A4A38;
  uint64_t v8 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v4, 0, v6);

  return 0;
}

void __60__ICNote_containsAttachmentsUnsupportedInPasswordProtection__block_invoke_3(void *a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = [v9 attachmentUTI];
  if (v3
    && !+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:v3])
  {
    uint64_t v4 = (unsigned char *)a1[6];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *uint64_t v4 = 1;
  }
  uint64_t v5 = (void *)a1[4];
  objc_super v6 = [v9 attachmentIdentifier];
  long long v7 = [v5 attachmentWithIdentifier:v6];

  if ([v7 isUnsupported])
  {
    uint64_t v8 = (unsigned char *)a1[6];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *uint64_t v8 = 1;
  }
}

- (id)visibleAttachments
{
  unint64_t v2 = [(ICNote *)self attachments];
  BOOL v3 = [v2 objectsPassingTest:&__block_literal_global_256];

  return v3;
}

uint64_t __28__ICNote_visibleAttachments__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVisible];
}

- (id)visibleInlineAttachments
{
  unint64_t v2 = [(ICNote *)self inlineAttachments];
  BOOL v3 = [v2 objectsPassingTest:&__block_literal_global_259];

  return v3;
}

uint64_t __34__ICNote_visibleInlineAttachments__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVisible];
}

- (BOOL)textStorageHasAttribute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNote *)self attributedString];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(ICNote *)self uiAttributedString];

    uint64_t v5 = (void *)v6;
  }
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v7 = objc_msgSend(v5, "ic_range");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__ICNote_textStorageHasAttribute___block_invoke;
  v11[3] = &unk_1E64A4AF0;
  v11[4] = &v12;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v4, v7, v8, 0, v11);
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __34__ICNote_textStorageHasAttribute___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (BOOL)containsPlaceholderBlockOrInlineAttachments
{
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  BOOL v3 = [(ICNote *)self documentWithoutCreating];

  if (v3)
  {
    if (!*((unsigned char *)v13 + 24))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke;
      v11[3] = &unk_1E64A4B18;
      v11[4] = &v12;
      [(ICNote *)self enumerateAttachmentsInOrderUsingBlock:v11];
      if (!*((unsigned char *)v13 + 24))
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        void v10[2] = __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_2;
        v10[3] = &unk_1E64A4B40;
        v10[4] = &v12;
        [(ICNote *)self enumerateInlineAttachmentsInOrderUsingBlock:v10];
      }
    }
  }
  else if (!*((unsigned char *)v13 + 24))
  {
    id v4 = [(ICNote *)self attachments];
    char v5 = objc_msgSend(v4, "ic_containsObjectPassingTest:", &__block_literal_global_266);
    *((unsigned char *)v13 + 24) = v5;

    if (!*((unsigned char *)v13 + 24))
    {
      uint64_t v6 = [(ICNote *)self inlineAttachments];
      char v7 = objc_msgSend(v6, "ic_containsObjectPassingTest:", &__block_literal_global_268);
      *((unsigned char *)v13 + 24) = v7;
    }
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  if ([v8 needsInitialFetchFromCloud]) {
    char v7 = [v8 markedForDeletion] ^ 1;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v7;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  if ([v8 needsInitialFetchFromCloud]) {
    char v7 = [v8 markedForDeletion] ^ 1;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v7;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

uint64_t __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 needsInitialFetchFromCloud]) {
    uint64_t v3 = [v2 markedForDeletion] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __53__ICNote_containsPlaceholderBlockOrInlineAttachments__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 needsInitialFetchFromCloud]) {
    uint64_t v3 = [v2 markedForDeletion] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)visibleTopLevelAttachmentsCount
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"note == %@ AND parentAttachment == nil", self];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v3;
  char v5 = +[ICCloudSyncingObject predicateForVisibleObjects];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  char v7 = [v4 andPredicateWithSubpredicates:v6];

  id v8 = [(ICNote *)self managedObjectContext];
  unint64_t v9 = +[ICAttachment countOfAttachmentsMatchingPredicate:v7 context:v8];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [(ICNote *)self visibleTopLevelAttachments];
    unint64_t v9 = [v10 count];

    char v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICNote visibleTopLevelAttachmentsCount]();
    }
  }
  return v9;
}

- (id)visibleTopLevelAttachments
{
  id v2 = [(ICNote *)self visibleAttachments];
  uint64_t v3 = [v2 objectsPassingTest:&__block_literal_global_276];

  return v3;
}

BOOL __36__ICNote_visibleTopLevelAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 parentAttachment];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)allAttachmentsIncludingSubAttachments
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ICNote *)self attachments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v3 addObject:v9];
        [v9 recursivelyAddSubAttachments:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (id)allNoteTextAttachmentsIncludingSubAttachments:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  char v11 = __56__ICNote_allNoteTextAttachmentsIncludingSubAttachments___block_invoke;
  long long v12 = &unk_1E64A4B68;
  id v13 = v5;
  BOOL v14 = a3;
  id v6 = v5;
  [(ICNote *)self enumerateAttachmentsInOrderUsingBlock:&v9];
  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __56__ICNote_allNoteTextAttachmentsIncludingSubAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if (*(unsigned char *)(a1 + 40)) {
    [v3 recursivelyAddSubAttachments:*(void *)(a1 + 32)];
  }
}

- (id)allNoteTextInlineAttachments
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ICNote_allNoteTextInlineAttachments__block_invoke;
  v7[3] = &unk_1E64A4B90;
  id v8 = v3;
  id v4 = v3;
  [(ICNote *)self enumerateInlineAttachmentsInOrderUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return v5;
}

uint64_t __38__ICNote_allNoteTextInlineAttachments__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)attachmentsInOrder
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__ICNote_attachmentsInOrder__block_invoke;
  v6[3] = &unk_1E64A4BB8;
  id v4 = v3;
  id v7 = v4;
  [(ICNote *)self enumerateAttachmentsInOrderUsingBlock:v6];

  return v4;
}

uint64_t __28__ICNote_attachmentsInOrder__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateAbstractAttachmentsInOrderUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNote *)self attributedString];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(ICNote *)self uiAttributedString];

    id v5 = (void *)v6;
  }
  id v7 = [(ICNote *)self managedObjectContext];
  uint64_t v8 = objc_msgSend(v5, "ic_range");
  uint64_t v10 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__ICNote_enumerateAbstractAttachmentsInOrderUsingBlock___block_invoke;
  v12[3] = &unk_1E64A4BE0;
  id v13 = v4;
  id v11 = v4;
  objc_msgSend(v5, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v7, v8, v10, 0, v12);
}

uint64_t __56__ICNote_enumerateAbstractAttachmentsInOrderUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateInlineAttachmentsInOrderUsingBlock:(id)a3
{
  id v4 = a3;
  id v9 = [(ICNote *)self attributedString];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(ICNote *)self uiAttributedString];

    id v9 = (id)v5;
  }
  uint64_t v6 = [(ICNote *)self managedObjectContext];
  uint64_t v7 = objc_msgSend(v9, "ic_range");
  objc_msgSend(v9, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v6, v7, v8, 0, v4);
}

- (BOOL)hasThumbnailImage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (([(ICNote *)self isPasswordProtected] & 1) == 0)
  {
    id v3 = [(ICNote *)self attachments];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__ICNote_hasThumbnailImage__block_invoke;
    v6[3] = &unk_1E64A4C30;
    void v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __27__ICNote_hasThumbnailImage__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  if ([v7 isVisible])
  {
    uint64_t v5 = [v7 attachmentModel];
    int v6 = [v5 showThumbnailInNoteList];

    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (_NSRange)rangeForAttachment:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3010000000;
  v26 = &unk_1C3E4C23B;
  long long v27 = xmmword_1C3DD2F80;
  if ([(ICNote *)self needsInitialFetchFromCloud])
  {
    uint64_t v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = [(ICCloudSyncingObject *)self ic_loggingIdentifier];
      [(ICNote *)v6 rangeForAttachment:v5];
    }
LABEL_8:
    char v10 = v5;
    goto LABEL_9;
  }
  if (([v4 markedForDeletion] & 1) != 0
    || ([v4 note],
        id v7 = (ICNote *)objc_claimAutoreleasedReturnValue(),
        BOOL v8 = v7 == self,
        v7,
        !v8))
  {
    uint64_t v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v4 shortLoggingDescription];
      [(ICCloudSyncingObject *)self shortLoggingDescription];
      objc_claimAutoreleasedReturnValue();
      -[ICNote rangeForAttachment:]();
    }
    goto LABEL_8;
  }
  char v10 = [(ICNote *)self attributedString];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = [(ICNote *)self uiAttributedString];

    char v10 = (void *)v15;
  }
  __int16 v16 = [(ICNote *)self managedObjectContext];
  uint64_t v17 = objc_msgSend(v10, "ic_range");
  uint64_t v19 = v18;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __29__ICNote_rangeForAttachment___block_invoke;
  v20[3] = &unk_1E64A4C58;
  uint64_t v21 = v4;
  v22 = &v23;
  objc_msgSend(v10, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v16, v17, v19, 0, v20);

  uint64_t v5 = v21;
LABEL_9:

  NSUInteger v11 = v24[4];
  NSUInteger v12 = v24[5];
  _Block_object_dispose(&v23, 8);

  NSUInteger v13 = v11;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

uint64_t __29__ICNote_rangeForAttachment___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

- (id)allDrawings
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__ICNote_allDrawings__block_invoke;
  v7[3] = &unk_1E64A4BB8;
  id v8 = v3;
  id v4 = v3;
  [(ICNote *)self enumerateAttachmentsInOrderUsingBlock:v7];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

void __21__ICNote_allDrawings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 attachmentModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v6 = [v3 attachmentModel];
    id v7 = [v6 handwritingRecognitionDrawing];

    if (!v7)
    {
      id v8 = [v3 attachmentModel];
      id v7 = (void *)[v8 newDrawingFromMergeableData];
    }
    objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v7);
LABEL_13:

    goto LABEL_14;
  }
  if ([v3 attachmentType] == 13)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = +[ICSystemPaperDrawingsHelper drawingsForAttachment:](ICSystemPaperDrawingsHelper, "drawingsForAttachment:", v3, 0);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v7);
          }
          NSUInteger v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v13 setRecognitionEnabled:1];
          [*(id *)(a1 + 32) addObject:v13];
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (id)visibleAttachmentsWithType:(signed __int16)a3
{
  id v4 = [(ICNote *)self visibleAttachments];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ICNote_visibleAttachmentsWithType___block_invoke;
  v7[3] = &__block_descriptor_34_e26_B24__0__ICAttachment_8_B16l;
  signed __int16 v8 = a3;
  uint64_t v5 = [v4 objectsPassingTest:v7];

  return v5;
}

BOOL __37__ICNote_visibleAttachmentsWithType___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int16 *)(a1 + 32) == (unsigned __int16)[a2 attachmentType];
}

- (id)attachmentsWithUTType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  NSUInteger v12 = __32__ICNote_attachmentsWithUTType___block_invoke;
  NSUInteger v13 = &unk_1E64A4CA0;
  id v14 = v4;
  id v15 = v5;
  id v6 = v5;
  id v7 = v4;
  [(ICNote *)self enumerateAttachmentsInOrderUsingBlock:&v10];
  signed __int16 v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

void __32__ICNote_attachmentsWithUTType___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 typeUTI];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ICNote *)self attachmentsInOrder];
  id v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) noteWillMoveToRecentlyDeletedFolder];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)refreshNoteTextFromDataStore
{
  if (self->_document) {
    [(ICNote *)self didChangeNoteText];
  }
}

- (unint64_t)mergeWithNoteData:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__ICNote_mergeWithNoteData___block_invoke;
  v8[3] = &unk_1E64A48D0;
  id v9 = v4;
  long long v10 = self;
  id v5 = v4;
  unint64_t v6 = [(ICNote *)self performMerge:v8];

  return v6;
}

uint64_t __28__ICNote_mergeWithNoteData___block_invoke(uint64_t a1)
{
  id v2 = [ICTTMergeableStringVersionedDocument alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [(ICTTVersionedDocument *)v2 initWithData:v3 replicaID:v4];

  unint64_t v6 = [*(id *)(a1 + 40) document];
  uint64_t v7 = [v6 mergeWithStringVersionedDocument:v5];

  return v7;
}

- (unint64_t)performMerge:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(void))a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ICNoteWillPerformMergeNotification" object:self];

  [(ICNote *)self setIsPerformingMerge:1];
  [(ICNote *)self willChangeValueForKey:@"isEmpty"];
  unint64_t v6 = [(ICNote *)self mergeableString];
  [v6 generateIdsForLocalChanges];

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (objc_opt_respondsToSelector()) {
    [(ICNote *)self noteWillMergeDocumentWithUserInfo:v7];
  }
  unint64_t v8 = v4[2](v4);
  if (objc_opt_respondsToSelector()) {
    [(ICNote *)self noteDidMergeNoteDocumentWithUserInfo:v7];
  }
  if (v8 == 2 && ([(ICNote *)self needsInitialFetchFromCloud] & 1) == 0) {
    [(ICNote *)self regenerateTitle:1 snippet:1];
  }
  [(ICNote *)self didChangeValueForKey:@"isEmpty"];
  [(ICNote *)self setIsPerformingMerge:0];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v13 = @"MergeResult";
  long long v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
  v14[0] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v9 postNotificationName:@"ICNoteDidPerformMergeNotification" object:self userInfo:v11];

  return v8;
}

- (void)replaceWithDocument:(id)a3
{
  id v4 = (ICTTMergeableStringVersionedDocument *)a3;
  [(ICNote *)self willChangeValueForKey:@"isEmpty"];
  document = self->_document;
  self->_document = v4;
  unint64_t v6 = v4;

  LOBYTE(document) = objc_opt_respondsToSelector();
  if (document) {
    [(ICNote *)self noteDidReplaceDocument];
  }
  [(ICNote *)self regenerateTitle:1 snippet:1];
  [(ICCloudSyncingObject *)self markShareDirtyIfNeededWithReason:@"Reset document"];
  [(ICNote *)self didChangeValueForKey:@"isEmpty"];
}

- (BOOL)saveNoteData
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_document)
  {
    id v4 = os_log_create("com.apple.notes", "Topotext");
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    unint64_t v6 = [(ICTTVersionedDocument *)self->_document serialize];
    uint64_t v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      v30 = NSStringFromSelector(a2);
      int v31 = 138412802;
      v32 = v29;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v30;
      __int16 v35 = 2048;
      uint64_t v36 = [v6 hash];
      _os_log_debug_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEBUG, "%@ %@ %lu", (uint8_t *)&v31, 0x20u);
    }
    if ([(ICNote *)self isPasswordProtected])
    {
      if ([(ICCloudSyncingObject *)self isAuthenticated])
      {
        unint64_t v8 = v4;
        id v9 = v8;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          LOWORD(v31) = 0;
          _os_signpost_emit_with_name_impl(&dword_1C3A61000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Serialize Encrypted NoteData", "", (uint8_t *)&v31, 2u);
        }

        long long v10 = [(ICCloudSyncingObject *)self cryptoStrategy];
        char v11 = [v10 writeEncryptedNoteData:v6];

        NSUInteger v12 = v9;
        uint64_t v13 = v12;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
        {
          id v14 = [(ICCloudSyncingObject *)self ic_loggingIdentifier];
          uint64_t v15 = [v6 length];
          long long v16 = [(ICCloudSyncingObject *)self cryptoStrategy];
          long long v17 = (objc_class *)objc_opt_class();
          uint64_t v18 = NSStringFromClass(v17);
          int v31 = 138412802;
          v32 = v14;
          __int16 v33 = 2048;
          uint64_t v34 = v15;
          __int16 v35 = 2112;
          uint64_t v36 = (uint64_t)v18;
          _os_signpost_emit_with_name_impl(&dword_1C3A61000, v13, OS_SIGNPOST_INTERVAL_END, v5, "Serialize Encrypted NoteData", "Note ID: %@, Size: %lu, Strategy: %@", (uint8_t *)&v31, 0x20u);
        }
        goto LABEL_28;
      }
      uint64_t v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(ICNote *)self saveNoteData];
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v19 = v4;
        uint64_t v20 = v19;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          LOWORD(v31) = 0;
          _os_signpost_emit_with_name_impl(&dword_1C3A61000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Serialize NoteData", "", (uint8_t *)&v31, 2u);
        }

        uint64_t v21 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[ICNote saveNoteData]();
        }

        v22 = [(ICNote *)self noteData];
        [v22 setData:v6];

        [(ICNote *)self setCryptoTag:0];
        [(ICNote *)self setCryptoInitializationVector:0];
        [(ICNote *)self updateArchivedAndLastViewedTimeStampsAfterSavingNoteData];
        uint64_t v23 = v20;
        uint64_t v13 = v23;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          v24 = [(ICCloudSyncingObject *)self ic_loggingIdentifier];
          uint64_t v25 = [v6 length];
          int v31 = 138412546;
          v32 = v24;
          __int16 v33 = 2048;
          uint64_t v34 = v25;
          _os_signpost_emit_with_name_impl(&dword_1C3A61000, v13, OS_SIGNPOST_INTERVAL_END, v5, "Serialize NoteData", "Note ID: %@, Size: %lu", (uint8_t *)&v31, 0x16u);
        }
        char v11 = 1;
        goto LABEL_28;
      }
      uint64_t v13 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v26 = [(ICCloudSyncingObject *)self ic_loggingIdentifier];
        int v31 = 138412290;
        v32 = v26;
        _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Trying to save note data for %@, but we don't have any data", (uint8_t *)&v31, 0xCu);
      }
    }

    char v11 = 0;
LABEL_28:

    return v11;
  }
  return 0;
}

- (void)updateArchivedAndLastViewedTimeStampsAfterSavingNoteData
{
  OUTLINED_FUNCTION_4();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  id v2 = [(id)OUTLINED_FUNCTION_4_2() timestamp];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Saving last viewed timestamp for %@: %@", v5, v6, v7, v8, v9);
}

- (BOOL)hasLoadedDocument
{
  return self->_document != 0;
}

+ (id)keyPathsForValuesAffectingHasUnreadChanges
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"modificationDate", @"serverRecord", @"lastViewedModificationDate", 0);
}

- (BOOL)hasUnreadChanges
{
  uint64_t v3 = [(ICCloudSyncingObject *)self serverRecord];
  uint64_t v4 = [v3 lastModifiedUserRecordID];
  uint64_t v5 = [v4 recordName];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C08]];

  uint64_t v7 = [(ICCloudSyncingObject *)self modificationDate];
  uint64_t v8 = [(ICNote *)self lastViewedModificationDate];
  char v9 = objc_msgSend(v7, "ic_isLaterThanDate:", v8);

  document = self->_document;
  if (document)
  {
    char v11 = [(ICTTMergeableStringVersionedDocument *)document mergeableString];
    int v12 = [v11 hasLocalChanges] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 1;
  }
  return v9 & ~v6 & v12;
}

- (void)changePinStatusIfPossible
{
  if ([(ICNote *)self isPinnable])
  {
    [(ICNote *)self setIsPinned:[(ICNote *)self isPinned] ^ 1];
    [(ICNote *)self updateChangeCountWithReason:@"Changed pin state"];
  }
}

- (void)setIsPinned:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICNote *)self isPinned] != a3)
  {
    [(ICNote *)self willChangeValueForKey:@"isPinned"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(ICNote *)self setPrimitiveValue:v5 forKey:@"isPinned"];

    [(ICNote *)self didChangeValueForKey:@"isPinned"];
    char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"ICNotePinnedStatusChangedNotification" object:self];

    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"Set isPinned"];
  }
}

- (void)markAsSystemPaperIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(ICNote *)self markAsMathNoteIfNeeded:0];
    [(ICNote *)self markAsCallNoteIfNeeded:0];
  }
  if ([(ICNote *)self isSystemPaper] != v3)
  {
    [(ICNote *)self setIsSystemPaper:v3];
    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"Set isSystemPaper"];
    [(ICNote *)self updateChangeCountWithReason:@"Set isSystemPaper"];
  }
}

- (BOOL)isMathNote
{
  BOOL v3 = [(ICNote *)self hostApplicationIdentifier];
  if ([v3 isEqual:@"com.apple.greyparrot"])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(ICNote *)self hostApplicationIdentifier];
    char v4 = [v5 isEqual:@"com.apple.calculator"];
  }
  return v4;
}

- (void)markAsMathNoteIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(ICNote *)self markAsSystemPaperIfNeeded:0];
    [(ICNote *)self markAsCallNoteIfNeeded:0];
  }
  if ([(ICNote *)self isMathNote] != v3)
  {
    if (v3) {
      uint64_t v5 = @"com.apple.calculator";
    }
    else {
      uint64_t v5 = 0;
    }
    [(ICNote *)self setHostApplicationIdentifier:v5];
    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"Set isMathNote"];
    [(ICNote *)self updateChangeCountWithReason:@"Set isMathNote"];
  }
}

- (BOOL)isCallNote
{
  id v2 = [(ICNote *)self hostApplicationIdentifier];
  char v3 = [v2 isEqual:@"com.apple.mobilephone"];

  return v3;
}

- (void)markAsCallNoteIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(ICNote *)self markAsSystemPaperIfNeeded:0];
    [(ICNote *)self markAsMathNoteIfNeeded:0];
  }
  if ([(ICNote *)self isCallNote] != v3)
  {
    if (v3) {
      uint64_t v5 = @"com.apple.mobilephone";
    }
    else {
      uint64_t v5 = 0;
    }
    [(ICNote *)self setHostApplicationIdentifier:v5];
    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"Set isCallNote"];
    [(ICNote *)self updateChangeCountWithReason:@"Set isCallNote"];
  }
}

- (void)markAsCallNoteIfAttachmentIsCallRecording
{
  if (![(ICNote *)self isCallNote])
  {
    BOOL v3 = [(ICNote *)self attachments];
    int v4 = objc_msgSend(v3, "ic_containsObjectPassingTest:", &__block_literal_global_329);

    if (v4)
    {
      [(ICNote *)self markAsCallNoteIfNeeded:1];
    }
  }
}

uint64_t __51__ICNote_markAsCallNoteIfAttachmentIsCallRecording__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 audioModel];
  BOOL v3 = [v2 audioDocument];
  uint64_t v4 = [v3 isCallRecording];

  return v4;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNote *)self hostApplicationIdentifier];
  char v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    char v9 = 0;
  }
  else {
    char v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10))
  {
LABEL_18:

    goto LABEL_19;
  }
  char v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {

LABEL_15:
    id v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICNote setHostApplicationIdentifier:]();
    }

    uint64_t v15 = NSStringFromSelector(sel_hostApplicationIdentifier);
    [(ICNote *)self willChangeValueForKey:v15];

    long long v16 = NSStringFromSelector(sel_hostApplicationIdentifier);
    [(ICNote *)self setPrimitiveValue:v4 forKey:v16];

    uint64_t v5 = NSStringFromSelector(sel_hostApplicationIdentifier);
    [(ICNote *)self didChangeValueForKey:v5];
    goto LABEL_18;
  }
  char v13 = [(id)v8 isEqual:v10];

  if ((v13 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_19:
}

- (void)markActivitySummaryViewed
{
  BOOL v3 = [(ICNote *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__ICNote_markActivitySummaryViewed__block_invoke;
  v4[3] = &unk_1E64A4240;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __35__ICNote_markActivitySummaryViewed__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  char v2 = [*(id *)(a1 + 32) isSharedViaICloud];
  BOOL v3 = os_log_create("com.apple.notes", "ActivityStream");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __35__ICNote_markActivitySummaryViewed__block_invoke_cold_1((uint64_t)v1);
    }

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    [*v1 setLastActivitySummaryViewedDate:v5];

    [*v1 updateUserSpecificChangeCountWithReason:@"Marked activity summary viewed"];
    BOOL v3 = [*v1 managedObjectContext];
    [v3 ic_save];
  }
  else
  {
    if (v4) {
      __35__ICNote_markActivitySummaryViewed__block_invoke_cold_2((uint64_t)v1);
    }
  }
}

- (void)markLastActivityRecentUpdatesViewed
{
  BOOL v3 = [(ICNote *)self managedObjectContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke;
  v4[3] = &unk_1E64A4240;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  char v2 = [*(id *)(a1 + 32) isSharedViaICloud];
  BOOL v3 = os_log_create("com.apple.notes", "ActivityStream");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_1((uint64_t)v1);
    }

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    [*v1 setLastActivityRecentUpdatesViewedDate:v5];

    [*v1 updateUserSpecificChangeCountWithReason:@"Marked recent updates viewed"];
    BOOL v3 = [*v1 managedObjectContext];
    [v3 ic_save];
  }
  else
  {
    if (v4) {
      __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_2((uint64_t)v1);
    }
  }
}

- (BOOL)containsAttachmentWithDeepLink
{
  char v2 = [(ICNote *)self attachments];
  char v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_341);

  return v3;
}

uint64_t __40__ICNote_containsAttachmentWithDeepLink__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasSynapseLink];
}

- (NSArray)allDocumentMergeControllers
{
  char v3 = [MEMORY[0x1E4F1CA80] set];
  BOOL v4 = [(ICNote *)self documentMergeController];
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  uint64_t v5 = [(ICNote *)self attachments];
  char v6 = objc_msgSend(v5, "ic_compactMap:", &__block_literal_global_344);
  [v3 unionSet:v6];

  uint64_t v7 = (void *)[v3 copy];
  return (NSArray *)v7;
}

uint64_t __37__ICNote_allDocumentMergeControllers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 documentMergeController];
}

- (void)setShowsCollaboratorCursors:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v6 = [(ICNote *)self showsCollaboratorCursorsUserDefaultsKey];
  [v5 setBool:v3 forKey:v6];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICNoteShowsCollaboratorCursorsDidChangeNotification" object:self];
}

- (void)addInlineAttachmentsObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNote *)self inlineAttachments];
  char v6 = [v5 containsObject:v4];

  [(ICNote *)self managedObjectOriginal_addInlineAttachmentsObject:v4];
  if ((v6 & 1) == 0)
  {
    [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  }
}

- (void)removeInlineAttachmentsObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNote *)self inlineAttachments];
  int v6 = [v5 containsObject:v4];

  [(ICNote *)self managedObjectOriginal_removeInlineAttachmentsObject:v4];
  if (v6)
  {
    [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  }
}

- (void)addInlineAttachments:(id)a3
{
  [(ICNote *)self managedObjectOriginal_addInlineAttachments:a3];
  [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
}

- (void)removeInlineAttachments:(id)a3
{
  [(ICNote *)self managedObjectOriginal_removeInlineAttachments:a3];
  [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
}

- (id)cryptoStrategyProtocol
{
  return &unk_1F1F657D0;
}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self cryptoStrategy];
  int v6 = v5;
  if (v5)
  {
    id v7 = [v5 decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:v4];
  }
  else
  {
    unint64_t v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      char v9 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      int v11 = 138412290;
      BOOL v12 = v9;
      _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "note cannot have crypto strategy, but is asked to decrypt and merge text from record: %@", (uint8_t *)&v11, 0xCu);
    }
    [(ICCloudSyncingObject *)self setUnappliedEncryptedRecord:v4];
    id v7 = 0;
  }

  return v7;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCloudSyncingObject *)self cryptoStrategy];
  char v6 = [v5 mergeEncryptedDataFromRecord:v4];

  return v6;
}

- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudSyncingObject *)self cryptoStrategy];
  [v8 mergeEncryptedData:v7 mergeConflict:v6];
}

- (void)setCryptoInitializationVector:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  id v4 = a3;
  [(ICCloudSyncingObject *)&v6 setCryptoInitializationVector:v4];
  uint64_t v5 = [(ICNote *)self noteData];
  [v5 setCryptoInitializationVector:v4];
}

- (void)setCryptoTag:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  id v4 = a3;
  [(ICCloudSyncingObject *)&v6 setCryptoTag:v4];
  uint64_t v5 = [(ICNote *)self noteData];
  [v5 setCryptoTag:v4];
}

- (void)persistPendingChanges
{
  [(ICNote *)self didChangeNoteText];
  BOOL v3 = [(ICNote *)self noteData];
  [v3 saveNoteDataIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v4 persistPendingChanges];
}

- (void)clearDecryptedData
{
  if (objc_opt_respondsToSelector()) {
    [(ICNote *)self noteWillReleaseTextStorage];
  }
  document = self->_document;
  self->_document = 0;

  [(ICNote *)self setDecryptedData:0];
  if (objc_opt_respondsToSelector()) {
    [(ICNote *)self noteDidClearDecryptedData];
  }
  v4.receiver = self;
  v4.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v4 clearDecryptedData];
}

- (void)inlineAssetsForRecord:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNote;
  id v3 = a3;
  [(ICCloudSyncingObject *)&v4 inlineAssetsForRecord:v3];
  objc_msgSend(v3, "ic_inlineEncryptedDataAssetForKeyPrefix:", @"TextData", v4.receiver, v4.super_class);
}

+ (id)defaultTitleForEmptyNote
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Note" value:@"New Note" table:0 allowSiri:1];
}

- (_NSRange)rangeForSnippetWithTitleRange:(_NSRange)a3
{
  NSUInteger v4 = a3.location + a3.length;
  uint64_t v5 = [(ICNote *)self attributedString];
  uint64_t v6 = [v5 length] - v4;

  if ((v6 & (unint64_t)~(v6 >> 63)) >= 0xFF) {
    uint64_t v7 = 255;
  }
  else {
    uint64_t v7 = v6 & ~(v6 >> 63);
  }
  id v8 = [(ICNote *)self noteAsPlainText];
  uint64_t v9 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", v4, v7);
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (_NSRange)rangeForTitle:(BOOL *)a3
{
  NSUInteger v4 = (void *)MEMORY[0x1E4F83798];
  uint64_t v5 = [(ICNote *)self attributedString];
  uint64_t v6 = [v5 string];
  uint64_t v7 = [v4 rangeForTitleInContent:v6 truncated:a3];
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (id)widgetSnippetByEnumeratingAttachments
{
  if ([(ICNote *)self isPasswordProtected])
  {
    id v3 = [(ICNote *)self widgetSnippet];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      uint64_t v5 = os_log_create("com.apple.notes", "Widget");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(ICNote *)self widgetSnippetByEnumeratingAttachments];
      }

      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNote widgetSnippetByEnumeratingAttachments]" simulateCrash:1 showAlert:1 format:@"Non-empty widget snippet set on a locked note"];
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [(ICNote *)self attributedString];
    NSUInteger v8 = (void *)[v7 mutableCopy];

    if ([v8 length] && (objc_opt_respondsToSelector() & 1) != 0) {
      -[ICNote formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:](self, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v8, 0, 255, 0, 1);
    }
    NSUInteger v9 = [(ICNote *)self managedObjectContext];
    uint64_t v10 = objc_msgSend(v8, "ic_range");
    uint64_t v12 = v11;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__ICNote_widgetSnippetByEnumeratingAttachments__block_invoke;
    v17[3] = &unk_1E64A4CE8;
    id v18 = v8;
    id v13 = v8;
    objc_msgSend(v13, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v9, v10, v12, 0, v17);

    id v14 = (void *)MEMORY[0x1E4F83798];
    uint64_t v15 = [v13 string];
    uint64_t v6 = [v14 widgetSnippetForContent:v15];
  }
  return v6;
}

void __47__ICNote_widgetSnippetByEnumeratingAttachments__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  objc_opt_class();
  uint64_t v7 = ICDynamicCast();
  NSUInteger v8 = v7;
  if (v7)
  {
    NSUInteger v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v7 altText];
    uint64_t v11 = (__CFString *)v10;
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    else {
      uint64_t v12 = &stru_1F1F2FFF8;
    }
    objc_msgSend(v9, "replaceCharactersInRange:withString:", a3, a4, v12);
  }
  else
  {
    id v13 = [v14 attachmentModel];
    if (![v13 providesTextContentInNote]
      || ([v13 textContentInNote], (uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v11 = &stru_1F1F2FFF8;
    }
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v11);
  }
}

- (BOOL)regenerateTitle:(BOOL)a3 snippet:(BOOL)a4
{
  return [(ICNote *)self regenerateTitle:a3 snippet:a4 isNewNote:0];
}

- (BOOL)regenerateTitle:(BOOL)a3 snippet:(BOOL)a4 isNewNote:(BOOL)a5
{
  BOOL v5 = a5;
  v93[1] = *MEMORY[0x1E4F143B8];
  if ([(ICNote *)self containsPlaceholderBlockOrInlineAttachments]
    || [(ICNote *)self needsInitialFetchFromCloud])
  {
    NSUInteger v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICNote regenerateTitle:snippet:isNewNote:](self);
    }

    return 0;
  }
  else
  {
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    BOOL v92 = a3;
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x2020000000;
    BOOL v88 = a4;
    if ([(ICNote *)self markedForDeletion])
    {
      *((unsigned char *)v90 + 24) = 0;
      *((unsigned char *)v86 + 24) = 0;
    }
    else if ([(ICNote *)self isPasswordProtected])
    {
      *((unsigned char *)v86 + 24) = 0;
      if (![(ICCloudSyncingObject *)self isAuthenticated]) {
        *((unsigned char *)v90 + 24) = 0;
      }
      [(ICNote *)self setWidgetSnippet:0];
    }
    if (*((unsigned char *)v90 + 24) || *((unsigned char *)v86 + 24))
    {
      uint64_t v11 = [(ICNote *)self attributedString];
      uint64_t v12 = [v11 string];

      uint64_t v79 = 0;
      v80 = &v79;
      uint64_t v81 = 0x3032000000;
      v82 = __Block_byref_object_copy__4;
      v83 = __Block_byref_object_dispose__4;
      id v84 = 0;
      uint64_t v73 = 0;
      v74 = (id *)&v73;
      uint64_t v75 = 0x3032000000;
      v76 = __Block_byref_object_copy__4;
      v77 = __Block_byref_object_dispose__4;
      id v78 = 0;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__4;
      v71 = __Block_byref_object_dispose__4;
      id v72 = 0;
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__4;
      v65 = __Block_byref_object_dispose__4;
      id v66 = 0;
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__4;
      v59 = __Block_byref_object_dispose__4;
      id v60 = 0;
      if (*((unsigned char *)v86 + 24))
      {
        id v13 = [(ICNote *)self widgetSnippetByEnumeratingAttachments];
        [(ICNote *)self setWidgetSnippet:v13];
      }
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x2020000000;
      char v54 = 0;
      uint64_t v14 = [v12 length];
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke;
      v42 = &unk_1E64A4D38;
      v43 = self;
      v45 = &v79;
      v46 = &v89;
      v47 = &v85;
      id v15 = v12;
      id v44 = v15;
      v48 = v53;
      v49 = &v55;
      v50 = &v67;
      v51 = &v61;
      v52 = &v73;
      objc_msgSend(v15, "ic_enumerateParagraphsInRange:usingBlock:", 0, v14, &v39);
      if (*((unsigned char *)v90 + 24))
      {
        long long v16 = (void *)v80[5];
        if (!v16 || !objc_msgSend(v16, "length", v39, v40, v41, v42, v43))
        {
          uint64_t v17 = [(id)objc_opt_class() defaultTitleForEmptyNote];
          id v18 = (void *)v80[5];
          v80[5] = v17;
        }
        uint64_t v19 = [(ICNote *)self title];
        uint64_t v20 = (void *)v19;
        if (v19) {
          uint64_t v21 = (__CFString *)v19;
        }
        else {
          uint64_t v21 = &stru_1F1F2FFF8;
        }
        v22 = v21;

        char v23 = [(id)v80[5] isEqualToString:v22];
        if (v23)
        {
          int v24 = 0;
        }
        else
        {
          uint64_t v25 = [MEMORY[0x1E4F837D8] userActivityPersistentIdentifierForNote:self];
          v26 = (void *)v25;
          if (v25)
          {
            long long v27 = (void *)MEMORY[0x1E4F22488];
            v93[0] = v25;
            v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
            [v27 deleteSavedUserActivitiesWithPersistentIdentifiers:v28 completionHandler:&__block_literal_global_476];
          }
          [(ICNote *)self setTitle:v80[5]];
          [(ICNote *)self setAttributedTitle:v68[5]];

          int v24 = !v5;
        }

        char v10 = v23 ^ 1;
      }
      else
      {
        char v10 = 0;
        int v24 = 0;
      }
      if (*((unsigned char *)v86 + 24))
      {
        uint64_t v29 = [(ICNote *)self snippet];
        v30 = (void *)v29;
        if (v29) {
          int v31 = (__CFString *)v29;
        }
        else {
          int v31 = &stru_1F1F2FFF8;
        }
        v32 = v31;

        if (v74[5]) {
          __int16 v33 = (__CFString *)v74[5];
        }
        else {
          __int16 v33 = &stru_1F1F2FFF8;
        }
        objc_storeStrong(v74 + 5, v33);
        uint64_t v34 = [(ICNote *)self attributedSnippet];
        __int16 v35 = (void *)v62[5];
        if ((!v35 && v34 || (objc_msgSend(v35, "isEqualToAttributedString:", v34, v39, v40, v41, v42, v43) & 1) == 0)
          && ([(ICNote *)self isPasswordProtected] & 1) == 0)
        {
          [(ICNote *)self setAttributedSnippet:v62[5]];
          char v10 = 1;
        }
        if (([v74[5] isEqualToString:v32] & 1) == 0
          && ([(ICNote *)self isPasswordProtected] & 1) == 0)
        {
          [(ICNote *)self setSnippet:v74[5]];
          char v10 = 1;
        }
      }
      if (v24) {
        [(ICNote *)self updateLinksWhenPossible];
      }
      uint64_t v36 = [(ICNote *)self titleSourceAttachment];
      BOOL v37 = v36 == (void *)v56[5];

      if (!v37) {
        [(ICNote *)self setTitleSourceAttachment:v56[5]];
      }

      _Block_object_dispose(v53, 8);
      _Block_object_dispose(&v55, 8);

      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v67, 8);

      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v79, 8);
    }
    else
    {
      char v10 = 0;
    }
    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(&v89, 8);
  }
  return v10;
}

void __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = a4 - a2;
  NSUInteger v9 = [*(id *)(a1 + 32) attributedString];
  char v10 = objc_msgSend(v9, "attributedSubstringFromRange:", a2, v8);
  uint64_t v11 = (void *)[v10 mutableCopy];

  if ([v11 length])
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = objc_msgSend(v11, "ic_range");
      objc_msgSend(v12, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v11, v13, v14, a2, 1);
    }
    id v15 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v16 = objc_msgSend(v11, "ic_range");
    uint64_t v18 = v17;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke_2;
    v54[3] = &unk_1E64A4D10;
    uint64_t v58 = *(void *)(a1 + 48);
    id v19 = v11;
    id v55 = v19;
    long long v59 = *(_OWORD *)(a1 + 56);
    id v20 = *(id *)(a1 + 40);
    long long v60 = *(_OWORD *)(a1 + 72);
    uint64_t v21 = *(void *)(a1 + 32);
    id v56 = v20;
    uint64_t v57 = v21;
    objc_msgSend(v19, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v15, v16, v18, 0, v54);

    v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v22 && [v22 length])
    {
      if (![*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) length]
        && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        uint64_t v23 = *(void *)(*(void *)(a1 + 96) + 8);
        id obj = *(id *)(v23 + 40);
        uint64_t v24 = [MEMORY[0x1E4F83798] snippetForAttributedContent:v19 attributedSnippetIfNecessary:&obj];
        objc_storeStrong((id *)(v23 + 40), obj);
        uint64_t v25 = *(void *)(*(void *)(a1 + 104) + 8);
        v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }
    }
    else
    {
      char v53 = 0;
      uint64_t v27 = *(void *)(*(void *)(a1 + 88) + 8);
      id v52 = *(id *)(v27 + 40);
      uint64_t v28 = [MEMORY[0x1E4F83798] titleForAttributedContent:v19 truncated:&v53 attributedTitleIfNecessary:&v52];
      objc_storeStrong((id *)(v27 + 40), v52);
      uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v31 = [MEMORY[0x1E4F83798] attributedStringByRemovingTitle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fromAttributedString:v19];
        uint64_t v32 = *(void *)(*(void *)(a1 + 96) + 8);
        __int16 v33 = *(void **)(v32 + 40);
        *(void *)(v32 + 40) = v31;

        uint64_t v34 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        __int16 v35 = [*(id *)(a1 + 32) managedObjectContext];
        uint64_t v36 = objc_msgSend(v34, "ic_searchableStringInContext:", v35);
        uint64_t v37 = *(void *)(*(void *)(a1 + 96) + 8);
        v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = v36;

        uint64_t v39 = *(void *)(*(void *)(a1 + 96) + 8);
        id v51 = *(id *)(v39 + 40);
        uint64_t v40 = objc_msgSend(MEMORY[0x1E4F83798], "snippetForAttributedContent:attributedSnippetIfNecessary:");
        objc_storeStrong((id *)(v39 + 40), v51);
        uint64_t v41 = *(void *)(*(void *)(a1 + 104) + 8);
        v42 = *(void **)(v41 + 40);
        *(void *)(v41 + 40) = v40;
      }
      if (v53)
      {
        v43 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"…" value:@"…" table:0 allowSiri:1];
        uint64_t v44 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stringByAppendingString:v43];
        uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
        v46 = *(void **)(v45 + 40);
        *(void *)(v45 + 40) = v44;

        uint64_t v47 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "ic_attributedStringByAppendingString:", v43);
        uint64_t v48 = *(void *)(*(void *)(a1 + 88) + 8);
        v49 = *(void **)(v48 + 40);
        *(void *)(v48 + 40) = v47;
      }
    }
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length]
    && (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
     || !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    || [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length]
    && ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) length]
     || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
     || !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
  {
    *a5 = 1;
  }
}

void __44__ICNote_regenerateTitle_snippet_isNewNote___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v28 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v28;
    NSUInteger v9 = [v8 attachmentModel];
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length]
      || ![v9 providesStandaloneTitleForNote])
    {
LABEL_23:
      if (![v9 providesTextContentInNote]
        || ([v9 textContentInNote], (uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v18 = &stru_1F1F2FFF8;
      }
      objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v18);

      goto LABEL_27;
    }
    if (!a3) {
      goto LABEL_33;
    }
    char v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v11 = [v10 invertedSet];

    uint64_t v12 = [*(id *)(a1 + 32) string];
    uint64_t v13 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v11, 0, 0, a3);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_33:
      if ([v8 needsInitialFetchFromCloud])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        goto LABEL_21;
      }
      if ([v8 attachmentType] == 11)
      {
        uint64_t v24 = [v8 userTitle];
        if (v24)
        {
        }
        else if (objc_msgSend(*(id *)(a1 + 40), "ic_containsNonWhitespaceAndAttachmentCharacters"))
        {
          goto LABEL_21;
        }
      }
      uint64_t v25 = [v9 standaloneTitleForNote];
      uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }
LABEL_21:
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a2);
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_28;
  }
  id v14 = v28;
  uint64_t v15 = [v14 altText];
  uint64_t v16 = (void *)v15;
  uint64_t v17 = &stru_1F1F2FFF8;
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  uint64_t v18 = v17;

  if ([v14 isLinkAttachment])
  {
    id v19 = [v14 tokenContentIdentifier];
    id v20 = NotesAppURLForNoteIdentifierOrTokenContentIdentifier(v19);

    uint64_t v21 = +[ICAppURLUtilities noteIdentifierFromNotesAppURL:v20];
    v22 = [*(id *)(a1 + 48) identifier];
    uint64_t v23 = [v22 caseInsensitiveCompare:v21];

    if (!v23)
    {

      uint64_t v18 = &stru_1F1F2FFF8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, v18);
LABEL_27:

LABEL_28:
}

- (void)updateLinksWhenPossible
{
  id v3 = [(ICNote *)self updateLinksSelectorDelayer];

  if (!v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:self selector:sel__updateLinksOnMainThreadSelectorDelayer delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:0.2];
    [(ICNote *)self setUpdateLinksSelectorDelayer:v4];
  }
  BOOL v5 = [(ICNote *)self managedObjectContext];
  uint64_t v6 = [v5 concurrencyType];

  if (v6 == 2)
  {
    id v7 = [(ICNote *)self updateLinksSelectorDelayer];
    [v7 requestFire];
  }
}

- (void)_updateLinksOnMainThreadSelectorDelayer
{
  id v3 = [(ICNote *)self managedObjectContext];
  uint64_t v4 = [v3 concurrencyType];

  if (v4 == 2)
  {
    BOOL v5 = [(ICNote *)self titleForLinking];
    if ([v5 length])
    {
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      uint64_t v6 = [(ICNote *)self managedObjectContext];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__ICNote__updateLinksOnMainThreadSelectorDelayer__block_invoke;
      v8[3] = &unk_1E64A4D60;
      id v9 = v5;
      char v10 = self;
      uint64_t v11 = &v12;
      +[ICInlineAttachment enumerateLinksToNote:self batchSize:100 visibleOnly:1 saveAfterBatch:0 context:v6 usingBlock:v8];

      if (*((unsigned char *)v13 + 24))
      {
        id v7 = [(ICNote *)self managedObjectContext];
        objc_msgSend(v7, "ic_saveWithLogDescription:", @"Saving updated linked note titles");
      }
      _Block_object_dispose(&v12, 8);
    }
  }
}

void __49__ICNote__updateLinksOnMainThreadSelectorDelayer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 altText];
  char v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [*(id *)(a1 + 32) length];
      id v9 = objc_msgSend(v3, "ic_loggingIdentifier");
      char v10 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingIdentifier");
      int v11 = 134218498;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_debug_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEBUG, "Updating altText (length=%lu) for link (%@) to note (%@)", (uint8_t *)&v11, 0x20u);
    }
    [v3 setAltText:*(void *)(a1 + 32)];
    [v3 updateChangeCountWithReason:@"Updated alt text from note title"];
    id v7 = (id)objc_msgSend(v3, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICInlineAttachmentDataChangedNotification");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (signed)attachmentContentInfoType
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  __int16 v8 = 0;
  char v2 = [(ICNote *)self attachments];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__ICNote_attachmentContentInfoType__block_invoke;
  v4[3] = &unk_1E64A4C30;
  v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  LOWORD(v2) = *((_WORD *)v6 + 12);
  _Block_object_dispose(&v5, 8);
  return (__int16)v2;
}

void __35__ICNote_attachmentContentInfoType__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  int v5 = [v9 shouldShowInContentInfoText];
  uint64_t v6 = v9;
  if (v5)
  {
    if (![v9 attachmentType] || objc_msgSend(v9, "attachmentType") == 1)
    {
      *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
LABEL_5:
      uint64_t v6 = v9;
      goto LABEL_6;
    }
    int v7 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    unsigned __int16 v8 = [v9 attachmentType];
    if (!v7)
    {
      *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
      goto LABEL_5;
    }
    uint64_t v6 = v9;
    if (v7 != v8)
    {
      *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
LABEL_6:
}

- (int64_t)attachmentContentInfoCount
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = [MEMORY[0x1E4F28BD0] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(ICNote *)self attachments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v3);
        }
        char v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 shouldShowInContentInfoText])
        {
          int v11 = [v10 attachmentModel];
          unsigned int v12 = [v11 isIncludedInGenericAttachmentCount];

          v6 += v12;
          __int16 v13 = [v10 attachmentModel];
          uint64_t v14 = objc_opt_class();

          if (v14 == objc_opt_class()) {
            ++v7;
          }
          else {
            [v18 addObject:v14];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
    uint64_t v7 = 0;
  }

  if ([v18 count] == 1 && v7 == 0)
  {
    uint64_t v16 = [v18 anyObject];
    int64_t v6 = [v18 countForObject:v16];
  }
  return v6;
}

- (NSString)contentInfoText
{
  if ([(ICNote *)self isPasswordProtected])
  {
    id v3 = +[ICNote snippetForPasswordProtectedNote:self];
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [(ICNote *)self snippet];
    uint64_t v6 = [(ICNote *)self attachmentContentInfoType];
    int64_t v7 = [(ICNote *)self attachmentContentInfoCount];
    uint64_t v8 = [(ICNote *)self account];
    id v3 = [v4 contentInfoTextWithSnippet:v5 attachmentContentInfoType:v6 attachmentContentInfoCount:v7 account:v8];
  }
  return (NSString *)v3;
}

- (NSAttributedString)attributedContentInfoText
{
  if ([(ICNote *)self isPasswordProtected])
  {
    id v3 = +[ICNote snippetForPasswordProtectedNote:self];
    uint64_t v4 = objc_msgSend(v3, "ic_attributedString");
  }
  else
  {
    id v3 = [(ICNote *)self attributedSnippet];
    if (!v3)
    {
      id v3 = [(ICNote *)self snippet];

      if (v3)
      {
        id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v6 = [(ICNote *)self snippet];
        id v3 = (void *)[v5 initWithString:v6];
      }
    }
    int64_t v7 = objc_opt_class();
    uint64_t v8 = [(ICNote *)self attachmentContentInfoType];
    int64_t v9 = [(ICNote *)self attachmentContentInfoCount];
    char v10 = [(ICNote *)self account];
    uint64_t v4 = [v7 contentInfoAttributedTextWithSnippet:v3 attachmentContentInfoType:v8 attachmentContentInfoCount:v9 account:v10];
  }
  return (NSAttributedString *)v4;
}

- (NSString)widgetInfoText
{
  id v3 = (void *)MEMORY[0x1E4F83798];
  uint64_t v4 = [(ICNote *)self title];
  id v5 = [(ICNote *)self widgetSnippet];
  uint64_t v6 = [v3 stringByRemovingTitle:v4 fromString:v5];

  int64_t v7 = objc_msgSend(v6, "ic_trimmedString");

  if ([(ICNote *)self isPasswordProtected])
  {
    uint64_t v8 = +[ICNote snippetForPasswordProtectedNote:self];
  }
  else
  {
    int64_t v9 = objc_opt_class();
    uint64_t v10 = [(ICNote *)self attachmentContentInfoType];
    int64_t v11 = [(ICNote *)self attachmentContentInfoCount];
    unsigned int v12 = [(ICNote *)self account];
    uint64_t v8 = [v9 contentInfoTextWithSnippet:v7 attachmentContentInfoType:v10 attachmentContentInfoCount:v11 account:v12];
  }
  return (NSString *)v8;
}

+ (id)contentInfoTextWithSnippet:(id)a3 attachmentContentInfoType:(signed __int16)a4 attachmentContentInfoCount:(int64_t)a5 account:(id)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  id v10 = a6;
  int v11 = objc_msgSend(v9, "ic_containsHashtagPrefix");
  if (!v10 || !v11)
  {
LABEL_6:
    if ([v9 length])
    {
      id v17 = v9;
    }
    else
    {
      id v17 = [(objc_class *)+[ICAttachmentModel modelClassForAttachmentType:v8] contentInfoTextWithAttachmentCount:a5];
    }
    uint64_t v16 = v17;
    goto LABEL_10;
  }
  unsigned int v12 = objc_msgSend(v9, "ic_withoutHashtagPrefix");
  __int16 v13 = +[ICHashtag standardizedHashtagRepresentationForDisplayText:v12];

  uint64_t v14 = +[ICHashtag hashtagWithStandardizedContent:v13 account:v10];
  __int16 v15 = [v14 displayText];
  if (![v15 length])
  {

    goto LABEL_6;
  }
  uint64_t v16 = objc_msgSend(v15, "ic_withHashtagPrefix");

LABEL_10:
  return v16;
}

+ (id)contentInfoAttributedTextWithSnippet:(id)a3 attachmentContentInfoType:(signed __int16)a4 attachmentContentInfoCount:(int64_t)a5 account:(id)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  id v10 = a6;
  int v11 = [v9 string];
  int v12 = objc_msgSend(v11, "ic_containsHashtagPrefix");

  if (v10 && v12)
  {
    __int16 v13 = [v9 string];
    uint64_t v14 = objc_msgSend(v13, "ic_withoutHashtagPrefix");
    __int16 v15 = +[ICHashtag standardizedHashtagRepresentationForDisplayText:v14];

    uint64_t v16 = +[ICHashtag hashtagWithStandardizedContent:v15 account:v10];
    id v17 = [v16 displayText];
    if ([v17 length])
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
      long long v19 = objc_msgSend(v17, "ic_withHashtagPrefix");
      id v20 = (id)[v18 initWithString:v19];

      goto LABEL_9;
    }
  }
  if ([v9 length])
  {
    id v20 = v9;
  }
  else
  {
    long long v21 = [(objc_class *)+[ICAttachmentModel modelClassForAttachmentType:v8] contentInfoTextWithAttachmentCount:a5];
    id v20 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21];
  }
LABEL_9:

  return v20;
}

- (void)setNeedsInitialFetchFromCloud:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICNote *)self needsInitialFetchFromCloud] != a3)
  {
    id v5 = [(ICNote *)self folder];
    [v5 willChangeValueForKey:@"visibleNotes"];

    uint64_t v6 = [(ICNote *)self account];
    [v6 willChangeValueForKey:@"visibleNotes"];

    v9.receiver = self;
    v9.super_class = (Class)ICNote;
    [(ICCloudSyncingObject *)&v9 setNeedsInitialFetchFromCloud:v3];
    int64_t v7 = [(ICNote *)self folder];
    [v7 didChangeValueForKey:@"visibleNotes"];

    uint64_t v8 = [(ICNote *)self account];
    [v8 didChangeValueForKey:@"visibleNotes"];
  }
}

- (void)setAccount:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ICNote *)self account];
  char v5 = [v4 isEqual:v8];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(ICNote *)self attachments];
    int64_t v7 = (void *)[v6 copy];
    [v7 makeObjectsPerformSelector:sel_accountWillChangeToAccount_ withObject:v8];
  }
  [(ICNote *)self willChangeValueForKey:@"account"];
  [(ICNote *)self setPrimitiveValue:v8 forKey:@"account"];
  [(ICNote *)self didChangeValueForKey:@"account"];
}

- (void)setFolder:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNote *)self folder];
  if (v5 != v4)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(ICNote *)v4 setFolder:v6];
    }

    [(ICNote *)self willChangeValueForKey:@"folder"];
    [(ICNote *)self willChangeValueForKey:@"parentCloudObject"];
    [(ICNote *)self setPrimitiveFolder:v4];
    [(ICNote *)self didChangeValueForKey:@"folder"];
    [(ICNote *)self didChangeValueForKey:@"parentCloudObject"];
    if (!v4)
    {
      int64_t v7 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[ICNote setFolder:](self, v7);
      }
    }
    uint64_t v8 = [v4 account];
    if (v8)
    {
      objc_super v9 = (void *)v8;
      id v10 = [v4 account];
      int v11 = [(ICNote *)self account];

      if (v10 != v11)
      {
        int v12 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          [(ICNote *)v4 setFolder:v12];
        }

        __int16 v13 = [v4 account];
        [(ICNote *)self setAccount:v13];
      }
    }
    [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
    [v5 markShareDirtyIfNeededWithReason:@"Updated note's folder"];
    [v4 markShareDirtyIfNeededWithReason:@"Updated note's folder"];
  }
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ICNote *)self folder];
  [v5 willChangeValueForKey:@"visibleNotesCount"];
  [v5 willChangeValueForKey:@"children"];
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v6 setMarkedForDeletion:v3];
  [v5 didChangeValueForKey:@"children"];
  [v5 didChangeValueForKey:@"visibleNotesCount"];
}

- (void)setLegacyManagedObjectID:(id)a3
{
  id v5 = [a3 URIRepresentation];
  id v4 = [v5 absoluteString];
  [(ICNote *)self setLegacyManagedObjectIDURIRepresentation:v4];
}

- (ICTTVectorMultiTimestamp)timestamp
{
  char v2 = [(ICNote *)self document];
  BOOL v3 = [v2 mergeableString];
  id v4 = [v3 timestamp];

  return (ICTTVectorMultiTimestamp *)v4;
}

- (ICTTVectorMultiTimestamp)lastNotifiedTimestamp
{
  lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  if (!lastNotifiedTimestamp)
  {
    id v4 = [(ICNote *)self lastNotifiedTimestampData];
    if (v4)
    {
      id v5 = [[ICTTVectorMultiTimestamp alloc] initWithData:v4 andCapacity:2];
      objc_super v6 = self->_lastNotifiedTimestamp;
      self->_lastNotifiedTimestamp = v5;
    }
    lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  }
  return lastNotifiedTimestamp;
}

- (void)setLastNotifiedTimestamp:(id)a3
{
  id v4 = [a3 serialize];
  [(ICNote *)self setLastNotifiedTimestampData:v4];

  lastNotifiedTimestamp = self->_lastNotifiedTimestamp;
  self->_lastNotifiedTimestamp = 0;
}

- (ICTTVectorMultiTimestamp)lastViewedTimestamp
{
  lastViewedTimestamp = self->_lastViewedTimestamp;
  if (!lastViewedTimestamp)
  {
    id v4 = [(ICNote *)self lastViewedTimestampData];
    if (v4)
    {
      id v5 = [[ICTTVectorMultiTimestamp alloc] initWithData:v4 andCapacity:2];
      objc_super v6 = self->_lastViewedTimestamp;
      self->_lastViewedTimestamp = v5;
    }
    lastViewedTimestamp = self->_lastViewedTimestamp;
  }
  return lastViewedTimestamp;
}

- (void)setLastViewedTimestamp:(id)a3
{
  id v4 = [a3 serialize];
  [(ICNote *)self setLastViewedTimestampData:v4];

  lastViewedTimestamp = self->_lastViewedTimestamp;
  self->_lastViewedTimestamp = 0;
}

- (void)setLastActivityRecentUpdatesViewedDate:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNote *)self recentUpdatesFirstSeenDate];

  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F1C9C8] now];
    [(ICNote *)self setRecentUpdatesFirstSeenDate:v6];
  }
  if (!self->_recentUpdatesGenerationDate)
  {
    int64_t v7 = [(ICNote *)self lastActivityRecentUpdatesViewedDate];
    recentUpdatesGenerationDate = self->_recentUpdatesGenerationDate;
    self->_recentUpdatesGenerationDate = v7;
  }
  [(ICNote *)self willChangeValueForKey:@"lastActivityRecentUpdatesViewedDate"];
  [(ICNote *)self setPrimitiveValue:v4 forKey:@"lastActivityRecentUpdatesViewedDate"];

  [(ICNote *)self didChangeValueForKey:@"lastActivityRecentUpdatesViewedDate"];
}

+ (id)keyPathsForValuesAffectingRecentUpdatesGenerationDate
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1F62B98];
}

- (NSDate)recentUpdatesGenerationDate
{
  if ([(ICCloudSyncingObject *)self isInCloud]
    && ([(ICCloudSyncingObject *)self userSpecificServerRecord],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    objc_super v6 = 0;
  }
  else if (self->_recentUpdatesGenerationDate {
         && ([(ICNote *)self recentUpdatesFirstSeenDate],
  }
             id v4 = objc_claimAutoreleasedReturnValue(),
             int v5 = objc_msgSend(v4, "ic_isLaterThanUnitsAgo:value:", 64, 10),
             v4,
             v5))
  {
    objc_super v6 = self->_recentUpdatesGenerationDate;
  }
  else
  {
    int64_t v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    objc_super v9 = [v7 dateByAddingUnit:16 value:-7 toDate:v8 options:0];

    id v10 = [(ICNote *)self lastActivityRecentUpdatesViewedDate];
    LODWORD(v8) = objc_msgSend(v10, "ic_isLaterThanDate:", v9);

    if (v8)
    {
      objc_super v6 = [(ICNote *)self lastActivityRecentUpdatesViewedDate];
    }
    else
    {
      int v11 = [(ICCloudSyncingObject *)self shareTimestamp];
      if (!v11 || (char v12 = objc_msgSend(v9, "ic_isLaterThanDate:", v11), v13 = v9, (v12 & 1) == 0)) {
        __int16 v13 = v11;
      }
      objc_super v6 = v13;
    }
  }
  return v6;
}

- (void)clearRecentUpdatesGenerationDateIfNeeded
{
  if ([(ICNote *)self hasRecentExternalEdits])
  {
    BOOL v3 = [(ICCloudSyncingObject *)self viewContext];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__ICNote_clearRecentUpdatesGenerationDateIfNeeded__block_invoke;
    v5[3] = &unk_1E64A4218;
    id v6 = v3;
    int64_t v7 = self;
    id v4 = v3;
    [v4 performBlockAndWait:v5];
  }
}

void __50__ICNote_clearRecentUpdatesGenerationDateIfNeeded__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  char v2 = [*(id *)(a1 + 40) objectID];
  objc_msgSend(v1, "ic_existingObjectWithID:", v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v3 = [v4 lastActivityRecentUpdatesViewedDate];
  [v4 setRecentUpdatesGenerationDate:v3];

  [v4 setRecentUpdatesFirstSeenDate:0];
}

- (id)ic_loggingValues
{
  BOOL v3 = [(ICNote *)self noteData];
  uint64_t v4 = [v3 needsToBeSaved];

  int v5 = [(ICNote *)self noteData];
  [v5 setNeedsToBeSaved:0];

  v16.receiver = self;
  v16.super_class = (Class)ICNote;
  id v6 = [(ICCloudSyncingObject *)&v16 ic_loggingValues];
  int64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(ICNote *)self noteData];
  [v8 setNeedsToBeSaved:v4];

  objc_super v9 = [(ICNote *)self managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __26__ICNote_ic_loggingValues__block_invoke;
  v14[3] = &unk_1E64A4218;
  v14[4] = self;
  id v10 = v7;
  id v15 = v10;
  [v9 performBlockAndWait:v14];

  int v11 = v15;
  id v12 = v10;

  return v12;
}

uint64_t __26__ICNote_ic_loggingValues__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) documentWithoutCreating];

  if (v2)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v4 = [*(id *)(a1 + 32) documentWithoutCreating];
    int v5 = [v4 mergeableString];
    id v6 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"length"];
  }
  int64_t v7 = [*(id *)(a1 + 32) folder];
  uint64_t v8 = [v7 identifier];
  objc_super v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:@"folder"];

  int v11 = [*(id *)(a1 + 32) account];
  uint64_t v12 = [v11 identifier];
  __int16 v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  else {
    uint64_t v14 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:@"account"];

  uint64_t v15 = [*(id *)(a1 + 32) creationDate];
  objc_super v16 = (void *)v15;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  else {
    id v17 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:@"creationDate"];

  uint64_t v18 = [*(id *)(a1 + 32) modificationDate];
  long long v19 = (void *)v18;
  if (v18) {
    id v20 = (__CFString *)v18;
  }
  else {
    id v20 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:@"modificationDate"];

  uint64_t v21 = [*(id *)(a1 + 32) folderModificationDate];
  long long v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = (__CFString *)v21;
  }
  else {
    uint64_t v23 = &stru_1F1F2FFF8;
  }
  [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"folderModificationDate"];

  if ([*(id *)(a1 + 32) isPinned]) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"pinned"];
  }
  if ([*(id *)(a1 + 32) prefersLightBackground]) {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"prefersLightBackground"];
  }
  uint64_t v24 = [*(id *)(a1 + 32) titleSourceAttachment];

  if (v24)
  {
    uint64_t v25 = [*(id *)(a1 + 32) titleSourceAttachment];
    uint64_t v26 = [v25 identifier];
    [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:@"titleSourceAttachmentID"];
  }
  uint64_t v27 = [*(id *)(a1 + 32) attachments];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    uint64_t v29 = [*(id *)(a1 + 32) attachments];
    v30 = [v29 allObjects];
    uint64_t v31 = [v30 valueForKey:@"recordName"];
    [*(id *)(a1 + 40) setObject:v31 forKeyedSubscript:@"attachments"];
  }
  uint64_t v32 = [*(id *)(a1 + 32) inlineAttachments];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    uint64_t v34 = [*(id *)(a1 + 32) inlineAttachments];
    __int16 v35 = [v34 allObjects];
    uint64_t v36 = [v35 valueForKey:@"recordName"];
    [*(id *)(a1 + 40) setObject:v36 forKeyedSubscript:@"inlineAttachments"];
  }
  uint64_t v37 = [*(id *)(a1 + 32) legacyContentHashAtImport];

  if (v37)
  {
    v38 = [*(id *)(a1 + 32) legacyContentHashAtImport];
    [*(id *)(a1 + 40) setObject:v38 forKeyedSubscript:@"legacyContentHashAtImport"];
  }
  uint64_t v39 = [*(id *)(a1 + 32) legacyImportDeviceIdentifier];

  if (v39)
  {
    uint64_t v40 = [*(id *)(a1 + 32) legacyImportDeviceIdentifier];
    [*(id *)(a1 + 40) setObject:v40 forKeyedSubscript:@"legacyImportDeviceIdentifier"];
  }
  uint64_t v41 = [*(id *)(a1 + 32) legacyModificationDateAtImport];

  if (v41)
  {
    v42 = [*(id *)(a1 + 32) legacyModificationDateAtImport];
    [*(id *)(a1 + 40) setObject:v42 forKeyedSubscript:@"legacyModificationDateAtImport"];
  }
  v43 = [*(id *)(a1 + 32) lastNotifiedDate];

  if (v43)
  {
    uint64_t v44 = [*(id *)(a1 + 32) lastNotifiedDate];
    [*(id *)(a1 + 40) setObject:v44 forKeyedSubscript:@"lastNotifiedDate"];
  }
  uint64_t result = [*(id *)(a1 + 32) isSystemPaper];
  if (result)
  {
    uint64_t v46 = MEMORY[0x1E4F1CC38];
    uint64_t v47 = *(void **)(a1 + 40);
    return [v47 setObject:v46 forKeyedSubscript:@"isSystemPaper"];
  }
  return result;
}

+ (BOOL)supportsActivityEvents
{
  return 1;
}

- (BOOL)addUserID:(id)a3 forReplicaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICNote *)self replicaIDToUserID];
  objc_super v9 = [v7 UUIDString];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    int v11 = [(ICNote *)self replicaIDToUserID];
    uint64_t v12 = [v7 UUIDString];
    [v11 setObject:v6 forKeyedSubscript:v12];

    __int16 v13 = [(ICNote *)self replicaIDToUserID];
    uint64_t v14 = [v13 encodedData];
    [(ICNote *)self setReplicaIDToUserIDDictData:v14];
  }
  return v10 == 0;
}

- (unint64_t)mergeReplicaIDToUserID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNote *)self replicaIDToUserIDDictData];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = (void *)v5;
  id v7 = [(ICNote *)self replicaIDToUserID];
  uint64_t v8 = [v7 allKeys];
  objc_super v9 = [(ICCloudSyncingObject *)self deviceReplicaIDs];
  int v10 = [v8 isEqual:v9];

  if (!v10)
  {
    uint64_t v15 = [(ICNote *)self replicaIDToUserID];
    unint64_t v13 = [v15 mergeWithDictionary:v4];

    if (v13 != 2) {
      goto LABEL_5;
    }
    objc_super v16 = [(ICNote *)self replicaIDToUserID];
    id v17 = [v16 encodedData];
    [(ICNote *)self setReplicaIDToUserIDDictData:v17];
  }
  else
  {
LABEL_3:
    [(ICNote *)self willChangeValueForKey:@"replicaIDToUserID"];
    int v11 = [v4 encodedData];
    [(ICNote *)self setReplicaIDToUserIDDictData:v11];

    replicaIDToUserID = self->_replicaIDToUserID;
    self->_replicaIDToUserID = 0;

    [(ICNote *)self didChangeValueForKey:@"replicaIDToUserID"];
  }
  unint64_t v13 = 2;
LABEL_5:

  return v13;
}

- (void)setOutlineStateData:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(sel_outlineStateData);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ICNote *)self willChangeValueForKey:v6];
  [(ICNote *)self setPrimitiveValue:v4 forKey:v6];

  [(ICNote *)self didChangeValueForKey:v6];
  outlineState = self->_outlineState;
  self->_outlineState = 0;
}

- (BOOL)updateDeviceReplicaIDsToUserIDIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (([(ICNote *)self isDeleted] & 1) == 0
    && ![(ICNote *)self markedForDeletion])
  {
    id v6 = [(ICNote *)self cloudAccount];
    id v7 = ICNotesAppBundleIdentifier();
    uint64_t v5 = [v6 replicaIDForBundleIdentifier:v7];

    if (!v5)
    {
      objc_super v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded](self);
      }
      LOBYTE(v4) = 0;
      BOOL v3 = v9;
      goto LABEL_18;
    }
    uint64_t v8 = [(ICNote *)self cloudAccount];
    BOOL v3 = [v8 userRecordName];

    if (v3)
    {
      if (![(ICNote *)self needsInitialFetchFromCloud])
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        objc_super v9 = [(ICCloudSyncingObject *)self deviceReplicaIDs];
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          int v4 = 0;
          uint64_t v13 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v9);
              }
              v4 |= [(ICNote *)self addUserID:v3 forReplicaID:*(void *)(*((void *)&v15 + 1) + 8 * i)];
            }
            uint64_t v12 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v12);
          goto LABEL_18;
        }
LABEL_17:
        LOBYTE(v4) = 0;
LABEL_18:

        goto LABEL_19;
      }
      objc_super v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded].cold.4(self);
      }
    }
    else
    {
      objc_super v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded](self);
      }
    }

    goto LABEL_17;
  }
  BOOL v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICNote updateDeviceReplicaIDsToUserIDIfNeeded](self);
  }
  LOBYTE(v4) = 0;
  uint64_t v5 = v3;
LABEL_19:

  return v4 & 1;
}

- (id)participantForReplicaID:(id)a3
{
  int v4 = [(ICNote *)self userIDForReplicaID:a3];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unknown");
  id v6 = [v5 UUIDString];
  if ([v4 isEqual:v6])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(ICCloudSyncingObject *)self participantForUserID:v4];
  }

  return v7;
}

- (void)updateDerivedAttributesIfNeeded
{
  BOOL v3 = [(ICNote *)self noteData];
  if (v3)
  {
    id v16 = v3;
    if (([(ICNote *)self needsInitialFetchFromCloud] & 1) == 0)
    {
      if (self->_document)
      {
      }
      else
      {
        BOOL v4 = [(ICNote *)self needsInitialDerivedAttributesUpdate];

        if (!v4) {
          return;
        }
      }
      objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICNote hasChecklistOnlyInProgress:](self, "hasChecklistOnlyInProgress:", 0));
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [(ICNote *)self hasChecklist];
      char v6 = [v5 isEqualToNumber:v16];

      if ((v6 & 1) == 0) {
        [(ICNote *)self setHasChecklist:v16];
      }
      id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICNote hasChecklistOnlyInProgress:](self, "hasChecklistOnlyInProgress:", 1));
      uint64_t v8 = [(ICNote *)self hasChecklistInProgress];
      char v9 = [v8 isEqualToNumber:v7];

      if ((v9 & 1) == 0) {
        [(ICNote *)self setHasChecklistInProgress:v7];
      }
      int v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICNote textStorageHasAttribute:](self, "textStorageHasAttribute:", *MEMORY[0x1E4FB06B0]));
      uint64_t v11 = [(ICNote *)self hasSystemTextAttachments];
      char v12 = [v11 isEqualToNumber:v10];

      if ((v12 & 1) == 0) {
        [(ICNote *)self setHasSystemTextAttachments:v10];
      }
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICNote textStorageHasAttribute:](self, "textStorageHasAttribute:", ICTTAttributeNameEmphasis));
      uint64_t v14 = [(ICNote *)self hasEmphasis];
      char v15 = [v14 isEqualToNumber:v13];

      if ((v15 & 1) == 0) {
        [(ICNote *)self setHasEmphasis:v13];
      }
    }
    BOOL v3 = v16;
  }
}

- (void)willUpdateDeviceReplicaIDsToNotesVersion:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == 6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = [(ICCloudSyncingObject *)self deviceReplicaIDs];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          int v10 = [(ICNote *)self document];
          uint64_t v11 = [v10 mergeableString];
          [v11 removeTimestampsForReplicaID:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (id)notesVersionForUserID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [(ICNote *)self replicaIDToUserID];
  uint64_t v6 = [v5 allKeys];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        long long v13 = [(ICNote *)self userIDForReplicaID:v12];
        int v14 = [v13 isEqual:v4];

        if (v14)
        {
          long long v15 = [(ICCloudSyncingObject *)self notesVersionForReplicaID:v12];
          if (!v15)
          {

            goto LABEL_16;
          }
          id v16 = v15;
          if (!v9 || (uint64_t v17 = [v15 integerValue], v17 < objc_msgSend(v9, "integerValue")))
          {
            id v18 = v16;

            uint64_t v9 = v18;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_16:
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)notesVersionForParticipant:(id)a3
{
  id v4 = [a3 userIdentity];
  uint64_t v5 = [v4 userRecordID];
  uint64_t v6 = [v5 recordName];
  uint64_t v7 = [(ICNote *)self notesVersionForUserID:v6];

  return v7;
}

- (id)minimumNotesVersionForUserIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = -[ICNote notesVersionForUserID:](self, "notesVersionForUserID:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (!v10)
        {

          goto LABEL_14;
        }
        uint64_t v11 = v10;
        if (!v7 || (uint64_t v12 = [v10 integerValue], v12 < objc_msgSend(v7, "integerValue")))
        {
          id v13 = v11;

          uint64_t v7 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_14:
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)minimumNotesVersionForAllParticipants
{
  if ([(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    BOOL v3 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
    id v4 = [v3 participants];
    uint64_t v5 = objc_msgSend(v4, "ic_map:", &__block_literal_global_573);

    uint64_t v6 = [(ICNote *)self minimumNotesVersionForUserIDs:v5];
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend((id)objc_opt_class(), "currentNotesVersion"));
  }
  return v6;
}

id __47__ICNote_minimumNotesVersionForAllParticipants__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 userIdentity];
  BOOL v3 = [v2 userRecordID];
  id v4 = [v3 recordName];

  return v4;
}

- (NSData)decryptedData
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setDecryptedData:(id)a3
{
}

- (void)setDocument:(id)a3
{
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->needsRefresh = a3;
}

- (BOOL)needsToSaveLastViewedTimestamp
{
  return self->needsToSaveLastViewedTimestamp;
}

- (void)setNeedsToSaveLastViewedTimestamp:(BOOL)a3
{
  self->needsToSaveLastViewedTimestamp = a3;
}

- (BOOL)preventReleasingTextStorage
{
  return self->preventReleasingTextStorage;
}

- (void)setPreventReleasingTextStorage:(BOOL)a3
{
  self->preventReleasingTextStorage = a3;
}

- (id)reservedForCollaborationColorManager
{
  return self->_reservedForCollaborationColorManager;
}

- (void)setReservedForCollaborationColorManager:(id)a3
{
}

- (BOOL)shouldAddMediaAsynchronously
{
  return self->shouldAddMediaAsynchronously;
}

- (void)setShouldAddMediaAsynchronously:(BOOL)a3
{
  self->shouldAddMediaAsynchronously = a3;
}

- (BOOL)isRecoveringCryptoWrappedKey
{
  return self->isRecoveringCryptoWrappedKey;
}

- (void)setIsRecoveringCryptoWrappedKey:(BOOL)a3
{
  self->isRecoveringCryptoWrappedKey = a3;
}

- (BOOL)isPerformingMerge
{
  return self->_isPerformingMerge;
}

- (void)setIsPerformingMerge:(BOOL)a3
{
  self->_isPerformingMerge = a3;
}

- (void)setRecentUpdatesGenerationDate:(id)a3
{
}

- (NSDate)recentUpdatesFirstSeenDate
{
  return self->_recentUpdatesFirstSeenDate;
}

- (void)setRecentUpdatesFirstSeenDate:(id)a3
{
}

- (void)setIsNewNoteWithHashtagsInsertedIntoBody:(BOOL)a3
{
  self->_isNewNoteWithHashtagsInsertedIntoBody = a3;
}

- (BOOL)wasAuthenticatedBeforeTurningIntoFault
{
  return self->wasAuthenticatedBeforeTurningIntoFault;
}

- (void)setWasAuthenticatedBeforeTurningIntoFault:(BOOL)a3
{
  self->wasAuthenticatedBeforeTurningIntoFault = a3;
}

- (void)setOutlineState:(id)a3
{
}

- (ICSelectorDelayer)updateLinksSelectorDelayer
{
  return self->updateLinksSelectorDelayer;
}

- (void)setUpdateLinksSelectorDelayer:(id)a3
{
}

+ (id)newObjectWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 persistentStoreCoordinator];
  uint64_t v9 = [v8 persistentStores];
  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [v10 options];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1BF20]];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    int v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[ICNote(Management) newObjectWithIdentifier:context:]();
    }
    id v15 = 0;
  }
  else
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___ICNote;
    id v15 = objc_msgSendSuper2(&v17, sel_newObjectWithIdentifier_context_, v6, v7);
    if (v7)
    {
      int v14 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"ICNoteData" inManagedObjectContext:v7];
      [v15 setNoteData:v14];
      [v14 setNote:v15];
    }
    else
    {
      int v14 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[ICNote(Management) newObjectWithIdentifier:context:]();
      }
    }
  }

  return v15;
}

+ (id)newEmptyNoteInContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  uint64_t v8 = (void *)[a1 newObjectWithIdentifier:v7 context:v5];

  return v8;
}

+ (id)newNoteWithoutIdentifierInAccount:(id)a3
{
  id v4 = [a3 defaultFolder];
  id v5 = (void *)[a1 newObjectWithIdentifier:0 folder:v4];

  return v5;
}

+ (id)newObjectWithIdentifier:(id)a3 folder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 managedObjectContext];
    uint64_t v10 = [v9 persistentStoreCoordinator];
    uint64_t v11 = [v10 persistentStores];
    uint64_t v12 = [v11 firstObject];
    int v13 = [v12 options];
    int v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1BF20]];
    int v15 = [v14 BOOLValue];

    if (v15)
    {
      long long v16 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[ICNote(Management) newObjectWithIdentifier:context:]();
      }
      id v17 = 0;
    }
    else
    {
      v27.receiver = a1;
      v27.super_class = (Class)&OBJC_METACLASS___ICNote;
      id v17 = objc_msgSendSuper2(&v27, sel_newObjectWithIdentifier_context_, v6, v9);
      long long v16 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"ICNoteData" inManagedObjectContext:v9];
      uint64_t v20 = [v8 account];
      long long v21 = [v20 persistentStore];
      [v17 assignToPersistentStore:v21];

      long long v22 = [v8 managedObjectContext];
      long long v23 = [v8 account];
      long long v24 = [v23 persistentStore];
      [v22 assignObject:v16 toPersistentStore:v24];

      [v17 setNoteData:v16];
      [v16 setNote:v17];
      [v17 setFolder:v8];
      uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
      [v17 setFolderModificationDate:v25];
    }
  }
  else
  {
    long long v18 = (void *)MEMORY[0x1E4F836F8];
    long long v19 = NSStringFromClass((Class)a1);
    [v18 handleFailedAssertWithCondition:"folder", "+[ICNote(Management) newObjectWithIdentifier:folder:]", 1, 0, @"Trying to create a %@ with no folder", v19 functionName simulateCrash showAlert format];

    id v17 = 0;
  }

  return v17;
}

+ (id)newNoteWithoutIdentifierInFolder:(id)a3
{
  return (id)[a1 newObjectWithIdentifier:0 folder:a3];
}

+ (id)newEmptyNoteInFolder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = (void *)[a1 newEmptyNoteWithUUID:v6 folder:v5];

  return v7;
}

+ (id)newEmptyNoteWithIdentifier:(id)a3 folder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  if (ICInternalSettingsGetBundleBoolSettingValue())
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:255830400.0];

    uint64_t v8 = (void *)v9;
  }
  uint64_t v10 = (void *)[a1 newObjectWithIdentifier:v6 folder:v7];
  [v10 setCreationDate:v8];
  [v10 setModificationDate:v8];
  uint64_t v11 = [v10 noteData];
  [v11 setData:0];

  [v10 regenerateTitle:1 snippet:0 isNewNote:1];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  [v10 setLastAttributionsViewedDate:v12];

  int v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v14 = [MEMORY[0x1E4F1C9C8] now];
  int v15 = [v13 dateByAddingUnit:16 value:-7 toDate:v14 options:0];
  [v10 setLastActivityRecentUpdatesViewedDate:v15];

  long long v16 = [v10 lastActivityRecentUpdatesViewedDate];
  [v10 setLastActivitySummaryViewedDate:v16];

  if (objc_opt_respondsToSelector()) {
    id v17 = (id)[v10 persistCreateActivityEventForObject:v10 inParentObject:v7];
  }

  return v10;
}

+ (id)newEmptyNoteWithUUID:(id)a3 folder:(id)a4
{
  id v6 = a4;
  id v7 = [a3 UUIDString];
  uint64_t v8 = (void *)[a1 newEmptyNoteWithIdentifier:v7 folder:v6];

  return v8;
}

+ (void)deleteEmptyNote:(id)a3
{
  id v4 = a3;
  if (([v4 isEmpty] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"note.isEmpty" functionName:"+[ICNote(Management) deleteEmptyNote:]" simulateCrash:1 showAlert:0 format:@"Note is not empty for deletion"];
  }
  if ([v4 isEmpty])
  {
    id v5 = os_log_create("com.apple.notes", "Delete");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) deleteEmptyNote:](v4);
    }

    id v6 = [v4 account];
    id v7 = [v6 trashFolder];
    [v4 setFolder:v7];

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
    [v4 setFolderModificationDate:v8];

    [a1 deleteNote:v4];
  }
}

+ (void)deleteNote:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[ICNoteContext sharedContext];
  int v5 = [v4 hasContextOptions:64];

  if (v5)
  {
    id v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ICNote(Management) deleteNote:]();
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [v3 attachments];
    uint64_t v8 = (void *)[v7 copy];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          +[ICAttachment deleteAttachment:*(void *)(*((void *)&v24 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v13 = objc_msgSend(v3, "inlineAttachments", 0);
    int v14 = (void *)[v13 copy];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          +[ICBaseAttachment deleteAttachment:*(void *)(*((void *)&v20 + 1) + 8 * v18++)];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }

    long long v19 = os_log_create("com.apple.notes", "Delete");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) deleteNote:](v3);
    }

    [v3 markForDeletion];
    if ([v3 requiresLegacyTombstoneAfterDeletion]) {
      +[ICLegacyTombstone addLegacyTombstoneForNote:v3];
    }
  }
}

+ (void)purgeNote:(id)a3
{
  id v3 = a3;
  id v4 = +[ICNoteContext sharedContext];
  int v5 = [v4 hasContextOptions:64];

  if (v5)
  {
    id v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ICNote(Management) purgeNote:]();
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"ICNoteWillBeDeletedNotification" object:v3];

    id v6 = [v3 managedObjectContext];
    [v6 deleteObject:v3];
  }
}

+ (id)refreshAllOfNoteWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", a3];
  uint64_t v8 = (void *)[a1 newFetchRequestForNotes];
  [v8 setPredicate:v7];
  [v8 setRelationshipKeyPathsForPrefetching:&unk_1F1F62BB0];
  uint64_t v9 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.8();
  }

  uint64_t v10 = [v6 executeFetchRequest:v8 error:0];
  uint64_t v11 = [v10 lastObject];
  if ([v11 needsRefresh])
  {
    uint64_t v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.7(v11);
    }

    int v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.6(v11);
    }

    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v11, 1);
    int v14 = [v11 noteData];
    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v14, 1);

    uint64_t v15 = [v11 folder];
    objc_msgSend(v6, "ic_refreshObject:mergeChanges:", v15, 1);

    uint64_t v16 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.5(v11);
    }

    uint64_t v17 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:].cold.4(v11);
    }

    uint64_t v18 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:](v11);
    }

    long long v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:](v11);
    }

    long long v20 = [v11 textDataDecryptedIfNecessary];
    long long v21 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[ICNote(Management) refreshAllOfNoteWithIdentifier:context:](v20);
    }

    uint64_t v22 = [v11 mergeWithNoteData:v20];
    [v11 setNeedsRefresh:0];
    if (v22 == 2)
    {
      long long v23 = +[ICNoteContext sharedContext];
      [v23 save];
    }
  }

  return v11;
}

+ (ICNote)noteWithUUID:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [a3 UUIDString];
  uint64_t v8 = [a1 noteWithIdentifier:v7 context:v6];

  return (ICNote *)v8;
}

+ (ICNote)noteWithIdentifier:(id)a3 context:(id)a4
{
  return (ICNote *)[a1 noteWithIdentifier:a3 includeDeleted:1 context:a4];
}

+ (ICNote)noteWithIdentifier:(id)a3 accountID:(id)a4 context:(id)a5
{
  return (ICNote *)[a1 noteWithIdentifier:a3 includeDeleted:1 accountID:a4 context:a5];
}

+ (id)visibleNoteWithIdentifier:(id)a3 context:(id)a4
{
  return (id)[a1 noteWithIdentifier:a3 includeDeleted:0 context:a4];
}

+ (ICNote)noteWithLegacyManagedObjectID:(id)a3 context:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [a3 URIRepresentation];
  uint64_t v9 = [v8 absoluteString];
  uint64_t v10 = [v6 predicateWithFormat:@"%K == %@", @"legacyManagedObjectIDURIRepresentation", v9];

  uint64_t v11 = [a1 notesMatchingPredicate:v10 context:v7];

  uint64_t v12 = [v11 firstObject];

  return (ICNote *)v12;
}

+ (id)allNotesInContext:(id)a3
{
  return (id)[a1 notesMatchingPredicate:0 context:a3];
}

+ (unint64_t)countOfAllNotesInContext:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[a1 newFetchRequestForNotes];
  uint64_t v6 = [v4 countForFetchRequest:v5 error:0];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }

  return v7;
}

+ (id)visibleNotesInContext:(id)a3
{
  id v4 = a3;
  int v5 = [a1 predicateForVisibleNotesInContext:v4];
  uint64_t v6 = [a1 notesMatchingPredicate:v5 context:v4];

  return v6;
}

+ (unint64_t)countOfVisibleNotesInContext:(id)a3
{
  id v4 = a3;
  int v5 = [a1 predicateForVisibleNotesInContext:v4];
  unint64_t v6 = [a1 countOfNotesMatchingPredicate:v5 context:v4];

  return v6;
}

+ (void)enumerateNotesInContext:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 usingBlock:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v15 = a3;
  id v12 = a7;
  if (v9)
  {
    int v13 = [a1 predicateForVisibleNotesInContext:v15];
  }
  else
  {
    int v13 = 0;
  }
  int v14 = [MEMORY[0x1E4F83790] sortDescriptorsForCurrentTypeIncludingPinnedNotes:1];
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v13, v14, 0, v15, a4, v8, v12);
}

+ (id)noteIdentifiersMatchingPredicate:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = (void *)MEMORY[0x1C877DB80]();
  BOOL v8 = +[ICNote fetchRequest];
  [v8 setPredicate:v5];
  [v8 setResultType:2];
  [v8 setPropertiesToFetch:&unk_1F1F62BC8];
  id v14 = 0;
  BOOL v9 = [v6 executeFetchRequest:v8 error:&v14];
  id v10 = v14;
  if (v10)
  {
    uint64_t v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICNote(Management) noteIdentifiersMatchingPredicate:context:]();
    }
    goto LABEL_4;
  }
  uint64_t v11 = [v9 valueForKey:@"identifier"];
  if (!v11)
  {
LABEL_4:
    id v12 = 0;
    goto LABEL_7;
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
LABEL_7:

  return v12;
}

+ (BOOL)notes:(id)a3 containSharedNotesNotSharedViaFolder:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__ICNote_Management__notes_containSharedNotesNotSharedViaFolder___block_invoke;
  v8[3] = &unk_1E64A4DA8;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "ic_containsObjectPassingTest:", v8);

  return (char)a3;
}

uint64_t __65__ICNote_Management__notes_containSharedNotesNotSharedViaFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 isSharedRootObject];
  id v5 = [v3 folder];
  int v6 = [v5 isSharedViaICloud];

  if (v6 && [*(id *)(a1 + 32) isSharedViaICloud])
  {
    unint64_t v7 = +[ICFolder rootSharingFolderForNote:v3];
    BOOL v8 = [v7 identifier];
    id v9 = [*(id *)(a1 + 32) identifier];
    if ([v8 isEqualToString:v9]) {
      int v10 = 1;
    }
    else {
      int v10 = [*(id *)(a1 + 32) isDescendantOfFolder:v7];
    }
  }
  else
  {
    int v10 = 0;
  }
  if (v4) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v6 & (v10 ^ 1u);
  }

  return v11;
}

+ (id)notesContainingHashtagWithStandarizedContent:(id)a3 context:(id)a4
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = +[ICInlineAttachment predicateForTypeUTI:@"com.apple.notes.inlinetextattachment.hashtag"];
  uint64_t v8 = +[ICInlineAttachment predicateForTokenContentIdentifier:v5];
  uint64_t v9 = +[ICBaseAttachment predicateForVisibleAttachmentsInContext:v6];
  int v10 = (void *)MEMORY[0x1E4F28BA0];
  v46[0] = v7;
  v46[1] = v8;
  uint64_t v32 = (void *)v9;
  uint64_t v33 = (void *)v8;
  v46[2] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  id v12 = [v10 andPredicateWithSubpredicates:v11];

  int v13 = +[ICInlineAttachment fetchRequest];
  [v13 setPredicate:v12];
  [v13 setResultType:2];
  [v13 setPropertiesToFetch:&unk_1F1F62BE0];
  id v38 = 0;
  id v14 = [v6 executeFetchRequest:v13 error:&v38];
  id v15 = v38;
  uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
  if (v15)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICNote(Management) notesContainingHashtagWithStandarizedContent:context:]", 1, 0, @"Failed to fetch objects for predicate=%@: %@", v12, v15 functionName simulateCrash showAlert format];
  }
  else if (v14)
  {
    uint64_t v29 = v7;
    id v30 = v6;
    id v31 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v28 = v14;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = [*(id *)(*((void *)&v34 + 1) + 8 * i) objectForKeyedSubscript:@"note"];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v19);
    }

    id v6 = v30;
    id v5 = v31;
    id v14 = v28;
    unint64_t v7 = v29;
  }
  else
  {
    long long v23 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      long long v24 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v41 = v24;
      __int16 v42 = 2112;
      v43 = v12;
      __int16 v44 = 2112;
      id v45 = v6;
      id v25 = v24;
      _os_log_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_INFO, "Nil objects array fetching %@ (predicate=%@ context=%@)", buf, 0x20u);
    }
  }
  long long v26 = (void *)[v16 copy];

  return v26;
}

+ (id)systemPaperNotesFetchRequest
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a1 newFetchRequestForNotes];
  char v4 = [a1 predicateForSystemPaperNotesNotInTrash];
  [v3 setPredicate:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"modificationDate" ascending:0];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v3 setSortDescriptors:v6];

  return v3;
}

+ (id)predicateForNote:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"self == %@", a3];
}

+ (id)predicateForVisibleNotesInContext:(id)a3
{
  return (id)[a1 predicateForVisibleNotesIncludingTrash:0 includingSystemPaper:1 includingMathNotes:1 includingCallNotes:1 inContext:a3];
}

+ (id)predicateForSearchableNotesInContext:(id)a3
{
  return (id)[a1 predicateForVisibleNotesIncludingTrash:1 includingSystemPaper:1 includingMathNotes:1 includingCallNotes:1 inContext:a3];
}

+ (id)predicateForNotesWithChecklists
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"hasChecklist == YES"];
}

+ (id)predicateForSystemPaperNotes
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"isSystemPaper == YES"];
}

+ (id)predicateForSystemPaperNotesNotInTrash
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"folder.folderType != %d", 1);
  char v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"markedForDeletion == NO"];
  id v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = [a1 predicateForSystemPaperNotes];
  v10[0] = v6;
  v10[1] = v3;
  void v10[2] = v4;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  uint64_t v8 = [v5 andPredicateWithSubpredicates:v7];

  return v8;
}

+ (id)predicateForNotesInAccountWithIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"account.identifier == %@", a3];
}

- (NSURL)paperCoherenceContextURL
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  char v4 = [v3 bundleIdentifier];
  id v5 = ICEditorExtensionBundleIdentifier();
  char v6 = [v4 isEqual:v5];

  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  unint64_t v7 = [(ICNote *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __46__ICNote_Management__paperCoherenceContextURL__block_invoke;
  v10[3] = &unk_1E64A4DD0;
  char v11 = v6;
  void v10[4] = self;
  void v10[5] = &v12;
  [v7 performBlockAndWait:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (NSURL *)v8;
}

void __46__ICNote_Management__paperCoherenceContextURL__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) identifier];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) account];
    if (v3
      || ([*(id *)(a1 + 32) folder],
          char v4 = objc_claimAutoreleasedReturnValue(),
          [v4 account],
          id v3 = objc_claimAutoreleasedReturnValue(),
          v4,
          v3))
    {
      if (*(unsigned char *)(a1 + 48))
      {
        id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v6 = [v5 URLsForDirectory:9 inDomains:1];
        uint64_t v7 = [v6 firstObject];
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) URLByAppendingPathComponent:*MEMORY[0x1E4F83650] isDirectory:1];
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        int v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v14 = [v3 identifier];
        uint64_t v15 = [v13 URLByAppendingPathComponent:v14 isDirectory:1];
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
      else
      {
        uint64_t v18 = [v3 accountFilesDirectoryURLInApplicationDataContainer];
        uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;
      }

      uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) URLByAppendingPathComponent:@"CoherenceContexts" isDirectory:1];
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      long long v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      long long v24 = [*(id *)(a1 + 32) identifier];
      uint64_t v25 = [v23 URLByAppendingPathComponent:v24 isDirectory:0];
      uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }
    else
    {
      id v3 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v3 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_1();
    }
  }
}

- (id)primaryEncryptedData
{
  char v2 = [(ICNote *)self noteData];
  id v3 = [v2 primitiveData];

  return v3;
}

- (void)setPrimaryEncryptedData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNote *)self noteData];
  [v5 setData:v4];
}

- (id)primaryEncryptedDataFromRecord:(id)a3
{
  return (id)objc_msgSend(a3, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"TextData");
}

+ (id)snippetForPasswordProtectedNote:(id)a3
{
  id v3 = a3;
  if (([v3 isPasswordProtected] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"note.isPasswordProtected" functionName:"+[ICNote(Management) snippetForPasswordProtectedNote:]" simulateCrash:1 showAlert:0 format:@"Trying to get a password snippet for a non password protected note"];
  }
  if ([v3 isAuthenticated])
  {
    id v4 = @"NOTE_SNIPPET_UNLOCKED";
    id v5 = @"Unlocked";
  }
  else
  {
    id v4 = @"NOTE_SNIPPET_LOCKED";
    id v5 = @"Locked";
  }
  char v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v4 value:v5 table:0 allowSiri:1];

  return v6;
}

+ (id)allPasswordProtectedNoteIdentifiersInContext:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudSyncingObject predicateForPasswordProtectedObjects];
  char v6 = [a1 noteIdentifiersMatchingPredicate:v5 context:v4];

  return v6;
}

+ (unint64_t)countOfPasswordProtectedNotesInContext:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudSyncingObject predicateForPasswordProtectedObjects];
  unint64_t v6 = [a1 countOfNotesMatchingPredicate:v5 context:v4];

  return v6;
}

+ (unint64_t)countOfVisiblePasswordProtectedNotesInAccount:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  uint64_t v7 = [v5 predicateWithFormat:@"account == %@ && isPasswordProtected == YES", v6];
  v15[0] = v7;
  uint64_t v8 = [v6 managedObjectContext];
  uint64_t v9 = [a1 predicateForVisibleNotesInContext:v8];
  v15[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v11 = [v4 andPredicateWithSubpredicates:v10];

  uint64_t v12 = [v6 managedObjectContext];

  unint64_t v13 = [a1 countOfNotesMatchingPredicate:v11 context:v12];
  return v13;
}

+ (id)passwordProtectedNoteIdentifiersForAccount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  id v6 = [v4 predicateWithFormat:@"account == %@ && isPasswordProtected == YES", v5];
  uint64_t v7 = [v5 managedObjectContext];

  uint64_t v8 = [a1 noteIdentifiersMatchingPredicate:v6 context:v7];

  return v8;
}

+ (id)accountIdentifiersOfNotes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        uint64_t v10 = ICDynamicCast();
        uint64_t v11 = v10;
        if (v10)
        {
          uint64_t v12 = objc_msgSend(v10, "account", v16);
          unint64_t v13 = [v12 identifier];
          objc_msgSend(v4, "ic_addNonNilObject:", v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v14 = (void *)[v4 copy];
  return v14;
}

- (id)childCloudObjectsForMinimumSupportedVersionPropagation
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(ICNote *)self attachments];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(ICNote *)self inlineAttachments];
  uint64_t v7 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v6, "count") + v5);

  uint64_t v8 = [(ICNote *)self attachments];
  uint64_t v9 = [v8 allObjects];
  uint64_t v10 = objc_msgSend(v9, "ic_objectsPassingTest:", &__block_literal_global_1038);
  [v7 addObjectsFromArray:v10];

  uint64_t v11 = [(ICNote *)self inlineAttachments];
  uint64_t v12 = [v11 allObjects];
  [v7 addObjectsFromArray:v12];

  unint64_t v13 = (void *)[v7 copy];
  return v13;
}

BOOL __76__ICNote_Management__childCloudObjectsForMinimumSupportedVersionPropagation__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 parentAttachment];
  BOOL v3 = v2 == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingCanBeSharedViaICloud
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICNote;
  char v2 = objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingCanBeSharedViaICloud);
  BOOL v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"folder.folderType"];
  return v3;
}

- (BOOL)canBeSharedViaICloud
{
  if (![(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    BOOL v3 = [(ICNote *)self folder];
    int v4 = [v3 folderType];

    if (v4 == 1) {
      return 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  return [(ICCloudSyncingObject *)&v6 canBeSharedViaICloud];
}

- (BOOL)canBeRootShareObject
{
  return 1;
}

- (id)shareType
{
  return @"com.apple.notes.note";
}

- (BOOL)needsToDeleteShare
{
  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  if ([(ICCloudSyncingObject *)&v8 needsToDeleteShare])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v3 = [(ICCloudSyncingObject *)self serverShare];
    if (v3)
    {
      int v4 = (void *)v3;
      objc_super v5 = [(ICNote *)self folder];
      int v6 = [v5 isTrashFolder];

      if (v6) {
        LOBYTE(v3) = [(ICCloudSyncingObject *)self shareMatchesRecord];
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (void)didAcceptShare:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)ICNote;
  [(ICCloudSyncingObject *)&v17 didAcceptShare:a3];
  int v4 = [(ICNote *)self folder];
  int v5 = [v4 isTrashFolder];

  if (v5)
  {
    int v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      objc_super v8 = [(ICNote *)self account];
      uint64_t v9 = [v8 defaultFolder];
      uint64_t v10 = [v9 identifier];
      uint64_t v11 = [(ICNote *)self account];
      uint64_t v12 = [v11 identifier];
      *(_DWORD *)buf = 138412802;
      long long v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      long long v23 = v12;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "Moving shared note %@ out of the trash to folder %@ in account %@", buf, 0x20u);
    }
    unint64_t v13 = [(ICNote *)self account];
    uint64_t v14 = [v13 defaultFolder];
    [(ICNote *)self setFolder:v14];

    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [(ICNote *)self setFolderModificationDate:v15];

    long long v16 = [MEMORY[0x1E4F1C9C8] date];
    [(ICNote *)self setModificationDate:v16];

    [(ICNote *)self updateChangeCountWithReason:@"Accepted share"];
  }
}

- (unint64_t)textOffsetAtSearchIndex:(unint64_t)a3 inSearchableString:(id)a4
{
  id v5 = a4;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  unint64_t v6 = [v5 length];
  if (v6 >= a3) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = v6;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __65__ICNote_Management__textOffsetAtSearchIndex_inSearchableString___block_invoke;
  v10[3] = &unk_1E64A4E18;
  void v10[4] = &v11;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", @"ICAttachmentSearchable", 0, v7, 0, v10);
  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __65__ICNote_Management__textOffsetAtSearchIndex_inSearchableString___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4
  }
                                                                    + *(void *)(*(void *)(*(void *)(result + 32)
                                                                                            + 8)
                                                                                + 24)
                                                                    - 1;
  return result;
}

- (_NSRange)textRangeForSearchRange:(_NSRange)a3 inSearchableString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger v5 = a3.location
     - [(ICNote *)self textOffsetAtSearchIndex:a3.location inSearchableString:a4];
  NSUInteger v6 = length;
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (id)addAttachmentWithIdentifier:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  NSUInteger v6 = [v4 distantPast];
  id v7 = +[ICBaseAttachment newAttachmentWithIdentifier:v5 note:self];

  [v7 setCreationDate:v6];
  [v7 setModificationDate:v6];
  [(ICNote *)self addAttachmentsObject:v7];
  if ([(ICNote *)self isPasswordProtected])
  {
    [v7 setIsPasswordProtected:1];
    [v7 initializeCryptoProperties];
  }

  return v7;
}

- (id)addAttachmentWithData:(id)a3 filename:(id)a4
{
  NSUInteger v6 = (void *)MEMORY[0x1E4F442D8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 pathExtension];
  uint64_t v10 = [v6 typeWithFilenameExtension:v9];
  uint64_t v11 = [v10 identifier];

  uint64_t v12 = [(ICNote *)self addAttachmentWithUTI:v11 data:v8 filename:v7];

  return v12;
}

- (id)addAttachmentWithFileURL:(id)a3
{
  return [(ICNote *)self addAttachmentWithFileURL:a3 updateFileBasedAttributes:1 analytics:1];
}

- (id)addAttachmentWithFileURL:(id)a3 updateFileBasedAttributes:(BOOL)a4 analytics:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v25 = 0;
  uint64_t v9 = *MEMORY[0x1E4F1C628];
  id v24 = 0;
  int v10 = [v8 getResourceValue:&v25 forKey:v9 error:&v24];
  id v11 = v25;
  id v12 = v24;
  if (v10)
  {
    char v13 = [v11 BOOLValue];
    uint64_t v14 = [(id)*MEMORY[0x1E4F44378] identifier];
    if (v13)
    {
      uint64_t v15 = [(id)*MEMORY[0x1E4F443C8] identifier];

      uint64_t v14 = v15;
    }
    long long v16 = [v8 pathExtension];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      long long v18 = (void *)MEMORY[0x1E4F442D8];
      long long v19 = [v8 pathExtension];
      if (v13) {
        [v18 typeWithFilenameExtension:v19 conformingToType:*MEMORY[0x1E4F44390]];
      }
      else {
      uint64_t v21 = [v18 typeWithFilenameExtension:v19];
      }
      uint64_t v22 = [v21 identifier];

      uint64_t v14 = v22;
    }
    __int16 v20 = [(ICNote *)self addAttachmentWithUTI:v14 withURL:v8 updateFileBasedAttributes:v6 analytics:v5];
  }
  else
  {
    uint64_t v14 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICNote(AttachmentManagement) addAttachmentWithFileURL:updateFileBasedAttributes:analytics:]();
    }
    __int16 v20 = 0;
  }

  return v20;
}

- (id)addAttachmentWithFileWrapper:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isDirectory];
  BOOL v6 = [(id)*MEMORY[0x1E4F44378] identifier];
  if (v5)
  {
    uint64_t v7 = [(id)*MEMORY[0x1E4F443C8] identifier];

    BOOL v6 = (void *)v7;
  }
  id v8 = +[ICNoteContext filenameFromFileWrapper:v4];
  uint64_t v9 = [v8 pathExtension];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F442D8];
    id v12 = [v8 pathExtension];
    if (v5) {
      [v11 typeWithFilenameExtension:v12 conformingToType:*MEMORY[0x1E4F44390]];
    }
    else {
    char v13 = [v11 typeWithFilenameExtension:v12];
    }
    uint64_t v14 = [v13 identifier];

    BOOL v6 = (void *)v14;
  }
  uint64_t v15 = [(ICNote *)self addAttachmentWithUTI:v6];
  long long v16 = [v8 lastPathComponent];
  [v15 setTitle:v16];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke;
  v19[3] = &unk_1E64A4E68;
  id v20 = v4;
  id v17 = v4;
  [(ICNote *)self addMediaToAttachment:v15 withBlock:v19];

  return v15;
}

void __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)[v3 addMediaWithFileWrapper:*(void *)(a1 + 32)];
  int v5 = [v3 audioModel];

  if (v5)
  {
    BOOL v6 = [v3 audioModel];
    [v6 transformNewlyAddedMediaAttachment];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke_2;
  v8[3] = &unk_1E64A4E40;
  id v9 = v3;
  id v7 = v3;
  [v7 updatePlaceInLocationIfNeededHandler:v8];
}

void __61__ICNote_AttachmentManagement__addAttachmentWithFileWrapper___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(a1 + 32) managedObjectContext];
    objc_msgSend(v2, "ic_save");
  }
}

- (id)addAttachmentWithRemoteFileURL:(id)a3
{
  id v4 = a3;
  int v5 = [v4 pathExtension];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F442D8];
    id v7 = [v4 pathExtension];
    id v8 = [v6 typeWithFilenameExtension:v7];
    id v9 = [v8 identifier];
  }
  else
  {
    id v9 = [(id)*MEMORY[0x1E4F44378] identifier];
  }

  uint64_t v10 = [(ICNote *)self addAttachmentWithUTI:v9];
  id v11 = [v4 lastPathComponent];
  [v10 setTitle:v11];

  [v10 setRemoteFileURL:v4];
  return v10;
}

- (id)addAttachmentWithUTI:(id)a3
{
  return [(ICNote *)self addAttachmentWithUTI:a3 identifier:0 urlString:0 analytics:1];
}

- (id)addAttachmentWithUTI:(id)a3 identifier:(id)a4 urlString:(id)a5 analytics:(BOOL)a6
{
  return [(ICNote *)self addAttachmentWithUTI:a3 identifier:a4 urlString:a5 analytics:a6 regulatoryLogging:1];
}

- (id)addAttachmentWithUTI:(id)a3 identifier:(id)a4 urlString:(id)a5 analytics:(BOOL)a6 regulatoryLogging:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v13)
  {
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"ICWillAddAttachmentForNoteNotification" object:self];

    long long v16 = [(ICNote *)self addAttachmentWithIdentifier:v13];
    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"ICDidAddAttachmentForNoteNotification" object:self];
  }
  else
  {
    long long v16 = [(ICNote *)self addAttachment];
  }
  [v16 setTypeUTI:v12];
  long long v18 = [MEMORY[0x1E4F1C9C8] date];
  [v16 setCreationDate:v18];

  long long v19 = [MEMORY[0x1E4F1C9C8] date];
  [v16 setModificationDate:v19];

  id v20 = [(id)*MEMORY[0x1E4F444F8] identifier];
  int v21 = [v12 isEqualToString:v20];

  if (v21)
  {
    [v16 setUrlString:v14];
    if (v14) {
      goto LABEL_10;
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F836F8];
    long long v23 = "urlString != ((void *)0)";
    id v24 = @"Expected a valid URL for a URL attachment. Call addURLAttachmentWithURL:";
  }
  else
  {
    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F836F8];
    long long v23 = "urlString == ((void *)0)";
    id v24 = @"Expected no URL for a non-URL attachment.";
  }
  [v22 handleFailedAssertWithCondition:v23 functionName:"-[ICNote(AttachmentManagement) addAttachmentWithUTI:identifier:urlString:analytics:regulatoryLogging:]" simulateCrash:1 showAlert:0 format:v24];
LABEL_10:
  if (v8)
  {
    id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v32 = @"ICNoteAnalyticsAddAttachmentNotificationAttachmentKey";
    v33[0] = v16;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    [v25 postNotificationName:@"ICNoteAnalyticsAddAttachmentNotification" object:0 userInfo:v26];
  }
  if (v7)
  {
    long long v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v30 = @"ICRegulatoryLoggerAttachmentKey";
    id v31 = v16;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v27 postNotificationName:@"ICRegulatoryLoggerAttachmentAddedNotification" object:0 userInfo:v28];
  }
  return v16;
}

- (id)addAttachmentWithUTI:(id)a3 withURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v7, "ic_isURLAnInternetLocator")
    && (objc_msgSend(MEMORY[0x1E4F1CB10], "ic_urlFromWeblocFileAtURL:", v7),
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    uint64_t v10 = [(ICNote *)self addURLAttachmentWithURL:v8];
  }
  else
  {
    uint64_t v10 = [(ICNote *)self addAttachmentWithUTI:v6 withURL:v7 updateFileBasedAttributes:1 analytics:1];
  }

  return v10;
}

- (id)addAttachmentWithUTI:(id)a3 withURL:(id)a4 updateFileBasedAttributes:(BOOL)a5 analytics:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = [(ICNote *)self addAttachmentWithUTI:a3 identifier:0 urlString:0 analytics:v6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke;
  v14[3] = &unk_1E64A4E90;
  id v15 = v10;
  BOOL v16 = a5;
  id v12 = v10;
  [(ICNote *)self addMediaToAttachment:v11 withBlock:v14];

  return v11;
}

void __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)[v3 addMediaWithURL:*(void *)(a1 + 32) updateFileBasedAttributes:*(unsigned __int8 *)(a1 + 40)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke_2;
  v6[3] = &unk_1E64A4E40;
  id v7 = v3;
  id v5 = v3;
  [v5 updatePlaceInLocationIfNeededHandler:v6];
}

void __97__ICNote_AttachmentManagement__addAttachmentWithUTI_withURL_updateFileBasedAttributes_analytics___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(a1 + 32) managedObjectContext];
    objc_msgSend(v2, "ic_save");
  }
}

- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filenameExtension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICNote *)self title];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    id v13 = [(ICNote *)self title];
    id v14 = objc_msgSend(v13, "ic_sanitizedFilenameString");

    if ([v14 length])
    {
      if (![v10 length])
      {
        uint64_t v15 = +[ICAttachment filenameExtensionForUTI:v8];

        id v10 = (id)v15;
      }
      if ([v10 length])
      {
        uint64_t v16 = [v14 stringByAppendingPathExtension:v10];

        id v14 = (void *)v16;
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  if (![v14 length])
  {
    uint64_t v17 = +[ICAttachment filenameFromUTI:v8];

    id v14 = (void *)v17;
  }
  long long v18 = [(ICNote *)self addAttachmentWithUTI:v8 data:v9 filename:v14];

  return v18;
}

- (id)addURLAttachmentWithURL:(id)a3
{
  id v4 = (void *)*MEMORY[0x1E4F444F8];
  id v5 = a3;
  BOOL v6 = [v4 identifier];
  id v7 = [v5 absoluteString];

  id v8 = [(ICNote *)self addAttachmentWithUTI:v6 identifier:0 urlString:v7 analytics:1];

  id v9 = [v8 modificationDate];

  if (v9)
  {
    id v10 = [(ICCloudSyncingObject *)self modificationDate];
    id v11 = [v8 modificationDate];
    uint64_t v12 = [v10 compare:v11];

    if (v12 == -1)
    {
      id v13 = [v8 modificationDate];
      [(ICNote *)self setModificationDate:v13];
    }
  }
  return v8;
}

- (id)addSynapseLinkAttachmentWithContentItem:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__4;
  int v21 = __Block_byref_object_dispose__4;
  id v22 = 0;
  id v5 = [(ICNote *)self managedObjectContext];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke;
  id v13 = &unk_1E64A4ED8;
  uint64_t v16 = &v17;
  id v14 = self;
  id v6 = v4;
  id v15 = v6;
  [v5 performBlockAndWait:&v10];

  id v7 = (void *)v18[5];
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((attachment) != nil)", "-[ICNote(AttachmentManagement) addSynapseLinkAttachmentWithContentItem:]", 1, 0, @"Expected non-nil value for '%s'", "attachment", v10, v11, v12, v13, v14);
    id v7 = (void *)v18[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [(id)*MEMORY[0x1E4F444F8] identifier];
  id v4 = [*(id *)(a1 + 40) itemURL];
  id v5 = [v4 absoluteString];
  uint64_t v6 = [v2 addAttachmentWithUTI:v3 identifier:0 urlString:v5 analytics:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) updatePlaceInLocationIfNeededHandler:&__block_literal_global_1137];
  id v9 = *(void **)(a1 + 40);
  id v18 = 0;
  uint64_t v10 = [v9 dataRepresentationWithError:&v18];
  id v11 = v18;
  if (v11)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICNote(AttachmentManagement) addSynapseLinkAttachmentWithContentItem:]_block_invoke", 1, 0, @"Couldn't serialize SYContentItem to NSData. Error: %@", v11 functionName simulateCrash showAlert format];
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 40) linkPreviewMetadata];

    if (!v12) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) loadLinkPreviewForSynapseItem:*(void *)(a1 + 40)];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSynapseData:v10];
  }
  id v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) modificationDate];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 32) modificationDate];
    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) modificationDate];
    uint64_t v16 = [v14 compare:v15];

    if (v16 == -1)
    {
      uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) modificationDate];
      [*(id *)(a1 + 32) setModificationDate:v17];
    }
  }
}

void __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (v4 && (a2 & 1) == 0)
  {
    id v5 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke_2_cold_1();
    }
  }
}

- (id)addGalleryAttachmentWithIdentifier:(id)a3
{
  id v3 = [(ICNote *)self addAttachmentWithUTI:@"com.apple.notes.gallery" identifier:a3 urlString:0 analytics:1];
  id v4 = +[ICAttachment defaultTitleForAttachmentType:11];
  [v3 setTitle:v4];

  return v3;
}

- (id)addTableAttachment
{
  id v3 = [ICTableVersionedDocument alloc];
  id v4 = [(ICCloudSyncingObject *)self currentReplicaID];
  id v5 = [(ICTableVersionedDocument *)v3 initWithColumnCount:2 rowCount:2 replicaID:v4];

  uint64_t v6 = [(ICTTVersionedDocument *)v5 serialize];
  uint64_t v7 = [(ICNote *)self addTableAttachmentWithTableData:v6];

  return v7;
}

- (id)addAudioAttachmentWithIdentifier:(id)a3
{
  id v14 = a3;
  id v4 = [(ICNote *)self visibleTopLevelAttachments];
  id v5 = objc_msgSend(v4, "ic_compactMap:", &__block_literal_global_1150);

  id v6 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Recording" value:@"New Recording" table:0 allowSiri:1];
  uint64_t v7 = v6;
  if ([v5 containsObject:v6])
  {
    uint64_t v8 = 2;
    id v9 = v6;
    do
    {
      uint64_t v10 = NSString;
      id v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Recording %ld" value:@"New Recording %ld" table:0 allowSiri:1];
      uint64_t v7 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v8);

      ++v8;
      id v9 = v7;
    }
    while (([v5 containsObject:v7] & 1) != 0);
  }
  uint64_t v12 = [(ICNote *)self addAttachmentWithUTI:*MEMORY[0x1E4F15A78] identifier:v14 urlString:0 analytics:1 regulatoryLogging:0];
  [v12 setTitle:v7];

  return v12;
}

id __65__ICNote_AttachmentManagement__addAudioAttachmentWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 attachmentType] == 4)
  {
    id v3 = [v2 title];
    if ([v3 length])
    {
      id v4 = [v2 title];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)addSystemPaperAttachmentWithIdentifier:(id)a3
{
  return [(ICNote *)self addAttachmentWithUTI:@"com.apple.paper" identifier:a3 urlString:0 analytics:1];
}

- (id)addPaperDocumentAttachmentWithIdentifier:(id)a3 subtype:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = @"com.apple.paper.doc.pdf";
  v15[1] = @"com.apple.paper.doc.scan";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v10 = [v8 setWithArray:v9];

  if (([v10 containsObject:v7] & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[allowedSubtypes containsObject:subtype]", "-[ICNote(AttachmentManagement) addPaperDocumentAttachmentWithIdentifier:subtype:]", 1, 0, @"unexpected subtype: %@ is not one of %@; assuming PDF",
  }
      v7,
      v10);
  if (([v10 containsObject:v7] & 1) == 0)
  {
    id v11 = @"com.apple.paper.doc.pdf";

    uint64_t v7 = v11;
  }
  if ((ICInternalSettingsIsPDFsInNotesEnabled() & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"ICInternalSettingsIsPDFsInNotesEnabled()" functionName:"-[ICNote(AttachmentManagement) addPaperDocumentAttachmentWithIdentifier:subtype:]" simulateCrash:1 showAlert:0 format:@"PDFsInNotes must be enabled"];
  }
  uint64_t v12 = [(ICNote *)self addAttachmentWithUTI:v7 identifier:v6 urlString:0 analytics:1];
  if ([(__CFString *)v7 isEqualToString:@"com.apple.paper.doc.scan"])
  {
    id v13 = +[ICAttachment defaultTitleForAttachmentType:15];
    [v12 setTitle:v13];
  }
  return v12;
}

- (id)addTableAttachmentWithText:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNote *)self managedObjectContext];
  id v6 = [(ICCloudSyncingObject *)self currentReplicaID];
  uint64_t v7 = +[ICAttachmentTableModel tableFromAttributedString:v4 managedObjectContext:v5 replicaID:v6];

  uint64_t v8 = [v7 table];
  unint64_t v9 = [v8 columnCount];

  if (v9 <= 1)
  {
    do
    {
      uint64_t v10 = [v7 table];
      id v11 = [v7 table];
      id v12 = (id)objc_msgSend(v10, "insertColumnAtIndex:", objc_msgSend(v11, "columnCount"));

      id v13 = [v7 table];
      unint64_t v14 = [v13 columnCount];
    }
    while (v14 < 2);
  }
  id v15 = [v7 serialize];
  uint64_t v16 = [(ICNote *)self addTableAttachmentWithTableData:v15];

  return v16;
}

- (id)addTableAttachmentWithTableData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNote *)self addAttachmentWithUTI:@"com.apple.notes.table"];
  [v5 updateDeviceReplicaIDsToCurrentNotesVersionIfNeeded];
  [v5 setMergeableData:v4];

  id v6 = [v5 managedObjectContext];
  objc_msgSend(v6, "ic_save");

  return v5;
}

- (id)addInlineDrawingAttachmentWithAnalytics:(BOOL)a3
{
  id v3 = [(ICNote *)self addAttachmentWithUTI:@"com.apple.drawing.2" identifier:0 urlString:0 analytics:a3];
  id v4 = +[ICAttachment defaultTitleForAttachmentType:10];
  [v3 setTitle:v4];

  return v3;
}

- (id)addAttachment
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ICWillAddAttachmentForNoteNotification" object:self];

  id v6 = [(ICNote *)self addAttachmentWithIdentifier:v4];
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICDidAddAttachmentForNoteNotification" object:self];

  return v6;
}

- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filename:(id)a5
{
  return [(ICNote *)self addAttachmentWithUTI:a3 data:a4 filename:a5 updateFileBasedAttributes:1 analytics:1 regulatoryLogging:1];
}

- (id)addAttachmentWithUTI:(id)a3 data:(id)a4 filename:(id)a5 updateFileBasedAttributes:(BOOL)a6 analytics:(BOOL)a7 regulatoryLogging:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = [(ICNote *)self addAttachmentWithUTI:a3 identifier:0 urlString:0 analytics:v9 regulatoryLogging:v8];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke;
  v20[3] = &unk_1E64A4F20;
  id v21 = v14;
  id v22 = v15;
  BOOL v23 = a6;
  id v17 = v15;
  id v18 = v14;
  [(ICNote *)self addMediaToAttachment:v16 withBlock:v20];

  return v16;
}

void __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)[v3 addMediaWithData:*(void *)(a1 + 32) filename:*(void *)(a1 + 40) updateFileBasedAttributes:*(unsigned __int8 *)(a1 + 48)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke_2;
  v6[3] = &unk_1E64A4E40;
  id v7 = v3;
  id v5 = v3;
  [v5 updatePlaceInLocationIfNeededHandler:v6];
}

void __121__ICNote_AttachmentManagement__addAttachmentWithUTI_data_filename_updateFileBasedAttributes_analytics_regulatoryLogging___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(a1 + 32) managedObjectContext];
    objc_msgSend(v2, "ic_save");
  }
}

- (void)addMediaToAttachment:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICNote *)self shouldAddMediaAsynchronously])
  {
    if (addMediaToAttachment_withBlock__onceToken != -1) {
      dispatch_once(&addMediaToAttachment_withBlock__onceToken, &__block_literal_global_1166);
    }
    BOOL v8 = [v6 shortLoggingDescription];
    BOOL v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICNote(AttachmentManagement) addMediaToAttachment:withBlock:]();
    }

    int v10 = [v6 isInserted];
    id v11 = objc_msgSend(v6, "ic_permanentObjectID");
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1169;
    aBlock[3] = &unk_1E64A4F48;
    id v12 = v8;
    id v28 = v12;
    uint64_t v29 = self;
    id v13 = v11;
    id v30 = v13;
    id v31 = v7;
    id v14 = _Block_copy(aBlock);
    if (v10)
    {
      id v15 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ICNote(AttachmentManagement) addMediaToAttachment:withBlock:]();
      }

      if (!self->_noteDidSaveBlocks)
      {
        uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
        noteDidSaveBlocks = self->_noteDidSaveBlocks;
        self->_noteDidSaveBlocks = v16;
      }
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      BOOL v23 = __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1171;
      id v24 = &unk_1E64A4F70;
      id v25 = v12;
      id v26 = v14;
      id v18 = _Block_copy(&v21);
      uint64_t v19 = self->_noteDidSaveBlocks;
      id v20 = _Block_copy(v18);
      -[NSMutableArray addObject:](v19, "addObject:", v20, v21, v22, v23, v24);
    }
    else
    {
      dispatch_async((dispatch_queue_t)addMediaToAttachment_withBlock__addMediaToAttachmentQueue, v14);
    }
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.notes.addMediaToAttachment", attr);
  id v2 = (void *)addMediaToAttachment_withBlock__addMediaToAttachmentQueue;
  addMediaToAttachment_withBlock__addMediaToAttachmentQueue = (uint64_t)v1;
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1169(id *a1)
{
  id v2 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1169_cold_2((uint64_t)a1, v2, v3);
  }

  id v4 = [a1[5] workerManagedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1170;
  v8[3] = &unk_1E64A4578;
  id v9 = a1[6];
  id v5 = v4;
  id v10 = v5;
  id v11 = a1[7];
  [v5 performBlockAndWait:v8];
  id v6 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1169_cold_1((uint64_t)a1, v6, v7);
  }
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1170(uint64_t a1)
{
  id v2 = +[ICAttachment ic_existingObjectWithID:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "ic_save");
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1171(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1171_cold_1(a1, v2, v3);
  }

  dispatch_async((dispatch_queue_t)addMediaToAttachment_withBlock__addMediaToAttachmentQueue, *(dispatch_block_t *)(a1 + 40));
}

- (id)addInlineAttachmentWithIdentifier:(id)a3
{
  id v4 = +[ICBaseAttachment newAttachmentWithIdentifier:a3 note:self];
  if ([(ICNote *)self isPasswordProtected])
  {
    [v4 setIsPasswordProtected:1];
    [v4 initializeCryptoProperties];
  }
  [(ICNote *)self addInlineAttachmentsObject:v4];
  return v4;
}

- (id)anyVisibleInstanceOfHashtag:(id)a3
{
  id v4 = +[ICHashtag standardizedHashtagRepresentationForDisplayText:a3];
  id v5 = [(ICNote *)self visibleInlineAttachments];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ICNote_AttachmentManagement__anyVisibleInstanceOfHashtag___block_invoke;
  v9[3] = &unk_1E64A4F98;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "ic_objectPassingTest:", v9);

  return v7;
}

uint64_t __60__ICNote_AttachmentManagement__anyVisibleInstanceOfHashtag___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 attachmentType];
  id v5 = [v3 tokenContentIdentifier];

  unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  if (v4 == 1) {
    return v6;
  }
  else {
    return 0;
  }
}

- (id)inlineAttachmentWithICTTAttachment:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 attachmentIdentifier];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(ICNote *)self inlineAttachments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      id v11 = [v10 identifier];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v14 = [(ICNote *)self managedObjectContext];
  id v13 = +[ICBaseAttachment attachmentWithIdentifier:v4 context:v14];

LABEL_12:
  return v13;
}

- (void)turnAttachmentsIntoFaults
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(ICNote *)self attachments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 isFault] & 1) == 0)
        {
          uint64_t v9 = [(ICNote *)self managedObjectContext];
          objc_msgSend(v9, "ic_refreshObject:mergeChanges:", v8, 0);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

+ (void)createNoteForAirDropDocument:(id)a3 legacyContext:(id)a4 processAttributedString:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  long long v11 = (uint64_t (**)(id, void *, id, void *, id))a5;
  long long v12 = (void (**)(id, id))a6;
  if (v9)
  {
    uint64_t v13 = [v9 document];
    uint64_t v14 = v13;
    if ((*(unsigned char *)(v13 + 32) & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"document.has_notedocument()" functionName:"+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]" simulateCrash:1 showAlert:0 format:@"AirDrop document does not have note document"];
      if ((*(unsigned char *)(v14 + 32) & 1) == 0) {
        goto LABEL_12;
      }
    }
    uint64_t v15 = *(void *)(v14 + 40);
    if (!v15)
    {
      uint64_t v13 = airdrop_document::Document::default_instance((airdrop_document::Document *)v13);
      uint64_t v15 = *(void *)(v13 + 40);
    }
    if ((*(unsigned char *)(v15 + 32) & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"noteDocument.has_version1_0()" functionName:"+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]" simulateCrash:1 showAlert:0 format:@"Failed to find any note document version"];
      if ((*(unsigned char *)(v15 + 32) & 1) == 0) {
        goto LABEL_12;
      }
    }
    uint64_t v16 = *(void *)(v15 + 40);
    if (!v16)
    {
      uint64_t v13 = airdrop_document::NoteDocument::default_instance((airdrop_document::NoteDocument *)v13);
      uint64_t v16 = *(void *)(v13 + 40);
    }
    if ((*(unsigned char *)(v16 + 32) & 1) != 0
      || (uint64_t v13 = [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"version1_0.has_attributedstring()" functionName:"+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]" simulateCrash:1 showAlert:0 format:@"No string found from version 1.0 data"], (*(unsigned char *)(v16 + 32) & 1) != 0))
    {
      uint64_t v18 = *(void *)(v16 + 40);
      if (!v18) {
        uint64_t v18 = *(void *)(airdrop_document::NoteDocument1_0::default_instance((airdrop_document::NoteDocument1_0 *)v13)
      }
                        + 40);
      long long v19 = *(uint64_t **)(v18 + 40);
      if (*((char *)v19 + 23) < 0)
      {
        long long v19 = (uint64_t *)*v19;
        uint64_t v20 = *(void *)(*(void *)(v18 + 40) + 8);
      }
      else
      {
        uint64_t v20 = *((unsigned __int8 *)v19 + 23);
      }
      id v31 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v19 length:v20 freeWhenDone:0];
      uint64_t v21 = +[ICNoteContext sharedContext];
      uint64_t v22 = [v21 managedObjectContext];
      BOOL v23 = +[ICFolder defaultFolderInContext:v22];

      if (v23)
      {
        id v17 = +[ICNote newEmptyNoteInFolder:v23];
      }
      else
      {
        id v24 = +[ICNoteContext sharedContext];
        id v25 = [v24 managedObjectContext];
        id v17 = +[ICNote newEmptyNoteInContext:v25];
      }
      if ((*(unsigned char *)(v16 + 32) & 2) != 0) {
        uint64_t v26 = *(void *)(v16 + 48);
      }
      else {
        uint64_t v26 = 0;
      }
      [v17 requireMinimumSupportedVersionAndPropagateToChildObjects:v26];
      id v32 = 0;
      long long v27 = objc_msgSend(MEMORY[0x1E4F28B18], "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:error:", v31, 0, v17, &v32);
      id v28 = v32;
      char v29 = v11[2](v11, v23, v17, v27, v28);

      if ((v29 & 1) == 0)
      {

        id v17 = 0;
      }

      if (v12 && v17)
      {
        [v17 updateChangeCountWithReason:@"Created note from AirDrop"];
        id v30 = [v17 managedObjectContext];
        objc_msgSend(v30, "ic_save");

        v12[2](v12, v17);
      }
    }
    else
    {
LABEL_12:
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"airDropDocument" functionName:"+[ICNote(AirDropDocument) createNoteForAirDropDocument:legacyContext:processAttributedString:completion:]" simulateCrash:1 showAlert:0 format:@"airDropDocument is nil"];
  }
}

- (id)newAirDropDocument
{
  if (![(ICNote *)self isSharable]) {
    return 0;
  }
  id v3 = [(ICNote *)self attributedString];
  uint64_t v4 = +[ICNoteContext sharedContext];
  uint64_t v5 = [v4 managedObjectContext];
  uint64_t v6 = objc_msgSend(v3, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 3, 0, v5, 0);

  if (v6)
  {
    uint64_t v7 = objc_alloc_init(ICAirDropDocument);
    uint64_t v8 = [(ICAirDropDocument *)v7 document];
    *(_DWORD *)(v8 + 32) |= 1u;
    uint64_t v9 = *(void *)(v8 + 40);
    if (!v9) {
      operator new();
    }
    *(_DWORD *)(v9 + 32) |= 1u;
    uint64_t v10 = *(void *)(v9 + 40);
    if (!v10) {
      operator new();
    }
    int64_t v11 = [(ICNote *)self intrinsicNotesVersionForScenario:1];
    int v12 = *(_DWORD *)(v10 + 32);
    if (v11)
    {
      v12 |= 2u;
      *(_DWORD *)(v10 + 32) = v12;
      *(void *)(v10 + 48) = v11;
    }
    *(_DWORD *)(v10 + 32) = v12 | 1;
    uint64_t v13 = *(void *)(v10 + 40);
    if (!v13) {
      operator new();
    }
    id v14 = v6;
    [v14 bytes];
    [v14 length];
    *(_DWORD *)(v13 + 32) |= 1u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*(void *)(v13 + 40) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)recordZoneName
{
  return @"Notes";
}

- (NSString)recordType
{
  if ([(ICNote *)self isPasswordProtected]) {
    id v2 = @"PasswordProtectedNote";
  }
  else {
    id v2 = @"Note";
  }
  return (NSString *)v2;
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)ICNote;
  id v8 = a3;
  [(ICCloudSyncingObject *)&v14 objectWasFetchedFromCloudWithRecord:v8 accountID:a4 force:v5];
  uint64_t v9 = objc_msgSend(v8, "recordID", v14.receiver, v14.super_class);

  uint64_t v10 = [v9 recordName];

  int64_t v11 = [(ICCloudSyncingObject *)self recordID];
  int v12 = [v11 recordName];

  if (([v10 isEqualToString:v12] & 1) == 0)
  {
    uint64_t v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEFAULT, "Duplicated note (%@) to (%@), clearing server record again", buf, 0x16u);
    }

    [(ICCloudSyncingObject *)self clearServerRecords];
    [(ICCloudSyncingObject *)self setInCloud:0];
  }
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  int64_t v13 = [(ICNote *)self mergePolicyForRecord:v12];
  objc_super v14 = [(ICNote *)self managedObjectContext];
  uint64_t v15 = +[ICAccount cloudKitAccountWithIdentifier:v11 context:v14];

  LOBYTE(a5) = [(ICNote *)self mergeCloudKitRecord:v12 mergePolicy:v13 account:v15 approach:a5 mergeableFieldState:v10];
  return a5;
}

- (BOOL)mergeCloudKitRecord:(id)a3 account:(id)a4 approach:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  LOBYTE(a5) = [(ICNote *)self mergeCloudKitRecord:v9 mergePolicy:[(ICNote *)self mergePolicyForRecord:v9] account:v8 approach:a5 mergeableFieldState:0];

  return a5;
}

- (BOOL)mergeCloudKitRecord:(id)a3 mergePolicy:(int64_t)a4 account:(id)a5 approach:(int64_t)a6 mergeableFieldState:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (a4 != 3)
  {
    uint64_t v15 = [v13 identifier];
    v96.receiver = self;
    v96.super_class = (Class)ICNote;
    unsigned int v16 = [(ICCloudSyncingObject *)&v96 mergeCloudKitRecord:v12 accountID:v15 approach:a6 mergeableFieldState:v14];

    if (!v16) {
      goto LABEL_31;
    }
    __int16 v17 = [v12 recordID];
    uint64_t v18 = [v17 recordName];
    [(ICNote *)self setIdentifier:v18];

    uint64_t v19 = [v12 objectForKeyedSubscript:@"CreationDate"];
    uint64_t v20 = [(ICCloudSyncingObject *)self creationDate];
    id v95 = v14;
    if (!v20) {
      goto LABEL_9;
    }
    uint64_t v21 = (void *)v20;
    id v93 = v13;
    uint64_t v22 = [(ICCloudSyncingObject *)self creationDate];
    BOOL v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    if (([v22 isEqual:v23] & 1) == 0)
    {
      uint64_t v91 = v19;
      id v24 = [(ICCloudSyncingObject *)self creationDate];
      id v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
      if (([v24 isEqual:v25] & 1) == 0)
      {
        [(ICCloudSyncingObject *)self creationDate];
        char v54 = v88 = v24;
        id v55 = [MEMORY[0x1E4F1C9C8] distantPast];
        char v90 = [v54 isEqual:v55];

        id v13 = v93;
        id v14 = v95;
        uint64_t v19 = v91;
        if ((v90 & 1) == 0)
        {
          id v56 = [(ICCloudSyncingObject *)self creationDate];
          uint64_t v57 = [v91 earlierDate:v56];
          [(ICNote *)self setCreationDate:v57];

LABEL_10:
          uint64_t v26 = [v12 objectForKeyedSubscript:@"ModificationDate"];
          if (v26)
          {
            long long v27 = [(ICCloudSyncingObject *)self modificationDate];
            id v28 = [v26 laterDate:v27];
            [(ICNote *)self setModificationDate:v28];
          }
          [(ICNote *)self mergeTextDataFromRecord:v12 mergePolicy:a4 mergeableFieldState:v14];
          if (a6) {
            goto LABEL_56;
          }
          char v29 = [(ICNote *)self folderReferenceFromRecord:v12];
          BOOL v92 = v29;
          if (v29)
          {
            id v30 = objc_alloc(MEMORY[0x1E4F1A2D8]);
            [v29 recordID];
            v32 = id v31 = v19;
            uint64_t v33 = [v30 initWithRecordType:@"Folder" recordID:v32];

            uint64_t v19 = v31;
            char v29 = (void *)v33;
          }
          char v34 = objc_msgSend(v12, "ic_isOwnedByCurrentUser");
          int v35 = objc_msgSend(v29, "ic_isOwnedByCurrentUser");
          uint64_t v89 = v29;
          if ((v34 & 1) != 0
            || ((int v36 = v35,
                 [v12 share],
                 long long v37 = objc_claimAutoreleasedReturnValue(),
                 v37,
                 !v37)
              ? (int v38 = 1)
              : (int v38 = v36),
                v38 == 1))
          {
            [(ICNote *)self mergeFoldersFromRecord:v12 account:v13];
          }
          else
          {
            id v84 = [(ICNote *)self folder];

            if (!v84)
            {
              if (!v13)
              {
                uint64_t v85 = [(ICNote *)self managedObjectContext];
                id v13 = +[ICAccount cloudKitAccountInContext:v85];
              }
              v86 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG)) {
                -[ICNote(CloudKit) mergeCloudKitRecord:mergePolicy:account:approach:mergeableFieldState:](v13, v12, v86);
              }

              uint64_t v87 = [v13 defaultFolder];
              [(ICNote *)self setFolder:v87];
            }
          }
          uint64_t v39 = [v12 recordType];
          -[ICNote setIsPasswordProtected:](self, "setIsPasswordProtected:", [v39 isEqualToString:@"PasswordProtectedNote"]);

          uint64_t v40 = [v12 objectForKeyedSubscript:@"AttachmentViewType"];

          if (v40)
          {
            uint64_t v41 = v19;
            objc_opt_class();
            __int16 v42 = [v12 objectForKeyedSubscript:@"AttachmentViewType"];
            v43 = ICCheckedDynamicCast();

            __int16 v44 = [v43 intValue];
            if ([(ICNote *)self attachmentViewType] != v44) {
              [(ICNote *)self setAttachmentViewType:v44];
            }

            uint64_t v19 = v41;
          }
          id v45 = [v12 objectForKeyedSubscript:@"PaperStyleType"];

          if (v45)
          {
            uint64_t v46 = v19;
            objc_opt_class();
            uint64_t v47 = [v12 objectForKeyedSubscript:@"PaperStyleType"];
            uint64_t v48 = ICCheckedDynamicCast();

            __int16 v49 = [v48 intValue];
            if ([(ICNote *)self paperStyleType] != v49) {
              [(ICNote *)self setPaperStyleType:v49];
            }

            uint64_t v19 = v46;
          }
          v50 = [v12 encryptedValues];
          id v51 = [v50 objectForKeyedSubscript:@"TitleEncrypted"];

          if (v51)
          {
            uint64_t v52 = objc_msgSend(v51, "ic_stringValue");
          }
          else
          {
            uint64_t v58 = [v12 objectForKeyedSubscript:@"Title"];

            if (!v58) {
              goto LABEL_37;
            }
            uint64_t v52 = [v12 objectForKeyedSubscript:@"Title"];
          }
          long long v59 = (void *)v52;
          [(ICNote *)self setTitle:v52];

LABEL_37:
          id v94 = v13;
          long long v60 = [v12 encryptedValues];
          uint64_t v61 = [v60 objectForKeyedSubscript:@"SnippetEncrypted"];

          if (v61)
          {
            uint64_t v62 = objc_msgSend(v61, "ic_stringValue");
          }
          else
          {
            uint64_t v63 = [v12 objectForKeyedSubscript:@"Snippet"];

            if (!v63) {
              goto LABEL_42;
            }
            uint64_t v62 = [v12 objectForKeyedSubscript:@"Snippet"];
          }
          v64 = (void *)v62;
          [(ICNote *)self setSnippet:v62];

LABEL_42:
          v65 = [v12 encryptedValues];
          id v66 = [v65 objectForKeyedSubscript:@"ReplicaIDToUserIDEncrypted"];

          if (v66)
          {
            uint64_t v67 = [v12 encryptedValues];
            v68 = [v67 objectForKeyedSubscript:@"ReplicaIDToUserIDEncrypted"];

            uint64_t v69 = [ICMergeableDictionary alloc];
            [(ICCloudSyncingObject *)self currentReplicaID];
            v71 = v70 = v19;
            id v72 = [(ICMergeableDictionary *)v69 initWithData:v68 replicaID:v71];

            uint64_t v19 = v70;
            [(ICNote *)self mergeReplicaIDToUserID:v72];
          }
          uint64_t v73 = [v12 objectForKeyedSubscript:@"LegacyImportDeviceIdentifier"];
          if (v73) {
            [(ICNote *)self setLegacyImportDeviceIdentifier:v73];
          }
          v74 = [v12 objectForKeyedSubscript:@"LegacyModificationDateAtImport"];

          if (v74)
          {
            uint64_t v75 = [v12 objectForKeyedSubscript:@"LegacyModificationDateAtImport"];
            [(ICNote *)self setLegacyModificationDateAtImport:v75];
          }
          v76 = [v12 encryptedValues];
          v77 = [v76 objectForKeyedSubscript:@"LegacyContentHashAtImportEncrypted"];

          if (v77)
          {
            uint64_t v78 = objc_msgSend(v77, "ic_stringValue");
          }
          else
          {
            uint64_t v79 = [v12 objectForKeyedSubscript:@"LegacyContentHashAtImport"];

            if (!v79)
            {
LABEL_53:
              uint64_t v81 = [(ICNote *)self folder];
              [v81 unmarkForDeletionIncludingParentHierarchy];

              v82 = [(ICNote *)self documentWithoutCreating];

              if (v82) {
                [(ICNote *)self regenerateTitle:1 snippet:1];
              }

              id v13 = v94;
              id v14 = v95;
LABEL_56:

              BOOL v53 = 1;
              goto LABEL_57;
            }
            uint64_t v78 = [v12 objectForKeyedSubscript:@"LegacyContentHashAtImport"];
          }
          v80 = (void *)v78;
          [(ICNote *)self setLegacyContentHashAtImport:v78];

          goto LABEL_53;
        }
LABEL_9:
        [(ICNote *)self setCreationDate:v19];
        goto LABEL_10;
      }

      uint64_t v19 = v91;
    }

    id v13 = v93;
    id v14 = v95;
    goto LABEL_9;
  }
  [(ICNote *)self deduplicateSelfAndCreateNewObjectFromRecord:v12];
LABEL_31:
  BOOL v53 = 0;
LABEL_57:

  return v53;
}

- (void)mergeTextDataFromRecord:(id)a3 mergePolicy:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"TextData");
  uint64_t v11 = objc_msgSend(v8, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"TextDeltaData");
  if (!(v10 | v11))
  {
    long long v27 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.7(self);
    }

    goto LABEL_29;
  }
  if ([(ICNote *)self needsInitialFetchFromCloud]
    && [(ICNote *)self hasLoadedDocument])
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"!self.needsInitialFetchFromCloud || !self.hasLoadedDocument", "-[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:]", 1, 1, @"Note document was loaded before merging initial text data — this can lead to data loss, see rdar://97565017" functionName simulateCrash showAlert format];
  }
  id v12 = [(ICNote *)self noteData];
  id v13 = [v12 data];
  if (v13 || [(ICNote *)self hasLoadedDocument])
  {

    int v14 = [(ICNote *)self isPasswordProtected];
    if (v10 && v14)
    {
      if ([(ICCloudSyncingObject *)self isAuthenticated]) {
        id v15 = [(ICNote *)self mergeableString];
      }
      uint64_t v16 = [(ICNote *)self decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:v8];

      uint64_t v10 = v16;
    }
    goto LABEL_12;
  }

  if (!v10)
  {
    [(ICNote *)self isPasswordProtected];
LABEL_12:
    if ([(ICNote *)self isPasswordProtected]
      && ![(ICCloudSyncingObject *)self isAuthenticated])
    {
      goto LABEL_69;
    }
    __int16 v17 = [(ICNote *)self document];

    if (!v17)
    {
      id v28 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:](v28);
      }

      char v29 = +[ICNoteContext sharedContext];
      id v30 = [(ICNote *)self folder];
      id v31 = (id)[v29 addNewNoteByCopyingNote:self toFolder:v30];

      id v32 = [ICTTMergeableStringVersionedDocument alloc];
      uint64_t v33 = [(ICCloudSyncingObject *)self currentReplicaID];
      id v24 = [(ICTTVersionedDocument *)v32 initWithData:v10 replicaID:v33];

      [(ICNote *)self replaceWithDocument:v24];
      [MEMORY[0x1E4F837E8] postBasicEvent:22];
LABEL_59:

      [(ICNote *)self didChangeNoteText];
      v50 = [(ICCloudSyncingObject *)self unappliedEncryptedRecord];
      if (v50)
      {
        id v51 = [(ICCloudSyncingObject *)self cryptoStrategy];
        int v52 = [v51 recordHasChangedPassphrase:v50];

        if (v52)
        {
          BOOL v53 = [(ICNote *)self noteData];
          [v53 setNeedsToBeSaved:1];
        }
      }
      char v54 = [(ICNote *)self noteData];
      if ([v54 saveNoteDataIfNeeded])
      {
      }
      else
      {
        id v55 = [(ICNote *)self noteData];
        char v56 = [v55 needsToBeSaved];

        if (v56)
        {
LABEL_66:
          if (objc_opt_respondsToSelector()) {
            [(ICNote *)self createMissingAttachmentsInTextStorage];
          }
          [(ICNote *)self writeCurrentTimestampToMergeableFieldStateIfNecessary:v9];

          goto LABEL_69;
        }
      }
      [(ICCloudSyncingObject *)self setUnappliedEncryptedRecord:0];
      goto LABEL_66;
    }
    if (v10)
    {
      uint64_t v18 = [ICTTMergeableStringVersionedDocument alloc];
      uint64_t v19 = [(ICCloudSyncingObject *)self currentReplicaID];
      uint64_t v20 = [(ICTTVersionedDocument *)v18 initWithData:v10 replicaID:v19];

      uint64_t v21 = self;
      if (a4 == 1 || (uint64_t v21 = (ICNote *)v20, a4 == 2))
      {
        uint64_t v22 = [(ICNote *)v21 mergeableString];
        BOOL v23 = [(ICNote *)v21 mergeableString];
        objc_msgSend(v22, "deleteCharactersInRange:", 0, objc_msgSend(v23, "length"));
      }
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke;
      v63[3] = &unk_1E64A48D0;
      v63[4] = self;
      id v24 = v20;
      v64 = v24;
      if ([(ICNote *)self performMerge:v63]) {
        goto LABEL_57;
      }
      id v25 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.6(self);
      }

      if (a4 == 1)
      {
        uint64_t v26 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:](self);
        }
      }
      else
      {
        __int16 v44 = os_log_create("com.apple.notes", "Cloud");
        BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
        if (a4 == 2)
        {
          if (v45) {
            -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.4(self);
          }

          goto LABEL_56;
        }
        if (v45) {
          -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:].cold.5(self);
        }

        uint64_t v47 = +[ICNoteContext sharedContext];
        uint64_t v48 = [(ICNote *)self folder];
        id v49 = (id)[v47 addNewNoteByCopyingNote:self toFolder:v48];

        [MEMORY[0x1E4F837E8] postBasicEvent:7];
      }
      [(ICNote *)self replaceWithDocument:v24];
LABEL_56:
      [MEMORY[0x1E4F837E8] postBasicEvent:18];
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:]" simulateCrash:1 showAlert:1 format:@"TopoText merge failure"];
LABEL_57:
      uint64_t v46 = v64;
      goto LABEL_58;
    }
    if (v11)
    {
      uint64_t v39 = [ICTTMergeableAttributedString alloc];
      uint64_t v40 = [(ICCloudSyncingObject *)self currentReplicaID];
      uint64_t v41 = [(ICTTMergeableString *)v39 initWithData:v11 replicaID:v40 fragment:1];

      uint64_t v57 = MEMORY[0x1E4F143A8];
      uint64_t v58 = 3221225472;
      long long v59 = __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke_116;
      long long v60 = &unk_1E64A48D0;
      uint64_t v61 = self;
      id v24 = v41;
      uint64_t v62 = v24;
      unint64_t v42 = [(ICNote *)self performMerge:&v57];
      if (v42 == 2)
      {
        uint64_t v46 = v62;
LABEL_58:

        goto LABEL_59;
      }
      if (!v42)
      {
        v43 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[ICNote(CloudKit) mergeTextDataFromRecord:mergePolicy:mergeableFieldState:](self);
        }

        objc_msgSend(MEMORY[0x1E4F837E8], "postBasicEvent:", 19, v57, v58, v59, v60, v61);
      }
    }
LABEL_29:
    uint64_t v10 = 0;
    goto LABEL_69;
  }
  char v34 = [v8 objectForKeyedSubscript:@"CryptoTag"];

  if (v34)
  {
    int v35 = [v8 objectForKeyedSubscript:@"CryptoTag"];
    [(ICNote *)self setCryptoTag:v35];
  }
  int v36 = [v8 objectForKeyedSubscript:@"CryptoInitializationVector"];

  if (v36)
  {
    long long v37 = [v8 objectForKeyedSubscript:@"CryptoInitializationVector"];
    [(ICNote *)self setCryptoInitializationVector:v37];
  }
  int v38 = [(ICNote *)self noteData];
  [v38 setData:v10];

  [(ICNote *)self writeCurrentTimestampToMergeableFieldStateIfNecessary:v9];
LABEL_69:
}

uint64_t __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) document];
  uint64_t v3 = [v2 mergeWithStringVersionedDocument:*(void *)(a1 + 40)];

  return v3;
}

uint64_t __76__ICNote_CloudKit__mergeTextDataFromRecord_mergePolicy_mergeableFieldState___block_invoke_116(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mergeableString];
  uint64_t v3 = [v2 mergeWithString:*(void *)(a1 + 40)];

  return v3;
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1A2D8], "ic_encryptedKeyForKeyPrefix:", @"TextData");
    uint64_t v6 = [(ICNote *)self mergeableString];
    uint64_t v7 = [v6 timestamp];
    id v8 = [v7 serialize];

    if ([v8 length])
    {
      [v4 setObject:v8 forKey:v5];
    }
    else
    {
      id v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ICNote(CloudKit) writeCurrentTimestampToMergeableFieldStateIfNecessary:](self);
      }
    }
  }
}

- (id)folderReferenceFromRecord:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"Folder"];
  objc_opt_class();
  uint64_t v6 = [v4 objectForKeyedSubscript:@"Folders"];

  uint64_t v7 = ICDynamicCast();

  if (v5)
  {
    if ([v7 count])
    {
      id v8 = [v7 firstObject];
      if (([v5 isEqual:v8] & 1) == 0)
      {
        id v9 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[ICNote(CloudKit) folderReferenceFromRecord:](self);
        }

        id v10 = v8;
        BOOL v5 = v10;
      }
    }
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ICNote(CloudKit) folderReferenceFromRecord:](self);
    }

    BOOL v5 = [v7 firstObject];
  }

  return v5;
}

- (void)mergeFoldersFromRecord:(id)a3 account:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICNote *)self folderReferenceFromRecord:v7];
  id v9 = [v7 objectForKeyedSubscript:@"FoldersModificationDate"];

  if (v9
    && ([(ICNote *)self folderModificationDate],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    uint64_t v11 = [(ICNote *)self folderModificationDate];
    int v12 = objc_msgSend(v9, "ic_isLaterThanDate:", v11);
  }
  else
  {
    uint64_t v11 = [(ICNote *)self folderModificationDate];
    int v12 = v11 == 0;
  }

  id v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    BOOL v23 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    uint64_t v24 = [(ICNote *)self folderModificationDate];
    id v25 = (void *)v24;
    uint64_t v26 = @"N";
    *(_DWORD *)buf = 138413058;
    __int16 v44 = v23;
    if (v12) {
      uint64_t v26 = @"Y";
    }
    __int16 v45 = 2112;
    uint64_t v46 = v9;
    __int16 v47 = 2112;
    uint64_t v48 = v24;
    __int16 v49 = 2112;
    v50 = v26;
    _os_log_debug_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEBUG, "%@: cloud folder modification date: %@, local folder modification date: %@, isCloudFoldersMoreRecentThanLocalFolders: %@", buf, 0x2Au);
  }
  int v14 = [(ICNote *)self folder];
  char v15 = [v14 isTrashFolder];

  if (([(ICNote *)self needsInitialFetchFromCloud] | v12) == 1)
  {
    if (v8)
    {
      uint64_t v16 = [v8 recordID];
      id v42 = v6;
      __int16 v17 = [v6 identifier];
      uint64_t v18 = [(ICNote *)self managedObjectContext];
      os_log_t v19 = +[ICFolder existingCloudObjectForRecordID:v16 accountID:v17 context:v18];

      if (!v19)
      {
        uint64_t v20 = os_log_create("com.apple.notes", "Cloud");
        uint64_t v21 = v20;
        if (v42)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[ICNote(CloudKit) mergeFoldersFromRecord:account:](v8, self, v21);
          }

          uint64_t v22 = [v8 recordID];
          uint64_t v21 = [v22 recordName];

          os_log_t v19 = +[ICFolder newFolderWithIdentifier:v21 account:v42];
          [v19 setNeedsInitialFetchFromCloud:1];
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            long long v27 = (objc_class *)objc_opt_class();
            id v28 = NSStringFromClass(v27);
            uint64_t v41 = [v8 recordID];
            char v29 = [v41 recordName];
            id v30 = [(ICCloudSyncingObject *)self shortLoggingDescription];
            id v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            id v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v33 = [0 identifier];
            *(_DWORD *)buf = 138413314;
            __int16 v44 = v28;
            __int16 v45 = 2112;
            uint64_t v46 = v29;
            __int16 v47 = 2112;
            uint64_t v48 = (uint64_t)v30;
            __int16 v49 = 2112;
            v50 = v32;
            __int16 v51 = 2112;
            int v52 = v33;
            _os_log_impl(&dword_1C3A61000, v21, OS_LOG_TYPE_INFO, "Trying to set a %@ (%@) for %@, but we couldn't find the %@ due to a non-existent CloudKit account (%@). Folder will be nil.", buf, 0x34u);
          }
          os_log_t v19 = 0;
        }
      }
      if ([v19 folderType] == 1) {
        [v19 setMarkedForDeletion:0];
      }
      [(ICNote *)self setFolderModificationDate:v9];
      [(ICNote *)self setFolder:v19];
      id v6 = v42;
    }
    else
    {
      os_log_t v19 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ICNote(CloudKit) mergeFoldersFromRecord:account:](self);
      }
    }
  }
  if ([(ICNote *)self markedForDeletion])
  {
    char v34 = [(ICNote *)self folder];
    char v35 = [v34 isTrashFolder];

    if ((v35 & 1) == 0)
    {
      int v36 = [(ICNote *)self account];
      long long v37 = [v36 trashFolder];

      int v38 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[ICNote(CloudKit) mergeFoldersFromRecord:account:](self, (uint64_t)v37, v38);
      }

      [(ICNote *)self setFolder:v37];
      [(ICNote *)self setFolderModificationDate:v9];
    }
  }
  if ((v15 & 1) == 0)
  {
    uint64_t v39 = [(ICNote *)self folder];
    int v40 = [v39 isTrashFolder];

    if (v40) {
      [(ICNote *)self notifyAttachmentsNoteWillMoveToRecentlyDeletedFolder];
    }
  }
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)ICNote;
  id v6 = a4;
  id v7 = [(ICCloudSyncingObject *)&v56 makeCloudKitRecordForApproach:a3 mergeableFieldState:v6];
  -[ICNote addNoteBodyToRecord:forApproach:mergeableFieldState:](self, "addNoteBodyToRecord:forApproach:mergeableFieldState:", v7, a3, v6, v56.receiver, v56.super_class);

  id v8 = [(ICCloudSyncingObject *)self modificationDate];
  [v7 setObject:v8 forKeyedSubscript:@"ModificationDate"];

  id v9 = [(ICCloudSyncingObject *)self creationDate];
  [v7 setObject:v9 forKeyedSubscript:@"CreationDate"];

  if (!a3)
  {
    id v10 = [(ICNote *)self folder];
    uint64_t v11 = [v10 recordID];

    if (v11)
    {
      int v12 = [v7 recordID];
      id v13 = [v12 zoneID];
      int v14 = [v11 zoneID];
      int v15 = [v13 isEqual:v14];

      if (v15)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F1A348]);
        __int16 v17 = (void *)[v16 initWithRecordID:v11 action:*MEMORY[0x1E4F19D98]];
        [v7 setObject:v17 forKeyedSubscript:@"Folder"];
        uint64_t v18 = [(ICNote *)self folderModificationDate];
        [v7 setObject:v18 forKeyedSubscript:@"FoldersModificationDate"];

        v57[0] = v17;
        os_log_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
        [v7 setObject:v19 forKeyedSubscript:@"Folders"];
      }
    }
    uint64_t v20 = [(ICNote *)self replicaIDToUserIDDictData];

    if (v20)
    {
      uint64_t v21 = [(ICNote *)self replicaIDToUserIDDictData];
      uint64_t v22 = [v7 encryptedValues];
      [v22 setObject:v21 forKeyedSubscript:@"ReplicaIDToUserIDEncrypted"];
    }
    if ([(ICNote *)self isPasswordProtected])
    {
      BOOL v23 = [(ICNote *)self cryptoInitializationVector];
      [v7 setObject:v23 forKeyedSubscript:@"CryptoInitializationVector"];

      uint64_t v24 = [(ICNote *)self cryptoTag];
      [v7 setObject:v24 forKeyedSubscript:@"CryptoTag"];

      id v25 = [(ICNote *)self cryptoWrappedKey];
      [v7 setObject:v25 forKeyedSubscript:@"CryptoWrappedKey"];
    }
    uint64_t v26 = [(ICNote *)self title];

    if (v26)
    {
      long long v27 = [(ICNote *)self title];
      id v28 = [v27 dataUsingEncoding:4];
      char v29 = [v7 encryptedValues];
      [v29 setObject:v28 forKeyedSubscript:@"TitleEncrypted"];
    }
    id v30 = [(ICNote *)self snippet];

    if (v30)
    {
      id v31 = [(ICNote *)self snippet];
      id v32 = [v31 dataUsingEncoding:4];
      uint64_t v33 = [v7 encryptedValues];
      [v33 setObject:v32 forKeyedSubscript:@"SnippetEncrypted"];
    }
    char v34 = [(ICNote *)self legacyModificationDateAtImport];

    if (v34)
    {
      char v35 = [(ICNote *)self legacyModificationDateAtImport];
      [v7 setObject:v35 forKeyedSubscript:@"LegacyModificationDateAtImport"];
    }
    int v36 = [(ICNote *)self legacyContentHashAtImport];

    if (v36)
    {
      long long v37 = [(ICNote *)self legacyContentHashAtImport];
      int v38 = [v37 dataUsingEncoding:4];
      uint64_t v39 = [v7 encryptedValues];
      [v39 setObject:v38 forKeyedSubscript:@"LegacyContentHashAtImportEncrypted"];
    }
    int v40 = [(ICNote *)self legacyImportDeviceIdentifier];

    if (v40)
    {
      uint64_t v41 = [(ICNote *)self legacyImportDeviceIdentifier];
      [v7 setObject:v41 forKeyedSubscript:@"LegacyImportDeviceIdentifier"];
    }
    id v42 = [(ICNote *)self attachmentForWebThumbnail];
    v43 = v42;
    if (v42)
    {
      __int16 v44 = objc_msgSend(v42, "attachmentPreviewImageWithMinSize:scale:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 2.0);
      __int16 v45 = v44;
      if (v44)
      {
        uint64_t v46 = [v44 previewImageURL];
        __int16 v47 = +[ICCloudSyncingObject assetForURL:v46];

        if (v47)
        {
          [v7 setObject:v47 forKeyedSubscript:@"FirstAttachmentThumbnail"];
          uint64_t v48 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", objc_msgSend(v43, "orientation"));
          [v7 setObject:v48 forKeyedSubscript:@"FirstAttachmentThumbnailOrientation"];
        }
      }
      else
      {
        [v7 setObject:0 forKeyedSubscript:@"FirstAttachmentThumbnail"];
      }
      __int16 v49 = [v43 typeUTI];

      if (v49)
      {
        v50 = [v43 typeUTI];
        __int16 v51 = [v50 dataUsingEncoding:4];
        int v52 = [v7 encryptedValues];
        [v52 setObject:v51 forKeyedSubscript:@"FirstAttachmentUTIEncrypted"];
      }
    }
    else
    {
      [v7 setObject:0 forKeyedSubscript:@"FirstAttachmentThumbnail"];
      [v7 setObject:0 forKeyedSubscript:@"FirstAttachmentUTIEncrypted"];
    }
    uint64_t v53 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICNote attachmentViewType](self, "attachmentViewType"));
    [v7 setObject:v53 forKeyedSubscript:@"AttachmentViewType"];

    char v54 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICNote paperStyleType](self, "paperStyleType"));
    [v7 setObject:v54 forKeyedSubscript:@"PaperStyleType"];
  }
  return v7;
}

- (void)addNoteBodyToRecord:(id)a3 forApproach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(ICNote *)self noteData];
  char v11 = [v10 needsToBeSaved];

  if ((v11 & 1) == 0)
  {
    [(ICNote *)self willChangeValueForKey:@"data"];
    int v12 = [(ICNote *)self noteData];
    [v12 setNeedsToBeSaved:1];

    [(ICNote *)self didChangeValueForKey:@"data"];
  }
  if (v9)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F1A2D8], "ic_encryptedKeyForKeyPrefix:", @"TextData");
    objc_opt_class();
    int v14 = [v9 objectForKey:v13];
    int v15 = ICDynamicCast();

    if ([v15 length])
    {
      uint64_t v16 = +[ICTTMergeableString timestampFromData:v15];
      if (v16)
      {
        __int16 v17 = (void *)v16;
        uint64_t v18 = [(ICNote *)self mergeableString];
        os_log_t v19 = [v18 serializeDeltaSinceTimestamp:v17];

        if ([v19 length])
        {
          objc_msgSend(v8, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v19, @"TextDeltaData", a4);
        }
        else
        {
          uint64_t v22 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[ICNote(CloudKit) addNoteBodyToRecord:forApproach:mergeableFieldState:](self);
          }
        }
        goto LABEL_18;
      }
      uint64_t v20 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ICNote(CloudKit) addNoteBodyToRecord:forApproach:mergeableFieldState:](self);
      }
    }
  }
  uint64_t v21 = [(ICNote *)self noteData];
  id v13 = [v21 data];

  if (v13) {
    objc_msgSend(v8, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v13, @"TextData", a4);
  }
LABEL_18:

  [(ICNote *)self writeCurrentTimestampToMergeableFieldStateIfNecessary:v9];
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [a3 recordName];
  id v10 = +[ICNote noteWithIdentifier:v9 accountID:v8 context:v7];

  return v10;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[ICAccount cloudKitAccountWithIdentifier:v7 context:a5];
  id v10 = +[ICNote newNoteWithoutIdentifierInAccount:v9];
  char v11 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v10 setModificationDate:v11];

  int v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v10 setCreationDate:v12];

  id v13 = [v8 recordID];
  int v14 = [v13 recordName];
  [v10 setIdentifier:v14];

  [v10 setNeedsInitialFetchFromCloud:1];
  [v10 mergeCloudKitRecord:v8 accountID:v7 approach:0];

  [v10 setNeedsInitialFetchFromCloud:0];
  [v10 setServerRecord:v8];
  [v10 setInCloud:1];
  [v10 clearChangeCountWithReason:@"Created note"];
  [v10 updateParentReferenceIfNecessary];
  int v15 = [v8 recordType];

  LODWORD(v8) = [v15 isEqualToString:@"PasswordProtectedNote"];
  if (v8) {
    [v10 setIsPasswordProtected:1];
  }

  return v10;
}

+ (id)newPlaceholderObjectForRecordName:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = +[ICAccount cloudKitAccountWithIdentifier:a4 context:a5];
  id v10 = (void *)[a1 newPlaceholderObjectForRecordName:v8 account:v9];

  return v10;
}

+ (id)newPlaceholderObjectForRecordName:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 identifier];
  id v9 = [v6 managedObjectContext];
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ICNote;
  id v10 = objc_msgSendSuper2(&v12, sel_newPlaceholderObjectForRecordName_accountID_context_, v7, v8, v9);

  [v10 setAccount:v6];
  return v10;
}

+ (BOOL)supportsUserSpecificRecords
{
  return 1;
}

- (BOOL)wantsUserSpecificRecord
{
  return 1;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)ICNote;
  BOOL v5 = -[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:](&v32, sel_makeUserSpecificCloudKitRecordForApproach_);
  id v6 = [(ICNote *)self folder];
  id v7 = [v6 recordID];

  if (!v7 || !objc_msgSend(v7, "ic_isOwnedByCurrentUser"))
  {
    id v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = [(ICNote *)self identifier];
      *(_DWORD *)buf = 138412290;
      char v34 = v11;
      _os_log_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_DEFAULT, "Creating user specific note record with no folder record ID: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  id v8 = [(ICNote *)self folder];
  int v9 = [v8 isTrashFolder];

  if (v9)
  {
    id v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICNote(CloudKit) makeUserSpecificCloudKitRecordForApproach:](self);
    }
LABEL_8:

    goto LABEL_9;
  }
  id v10 = [objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v7 action:0];
  [v5 setObject:v10 forKeyedSubscript:@"Folder"];
LABEL_9:

  objc_super v12 = [(ICCloudSyncingObject *)self recordID];
  if (v12)
  {
    id v13 = [objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v12 action:0];
    [v5 setObject:v13 forKeyedSubscript:@"Note"];
  }
  else
  {
    id v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [(ICNote *)self identifier];
      *(_DWORD *)buf = 138412290;
      char v34 = v14;
      _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEFAULT, "Creating user specific note record with no note record ID: %@", buf, 0xCu);
    }
  }

  int v15 = [(ICNote *)self lastViewedModificationDate];

  if (v15)
  {
    uint64_t v16 = [(ICNote *)self lastViewedModificationDate];
    [v5 setObject:v16 forKeyedSubscript:@"LastViewedModificationDate"];
  }
  __int16 v17 = [(ICNote *)self lastViewedTimestampData];
  if (v17) {
    [v5 setObject:v17 forKeyedSubscript:@"LastViewedTimestamp"];
  }
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICNote isPinned](self, "isPinned"));
  [v5 setObject:v18 forKeyedSubscript:@"IsPinned"];

  os_log_t v19 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ICNote(CloudKit) makeUserSpecificCloudKitRecordForApproach:](self, v5);
  }

  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICNote isSystemPaper](self, "isSystemPaper"));
  [v5 setObject:v20 forKeyedSubscript:@"IsSystemPaper"];

  uint64_t v21 = [(ICNote *)self hostApplicationIdentifier];
  uint64_t v22 = [v5 encryptedValues];
  [v22 setObject:v21 forKeyedSubscript:@"HostApplicationIdentifierEncrypted"];

  BOOL v23 = [(ICNote *)self lastActivitySummaryViewedDate];

  if (v23)
  {
    uint64_t v24 = [(ICNote *)self lastActivitySummaryViewedDate];
    [v5 setObject:v24 forKeyedSubscript:@"LastActivitySummaryViewedDate"];
  }
  id v25 = [(ICNote *)self lastActivityRecentUpdatesViewedDate];

  if (v25)
  {
    uint64_t v26 = [(ICNote *)self lastActivityRecentUpdatesViewedDate];
    [v5 setObject:v26 forKeyedSubscript:@"LastActivityRecentUpdatesViewedDate"];
  }
  long long v27 = [(ICNote *)self lastAttributionsViewedDate];

  if (v27)
  {
    id v28 = [(ICNote *)self lastAttributionsViewedDate];
    [v5 setObject:v28 forKeyedSubscript:@"LastAttributionsViewedDate"];
  }
  char v29 = [(ICNote *)self outlineStateData];

  if (v29)
  {
    id v30 = [(ICNote *)self outlineStateData];
    objc_msgSend(v5, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v30, @"OutlineState", a3);
  }
  return v5;
}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v62.receiver = self;
  v62.super_class = (Class)ICNote;
  LODWORD(v8) = [(ICCloudSyncingObject *)&v62 mergeDataFromUserSpecificRecord:v6 accountID:v7];
  if (v8)
  {
    int v9 = [v6 objectForKeyedSubscript:@"Folder"];
    if (v9 && [(ICCloudSyncingObject *)self isSharedViaICloud])
    {
      id v10 = [v9 recordID];
      char v11 = [(ICNote *)self managedObjectContext];
      id v12 = +[ICFolder existingCloudObjectForRecordID:v10 accountID:v7 context:v11];

      if (!v12)
      {
        id v13 = [v9 recordID];
        int v14 = [v13 recordName];
        [(ICNote *)self managedObjectContext];
        uint64_t v16 = v15 = v7;
        id v12 = +[ICFolder newPlaceholderObjectForRecordName:v14 accountID:v15 context:v16];

        id v7 = v15;
      }
      __int16 v17 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        char v54 = [v12 identifier];
        id v55 = [(ICNote *)self identifier];
        *(_DWORD *)buf = 138412802;
        v64 = v54;
        __int16 v65 = 2112;
        id v66 = v7;
        __int16 v67 = 2112;
        v68 = v55;
        _os_log_debug_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_DEBUG, "Setting folder %@ in account %@ to note %@ from user specific record.", buf, 0x20u);
      }
      [(ICNote *)self setFolder:v12];
    }
    uint64_t v18 = [v6 objectForKeyedSubscript:@"LastViewedModificationDate"];
    if (v18)
    {
      os_log_t v19 = [(ICNote *)self lastViewedModificationDate];
      int v20 = objc_msgSend(v19, "ic_isEarlierThanDate:", v18);

      if (v20) {
        [(ICNote *)self setLastViewedModificationDate:v18];
      }
    }
    uint64_t v21 = [v6 objectForKeyedSubscript:@"LastViewedTimestamp"];
    if (v21)
    {
      uint64_t v22 = [[ICTTVectorMultiTimestamp alloc] initWithData:v21 andCapacity:2];
      BOOL v23 = [(ICNote *)self lastViewedTimestamp];

      if (!v23
        || ([(ICNote *)self lastViewedTimestamp],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = [v24 compareTo:v22],
            v24,
            (v25 & 1) != 0))
      {
        [(ICNote *)self setLastViewedTimestamp:v22];
      }
    }
    uint64_t v26 = [v6 objectForKeyedSubscript:@"IsPinned"];
    long long v27 = v26;
    if (v26) {
      -[ICNote setIsPinned:](self, "setIsPinned:", [v26 BOOLValue]);
    }
    uint64_t v58 = v27;
    id v28 = [v6 objectForKeyedSubscript:@"IsSystemPaper"];
    if (v28)
    {
      char v29 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[ICNote(CloudKit) mergeDataFromUserSpecificRecord:accountID:](self);
      }

      -[ICNote setIsSystemPaper:](self, "setIsSystemPaper:", [v28 BOOLValue]);
    }
    uint64_t v57 = v28;
    long long v59 = (void *)v21;
    long long v60 = (void *)v18;
    uint64_t v61 = v9;
    id v30 = [v6 encryptedValues];
    id v31 = [v30 objectForKeyedSubscript:@"HostApplicationIdentifierEncrypted"];
    [(ICNote *)self setHostApplicationIdentifier:v31];

    objc_super v32 = [v6 objectForKeyedSubscript:@"LastActivitySummaryViewedDate"];
    if (v32)
    {
      uint64_t v33 = [(ICNote *)self lastActivitySummaryViewedDate];
      if (!v33
        || (char v34 = (void *)v33,
            [(ICNote *)self lastActivitySummaryViewedDate],
            uint64_t v35 = objc_claimAutoreleasedReturnValue(),
            int v36 = objc_msgSend(v32, "ic_isLaterThanDate:", v35),
            v35,
            v34,
            v36))
      {
        [(ICNote *)self setLastActivitySummaryViewedDate:v32];
      }
    }
    long long v37 = [v6 objectForKeyedSubscript:@"LastActivityRecentUpdatesViewedDate"];
    if (v37)
    {
      uint64_t v38 = [(ICNote *)self lastActivityRecentUpdatesViewedDate];
      if (!v38
        || (uint64_t v39 = (void *)v38,
            [(ICNote *)self lastActivityRecentUpdatesViewedDate],
            int v40 = objc_claimAutoreleasedReturnValue(),
            int v41 = objc_msgSend(v37, "ic_isLaterThanDate:", v40),
            v40,
            v39,
            v41))
      {
        [(ICNote *)self setLastActivityRecentUpdatesViewedDate:v37];
      }
    }
    id v42 = [v6 objectForKeyedSubscript:@"LastAttributionsViewedDate"];
    if (v42)
    {
      uint64_t v43 = [(ICNote *)self lastAttributionsViewedDate];
      if (!v43
        || (__int16 v44 = (void *)v43,
            [(ICNote *)self lastAttributionsViewedDate],
            __int16 v45 = objc_claimAutoreleasedReturnValue(),
            int v46 = objc_msgSend(v42, "ic_isLaterThanDate:", v45),
            v45,
            v44,
            v46))
      {
        [(ICNote *)self setLastAttributionsViewedDate:v42];
      }
    }
    __int16 v47 = objc_msgSend(v6, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"OutlineState");
    if (v47)
    {
      BOOL v56 = v8;
      BOOL v8 = (BOOL)v7;
      uint64_t v48 = [[ICOutlineState alloc] initWithData:v47];
      __int16 v49 = [(ICNote *)self outlineState];
      int v50 = [v49 mergeWithState:v48];

      if (v50)
      {
        __int16 v51 = [(ICNote *)self outlineState];
        int v52 = [v51 data];
        [(ICNote *)self setOutlineStateData:v52];
      }
      id v7 = (id)v8;
      LOBYTE(v8) = v56;
    }
  }
  return v8;
}

- (BOOL)isInICloudAccount
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(ICNote *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ICNote_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A4528;
  void v5[4] = v2;
  void v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __37__ICNote_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) folder];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInICloudAccount];
}

- (void)fixBrokenReferences
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICCloudSyncingObject *)self loggingDescription];
    *(_DWORD *)buf = 138412290;
    __int16 v67 = v4;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for %@", buf, 0xCu);
  }
  BOOL v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    id v7 = [(ICNote *)self folder];
    uint64_t v8 = [v7 loggingDescription];
    *(_DWORD *)buf = 138412546;
    __int16 v67 = v6;
    __int16 v68 = 2112;
    uint64_t v69 = v8;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Folder for %@: %@", buf, 0x16u);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  char v9 = [(ICNote *)self attachments];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v73 count:16];
  uint64_t v57 = self;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v15 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [(ICCloudSyncingObject *)self shortLoggingDescription];
          __int16 v17 = [v14 loggingDescription];
          *(_DWORD *)buf = 138412546;
          __int16 v67 = v16;
          __int16 v68 = 2112;
          uint64_t v69 = v17;
          _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "Attachment for %@: %@", buf, 0x16u);

          self = v57;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v73 count:16];
    }
    while (v11);
  }

  if ([(ICNote *)self markedForDeletion])
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v18 = [(ICNote *)self attachments];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v19)
    {
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)v59;
      BOOL v23 = "com.apple.notes";
      uint64_t v24 = "Cloud";
      *(void *)&long long v20 = 138412546;
      long long v55 = v20;
      char v25 = &off_1E64A3000;
      do
      {
        uint64_t v26 = 0;
        uint64_t v56 = v21;
        do
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v18);
          }
          long long v27 = *(void **)(*((void *)&v58 + 1) + 8 * v26);
          if ((objc_msgSend(v27, "markedForDeletion", v55) & 1) == 0)
          {
            id v28 = os_log_create(v23, v24);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              char v29 = [(ICNote *)self identifier];
              [v27 identifier];
              uint64_t v30 = v22;
              id v31 = v18;
              objc_super v32 = v25;
              uint64_t v33 = v24;
              v35 = char v34 = v23;
              *(_DWORD *)buf = v55;
              __int16 v67 = v29;
              __int16 v68 = 2112;
              uint64_t v69 = v35;
              _os_log_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEFAULT, "Found a deleted note (%@) with an undeleted attachment (%@)", buf, 0x16u);

              BOOL v23 = v34;
              uint64_t v24 = v33;
              char v25 = v32;
              uint64_t v18 = v31;
              uint64_t v22 = v30;
              uint64_t v21 = v56;

              self = v57;
            }

            [v25[88] deleteAttachment:v27];
          }
          ++v26;
        }
        while (v21 != v26);
        uint64_t v21 = [v18 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v21);
    }
  }
  if ([(ICCloudSyncingObject *)self isSharedViaICloud])
  {
    if ([(ICCloudSyncingObject *)self isOwnedByCurrentUser]
      || ([(ICNote *)self markedForDeletion] & 1) == 0)
    {
      if (![(ICCloudSyncingObject *)self isOwnedByCurrentUser]) {
        goto LABEL_36;
      }
      int v36 = [(ICCloudSyncingObject *)self serverShare];
      if (v36)
      {
      }
      else
      {
        long long v37 = [(ICCloudSyncingObject *)self serverRecord];
        uint64_t v38 = [v37 share];

        if (!v38) {
          goto LABEL_36;
        }
      }
      [(ICCloudSyncingObject *)self setServerShare:0];
    }
    [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:1];
  }
LABEL_36:
  uint64_t v39 = [(ICNote *)self folder];
  int v40 = [v39 markedForDeletion];

  if (v40)
  {
    int v41 = [(ICNote *)self folder];
    [v41 unmarkForDeletion];
  }
  id v42 = [(ICNote *)self folder];
  int v43 = [v42 needsInitialFetchFromCloud];

  if (v43)
  {
    __int16 v44 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v45 = [(ICNote *)self identifier];
      int v46 = [(ICNote *)self account];
      __int16 v47 = [v46 identifier];
      uint64_t v48 = [(ICNote *)self account];
      __int16 v49 = [v48 trashFolder];
      int v50 = [v49 identifier];
      *(_DWORD *)buf = 138412802;
      __int16 v67 = v45;
      __int16 v68 = 2112;
      uint64_t v69 = v47;
      __int16 v70 = 2112;
      v71 = v50;
      _os_log_impl(&dword_1C3A61000, v44, OS_LOG_TYPE_DEFAULT, "Moving note %@ in account %@ to trash folder %@ since folder doesn't exist on server.", buf, 0x20u);
    }
    __int16 v51 = [(ICNote *)self account];
    int v52 = [v51 trashFolder];
    [(ICNote *)self setFolder:v52];

    uint64_t v53 = [MEMORY[0x1E4F1C9C8] date];
    [(ICNote *)self setFolderModificationDate:v53];

    [(ICNote *)self updateChangeCountWithReason:@"Fixed broken reference"];
  }
  else
  {
    char v54 = [(ICNote *)self folder];
    [v54 updateChangeCountWithReason:@"Fixed broken reference"];
  }
}

- (BOOL)hasAllMandatoryFields
{
  v8.receiver = self;
  v8.super_class = (Class)ICNote;
  if (![(ICCloudSyncingObject *)&v8 hasAllMandatoryFields]) {
    return 0;
  }
  uint64_t v3 = [(ICNote *)self noteData];
  id v4 = [v3 data];
  if (v4)
  {
    BOOL v5 = [(ICNote *)self folder];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)keyPathsForValuesAffectingCloudAccount
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"account"];
}

- (BOOL)needsToBeDeletedFromCloud
{
  if ([(ICNote *)self isSharedViaICloudFolder])
  {
    if (![(ICCloudSyncingObject *)self isOwnedByCurrentUser])
    {
      if ([(ICCloudSyncingObject *)self isInCloud])
      {
        if ([(ICNote *)self markedForDeletion])
        {
          uint64_t v3 = [(ICNote *)self folder];
          char v4 = [v3 markedForDeletion];

          if (v4) {
            return 1;
          }
        }
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ICNote;
  return [(ICCloudSyncingObject *)&v6 needsToBeDeletedFromCloud];
}

- (id)objectsToBeDeletedBeforeThisObject
{
  v9.receiver = self;
  v9.super_class = (Class)ICNote;
  uint64_t v3 = [(ICCloudSyncingObject *)&v9 objectsToBeDeletedBeforeThisObject];
  char v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(ICNote *)self attachments];
  objc_super v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (void)deleteFromLocalDatabase
{
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (int64_t)mergePolicyForRecord:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(ICNote *)self needsInitialFetchFromCloud] & 1) == 0)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"LegacyModificationDateAtImport"];
    uint64_t v7 = [(ICNote *)self legacyModificationDateAtImport];

    if ((v6 != 0) != (v7 != 0))
    {
      objc_super v8 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v9 = v8;
        uint64_t v62 = v6;
        uint64_t v10 = [(ICCloudSyncingObject *)self recordID];
        uint64_t v11 = [v10 recordName];
        uint64_t v12 = [(ICNote *)self legacyContentHashAtImport];
        id v13 = [v4 encryptedValues];
        int v14 = [v13 objectForKeyedSubscript:@"LegacyContentHashAtImportEncrypted"];
        id v15 = objc_msgSend(v14, "ic_stringValue");
        uint64_t v16 = v15;
        if (!v15)
        {
          uint64_t v16 = [v4 objectForKeyedSubscript:@"LegacyContentHashAtImport"];
        }
        __int16 v17 = [(ICNote *)self legacyModificationDateAtImport];
        *(_DWORD *)buf = 138413314;
        long long v65 = v11;
        __int16 v66 = 2112;
        __int16 v67 = v12;
        __int16 v68 = 2112;
        uint64_t v69 = v16;
        __int16 v70 = 2112;
        v71 = v17;
        __int16 v72 = 2112;
        uint64_t v73 = v62;
        _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "Duplicating a note received from the cloud because they're not both legacy notes: (%@)\n\tlegacyContentHashAtImport:\t\t%@\n\totherLegacyContentHashAtImport:\t%@\n\tlegacyModificationDateAtImport:\t%@\n\totherLegacyModificationDateAtImport:\t%@", buf, 0x34u);

        if (!v15) {
        int64_t v5 = 3;
        }
        uint64_t v18 = v9;
        uint64_t v6 = v62;
        objc_super v8 = v9;
        goto LABEL_66;
      }
      int64_t v5 = 3;
      goto LABEL_33;
    }
    uint64_t v19 = [(ICCloudSyncingObject *)self serverRecord];
    if (v19)
    {
      long long v20 = (void *)v19;
      uint64_t v21 = v6 | v7;
      uint64_t v22 = [v4 creationDate];
      BOOL v23 = [(ICCloudSyncingObject *)self serverRecord];
      uint64_t v24 = [v23 creationDate];
      int v25 = [v22 isEqualToDate:v24];

      if (v21)
      {
        int v26 = v25 ^ 1;
LABEL_16:
        uint64_t v18 = [v4 objectForKeyedSubscript:@"LegacyImportDeviceIdentifier"];
        long long v27 = [(ICNote *)self legacyImportDeviceIdentifier];
        int v28 = [v27 isEqualToString:v18];

        if (v28)
        {
          if (!v26)
          {
            int64_t v5 = 0;
LABEL_67:

            goto LABEL_68;
          }
          char v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = [(ICNote *)self identifier];
            *(_DWORD *)buf = 138412290;
            long long v65 = v30;
            _os_log_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_DEFAULT, "Found a legacy note (%@) in the cloud with a record whose creation date is not equal to our own cached version. Replacing our own version with the one in the cloud.", buf, 0xCu);
          }
          int64_t v5 = 1;
          objc_super v8 = v29;
          goto LABEL_65;
        }
        id v31 = [v4 encryptedValues];
        objc_super v32 = [v31 objectForKeyedSubscript:@"LegacyContentHashAtImportEncrypted"];
        uint64_t v33 = objc_msgSend(v32, "ic_stringValue");

        long long v60 = v18;
        if (v33) {
          goto LABEL_24;
        }
        int v50 = [v4 objectForKeyedSubscript:@"LegacyContentHashAtImport"];

        if (!v50)
        {
          char v63 = 0;
          uint64_t v33 = 0;
          goto LABEL_25;
        }
        uint64_t v33 = [v4 objectForKeyedSubscript:@"LegacyContentHashAtImport"];
        if (v33)
        {
LABEL_24:
          char v34 = [(ICNote *)self legacyContentHashAtImport];
          char v63 = [v34 isEqualToString:v33];
        }
        else
        {
          char v63 = 0;
        }
LABEL_25:
        uint64_t v35 = [(ICNote *)self legacyModificationDateAtImport];
        char v58 = [v35 isEqualToDate:v6];

        long long v59 = [v4 objectForKeyedSubscript:@"ModificationDate"];
        int v61 = [v59 isEqualToDate:v6];
        int v36 = [(ICCloudSyncingObject *)self modificationDate];
        long long v37 = [(ICNote *)self legacyModificationDateAtImport];
        int v57 = [v36 isEqualToDate:v37];

        uint64_t v38 = NSString;
        uint64_t v39 = [(ICCloudSyncingObject *)self recordID];
        int v40 = [v39 recordName];
        int v41 = [(ICNote *)self legacyContentHashAtImport];
        id v42 = [(ICNote *)self legacyModificationDateAtImport];
        int v43 = [v38 stringWithFormat:@"(%@)\n\tlegacyContentHashAtImport:\t\t%@\n\totherLegacyContentHashAtImport:\t%@\n\tlegacyModificationDateAtImport:\t%@\n\totherLegacyModificationDateAtImport:\t%@", v40, v41, v33, v42, v6];

        if (v63 & 1) != 0 || (v58)
        {
          int v48 = v61 ^ 1;
          if (((v57 ^ 1) & 1) == 0 && (v48 & 1) == 0)
          {
            __int16 v47 = os_log_create("com.apple.notes", "Cloud");
            uint64_t v18 = v60;
            objc_super v8 = v33;
            char v29 = v59;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v43;
              __int16 v49 = "Replacing note content from cloud and no device has modified it: %@";
LABEL_53:
              _os_log_impl(&dword_1C3A61000, v47, OS_LOG_TYPE_DEFAULT, v49, buf, 0xCu);
            }
LABEL_54:
            int64_t v5 = 1;
LABEL_64:

LABEL_65:
            goto LABEL_66;
          }
          uint64_t v18 = v60;
          objc_super v8 = v33;
          char v29 = v59;
          if (((v61 | v57 ^ 1) & 1) == 0)
          {
            __int16 v47 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v43;
              __int16 v49 = "Replacing note content from cloud and the other device has modified it: %@";
              goto LABEL_53;
            }
            goto LABEL_54;
          }
          if ((v57 | v48))
          {
            __int16 v47 = os_log_create("com.apple.notes", "Cloud");
            BOOL v51 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
            if ((v61 | v57))
            {
              if (v51)
              {
                *(_DWORD *)buf = 138412290;
                long long v65 = v43;
                int v52 = "Duplicating a note received from the cloud because we failed to make a decision: %@";
LABEL_62:
                _os_log_impl(&dword_1C3A61000, v47, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
                goto LABEL_63;
              }
            }
            else if (v51)
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v43;
              int v52 = "Duplicating a note received from the cloud because both devices modified the note since import: %@";
              goto LABEL_62;
            }
            int64_t v5 = 3;
            goto LABEL_64;
          }
          __int16 v47 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v65 = v43;
            int v52 = "Duplicating a note received from the cloud because this device modified the note since import: %@";
            goto LABEL_62;
          }
        }
        else
        {
          __int16 v44 = v43;
          __int16 v45 = [(ICNote *)self legacyModificationDateAtImport];
          int v46 = objc_msgSend(v45, "ic_isLaterThanDate:", v6) & v61;

          if (v46 == 1)
          {
            __int16 v47 = os_log_create("com.apple.notes", "Cloud");
            uint64_t v18 = v60;
            objc_super v8 = v33;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              int v43 = v44;
              long long v65 = v44;
              _os_log_impl(&dword_1C3A61000, v47, OS_LOG_TYPE_DEFAULT, "Fetched legacy note imported from an earlier legacy version than ours: %@", buf, 0xCu);
              int64_t v5 = 2;
              char v29 = v59;
            }
            else
            {
              int64_t v5 = 2;
              char v29 = v59;
              int v43 = v44;
            }
            goto LABEL_64;
          }
          uint64_t v53 = [(ICNote *)self legacyModificationDateAtImport];
          int v54 = objc_msgSend(v53, "ic_isEarlierThanDate:", v6) & v57;

          __int16 v47 = os_log_create("com.apple.notes", "Cloud");
          BOOL v55 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
          uint64_t v18 = v60;
          objc_super v8 = v33;
          if (v54 == 1)
          {
            char v29 = v59;
            int v43 = v44;
            if (v55)
            {
              *(_DWORD *)buf = 138412290;
              long long v65 = v44;
              __int16 v49 = "Fetched legacy note imported from a later legacy version than ours: %@";
              goto LABEL_53;
            }
            goto LABEL_54;
          }
          char v29 = v59;
          int v43 = v44;
          if (v55)
          {
            *(_DWORD *)buf = 138412290;
            long long v65 = v44;
            int v52 = "Duplicating a note received from the cloud because both devices didn't import the same legacy version: %@";
            goto LABEL_62;
          }
        }
LABEL_63:
        int64_t v5 = 3;
        goto LABEL_64;
      }
      if ((v25 & 1) == 0)
      {
        objc_super v8 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[ICNote(CloudKit) mergePolicyForRecord:](self);
        }
        int64_t v5 = 0;
LABEL_33:
        uint64_t v18 = v8;
LABEL_66:

        goto LABEL_67;
      }
    }
    else if (v6 | v7)
    {
      int v26 = 0;
      goto LABEL_16;
    }
    int64_t v5 = 0;
LABEL_68:

    goto LABEL_69;
  }
  int64_t v5 = 0;
LABEL_69:

  return v5;
}

- (void)deduplicateSelfAndCreateNewObjectFromRecord:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(ICNote *)self identifier];
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  [(ICNote *)self setIdentifier:v7];

  [(ICNote *)self setLegacyContentHashAtImport:0];
  [(ICNote *)self setLegacyImportDeviceIdentifier:0];
  [(ICNote *)self setLegacyModificationDateAtImport:0];
  [(ICCloudSyncingObject *)self setInCloud:0];
  [(ICCloudSyncingObject *)self clearServerRecords];
  [(ICCloudSyncingObject *)self unsafelyUpdateChangeCountWithReason:@"De-duplicated from record"];
  objc_super v8 = [(ICNote *)self account];
  objc_super v9 = [v8 identifier];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [(ICNote *)self managedObjectContext];
  uint64_t v12 = (void *)[v10 newCloudObjectForRecord:v4 accountID:v9 context:v11];

  id v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [(ICNote *)self identifier];
    int v15 = 138412546;
    uint64_t v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEFAULT, "De-duplicated note (%@) to new identifier (%@)", (uint8_t *)&v15, 0x16u);
  }
}

- (id)attachmentForWebThumbnail
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__36;
  uint64_t v12 = __Block_byref_object_dispose__36;
  id v13 = 0;
  uint64_t v3 = [(ICNote *)self attributedString];
  id v4 = [(ICNote *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ICNote_CloudKit__attachmentForWebThumbnail__block_invoke;
  v7[3] = &unk_1E64A4B18;
  void v7[4] = &v8;
  objc_msgSend(v3, "ic_enumerateAttachmentsInContext:usingBlock:", v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __45__ICNote_CloudKit__attachmentForWebThumbnail__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v10 = a2;
  uint64_t v8 = [v10 attachmentModel];
  int v9 = [v8 showThumbnailInNoteList];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a5 = 1;
  }
}

+ (BOOL)didShowExceededStorageQuotaAlertForNoteWithIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  uint64_t v6 = [v5 arrayForKey:@"ICDidShowExceededStorageQuotaAlertForNote"];

  LOBYTE(v5) = [v6 containsObject:v4];
  return (char)v5;
}

+ (void)setDidShowExceededStorageQuotaAlert:(BOOL)a3 forNoteWithIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 arrayForKey:@"ICDidShowExceededStorageQuotaAlertForNote"];
  uint64_t v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
  }
  id v10 = v9;

  int v11 = [v10 containsObject:v14];
  if (v4)
  {
    if (v11) {
      goto LABEL_10;
    }
    [v10 addObject:v14];
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    objc_msgSend(v10, "removeObjectAtIndex:", objc_msgSend(v10, "indexOfObject:", v14));
  }
  uint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v13 = (void *)[v10 copy];
  [v12 setObject:v13 forKey:@"ICDidShowExceededStorageQuotaAlertForNote"];

LABEL_10:
}

- (BOOL)isSearchIndexableNote
{
  return 1;
}

- (BOOL)isModernNote
{
  return 1;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 1;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)@"Modern";
}

- (unint64_t)searchResultType
{
  return 0;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 1;
}

- (NSString)folderManagedIdentifier
{
  id v2 = [(ICNote *)self folder];
  uint64_t v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)folderName
{
  id v2 = [(ICNote *)self folder];
  uint64_t v3 = [v2 localizedTitle];

  return (NSString *)v3;
}

- (NSString)folderNameForNoteList
{
  uint64_t v3 = [(ICNote *)self folderName];
  if ([(ICNote *)self isSharedViaICloudFolder]
    && [(ICNote *)self isDeletedOrInTrash])
  {
    BOOL v4 = [(ICNote *)self folder];
    id v5 = [v4 rootSharingFolder];
    uint64_t v6 = [v5 localizedTitle];

    uint64_t v3 = (void *)v6;
  }
  return (NSString *)v3;
}

- (NSString)accountName
{
  id v2 = [(ICNote *)self folder];
  uint64_t v3 = [v2 account];
  BOOL v4 = [v3 localizedName];

  return (NSString *)v4;
}

- (NSString)trimmedTitle
{
  uint64_t v2 = [(ICNote *)self title];
  uint64_t v3 = (void *)v2;
  BOOL v4 = &stru_1F1F2FFF8;
  if (v2) {
    BOOL v4 = (__CFString *)v2;
  }
  id v5 = v4;

  if ([(__CFString *)v5 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v7 = [(__CFString *)v5 stringByTrimmingCharactersInSet:v6];

    objc_msgSend(v7, "ic_whitespaceAndNewlineCoalescedString");
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSAttributedString)trimmedAttributedTitle
{
  uint64_t v2 = [(ICNote *)self attributedTitle];
  if ([v2 length])
  {
    uint64_t v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    BOOL v4 = objc_msgSend(v2, "ic_attributedStringByTrimmingCharactersInSet:", v3);

    uint64_t v2 = objc_msgSend(v4, "ic_whitespaceAndNewlineCoalescedAttributedString");
  }
  return (NSAttributedString *)v2;
}

- (BOOL)isHiddenFromIndexing
{
  if (([(ICNote *)self isDeleted] & 1) != 0
    || ([(ICNote *)self markedForDeletion] & 1) != 0
    || [(ICCloudSyncingObject *)self isUnsupported]
    || ([(ICNote *)self needsInitialFetchFromCloud] & 1) != 0)
  {
    return 1;
  }
  id v5 = [(ICNote *)self folder];
  uint64_t v6 = [v5 account];
  BOOL v3 = v6 == 0;

  return v3;
}

- (NSArray)authorsExcludingCurrentUser
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(ICCloudSyncingObject *)self serverShareCheckingParent];
  id v5 = [v4 participants];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v10 isCurrentUser] & 1) == 0)
        {
          int v11 = [v10 userIdentity];
          uint64_t v12 = [v11 nameComponents];

          if (v12) {
            [v3 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)searchableString
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(ICNote *)self uiAttributedString],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v4 = [(ICNote *)self attributedString];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x1E4F28B18]);
    }
    BOOL v3 = v6;
  }
  uint64_t v7 = [(ICNote *)self managedObjectContext];
  uint64_t v8 = objc_msgSend(v3, "ic_searchableStringInContext:", v7);

  return v8;
}

- (NSSet)noteCellKeyPaths
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"snippet", @"modificationDate", @"noteHasChanges", @"isSharedViaICloud", @"hasUnreadChanges", @"folder", @"serverShareData", @"preferredBackgroundType", @"isPinned", @"attachmentViewType", 0);
}

- (int64_t)currentStatus
{
  if ([(ICNote *)self isPasswordProtected])
  {
    if ([(ICCloudSyncingObject *)self isAuthenticated]) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else if ([(ICCloudSyncingObject *)self isSharedViaICloud] {
         && ![(ICNote *)self isSharedViaICloudFolder])
  }
  {
    return 3;
  }
  else if ([(ICNote *)self isSharedViaICloudFolder])
  {
    return 4;
  }
  else
  {
    return 0;
  }
}

- (BOOL)isSharedViaICloudFolder
{
  BOOL v3 = [(ICCloudSyncingObject *)self isSharedViaICloud];
  if (v3) {
    LOBYTE(v3) = ![(ICCloudSyncingObject *)self isSharedRootObject];
  }
  return v3;
}

- (NSString)searchIndexingIdentifier
{
  uint64_t v2 = [(ICNote *)self objectID];
  BOOL v3 = [v2 URIRepresentation];
  BOOL v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  uint64_t v2 = [(ICNote *)self account];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
  BOOL v4 = [(ICCloudSyncingObject *)self creationDate];
  [v3 setContentCreationDate:v4];

  id v5 = [(ICCloudSyncingObject *)self modificationDate];
  [v3 setContentModificationDate:v5];

  id v6 = [(ICNote *)self title];
  [v3 setDisplayName:v6];

  return (CSSearchableItemAttributeSet *)v3;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  uint64_t v2 = self;
  v93[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ICNote *)self userActivityContentAttributeSet];
  [v3 setDataOwnerType:&unk_1F1F62B50];
  v93[0] = @"com.apple.notes.richtext";
  BOOL v4 = [(id)*MEMORY[0x1E4F443C0] identifier];
  v93[1] = v4;
  id v5 = [(id)*MEMORY[0x1E4F44538] identifier];
  void v93[2] = v5;
  id v6 = [(id)*MEMORY[0x1E4F443F0] identifier];
  v93[3] = v6;
  uint64_t v7 = [(id)*MEMORY[0x1E4F444A0] identifier];
  v93[4] = v7;
  uint64_t v8 = [(id)*MEMORY[0x1E4F44510] identifier];
  v93[5] = v8;
  v93[6] = @"com.apple.notes.noteitemprovider";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:7];
  [v3 setProviderDataTypes:v9];

  uint64_t v69 = v3;
  __int16 v70 = v2;
  if (([(ICNote *)v2 isPasswordProtected] & 1) == 0)
  {
    id v10 = [(ICNote *)v2 searchableString];
    int v11 = [v10 string];
    uint64_t v12 = (void *)[v11 mutableCopy];

    __int16 v68 = v10;
    __int16 v66 = [MEMORY[0x1E4F83798] titleForAttributedContent:v10 truncated:0 attributedTitleIfNecessary:0];
    id v13 = objc_msgSend(MEMORY[0x1E4F83798], "stringByRemovingTitle:fromString:");
    uint64_t v14 = [MEMORY[0x1E4F83798] snippetForContent:v13];

    long long v65 = (void *)v14;
    [v3 setContentDescription:v14];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v15 = [(ICNote *)v2 attachments];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v85 objects:v92 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v86 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = [*(id *)(*((void *)&v85 + 1) + 8 * i) attachmentModel];
          uint64_t v21 = [v20 additionalIndexableTextContentInNote];

          if (v21) {
            [v12 appendString:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v85 objects:v92 count:16];
      }
      while (v17);
    }

    __int16 v67 = v12;
    [v3 setTextContent:v12];
    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    BOOL v23 = [(ICNote *)v70 attachments];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v82 != v26) {
            objc_enumerationMutation(v23);
          }
          int v28 = *(void **)(*((void *)&v81 + 1) + 8 * j);
          char v29 = [v28 typeUTI];

          if (v29)
          {
            uint64_t v30 = (void *)MEMORY[0x1E4F442D8];
            id v31 = [v28 typeUTI];
            objc_super v32 = [v30 typeWithIdentifier:v31];
            uint64_t v33 = [v32 supertypes];
            char v34 = objc_msgSend(v33, "ic_map:", &__block_literal_global_71);

            [v22 unionSet:v34];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v81 objects:v91 count:16];
      }
      while (v25);
    }

    if ([v22 count])
    {
      uint64_t v35 = [v22 allObjects];
      [v3 setAttachmentTypes:v35];
    }
    uint64_t v2 = v70;
  }
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v37 = [(ICNote *)v2 visibleInlineAttachments];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v78;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v78 != v40) {
          objc_enumerationMutation(v37);
        }
        id v42 = *(void **)(*((void *)&v77 + 1) + 8 * k);
        if ([v42 attachmentType] == 1)
        {
          int v43 = [v42 displayText];
          __int16 v44 = objc_msgSend(v43, "ic_hashtagDisplayText");

          __int16 v45 = [(ICNote *)v2 folder];
          int v46 = [v45 account];
          __int16 v47 = +[ICHashtag hashtagWithDisplayText:v44 account:v46 createIfNecessary:0];

          if (v47) {
            objc_msgSend(v36, "ic_addNonNilObject:", v44);
          }

          uint64_t v2 = v70;
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v77 objects:v90 count:16];
    }
    while (v39);
  }

  if ([v36 count])
  {
    int v48 = [v36 allObjects];
    [v69 setHashtags:v48];
  }
  [(ICNote *)v2 addShareParticipantsToAttributeSet:v69];
  [(ICCloudSyncingObject *)v2 addEmailAddressesAndPhoneNumbersToAttributeSet:v69];
  objc_msgSend(v69, "setIc_searchResultType:", 0);
  objc_msgSend(v69, "ic_populateValuesForSpecializedFields");
  objc_msgSend(v69, "setIc_isLocked:", -[ICNote isPasswordProtected](v2, "isPasswordProtected"));
  objc_msgSend(v69, "setIc_isShared:", -[ICCloudSyncingObject isSharedViaICloud](v2, "isSharedViaICloud"));
  if ([(ICNote *)v2 isPasswordProtected])
  {
    objc_msgSend(v69, "setIc_hasChecklists:", 0);
    objc_msgSend(v69, "setIc_hasTags:", 0);
    objc_msgSend(v69, "setIc_hasDrawings:", 0);
    objc_msgSend(v69, "setIc_hasScannedDocuments:", 0);
    objc_msgSend(v69, "setIc_hasAttachments:", 0);
  }
  else
  {
    __int16 v49 = [(ICNote *)v2 attributedString];
    uint64_t v50 = [v49 length];

    BOOL v51 = [(ICNote *)v2 attributedString];
    int v52 = ICTTAttributeNameParagraphStyle;
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __57__ICNote_SearchIndexableNote__searchableItemAttributeSet__block_invoke_2;
    v75[3] = &unk_1E64A72E0;
    id v53 = v69;
    id v76 = v53;
    objc_msgSend(v51, "enumerateAttribute:inRange:options:usingBlock:", v52, 0, v50, 0, v75);

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    int v54 = [(ICNote *)v2 visibleAttachments];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v71 objects:v89 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v72;
LABEL_40:
      uint64_t v58 = 0;
      while (1)
      {
        if (*(void *)v72 != v57) {
          objc_enumerationMutation(v54);
        }
        long long v59 = *(void **)(*((void *)&v71 + 1) + 8 * v58);
        if ([v59 attachmentType] == 10
          || [v59 attachmentType] == 9
          || [v59 attachmentType] == 13)
        {
          objc_msgSend(v53, "setIc_hasDrawings:", 1);
        }
        else
        {
          if ([v59 attachmentType] != 12
            && [v59 attachmentType]
            && [v59 attachmentType] != 1)
          {
            objc_msgSend(v53, "setIc_hasAttachments:", 1);
          }
          if ([v59 attachmentType] == 11
            || [v59 attachmentType] == 15)
          {
            objc_msgSend(v53, "setIc_hasScannedDocuments:", 1);
          }
        }
        if objc_msgSend(v53, "ic_hasDrawings") && (objc_msgSend(v53, "ic_hasScannedDocuments")) {
          break;
        }
        if (v56 == ++v58)
        {
          uint64_t v60 = [v54 countByEnumeratingWithState:&v71 objects:v89 count:16];
          uint64_t v56 = v60;
          if (v60) {
            goto LABEL_40;
          }
          break;
        }
      }
    }

    objc_msgSend(v53, "setIc_hasTags:", -[ICNote hasTags](v2, "hasTags"));
  }
  int v61 = [(ICNote *)v2 accountName];
  objc_msgSend(v69, "setIc_accountName:", v61);

  uint64_t v62 = [(ICNote *)v2 folderNameForNoteList];
  objc_msgSend(v69, "setIc_folderName:", v62);

  if (objc_opt_respondsToSelector())
  {
    char v63 = [(ICNote *)v2 searchableItemViewAttributeSet];
    [v69 addAttributesFromAttributeSet:v63];
  }
  if (objc_opt_respondsToSelector()) {
    [(ICNote *)v2 associateAppEntityWithSearchableItemAttributeSet:v69];
  }

  return (CSSearchableItemAttributeSet *)v69;
}

uint64_t __57__ICNote_SearchIndexableNote__searchableItemAttributeSet__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __57__ICNote_SearchIndexableNote__searchableItemAttributeSet__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 style] == 103)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIc_hasChecklists:", 1);
    *a5 = 1;
  }
}

- (void)addShareParticipantsToAttributeSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICCloudSyncingObject *)self serverShareCheckingParent];

  if (v5)
  {
    long long v15 = v4;
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(ICNote *)self authorsExcludingCurrentUser];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      uint64_t v11 = MEMORY[0x1E4F1CBF0];
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "ic_localizedNameWithDefaultFormattingStyle");
          if (v13)
          {
            uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F23810]) initWithDisplayName:v13 handles:v11 handleIdentifier:&stru_1F1F2FFF8];
            [v6 addObject:v14];
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v4 = v15;
    if ([v6 count]) {
      [v15 setAuthors:v6];
    }
  }
}

- (BOOL)hasTags
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(ICNote *)self visibleInlineAttachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 isHashtagAttachment])
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)additionalSearchIndexablesForChangedKeys:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"needsInitialFetchFromCloud", @"markedForDeletion", 0);
  int v7 = [v4 intersectsSet:v6];

  if (v7)
  {
    long long v8 = [(ICNote *)self attachments];
    long long v9 = (void *)[v8 copy];
    objc_msgSend(v5, "ic_addObjectsFromNonNilArray:", v9);
  }
  long long v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"folder", @"isSystemPaper", 0);
  int v11 = [v4 intersectsSet:v10];

  if (v11)
  {
    uint64_t v12 = [(ICNote *)self attachments];
    uint64_t v13 = objc_msgSend(v12, "ic_objectsPassingTest:", &__block_literal_global_70);

    if (v13)
    {
      [v5 unionSet:v13];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
      [v5 unionSet:v14];
    }
  }

  return v5;
}

uint64_t __72__ICNote_SearchIndexableNote__additionalSearchIndexablesForChangedKeys___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasSynapseLink];
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ICNote.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);
}

- (BOOL)objc_hasRecentExternalEdits
{
  uint64_t v2 = self;
  uint64_t v3 = ICCloudSyncingObject.editActivityEvents.getter();
  id v4 = v2;
  uint64_t v5 = sub_1C3CBE20C((uint64_t)v3, v4);
  swift_bridgeObjectRelease();

  id v6 = v4;
  uint64_t v7 = sub_1C3CBE6CC(v5, v6);
  swift_bridgeObjectRelease();

  uint64_t v8 = *(void *)(v7 + 16);
  swift_bridgeObjectRelease();
  return v8 != 0;
}

- (void)didRefresh:(void *)a1 .cold.1(void *a1)
{
  dispatch_queue_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Unable to fault %@ after being refreshed", v4, v5, v6, v7, v8);
}

- (void)didRefresh:(void *)a1 .cold.2(void *a1)
{
  dispatch_queue_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Faulted %@ after being refreshed", v4, v5, v6, v7, v8);
}

- (void)didRefresh:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, a2, v4, "Failed to manually fetch note data after refreshing %@", v5);
}

- (void)updateLastViewedTimestampWithCurrentTimestamp
{
  dispatch_queue_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Need to save last viewed timestamp on next save for %@", v4, v5, v6, v7, v8);
}

- (void)attachmentExceedsMaxSizeAllowed:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28B68] stringFromByteCount:v2 countStyle:0];
  uint64_t v4 = [MEMORY[0x1E4F28B68] stringFromByteCount:v1 countStyle:0];
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Attachment size (%@) is greater then our max (%@)", v5, 0x16u);
}

- (void)attachmentExceedsMaxSizeAllowed:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Adding a 0 byte attachment.", v2, v3, v4, v5, v6);
}

- (void)visibleTopLevelAttachmentsCount
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error fetching count of visible top level attachments via fetch request. Falling back to fetch attachment objects for count (%lu)", v2, v3, v4, v5, v6);
}

- (void)rangeForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, a3, (uint64_t)a3, "Cannot find attachment range because note is placeholder: %@", (uint8_t *)a2);
}

- (void)rangeForAttachment:.cold.2()
{
  OUTLINED_FUNCTION_4();
  *(_DWORD *)uint64_t v2 = 138412546;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(void *)(v2 + 14) = v4;
  _os_log_debug_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEBUG, "Attachment not found in note %@, %@", v5, 0x16u);
}

- (void)saveNoteData
{
  OUTLINED_FUNCTION_12();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_4_2() hash];
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Saving note data for %@: %lu", v4, v5, v6, v7, 2u);
}

- (void)setHostApplicationIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Setting host application identifier for note… {note: %@, identifier: %@}", v4, v5, v6, v7, 2u);
}

void __35__ICNote_markActivitySummaryViewed__block_invoke_cold_1(uint64_t a1)
{
  id v1 = [(id)OUTLINED_FUNCTION_14(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Marking activity summary viewed for note: %@", v4, v5, v6, v7, v8);
}

void __35__ICNote_markActivitySummaryViewed__block_invoke_cold_2(uint64_t a1)
{
  id v1 = [(id)OUTLINED_FUNCTION_14(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Tried marking activity summary viewed for unshared note: %@", v4, v5, v6, v7, v8);
}

void __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_1(uint64_t a1)
{
  id v1 = [(id)OUTLINED_FUNCTION_14(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Marking last activity recent updates viewed for note: %@", v4, v5, v6, v7, v8);
}

void __45__ICNote_markLastActivityRecentUpdatesViewed__block_invoke_cold_2(uint64_t a1)
{
  id v1 = [(id)OUTLINED_FUNCTION_14(a1) shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Tried marking last activity recent updates viewed for unshared note: %@", v4, v5, v6, v7, v8);
}

- (void)widgetSnippetByEnumeratingAttachments
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_1C3A61000, a2, v4, "Found a non-empty snippet on a locked note {note: %@}", v5);
}

- (void)regenerateTitle:(void *)a1 snippet:isNewNote:.cold.1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Skipping title and snippet regeneration because this note is a placeholder or contains placeholder block/inline attachments: %@", v4, v5, v6, v7, v8);
}

- (void)setFolder:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 identifier];
  uint64_t v7 = [a1 account];
  uint8_t v8 = [v7 identifier];
  long long v9 = [a2 identifier];
  long long v10 = [a2 account];
  int v11 = [v10 identifier];
  int v14 = 138413058;
  long long v15 = v6;
  OUTLINED_FUNCTION_11();
  long long v16 = v8;
  __int16 v17 = v12;
  long long v18 = v9;
  __int16 v19 = v12;
  uint64_t v20 = v13;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Setting folder (%@) account (%@) to note (%@) with previous account (%@)", (uint8_t *)&v14, 0x2Au);
}

- (void)setFolder:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [0 identifier];
  uint64_t v5 = [a1 account];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v10 = 138412802;
  int v11 = v4;
  OUTLINED_FUNCTION_11();
  __int16 v12 = v6;
  __int16 v13 = v8;
  uint64_t v14 = v9;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Setting nil folder on note (%@) with account (%@): %@", (uint8_t *)&v10, 0x20u);
}

- (void)setFolder:(NSObject *)a3 .cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 identifier];
  uint64_t v7 = [a2 identifier];
  __int16 v8 = [a2 folder];
  uint64_t v9 = [a2 folder];
  int v10 = [v9 identifier];
  int v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(a2, "isDeleted"));
  int v14 = 134219522;
  uint64_t v15 = a1;
  OUTLINED_FUNCTION_11();
  long long v16 = v6;
  __int16 v17 = 2048;
  long long v18 = a2;
  __int16 v19 = v12;
  uint64_t v20 = v7;
  __int16 v21 = 2048;
  uint64_t v22 = v8;
  __int16 v23 = v12;
  uint64_t v24 = v10;
  __int16 v25 = v12;
  uint64_t v26 = v13;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Setting folder[%p] (%@) on note[%p] (%@) with current folder[%p] (%@), isDeleted = %@", (uint8_t *)&v14, 0x48u);
}

- (void)updateDeviceReplicaIDsToUserIDIfNeeded
{
  id v1 = [a1 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Object needs initial fetch — not updating replica ID to user ID {objectID: %@}", v4, v5, v6, v7, v8);
}

void __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Note didn't have an identifier at this point, probably becuase it's already deleted. Not returning a paperCoherenceContextURL.", v1, 2u);
}

void __46__ICNote_Management__paperCoherenceContextURL__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Note didn't have an account at this point, probably becuase it's already deleted. Not returning a paperCoherenceContextURL.", v1, 2u);
}

void __72__ICNote_AttachmentManagement__addSynapseLinkAttachmentWithContentItem___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Failed to update location for Synapse link. Error: %@", v2, v3, v4, v5, v6);
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1169_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, a2, a3, "Finished adding media in background for %@", (uint8_t *)&v4);
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1169_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, a2, a3, "Adding media in background for %@", (uint8_t *)&v4);
}

void __63__ICNote_AttachmentManagement__addMediaToAttachment_withBlock___block_invoke_1171_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, a2, a3, "Save happened for adding media in background for %@", (uint8_t *)&v4);
}

@end