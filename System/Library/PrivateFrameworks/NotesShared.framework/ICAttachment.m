@interface ICAttachment
+ (BOOL)isPathExtensionSupportedForPasswordProtectedNotes:(id)a3;
+ (BOOL)isTypeUTISupportedForPasswordProtectedNotes:(id)a3;
+ (BOOL)isTypeUTISupportedInExtensions:(id)a3;
+ (BOOL)supportsNotesVersionTracking;
+ (BOOL)supportsUserSpecificRecords;
+ (BOOL)typeUTIIsDrawing:(id)a3;
+ (BOOL)typeUTIIsImage:(id)a3;
+ (BOOL)typeUTIIsInlineDrawing:(id)a3;
+ (BOOL)typeUTIIsPlayableAudio:(id)a3;
+ (BOOL)typeUTIIsPlayableMovie:(id)a3;
+ (BOOL)typeUTIIsSystemPaper:(id)a3;
+ (NSPredicate)predicateForAllPaperKitBackedAttachments;
+ (NSPredicate)predicateForOutdatedOrMissingHandwritingSummary;
+ (id)allAttachmentsInContext:(id)a3;
+ (id)attachmentIdentifiersForAccount:(id)a3;
+ (id)attachmentSectionSortOrder;
+ (id)attachmentTypeUTIsToHideFromAttachmentBrowser;
+ (id)defaultTitleForAttachmentType:(signed __int16)a3;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fallbackImageContainerURLForIdentifier:(id)a3 account:(id)a4;
+ (id)fallbackImageEncryptedFallbackURLForIdentifier:(id)a3 account:(id)a4;
+ (id)fallbackImageFallbackURLForIdentifier:(id)a3 account:(id)a4;
+ (id)fallbackImageUTI;
+ (id)fallbackPDFContainerURLForIdentifier:(id)a3 account:(id)a4;
+ (id)fallbackPDFEncryptedFallbackURLForIdentifier:(id)a3 account:(id)a4;
+ (id)fallbackPDFFallbackURLForIdentifier:(id)a3 account:(id)a4;
+ (id)fallbackPDFUTI;
+ (id)filenameExtensionForUTI:(id)a3;
+ (id)filenameFromUTI:(id)a3;
+ (id)isBeingEditedLocallyOnDeviceSet;
+ (id)keyPathsForValuesAffectingIsSharedViaICloud;
+ (id)keyPathsForValuesAffectingParentCloudObject;
+ (id)mentionNotificationSnippetForAttachmentType:(signed __int16)a3;
+ (id)mergeableWallClockValueKeyPaths;
+ (id)mimeTypeFromUTI:(id)a3;
+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)newFetchRequestForAttachments;
+ (id)noteFromAttachmentRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)noteFromAttachmentUserSpecificRecord:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)predicateForAttachmentBrowserWithContext:(id)a3;
+ (id)predicateForInlineDrawing;
+ (id)predicateForPasswordProtected:(BOOL)a3;
+ (id)predicateForSearchableAttachmentsInContext:(id)a3;
+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3;
+ (id)predicateForVisibleAttachmentsWithTypeUTI:(id)a3 inContext:(id)a4;
+ (id)temporaryPaperBundleURLForIdentifier:(id)a3 account:(id)a4;
+ (signed)sectionFromTypeUTI:(id)a3 url:(id)a4;
+ (unint64_t)countOfAttachmentsMatchingPredicate:(id)a3 context:(id)a4;
+ (void)addPreviewImages:(id)a3 toRecord:(id)a4;
+ (void)deleteAttachment:(id)a3;
+ (void)enumerateAttachmentsInContext:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 usingBlock:(id)a7;
+ (void)initialize;
+ (void)purgeAttachment:(id)a3;
+ (void)purgeAttachmentFilesForIdentifiers:(id)a3 account:(id)a4;
+ (void)purgeHandwritingSummariesInContext:(id)a3;
+ (void)undeleteAttachment:(id)a3;
- (BOOL)checkPreviewImagesIntegrity;
- (BOOL)hasAllMandatoryFields;
- (BOOL)hasAnyPNGPreviewImageFiles;
- (BOOL)hasCroppingQuad;
- (BOOL)hasDeepLink;
- (BOOL)hasFallbackImage;
- (BOOL)hasFallbackPDF;
- (BOOL)hasImageFilterType;
- (BOOL)hasMetadata;
- (BOOL)hasOrientation;
- (BOOL)hasSynapseLink;
- (BOOL)hasVisibleInlineAttachments;
- (BOOL)isAppStore;
- (BOOL)isAudio;
- (BOOL)isBeingEditedLocallyOnDevice;
- (BOOL)isChildOfDocumentGallery;
- (BOOL)isDeletedOrInTrash;
- (BOOL)isDrawing;
- (BOOL)isEncryptableKeyBinaryData:(id)a3;
- (BOOL)isFolder;
- (BOOL)isHiddenFromIndexing;
- (BOOL)isHiddenFromSearch;
- (BOOL)isImage;
- (BOOL)isInICloudAccount;
- (BOOL)isInNoteTitleOrSnippet;
- (BOOL)isLoadingFromCloud;
- (BOOL)isMap;
- (BOOL)isMovable;
- (BOOL)isNews;
- (BOOL)isPencilKitDrawing;
- (BOOL)isPodcasts;
- (BOOL)isReadOnly;
- (BOOL)isScannedDocument;
- (BOOL)isSettingMergeableData;
- (BOOL)isTable;
- (BOOL)isURL;
- (BOOL)isUnsupported;
- (BOOL)isVisibleTable;
- (BOOL)isiTunes;
- (BOOL)locationNeedsUpdate;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6;
- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6 newAttachment:(BOOL)a7;
- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4;
- (BOOL)needsToBePushedToCloud;
- (BOOL)needsToBeRequested;
- (BOOL)preferLocalPreviewImages;
- (BOOL)previewsSupportMultipleAppearances;
- (BOOL)processFallbackAsset:(id)a3 fallbackAssetType:(int64_t)a4;
- (BOOL)saveToArchive:(void *)a3 dataPersister:(id)a4 stripImageMarkupMetadata:(BOOL)a5 error:(id *)a6;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (BOOL)shouldEmbedMarkupDataInMedia;
- (BOOL)shouldShowInContentInfoText;
- (BOOL)shouldShowInlineFormFillingBanner;
- (BOOL)shouldSyncMinimumSupportedNotesVersion;
- (BOOL)showsLoadingPlaceholder;
- (BOOL)supportsDeletionByTTL;
- (BOOL)supportsEncryptedValuesDictionary;
- (BOOL)supportsPhotosProcessing;
- (BOOL)supportsQuickLook;
- (BOOL)supportsRenaming;
- (BOOL)supportsSavingAttachmentToExternalFile;
- (BOOL)suppressesFileDeletion;
- (BOOL)wantsUserSpecificRecord;
- (BOOL)writeFallbackImageData:(id)a3;
- (BOOL)writeFallbackPDFData:(id)a3;
- (CGRect)bounds;
- (CGSize)intrinsicContentSize;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (ICAssetGenerationManager)fallbackImageGenerationManager;
- (ICAssetGenerationManager)fallbackPDFGenerationManager;
- (NSArray)authorsExcludingCurrentUser;
- (NSData)linkPresentationArchivedMetadata;
- (NSData)markupModelData;
- (NSData)mergeableData;
- (NSData)metadataData;
- (NSData)synapseData;
- (NSDictionary)metadata;
- (NSSet)visibleInlineAttachments;
- (NSString)accessibilityDescriptionForType;
- (NSString)additionalIndexableText;
- (NSString)dataSourceIdentifier;
- (NSString)description;
- (NSString)fallbackSubtitleIOS;
- (NSString)fallbackSubtitleMac;
- (NSString)fallbackTitle;
- (NSString)handwritingSummary;
- (NSString)imageClassificationSummary;
- (NSString)ocrSummary;
- (NSString)quotedText;
- (NSString)recordType;
- (NSString)searchDomainIdentifier;
- (NSString)searchIndexingIdentifier;
- (NSString)summary;
- (NSString)title;
- (NSString)urlString;
- (NSString)userTitle;
- (NSURL)URL;
- (NSURL)fileURL;
- (NSURL)remoteFileURL;
- (double)sizeHeight;
- (double)sizeWidth;
- (id)_accessibilityDescriptionForGenericType;
- (id)addInlineAttachmentWithIdentifier:(id)a3;
- (id)addLocationWithLatitude:(double)a3 longitude:(double)a4;
- (id)addMediaWithData:(id)a3 filename:(id)a4;
- (id)addMediaWithData:(id)a3 filename:(id)a4 updateFileBasedAttributes:(BOOL)a5;
- (id)addMediaWithFileWrapper:(id)a3;
- (id)addMediaWithURL:(id)a3;
- (id)addMediaWithURL:(id)a3 updateFileBasedAttributes:(BOOL)a4;
- (id)attachmentModel;
- (id)attachmentPreviewImageCreatingIfNecessaryWithWidth:(double)a3 height:(double)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8;
- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4;
- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5;
- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5 matchScale:(BOOL)a6 matchAppearance:(BOOL)a7;
- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5 requireAppearance:(BOOL)a6;
- (id)audioModel;
- (id)childCloudObjects;
- (id)childCloudObjectsForMinimumSupportedVersionPropagation;
- (id)cryptoStrategyProtocol;
- (id)dataForTypeIdentifier:(id)a3;
- (id)defaultTitle;
- (id)drawingModel;
- (id)fallbackImageData;
- (id)fallbackImageEncryptedURL;
- (id)fallbackImageURL;
- (id)fallbackPDFData;
- (id)fallbackPDFEncryptedURL;
- (id)fallbackPDFURL;
- (id)fileSizeString;
- (id)fileURLForTypeIdentifier:(id)a3;
- (id)galleryModel;
- (id)ic_loggingValues;
- (id)inlineDrawingModel;
- (id)inlineFormFillingDismissalCountForAllDevices;
- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4;
- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3;
- (id)mergeDecryptedValue:(id)a3 withOldValue:(id)a4 forKey:(id)a5;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)paperBundleAssetsSubdirectoryURL;
- (id)paperBundleDatabaseSubdirectoryURL;
- (id)paperBundleModel;
- (id)paperBundleURL;
- (id)paperCoherenceContextURL;
- (id)parentAttachmentFromRecord:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)parentEncryptableObject;
- (id)previewItemTitle;
- (id)previewItemURL;
- (id)recordZoneName;
- (id)searchableTextContent;
- (id)searchableTextContentWithoutTitle;
- (id)synapseBasedMetadata;
- (id)systemPaperModel;
- (id)tableModel;
- (id)temporaryPaperBundleURL;
- (id)unsupportedAttachmentSubtitle;
- (id)unsupportedAttachmentTitle;
- (id)updateAttachmentPreviewImageWithImageData:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8 sendNotification:(BOOL)a9;
- (id)updateAttachmentPreviewImageWithImageSrc:(CGImageSource *)a3 maxDimension:(double)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8 sendNotification:(BOOL)a9;
- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3;
- (int64_t)visibilityTestingType;
- (signed)attachmentType;
- (signed)preferredViewSize;
- (unint64_t)approximateArchiveSizeIncludingPreviews:(BOOL)a3;
- (unint64_t)inlineFormFillingBannerDismissalCountForDevice;
- (unint64_t)inlineFormFillingBannerDismissalCountForDeviceIdentifier:(id)a3;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (void)accountWillChangeToAccount:(id)a3;
- (void)addLocationIfNeeded;
- (void)addPaperBundleToRecordIfAppropriate:(id)a3;
- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3;
- (void)attachmentDidChange;
- (void)awakeFromFetch;
- (void)clearDecryptedData;
- (void)dealloc;
- (void)deleteAttachmentPreviewImages;
- (void)deleteFromLocalDatabase;
- (void)deserializeAndMergeValues:(id)a3;
- (void)didRefresh:(BOOL)a3;
- (void)didTurnIntoFault;
- (void)fixBrokenReferences;
- (void)fixMarkedForDeletionForScannedDocuments;
- (void)inlineFormFillingBannerWasDismissedByDeviceIdentifier:(id)a3;
- (void)inlineFormFillingBannerWasDismissedByUser;
- (void)invalidateAttachmentPreviewImages;
- (void)loadFromArchive:(const void *)a3 dataPersister:(id)a4 withIdentifierMap:(id)a5;
- (void)loadLinkPreviewForSynapseItem:(id)a3;
- (void)loadPreviewArchive:(const void *)a3 previewDataIdentifier:(id)a4 dataPersister:(id)a5;
- (void)markForDeletion;
- (void)mergeFallbackImageAndPDFFromRecord:(id)a3;
- (void)mergePaperBundleFromRecord:(id)a3;
- (void)metadata;
- (void)metadataData;
- (void)noteWillMoveToRecentlyDeletedFolder;
- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5;
- (void)persistPendingChanges;
- (void)prepareForDeletion;
- (void)purgeAttachmentPreviewImages;
- (void)recursivelyAddSubAttachments:(id)a3;
- (void)regenerateTitle;
- (void)regenerateTitleWithInferredTitle:(id)a3;
- (void)removeTemporaryPaperBundle;
- (void)resetPreferredViewSizeIfNecessary;
- (void)saveMergeableDataIfNeeded;
- (void)savePreview:(id)a3 toArchive:(void *)a4 previewDataIdentifier:(id)a5 dataPersister:(id)a6;
- (void)setAdditionalIndexableText:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFallbackSubtitleIOS:(id)a3;
- (void)setFallbackSubtitleMac:(id)a3;
- (void)setFallbackTitle:(id)a3;
- (void)setHandwritingSummary:(id)a3;
- (void)setImageClassificationSummary:(id)a3;
- (void)setImageFilterType:(signed __int16)a3;
- (void)setIsBeingEditedLocallyOnDevice:(BOOL)a3;
- (void)setLinkPresentationArchivedMetadata:(id)a3;
- (void)setMarkedForDeletion:(BOOL)a3;
- (void)setMarkupModelData:(id)a3;
- (void)setMergeableData:(id)a3;
- (void)setMergeablePreferredViewSize:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataData:(id)a3;
- (void)setNote:(id)a3;
- (void)setOcrSummary:(id)a3;
- (void)setOrientation:(signed __int16)a3;
- (void)setParentAttachment:(id)a3;
- (void)setPreferredViewSize:(signed __int16)a3;
- (void)setRemoteFileURL:(id)a3;
- (void)setSettingMergeableData:(BOOL)a3;
- (void)setSummary:(id)a3;
- (void)setSuppressesFileDeletion:(BOOL)a3;
- (void)setSynapseData:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTypeUTI:(id)a3;
- (void)setTypeUTI:(id)a3 resetToIntrinsicNotesVersion:(BOOL)a4;
- (void)setURL:(id)a3;
- (void)setUrlString:(id)a3;
- (void)setUserTitle:(id)a3;
- (void)suppressFileDeletion;
- (void)undeleteAttachmentPreviewImages;
- (void)unmarkForDeletion;
- (void)updateAfterMediaChange;
- (void)updateAttachmentMetadataWithBlock:(id)a3;
- (void)updateAttachmentSectionWithTypeUTI:(id)a3;
- (void)updateCombinedSummary;
- (void)updateMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3;
- (void)updateParentReferenceIfNecessary;
- (void)updatePlaceInLocationIfNeededHandler:(id)a3;
- (void)updatePreviewsFromRecord:(id)a3;
- (void)willRefresh:(BOOL)a3;
- (void)willSave;
- (void)willTurnIntoFault;
- (void)willUpdateDeviceReplicaIDsToNotesVersion:(int64_t)a3;
@end

@implementation ICAttachment

- (signed)attachmentType
{
  if ([(ICAttachment *)self isUnsupported])
  {
    signed __int16 attachmentType = 1;
  }
  else
  {
    signed __int16 attachmentType = self->_attachmentType;
    if (attachmentType) {
      return attachmentType;
    }
    v5 = [(ICAttachment *)self typeUTI];

    if (!v5) {
      return self->_attachmentType;
    }
    v6 = [(ICAttachment *)self typeUTI];
    BOOL v7 = +[ICAttachment typeUTIIsImage:v6];

    if (v7)
    {
      signed __int16 attachmentType = 3;
    }
    else
    {
      v8 = [(ICAttachment *)self typeUTI];
      BOOL v9 = +[ICAttachment typeUTIIsPlayableAudio:v8];

      if (v9)
      {
        signed __int16 attachmentType = 4;
      }
      else
      {
        v10 = [(ICAttachment *)self typeUTI];
        BOOL v11 = +[ICAttachment typeUTIIsPlayableMovie:v10];

        if (v11)
        {
          signed __int16 attachmentType = 5;
        }
        else
        {
          v12 = (void *)MEMORY[0x1E4F442D8];
          v13 = [(ICAttachment *)self typeUTI];
          v14 = [v12 typeWithIdentifier:v13];
          int v15 = [v14 conformsToType:*MEMORY[0x1E4F44450]];

          if (v15)
          {
            signed __int16 attachmentType = 6;
          }
          else
          {
            v16 = [(ICAttachment *)self typeUTI];
            BOOL v17 = +[ICAttachment typeUTIIsInlineDrawing:v16];

            if (v17)
            {
              signed __int16 attachmentType = 10;
            }
            else
            {
              v18 = [(ICAttachment *)self typeUTI];
              BOOL v19 = +[ICAttachment typeUTIIsDrawing:v18];

              if (v19)
              {
                signed __int16 attachmentType = 9;
              }
              else
              {
                v20 = [(ICAttachment *)self typeUTI];
                int v21 = [v20 isEqualToString:@"com.apple.notes.gallery"];

                if (v21)
                {
                  signed __int16 attachmentType = 11;
                }
                else
                {
                  v22 = [(ICAttachment *)self typeUTI];
                  int v23 = [v22 isEqualToString:@"com.apple.notes.table"];

                  if (v23)
                  {
                    signed __int16 attachmentType = 12;
                  }
                  else
                  {
                    v24 = [(ICAttachment *)self typeUTI];
                    int v25 = [v24 isEqualToString:@"com.apple.paper"];

                    if (v25)
                    {
                      signed __int16 attachmentType = 13;
                    }
                    else
                    {
                      v26 = [(ICAttachment *)self typeUTI];
                      if ([v26 isEqualToString:@"com.apple.paper.doc"])
                      {
                      }
                      else
                      {
                        v27 = [(ICAttachment *)self typeUTI];
                        int v28 = [v27 isEqualToString:@"com.apple.paper.doc.pdf"];

                        if (!v28)
                        {
                          v29 = [(ICAttachment *)self typeUTI];
                          int v30 = [v29 isEqualToString:@"com.apple.paper.doc.scan"];

                          if (v30)
                          {
                            signed __int16 attachmentType = 15;
                          }
                          else if ([(ICAttachment *)self isURL])
                          {
                            if ([(ICAttachment *)self isMap]) {
                              signed __int16 attachmentType = 7;
                            }
                            else {
                              signed __int16 attachmentType = 8;
                            }
                          }
                          else
                          {
                            signed __int16 attachmentType = 2;
                          }
                          goto LABEL_3;
                        }
                      }
                      signed __int16 attachmentType = 14;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_3:
  self->_signed __int16 attachmentType = attachmentType;
  return attachmentType;
}

- (BOOL)isUnsupported
{
  v8.receiver = self;
  v8.super_class = (Class)ICAttachment;
  unsigned __int8 v3 = [(ICCloudSyncingObject *)&v8 isUnsupported];
  v4 = [(ICAttachment *)self typeUTI];
  if (v4)
  {
    v5 = [(ICAttachment *)self typeUTI];
    int v6 = !+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v3 | [(ICAttachment *)self isPasswordProtected] & v6;
}

+ (BOOL)isTypeUTISupportedForPasswordProtectedNotes:(id)a3
{
  id v3 = a3;
  if (isTypeUTISupportedForPasswordProtectedNotes__onceToken != -1) {
    dispatch_once(&isTypeUTISupportedForPasswordProtectedNotes__onceToken, &__block_literal_global_572);
  }
  if ([(id)isTypeUTISupportedForPasswordProtectedNotes__supportedTypeStrings containsObject:v3])
  {
    char v4 = 1;
  }
  else
  {
    v5 = +[ICUTType typeWithIdentifier:v3];
    int v6 = v5;
    if (v5)
    {
      BOOL v7 = (void *)isTypeUTISupportedForPasswordProtectedNotes__supportedTypes;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke_3;
      v9[3] = &unk_1E64A94A8;
      id v10 = v5;
      char v4 = objc_msgSend(v7, "ic_containsObjectPassingTest:", v9);
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

+ (BOOL)typeUTIIsImage:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    char v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    if ([v4 conformsToType:*MEMORY[0x1E4F44400]]
      && ([v3 isEqualToString:@"com.apple.drawing.2"] & 1) == 0)
    {
      int v5 = [v3 isEqualToString:@"com.apple.drawing"] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)typeUTIIsInlineDrawing:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    char v4 = +[ICUTType typeWithIdentifier:v3];
    int v5 = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.apple.drawing.2"];
    if ([v4 conformsToType:v5])
    {
      char v6 = 1;
    }
    else
    {
      BOOL v7 = +[ICUTType typeWithIdentifier:v3];
      objc_super v8 = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.apple.drawing"];
      char v6 = [v7 conformsToType:v8];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

uint64_t __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)setTypeUTI:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  v2 = [(ICAttachment *)self attachmentModel];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)attachmentModel
{
  double v3 = [(ICAttachment *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__ICAttachment_attachmentModel__block_invoke;
  v5[3] = &unk_1E64A4240;
  v5[4] = self;
  [v3 performBlockAndWait:v5];

  return self->_attachmentModel;
}

- (double)sizeWidth
{
  [(ICAttachment *)self willAccessValueForKey:@"sizeWidth"];
  double v3 = [(ICAttachment *)self primitiveValueForKey:@"sizeWidth"];
  [v3 doubleValue];
  double v5 = v4;

  [(ICAttachment *)self didAccessValueForKey:@"sizeWidth"];
  if (v5 == 0.0)
  {
    double v6 = [(ICAttachment *)self attachmentModel];
    int v7 = [v6 shouldUsePlaceholderBoundsIfNecessary];

    if (v7)
    {
      double v8 = [(ICAttachment *)self attachmentModel];
      [v8 placeholderWidth];
      double v5 = v9;
    }
  }
  return v5;
}

- (double)sizeHeight
{
  [(ICAttachment *)self willAccessValueForKey:@"sizeHeight"];
  double v3 = [(ICAttachment *)self primitiveValueForKey:@"sizeHeight"];
  [v3 doubleValue];
  double v5 = v4;

  [(ICAttachment *)self didAccessValueForKey:@"sizeHeight"];
  if (v5 == 0.0)
  {
    double v6 = [(ICAttachment *)self attachmentModel];
    int v7 = [v6 shouldUsePlaceholderBoundsIfNecessary];

    if (v7)
    {
      double v8 = [(ICAttachment *)self attachmentModel];
      [v8 placeholderHeight];
      double v5 = v9;
    }
  }
  return v5;
}

- (id)childCloudObjects
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(ICAttachment *)self media];

  if (v3)
  {
    double v4 = [(ICAttachment *)self media];
    v7[0] = v4;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

+ (BOOL)typeUTIIsSystemPaper:(id)a3
{
  return [a3 isEqualToString:@"com.apple.paper"];
}

uint64_t __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) conformsToType:a2];
}

- (NSData)markupModelData
{
  return (NSData *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"markupModelData"];
}

- (signed)preferredViewSize
{
  double v3 = [(ICAttachment *)self mergeablePreferredViewSize];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    double v5 = [ICTTMergeableWallClockValue alloc];
    double v6 = [(ICAttachment *)self mergeablePreferredViewSize];
    int v7 = [(ICTTMergeableWallClockValue *)v5 initWithData:v6];
  }
  else
  {
    int v7 = 0;
  }
  double v8 = [(ICTTMergeableWallClockValue *)v7 value];

  if (v8)
  {
    double v9 = [(ICTTMergeableWallClockValue *)v7 value];
    signed __int16 v10 = [v9 shortValue];
  }
  else
  {
    double v9 = [(ICAttachment *)self note];
    signed __int16 v10 = [v9 attachmentViewType];
  }
  signed __int16 v11 = v10;

  return v11;
}

- (void)didTurnIntoFault
{
  v4.receiver = self;
  v4.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v4 didTurnIntoFault];
  remoteFileURL = self->_remoteFileURL;
  self->_remoteFileURL = 0;
}

void __31__ICAttachment_attachmentModel__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  if (!v1[25])
  {
    uint64_t v3 = objc_msgSend(objc_alloc(+[ICAttachmentModel modelClassForAttachmentType:](ICAttachmentModel, "modelClassForAttachmentType:", objc_msgSend(v1, "attachmentType"))), "initWithAttachment:", *v2);
    objc_super v4 = (void *)*((void *)*v2 + 25);
    *((void *)*v2 + 25) = v3;

    v1 = *v2;
  }
  if ([v1 isFault])
  {
    if ([*v2 attachmentType] == 9)
    {
      double v5 = [*v2 identifier];

      if (v5)
      {
        double v6 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __31__ICAttachment_attachmentModel__block_invoke_cold_1(v2);
        }
      }
    }
  }
}

- (void)willTurnIntoFault
{
  [(ICAttachmentModel *)self->_attachmentModel attachmentWillTurnIntoFault];
  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  [(ICAttachment *)&v3 willTurnIntoFault];
}

- (void)dealloc
{
  attachmentModel = self->_attachmentModel;
  if (attachmentModel) {
    [(ICAttachmentModel *)attachmentModel attachmentIsDeallocating:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)ICAttachment;
  [(ICAttachment *)&v4 dealloc];
}

+ (void)initialize
{
  id v10 = [MEMORY[0x1E4F28E78] stringWithCapacity:26];
  char v2 = 112;
  uint64_t v3 = MEMORY[0x1E4F14390];
  uint64_t v4 = 1u;
  do
  {
    LOWORD(v5) = v2;
    int v6 = (unsigned __int16)v2;
    if (v2 < 0)
    {
      if (!__maskrune((unsigned __int16)v2, 0x100uLL)) {
        goto LABEL_9;
      }
      if (__maskrune((unsigned __int16)v5, 0x8000uLL)) {
        goto LABEL_5;
      }
    }
    else
    {
      int v7 = *(_DWORD *)(v3 + 4 * (unsigned __int16)v2 + 60);
      if ((v7 & 0x100) == 0) {
        goto LABEL_9;
      }
      if ((v7 & 0x8000) != 0)
      {
LABEL_5:
        int v5 = (v6 - 52) % 26 + 65;
        goto LABEL_9;
      }
    }
    int v5 = (v6 - 84) % 26 + 97;
LABEL_9:
    objc_msgSend(v10, "appendFormat:", @"%C", (unsigned __int16)v5);
    char v2 = aPbzNccyrVebapn[v4++];
  }
  while (v4 != 27);
  uint64_t v8 = [v10 copy];
  double v9 = (void *)ICAttachmentUTTypeDrawingLegacy;
  ICAttachmentUTTypeDrawingLegacy = v8;
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v3 awakeFromFetch];
  [(ICAttachmentModel *)self->_attachmentModel attachmentAwakeFromFetch];
  [(ICAssetGenerationManager *)self->_fallbackImageGenerationManager updateCurrentGeneration];
  [(ICAssetGenerationManager *)self->_fallbackPDFGenerationManager updateCurrentGeneration];
}

void __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke()
{
  id v14 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v14, "ic_addNonNilObject:", *MEMORY[0x1E4F44400]);
  objc_msgSend(v14, "ic_addNonNilObject:", *MEMORY[0x1E4F44410]);
  objc_msgSend(v14, "ic_addNonNilObject:", *MEMORY[0x1E4F444F8]);
  v0 = +[ICUTType typeWithIdentifier:@"com.apple.notes.sketch"];
  objc_msgSend(v14, "ic_addNonNilObject:", v0);

  v1 = +[ICUTType typeWithIdentifier:@"com.apple.notes.gallery"];
  objc_msgSend(v14, "ic_addNonNilObject:", v1);

  char v2 = +[ICUTType typeWithIdentifier:@"com.apple.notes.table"];
  objc_msgSend(v14, "ic_addNonNilObject:", v2);

  objc_super v3 = +[ICUTType typeWithIdentifier:@"com.apple.drawing"];
  objc_msgSend(v14, "ic_addNonNilObject:", v3);

  uint64_t v4 = +[ICUTType typeWithIdentifier:@"com.apple.drawing.2"];
  objc_msgSend(v14, "ic_addNonNilObject:", v4);

  int v5 = +[ICUTType typeWithIdentifier:@"com.apple.paper"];
  objc_msgSend(v14, "ic_addNonNilObject:", v5);

  int v6 = +[ICUTType typeWithIdentifier:@"com.apple.paper.doc.scan"];
  objc_msgSend(v14, "ic_addNonNilObject:", v6);

  int v7 = +[ICUTType typeWithIdentifier:@"com.apple.notes.inlinetextattachment.link"];
  objc_msgSend(v14, "ic_addNonNilObject:", v7);

  uint64_t v8 = +[ICUTType typeWithIdentifier:@"com.apple.notes.inlinetextattachment.calculateresult"];
  objc_msgSend(v14, "ic_addNonNilObject:", v8);

  double v9 = +[ICUTType typeWithIdentifier:@"com.apple.notes.inlinetextattachment.calculategraphexpression"];
  objc_msgSend(v14, "ic_addNonNilObject:", v9);

  uint64_t v10 = [v14 copy];
  signed __int16 v11 = (void *)isTypeUTISupportedForPasswordProtectedNotes__supportedTypes;
  isTypeUTISupportedForPasswordProtectedNotes__supportedTypes = v10;

  uint64_t v12 = objc_msgSend((id)isTypeUTISupportedForPasswordProtectedNotes__supportedTypes, "ic_compactMap:", &__block_literal_global_575);
  v13 = (void *)isTypeUTISupportedForPasswordProtectedNotes__supportedTypeStrings;
  isTypeUTISupportedForPasswordProtectedNotes__supportedTypeStrings = v12;
}

void __68__ICAttachment_Management__predicateForAllPaperKitBackedAttachments__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28F60];
  ICPaperKitBackedAttachmentUTTypes();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 predicateWithFormat:@"typeUTI IN %@", v3];
  char v2 = (void *)predicateForAllPaperKitBackedAttachments_predicate;
  predicateForAllPaperKitBackedAttachments_predicate = v1;
}

+ (id)predicateForPasswordProtected:(BOOL)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  int v5 = [v3 predicateWithFormat:@"isPasswordProtected == %@", v4];

  return v5;
}

void __75__ICAttachment_Management__predicateForOutdatedOrMissingHandwritingSummary__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v1 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"handwritingSummary == nil"];
  char v2 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"handwritingSummaryVersion < %d", 8, v1);
  v6[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v0 orPredicateWithSubpredicates:v3];
  int v5 = (void *)predicateForOutdatedOrMissingHandwritingSummary_predicate;
  predicateForOutdatedOrMissingHandwritingSummary_predicate = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fallbackPDFGenerationManager, 0);
  objc_storeStrong((id *)&self->_fallbackImageGenerationManager, 0);
  objc_storeStrong((id *)&self->_remoteFileURL, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_attachmentModel, 0);
}

- (void)updateMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(ICAttachment *)self typeUTI];

  if (v5)
  {
    id v6 = [(ICAttachment *)self attachmentModel];
    [v6 updateAttachmentMarkedForDeletionStateAttachmentIsInUse:v3];
  }
}

- (void)setTypeUTI:(id)a3 resetToIntrinsicNotesVersion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(ICAttachment *)self typeUTI];
  char v8 = [v7 isEqualToString:v6];

  if ((v8 & 1) == 0)
  {
    [(ICAttachment *)self willChangeValueForKey:@"typeUTI"];
    [(ICAttachment *)self setPrimitiveValue:v6 forKey:@"typeUTI"];
    [(ICAttachment *)self updateAttachmentSectionWithTypeUTI:v6];
    [(ICAttachment *)self didChangeValueForKey:@"typeUTI"];
    if (self->_attachmentModel)
    {
      double v9 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ICAttachment setTypeUTI:resetToIntrinsicNotesVersion:](self);
      }

      attachmentModel = self->_attachmentModel;
      self->_attachmentModel = 0;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    signed __int16 v11 = [(ICAttachment *)self subAttachments];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          BOOL v17 = [v16 typeUTI];
          [v16 updateAttachmentSectionWithTypeUTI:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    if (v4) {
      [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
    }
  }
}

+ (NSPredicate)predicateForOutdatedOrMissingHandwritingSummary
{
  if (predicateForOutdatedOrMissingHandwritingSummary_onceToken != -1) {
    dispatch_once(&predicateForOutdatedOrMissingHandwritingSummary_onceToken, &__block_literal_global_995);
  }
  char v2 = (void *)predicateForOutdatedOrMissingHandwritingSummary_predicate;
  return (NSPredicate *)v2;
}

+ (NSPredicate)predicateForAllPaperKitBackedAttachments
{
  if (predicateForAllPaperKitBackedAttachments_onceToken != -1) {
    dispatch_once(&predicateForAllPaperKitBackedAttachments_onceToken, &__block_literal_global_1003);
  }
  char v2 = (void *)predicateForAllPaperKitBackedAttachments_predicate;
  return (NSPredicate *)v2;
}

- (void)loadFromArchive:(const void *)a3 dataPersister:(id)a4 withIdentifierMap:(id)a5
{
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  id v190 = a4;
  v188 = a3;
  id v189 = a5;
  if (*((unsigned char *)a3 + 32))
  {
    id v8 = [NSString alloc];
    double v9 = (uint64_t *)*((void *)a3 + 5);
    if (*((char *)v9 + 23) < 0)
    {
      double v9 = (uint64_t *)*v9;
      uint64_t v10 = *(void *)(*((void *)a3 + 5) + 8);
    }
    else
    {
      uint64_t v10 = *((unsigned __int8 *)v9 + 23);
    }
    uint64_t v11 = [v8 initWithBytes:v9 length:v10 encoding:4];
    if (v189)
    {
      uint64_t v12 = [(ICAttachment *)self identifier];
      [v189 setObject:v12 forKeyedSubscript:v11];
    }
    v187 = (__CFString *)v11;
  }
  else
  {
    v187 = &stru_1F1F2FFF8;
  }
  if ((*((_DWORD *)a3 + 8) & 0x1000000) != 0) {
    uint64_t v13 = *((void *)a3 + 29);
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [(ICCloudSyncingObject *)self requireMinimumSupportedVersionAndPropagateToChildObjects:v13];
  if ((*((unsigned char *)a3 + 32) & 2) != 0)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    long long v18 = (uint64_t *)*((void *)a3 + 6);
    if (*((char *)v18 + 23) < 0)
    {
      long long v18 = (uint64_t *)*v18;
      uint64_t v19 = *(void *)(*((void *)a3 + 6) + 8);
    }
    else
    {
      uint64_t v19 = *((unsigned __int8 *)v18 + 23);
    }
    int v15 = (void *)[v17 initWithBytes:v18 length:v19];
    [(ICAttachment *)self setMergeableData:v15];
  }
  else
  {
    if (!v190) {
      goto LABEL_20;
    }
    int v15 = [NSString stringWithFormat:@"%@_%@", v187, @"mergeableData"];
    v16 = [v190 loadDataForIdentifier:v15];
    [(ICAttachment *)self setMergeableData:v16];
  }
LABEL_20:
  int v20 = *((_DWORD *)a3 + 8);
  if ((v20 & 4) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setSizeHeight:*((float *)a3 + 14)];
    int v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 8) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setSizeWidth:*((float *)a3 + 15)];
    int v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x800) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setOriginX:*((float *)a3 + 34)];
    int v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x1000) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setOriginY:*((float *)a3 + 35)];
    int v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x2000) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setOrientation:*((__int16 *)a3 + 80)];
    int v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x10) != 0)
  {
    id v21 = [NSString alloc];
    v22 = (uint64_t *)*((void *)a3 + 8);
    if (*((char *)v22 + 23) < 0)
    {
      v22 = (uint64_t *)*v22;
      uint64_t v23 = *(void *)(*((void *)a3 + 8) + 8);
    }
    else
    {
      uint64_t v23 = *((unsigned __int8 *)v22 + 23);
    }
    v24 = (void *)[v21 initWithBytes:v22 length:v23 encoding:4];
    [(ICAttachment *)self setSummary:v24];

    int v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x20) != 0)
  {
    id v25 = [NSString alloc];
    v26 = (uint64_t *)*((void *)a3 + 9);
    if (*((char *)v26 + 23) < 0)
    {
      v26 = (uint64_t *)*v26;
      uint64_t v27 = *(void *)(*((void *)a3 + 9) + 8);
    }
    else
    {
      uint64_t v27 = *((unsigned __int8 *)v26 + 23);
    }
    int v28 = (void *)[v25 initWithBytes:v26 length:v27 encoding:4];
    [(ICAttachment *)self setTitle:v28];
  }
  if ((*((unsigned char *)a3 + 36) & 4) != 0)
  {
    id v29 = [NSString alloc];
    int v30 = (uint64_t *)*((void *)a3 + 39);
    if (*((char *)v30 + 23) < 0)
    {
      int v30 = (uint64_t *)*v30;
      uint64_t v31 = *(void *)(*((void *)a3 + 39) + 8);
    }
    else
    {
      uint64_t v31 = *((unsigned __int8 *)v30 + 23);
    }
    v32 = (void *)[v29 initWithBytes:v30 length:v31 encoding:4];
    [(ICAttachment *)self setUserTitle:v32];
  }
  unsigned int v33 = *((_DWORD *)a3 + 8);
  if ((v33 & 0x40) != 0)
  {
    id v34 = [NSString alloc];
    v35 = (uint64_t *)*((void *)a3 + 10);
    if (*((char *)v35 + 23) < 0)
    {
      v35 = (uint64_t *)*v35;
      uint64_t v36 = *(void *)(*((void *)a3 + 10) + 8);
    }
    else
    {
      uint64_t v36 = *((unsigned __int8 *)v35 + 23);
    }
    v37 = (void *)[v34 initWithBytes:v35 length:v36 encoding:4];
    [(ICAttachment *)self setTypeUTI:v37 resetToIntrinsicNotesVersion:0];

    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x80) != 0)
  {
    id v38 = [NSString alloc];
    v39 = (uint64_t *)*((void *)a3 + 11);
    if (*((char *)v39 + 23) < 0)
    {
      v39 = (uint64_t *)*v39;
      uint64_t v40 = *(void *)(*((void *)a3 + 11) + 8);
    }
    else
    {
      uint64_t v40 = *((unsigned __int8 *)v39 + 23);
    }
    v41 = (void *)[v38 initWithBytes:v39 length:v40 encoding:4];
    [(ICAttachment *)self setUrlString:v41];

    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x4000) != 0)
  {
    v42 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)a3 + 18)];
    [(ICAttachment *)self setPreviewUpdateDate:v42];

    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x8000) != 0)
  {
    v43 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)a3 + 19)];
    [(ICAttachment *)self setCreationDate:v43];

    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x10000) != 0)
  {
    v44 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)a3 + 21)];
    [(ICAttachment *)self setModificationDate:v44];

    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x20000) != 0)
  {
    id v45 = [NSString alloc];
    v46 = (uint64_t *)*((void *)a3 + 22);
    if (*((char *)v46 + 23) < 0)
    {
      v46 = (uint64_t *)*v46;
      uint64_t v47 = *(void *)(*((void *)a3 + 22) + 8);
    }
    else
    {
      uint64_t v47 = *((unsigned __int8 *)v46 + 23);
    }
    v48 = (void *)[v45 initWithBytes:v46 length:v47 encoding:4];
    v49 = [MEMORY[0x1E4F1CB10] URLWithString:v48];
    [(ICAttachment *)self setRemoteFileURL:v49];

    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x40000) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setCheckedForLocation:*((unsigned __int8 *)a3 + 164)];
    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x80000) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setFileSize:*((void *)a3 + 23)];
    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x100000) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setDuration:*((double *)a3 + 24)];
    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x200000) != 0)
  {
    uint64_t v14 = [(ICAttachment *)self setImageFilterType:*((__int16 *)a3 + 196)];
    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x400000) != 0)
  {
    id v52 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v53 = (uint64_t *)*((void *)a3 + 25);
    if (*((char *)v53 + 23) < 0)
    {
      v53 = (uint64_t *)*v53;
      uint64_t v54 = *(void *)(*((void *)a3 + 25) + 8);
    }
    else
    {
      uint64_t v54 = *((unsigned __int8 *)v53 + 23);
    }
    v50 = (void *)[v52 initWithBytes:v53 length:v54];
    [(ICAttachment *)self setMarkupModelData:v50];
    goto LABEL_81;
  }
  if (v190)
  {
    v50 = [NSString stringWithFormat:@"%@_%@", v187, @"markupModelData"];
    v51 = [v190 loadDataForIdentifier:v50];
    [(ICAttachment *)self setMarkupModelData:v51];

LABEL_81:
    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if (v33 >> 25 == 127 && (*((unsigned char *)a3 + 36) & 1) != 0)
  {
    [(ICAttachment *)self setCroppingQuadBottomLeftX:*((double *)a3 + 30)];
    [(ICAttachment *)self setCroppingQuadBottomLeftY:*((double *)a3 + 31)];
    [(ICAttachment *)self setCroppingQuadBottomRightX:*((double *)a3 + 32)];
    [(ICAttachment *)self setCroppingQuadBottomRightY:*((double *)a3 + 33)];
    [(ICAttachment *)self setCroppingQuadTopLeftX:*((double *)a3 + 34)];
    [(ICAttachment *)self setCroppingQuadTopLeftY:*((double *)a3 + 35)];
    [(ICAttachment *)self setCroppingQuadTopRightX:*((double *)a3 + 36)];
    uint64_t v14 = [(ICAttachment *)self setCroppingQuadTopRightY:*((double *)a3 + 37)];
    unsigned int v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x100) != 0)
  {
    uint64_t v55 = *((void *)a3 + 12);
    if (v55)
    {
      double v56 = *(double *)(v55 + 40);
    }
    else
    {
      v57 = (topotext::Attachment *)topotext::Attachment::default_instance((topotext::Attachment *)v14);
      uint64_t v55 = *((void *)a3 + 12);
      double v56 = *(double *)(*((void *)v57 + 12) + 40);
      if (!v55) {
        uint64_t v55 = *(void *)(topotext::Attachment::default_instance(v57) + 96);
      }
    }
    uint64_t v14 = (uint64_t)[(ICAttachment *)self addLocationWithLatitude:v56 longitude:*(double *)(v55 + 48)];
    uint64_t v58 = *((void *)a3 + 12);
    uint64_t v59 = v58;
    if (!v58)
    {
      uint64_t v14 = topotext::Attachment::default_instance((topotext::Attachment *)v14);
      uint64_t v59 = *(void *)(v14 + 96);
      uint64_t v58 = *((void *)a3 + 12);
    }
    if ((*(unsigned char *)(v59 + 32) & 8) != 0)
    {
      if (!v58) {
        uint64_t v58 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v14) + 96);
      }
      int v60 = *(unsigned __int8 *)(v58 + 64);
      v61 = [(ICAttachment *)self location];
      [v61 setPlaceUpdated:v60 != 0];

      uint64_t v58 = v188[12];
    }
    if (!v58)
    {
      uint64_t v14 = topotext::Attachment::default_instance((topotext::Attachment *)v14);
      uint64_t v58 = *(void *)(v14 + 96);
    }
    if ((*(unsigned char *)(v58 + 32) & 4) != 0)
    {
      v62 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v63 = v62;
      uint64_t v64 = v188[12];
      if (!v64)
      {
        v62 = (void *)topotext::Attachment::default_instance((topotext::Attachment *)v62);
        uint64_t v64 = v62[12];
      }
      v65 = *(uint64_t **)(v64 + 56);
      if (*((char *)v65 + 23) < 0) {
        v65 = (uint64_t *)*v65;
      }
      uint64_t v66 = v188[12];
      if (!v66) {
        uint64_t v66 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v62) + 96);
      }
      uint64_t v67 = *(void *)(v66 + 56);
      if (*(char *)(v67 + 23) < 0) {
        uint64_t v68 = *(void *)(v67 + 8);
      }
      else {
        uint64_t v68 = *(unsigned __int8 *)(v67 + 23);
      }
      v69 = (void *)[v63 initWithBytes:v65 length:v68];
      id v191 = 0;
      v70 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v69 error:&v191];
      id v71 = v191;
      if (v71)
      {
        v72 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          -[ICAttachment(ICAttachmentPersistenceAdditions) loadFromArchive:dataPersister:withIdentifierMap:]((uint64_t)v71, v72);
        }
      }
      objc_opt_class();
      v73 = [v70 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
      v74 = ICCheckedDynamicCast();
      v75 = [(ICAttachment *)self location];
      [v75 setPlacemark:v74];
    }
  }
  if ((*((unsigned char *)v188 + 33) & 2) != 0)
  {
    uint64_t v76 = v188[13];
    if (!v76) {
      uint64_t v76 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v14) + 104);
    }
    if ((*(unsigned char *)(v76 + 32) & 8) != 0)
    {
      v84 = [NSString alloc];
      v85 = v84;
      uint64_t v86 = v188[13];
      if (!v86)
      {
        v84 = (void *)topotext::Attachment::default_instance((topotext::Attachment *)v84);
        uint64_t v86 = v84[13];
      }
      v87 = *(uint64_t **)(v86 + 64);
      if (*((char *)v87 + 23) < 0) {
        v87 = (uint64_t *)*v87;
      }
      uint64_t v88 = v188[13];
      if (!v88) {
        uint64_t v88 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v84) + 104);
      }
      uint64_t v89 = *(void *)(v88 + 64);
      if (*(char *)(v89 + 23) < 0) {
        uint64_t v90 = *(void *)(v89 + 8);
      }
      else {
        uint64_t v90 = *(unsigned __int8 *)(v89 + 23);
      }
      v94 = (topotext::Attachment *)[v85 initWithBytes:v87 length:v90 encoding:4];
    }
    else
    {
      v77 = [NSString alloc];
      v78 = v77;
      uint64_t v79 = v188[13];
      if (!v79)
      {
        v77 = (void *)topotext::Attachment::default_instance((topotext::Attachment *)v77);
        uint64_t v79 = v77[13];
      }
      v80 = *(uint64_t **)(v79 + 40);
      if (*((char *)v80 + 23) < 0) {
        v80 = (uint64_t *)*v80;
      }
      uint64_t v81 = v188[13];
      if (!v81) {
        uint64_t v81 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v77) + 104);
      }
      uint64_t v82 = *(void *)(v81 + 40);
      if (*(char *)(v82 + 23) < 0) {
        uint64_t v83 = *(void *)(v82 + 8);
      }
      else {
        uint64_t v83 = *(unsigned __int8 *)(v82 + 23);
      }
      v91 = (topotext::Attachment *)[v78 initWithBytes:v80 length:v83 encoding:4];
      v92 = v91;
      uint64_t v93 = v188[13];
      if (!v93) {
        uint64_t v93 = *(void *)(topotext::Attachment::default_instance(v91) + 104);
      }
      if ((*(unsigned char *)(v93 + 32) & 2) != 0)
      {
        v95 = [NSString alloc];
        v96 = v95;
        uint64_t v97 = v188[13];
        if (!v97)
        {
          v95 = (void *)topotext::Attachment::default_instance((topotext::Attachment *)v95);
          uint64_t v97 = v95[13];
        }
        v98 = *(uint64_t **)(v97 + 48);
        if (*((char *)v98 + 23) < 0) {
          v98 = (uint64_t *)*v98;
        }
        uint64_t v99 = v188[13];
        if (!v99) {
          uint64_t v99 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v95) + 104);
        }
        uint64_t v100 = *(void *)(v99 + 48);
        if (*(char *)(v100 + 23) < 0) {
          uint64_t v101 = *(void *)(v100 + 8);
        }
        else {
          uint64_t v101 = *(unsigned __int8 *)(v100 + 23);
        }
        v102 = (void *)[v96 initWithBytes:v98 length:v101 encoding:4];
        v94 = [(topotext::Attachment *)v92 stringByAppendingPathExtension:v102];
      }
      else
      {
        v94 = v92;
      }
    }
    uint64_t v103 = [(topotext::Attachment *)v94 ic_sanitizedFilenameString];

    v105 = (void *)v103;
    uint64_t v106 = v188[13];
    if (!v106) {
      uint64_t v106 = *(void *)(topotext::Attachment::default_instance(v104) + 104);
    }
    if ((*(unsigned char *)(v106 + 32) & 4) != 0)
    {
      v109 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v110 = v109;
      uint64_t v111 = v188[13];
      if (!v111)
      {
        v109 = (void *)topotext::Attachment::default_instance((topotext::Attachment *)v109);
        uint64_t v111 = v109[13];
      }
      v112 = *(uint64_t **)(v111 + 56);
      if (*((char *)v112 + 23) < 0) {
        v112 = (uint64_t *)*v112;
      }
      uint64_t v113 = v188[13];
      if (!v113) {
        uint64_t v113 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v109) + 104);
      }
      uint64_t v114 = *(void *)(v113 + 56);
      if (*(char *)(v114 + 23) < 0) {
        uint64_t v115 = *(void *)(v114 + 8);
      }
      else {
        uint64_t v115 = *(unsigned __int8 *)(v114 + 23);
      }
      v108 = (void *)[v110 initWithBytes:v112 length:v115];
      if (!v108) {
        goto LABEL_173;
      }
    }
    else
    {
      if (!v190)
      {
        v108 = 0;
        goto LABEL_173;
      }
      v107 = [NSString stringWithFormat:@"%@_%@", v187, @"media"];
      v108 = [v190 loadDataForIdentifier:v107];

      if (!v108) {
        goto LABEL_173;
      }
    }
    if (v105)
    {
      v116 = [(ICAttachment *)self addMediaWithData:v108 filename:v105 updateFileBasedAttributes:0];
      os_log_t v117 = v116;
      Class isa = (Class)v188[13];
      if (!isa)
      {
        v116 = topotext::Attachment::default_instance((topotext::Attachment *)v116);
        Class isa = v116[13].isa;
      }
      if ((*((unsigned char *)isa + 32) & 0x10) != 0)
      {
        uint64_t v120 = v188[13];
        if (!v120) {
          uint64_t v120 = *(void *)(topotext::Attachment::default_instance((topotext::Attachment *)v116) + 104);
        }
        uint64_t v119 = *(void *)(v120 + 72);
      }
      else
      {
        uint64_t v119 = 0;
      }
      [v117 requireMinimumSupportedVersionAndPropagateToChildObjects:v119];
      goto LABEL_180;
    }
LABEL_173:
    os_log_t v117 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      v183 = [(ICCloudSyncingObject *)self ic_loggingIdentifier];
      uint64_t v184 = [v108 length];
      *(_DWORD *)buf = 138412802;
      v193 = v183;
      __int16 v194 = 2048;
      uint64_t v195 = v184;
      __int16 v196 = 2112;
      v197 = v105;
      _os_log_error_impl(&dword_1C3A61000, v117, OS_LOG_TYPE_ERROR, "Failed to unarchive media for attachment (%@) because either the data (%lu bytes) or filename (%@) were missing", buf, 0x20u);
    }
LABEL_180:
  }
  if (v190)
  {
    v121 = [NSString stringWithFormat:@"%@_fallbackImage", v187];
    v185 = [v190 loadDataForIdentifier:v121];
  }
  else
  {
    int v122 = *((_DWORD *)v188 + 9);
    if ((v122 & 8) == 0)
    {
      v185 = 0;
      if ((v122 & 0x100) == 0) {
        goto LABEL_201;
      }
      goto LABEL_195;
    }
    id v123 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v124 = (uint64_t *)v188[40];
    if (*((char *)v124 + 23) < 0)
    {
      v124 = (uint64_t *)*v124;
      uint64_t v125 = *(void *)(v188[40] + 8);
    }
    else
    {
      uint64_t v125 = *((unsigned __int8 *)v124 + 23);
    }
    uint64_t v14 = [v123 initWithBytes:v124 length:v125];
    v185 = (void *)v14;
  }
  if (v185) {
    uint64_t v14 = [(ICAttachment *)self writeFallbackImageData:v185];
  }
  if (v190)
  {
    v126 = [NSString stringWithFormat:@"%@_fallbackPDF", v187];
    v186 = [v190 loadDataForIdentifier:v126];

    goto LABEL_199;
  }
  if ((*((_DWORD *)v188 + 9) & 0x100) == 0) {
    goto LABEL_201;
  }
LABEL_195:
  id v127 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v128 = (uint64_t *)v188[47];
  if (*((char *)v128 + 23) < 0)
  {
    v128 = (uint64_t *)*v128;
    uint64_t v129 = *(void *)(v188[47] + 8);
  }
  else
  {
    uint64_t v129 = *((unsigned __int8 *)v128 + 23);
  }
  uint64_t v14 = [v127 initWithBytes:v128 length:v129];
  v186 = (void *)v14;
LABEL_199:
  if (v186)
  {
    uint64_t v14 = -[ICAttachment writeFallbackPDFData:](self, "writeFallbackPDFData:");
    goto LABEL_202;
  }
LABEL_201:
  v186 = 0;
LABEL_202:
  int v130 = *((_DWORD *)v188 + 9);
  if ((v130 & 2) != 0)
  {
    id v131 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v132 = (uint64_t *)v188[38];
    if (*((char *)v132 + 23) < 0)
    {
      v132 = (uint64_t *)*v132;
      uint64_t v133 = *(void *)(v188[38] + 8);
    }
    else
    {
      uint64_t v133 = *((unsigned __int8 *)v132 + 23);
    }
    v134 = (void *)[v131 initWithBytes:v132 length:v133];
    [(ICAttachment *)self setMetadataData:v134];

    int v130 = *((_DWORD *)v188 + 9);
  }
  if ((v130 & 0x10) != 0)
  {
    id v135 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v136 = (uint64_t *)v188[41];
    if (*((char *)v136 + 23) < 0)
    {
      v136 = (uint64_t *)*v136;
      uint64_t v137 = *(void *)(v188[41] + 8);
    }
    else
    {
      uint64_t v137 = *((unsigned __int8 *)v136 + 23);
    }
    v138 = (void *)[v135 initWithBytes:v136 length:v137];
    [(ICAttachment *)self setLinkPresentationArchivedMetadata:v138];
  }
  uint64_t v139 = *((unsigned int *)v188 + 30);
  if (v139)
  {
    for (uint64_t i = 0; i != v139; ++i)
    {
      v141 = [NSString stringWithFormat:@"%@_previewImage_%lu", v187, i];
      [(ICAttachment *)self loadPreviewArchive:google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::PreviewImage>::TypeHandler>((uint64_t)(v188 + 14), i) previewDataIdentifier:v141 dataPersister:v190];
    }
  }
  int v142 = *((_DWORD *)v188 + 54);
  if (v142)
  {
    for (int j = 0; j != v142; ++j)
    {
      v144 = (void *)MEMORY[0x1C877DB80](v14);
      v145 = [(ICAttachment *)self note];
      v146 = [MEMORY[0x1E4F29128] UUID];
      v147 = [v146 UUIDString];
      v148 = [v145 addAttachmentWithIdentifier:v147];

      [v148 setParentAttachment:self];
      [(ICAttachment *)self addSubAttachmentsObject:v148];
      objc_msgSend(v148, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>((uint64_t)(v188 + 26), j), v190, v189);
      [v148 updateChangeCountWithReason:@"Loaded subattachment from archive"];
      v149 = [v148 media];
      [v149 updateChangeCountWithReason:@"Loaded subattachment from archive"];
    }
  }
  v150 = [(ICAttachment *)self attachmentModel];
  [v150 updateAfterLoadWithSubAttachmentIdentifierMap:v189];

  v151 = [(ICAttachment *)self attachmentModel];
  [v151 updateFileBasedAttributes];

  int v152 = *((_DWORD *)v188 + 86);
  if (v152)
  {
    for (int k = 0; k != v152; ++k)
    {
      v154 = [(ICAttachment *)self note];
      v155 = [MEMORY[0x1E4F29128] UUID];
      v156 = [v155 UUIDString];
      v157 = [v154 addInlineAttachmentWithIdentifier:v156];

      [v157 setParentAttachment:self];
      [(ICAttachment *)self addInlineAttachmentsObject:v157];
      objc_msgSend(v157, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>((uint64_t)(v188 + 42), k), v190, v189);
      [v157 updateChangeCountWithReason:@"Loaded inline attachment from archive"];
    }
  }
  objc_opt_class();
  v158 = [(ICAttachment *)self attachmentModel];
  v159 = ICDynamicCast();

  if (v159)
  {
    if ((*((unsigned char *)v188 + 36) & 0x40) != 0)
    {
      id v162 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v163 = (uint64_t *)v188[45];
      if (*((char *)v163 + 23) < 0)
      {
        v163 = (uint64_t *)*v163;
        uint64_t v164 = *(void *)(v188[45] + 8);
      }
      else
      {
        uint64_t v164 = *((unsigned __int8 *)v163 + 23);
      }
      v161 = (void *)[v162 initWithBytes:v163 length:v164];
      if (!v161) {
        goto LABEL_233;
      }
    }
    else
    {
      if (!v190) {
        goto LABEL_233;
      }
      v160 = [NSString stringWithFormat:@"%@_%@", v187, @"systemPaperBundle"];
      v161 = [v190 loadDataForIdentifier:v160];

      if (!v161) {
        goto LABEL_233;
      }
    }
    v165 = NSTemporaryDirectory();
    v166 = [MEMORY[0x1E4F29128] UUID];
    v167 = [v166 UUIDString];
    v168 = [v165 stringByAppendingPathComponent:v167];

    v169 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v168];
    v170 = [v169 URLByAppendingPathExtension:@"zip"];
    v171 = [v170 path];
    LODWORD(v167) = [v161 writeToFile:v171 atomically:1];

    if (v167)
    {
      [v159 restorePaperBundleFromArchiveURL:v170 error:0];
      v172 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v172 removeItemAtURL:v170 error:0];
    }
  }
LABEL_233:
  int v173 = *((_DWORD *)v188 + 9);
  if ((v173 & 0x80) != 0)
  {
    id v174 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v175 = (uint64_t *)v188[46];
    if (*((char *)v175 + 23) < 0)
    {
      v175 = (uint64_t *)*v175;
      uint64_t v176 = *(void *)(v188[46] + 8);
    }
    else
    {
      uint64_t v176 = *((unsigned __int8 *)v175 + 23);
    }
    v177 = (void *)[v174 initWithBytes:v175 length:v176];
    [(ICAttachment *)self setSynapseData:v177];

    int v173 = *((_DWORD *)v188 + 9);
  }
  if ((v173 & 0x200) != 0)
  {
    id v178 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v179 = (uint64_t *)v188[48];
    if (*((char *)v179 + 23) < 0)
    {
      v179 = (uint64_t *)*v179;
      uint64_t v180 = *(void *)(v188[48] + 8);
    }
    else
    {
      uint64_t v180 = *((unsigned __int8 *)v179 + 23);
    }
    v181 = (void *)[v178 initWithBytes:v179 length:v180];
    [(ICAttachment *)self setMergeablePreferredViewSize:v181];

    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"Set preferred view size"];
  }
  v182 = [(ICAttachment *)self attachmentModel];
  [v182 updateAfterLoadWithInlineAttachmentIdentifierMap:v189];
}

- (void)loadPreviewArchive:(const void *)a3 previewDataIdentifier:(id)a4 dataPersister:(id)a5
{
  id v41 = a4;
  id v8 = a5;
  double v9 = v8;
  int v10 = *((_DWORD *)a3 + 8);
  if (v10) {
    double v11 = *((float *)a3 + 12);
  }
  else {
    double v11 = 1.0;
  }
  uint64_t v13 = (v10 & 2) == 0 || *((unsigned char *)a3 + 52) != 0;
  int v14 = *((_DWORD *)a3 + 17);
  double v15 = *MEMORY[0x1E4F1DB30];
  double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ((v10 & 4) != 0)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v19 = (uint64_t *)*((void *)a3 + 5);
    if (*((char *)v19 + 23) < 0)
    {
      uint64_t v19 = (uint64_t *)*v19;
      uint64_t v20 = *(void *)(*((void *)a3 + 5) + 8);
    }
    else
    {
      uint64_t v20 = *((unsigned __int8 *)v19 + 23);
    }
    CFDataRef v17 = (const __CFData *)[v18 initWithBytes:v19 length:v20];
  }
  else
  {
    if (!v8)
    {
      CFDataRef v21 = 0;
LABEL_23:
      LOBYTE(v23) = 1;
      goto LABEL_24;
    }
    CFDataRef v17 = [v8 loadDataForIdentifier:v41];
  }
  CFDataRef v21 = v17;
  if (!v17) {
    goto LABEL_23;
  }
  v22 = CGImageSourceCreateWithData(v17, 0);
  uint64_t v23 = v22;
  if (v22)
  {
    CFDictionaryRef v24 = CGImageSourceCopyPropertiesAtIndex(v22, 0, 0);
    CFDictionaryRef v25 = v24;
    if (v24)
    {
      unsigned int v40 = v13;
      v26 = [(__CFDictionary *)v24 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
      uint64_t v27 = self;
      [v26 doubleValue];
      double v15 = v28;
      id v29 = [(__CFDictionary *)v25 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
      [v29 doubleValue];
      double v16 = v30;

      self = v27;
      uint64_t v13 = v40;
    }
    CFRelease(v23);

    LOBYTE(v23) = 0;
  }
LABEL_24:
  if ((*((unsigned char *)a3 + 32) & 8) != 0)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    unsigned int v33 = (uint64_t *)*((void *)a3 + 7);
    if (*((char *)v33 + 23) < 0)
    {
      unsigned int v33 = (uint64_t *)*v33;
      uint64_t v34 = *(void *)(*((void *)a3 + 7) + 8);
    }
    else
    {
      uint64_t v34 = *((unsigned __int8 *)v33 + 23);
    }
    uint64_t v31 = (void *)[v32 initWithBytes:v33 length:v34];
    if (v23) {
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if (v23) {
      goto LABEL_37;
    }
  }
  v35 = -[ICAttachment updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:](self, "updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v21, v14 & ((char)v10 >> 7), v13, v31, 1, v15, v16, v11);
  uint64_t v36 = v35;
  if (!v35)
  {
LABEL_37:
    id v38 = 0;
    goto LABEL_38;
  }
  int v37 = *((_DWORD *)a3 + 8);
  if ((v37 & 0x10) != 0)
  {
    [v35 setVersion:*((__int16 *)a3 + 32)];
    int v37 = *((_DWORD *)a3 + 8);
  }
  if ((v37 & 0x20) != 0 && *((unsigned char *)a3 + 53))
  {
    id v38 = v36;
    [v36 setVersionOutOfDate:1];
  }
  else
  {
    id v38 = v36;
  }
LABEL_38:
  if ((*((_DWORD *)a3 + 8) & 0x40) != 0) {
    uint64_t v39 = *((void *)a3 + 9);
  }
  else {
    uint64_t v39 = 0;
  }
  [v38 requireMinimumSupportedVersionAndPropagateToChildObjects:v39];
}

- (BOOL)saveToArchive:(void *)a3 dataPersister:(id)a4 stripImageMarkupMetadata:(BOOL)a5 error:(id *)a6
{
  BOOL v208 = a5;
  uint64_t v238 = *MEMORY[0x1E4F143B8];
  id v213 = a4;
  v211 = self;
  id v8 = [(ICAttachment *)self identifier];

  if (v8)
  {
    id v9 = [(ICAttachment *)v211 identifier];
    [v9 UTF8String];
    *((_DWORD *)a3 + 8) |= 1u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 5) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  uint64_t v10 = [(ICAttachment *)v211 intrinsicNotesVersionForScenario:1];
  if (v10)
  {
    *((_DWORD *)a3 + 8) |= 0x1000000u;
    *((void *)a3 + 29) = v10;
  }
  double v11 = [(ICAttachment *)v211 attachmentModel];
  id v228 = 0;
  id v207 = [v11 mergeableDataForCopying:&v228];
  id v206 = v228;

  if (v207)
  {
    if (!v213
      || ([(ICAttachment *)v211 identifier],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [NSString stringWithFormat:@"%@_%@", v12, @"mergeableData"],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          (id)v12,
          LOBYTE(v12) = [v213 saveData:v207 identifier:v13],
          v13,
          (v12 & 1) == 0))
    {
      id v14 = v207;
      [v14 bytes];
      [v14 length];
      *((_DWORD *)a3 + 8) |= 2u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      if (*((void *)a3 + 6) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5C0]();
    }
  }
  [(ICAttachment *)v211 sizeHeight];
  if (v15 != 0.0)
  {
    [(ICAttachment *)v211 sizeHeight];
    *(float *)&double v16 = v16;
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 14) = LODWORD(v16);
  }
  [(ICAttachment *)v211 sizeWidth];
  if (v17 != 0.0)
  {
    [(ICAttachment *)v211 sizeWidth];
    *(float *)&double v18 = v18;
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 15) = LODWORD(v18);
  }
  [(ICAttachment *)v211 originX];
  if (v19 != 0.0)
  {
    [(ICAttachment *)v211 originX];
    *(float *)&double v20 = v20;
    *((_DWORD *)a3 + 8) |= 0x800u;
    *((_DWORD *)a3 + 34) = LODWORD(v20);
  }
  [(ICAttachment *)v211 originY];
  if (v21 != 0.0)
  {
    [(ICAttachment *)v211 originY];
    *(float *)&double v22 = v22;
    *((_DWORD *)a3 + 8) |= 0x1000u;
    *((_DWORD *)a3 + 35) = LODWORD(v22);
  }
  if ([(ICAttachment *)v211 orientation])
  {
    int v23 = [(ICAttachment *)v211 orientation];
    *((_DWORD *)a3 + 8) |= 0x2000u;
    *((_DWORD *)a3 + 40) = v23;
  }
  CFDictionaryRef v24 = [(ICAttachment *)v211 summary];
  BOOL v25 = v24 == 0;

  if (!v25)
  {
    id v26 = [(ICAttachment *)v211 summary];
    [v26 UTF8String];
    *((_DWORD *)a3 + 8) |= 0x10u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 8) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  uint64_t v27 = [(ICAttachment *)v211 title];
  BOOL v28 = v27 == 0;

  if (!v28)
  {
    id v29 = [(ICAttachment *)v211 title];
    [v29 UTF8String];
    *((_DWORD *)a3 + 8) |= 0x20u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 9) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  double v30 = [(ICAttachment *)v211 userTitle];
  BOOL v31 = v30 == 0;

  if (!v31)
  {
    id v32 = [(ICAttachment *)v211 userTitle];
    [v32 UTF8String];
    *((_DWORD *)a3 + 9) |= 4u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 39) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  unsigned int v33 = [(ICAttachment *)v211 typeUTI];
  BOOL v34 = v33 == 0;

  if (!v34)
  {
    id v35 = [(ICAttachment *)v211 typeUTI];
    [v35 UTF8String];
    *((_DWORD *)a3 + 8) |= 0x40u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 10) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  uint64_t v36 = [(ICAttachment *)v211 urlString];
  BOOL v37 = v36 == 0;

  if (!v37)
  {
    id v38 = [(ICAttachment *)v211 urlString];
    [v38 UTF8String];
    *((_DWORD *)a3 + 8) |= 0x80u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 11) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  uint64_t v39 = [(ICAttachment *)v211 previewUpdateDate];
  BOOL v40 = v39 == 0;

  if (!v40)
  {
    id v41 = [(ICAttachment *)v211 previewUpdateDate];
    [v41 timeIntervalSinceReferenceDate];
    *((_DWORD *)a3 + 8) |= 0x4000u;
    *((void *)a3 + 18) = v42;
  }
  v43 = [(ICCloudSyncingObject *)v211 creationDate];
  BOOL v44 = v43 == 0;

  if (!v44)
  {
    id v45 = [(ICCloudSyncingObject *)v211 creationDate];
    [v45 timeIntervalSinceReferenceDate];
    *((_DWORD *)a3 + 8) |= 0x8000u;
    *((void *)a3 + 19) = v46;
  }
  uint64_t v47 = [(ICCloudSyncingObject *)v211 modificationDate];
  BOOL v48 = v47 == 0;

  if (!v48)
  {
    v49 = [(ICCloudSyncingObject *)v211 modificationDate];
    [v49 timeIntervalSinceReferenceDate];
    *((_DWORD *)a3 + 8) |= 0x10000u;
    *((void *)a3 + 21) = v50;
  }
  v51 = [(ICAttachment *)v211 remoteFileURL];
  BOOL v52 = v51 == 0;

  if (!v52)
  {
    v53 = [(ICAttachment *)v211 remoteFileURL];
    id v54 = [v53 absoluteString];
    [v54 UTF8String];
    *((_DWORD *)a3 + 8) |= 0x20000u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 22) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();
  }
  if ([(ICAttachment *)v211 checkedForLocation])
  {
    char v55 = [(ICAttachment *)v211 checkedForLocation];
    *((_DWORD *)a3 + 8) |= 0x40000u;
    *((unsigned char *)a3 + 164) = v55;
  }
  if ([(ICAttachment *)v211 fileSize])
  {
    uint64_t v56 = [(ICAttachment *)v211 fileSize];
    *((_DWORD *)a3 + 8) |= 0x80000u;
    *((void *)a3 + 23) = v56;
  }
  [(ICAttachment *)v211 duration];
  if (v57 != 0.0)
  {
    [(ICAttachment *)v211 duration];
    *((_DWORD *)a3 + 8) |= 0x100000u;
    *((void *)a3 + 24) = v58;
  }
  if ([(ICAttachment *)v211 imageFilterType])
  {
    int v59 = [(ICAttachment *)v211 imageFilterType];
    *((_DWORD *)a3 + 8) |= 0x200000u;
    *((_DWORD *)a3 + 98) = v59;
  }
  int v60 = [(ICAttachment *)v211 markupModelData];
  BOOL v61 = [v60 length] == 0;

  if (!v61)
  {
    if (!v213) {
      goto LABEL_72;
    }
    v62 = [(ICAttachment *)v211 identifier];
    v63 = [NSString stringWithFormat:@"%@_%@", v62, @"markupModelData"];

    uint64_t v64 = [(ICAttachment *)v211 markupModelData];
    char v65 = [v213 saveData:v64 identifier:v63];

    if ((v65 & 1) == 0)
    {
LABEL_72:
      id v66 = [(ICAttachment *)v211 markupModelData];
      [v66 bytes];
      uint64_t v67 = [(ICAttachment *)v211 markupModelData];
      [v67 length];
      *((_DWORD *)a3 + 8) |= 0x400000u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      if (*((void *)a3 + 25) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5C0]();
    }
  }
  if ([(ICAttachment *)v211 hasCroppingQuad])
  {
    [(ICAttachment *)v211 croppingQuadBottomLeftX];
    *((_DWORD *)a3 + 8) |= 0x2000000u;
    *((void *)a3 + 30) = v68;
    [(ICAttachment *)v211 croppingQuadBottomLeftY];
    *((_DWORD *)a3 + 8) |= 0x4000000u;
    *((void *)a3 + 31) = v69;
    [(ICAttachment *)v211 croppingQuadBottomRightX];
    *((_DWORD *)a3 + 8) |= 0x8000000u;
    *((void *)a3 + 32) = v70;
    [(ICAttachment *)v211 croppingQuadBottomRightY];
    *((_DWORD *)a3 + 8) |= 0x10000000u;
    *((void *)a3 + 33) = v71;
    [(ICAttachment *)v211 croppingQuadTopLeftX];
    *((_DWORD *)a3 + 8) |= 0x20000000u;
    *((void *)a3 + 34) = v72;
    [(ICAttachment *)v211 croppingQuadTopLeftY];
    *((_DWORD *)a3 + 8) |= 0x40000000u;
    *((void *)a3 + 35) = v73;
    [(ICAttachment *)v211 croppingQuadTopRightX];
    *((_DWORD *)a3 + 8) |= 0x80000000;
    *((void *)a3 + 36) = v74;
    [(ICAttachment *)v211 croppingQuadTopRightY];
    *((_DWORD *)a3 + 9) |= 1u;
    *((void *)a3 + 37) = v75;
  }
  uint64_t v76 = [(ICAttachment *)v211 location];
  BOOL v77 = v76 == 0;

  if (!v77)
  {
    *((_DWORD *)a3 + 8) |= 0x100u;
    uint64_t v78 = *((void *)a3 + 12);
    if (!v78) {
      operator new();
    }
    uint64_t v79 = [(ICAttachment *)v211 location];
    [v79 latitude];
    *(_DWORD *)(v78 + 32) |= 1u;
    *(void *)(v78 + 40) = v80;

    uint64_t v81 = [(ICAttachment *)v211 location];
    [v81 longitude];
    *(_DWORD *)(v78 + 32) |= 2u;
    *(void *)(v78 + 48) = v82;

    uint64_t v83 = [(ICAttachment *)v211 location];
    char v84 = [v83 placeUpdated];
    *(_DWORD *)(v78 + 32) |= 8u;
    *(unsigned char *)(v78 + 64) = v84;

    v85 = [(ICAttachment *)v211 location];
    uint64_t v86 = [v85 placemark];
    BOOL v87 = v86 == 0;

    if (!v87)
    {
      uint64_t v88 = (void *)MEMORY[0x1E4F28DB0];
      uint64_t v89 = [(ICAttachment *)v211 location];
      uint64_t v90 = [v89 placemark];
      v91 = [v88 archivedDataWithRootObject:v90 requiringSecureCoding:1 error:0];

      id v92 = v91;
      [v92 bytes];
      [v92 length];
      *(_DWORD *)(v78 + 32) |= 4u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      if (*(void *)(v78 + 56) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5C0]();
    }
  }
  if ([(ICAttachment *)v211 hasFallbackImage])
  {
    uint64_t v93 = [(ICAttachment *)v211 fallbackImageData];
    if (!v213
      || ([(ICAttachment *)v211 identifier],
          uint64_t v94 = objc_claimAutoreleasedReturnValue(),
          [NSString stringWithFormat:@"%@_fallbackImage", v94],
          v95 = objc_claimAutoreleasedReturnValue(),
          (id)v94,
          LOBYTE(v94) = [v213 saveData:v93 identifier:v95],
          v95,
          (v94 & 1) == 0))
    {
      id v96 = v93;
      [v96 bytes];
      [v96 length];
      *((_DWORD *)a3 + 9) |= 8u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      if (*((void *)a3 + 40) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5C0]();
    }
  }
  if ([(ICAttachment *)v211 hasFallbackPDF])
  {
    uint64_t v97 = [(ICAttachment *)v211 fallbackPDFData];
    if (!v213
      || ([(ICAttachment *)v211 identifier],
          uint64_t v98 = objc_claimAutoreleasedReturnValue(),
          [NSString stringWithFormat:@"%@_fallbackPDF", v98],
          uint64_t v99 = objc_claimAutoreleasedReturnValue(),
          (id)v98,
          LOBYTE(v98) = [v213 saveData:v97 identifier:v99],
          v99,
          (v98 & 1) == 0))
    {
      id v100 = v97;
      [v100 bytes];
      [v100 length];
      *((_DWORD *)a3 + 9) |= 0x100u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      if (*((void *)a3 + 47) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5C0]();
    }
  }
  uint64_t v101 = [(ICAttachment *)v211 media];
  if (!v101) {
    goto LABEL_120;
  }
  v102 = [(ICAttachment *)v211 media];
  uint64_t v103 = [v102 identifier];
  BOOL v104 = v103 == 0;

  if (v104)
  {
LABEL_120:
    char v209 = 1;
    goto LABEL_143;
  }
  *((_DWORD *)a3 + 8) |= 0x200u;
  uint64_t v105 = *((void *)a3 + 13);
  if (!v105) {
    operator new();
  }
  uint64_t v106 = [(ICAttachment *)v211 media];
  id v107 = [v106 identifier];
  [v107 UTF8String];
  *(_DWORD *)(v105 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*(void *)(v105 + 40) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5B0]();

  v108 = [(ICAttachment *)v211 media];
  uint64_t v109 = [v108 intrinsicNotesVersionForScenario:1];

  if (v109)
  {
    *(_DWORD *)(v105 + 32) |= 0x10u;
    *(void *)(v105 + 72) = v109;
  }
  v110 = [(ICAttachment *)v211 media];
  uint64_t v111 = [v110 filename];
  BOOL v112 = v111 == 0;

  if (v112)
  {
    int v122 = [(ICAttachment *)v211 media];
    id v123 = [v122 identifier];
    [v123 UTF8String];
    *(_DWORD *)(v105 + 32) |= 8u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*(void *)(v105 + 64) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();

    uint64_t v120 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      v124 = [(ICAttachment *)v211 media];
      uint64_t v125 = objc_msgSend(v124, "ic_loggingIdentifier");
      -[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:](v125, v237, v120, v124);
    }
    uint64_t v119 = v120;
    goto LABEL_127;
  }
  uint64_t v113 = [(ICAttachment *)v211 media];
  id v114 = [v113 filename];
  [v114 UTF8String];
  *(_DWORD *)(v105 + 32) |= 8u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*(void *)(v105 + 64) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5B0]();

  uint64_t v115 = [(ICAttachment *)v211 media];
  v116 = [v115 filename];
  os_log_t v117 = [v116 pathExtension];
  BOOL v118 = v117 == 0;

  if (!v118)
  {
    uint64_t v119 = [(ICAttachment *)v211 media];
    uint64_t v120 = [v119 filename];
    id v121 = [v120 pathExtension];
    [v121 UTF8String];
    *(_DWORD *)(v105 + 32) |= 2u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*(void *)(v105 + 48) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5B0]();

LABEL_127:
  }
  v126 = [(ICAttachment *)v211 media];
  id v127 = [v126 dataWithoutImageMarkupMetadata:v208];

  if (!v127)
  {
    id v131 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      v132 = [(ICAttachment *)v211 media];
      uint64_t v133 = objc_msgSend(v132, "ic_loggingIdentifier");
      -[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:](v133, v232, v131, v132);
    }
    goto LABEL_141;
  }
  if (!v213
    || ([(ICAttachment *)v211 identifier],
        uint64_t v128 = objc_claimAutoreleasedReturnValue(),
        [NSString stringWithFormat:@"%@_%@", v128, @"media"],
        uint64_t v129 = objc_claimAutoreleasedReturnValue(),
        (id)v128,
        LOBYTE(v128) = [v213 saveData:v127 identifier:v129],
        v129,
        (v128 & 1) == 0))
  {
    if (!((unint64_t)[v127 length] >> 28))
    {
      id v130 = v127;
      [v130 bytes];
      [v130 length];
      *(_DWORD *)(v105 + 32) |= 4u;
      if (!google::protobuf::internal::empty_string_) {
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      }
      if (*(void *)(v105 + 56) == google::protobuf::internal::empty_string_) {
        operator new();
      }
      MEMORY[0x1C877D5C0]();
      goto LABEL_136;
    }
    id v131 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      v203 = [(ICAttachment *)v211 media];
      v204 = objc_msgSend(v203, "ic_loggingIdentifier");
      uint64_t v205 = [v127 length];
      *(_DWORD *)buf = 138412546;
      v234 = v204;
      __int16 v235 = 2048;
      uint64_t v236 = v205;
      _os_log_error_impl(&dword_1C3A61000, v131, OS_LOG_TYPE_ERROR, "Media (%@) is too large (%lu) to persist to protobuf", buf, 0x16u);
    }
LABEL_141:

    char v209 = 0;
    goto LABEL_142;
  }
LABEL_136:
  char v209 = 1;
LABEL_142:

LABEL_143:
  v134 = [(ICAttachment *)v211 metadataData];
  BOOL v135 = v134 == 0;

  if (!v135)
  {
    id v136 = [(ICAttachment *)v211 metadataData];
    [v136 bytes];
    uint64_t v137 = [(ICAttachment *)v211 metadataData];
    [v137 length];
    *((_DWORD *)a3 + 9) |= 2u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 38) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
  v138 = [(ICAttachment *)v211 linkPresentationArchivedMetadata];
  BOOL v139 = v138 == 0;

  if (!v139)
  {
    id v140 = [(ICAttachment *)v211 linkPresentationArchivedMetadata];
    [v140 bytes];
    v141 = [(ICAttachment *)v211 linkPresentationArchivedMetadata];
    [v141 length];
    *((_DWORD *)a3 + 9) |= 0x10u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 41) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
  long long v226 = 0u;
  long long v227 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  obuint64_t j = [(ICAttachment *)v211 previewImages];
  uint64_t v142 = [obj countByEnumeratingWithState:&v224 objects:v231 count:16];
  if (v142)
  {
    uint64_t v143 = 0;
    uint64_t v144 = *(void *)v225;
    do
    {
      for (uint64_t i = 0; i != v142; ++i)
      {
        if (*(void *)v225 != v144) {
          objc_enumerationMutation(obj);
        }
        uint64_t v146 = *(void *)(*((void *)&v224 + 1) + 8 * i);
        int v147 = *((_DWORD *)a3 + 31);
        uint64_t v148 = *((int *)a3 + 30);
        if ((int)v148 >= v147)
        {
          if (v147 == *((_DWORD *)a3 + 32)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 112, v147 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<topotext::PreviewImage>::New();
        }
        uint64_t v149 = *((void *)a3 + 14);
        *((_DWORD *)a3 + 30) = v148 + 1;
        uint64_t v150 = *(void *)(v149 + 8 * v148);
        v151 = [(ICAttachment *)v211 identifier];
        int v152 = [NSString stringWithFormat:@"%@_previewImage_%lu", v151, v143 + i];

        [(ICAttachment *)v211 savePreview:v146 toArchive:v150 previewDataIdentifier:v152 dataPersister:v213];
      }
      uint64_t v142 = [obj countByEnumeratingWithState:&v224 objects:v231 count:16];
      v143 += i;
    }
    while (v142);
  }

  long long v223 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  long long v220 = 0u;
  v153 = [(ICAttachment *)v211 subAttachments];
  uint64_t v154 = [v153 countByEnumeratingWithState:&v220 objects:v230 count:16];
  if (v154)
  {
    uint64_t v155 = *(void *)v221;
    do
    {
      for (uint64_t j = 0; j != v154; ++j)
      {
        if (*(void *)v221 != v155) {
          objc_enumerationMutation(v153);
        }
        v157 = *(void **)(*((void *)&v220 + 1) + 8 * j);
        if (([v157 markedForDeletion] & 1) == 0)
        {
          v158 = (void *)MEMORY[0x1C877DB80]();
          int v159 = *((_DWORD *)a3 + 55);
          uint64_t v160 = *((int *)a3 + 54);
          if ((int)v160 >= v159)
          {
            if (v159 == *((_DWORD *)a3 + 56)) {
              google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 208, v159 + 1);
            }
            google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
          }
          uint64_t v161 = *((void *)a3 + 26);
          *((_DWORD *)a3 + 54) = v160 + 1;
          uint64_t v162 = *(void *)(v161 + 8 * v160);
          id v219 = 0;
          char v163 = [v157 saveToArchive:v162 dataPersister:v213 stripImageMarkupMetadata:v208 error:&v219];
          id v164 = v219;
          char v209 = v163;
          if (a6 && v164) {
            *a6 = v164;
          }
        }
      }
      uint64_t v154 = [v153 countByEnumeratingWithState:&v220 objects:v230 count:16];
    }
    while (v154);
  }

  id v165 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v166 = [(ICAttachment *)v211 visibleInlineAttachments];
  v167 = [v166 allObjects];
  objc_msgSend(v165, "ic_addObjectsFromNonNilArray:", v167);

  v168 = [v206 allObjects];
  objc_msgSend(v165, "ic_addObjectsFromNonNilArray:", v168);

  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id v169 = v165;
  uint64_t v170 = [v169 countByEnumeratingWithState:&v215 objects:v229 count:16];
  if (v170)
  {
    uint64_t v171 = *(void *)v216;
    do
    {
      for (uint64_t k = 0; k != v170; ++k)
      {
        if (*(void *)v216 != v171) {
          objc_enumerationMutation(v169);
        }
        int v173 = *(void **)(*((void *)&v215 + 1) + 8 * k);
        uint64_t v174 = *((int *)a3 + 86);
        int v175 = *((_DWORD *)a3 + 87);
        if ((int)v174 >= v175)
        {
          if (v175 == *((_DWORD *)a3 + 88)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 336, v175 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
        }
        uint64_t v176 = *((void *)a3 + 42);
        *((_DWORD *)a3 + 86) = v174 + 1;
        uint64_t v177 = *(void *)(v176 + 8 * v174);
        id v214 = 0;
        [v173 saveToArchive:v177 dataPersister:v213 error:&v214];
        id v178 = v214;
        v179 = v178;
        if (a6 && v178) {
          *a6 = v178;
        }
      }
      uint64_t v170 = [v169 countByEnumeratingWithState:&v215 objects:v229 count:16];
    }
    while (v170);
  }

  objc_opt_class();
  uint64_t v180 = [(ICAttachment *)v211 attachmentModel];
  v181 = ICDynamicCast();

  if (v181)
  {
    v182 = [v181 archivePaperBundleToDiskWithError:a6];
    v183 = v182;
    if (!v182) {
      goto LABEL_207;
    }
    uint64_t v184 = (void *)MEMORY[0x1E4F1C9B8];
    v185 = [v182 path];
    v186 = [v184 dataWithContentsOfFile:v185];

    if (v186)
    {
      if (!v213
        || ([(ICAttachment *)v211 identifier],
            uint64_t v187 = objc_claimAutoreleasedReturnValue(),
            [NSString stringWithFormat:@"%@_%@", v187, @"systemPaperBundle"],
            v188 = objc_claimAutoreleasedReturnValue(),
            (id)v187,
            LOBYTE(v187) = [v213 saveData:v186 identifier:v188],
            v188,
            (v187 & 1) == 0))
      {
        id v189 = v186;
        [v189 bytes];
        [v189 length];
        *((_DWORD *)a3 + 9) |= 0x40u;
        if (!google::protobuf::internal::empty_string_) {
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        }
        if (*((void *)a3 + 45) == google::protobuf::internal::empty_string_) {
          operator new();
        }
        MEMORY[0x1C877D5C0]();
      }
    }
    id v190 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v190 removeItemAtURL:v183 error:0];

    if (!v186)
    {
LABEL_207:
      id v191 = os_log_create("com.apple.notes", "Archiving");
      if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
      {
        v192 = [(ICCloudSyncingObject *)v211 ic_loggingIdentifier];
        v193 = [v181 paperBundleURL];
        -[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:](v192, v193, buf, v191);
      }

      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:]" simulateCrash:1 showAlert:1 format:@"Failed to archive PaperKit bundle"];
      char v209 = 0;
    }
  }
  __int16 v194 = [(ICAttachment *)v211 synapseData];
  BOOL v195 = v194 == 0;

  if (!v195)
  {
    id v196 = [(ICAttachment *)v211 synapseData];
    [v196 bytes];
    v197 = [(ICAttachment *)v211 synapseData];
    [v197 length];
    *((_DWORD *)a3 + 9) |= 0x80u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 46) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
  uint64_t v198 = [(ICAttachment *)v211 mergeablePreferredViewSize];
  BOOL v199 = v198 == 0;

  if (!v199)
  {
    id v200 = [(ICAttachment *)v211 mergeablePreferredViewSize];
    [v200 bytes];
    v201 = [(ICAttachment *)v211 mergeablePreferredViewSize];
    [v201 length];
    *((_DWORD *)a3 + 9) |= 0x200u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a3 + 48) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
  return v209 & 1;
}

- (void)savePreview:(id)a3 toArchive:(void *)a4 previewDataIdentifier:(id)a5 dataPersister:(id)a6
{
  id v24 = a3;
  id v9 = a5;
  id v10 = a6;
  [v24 scale];
  *(float *)&double v11 = v11;
  *((_DWORD *)a4 + 8) |= 1u;
  *((_DWORD *)a4 + 12) = LODWORD(v11);
  char v12 = [v24 scaleWhenDrawing];
  *((_DWORD *)a4 + 8) |= 2u;
  *((unsigned char *)a4 + 52) = v12;
  int v13 = [v24 appearanceType];
  *((_DWORD *)a4 + 8) |= 0x80u;
  *((_DWORD *)a4 + 17) = v13;
  if ([v24 isPasswordProtected])
  {
    if (![v24 isAuthenticated]) {
      goto LABEL_4;
    }
    id v14 = [v24 decryptedImageData];
    if (!v14) {
      goto LABEL_4;
    }
  }
  else
  {
    double v16 = (void *)MEMORY[0x1E4F1C9B8];
    double v17 = [v24 previewImageURL];
    uint64_t v18 = [v16 dataWithContentsOfURL:v17];

    id v14 = (void *)v18;
    if (!v18)
    {
LABEL_4:
      id v15 = 0;
      goto LABEL_13;
    }
  }
  if (v10 && ([v10 saveData:v14 identifier:v9] & 1) != 0)
  {
    id v15 = v14;
  }
  else
  {
    id v15 = v14;
    [v15 bytes];
    [v15 length];
    *((_DWORD *)a4 + 8) |= 4u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a4 + 5) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
LABEL_13:
  double v19 = [v24 metadata];

  if (v19)
  {
    id v20 = [v24 metadata];
    [v20 bytes];
    double v21 = [v24 metadata];
    [v21 length];
    *((_DWORD *)a4 + 8) |= 8u;
    if (!google::protobuf::internal::empty_string_) {
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    }
    if (*((void *)a4 + 7) == google::protobuf::internal::empty_string_) {
      operator new();
    }
    MEMORY[0x1C877D5C0]();
  }
  if ([v24 version])
  {
    int v22 = [v24 version];
    *((_DWORD *)a4 + 8) |= 0x10u;
    *((_DWORD *)a4 + 16) = v22;
  }
  if ([v24 versionOutOfDate])
  {
    *((_DWORD *)a4 + 8) |= 0x20u;
    *((unsigned char *)a4 + 53) = 1;
  }
  uint64_t v23 = [v24 intrinsicNotesVersionForScenario:1];
  if (v23)
  {
    *((_DWORD *)a4 + 8) |= 0x40u;
    *((void *)a4 + 9) = v23;
  }
}

- (unint64_t)approximateArchiveSizeIncludingPreviews:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(ICAttachment *)self mergeableData];

  if (v4)
  {
    int v5 = [(ICAttachment *)self mergeableData];
    BOOL v4 = (char *)[v5 length];
  }
  id v6 = [(ICAttachment *)self media];
  if (v6
    && ([(ICAttachment *)self media],
        int v7 = objc_claimAutoreleasedReturnValue(),
        [v7 identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v6,
        v8))
  {
    id v9 = self;
    if (![(ICAttachment *)self fileSize])
    {
      id v10 = [(ICAttachment *)self attachmentModel];
      [v10 updateFileBasedAttributes];

      id v9 = self;
    }
    if ([(ICAttachment *)v9 fileSize])
    {
      v4 += [(ICAttachment *)v9 fileSize];
    }
    else if ([(ICAttachment *)v9 attachmentType] == 3)
    {
      [(ICAttachment *)v9 sizeWidth];
      double v32 = v31;
      [(ICAttachment *)v9 sizeHeight];
      BOOL v4 = (char *)((double)(unint64_t)v4 + v32 * v33 * 4.0);
    }
  }
  else
  {
    id v9 = self;
  }
  if (v3)
  {
    double v11 = [(ICAttachment *)v9 previewImages];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      obuint64_t j = [(ICAttachment *)self previewImages];
      uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v43;
        uint64_t v15 = *MEMORY[0x1E4F1C5F8];
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v43 != v14) {
              objc_enumerationMutation(obj);
            }
            double v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if ([v17 isPasswordProtected]) {
              [v17 encryptedPreviewImageURL];
            }
            else {
            uint64_t v18 = [v17 previewImageURL];
            }
            id v40 = 0;
            id v41 = 0;
            int v19 = [v18 getResourceValue:&v41 forKey:v15 error:&v40];
            id v20 = v41;
            id v21 = v40;
            int v22 = v21;
            if (v19) {
              v4 += [v20 unsignedIntegerValue];
            }
            else {
              NSLog(&cfstr_ErrorReadingAt.isa, v21);
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v13);
      }

      id v9 = self;
    }
    else
    {
      id v9 = self;
      if ([(ICAttachment *)self attachmentType] == 9)
      {
        +[ICDrawing defaultPixelSize];
        BOOL v4 = (char *)((double)(unint64_t)v4 + v23 * v24);
      }
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  BOOL v25 = [(ICAttachment *)v9 subAttachments];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(v25);
        }
        id v29 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        if ([v29 isVisible]) {
          v4 += [v29 approximateArchiveSizeIncludingPreviews:v3];
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v26);
  }

  return (unint64_t)v4;
}

- (id)synapseBasedMetadata
{
  BOOL v3 = [(ICAttachment *)self synapseData];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA9238]);
    int v5 = [(ICAttachment *)self synapseData];
    id v13 = 0;
    id v6 = (void *)[v4 initWithData:v5 error:&v13];
    id v7 = v13;

    if (v7)
    {
      id v8 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(ICAttachment(SearchLinkPresentation) *)(uint64_t)v6 synapseBasedMetadata];
      }

      id v9 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      double v16 = &v15;
      uint64_t v17 = 0x2050000000;
      id v10 = (void *)getLPLinkMetadataClass_softClass;
      uint64_t v18 = getLPLinkMetadataClass_softClass;
      if (!getLPLinkMetadataClass_softClass)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __getLPLinkMetadataClass_block_invoke;
        v14[3] = &unk_1E64A45A0;
        v14[4] = &v15;
        __getLPLinkMetadataClass_block_invoke((uint64_t)v14);
        id v10 = (void *)v16[3];
      }
      double v11 = v10;
      _Block_object_dispose(&v15, 8);
      id v9 = (void *)[[v11 alloc] _initWithSynapseContentItem:v6];
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (NSString)quotedText
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__20;
  double v11 = __Block_byref_object_dispose__20;
  id v12 = 0;
  BOOL v3 = [(ICAttachment *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__ICAttachment_SearchLinkPresentation__quotedText__block_invoke;
  void v6[3] = &unk_1E64A4528;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __50__ICAttachment_SearchLinkPresentation__quotedText__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) hasSynapseLink];
  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) synapseBasedMetadata];
    BOOL v3 = [v4 selectedText];
  }
  else
  {
    BOOL v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  if (v2)
  {
  }
}

- (NSString)recordType
{
  return (NSString *)@"Attachment";
}

- (id)recordZoneName
{
  return @"Notes";
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(a5) = [(ICAttachment *)self mergeCloudKitRecord:v12 accountID:v11 approach:a5 mergeableFieldState:v10 newAttachment:[(ICAttachment *)self needsInitialFetchFromCloud]];

  return a5;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6 newAttachment:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v169.receiver = self;
  v169.super_class = (Class)ICAttachment;
  BOOL v15 = [(ICCloudSyncingObject *)&v169 mergeCloudKitRecord:v12 accountID:v13 approach:a5 mergeableFieldState:v14];
  if (v15)
  {
    double v16 = [(ICAttachment *)self managedObjectContext];
    uint64_t v17 = [v12 recordID];
    uint64_t v18 = [v17 recordName];
    [(ICAttachment *)self setIdentifier:v18];

    int v19 = [v12 objectForKeyedSubscript:@"UTI"];
    if (v19) {
      goto LABEL_3;
    }
    id v21 = [v12 encryptedValues];
    int v22 = [v21 objectForKeyedSubscript:@"UTIEncrypted"];

    if (!v22) {
      goto LABEL_9;
    }
    int v19 = objc_msgSend(v22, "ic_stringValue");

    if (v19)
    {
LABEL_3:
      id v20 = [(ICAttachment *)self typeUTI];
      if ([v19 isEqual:v20]) {
        int v166 = 0;
      }
      else {
        int v166 = [v19 isEqual:@"com.apple.notes.gallery"];
      }

      [(ICAttachment *)self setTypeUTI:v19 resetToIntrinsicNotesVersion:0];
    }
    else
    {
LABEL_9:
      int v166 = 0;
    }
    double v23 = [(id)objc_opt_class() noteFromAttachmentRecord:v12 accountID:v13 context:v16];
    if (v23)
    {
      [(ICAttachment *)self setNote:v23];
      double v24 = [(ICAttachment *)self note];
      [v24 addAttachmentsObject:self];
    }
    uint64_t v25 = [(ICAttachment *)self parentAttachmentFromRecord:v12 accountID:v13 context:v16];
    if (v25) {
      [(ICAttachment *)self setParentAttachment:v25];
    }
    v167 = (void *)v25;
    uint64_t v26 = [(ICAttachment *)self attachmentModel];
    [v26 mergeMergeableDataFromCloudKitRecord:v12 approach:a5 mergeableFieldState:v14];

    if (a5) {
      goto LABEL_111;
    }
    if (a7 || [(ICAttachment *)self attachmentType] != 9)
    {
      uint64_t v27 = [v12 objectForKeyedSubscript:@"OriginX"];

      if (v27)
      {
        BOOL v28 = [v12 objectForKeyedSubscript:@"OriginX"];
        [v28 doubleValue];
        -[ICAttachment setOriginX:](self, "setOriginX:");
      }
      id v29 = [v12 objectForKeyedSubscript:@"OriginY"];

      if (v29)
      {
        double v30 = [v12 objectForKeyedSubscript:@"OriginY"];
        [v30 doubleValue];
        -[ICAttachment setOriginY:](self, "setOriginY:");
      }
      double v31 = [v12 objectForKeyedSubscript:@"Width"];

      if (v31)
      {
        double v32 = [v12 objectForKeyedSubscript:@"Width"];
        [v32 doubleValue];
        -[ICAttachment setSizeWidth:](self, "setSizeWidth:");
      }
      double v33 = [v12 objectForKeyedSubscript:@"Height"];

      if (v33)
      {
        BOOL v34 = [v12 objectForKeyedSubscript:@"Height"];
        [v34 doubleValue];
        -[ICAttachment setSizeHeight:](self, "setSizeHeight:");
      }
      id v35 = [v12 objectForKeyedSubscript:@"Orientation"];

      if (v35)
      {
        long long v36 = [v12 objectForKeyedSubscript:@"Orientation"];
        -[ICAttachment setOrientation:](self, "setOrientation:", (__int16)[v36 integerValue]);
      }
    }
    long long v37 = [v12 encryptedValues];
    long long v38 = [v37 objectForKeyedSubscript:@"URLStringEncrypted"];

    v158 = v38;
    int v159 = v23;
    if (v38)
    {
      long long v39 = objc_msgSend(v38, "ic_stringValue");
      id v40 = objc_msgSend(v39, "ic_substringToIndex:", 2047);
      [(ICAttachment *)self setUrlString:v40];
    }
    else
    {
      id v41 = [v12 objectForKeyedSubscript:@"URLString"];

      if (!v41) {
        goto LABEL_32;
      }
      objc_opt_class();
      long long v39 = [v12 objectForKeyedSubscript:@"URLString"];
      id v40 = ICDynamicCast();
      long long v42 = objc_msgSend(v40, "ic_substringToIndex:", 2047);
      [(ICAttachment *)self setUrlString:v42];
    }
LABEL_32:
    long long v43 = [v12 encryptedValues];
    long long v44 = [v43 objectForKeyedSubscript:@"TitleEncrypted"];

    if (v44)
    {
      uint64_t v45 = objc_msgSend(v44, "ic_stringValue");
    }
    else
    {
      uint64_t v46 = [v12 objectForKeyedSubscript:@"Title"];

      if (!v46) {
        goto LABEL_37;
      }
      uint64_t v45 = [v12 objectForKeyedSubscript:@"Title"];
    }
    uint64_t v47 = (void *)v45;
    [(ICAttachment *)self setTitle:v45];

LABEL_37:
    v157 = v44;
    uint64_t v48 = [v12 encryptedValues];
    v49 = [v48 objectForKeyedSubscript:@"UserTitle"];

    v156 = v49;
    uint64_t v50 = objc_msgSend(v49, "ic_stringValue");
    [(ICAttachment *)self setUserTitle:v50];

    v51 = [v12 objectForKeyedSubscript:@"ImageFilterType"];

    if (v51)
    {
      BOOL v52 = [v12 objectForKeyedSubscript:@"ImageFilterType"];
      -[ICAttachment setImageFilterType:](self, "setImageFilterType:", (__int16)[v52 integerValue]);
    }
    uint64_t v53 = objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"HandwritingSummary");
    id v54 = [v12 objectForKeyedSubscript:@"HandwritingSummaryVersion"];
    __int16 v55 = [v54 intValue];

    id v165 = (void *)v53;
    if (v53)
    {
      uint64_t v56 = [(ICAttachment *)self handwritingSummary];
      if (!v56
        || (double v57 = (void *)v56,
            int v58 = [(ICAttachment *)self handwritingSummaryVersion],
            v57,
            v58 <= v55))
      {
        int v59 = objc_msgSend(v165, "ic_stringValue");
        [(ICAttachment *)self setHandwritingSummary:v59];

        [(ICAttachment *)self setHandwritingSummaryVersion:v55];
      }
    }
    uint64_t v60 = objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"ImageClassificationSummary");
    BOOL v61 = [v12 objectForKeyedSubscript:@"ImageClassificationSummaryVersion"];
    __int16 v62 = [v61 intValue];

    id v164 = (void *)v60;
    if (v60)
    {
      uint64_t v63 = [(ICAttachment *)self imageClassificationSummary];
      if (!v63
        || (uint64_t v64 = (void *)v63,
            int v65 = [(ICAttachment *)self imageClassificationSummaryVersion],
            v64,
            v65 <= v62))
      {
        id v66 = objc_msgSend(v164, "ic_stringValue");
        [(ICAttachment *)self setImageClassificationSummary:v66];

        [(ICAttachment *)self setImageClassificationSummaryVersion:v62];
      }
    }
    uint64_t v67 = objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"OcrSummary");
    uint64_t v68 = [v12 objectForKeyedSubscript:@"OcrSummaryVersion"];
    __int16 v69 = [v68 intValue];

    char v163 = (void *)v67;
    if (v67)
    {
      uint64_t v70 = [(ICAttachment *)self ocrSummary];
      if (!v70
        || (uint64_t v71 = (void *)v70,
            int v72 = [(ICAttachment *)self ocrSummaryVersion],
            v71,
            v72 <= v69))
      {
        uint64_t v73 = objc_msgSend(v163, "ic_stringValue");
        [(ICAttachment *)self setOcrSummary:v73];

        uint64_t v74 = [v12 objectForKeyedSubscript:@"OcrSummaryVersion"];
        -[ICAttachment setOcrSummaryVersion:](self, "setOcrSummaryVersion:", (__int16)[v74 intValue]);
      }
    }
    uint64_t v75 = [(ICAttachment *)self handwritingSummary];
    if (!v75)
    {
      uint64_t v75 = [(ICAttachment *)self imageClassificationSummary];
      if (!v75)
      {
        uint64_t v148 = [(ICAttachment *)self ocrSummary];

        if (v148)
        {
LABEL_54:
          uint64_t v76 = [v12 encryptedValues];
          uint64_t v77 = [v76 objectForKeyedSubscript:@"MarkupModelData"];

          uint64_t v155 = (void *)v77;
          [(ICAttachment *)self setMarkupModelData:v77];
          uint64_t v78 = [v12 objectForKeyedSubscript:@"FileSize"];

          if (v78)
          {
            uint64_t v79 = [v12 objectForKeyedSubscript:@"FileSize"];
            -[ICAttachment setFileSize:](self, "setFileSize:", [v79 integerValue]);
          }
          uint64_t v80 = [v12 objectForKeyedSubscript:@"HasMarkupData"];

          if (v80)
          {
            uint64_t v81 = [v12 objectForKeyedSubscript:@"HasMarkupData"];
            -[ICAttachment setHasMarkupData:](self, "setHasMarkupData:", [v81 BOOLValue]);
          }
          uint64_t v82 = [v12 objectForKeyedSubscript:@"Duration"];

          if (v82)
          {
            uint64_t v83 = [v12 objectForKeyedSubscript:@"Duration"];
            [v83 doubleValue];
            -[ICAttachment setDuration:](self, "setDuration:");
          }
          char v84 = [v12 objectForKeyedSubscript:@"CreationDate"];

          if (v84)
          {
            v85 = [v12 objectForKeyedSubscript:@"CreationDate"];
            [(ICAttachment *)self setCreationDate:v85];
          }
          uint64_t v86 = [v12 objectForKeyedSubscript:@"LastModificationDate"];

          uint64_t v160 = v16;
          if (v86)
          {
            BOOL v87 = [v12 objectForKeyedSubscript:@"LastModificationDate"];
            uint64_t v88 = [(ICCloudSyncingObject *)self modificationDate];
            uint64_t v89 = [v87 laterDate:v88];
            [(ICAttachment *)self setModificationDate:v89];

            uint64_t v90 = [(ICCloudSyncingObject *)self creationDate];
            if (!v90) {
              goto LABEL_65;
            }
            v91 = (void *)v90;
            id v92 = [(ICCloudSyncingObject *)self creationDate];
            uint64_t v93 = [MEMORY[0x1E4F1C9C8] distantPast];
            int v94 = [v92 isEqual:v93];

            if (v94)
            {
LABEL_65:
              v95 = [(ICCloudSyncingObject *)self modificationDate];
              [(ICAttachment *)self setCreationDate:v95];
            }
          }
          id v96 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomLeftX"];

          if (v96)
          {
            uint64_t v97 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomLeftX"];
            [v97 doubleValue];
            -[ICAttachment setCroppingQuadBottomLeftX:](self, "setCroppingQuadBottomLeftX:");
          }
          uint64_t v98 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomLeftY"];

          if (v98)
          {
            uint64_t v99 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomLeftY"];
            [v99 doubleValue];
            -[ICAttachment setCroppingQuadBottomLeftY:](self, "setCroppingQuadBottomLeftY:");
          }
          id v100 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomRightX"];

          if (v100)
          {
            uint64_t v101 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomRightX"];
            [v101 doubleValue];
            -[ICAttachment setCroppingQuadBottomRightX:](self, "setCroppingQuadBottomRightX:");
          }
          v102 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomRightY"];

          if (v102)
          {
            uint64_t v103 = [v12 objectForKeyedSubscript:@"CroppingQuadBottomRightY"];
            [v103 doubleValue];
            -[ICAttachment setCroppingQuadBottomRightY:](self, "setCroppingQuadBottomRightY:");
          }
          BOOL v104 = [v12 objectForKeyedSubscript:@"CroppingQuadTopLeftX"];

          if (v104)
          {
            uint64_t v105 = [v12 objectForKeyedSubscript:@"CroppingQuadTopLeftX"];
            [v105 doubleValue];
            -[ICAttachment setCroppingQuadTopLeftX:](self, "setCroppingQuadTopLeftX:");
          }
          uint64_t v106 = [v12 objectForKeyedSubscript:@"CroppingQuadTopLeftY"];

          if (v106)
          {
            id v107 = [v12 objectForKeyedSubscript:@"CroppingQuadTopLeftY"];
            [v107 doubleValue];
            -[ICAttachment setCroppingQuadTopLeftY:](self, "setCroppingQuadTopLeftY:");
          }
          v108 = [v12 objectForKeyedSubscript:@"CroppingQuadTopRightX"];

          if (v108)
          {
            uint64_t v109 = [v12 objectForKeyedSubscript:@"CroppingQuadTopRightX"];
            [v109 doubleValue];
            -[ICAttachment setCroppingQuadTopRightX:](self, "setCroppingQuadTopRightX:");
          }
          v110 = [v12 objectForKeyedSubscript:@"CroppingQuadTopRightY"];

          if (v110)
          {
            uint64_t v111 = [v12 objectForKeyedSubscript:@"CroppingQuadTopRightY"];
            [v111 doubleValue];
            -[ICAttachment setCroppingQuadTopRightY:](self, "setCroppingQuadTopRightY:");
          }
          BOOL v112 = [v12 encryptedValues];
          uint64_t v113 = [v112 objectForKeyedSubscript:@"MetadataData"];

          if (v113) {
            [(ICAttachment *)self setMetadataData:v113];
          }
          [(ICAttachment *)self setHasPaperForm:0];
          [(ICAttachment *)self setDidRunPaperFormDetection:0];
          id v114 = [v12 encryptedValues];
          uint64_t v115 = [v114 objectForKeyedSubscript:@"PlacemarkEncrypted"];

          BOOL v161 = v15;
          v153 = v115;
          uint64_t v154 = (void *)v113;
          if (v115)
          {
            id v116 = v115;
          }
          else
          {
            id v130 = [v12 objectForKeyedSubscript:@"Placemark"];

            if (!v130
              || ([v12 objectForKeyedSubscript:@"Placemark"],
                  (id v116 = (id)objc_claimAutoreleasedReturnValue()) == 0))
            {
              id v151 = 0;
LABEL_97:
              id v131 = objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"LinkPresentationMetadata", v151);
              if (v131) {
                [(ICAttachment *)self setLinkPresentationArchivedMetadata:v131];
              }
              id v162 = v14;
              v132 = objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"SynapseData");
              if (v132) {
                [(ICAttachment *)self setSynapseData:v132];
              }
              uint64_t v133 = [v12 objectForKeyedSubscript:@"Media"];
              v134 = v133;
              if (v133)
              {
                BOOL v135 = [v133 recordID];
                id v136 = [v135 recordName];

                uint64_t v137 = [(ICAttachment *)self managedObjectContext];
                id v138 = +[ICMedia mediaWithIdentifier:v136 context:v137];

                if (!v138)
                {
                  id v138 = +[ICMedia newMediaWithAttachment:self];
                  [v138 setIdentifier:v136];
                  [v138 setNeedsInitialFetchFromCloud:1];
                }
                [(ICAttachment *)self setMedia:v138];
              }
              [(ICAttachment *)self updatePreviewsFromRecord:v12];
              [(ICAttachment *)self mergeFallbackImageAndPDFFromRecord:v12];
              [(ICAttachment *)self mergePaperBundleFromRecord:v12];
              BOOL v139 = [(ICAttachment *)self systemPaperModel];
              [v139 fixupMetadataAndMinimumSupportedNotesVersion];

              if (v166 && ([(ICAttachment *)self markedForDeletion] & 1) == 0)
              {
                id v140 = [MEMORY[0x1E4F28EB8] defaultCenter];
                [v140 postNotificationName:@"ICAttachmentDidCreateGalleryFromCloudNotification" object:self];
              }
              [(ICAttachment *)self fixMarkedForDeletionForScannedDocuments];
              int v141 = [(ICAttachment *)self markedForDeletion];
              uint64_t v142 = [(ICAttachment *)self media];
              int v143 = [v142 markedForDeletion];

              LOBYTE(v15) = v161;
              if (v141 != v143)
              {
                uint64_t v144 = [(ICAttachment *)self markedForDeletion];
                v145 = [(ICAttachment *)self media];
                [v145 setMarkedForDeletion:v144];
              }
              id v14 = v162;
              double v23 = v159;
              double v16 = v160;
LABEL_111:
              id v146 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentDidLoadNotification"];

              goto LABEL_112;
            }
          }
          id v168 = 0;
          id v151 = v116;
          os_log_t v117 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v116 error:&v168];
          id v118 = v168;
          if (v118)
          {
            uint64_t v119 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
              -[ICAttachment(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:newAttachment:]();
            }
          }
          objc_opt_class();
          uint64_t v120 = [v117 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
          id v121 = ICCheckedDynamicCast();

          int v122 = [(ICAttachment *)self location];

          if (!v122)
          {
            id v123 = [v121 location];
            [v123 coordinate];
            double v125 = v124;
            v126 = [v121 location];
            [v126 coordinate];
            id v127 = -[ICAttachment addLocationWithLatitude:longitude:](self, "addLocationWithLatitude:longitude:", v125);
          }
          uint64_t v128 = [(ICAttachment *)self location];
          [v128 setPlacemark:v121];

          uint64_t v129 = [(ICAttachment *)self location];
          [v129 setPlaceUpdated:1];

          goto LABEL_97;
        }
        uint64_t v149 = [v12 encryptedValues];
        uint64_t v75 = [v149 objectForKeyedSubscript:@"SummaryEncrypted"];

        if (v75) {
          objc_msgSend(v75, "ic_stringValue");
        }
        else {
        uint64_t v150 = [v12 objectForKeyedSubscript:@"Summary"];
        }
        [(ICAttachment *)self setSummary:v150];
      }
    }

    goto LABEL_54;
  }
LABEL_112:

  return v15;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v153.receiver = self;
  v153.super_class = (Class)ICAttachment;
  uint64_t v7 = [(ICCloudSyncingObject *)&v153 makeCloudKitRecordForApproach:a3 mergeableFieldState:v6];
  if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
  {
    id v8 = [(ICAttachment *)self attachmentModel];
    [v8 addMergeableDataToCloudKitRecord:v7 approach:a3 mergeableFieldState:v6];
  }
  uint64_t v9 = [(ICAttachment *)self typeUTI];

  if (v9)
  {
    id v10 = [(ICAttachment *)self typeUTI];
    id v11 = [v10 dataUsingEncoding:4];
    id v12 = [v7 encryptedValues];
    [v12 setObject:v11 forKeyedSubscript:@"UTIEncrypted"];

    id v13 = [(ICAttachment *)self typeUTI];
    [v7 setObject:v13 forKeyedSubscript:@"UTI"];
  }
  else
  {
    id v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(ICCloudSyncingObject *)self loggingDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v155 = v14;
      _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEFAULT, "Trying to create a record for an attachment that is of an unknown type: %@", buf, 0xCu);
    }
  }

  BOOL v15 = [(ICAttachment *)self note];
  double v16 = [v15 recordID];

  uint64_t v17 = [(ICAttachment *)self parentAttachment];
  uint64_t v18 = [v17 recordID];

  int v19 = (uint64_t *)MEMORY[0x1E4F19D98];
  if (v16)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1A348]);
    if (v18) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = *v19;
    }
    int v22 = (void *)[v20 initWithRecordID:v16 action:v21];
    [v7 setObject:v22 forKeyedSubscript:@"Note"];
  }
  if (v18)
  {
    double v23 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v18 action:*v19];
    [v7 setObject:v23 forKeyedSubscript:@"ParentAttachment"];
  }
  if (!a3)
  {
    id v151 = v6;
    double v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICAttachment imageFilterType](self, "imageFilterType"));
    [v7 setObject:v24 forKeyedSubscript:@"ImageFilterType"];

    [(ICAttachment *)self originX];
    if (v25 != 0.0)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28ED0];
      [(ICAttachment *)self originX];
      uint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
      [v7 setObject:v27 forKeyedSubscript:@"OriginX"];
    }
    [(ICAttachment *)self originY];
    if (v28 != 0.0)
    {
      id v29 = (void *)MEMORY[0x1E4F28ED0];
      [(ICAttachment *)self originY];
      double v30 = objc_msgSend(v29, "numberWithDouble:");
      [v7 setObject:v30 forKeyedSubscript:@"OriginY"];
    }
    [(ICAttachment *)self sizeWidth];
    if (v31 != 0.0)
    {
      double v32 = (void *)MEMORY[0x1E4F28ED0];
      [(ICAttachment *)self sizeWidth];
      double v33 = objc_msgSend(v32, "numberWithDouble:");
      [v7 setObject:v33 forKeyedSubscript:@"Width"];
    }
    [(ICAttachment *)self sizeHeight];
    if (v34 != 0.0)
    {
      id v35 = (void *)MEMORY[0x1E4F28ED0];
      [(ICAttachment *)self sizeHeight];
      long long v36 = objc_msgSend(v35, "numberWithDouble:");
      [v7 setObject:v36 forKeyedSubscript:@"Height"];
    }
    long long v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICAttachment orientation](self, "orientation"));
    [v7 setObject:v37 forKeyedSubscript:@"Orientation"];

    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      long long v38 = [(ICAttachment *)self urlString];

      if (v38)
      {
        long long v39 = [(ICAttachment *)self urlString];
        id v40 = objc_msgSend(v39, "ic_substringToIndex:", 2047);
        id v41 = [v40 dataUsingEncoding:4];
        long long v42 = [v7 encryptedValues];
        [v42 setObject:v41 forKeyedSubscript:@"URLStringEncrypted"];
      }
    }
    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      long long v43 = [(ICAttachment *)self title];

      if (v43)
      {
        long long v44 = [(ICAttachment *)self title];
        uint64_t v45 = [v44 dataUsingEncoding:4];
        uint64_t v46 = [v7 encryptedValues];
        [v46 setObject:v45 forKeyedSubscript:@"TitleEncrypted"];
      }
    }
    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      uint64_t v47 = [(ICAttachment *)self handwritingSummary];

      if (v47)
      {
        uint64_t v48 = [(ICAttachment *)self handwritingSummary];
        v49 = [v48 dataUsingEncoding:4];

        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v49, @"HandwritingSummary", 0);
      }
    }
    uint64_t v50 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICAttachment handwritingSummaryVersion](self, "handwritingSummaryVersion"));
    [v7 setObject:v50 forKeyedSubscript:@"HandwritingSummaryVersion"];

    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      v51 = [(ICAttachment *)self imageClassificationSummary];

      if (v51)
      {
        BOOL v52 = [(ICAttachment *)self imageClassificationSummary];
        uint64_t v53 = [v52 dataUsingEncoding:4];

        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v53, @"ImageClassificationSummary", 0);
      }
    }
    id v54 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICAttachment imageClassificationSummaryVersion](self, "imageClassificationSummaryVersion"));
    [v7 setObject:v54 forKeyedSubscript:@"ImageClassificationSummaryVersion"];

    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      __int16 v55 = [(ICAttachment *)self ocrSummary];

      if (v55)
      {
        uint64_t v56 = [(ICAttachment *)self ocrSummary];
        double v57 = [v56 dataUsingEncoding:4];

        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v57, @"OcrSummary", 0);
      }
    }
    int v58 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", -[ICAttachment ocrSummaryVersion](self, "ocrSummaryVersion"));
    [v7 setObject:v58 forKeyedSubscript:@"OcrSummaryVersion"];

    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      int v59 = [(ICAttachment *)self summary];

      if (v59)
      {
        uint64_t v60 = [(ICAttachment *)self summary];
        BOOL v61 = objc_msgSend(v60, "ic_substringToIndex:", 999);

        __int16 v62 = [v61 dataUsingEncoding:4];
        uint64_t v63 = [v7 encryptedValues];
        [v63 setObject:v62 forKeyedSubscript:@"SummaryEncrypted"];
      }
    }
    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      uint64_t v64 = [(ICAttachment *)self userTitle];
      int v65 = [v64 dataUsingEncoding:4];
      id v66 = [v7 encryptedValues];
      [v66 setObject:v65 forKeyedSubscript:@"UserTitle"];
    }
    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      uint64_t v67 = [(ICAttachment *)self markupModelData];

      if (v67)
      {
        uint64_t v68 = [(ICAttachment *)self markupModelData];
        __int16 v69 = [v7 encryptedValues];
        [v69 setObject:v68 forKeyedSubscript:@"MarkupModelData"];
      }
      else
      {
        [v7 setObject:0 forKeyedSubscript:@"MarkupModelData"];
      }
    }
    if ([(ICAttachment *)self hasMarkupData])
    {
      uint64_t v70 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAttachment hasMarkupData](self, "hasMarkupData"));
      [v7 setObject:v70 forKeyedSubscript:@"HasMarkupData"];
    }
    if ([(ICAttachment *)self fileSize])
    {
      uint64_t v71 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[ICAttachment fileSize](self, "fileSize"));
      [v7 setObject:v71 forKeyedSubscript:@"FileSize"];
    }
    [(ICAttachment *)self duration];
    if (v72 != 0.0)
    {
      uint64_t v73 = (void *)MEMORY[0x1E4F28ED0];
      [(ICAttachment *)self duration];
      uint64_t v74 = objc_msgSend(v73, "numberWithDouble:");
      [v7 setObject:v74 forKeyedSubscript:@"Duration"];
    }
    uint64_t v75 = [(ICAttachment *)self attachmentModel];
    uint64_t v76 = [v75 asset];

    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0 && v76)
    {
      uint64_t v77 = [(id)*MEMORY[0x1E4F44410] identifier];
      uint64_t v78 = [v76 previewImageDataWithUTType:v77];

      uint64_t v79 = [(id)objc_opt_class() assetForData:v78];
      [v7 setObject:v79 forKeyedSubscript:@"PreviewImage"];
    }
    uint64_t v80 = [(ICAttachment *)self previewUpdateDate];

    if (v80)
    {
      uint64_t v81 = [(ICAttachment *)self previewUpdateDate];
      [v7 setObject:v81 forKeyedSubscript:@"PreviewUpdateDate"];
    }
    uint64_t v82 = [(ICCloudSyncingObject *)self creationDate];

    if (v82)
    {
      uint64_t v83 = [(ICCloudSyncingObject *)self creationDate];
      [v7 setObject:v83 forKeyedSubscript:@"CreationDate"];
    }
    char v84 = [(ICCloudSyncingObject *)self modificationDate];

    if (v84)
    {
      v85 = [(ICCloudSyncingObject *)self modificationDate];
      [v7 setObject:v85 forKeyedSubscript:@"LastModificationDate"];
    }
    uint64_t v86 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadBottomLeftX];
    BOOL v87 = objc_msgSend(v86, "numberWithDouble:");
    [v7 setObject:v87 forKeyedSubscript:@"CroppingQuadBottomLeftX"];

    uint64_t v88 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadBottomLeftY];
    uint64_t v89 = objc_msgSend(v88, "numberWithDouble:");
    [v7 setObject:v89 forKeyedSubscript:@"CroppingQuadBottomLeftY"];

    uint64_t v90 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadBottomRightX];
    v91 = objc_msgSend(v90, "numberWithDouble:");
    [v7 setObject:v91 forKeyedSubscript:@"CroppingQuadBottomRightX"];

    id v92 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadBottomRightY];
    uint64_t v93 = objc_msgSend(v92, "numberWithDouble:");
    [v7 setObject:v93 forKeyedSubscript:@"CroppingQuadBottomRightY"];

    int v94 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadTopLeftX];
    v95 = objc_msgSend(v94, "numberWithDouble:");
    [v7 setObject:v95 forKeyedSubscript:@"CroppingQuadTopLeftX"];

    id v96 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadTopLeftY];
    uint64_t v97 = objc_msgSend(v96, "numberWithDouble:");
    [v7 setObject:v97 forKeyedSubscript:@"CroppingQuadTopLeftY"];

    uint64_t v98 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadTopRightX];
    uint64_t v99 = objc_msgSend(v98, "numberWithDouble:");
    [v7 setObject:v99 forKeyedSubscript:@"CroppingQuadTopRightX"];

    id v100 = (void *)MEMORY[0x1E4F28ED0];
    [(ICAttachment *)self croppingQuadTopRightY];
    uint64_t v101 = objc_msgSend(v100, "numberWithDouble:");
    [v7 setObject:v101 forKeyedSubscript:@"CroppingQuadTopRightY"];

    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      v102 = [(ICAttachment *)self metadataData];

      if (v102)
      {
        uint64_t v103 = [(ICAttachment *)self metadataData];
        BOOL v104 = [v7 encryptedValues];
        [v104 setObject:v103 forKeyedSubscript:@"MetadataData"];
      }
    }
    uint64_t v105 = [(ICAttachment *)self location];
    uint64_t v106 = [v105 placemark];

    if (v106)
    {
      id v107 = (void *)MEMORY[0x1E4F28DB0];
      v108 = [(ICAttachment *)self location];
      uint64_t v109 = [v108 placemark];
      id v152 = 0;
      v110 = [v107 archivedDataWithRootObject:v109 requiringSecureCoding:1 error:&v152];
      id v111 = v152;

      if (v111)
      {
        BOOL v112 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
          -[ICAttachment(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:](v111);
        }
      }
      uint64_t v113 = [v7 encryptedValues];
      [v113 setObject:v110 forKeyedSubscript:@"PlacemarkEncrypted"];

      id v114 = [(ICAttachment *)self location];
      uint64_t v115 = [v114 formattedAddressWithoutAttachmentTitle];

      if (v115)
      {
        id v116 = [v115 dataUsingEncoding:4];
        os_log_t v117 = [v7 encryptedValues];
        [v117 setObject:v116 forKeyedSubscript:@"SummaryEncrypted"];
      }
    }
    id v118 = [(ICAttachment *)self media];
    uint64_t v119 = [v118 recordID];

    if (v119)
    {
      uint64_t v120 = [(ICAttachment *)self media];
      int v121 = [v120 hasFile];

      if (v121)
      {
        id v122 = objc_alloc(MEMORY[0x1E4F1A348]);
        id v123 = (void *)[v122 initWithRecordID:v119 action:*MEMORY[0x1E4F19D98]];
        [v7 setObject:v123 forKeyedSubscript:@"Media"];
      }
    }
    double v124 = [(ICAttachment *)self previewImages];
    uint64_t v125 = [v124 count];

    id v6 = v151;
    if (v125)
    {
      v126 = objc_opt_class();
      id v127 = [(ICAttachment *)self previewImages];
      [v126 addPreviewImages:v127 toRecord:v7];
    }
    if ([(ICAttachment *)self hasFallbackImage])
    {
      if ([(ICAttachment *)self isPasswordProtected]) {
        [(ICAttachment *)self fallbackImageEncryptedURL];
      }
      else {
      id v128 = [(ICAttachment *)self fallbackImageURL];
      }

      if (v128)
      {
        uint64_t v129 = +[ICCloudSyncingObject assetForURL:v128];
        [v7 setObject:v129 forKeyedSubscript:@"FallbackImage"];
        id v130 = [(ICAttachment *)self fallbackImageCryptoTag];
        [v7 setObject:v130 forKeyedSubscript:@"FallbackImageCryptoTag"];

        id v131 = [(ICAttachment *)self fallbackImageCryptoInitializationVector];
        [v7 setObject:v131 forKeyedSubscript:@"FallbackImageCryptoInitializationVector"];
      }
    }
    if ([(ICAttachment *)self hasFallbackPDF])
    {
      if ([(ICAttachment *)self isPasswordProtected]) {
        [(ICAttachment *)self fallbackPDFEncryptedURL];
      }
      else {
      id v132 = [(ICAttachment *)self fallbackPDFURL];
      }

      if (v132)
      {
        uint64_t v133 = +[ICCloudSyncingObject assetForURL:v132];
        [v7 setObject:v133 forKeyedSubscript:@"FallbackPDF"];
        v134 = [(ICAttachment *)self fallbackPDFCryptoTag];
        [v7 setObject:v134 forKeyedSubscript:@"FallbackPDFCryptoTag"];

        BOOL v135 = [(ICAttachment *)self fallbackPDFCryptoInitializationVector];
        [v7 setObject:v135 forKeyedSubscript:@"FallbackPDFCryptoInitializationVector"];
      }
    }
    id v136 = [(ICAttachment *)self fallbackTitle];
    if (v136)
    {
      id v137 = v136;
    }
    else
    {
      id v138 = [(ICAttachment *)self attachmentModel];
      id v137 = [v138 localizedFallbackTitle];

      if (!v137) {
        goto LABEL_97;
      }
    }
    [v7 setObject:v137 forKeyedSubscript:@"FallbackTitle"];

LABEL_97:
    BOOL v139 = [(ICAttachment *)self fallbackSubtitleIOS];
    if (v139)
    {
      id v140 = v139;
    }
    else
    {
      int v141 = [(ICAttachment *)self attachmentModel];
      id v140 = [v141 localizedFallbackSubtitleIOS];

      if (!v140) {
        goto LABEL_101;
      }
    }
    [v7 setObject:v140 forKeyedSubscript:@"FallbackSubtitleIOS"];

LABEL_101:
    uint64_t v142 = [(ICAttachment *)self fallbackSubtitleMac];
    if (v142)
    {
      id v143 = v142;
    }
    else
    {
      uint64_t v144 = [(ICAttachment *)self attachmentModel];
      id v143 = [v144 localizedFallbackSubtitleMac];

      if (!v143) {
        goto LABEL_105;
      }
    }
    [v7 setObject:v143 forKeyedSubscript:@"FallbackSubtitleMac"];

LABEL_105:
    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      v145 = [(ICAttachment *)self linkPresentationArchivedMetadata];

      if (v145)
      {
        id v146 = [(ICAttachment *)self linkPresentationArchivedMetadata];
        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v146, @"LinkPresentationMetadata", 0);
      }
    }
    if (([(ICAttachment *)self isPasswordProtected] & 1) == 0)
    {
      int v147 = [(ICAttachment *)self synapseData];

      if (v147)
      {
        uint64_t v148 = [(ICAttachment *)self synapseData];
        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v148, @"SynapseData", 0);
      }
    }
    [(ICAttachment *)self addPaperBundleToRecordIfAppropriate:v7];
  }
  id v149 = v7;

  return v149;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [a3 recordName];
  id v8 = +[ICBaseAttachment attachmentWithIdentifier:v7 context:v6];

  return v8;
}

- (id)parentAttachmentFromRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"ParentAttachment"];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 recordID];
    id v14 = +[ICAttachment existingCloudObjectForRecordID:v13 accountID:v9 context:v10];

    if (!v14)
    {
      BOOL v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v20 = [(ICAttachment *)self className];
        double v24 = [v8 recordID];
        uint64_t v21 = [v24 recordName];
        double v23 = [v12 recordID];
        int v22 = [v23 recordName];
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        double v28 = v21;
        __int16 v29 = 2112;
        double v30 = v22;
        _os_log_debug_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a parent attachment (%@) that we don't know about yet", buf, 0x20u);
      }
      double v16 = [v12 recordID];
      uint64_t v17 = [v16 recordName];
      uint64_t v18 = [(ICAttachment *)self note];
      id v14 = +[ICBaseAttachment newAttachmentWithIdentifier:v17 note:v18];

      [v14 setNeedsInitialFetchFromCloud:1];
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)noteFromAttachmentUserSpecificRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 objectForKeyedSubscript:@"NoteUUID"];
  if ([v10 length])
  {
    id v11 = +[ICNote noteWithIdentifier:v10 context:v9];
    if (!v11)
    {
      id v12 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        double v16 = [v7 recordID];
        uint64_t v17 = [v16 recordName];
        int v18 = 138412802;
        int v19 = v17;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_debug_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_DEBUG, "Found a user-specific attachment record (%@) for a note (%@) in account (%@) that we haven't seen yet", (uint8_t *)&v18, 0x20u);
      }
      id v13 = +[ICAccount cloudKitAccountWithIdentifier:v8 context:v9];
      id v11 = +[ICNote newNoteWithoutIdentifierInAccount:v13];
      [v11 setIdentifier:v10];
      [v11 setNeedsInitialFetchFromCloud:1];
    }
  }
  else
  {
    id v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[ICAttachment(CloudKit) noteFromAttachmentUserSpecificRecord:accountID:context:]();
    }

    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICAttachment(CloudKit) noteFromAttachmentUserSpecificRecord:accountID:context:]" simulateCrash:1 showAlert:1 format:@"Missing note reference in attachment user-specific record"];
    id v11 = 0;
  }

  return v11;
}

+ (id)noteFromAttachmentRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 objectForKeyedSubscript:@"Note"];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 recordID];
    id v14 = +[ICNote existingCloudObjectForRecordID:v13 accountID:v9 context:v10];

    if (v14) {
      goto LABEL_10;
    }
    BOOL v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [a1 className];
      __int16 v27 = [v8 recordID];
      uint64_t v24 = [v27 recordName];
      double v25 = [v12 recordID];
      uint64_t v26 = [v25 recordName];
      *(_DWORD *)buf = 138413058;
      __int16 v29 = v23;
      __int16 v30 = 2112;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v26;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_debug_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a note (%@) that we don't know about yet in account ID %@", buf, 0x2Au);
    }
    double v16 = +[ICAccount cloudKitAccountWithIdentifier:v9 context:v10];
    id v14 = +[ICNote newNoteWithoutIdentifierInAccount:v16];
    uint64_t v17 = [v12 recordID];
    int v18 = [v17 recordName];
    [v14 setIdentifier:v18];

    [v14 setNeedsInitialFetchFromCloud:1];
  }
  else
  {
    double v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [a1 className];
      __int16 v20 = [v8 recordID];
      uint64_t v21 = [v20 recordName];
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = v21;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEFAULT, "Found an %@ (%@) in the cloud with no note in account ID %@", buf, 0x20u);
    }
    id v14 = 0;
  }

LABEL_10:
  return v14;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 noteFromAttachmentRecord:v9 accountID:v8 context:a5];
  id v11 = [v9 recordID];
  id v12 = [v11 recordName];
  id v13 = [v10 addAttachmentWithIdentifier:v12];

  id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v13 setModificationDate:v14];

  BOOL v15 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v13 setCreationDate:v15];

  [v13 mergeCloudKitRecord:v9 accountID:v8 approach:0 mergeableFieldState:0 newAttachment:1];
  [v13 setServerRecord:v9];

  [v13 setInCloud:1];
  [v13 clearChangeCountWithReason:@"Created attachment"];
  [v13 updateParentReferenceIfNecessary];
  id v16 = (id)objc_msgSend(v13, "ic_postNotificationOnMainThreadAfterSaveWithName:", @"ICAttachmentDidLoadNotification");

  return v13;
}

+ (BOOL)supportsUserSpecificRecords
{
  return 1;
}

- (BOOL)wantsUserSpecificRecord
{
  int v2 = [(ICAttachment *)self mergeablePreferredViewSize];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICAttachment;
  id v4 = [(ICCloudSyncingObject *)&v13 makeUserSpecificCloudKitRecordForApproach:a3];
  int v5 = [(ICAttachment *)self note];
  id v6 = [v5 recordID];

  if (v6)
  {
    id v7 = [(ICAttachment *)self note];
    id v8 = [v7 recordID];
    id v9 = [v8 recordName];
    [v4 setObject:v9 forKeyedSubscript:@"NoteUUID"];
  }
  id v10 = [(ICAttachment *)self mergeablePreferredViewSize];
  if (v10)
  {
    id v11 = [v4 encryptedValues];
    [v11 setObject:v10 forKeyedSubscript:@"MergeablePreferredViewSizeEncrypted"];
  }
  return v4;
}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ICAttachment;
  BOOL v8 = [(ICCloudSyncingObject *)&v23 mergeDataFromUserSpecificRecord:v6 accountID:v7];
  if (v8)
  {
    id v9 = [(ICAttachment *)self note];
    if (v9)
    {
    }
    else
    {
      id v16 = [v6 objectForKeyedSubscript:@"NoteUUID"];

      if (v16)
      {
        uint64_t v17 = objc_opt_class();
        int v18 = [(ICAttachment *)self managedObjectContext];
        int v19 = [v17 noteFromAttachmentUserSpecificRecord:v6 accountID:v7 context:v18];
        [(ICAttachment *)self setNote:v19];

        __int16 v20 = [(ICAttachment *)self note];

        if (!v20) {
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.note" functionName:"-[ICAttachment(CloudKit) mergeDataFromUserSpecificRecord:accountID:]" simulateCrash:1 showAlert:0 format:@"Expected a note (existing or placeholder) to be created from user-specific record"];
        }
      }
    }
    id v10 = [v6 encryptedValues];
    id v11 = [v10 objectForKeyedSubscript:@"MergeablePreferredViewSizeEncrypted"];

    if (v11)
    {
      id v12 = [(ICAttachment *)self mergeablePreferredViewSize];
      if (v12)
      {
        objc_super v13 = [[ICTTMergeableWallClockValue alloc] initWithData:v11];
        id v14 = [[ICTTMergeableWallClockValue alloc] initWithData:v12];
        if ([(ICTTMergeableWallClockValue *)v14 merge:v13] == 2)
        {
          BOOL v15 = [(ICTTMergeableWallClockValue *)v14 serialize];
          [(ICAttachment *)self setMergeablePreferredViewSize:v15];
        }
      }
      else
      {
        [(ICAttachment *)self setMergeablePreferredViewSize:v11];
      }
    }
    id v21 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentDidLoadNotification"];
  }
  return v8;
}

- (BOOL)isInICloudAccount
{
  int v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(ICAttachment *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__ICAttachment_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E64A44A8;
  v5[4] = v2;
  void v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__ICAttachment_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInCloud])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) note];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInICloudAccount];
  }
}

- (void)fixMarkedForDeletionForScannedDocuments
{
  if ([(ICAttachment *)self markedForDeletion])
  {
    uint64_t v3 = [(ICAttachment *)self parentAttachment];
    if (v3)
    {
      id v7 = (id)v3;
      id v4 = [(ICAttachment *)self parentAttachment];
      if ([v4 needsInitialFetchFromCloud])
      {
      }
      else
      {
        int v5 = [(ICAttachment *)self parentAttachment];
        char v6 = [v5 markedForDeletion];

        if (v6) {
          return;
        }
        id v7 = [(ICAttachment *)self parentAttachment];
        [v7 updateMarkedForDeletionStateAttachmentIsInUse:1];
      }
    }
  }
}

- (void)fixBrokenReferences
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICCloudSyncingObject *)self loggingDescription];
    int v5 = [(ICAttachment *)self media];
    char v6 = [v5 loggingDescription];
    id v7 = [(ICAttachment *)self note];
    uint64_t v8 = [v7 loggingDescription];
    int v64 = 138412802;
    int v65 = v4;
    __int16 v66 = 2112;
    uint64_t v67 = v6;
    __int16 v68 = 2112;
    __int16 v69 = v8;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for attachment: %@\n\tMedia=%@\n\tNote=%@", (uint8_t *)&v64, 0x20u);
  }
  char v9 = [(ICAttachment *)self note];
  int v10 = [v9 needsInitialFetchFromCloud];

  if (v10)
  {
    id v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(ICAttachment *)self identifier];
      objc_super v13 = [(ICAttachment *)self note];
      id v14 = [v13 identifier];
      int v64 = 138412546;
      int v65 = v12;
      __int16 v66 = 2112;
      uint64_t v67 = v14;
      _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEFAULT, "Tried to push an attachment (%@) for a note (%@) that we don't know about. Manually fetching note.", (uint8_t *)&v64, 0x16u);
    }
    BOOL v15 = [(ICAttachment *)self note];
    [v15 setNeedsToBeFetchedFromCloud:1];
  }
  else
  {
    id v16 = [(ICAttachment *)self note];
    uint64_t v17 = [v16 noteData];
    uint64_t v18 = [v17 data];
    if (v18)
    {
      int v19 = (void *)v18;
      __int16 v20 = [(ICAttachment *)self note];
      id v21 = [v20 creationDate];

      if (v21) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    __int16 v22 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v23 = [(ICAttachment *)self identifier];
      uint64_t v24 = [(ICAttachment *)self note];
      double v25 = [v24 identifier];
      int v64 = 138412546;
      int v65 = v23;
      __int16 v66 = 2112;
      uint64_t v67 = v25;
      _os_log_impl(&dword_1C3A61000, v22, OS_LOG_TYPE_DEFAULT, "Tried to push an attachment (%@) for a note (%@) that no longer exists. Deleting attachment.", (uint8_t *)&v64, 0x16u);
    }
    [(ICAttachment *)self deleteFromLocalDatabase];
  }
LABEL_14:
  uint64_t v26 = [(ICAttachment *)self note];
  int v27 = [v26 markedForDeletion];

  if (v27)
  {
    double v28 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = [(ICCloudSyncingObject *)self shortLoggingDescription];
      int v64 = 138412290;
      int v65 = v29;
      _os_log_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEFAULT, "Marking %@ for deletion because its note is deleted too", (uint8_t *)&v64, 0xCu);
    }
    [(ICAttachment *)self markForDeletion];
    __int16 v30 = [(ICAttachment *)self media];
    [v30 markForDeletion];
  }
  if ([(ICCloudSyncingObject *)self isInCloud])
  {
    uint64_t v31 = [(ICAttachment *)self note];
    char v32 = [v31 isInCloud];

    if ((v32 & 1) == 0)
    {
      id v33 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v34 = [(ICCloudSyncingObject *)self shortLoggingDescription];
        id v35 = [(ICAttachment *)self note];
        uint64_t v36 = [v35 shortLoggingDescription];
        int v64 = 138412546;
        int v65 = v34;
        __int16 v66 = 2112;
        uint64_t v67 = v36;
        _os_log_impl(&dword_1C3A61000, v33, OS_LOG_TYPE_DEFAULT, "We think %@ is in the cloud, but its parent %@ isn't. That's not possible, so let's try to fetch it.", (uint8_t *)&v64, 0x16u);
      }
      [(ICCloudSyncingObject *)self setNeedsToBeFetchedFromCloud:1];
    }
  }
  long long v37 = [(ICAttachment *)self note];
  char v38 = [v37 isInCloud];

  if ((v38 & 1) == 0)
  {
    long long v39 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = [(ICAttachment *)self note];
      id v41 = [v40 identifier];
      int v64 = 138412290;
      int v65 = v41;
      _os_log_impl(&dword_1C3A61000, v39, OS_LOG_TYPE_DEFAULT, "Tried to push an attachment for note: (%@) which isn't yet in iCloud", (uint8_t *)&v64, 0xCu);
    }
  }
  long long v42 = [(ICAttachment *)self note];
  [v42 updateChangeCountWithReason:@"Fixed broken reference"];

  long long v43 = [(ICAttachment *)self media];

  if (v43)
  {
    long long v44 = [(ICAttachment *)self media];
    if ([v44 needsInitialFetchFromCloud])
    {
LABEL_31:

      goto LABEL_32;
    }
    uint64_t v45 = [(ICAttachment *)self media];
    if ([v45 needsToBeFetchedFromCloud])
    {

      goto LABEL_31;
    }
    uint64_t v56 = [(ICAttachment *)self media];
    char v57 = [v56 hasFile];

    if (v57)
    {
LABEL_32:
      uint64_t v46 = [(ICAttachment *)self media];
      uint64_t v47 = [v46 filename];
      if (![v47 length])
      {
        uint64_t v48 = [(ICAttachment *)self media];
        v49 = [v48 identifier];
        uint64_t v50 = [v49 length];

        if (!v50)
        {
LABEL_38:
          __int16 v55 = [(ICAttachment *)self media];
          [v55 updateChangeCountWithReason:@"Fixed broken reference"];

          return;
        }
        v51 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v52 = [(ICAttachment *)self media];
          uint64_t v53 = [v52 identifier];
          int v64 = 138412290;
          int v65 = v53;
          _os_log_impl(&dword_1C3A61000, v51, OS_LOG_TYPE_DEFAULT, "Empty filename for media, falling back on identifier (%@)", (uint8_t *)&v64, 0xCu);
        }
        uint64_t v46 = [(ICAttachment *)self media];
        uint64_t v47 = [v46 identifier];
        id v54 = [(ICAttachment *)self media];
        [v54 setFilename:v47];
      }
      goto LABEL_38;
    }
    int v58 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      int v59 = [(ICAttachment *)self media];
      uint64_t v60 = [v59 identifier];
      BOOL v61 = [(ICAttachment *)self note];
      __int16 v62 = [v61 identifier];
      int v64 = 138412546;
      int v65 = v60;
      __int16 v66 = 2112;
      uint64_t v67 = v62;
      _os_log_impl(&dword_1C3A61000, v58, OS_LOG_TYPE_DEFAULT, "Invalid media (%@) for a note (%@). Deleting media.", (uint8_t *)&v64, 0x16u);
    }
    uint64_t v63 = [(ICAttachment *)self media];
    [v63 markForDeletion];

    [(ICAttachment *)self setMedia:0];
  }
}

- (BOOL)hasAllMandatoryFields
{
  v10.receiver = self;
  v10.super_class = (Class)ICAttachment;
  unsigned int v3 = [(ICCloudSyncingObject *)&v10 hasAllMandatoryFields];
  id v4 = [(ICAttachment *)self typeUTI];
  if (![v4 length]) {
    unsigned int v3 = 0;
  }

  int v5 = [(ICAttachment *)self note];
  int v6 = v3 & [v5 hasAllMandatoryFields];

  id v7 = [(ICAttachment *)self media];

  if (v7)
  {
    uint64_t v8 = [(ICAttachment *)self media];
    v6 &= [v8 hasAllMandatoryFields];
  }
  return v6;
}

- (BOOL)needsToBePushedToCloud
{
  v7.receiver = self;
  v7.super_class = (Class)ICAttachment;
  unsigned int v3 = [(ICCloudSyncingObject *)&v7 needsToBePushedToCloud];
  id v4 = self;
  if (v4 && v3)
  {
    do
    {
      int v5 = v4;
      unsigned int v3 = [(ICAttachment *)v4 isBeingEditedLocallyOnDevice];
      id v4 = [(ICAttachment *)v4 parentAttachment];
    }
    while (v4 && !v3);
    LOBYTE(v3) = v3 ^ 1;
  }

  return v3;
}

- (void)deleteFromLocalDatabase
{
}

- (id)objectsToBeDeletedBeforeThisObject
{
  v9.receiver = self;
  v9.super_class = (Class)ICAttachment;
  unsigned int v3 = [(ICCloudSyncingObject *)&v9 objectsToBeDeletedBeforeThisObject];
  id v4 = (void *)[v3 mutableCopy];

  int v5 = [(ICAttachment *)self subAttachments];
  int v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  objc_super v7 = (void *)[v4 copy];
  return v7;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (void)updateParentReferenceIfNecessary
{
  v4.receiver = self;
  v4.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v4 updateParentReferenceIfNecessary];
  unsigned int v3 = [(ICAttachment *)self media];
  [v3 updateParentReferenceIfNecessary];
}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)ICAttachment;
  id v8 = a3;
  [(ICCloudSyncingObject *)&v11 objectWasFetchedFromCloudWithRecord:v8 accountID:a4 force:v5];
  objc_super v9 = objc_msgSend(v8, "objectForKeyedSubscript:", @"PreviewImages", v11.receiver, v11.super_class);

  if (v9 && [v9 count]) {
    id v10 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentPreviewImagesDidUpdateNotification"];
  }
}

+ (void)addPreviewImages:(id)a3 toRecord:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v35 = a4;
  int v6 = [MEMORY[0x1E4F1CA48] array];
  id v41 = [MEMORY[0x1E4F1CA48] array];
  id v40 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = [MEMORY[0x1E4F1CA48] array];
  char v38 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (!v7)
  {
    long long v42 = 0;
    objc_super v9 = 0;
    goto LABEL_44;
  }
  uint64_t v8 = v7;
  long long v42 = 0;
  objc_super v9 = 0;
  uint64_t v10 = *(void *)v46;
  uint64_t v36 = v6;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v46 != v10) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
      if ([v12 isPasswordProtected])
      {
        objc_super v13 = [v12 encryptedPreviewImageURL];
        if (!v9)
        {
          objc_super v9 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v14 = [MEMORY[0x1E4F1CA48] array];

          long long v42 = (void *)v14;
        }
      }
      else
      {
        objc_super v13 = [v12 previewImageURL];
      }
      if ([v12 shouldSyncToCloud])
      {
        id v44 = 0;
        int v15 = [v13 checkResourceIsReachableAndReturnError:&v44];
        id v16 = v44;
        uint64_t v17 = v16;
        if (v15)
        {
          uint64_t v18 = +[ICCloudSyncingObject assetForURL:v13];
          if (v18)
          {
            [v6 addObject:v18];
            int v19 = (void *)MEMORY[0x1E4F28ED0];
            [v12 width];
            __int16 v20 = objc_msgSend(v19, "numberWithDouble:");
            [v41 addObject:v20];

            id v21 = (void *)MEMORY[0x1E4F28ED0];
            [v12 height];
            __int16 v22 = objc_msgSend(v21, "numberWithDouble:");
            [v40 addObject:v22];

            objc_super v23 = (void *)MEMORY[0x1E4F28ED0];
            [v12 scale];
            uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
            [v39 addObject:v24];

            double v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v12, "scaleWhenDrawing"));
            [v38 addObject:v25];

            uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", objc_msgSend(v12, "appearanceType"));
            [v37 addObject:v26];

            if ([v12 isPasswordProtected])
            {
              int v27 = [v12 cryptoTag];

              if (v27)
              {
                double v28 = [v12 cryptoTag];
                [v9 addObject:v28];
              }
              else
              {
                double v28 = os_log_create("com.apple.notes", "Cloud");
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v31 = [v12 identifier];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v50 = v31;
                  _os_log_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEFAULT, "No cryptoTag for preview image %@", buf, 0xCu);
                }
              }

              char v32 = [v12 cryptoInitializationVector];

              if (v32)
              {
                __int16 v29 = [v12 cryptoInitializationVector];
                [v42 addObject:v29];
              }
              else
              {
                __int16 v29 = os_log_create("com.apple.notes", "Cloud");
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  id v33 = [v12 identifier];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v50 = v33;
                  _os_log_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_DEFAULT, "No cryptoInitializationVector for preview image %@", buf, 0xCu);
                }
              }
              int v6 = v36;
              goto LABEL_35;
            }
            int v6 = v36;
          }
          else
          {
            __int16 v29 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              +[ICAttachment(CloudKit) addPreviewImages:&v54 toRecord:v29];
            }

LABEL_35:
          }

          goto LABEL_37;
        }
        if (v16 && [v16 code] != 260)
        {
          __int16 v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            __int16 v30 = [v12 identifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v50 = v30;
            __int16 v51 = 2112;
            BOOL v52 = v17;
            _os_log_error_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_ERROR, "Error checking if preview image (%@) exists: %@", buf, 0x16u);
LABEL_40:
          }
        }
        else
        {
          __int16 v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            __int16 v30 = [v12 identifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v50 = v30;
            __int16 v51 = 2112;
            BOOL v52 = v13;
            _os_log_debug_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_DEBUG, "Pushing an attachment with a preview image (%@) but nothing at the URL: %@", buf, 0x16u);
            goto LABEL_40;
          }
        }
        uint64_t v18 = v29;
        goto LABEL_35;
      }
LABEL_37:

      ++v11;
    }
    while (v8 != v11);
    uint64_t v34 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    uint64_t v8 = v34;
  }
  while (v34);
LABEL_44:

  [v35 setObject:v6 forKeyedSubscript:@"PreviewImages"];
  [v35 setObject:v41 forKeyedSubscript:@"PreviewWidths"];
  [v35 setObject:v40 forKeyedSubscript:@"PreviewHeights"];
  [v35 setObject:v39 forKeyedSubscript:@"PreviewScales"];
  [v35 setObject:v38 forKeyedSubscript:@"PreviewScaleWhenDrawings"];
  [v35 setObject:v37 forKeyedSubscript:@"PreviewAppearances"];
  if (v9) {
    [v35 setObject:v9 forKeyedSubscript:@"PreviewCryptoTags"];
  }
  if (v42) {
    [v35 setObject:v42 forKeyedSubscript:@"PreviewCryptoInitializationVectors"];
  }
}

- (void)updatePreviewsFromRecord:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICAttachment *)self previewImages];
  int v6 = (void *)[v5 mutableCopy];

  if (!-[ICAttachment preferLocalPreviewImages](self, "preferLocalPreviewImages") || ![v6 count])
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"PreviewUpdateDate"];

    if (v7)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"PreviewUpdateDate"];
      objc_super v9 = [(ICAttachment *)self previewUpdateDate];
      uint64_t v10 = [v8 laterDate:v9];
      [(ICAttachment *)self setPreviewUpdateDate:v10];
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:@"PreviewImages"];
    uint64_t v88 = [v4 objectForKeyedSubscript:@"PreviewWidths"];
    BOOL v87 = [v4 objectForKeyedSubscript:@"PreviewHeights"];
    uint64_t v86 = [v4 objectForKeyedSubscript:@"PreviewScales"];
    v85 = [v4 objectForKeyedSubscript:@"PreviewScaleWhenDrawings"];
    uint64_t v81 = [v4 objectForKeyedSubscript:@"PreviewCryptoTags"];
    uint64_t v80 = [v4 objectForKeyedSubscript:@"PreviewCryptoInitializationVectors"];
    id v76 = v4;
    id v12 = [v4 objectForKeyedSubscript:@"PreviewAppearances"];
    uint64_t v83 = v11;
    char v84 = v12;
    if ([v11 count])
    {
      unint64_t v14 = 0;
      *(void *)&long long v13 = 138412290;
      long long v75 = v13;
      uint64_t v77 = v6;
      do
      {
        int v15 = (void *)MEMORY[0x1C877DB80]();
        id v16 = [v88 objectAtIndexedSubscript:v14];
        [v16 doubleValue];
        double v18 = v17;

        int v19 = [v87 objectAtIndexedSubscript:v14];
        [v19 doubleValue];
        double v21 = v20;

        __int16 v22 = [v86 objectAtIndexedSubscript:v14];
        [v22 doubleValue];
        double v24 = v23;

        double v25 = [v85 objectAtIndexedSubscript:v14];
        uint64_t v26 = [v25 BOOLValue];

        if (v12 && [v12 count] > v14)
        {
          int v27 = [v12 objectAtIndexedSubscript:v14];
          uint64_t v28 = [v27 unsignedIntValue];
        }
        else
        {
          uint64_t v28 = 0;
        }
        __int16 v29 = objc_msgSend(v11, "objectAtIndexedSubscript:", v14, v75);
        uint64_t v30 = [v29 fileURL];
        if (!v30
          || (uint64_t v31 = (void *)v30,
              [v29 fileURL],
              char v32 = objc_claimAutoreleasedReturnValue(),
              char v33 = [v32 checkResourceIsReachableAndReturnError:0],
              v32,
              uint64_t v11 = v83,
              v31,
              (v33 & 1) == 0))
        {
          long long v42 = [(ICAttachment *)self identifier];
          uint64_t v34 = +[ICAttachmentPreviewImage identifierForContentIdentifier:v42 scale:v28 width:v24 height:v18 appearanceType:v21];

          long long v43 = [(ICAttachment *)self managedObjectContext];
          id v41 = +[ICAttachmentPreviewImage attachmentPreviewImageWithIdentifier:v34 inContext:v43];

          if (v41) {
            [v6 removeObject:v41];
          }
          goto LABEL_24;
        }
        uint64_t v34 = [(ICAttachment *)self attachmentPreviewImageCreatingIfNecessaryWithWidth:v28 height:v26 scale:0 appearanceType:v18 scaleWhenDrawing:v21 metadata:v24];
        if (v34) {
          [v6 removeObject:v34];
        }
        if ([(ICAttachment *)self isPasswordProtected])
        {
          uint64_t v35 = [v34 encryptedPreviewImageURL];
          if ([v81 count] > v14)
          {
            uint64_t v36 = [v81 objectAtIndexedSubscript:v14];
            [v34 setCryptoTag:v36];
          }
          if ([v80 count] > v14)
          {
            long long v37 = [v80 objectAtIndexedSubscript:v14];
            [v34 setCryptoInitializationVector:v37];
          }
          objc_msgSend(v34, "setCryptoIterationCount:", -[ICAttachment cryptoIterationCount](self, "cryptoIterationCount"));
          char v38 = [(ICAttachment *)self cryptoSalt];
          [v34 setCryptoSalt:v38];

          long long v39 = [(ICAttachment *)self cryptoWrappedKey];
          [v34 setCryptoWrappedKey:v39];

          id v40 = [(ICCloudSyncingObject *)self passwordHint];
          [v34 setPasswordHint:v40];

          id v41 = (void *)v35;
          if (!v34) {
            goto LABEL_24;
          }
        }
        else
        {
          id v41 = [v34 previewImageURL];
          if (!v34) {
            goto LABEL_24;
          }
        }
        if (v41)
        {
          uint64_t v82 = v41;
          uint64_t v79 = v15;
          id v97 = 0;
          char v44 = [v34 makeSurePreviewImageDirectoryExists:&v97];
          id v45 = v97;
          if ((v44 & 1) == 0)
          {
            long long v46 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v75;
              id v100 = v45;
              _os_log_error_impl(&dword_1C3A61000, v46, OS_LOG_TYPE_ERROR, "Error creating preview image directory: %@", buf, 0xCu);
            }
          }
          long long v47 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v96 = 0;
          char v48 = [v47 removeItemAtURL:v82 error:&v96];
          id v49 = v96;
          id v50 = v49;
          if (v48)
          {
LABEL_36:
          }
          else
          {
            uint64_t v51 = [v49 code];

            if (v51 != 4)
            {
              long long v47 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v75;
                id v100 = v50;
                _os_log_error_impl(&dword_1C3A61000, v47, OS_LOG_TYPE_ERROR, "Error removing old preview image URL: %@", buf, 0xCu);
              }
              goto LABEL_36;
            }
          }
          uint64_t v78 = v50;
          BOOL v52 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v53 = [v29 fileURL];
          id v95 = 0;
          char v54 = [v52 moveItemAtURL:v53 toURL:v82 error:&v95];
          id v55 = v95;

          if (v54)
          {
            int v6 = v77;
            id v41 = v82;
          }
          else
          {
            uint64_t v56 = [MEMORY[0x1E4F28CB8] defaultManager];
            char v57 = [v29 fileURL];
            id v94 = v55;
            char v58 = [v56 linkItemAtURL:v57 toURL:v82 error:&v94];
            id v59 = v94;

            if (v58)
            {
              id v55 = v59;
              int v6 = v77;
              int v15 = v79;
            }
            else
            {
              uint64_t v60 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v75;
                id v100 = v59;
                _os_log_impl(&dword_1C3A61000, v60, OS_LOG_TYPE_DEFAULT, "Failed to move or link an attachment preview asset. Falling back to copy: %@", buf, 0xCu);
              }

              BOOL v61 = [MEMORY[0x1E4F28CB8] defaultManager];
              __int16 v62 = [v29 fileURL];
              id v93 = v59;
              char v63 = [v61 copyItemAtURL:v62 toURL:v82 error:&v93];
              id v55 = v93;

              int v15 = v79;
              if ((v63 & 1) == 0)
              {
                int v64 = os_log_create("com.apple.notes", "Cloud");
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v75;
                  id v100 = v55;
                  _os_log_error_impl(&dword_1C3A61000, v64, OS_LOG_TYPE_ERROR, "Error writing preview image from asset: %@", buf, 0xCu);
                }
              }
              int v6 = v77;
            }
            id v41 = v82;
          }
          [v34 invalidateCache];

          uint64_t v11 = v83;
        }
LABEL_24:

        ++v14;
        id v12 = v84;
      }
      while (v14 < [v11 count]);
    }
    uint64_t v65 = [v6 count];
    if (v65)
    {
      [(ICAttachment *)self removePreviewImages:v6];
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v66 = v6;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v89 objects:v98 count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v68; ++i)
          {
            if (*(void *)v90 != v69) {
              objc_enumerationMutation(v66);
            }
            uint64_t v71 = *(void *)(*((void *)&v89 + 1) + 8 * i);
            double v72 = [(ICAttachment *)self managedObjectContext];
            [v72 deleteObject:v71];
          }
          uint64_t v68 = [v66 countByEnumeratingWithState:&v89 objects:v98 count:16];
        }
        while (v68);
      }

      uint64_t v11 = v83;
      id v12 = v84;
      if ([(ICAttachment *)self ic_obtainPermanentObjectIDIfNecessary])id v73 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentNeedsPreviewGenerationNotification"]; {
    }
      }
    if ([v11 count] | v65) {
      id v74 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentPreviewImagesDidUpdateNotification"];
    }

    id v4 = v76;
  }
}

- (BOOL)processFallbackAsset:(id)a3 fallbackAssetType:(int64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    objc_super v9 = NSStringFromFallbackAssetType(a4);
    *(_DWORD *)buf = 138413058;
    long long v39 = v8;
    __int16 v40 = 2112;
    __int16 v42 = 2080;
    id v41 = v9;
    long long v43 = "-[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:]";
    __int16 v44 = 1024;
    int v45 = 1167;
    _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "Processing fallback asset… {attachment: %@, type: %@}%s:%d", buf, 0x26u);
  }
  uint64_t v10 = [v6 fileURL];
  char v11 = objc_msgSend(v10, "ic_isReachable");

  if (v11)
  {
    if (a4 == 1)
    {
      double v18 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];
      char v13 = [v18 beginGeneration];

      unint64_t v14 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];
      if ([(ICAttachment *)self isPasswordProtected]) {
        [(ICAttachment *)self fallbackPDFEncryptedURL];
      }
      else {
        [(ICAttachment *)self fallbackPDFURL];
      }
    }
    else
    {
      if (a4)
      {
        unint64_t v14 = 0;
        id v16 = 0;
        goto LABEL_23;
      }
      id v12 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];
      char v13 = [v12 beginGeneration];

      unint64_t v14 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];
      if ([(ICAttachment *)self isPasswordProtected]) {
        [(ICAttachment *)self fallbackImageEncryptedURL];
      }
      else {
        [(ICAttachment *)self fallbackImageURL];
      }
    uint64_t v15 = };
    id v16 = v15;
    if (v13)
    {
      int v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      double v20 = [v6 fileURL];
      id v37 = 0;
      char v21 = [v19 moveItemAtURL:v20 toURL:v16 error:&v37];
      os_log_t v22 = (os_log_t)v37;

      if (v21)
      {
LABEL_30:
        char v32 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:](self, v32);
        }

        char v17 = [v14 commitGeneration];
        goto LABEL_33;
      }
      double v23 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.5();
      }

      double v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      double v25 = [v6 fileURL];
      os_log_t v36 = v22;
      char v26 = [v24 linkItemAtURL:v25 toURL:v16 error:&v36];
      int v27 = v36;

      if (v26)
      {
        os_log_t v22 = v27;
        goto LABEL_30;
      }
      uint64_t v28 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.4();
      }

      __int16 v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v30 = [v6 fileURL];
      uint64_t v35 = v27;
      char v31 = [v29 copyItemAtURL:v30 toURL:v16 error:&v35];
      os_log_t v22 = v35;

      if (v31) {
        goto LABEL_30;
      }
      uint64_t v34 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:]();
      }

      [v14 rollbackGeneration];
LABEL_26:
      char v17 = 0;
LABEL_33:

      goto LABEL_34;
    }
LABEL_23:
    os_log_t v22 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:](self);
    }

    goto LABEL_26;
  }
  id v16 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.6(self);
  }
  char v17 = 0;
  unint64_t v14 = v16;
LABEL_34:

  return v17;
}

- (void)mergeFallbackImageAndPDFFromRecord:(id)a3
{
  id v13 = a3;
  id v4 = [v13 objectForKeyedSubscript:@"FallbackImage"];
  if (v4) {
    [(ICAttachment *)self processFallbackAsset:v4 fallbackAssetType:0];
  }
  id v5 = [v13 objectForKeyedSubscript:@"FallbackPDF"];
  if (v5) {
    [(ICAttachment *)self processFallbackAsset:v5 fallbackAssetType:1];
  }
  id v6 = [v13 objectForKeyedSubscript:@"FallbackImageCryptoTag"];
  [(ICAttachment *)self setFallbackImageCryptoTag:v6];

  uint64_t v7 = [v13 objectForKeyedSubscript:@"FallbackImageCryptoInitializationVector"];
  [(ICAttachment *)self setFallbackImageCryptoInitializationVector:v7];

  uint64_t v8 = [v13 objectForKeyedSubscript:@"FallbackPDFCryptoTag"];
  [(ICAttachment *)self setFallbackPDFCryptoTag:v8];

  objc_super v9 = [v13 objectForKeyedSubscript:@"FallbackPDFCryptoInitializationVector"];
  [(ICAttachment *)self setFallbackPDFCryptoInitializationVector:v9];

  uint64_t v10 = [v13 objectForKeyedSubscript:@"FallbackTitle"];
  if (v10) {
    [(ICAttachment *)self setFallbackTitle:v10];
  }
  char v11 = [v13 objectForKeyedSubscript:@"FallbackSubtitleIOS"];
  if (v11) {
    [(ICAttachment *)self setFallbackSubtitleIOS:v11];
  }
  id v12 = [v13 objectForKeyedSubscript:@"FallbackSubtitleMac"];
  if (v12) {
    [(ICAttachment *)self setFallbackSubtitleMac:v12];
  }
}

- (void)addPaperBundleToRecordIfAppropriate:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  id v4 = [(ICAttachment *)self attachmentModel];
  id v5 = ICDynamicCast();

  if (v5)
  {
    id v6 = [[_TtC11NotesShared21ICSystemPaperDocument alloc] initWithPaperAttachment:self];
    uint64_t v7 = [(ICSystemPaperDocument *)v6 archiveBundleForSyncAndReturnError:0];
    uint64_t v8 = [v7 databaseArchive];
    objc_super v9 = +[ICCloudSyncingObject assetForTemporaryURL:v8];

    if (v9) {
      [v12 setObject:v9 forKeyedSubscript:@"PaperDatabase"];
    }
    uint64_t v10 = [v7 assetArchives];
    char v11 = objc_msgSend(v10, "ic_compactMap:", &__block_literal_global_58);

    if (v11) {
      [v12 setObject:v11 forKeyedSubscript:@"PaperAssets"];
    }
  }
}

id __62__ICAttachment_CloudKit__addPaperBundleToRecordIfAppropriate___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ICCloudSyncingObject assetForTemporaryURL:a2];
}

- (void)mergePaperBundleFromRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 objectForKeyedSubscript:@"PaperDatabase"];
  id v6 = ICDynamicCast();
  uint64_t v7 = [v6 fileURL];

  objc_opt_class();
  uint64_t v8 = [v4 objectForKeyedSubscript:@"PaperAssets"];

  objc_super v9 = ICDynamicCast();
  uint64_t v10 = objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_271_0);

  char v11 = [[_TtC11NotesShared21ICSystemPaperDocument alloc] initWithPaperAttachment:self];
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = [v7 path];
    int v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      uint64_t v15 = [[ICSystemPaperSyncArchive alloc] initWithDatabaseArchive:v7 assetArchives:v10];
      id v19 = 0;
      BOOL v16 = [(ICSystemPaperDocument *)v11 writeNewVersionFromSyncArchive:v15 error:&v19];
      id v17 = v19;
      if (v16)
      {
        os_log_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v18 postNotificationName:@"ICAttachmentDidMergePaperKitBundleNotification" object:self];
      }
      else
      {
        os_log_t v18 = os_log_create("com.apple.notes", "SystemPaper");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ICAttachment(CloudKit) mergePaperBundleFromRecord:]();
        }
      }
    }
  }
}

id __53__ICAttachment_CloudKit__mergePaperBundleFromRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  unsigned int v3 = ICDynamicCast();

  id v4 = [v3 fileURL];

  return v4;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 2;
}

- (unint64_t)searchResultType
{
  return 1;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  if ([(ICAttachment *)self isDeleted]) {
    return 1;
  }
  id v4 = [(ICAttachment *)self note];
  if (!v4
    || ([(ICAttachment *)self markedForDeletion] & 1) != 0
    || ([(ICAttachment *)self needsInitialFetchFromCloud] & 1) != 0)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v6 = [(ICAttachment *)self note];
    if (([v6 isHiddenFromSearch] & 1) != 0
      || ([(ICAttachment *)self isPasswordProtected] & 1) != 0
      || [(ICAttachment *)self isChildOfDocumentGallery]
      || [(ICAttachment *)self attachmentType] == 9
      || [(ICAttachment *)self attachmentType] == 10
      || [(ICAttachment *)self attachmentType] == 13)
    {
      BOOL v3 = 1;
    }
    else if ([(ICAttachment *)self attachmentType] == 4)
    {
      uint64_t v7 = [(ICAttachment *)self parentAttachment];
      if (v7) {
        BOOL v3 = 1;
      }
      else {
        BOOL v3 = [(ICAttachment *)self isUnsupported];
      }
    }
    else
    {
      BOOL v3 = [(ICAttachment *)self isUnsupported];
    }
  }
  return v3;
}

- (BOOL)isHiddenFromSearch
{
  if ([(ICAttachment *)self isHiddenFromIndexing]) {
    return 1;
  }
  return [(ICAttachment *)self isTable];
}

- (BOOL)isVisibleTable
{
  if ([(ICAttachment *)self isDeleted])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(ICAttachment *)self note];
    if (!v4
      || ([(ICAttachment *)self markedForDeletion] & 1) != 0
      || ([(ICAttachment *)self needsInitialFetchFromCloud] & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      id v6 = [(ICAttachment *)self note];
      if (([v6 isHiddenFromSearch] & 1) != 0 || !-[ICAttachment isTable](self, "isTable")) {
        LOBYTE(v3) = 0;
      }
      else {
        BOOL v3 = ![(ICAttachment *)self isUnsupported];
      }
    }
  }
  return v3;
}

- (BOOL)isMovable
{
  return 0;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)@"Modern";
}

- (NSString)searchIndexingIdentifier
{
  id v2 = [(ICAttachment *)self objectID];
  BOOL v3 = [v2 URIRepresentation];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  id v2 = [(ICAttachment *)self note];
  BOOL v3 = [v2 account];
  id v4 = [v3 identifier];

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  BOOL v3 = [(ICAttachment *)self typeUTI];
  id v4 = (__CFString *)[v3 copy];

  if (!v4 || ![(__CFString *)v4 length])
  {

    id v4 = @"com.apple.notes.spotlightrecord";
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:v4];
  id v6 = [(ICCloudSyncingObject *)self modificationDate];
  [v5 setContentModificationDate:v6];

  uint64_t v7 = [(ICCloudSyncingObject *)self creationDate];
  [v5 setContentCreationDate:v7];

  uint64_t v8 = [(ICCloudSyncingObject *)self creationDate];
  [v5 setAddedDate:v8];

  return (CSSearchableItemAttributeSet *)v5;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  v37[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ICAttachment *)self userActivityContentAttributeSet];
  id v4 = [(ICAttachment *)self title];
  if (![v4 length])
  {
    id v5 = [(ICAttachment *)self media];
    uint64_t v6 = [v5 filename];

    id v4 = (void *)v6;
  }
  [v3 setDisplayName:v4];
  uint64_t v7 = [(ICAttachment *)self summary];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    objc_super v9 = [(ICAttachment *)self summary];
    [v3 setContentDescription:v9];
  }
  uint64_t v10 = [(ICAttachment *)self searchableTextContentWithoutTitle];
  char v11 = (void *)v10;
  if (v4)
  {
    uint64_t v12 = [v4 stringByAppendingFormat:@" %@", v10];

    char v11 = (void *)v12;
  }
  [v3 setTextContent:v11];
  objc_msgSend(v3, "setIc_searchResultType:", 1);
  id v13 = [(ICAttachment *)self typeUTI];

  if (v13)
  {
    int v14 = (void *)MEMORY[0x1E4F442D8];
    uint64_t v15 = [(ICAttachment *)self typeUTI];
    BOOL v16 = [v14 typeWithIdentifier:v15];
    id v17 = [v16 supertypes];
    os_log_t v18 = objc_msgSend(v17, "ic_map:", &__block_literal_global_61);

    id v19 = [(ICAttachment *)self typeUTI];
    v37[0] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    char v21 = [v18 allObjects];
    os_log_t v22 = [v20 arrayByAddingObjectsFromArray:v21];

    if ([(ICAttachment *)self attachmentType] == 14)
    {
      double v23 = [(id)*MEMORY[0x1E4F44450] identifier];
      uint64_t v24 = [v22 arrayByAddingObject:v23];

      os_log_t v22 = (void *)v24;
    }
    [v3 setAttachmentTypes:v22];
  }
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  double v25 = [(ICAttachment *)self attachmentModel];
  char v26 = [v25 providerFileTypes];
  [v3 setProviderFileTypes:v26];

  int v27 = [(ICAttachment *)self attachmentModel];
  uint64_t v28 = [v27 providerDataTypes];
  [v3 setProviderDataTypes:v28];

  [v3 setDataOwnerType:&unk_1F1F62A18];
  if ([(ICCloudSyncingObject *)self isSharedViaICloud]
    && ([(ICAttachment *)self attachmentType] == 7
     || [(ICAttachment *)self attachmentType] == 8))
  {
    [(ICCloudSyncingObject *)self addEmailAddressesAndPhoneNumbersToAttributeSet:v3];
  }
  __int16 v29 = [(ICAttachment *)self note];
  uint64_t v30 = [v29 objectID];
  char v31 = [v30 URIRepresentation];
  char v32 = [v31 absoluteString];
  objc_msgSend(v3, "setIc_relatedModernNoteUniqueIdentifier:", v32);

  char v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICAttachment supportsPhotosProcessing](self, "supportsPhotosProcessing"));
  [v3 setEligibleForPhotosProcessing:v33];

  uint64_t v34 = [(ICAttachment *)self urlString];

  if (v34)
  {
    uint64_t v35 = [(ICAttachment *)self urlString];
    objc_msgSend(v3, "ic_setURLString:", v35);
  }
  if (objc_opt_respondsToSelector()) {
    [(ICAttachment *)self associateAppEntityWithSearchableItemAttributeSet:v3];
  }

  return (CSSearchableItemAttributeSet *)v3;
}

uint64_t __59__ICAttachment_SearchIndexable__searchableItemAttributeSet__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)searchableTextContent
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICAttachment *)self title];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(ICAttachment *)self searchableTextContentWithoutTitle];
  [v3 addObject:v5];

  uint64_t v6 = [v3 componentsJoinedByString:@" "];

  return v6;
}

- (id)searchableTextContentWithoutTitle
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICAttachment *)self urlString];
  if (v4 && ![(ICAttachment *)self isMap]) {
    [v3 addObject:v4];
  }
  id v5 = [(ICAttachment *)self summary];
  if (v5) {
    [v3 addObject:v5];
  }
  uint64_t v6 = [(ICAttachment *)self attachmentModel];
  uint64_t v7 = [v6 searchableTextContent];

  if ([v7 length]) {
    [v3 addObject:v7];
  }
  uint64_t v8 = [v3 componentsJoinedByString:@" "];

  return v8;
}

- (BOOL)supportsPhotosProcessing
{
  return [(ICAttachment *)self attachmentType] == 3
      || [(ICAttachment *)self attachmentType] == 5;
}

- (id)dataForTypeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__51;
  BOOL v16 = __Block_byref_object_dispose__51;
  id v17 = 0;
  if ([v4 isEqualToString:@"com.apple.notes.noteitemprovider"])
  {
    id v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(SearchIndexable) dataForTypeIdentifier:](v5);
    }
  }
  else
  {
    uint64_t v6 = [(ICAttachment *)self managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__ICAttachment_SearchIndexable__dataForTypeIdentifier___block_invoke;
    v9[3] = &unk_1E64A4ED8;
    char v11 = &v12;
    void v9[4] = self;
    id v10 = v4;
    [v6 performBlockAndWait:v9];
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__ICAttachment_SearchIndexable__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachmentModel];
  uint64_t v2 = [v5 dataForTypeIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__51;
  BOOL v16 = __Block_byref_object_dispose__51;
  id v17 = 0;
  if ([v4 isEqualToString:@"com.apple.notes.noteitemprovider"])
  {
    id v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(SearchIndexable) dataForTypeIdentifier:](v5);
    }
  }
  else
  {
    uint64_t v6 = [(ICAttachment *)self managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__ICAttachment_SearchIndexable__fileURLForTypeIdentifier___block_invoke;
    v9[3] = &unk_1E64A4ED8;
    char v11 = &v12;
    void v9[4] = self;
    id v10 = v4;
    [v6 performBlockAndWait:v9];
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__ICAttachment_SearchIndexable__fileURLForTypeIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachmentModel];
  uint64_t v2 = [v5 fileURLForTypeIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)attachmentSectionSortOrder
{
  if (attachmentSectionSortOrder_onceToken != -1) {
    dispatch_once(&attachmentSectionSortOrder_onceToken, &__block_literal_global_187_0);
  }
  uint64_t v2 = (void *)attachmentSectionSortOrder_sSortOrderSet;
  return v2;
}

uint64_t __42__ICAttachment_attachmentSectionSortOrder__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v1 = (void *)attachmentSectionSortOrder_sSortOrderSet;
  attachmentSectionSortOrder_sSortOrderSet = (uint64_t)v0;

  [(id)attachmentSectionSortOrder_sSortOrderSet addObject:&unk_1F1F62A30];
  [(id)attachmentSectionSortOrder_sSortOrderSet addObject:&unk_1F1F62A48];
  [(id)attachmentSectionSortOrder_sSortOrderSet addObject:&unk_1F1F62A60];
  [(id)attachmentSectionSortOrder_sSortOrderSet addObject:&unk_1F1F62A78];
  [(id)attachmentSectionSortOrder_sSortOrderSet addObject:&unk_1F1F62A90];
  [(id)attachmentSectionSortOrder_sSortOrderSet addObject:&unk_1F1F62AA8];
  uint64_t v2 = (void *)attachmentSectionSortOrder_sSortOrderSet;
  return [v2 addObject:&unk_1F1F62AC0];
}

- (void)suppressFileDeletion
{
}

- (void)prepareForDeletion
{
  v11.receiver = self;
  v11.super_class = (Class)ICAttachment;
  [(ICAttachment *)&v11 prepareForDeletion];
  uint64_t v3 = [(ICAttachment *)self identifier];
  if (v3)
  {
    id v4 = [(ICAttachment *)self note];
    uint64_t v5 = [v4 account];
    if (!v5)
    {
LABEL_5:

      goto LABEL_6;
    }
    uint64_t v6 = (void *)v5;
    BOOL v7 = [(ICAttachment *)self suppressesFileDeletion];

    if (!v7)
    {
      uint64_t v8 = objc_opt_class();
      id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
      objc_super v9 = [(ICAttachment *)self note];
      id v10 = [v9 account];
      [v8 purgeAttachmentFilesForIdentifiers:v4 account:v10];

      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)willRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  -[ICAttachmentModel attachmentWillRefresh:](self->_attachmentModel, "attachmentWillRefresh:");
  v5.receiver = self;
  v5.super_class = (Class)ICAttachment;
  [(ICAttachment *)&v5 willRefresh:v3];
}

- (void)didRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICAttachment;
  -[ICAttachment didRefresh:](&v5, sel_didRefresh_);
  [(ICAttachmentModel *)self->_attachmentModel attachmentDidRefresh:v3];
}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  if (![(ICAttachment *)self isUnsupported]
    && ![(ICCloudSyncingObject *)self needsInitialFetchFromCloudCheckingParent])
  {
    objc_super v5 = [(ICAttachment *)self typeUTI];

    if (v5)
    {
      uint64_t v6 = [(ICAttachment *)self typeUTI];
      if (([v6 isEqualToString:@"com.apple.paper.doc"] & 1) == 0)
      {
        BOOL v7 = [(ICAttachment *)self typeUTI];
        if (![v7 isEqualToString:@"com.apple.paper.doc.pdf"])
        {
          uint64_t v14 = [(ICAttachment *)self typeUTI];
          char v15 = [v14 isEqualToString:@"com.apple.paper.doc.scan"];

          if ((v15 & 1) == 0)
          {
            BOOL v16 = [(ICAttachment *)self typeUTI];
            int v17 = [v16 isEqualToString:@"com.apple.paper"];

            if (v17)
            {
              os_log_t v18 = [(ICAttachment *)self paperBundleModel];
              char v19 = [v18 paperHasMath];

              if ((v19 & 1) == 0)
              {
                double v20 = [(ICAttachment *)self systemPaperModel];
                char v21 = [v20 paperHasNewInksSpring2024];

                if (v21)
                {
                  int64_t v10 = 14;
                }
                else
                {
                  uint64_t v28 = [(ICAttachment *)self systemPaperModel];
                  char v29 = [v28 paperHasNewInks2023];

                  if (v29)
                  {
                    int64_t v10 = 13;
                  }
                  else
                  {
                    char v32 = [(ICAttachment *)self account];
                    char v33 = [v32 isDataSeparated];

                    if ((v33 & 1) != 0
                      || ([(ICAttachment *)self systemPaperModel],
                          uint64_t v34 = objc_claimAutoreleasedReturnValue(),
                          char v35 = [v34 paperHasNewInks2022],
                          v34,
                          (v35 & 1) != 0))
                    {
                      int64_t v10 = 10;
                    }
                    else
                    {
                      __int16 v40 = [(ICAttachment *)self systemPaperModel];
                      int v41 = [v40 paperHasEnhancedCanvas];

                      if (v41) {
                        int64_t v10 = 9;
                      }
                      else {
                        int64_t v10 = 7;
                      }
                    }
                  }
                }
                goto LABEL_16;
              }
            }
            else
            {
              uint64_t v22 = [(ICAttachment *)self parentAttachment];
              if (!v22
                || (double v23 = (void *)v22,
                    [(ICAttachment *)self typeUTI],
                    uint64_t v24 = objc_claimAutoreleasedReturnValue(),
                    BOOL v25 = +[ICAttachment typeUTIIsPlayableAudio:v24], v24, v23, !v25))
              {
                if ([(ICAttachment *)self hasVisibleInlineAttachments])
                {
                  int64_t v10 = 6;
                }
                else
                {
                  char v26 = [(ICAttachment *)self typeUTI];
                  char v27 = [v26 isEqualToString:@"com.apple.drawing.2"];

                  if (v27)
                  {
                    int64_t v10 = 4;
                  }
                  else
                  {
                    uint64_t v30 = [(ICAttachment *)self typeUTI];
                    char v31 = [v30 isEqualToString:@"com.apple.drawing"];

                    if (v31)
                    {
                      int64_t v10 = 3;
                    }
                    else
                    {
                      os_log_t v36 = [(ICAttachment *)self typeUTI];
                      char v37 = [v36 isEqualToString:@"com.apple.notes.table"];

                      if (v37)
                      {
                        int64_t v10 = 2;
                      }
                      else
                      {
                        char v38 = [(ICAttachment *)self typeUTI];
                        int v39 = [v38 isEqualToString:@"com.apple.notes.gallery"];

                        if (v39) {
                          int64_t v10 = 2;
                        }
                        else {
                          int64_t v10 = 0;
                        }
                      }
                    }
                  }
                }
                goto LABEL_16;
              }
            }
            goto LABEL_9;
          }
LABEL_8:
          uint64_t v8 = [(ICAttachment *)self paperBundleModel];
          char v9 = [v8 paperHasMath];

          if ((v9 & 1) == 0)
          {
            uint64_t v12 = [(ICAttachment *)self paperBundleModel];
            int v13 = [v12 paperHasNewInksSpring2024];

            if (v13) {
              int64_t v10 = 14;
            }
            else {
              int64_t v10 = 13;
            }
            goto LABEL_16;
          }
LABEL_9:
          int64_t v10 = 15;
LABEL_16:
          v42.receiver = self;
          v42.super_class = (Class)ICAttachment;
          int64_t result = [(ICCloudSyncingObject *)&v42 intrinsicNotesVersionForScenario:a3];
          if (v10 > result) {
            return v10;
          }
          return result;
        }
      }
      goto LABEL_8;
    }
  }
  return [(ICAttachment *)self minimumSupportedNotesVersion];
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (BOOL)supportsNotesVersionTracking
{
  return 1;
}

- (void)willUpdateDeviceReplicaIDsToNotesVersion:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 == 6)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [(ICCloudSyncingObject *)self deviceReplicaIDs];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(ICAttachmentModel *)self->_attachmentModel removeTimestampsForReplicaID:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

+ (id)attachmentIdentifiersForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v5 = [v3 managedObjectContext];
  uint64_t v6 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ICAttachment"];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"note.account == %@", v3];
  [v6 setPredicate:v7];

  [v6 setResultType:2];
  [v6 setPropertiesToFetch:&unk_1F1F62D60];
  id v13 = 0;
  uint64_t v8 = [v5 executeFetchRequest:v6 error:&v13];
  id v9 = v13;
  if (v9)
  {
    long long v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ICAttachment attachmentIdentifiersForAccount:]();
    }
    long long v11 = v10;
  }
  else
  {
    long long v11 = [v8 valueForKey:@"identifier"];
    if (!v11) {
      goto LABEL_8;
    }
    [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    id v4 = v10 = v4;
  }

LABEL_8:
  return v4;
}

+ (void)purgeAttachmentFilesForIdentifiers:(id)a3 account:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v30 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v5;
  uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v34)
  {
    uint64_t v31 = *(void *)v44;
    id v32 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v8;
        uint64_t v9 = *(void *)(*((void *)&v43 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1C877DB80]();
        uint64_t v10 = +[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:v9 inAccount:v6];
        if (v10)
        {
          long long v11 = +[ICFileUtilities coordinateDeleteItemAt:v10 coordinator:v30];
          if (v11)
          {
            long long v12 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v49 = v11;
              _os_log_error_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_ERROR, "Error removing paper bundle file: %@", buf, 0xCu);
            }
          }
        }
        char v35 = (void *)v10;
        id v13 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v14 = [a1 fallbackImageFallbackURLForIdentifier:v9 account:v6];
        objc_msgSend(v13, "ic_addNonNilObject:", v14);

        char v15 = [a1 fallbackImageEncryptedFallbackURLForIdentifier:v9 account:v6];
        objc_msgSend(v13, "ic_addNonNilObject:", v15);

        BOOL v16 = [a1 fallbackImageContainerURLForIdentifier:v9 account:v6];
        objc_msgSend(v13, "ic_addNonNilObject:", v16);

        int v17 = [a1 fallbackPDFFallbackURLForIdentifier:v9 account:v6];
        objc_msgSend(v13, "ic_addNonNilObject:", v17);

        os_log_t v18 = [a1 fallbackPDFEncryptedFallbackURLForIdentifier:v9 account:v6];
        objc_msgSend(v13, "ic_addNonNilObject:", v18);

        char v19 = [a1 fallbackPDFContainerURLForIdentifier:v9 account:v6];
        objc_msgSend(v13, "ic_addNonNilObject:", v19);

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        double v20 = (void *)[v13 copy];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v40;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v40 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * v24);
              id v38 = 0;
              [v7 removeItemAtURL:v25 error:&v38];
              id v26 = v38;
              char v27 = v26;
              if (v26 && [v26 code] != 4)
              {
                uint64_t v28 = os_log_create("com.apple.notes", "CoreData");
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v49 = v27;
                  _os_log_error_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_ERROR, "Error removing attachment file: %@", buf, 0xCu);
                }
              }
              ++v24;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v22);
        }

        uint64_t v8 = v37 + 1;
        id v6 = v32;
      }
      while (v37 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v34);
  }
}

- (NSURL)URL
{
  URL = self->_URL;
  if (URL) {
    goto LABEL_2;
  }
  uint64_t v5 = [(ICAttachment *)self urlString];
  if (!v5)
  {
    URL = self->_URL;
LABEL_2:
    id v3 = URL;
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

LABEL_5:
  return v3;
}

- (BOOL)hasDeepLink
{
  id v3 = [(ICAttachment *)self synapseData];
  if (v3)
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(ICAttachment *)self attachmentModel];
    char v4 = [v5 hasDeepLink];
  }
  return v4;
}

- (BOOL)isReadOnly
{
  id v3 = [(ICAttachment *)self note];
  BOOL v4 = ([v3 isSharedReadOnly] & 1) != 0
    || [(ICCloudSyncingObject *)self isSharedReadOnly];

  return v4;
}

- (BOOL)isAudio
{
  return [(ICAttachment *)self attachmentType] == 4;
}

- (BOOL)isFolder
{
  id v3 = [(ICAttachment *)self typeUTI];
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F442D8];
    uint64_t v5 = [(ICAttachment *)self typeUTI];
    id v6 = [v4 typeWithIdentifier:v5];
    char v7 = [v6 conformsToType:*MEMORY[0x1E4F443C8]];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isURL
{
  id v3 = [(ICAttachment *)self typeUTI];
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F442D8];
    uint64_t v5 = [(ICAttachment *)self typeUTI];
    id v6 = [v4 typeWithIdentifier:v5];
    char v7 = [v6 conformsToType:*MEMORY[0x1E4F444F8]];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isMap
{
  BOOL v3 = [(ICAttachment *)self isURL];
  if (v3)
  {
    BOOL v4 = [(ICAttachment *)self URL];
    char v5 = objc_msgSend(v4, "ic_isMapURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isiTunes
{
  BOOL v3 = [(ICAttachment *)self isURL];
  if (v3)
  {
    BOOL v4 = [(ICAttachment *)self URL];
    char v5 = objc_msgSend(v4, "ic_isiTunesURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isAppStore
{
  BOOL v3 = [(ICAttachment *)self isURL];
  if (v3)
  {
    BOOL v4 = [(ICAttachment *)self URL];
    char v5 = objc_msgSend(v4, "ic_isAppStoreURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isPodcasts
{
  BOOL v3 = [(ICAttachment *)self isURL];
  if (v3)
  {
    BOOL v4 = [(ICAttachment *)self URL];
    char v5 = objc_msgSend(v4, "ic_isPodcastsURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isDrawing
{
  unsigned int v2 = [(ICAttachment *)self attachmentType];
  return (v2 < 0xE) & (0x2600u >> v2);
}

- (BOOL)isPencilKitDrawing
{
  return [(ICAttachment *)self attachmentType] - 9 < 2;
}

- (BOOL)isNews
{
  BOOL v3 = [(ICAttachment *)self isURL];
  if (v3)
  {
    BOOL v4 = [(ICAttachment *)self URL];
    char v5 = objc_msgSend(v4, "ic_isNewsURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isChildOfDocumentGallery
{
  unsigned int v2 = self;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(ICAttachment *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__ICAttachment_isChildOfDocumentGallery__block_invoke;
  v5[3] = &unk_1E64A4528;
  v5[4] = v2;
  void v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __40__ICAttachment_isChildOfDocumentGallery__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentAttachment];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 attachmentType] == 11;
}

- (BOOL)isTable
{
  return [(ICAttachment *)self attachmentType] == 12;
}

- (BOOL)isScannedDocument
{
  return [(ICAttachment *)self attachmentType] == 11;
}

- (BOOL)isImage
{
  return [(ICAttachment *)self attachmentType] == 3;
}

- (BOOL)supportsRenaming
{
  if ([(ICAttachment *)self isReadOnly]) {
    return 0;
  }
  unsigned int v4 = [(ICAttachment *)self attachmentType];
  BOOL result = 0;
  if (v4 <= 0xF)
  {
    if (((1 << v4) & 0xCA74) != 0)
    {
      return 1;
    }
    else if (v4 == 3)
    {
      return ![(ICAttachment *)self isChildOfDocumentGallery];
    }
  }
  return result;
}

- (BOOL)previewsSupportMultipleAppearances
{
  id v2 = [(ICAttachment *)self attachmentModel];
  char v3 = [v2 previewsSupportMultipleAppearances];

  return v3;
}

- (BOOL)preferLocalPreviewImages
{
  id v2 = [(ICAttachment *)self attachmentModel];
  char v3 = [v2 preferLocalPreviewImages];

  return v3;
}

- (id)defaultTitle
{
  char v3 = objc_opt_class();
  uint64_t v4 = [(ICAttachment *)self attachmentType];
  return (id)[v3 defaultTitleForAttachmentType:v4];
}

- (void)setNote:(id)a3
{
  id v4 = a3;
  char v5 = [(ICAttachment *)self note];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(ICAttachment *)self note];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      char v9 = [(ICAttachment *)self note];
      uint64_t v10 = [v9 account];
      long long v11 = [v4 account];

      if (v10 != v11)
      {
        long long v12 = [v4 account];
        [(ICAttachment *)self accountWillChangeToAccount:v12];
      }
    }
    [(ICAttachment *)self willChangeValueForKey:@"note"];
    [(ICAttachment *)self willChangeValueForKey:@"parentCloudObject"];
    [(ICAttachment *)self setPrimitiveValue:v4 forKey:@"note"];
    [(ICAttachment *)self didChangeValueForKey:@"note"];
    [(ICAttachment *)self didChangeValueForKey:@"parentCloudObject"];
    id v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachment setNote:]();
    }

    [(ICCloudSyncingObject *)self resetToIntrinsicNotesVersionAndPropagateToChildObjects];
  }
}

- (BOOL)hasImageFilterType
{
  char v3 = NSStringFromSelector(sel_imageFilterType);
  [(ICAttachment *)self willAccessValueForKey:v3];
  id v4 = [(ICAttachment *)self primitiveValueForKey:v3];
  [(ICAttachment *)self didAccessValueForKey:v3];

  return v4 != 0;
}

- (void)setImageFilterType:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ([(ICAttachment *)self imageFilterType] != a3)
  {
    if (objc_opt_respondsToSelector()) {
      [(ICAttachment *)self setCachedImage:0];
    }
    [(ICAttachment *)self invalidateAttachmentPreviewImages];
    [(ICAttachment *)self willChangeValueForKey:@"imageFilterType"];
    char v5 = [MEMORY[0x1E4F28ED0] numberWithShort:v3];
    [(ICAttachment *)self setPrimitiveValue:v5 forKey:@"imageFilterType"];

    [(ICAttachment *)self didChangeValueForKey:@"imageFilterType"];
  }
}

- (BOOL)hasOrientation
{
  uint64_t v3 = NSStringFromSelector(sel_orientation);
  [(ICAttachment *)self willAccessValueForKey:v3];
  id v4 = [(ICAttachment *)self primitiveValueForKey:v3];
  [(ICAttachment *)self didAccessValueForKey:v3];

  return v4 != 0;
}

- (void)setOrientation:(signed __int16)a3
{
  uint64_t v3 = a3;
  if ([(ICAttachment *)self orientation] != a3)
  {
    if (objc_opt_respondsToSelector()) {
      [(ICAttachment *)self setCachedImage:0];
    }
    [(ICAttachment *)self invalidateAttachmentPreviewImages];
    [(ICAttachment *)self willChangeValueForKey:@"orientation"];
    char v5 = [MEMORY[0x1E4F28ED0] numberWithShort:v3];
    [(ICAttachment *)self setPrimitiveValue:v5 forKey:@"orientation"];

    [(ICAttachment *)self didChangeValueForKey:@"orientation"];
  }
}

- (CGRect)bounds
{
  [(ICAttachment *)self originX];
  double v4 = v3;
  [(ICAttachment *)self originY];
  double v6 = v5;
  [(ICAttachment *)self sizeWidth];
  double v8 = v7;
  [(ICAttachment *)self sizeHeight];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  [(ICAttachment *)self setOriginX:a3.origin.x];
  [(ICAttachment *)self setOriginY:y];
  [(ICAttachment *)self setSizeWidth:width];
  [(ICAttachment *)self setSizeHeight:height];
}

- (id)fileSizeString
{
  double v3 = [(ICAttachment *)self media];
  double v4 = [v3 mediaURL];
  if (v4)
  {
    double v5 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[ICAttachment fileSize](self, "fileSize"), 0);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)setParentAttachment:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICAttachment;
  [(ICBaseAttachment *)&v6 setParentAttachment:a3];
  double v4 = [(ICAttachment *)self typeUTI];

  if (v4)
  {
    double v5 = [(ICAttachment *)self typeUTI];
    [(ICAttachment *)self updateAttachmentSectionWithTypeUTI:v5];
  }
}

- (void)updateAttachmentSectionWithTypeUTI:(id)a3
{
  id v12 = a3;
  double v4 = [(ICAttachment *)self parentAttachment];
  double v5 = [v4 typeUTI];

  if (!v5
    || ([v4 attachmentModel],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 sectionForSubAttachments],
        v6,
        !v7))
  {
    double v8 = [v4 attachmentModel];
    char v9 = [v8 hidesSubAttachmentsInAttachmentBrowser];

    if (v9)
    {
      uint64_t v7 = 0;
    }
    else
    {
      double v10 = objc_opt_class();
      double v11 = [(ICAttachment *)self URL];
      uint64_t v7 = [v10 sectionFromTypeUTI:v12 url:v11];
    }
  }
  if ([(ICAttachment *)self section] != v7) {
    [(ICAttachment *)self setSection:v7];
  }
}

+ (signed)sectionFromTypeUTI:(id)a3 url:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (+[ICAttachment typeUTIIsImage:v5]
      || +[ICAttachment typeUTIIsPlayableMovie:v5])
    {
      signed __int16 v7 = 1;
    }
    else if (+[ICAttachment typeUTIIsPlayableAudio:v5])
    {
      signed __int16 v7 = 5;
    }
    else
    {
      char v9 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v5];
      int v10 = [v9 conformsToType:*MEMORY[0x1E4F444F8]];

      if (v10)
      {
        if (objc_msgSend(v6, "ic_isMapURL")) {
          signed __int16 v7 = 3;
        }
        else {
          signed __int16 v7 = 4;
        }
      }
      else if (+[ICAttachment typeUTIIsDrawing:v5] {
             || +[ICAttachment typeUTIIsInlineDrawing:v5]
      }
             || +[ICAttachment typeUTIIsSystemPaper:v5])
      {
        signed __int16 v7 = 2;
      }
      else
      {
        double v11 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v5];
        id v12 = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.apple.paper.doc.scan"];
        int v13 = [v11 conformsToType:v12];

        if (v13) {
          signed __int16 v7 = 7;
        }
        else {
          signed __int16 v7 = 6;
        }
      }
    }
  }
  else
  {
    signed __int16 v7 = 0;
  }

  return v7;
}

- (void)setUrlString:(id)a3
{
  id v4 = a3;
  [(ICAttachment *)self willChangeValueForKey:@"urlString"];
  [(ICAttachment *)self willChangeValueForKey:@"URL"];
  URL = self->_URL;
  self->_URL = 0;

  [(ICCloudSyncingObject *)self setPrimitiveValue:v4 forEncryptableKey:@"urlString"];
  if ([(ICAttachment *)self isURL])
  {
    if ([(ICAttachment *)self isMap]) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 4;
    }
    [(ICAttachment *)self setSection:v6];
  }
  [(ICAttachment *)self didChangeValueForKey:@"URL"];
  [(ICAttachment *)self didChangeValueForKey:@"urlString"];
}

- (void)saveMergeableDataIfNeeded
{
  if ([(ICAttachmentModel *)self->_attachmentModel isMergeableDataDirty])
  {
    attachmentModel = self->_attachmentModel;
    [(ICAttachmentModel *)attachmentModel writeMergeableData];
  }
}

- (NSData)mergeableData
{
  [(ICAttachment *)self saveMergeableDataIfNeeded];
  return (NSData *)[(ICCloudSyncingObject *)self primitiveValueForEncryptableKey:@"mergeableData"];
}

- (BOOL)needsToBeRequested
{
  LOBYTE(v3) = 1;
  switch([(ICAttachment *)self attachmentType])
  {
    case 0:
      return (char)v3;
    case 3:
    case 4:
    case 5:
    case 6:
      id v4 = [(ICAttachment *)self media];
      if (v4) {
        goto LABEL_3;
      }
      goto LABEL_4;
    case 7:
    case 8:
      if ([(ICAttachment *)self hasSynapseLink]) {
        goto LABEL_10;
      }
      BOOL v16 = [(ICAttachment *)self urlString];
      LOBYTE(v3) = v16 == 0;

      return (char)v3;
    case 9:
    case 0xB:
    case 0xD:
      return [(ICAttachment *)self needsInitialFetchFromCloud];
    default:
      double v3 = [(ICAttachment *)self typeUTI];

      if (!v3) {
        return (char)v3;
      }
      signed __int16 v7 = (void *)MEMORY[0x1E4F442D8];
      double v8 = [(ICAttachment *)self typeUTI];
      char v9 = [v7 typeWithIdentifier:v8];
      if ([v9 conformsToType:*MEMORY[0x1E4F44378]]) {
        goto LABEL_17;
      }
      int v10 = (void *)MEMORY[0x1E4F442D8];
      double v11 = [(ICAttachment *)self typeUTI];
      id v12 = [v10 typeWithIdentifier:v11];
      if ([v12 conformsToType:*MEMORY[0x1E4F44370]]) {
        goto LABEL_16;
      }
      int v13 = (void *)MEMORY[0x1E4F442D8];
      uint64_t v14 = [(ICAttachment *)self typeUTI];
      char v15 = [v13 typeWithIdentifier:v14];
      if ([v15 conformsToType:*MEMORY[0x1E4F443B0]])
      {

LABEL_16:
LABEL_17:
      }
      else
      {
        int v17 = (void *)MEMORY[0x1E4F442D8];
        os_log_t v18 = [(ICAttachment *)self typeUTI];
        char v19 = [v17 typeWithIdentifier:v18];
        char v20 = [v19 conformsToType:*MEMORY[0x1E4F44390]];

        if ((v20 & 1) == 0)
        {
LABEL_10:
          LOBYTE(v3) = 0;
          return (char)v3;
        }
      }
      id v4 = [(ICAttachment *)self media];
      if (v4)
      {
LABEL_3:
        id v5 = [(ICAttachment *)self media];
        LODWORD(v3) = [v5 isValid] ^ 1;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
LABEL_4:

      return (char)v3;
  }
}

- (BOOL)isInNoteTitleOrSnippet
{
  double v3 = [(ICAttachment *)self note];
  if (v3)
  {
    NSUInteger v4 = [(ICBaseAttachment *)self rangeInNote];
    NSUInteger v6 = v5;
    NSUInteger v7 = [v3 rangeForTitle:0];
    NSUInteger v9 = v8;
    v13.location = v4;
    v13.length = v6;
    v15.location = v7;
    v15.length = v9;
    if (NSIntersectionRange(v13, v15).length)
    {
      BOOL v10 = 1;
    }
    else
    {
      v16.location = objc_msgSend(v3, "rangeForSnippetWithTitleRange:", v7, v9);
      v16.length = v11;
      v14.location = v4;
      v14.length = v6;
      BOOL v10 = NSIntersectionRange(v14, v16).length != 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)supportsSavingAttachmentToExternalFile
{
  return ![(ICAttachment *)self isUnsupported]
      && [(ICAttachment *)self section] != 3
      && [(ICAttachment *)self section] != 4;
}

- (void)willSave
{
  [(ICAttachment *)self saveMergeableDataIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v3 willSave];
}

- (void)accountWillChangeToAccount:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__55;
  v15[4] = __Block_byref_object_dispose__55;
  id v16 = 0;
  NSUInteger v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  NSUInteger v6 = [(ICAttachment *)self media];
  [v6 accountWillChangeToAccount:v4];

  NSUInteger v7 = [(ICAttachment *)self previewImages];
  NSUInteger v8 = (void *)[v7 copy];
  [v8 makeObjectsPerformSelector:sel_accountWillChangeToAccount_ withObject:v4];

  NSUInteger v9 = [(ICAttachment *)self identifier];

  if (v4 && v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__ICAttachment_accountWillChangeToAccount___block_invoke;
    v11[3] = &unk_1E64A9418;
    v11[4] = self;
    id v12 = v4;
    id v13 = v5;
    NSRange v14 = v15;
    BOOL v10 = (void (**)(void *, void))_Block_copy(v11);
    v10[2](v10, 0);
    v10[2](v10, 1);
  }
  _Block_object_dispose(v15, 8);
}

void __43__ICAttachment_accountWillChangeToAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = NSStringFromFallbackAssetType(a2);
  if (a2 == 1)
  {
    NSUInteger v5 = [*(id *)(a1 + 32) fallbackPDFURL];
    NSUInteger v9 = objc_opt_class();
    NSUInteger v7 = [*(id *)(a1 + 32) identifier];
    uint64_t v8 = [v9 fallbackPDFFallbackURLForIdentifier:v7 account:*(void *)(a1 + 40)];
  }
  else
  {
    if (a2)
    {
      NSUInteger v5 = 0;
      BOOL v10 = 0;
      goto LABEL_18;
    }
    NSUInteger v5 = [*(id *)(a1 + 32) fallbackImageURL];
    NSUInteger v6 = objc_opt_class();
    NSUInteger v7 = [*(id *)(a1 + 32) identifier];
    uint64_t v8 = [v6 fallbackImageFallbackURLForIdentifier:v7 account:*(void *)(a1 + 40)];
  }
  BOOL v10 = (void *)v8;

  if (v5)
  {
    if (v10)
    {
      if (([v5 isEqual:v10] & 1) == 0)
      {
        NSUInteger v11 = *(void **)(a1 + 48);
        id v12 = [v5 path];
        LODWORD(v11) = [v11 fileExistsAtPath:v12];

        if (v11)
        {
          id v13 = *(void **)(a1 + 48);
          NSRange v14 = [v10 URLByDeletingLastPathComponent];
          uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
          obuint64_t j = *(id *)(v15 + 40);
          [v13 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&obj];
          objc_storeStrong((id *)(v15 + 40), obj);

          uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
          int v17 = *(void **)(v16 + 40);
          if (v17)
          {
            os_log_t v18 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_2();
            }

            uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
            int v17 = *(void **)(v16 + 40);
          }
          char v19 = *(void **)(a1 + 48);
          char v20 = (id *)(v16 + 40);
          id v22 = v17;
          [v19 moveItemAtURL:v5 toURL:v10 error:&v22];
          objc_storeStrong(v20, v22);
          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
          {
            uint64_t v21 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_1();
            }
          }
        }
      }
    }
  }
LABEL_18:
}

+ (id)filenameExtensionForUTI:(id)a3
{
  if (a3)
  {
    objc_super v3 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    id v4 = [v3 preferredFilenameExtension];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)filenameFromUTI:(id)a3
{
  id v4 = a3;
  if (+[ICAttachment typeUTIIsImage:v4])
  {
    id v5 = a1;
    uint64_t v6 = 3;
LABEL_14:
    NSUInteger v9 = [v5 defaultTitleForAttachmentType:v6];
    goto LABEL_15;
  }
  if (+[ICAttachment typeUTIIsPlayableAudio:v4])
  {
    id v5 = a1;
    uint64_t v6 = 4;
    goto LABEL_14;
  }
  if (+[ICAttachment typeUTIIsPlayableMovie:v4])
  {
    id v5 = a1;
    uint64_t v6 = 5;
    goto LABEL_14;
  }
  if (v4)
  {
    NSUInteger v7 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
    int v8 = [v7 conformsToType:*MEMORY[0x1E4F44450]];

    if (v8)
    {
      id v5 = a1;
      uint64_t v6 = 6;
      goto LABEL_14;
    }
    if (+[ICAttachment typeUTIIsDrawing:v4])
    {
LABEL_13:
      id v5 = a1;
      uint64_t v6 = 9;
      goto LABEL_14;
    }
    uint64_t v15 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
    int v16 = [v15 conformsToType:*MEMORY[0x1E4F444F8]];

    if (v16)
    {
      id v5 = a1;
      uint64_t v6 = 8;
      goto LABEL_14;
    }
    int v17 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
    NSUInteger v9 = [v17 localizedDescription];
  }
  else
  {
    NSUInteger v9 = 0;
    if (+[ICAttachment typeUTIIsDrawing:0]) {
      goto LABEL_13;
    }
  }
LABEL_15:
  if (![v9 length])
  {
    uint64_t v10 = [a1 defaultTitleForAttachmentType:2];

    NSUInteger v9 = (void *)v10;
  }
  NSUInteger v11 = [a1 filenameExtensionForUTI:v4];
  if (v11)
  {
    id v12 = [v9 stringByAppendingPathExtension:v11];
  }
  else
  {
    id v12 = v9;
  }
  id v13 = v12;

  return v13;
}

+ (id)mimeTypeFromUTI:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.coreaudio-format"])
  {
    id v4 = @"audio/x-caf";
  }
  else if (v3)
  {
    id v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    id v4 = [v5 preferredMIMEType];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)typeUTIIsPlayableMovie:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    if ([v4 conformsToType:*MEMORY[0x1E4F44448]])
    {
      id v5 = [MEMORY[0x1E4F166C8] audiovisualTypes];
      if ([v5 containsObject:v3]) {
        int v6 = [v3 isEqualToString:@"public.avi"] ^ 1;
      }
      else {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)typeUTIIsPlayableAudio:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    if ([v4 conformsToType:*MEMORY[0x1E4F44330]])
    {
      id v5 = [MEMORY[0x1E4F166C8] audiovisualTypes];
      char v6 = [v5 containsObject:v3];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)typeUTIIsDrawing:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[ICUTType typeWithIdentifier:v3];
    id v5 = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.apple.notes.sketch"];
    if ([v4 conformsToType:v5]) {
      char v6 = 1;
    }
    else {
      char v6 = [v3 isEqualToString:ICAttachmentUTTypeDrawingLegacy];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)defaultTitleForAttachmentType:(signed __int16)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Attachment";
      goto LABEL_15;
    case 3:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Image";
      goto LABEL_15;
    case 4:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Audio";
      goto LABEL_15;
    case 5:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Movie";
      goto LABEL_15;
    case 6:
    case 14:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"PDF";
      goto LABEL_15;
    case 7:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Map";
      goto LABEL_15;
    case 8:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"URL";
      goto LABEL_15;
    case 9:
    case 10:
    case 13:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Sketch";
      goto LABEL_15;
    case 11:
    case 15:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Scanned Documents";
      goto LABEL_15;
    case 12:
      id v5 = (void *)MEMORY[0x1E4F83770];
      char v6 = @"Table";
LABEL_15:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1, v3);
      NSUInteger v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      NSUInteger v7 = &stru_1F1F2FFF8;
      break;
  }
  return v7;
}

+ (id)mentionNotificationSnippetForAttachmentType:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Mentioned you in an attachment" value:@"Mentioned you in an attachment" table:0 allowSiri:1];
  if ((v3 - 9) < 2 || v3 == 13)
  {
    id v5 = (void *)MEMORY[0x1E4F83770];
    char v6 = @"Mentioned you in a drawing";
  }
  else
  {
    if (v3 != 12) {
      goto LABEL_7;
    }
    id v5 = (void *)MEMORY[0x1E4F83770];
    char v6 = @"Mentioned you in a table";
  }
  uint64_t v7 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];

  uint64_t v4 = (void *)v7;
LABEL_7:
  return v4;
}

- (BOOL)isLoadingFromCloud
{
  if ([(ICAttachment *)self needsInitialFetchFromCloud]) {
    return 1;
  }
  uint64_t v4 = [(ICAttachment *)self media];
  if (v4)
  {
    id v5 = [(ICAttachment *)self media];
    char v3 = [v5 needsInitialFetchFromCloud];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasVisibleInlineAttachments
{
  id v2 = [(ICAttachment *)self inlineAttachments];
  char v3 = +[ICBaseAttachment predicateForVisibleObjects];
  char v4 = objc_msgSend(v2, "ic_containsObjectMatchingPredicate:", v3);

  return v4;
}

- (NSSet)visibleInlineAttachments
{
  id v2 = [(ICAttachment *)self inlineAttachments];
  char v3 = +[ICBaseAttachment predicateForVisibleObjects];
  char v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 1;
}

- (NSString)urlString
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"urlString"];
}

- (NSString)title
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSString)userTitle
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"userTitle"];
}

- (void)setUserTitle:(id)a3
{
}

- (NSString)fallbackTitle
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"fallbackTitle"];
}

- (void)setFallbackTitle:(id)a3
{
}

- (NSString)fallbackSubtitleIOS
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"fallbackSubtitleIOS"];
}

- (void)setFallbackSubtitleIOS:(id)a3
{
}

- (NSString)fallbackSubtitleMac
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"fallbackSubtitleMac"];
}

- (void)setFallbackSubtitleMac:(id)a3
{
}

- (BOOL)showsLoadingPlaceholder
{
  return 0;
}

- (id)unsupportedAttachmentTitle
{
  char v3 = [(ICAttachment *)self fallbackTitle];
  if (!v3)
  {
    if ([(ICAttachment *)self showsLoadingPlaceholder]) {
      char v4 = @"Loading Attachment…";
    }
    else {
      char v4 = @"Unsupported Attachment";
    }
    char v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v4 value:v4 table:0 allowSiri:1];
  }
  return v3;
}

- (id)unsupportedAttachmentSubtitle
{
  char v3 = [(ICAttachment *)self fallbackSubtitleIOS];
  if (!v3)
  {
    if (![(ICAttachment *)self showsLoadingPlaceholder])
    {
      char v4 = (void *)MEMORY[0x1E4F83770];
      id v5 = @"Upgrade iOS to view this attachment.";
      goto LABEL_6;
    }
    if ([(ICAttachment *)self hasFallbackPDF])
    {
      char v4 = (void *)MEMORY[0x1E4F83770];
      id v5 = @"PDF Document";
LABEL_6:
      char v3 = [v4 localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
      goto LABEL_8;
    }
    char v3 = &stru_1F1F2FFF8;
  }
LABEL_8:
  return v3;
}

- (BOOL)shouldShowInContentInfoText
{
  if ([(ICAttachment *)self markedForDeletion]) {
    return 0;
  }
  char v4 = [(ICAttachment *)self parentAttachment];
  if (v4 || [(ICAttachment *)self isBeingEditedLocallyOnDevice])
  {
    char v3 = 0;
  }
  else
  {
    id v5 = [(ICAttachment *)self attachmentModel];
    char v3 = [v5 shouldShowInContentInfoText];
  }
  return v3;
}

- (NSURL)fileURL
{
  char v3 = [(ICAttachment *)self media];
  char v4 = [v3 isPasswordProtected];
  id v5 = [(ICAttachment *)self media];
  char v6 = v5;
  if (v4) {
    [v5 encryptedMediaURL];
  }
  else {
  uint64_t v7 = [v5 mediaURL];
  }

  return (NSURL *)v7;
}

- (BOOL)isDeletedOrInTrash
{
  if ([(ICAttachment *)self isDeleted]) {
    return 1;
  }
  char v4 = [(ICAttachment *)self note];
  char v5 = [v4 isDeletedOrInTrash];

  return v5;
}

- (void)setRemoteFileURL:(id)a3
{
  id v5 = a3;
  if ((-[NSURL isEqual:](self->_remoteFileURL, "isEqual:") & 1) == 0)
  {
    if ([(ICAttachment *)self isPasswordProtected])
    {
      char v4 = [v5 absoluteString];
      [(ICCloudSyncingObject *)self setValue:v4 forEncryptableKey:@"remoteFileURL"];
LABEL_6:

      goto LABEL_8;
    }
    if (v5)
    {
      char v4 = [v5 absoluteString];
      [(ICAttachment *)self setRemoteFileURLString:v4];
      goto LABEL_6;
    }
    [(ICAttachment *)self setRemoteFileURLString:0];
  }
LABEL_8:
}

- (NSURL)remoteFileURL
{
  if (!self->_remoteFileURL)
  {
    if ([(ICAttachment *)self isPasswordProtected])
    {
      char v3 = [(ICCloudSyncingObject *)self valueForEncryptableKey:@"remoteFileURL"];
    }
    else
    {
      char v3 = [(ICAttachment *)self remoteFileURLString];
      if (!v3)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    char v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    remoteFileURL = self->_remoteFileURL;
    self->_remoteFileURL = v4;

    goto LABEL_6;
  }
LABEL_7:
  char v6 = self->_remoteFileURL;
  return v6;
}

- (NSDictionary)metadata
{
  if ([(ICAttachment *)self isPasswordProtected])
  {
    objc_opt_class();
    char v3 = NSStringFromSelector(sel_metadata);
    char v4 = [(ICCloudSyncingObject *)self valueForEncryptableKey:v3];
    ICCheckedDynamicCast();
    id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    metadata = self->_metadata;
    if (metadata)
    {
      id v5 = metadata;
    }
    else
    {
      uint64_t v7 = NSStringFromSelector(sel_metadataData);
      int v8 = [(ICAttachment *)self primitiveValueForKey:v7];

      if (v8)
      {
        objc_opt_class();
        id v14 = 0;
        NSUInteger v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v14];
        id v10 = v14;
        NSUInteger v11 = ICCheckedDynamicCast();

        if (!v11 || v10)
        {
          id v12 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[ICAttachment metadata]();
          }

          id v5 = 0;
        }
        else
        {
          objc_storeStrong((id *)&self->_metadata, v11);
          id v5 = self->_metadata;
        }
      }
      else
      {
        id v5 = 0;
      }
    }
  }
  return v5;
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachment *)self metadata];
  char v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    NSUInteger v9 = 0;
  }
  else {
    NSUInteger v9 = v5;
  }
  unint64_t v10 = v9;
  if (v8 | v10)
  {
    NSUInteger v11 = (void *)v10;
    if (v8) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {

      goto LABEL_17;
    }
    char v14 = [(id)v8 isEqual:v10];

    if ((v14 & 1) == 0)
    {
LABEL_17:
      objc_opt_class();
      id v13 = ICCheckedDynamicCast();

      if ([(ICAttachment *)self isPasswordProtected])
      {
        uint64_t v15 = NSStringFromSelector(sel_metadata);
        [(ICCloudSyncingObject *)self setValue:v13 forEncryptableKey:v15];
LABEL_28:

        goto LABEL_29;
      }
      if (v13)
      {
        id v21 = 0;
        uint64_t v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v21];
        id v16 = v21;
        int v17 = v16;
        if (!v15 || v16)
        {
          os_log_t v18 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[ICAttachment setMetadata:]();
          }

          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      objc_storeStrong((id *)&self->_metadata, v13);
      char v19 = NSStringFromSelector(sel_metadataData);
      [(ICAttachment *)self willChangeValueForKey:v19];

      char v20 = NSStringFromSelector(sel_metadataData);
      [(ICAttachment *)self setPrimitiveValue:v15 forKey:v20];

      int v17 = NSStringFromSelector(sel_metadataData);
      [(ICAttachment *)self didChangeValueForKey:v17];
LABEL_27:

      goto LABEL_28;
    }
  }
  else
  {
  }
  id v13 = v4;
LABEL_29:
}

- (void)updateAttachmentMetadataWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachment *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __50__ICAttachment_updateAttachmentMetadataWithBlock___block_invoke;
  v7[3] = &unk_1E64A4F70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __50__ICAttachment_updateAttachmentMetadataWithBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) metadata];
  char v3 = (void *)[v2 mutableCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setMetadata:v6];
}

- (NSData)metadataData
{
  if ([(ICAttachment *)self isPasswordProtected])
  {
    objc_opt_class();
    char v3 = NSStringFromSelector(sel_metadata);
    id v4 = [(ICCloudSyncingObject *)self valueForEncryptableKey:v3];
    id v5 = ICCheckedDynamicCast();

    if (v5)
    {
      id v13 = 0;
      id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v13];
      id v7 = v13;
      id v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9)
      {
        id v11 = v6;
      }
      else
      {
        unint64_t v10 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[ICAttachment metadataData]();
        }

        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v5 = NSStringFromSelector(sel_metadataData);
    id v11 = [(ICAttachment *)self primitiveValueForKey:v5];
  }

  return (NSData *)v11;
}

- (void)setMetadataData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachment *)self metadataData];
  id v6 = (void *)*MEMORY[0x1E4F1D260];
  if ((id)*MEMORY[0x1E4F1D260] == v4) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }
  unint64_t v8 = v7;
  if (v6 == v5) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v5;
  }
  unint64_t v10 = v9;
  if (!(v8 | v10)) {
    goto LABEL_26;
  }
  id v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {

    goto LABEL_15;
  }
  char v13 = [(id)v8 isEqual:v10];

  if ((v13 & 1) == 0)
  {
LABEL_15:
    if (v4)
    {
      objc_opt_class();
      id v19 = 0;
      char v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v19];
      id v15 = v19;
      id v5 = ICCheckedDynamicCast();

      if (!v5 || v15)
      {
        id v16 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[ICAttachment metadata]();
        }

        goto LABEL_25;
      }
    }
    else
    {
      id v5 = 0;
    }
    if ([(ICAttachment *)self isPasswordProtected])
    {
      NSStringFromSelector(sel_metadata);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [(ICCloudSyncingObject *)self setValue:v5 forEncryptableKey:v15];
    }
    else
    {
      objc_storeStrong((id *)&self->_metadata, v5);
      int v17 = NSStringFromSelector(sel_metadataData);
      [(ICAttachment *)self willChangeValueForKey:v17];

      os_log_t v18 = NSStringFromSelector(sel_metadataData);
      [(ICAttachment *)self setPrimitiveValue:v4 forKey:v18];

      NSStringFromSelector(sel_metadataData);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [(ICAttachment *)self didChangeValueForKey:v15];
    }
LABEL_25:

LABEL_26:
  }
}

- (BOOL)hasMetadata
{
  int v3 = [(ICAttachment *)self isPasswordProtected];
  id v4 = &selRef_metadata;
  if (!v3) {
    id v4 = &selRef_metadataData;
  }
  id v5 = NSStringFromSelector(*v4);
  id v6 = [(ICCloudSyncingObject *)self valueForEncryptableKey:v5];

  return v6 != 0;
}

- (NSString)summary
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"summary"];
}

- (void)setSummary:(id)a3
{
}

- (void)updateCombinedSummary
{
  int v3 = [(ICAttachment *)self handwritingSummary];
  if (v3
    || ([(ICAttachment *)self imageClassificationSummary],
        (int v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [(ICAttachment *)self handwritingSummary];
    objc_msgSend(v9, "ic_addNonNilObject:", v4);

    id v5 = [(ICAttachment *)self imageClassificationSummary];
    objc_msgSend(v9, "ic_addNonNilObject:", v5);

    id v6 = [(ICAttachment *)self ocrSummary];
    objc_msgSend(v9, "ic_addNonNilObject:", v6);

    id v7 = [v9 componentsJoinedByString:@" "];
    [(ICAttachment *)self setSummary:v7];

    return;
  }
  unint64_t v8 = [(ICAttachment *)self ocrSummary];

  if (v8) {
    goto LABEL_4;
  }
  [(ICAttachment *)self setSummary:0];
}

- (NSString)handwritingSummary
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"handwritingSummary"];
}

- (void)setHandwritingSummary:(id)a3
{
  BOOL v4 = a3 != 0;
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:");
  [(ICAttachment *)self updateCombinedSummary];
  [(ICAttachment *)self setHandwritingSummaryVersion:(8 * v4)];
}

+ (void)purgeHandwritingSummariesInContext:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = +[ICBaseAttachment predicateForVisibleObjects];
  v15[0] = v5;
  id v6 = +[ICAttachment predicateForPasswordProtected:0];
  v15[1] = v6;
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"handwritingSummary != nil"];
  v15[2] = v7;
  unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  id v9 = [v4 andPredicateWithSubpredicates:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__ICAttachment_purgeHandwritingSummariesInContext___block_invoke;
  v12[3] = &unk_1E64A4218;
  id v13 = v9;
  id v14 = v3;
  id v10 = v3;
  id v11 = v9;
  [v10 performBlockAndWait:v12];
}

uint64_t __51__ICAttachment_purgeHandwritingSummariesInContext___block_invoke(uint64_t a1)
{
  return +[ICAttachment ic_enumerateObjectsMatchingPredicate:*(void *)(a1 + 32) sortDescriptors:0 relationshipKeyPathsForPrefetching:0 context:*(void *)(a1 + 40) batchSize:25 saveAfterBatch:0 usingBlock:&__block_literal_global_386];
}

void __51__ICAttachment_purgeHandwritingSummariesInContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = objc_msgSend(v2, "ic_loggingIdentifier");
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Purging handwriting summary {attachment: %@}", (uint8_t *)&v5, 0xCu);
  }
  [v2 setHandwritingSummary:0];
  [v2 updateChangeCountWithReason:@"Purged handwriting summary"];
}

- (NSString)imageClassificationSummary
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"imageClassificationSummary"];
}

- (void)setImageClassificationSummary:(id)a3
{
  BOOL v4 = a3 != 0;
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:");
  [(ICAttachment *)self updateCombinedSummary];
  [(ICAttachment *)self setImageClassificationSummaryVersion:(4 * v4)];
}

- (NSString)ocrSummary
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"ocrSummary"];
}

- (void)setOcrSummary:(id)a3
{
  [(ICCloudSyncingObject *)self setValue:a3 forEncryptableKey:@"ocrSummary"];
  [(ICAttachment *)self updateCombinedSummary];
  [(ICAttachment *)self setOcrSummaryVersion:a3 != 0];
}

- (NSString)additionalIndexableText
{
  return (NSString *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"additionalIndexableText"];
}

- (void)setAdditionalIndexableText:(id)a3
{
}

+ (id)isBeingEditedLocallyOnDeviceSet
{
  if (isBeingEditedLocallyOnDeviceSet_onceToken != -1) {
    dispatch_once(&isBeingEditedLocallyOnDeviceSet_onceToken, &__block_literal_global_401);
  }
  id v2 = (void *)isBeingEditedLocallyOnDeviceSet_sIsBeingEditedLocallyOnDeviceSet;
  return v2;
}

void __47__ICAttachment_isBeingEditedLocallyOnDeviceSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v1 = (void *)isBeingEditedLocallyOnDeviceSet_sIsBeingEditedLocallyOnDeviceSet;
  isBeingEditedLocallyOnDeviceSet_sIsBeingEditedLocallyOnDeviceSet = v0;
}

- (void)setIsBeingEditedLocallyOnDevice:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(id)objc_opt_class() isBeingEditedLocallyOnDeviceSet];
  id v6 = [(ICAttachment *)self identifier];
  obuint64_t j = v5;
  objc_sync_enter(obj);
  if (v3) {
    objc_msgSend(obj, "ic_addNonNilObject:", v6);
  }
  else {
    objc_msgSend(obj, "ic_removeNonNilObject:", v6);
  }
  objc_sync_exit(obj);
}

- (BOOL)isBeingEditedLocallyOnDevice
{
  BOOL v3 = [(id)objc_opt_class() isBeingEditedLocallyOnDeviceSet];
  BOOL v4 = [(ICAttachment *)self identifier];
  id v5 = v3;
  objc_sync_enter(v5);
  LOBYTE(v3) = [v5 containsObject:v4];
  objc_sync_exit(v5);

  return (char)v3;
}

- (void)setMarkupModelData:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(ICAttachment *)self setCachedImage:0];
  }
  [(ICAttachment *)self invalidateAttachmentPreviewImages];
  [(ICCloudSyncingObject *)self setValue:v4 forEncryptableKey:@"markupModelData"];
}

- (BOOL)shouldEmbedMarkupDataInMedia
{
  id v2 = [(ICAttachment *)self parentAttachment];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = [v2 attachmentType] != 11;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)setMergeableData:(id)a3
{
  id v4 = a3;
  [(ICAttachment *)self setSettingMergeableData:1];
  [(ICCloudSyncingObject *)self setValue:v4 forEncryptableKey:@"mergeableData"];

  [(ICAttachment *)self setSettingMergeableData:0];
}

- (NSData)linkPresentationArchivedMetadata
{
  return (NSData *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"linkPresentationArchivedMetadata"];
}

- (void)setLinkPresentationArchivedMetadata:(id)a3
{
}

- (NSData)synapseData
{
  return (NSData *)[(ICCloudSyncingObject *)self valueForEncryptableKey:@"synapseData"];
}

- (void)setSynapseData:(id)a3
{
}

- (BOOL)hasSynapseLink
{
  id v2 = [(ICAttachment *)self synapseData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setMergeablePreferredViewSize:(id)a3
{
  id v8 = a3;
  id v4 = [(ICAttachment *)self mergeablePreferredViewSize];
  char v5 = [v4 isEqualToData:v8];

  if ((v5 & 1) == 0)
  {
    performBlockOnMainThread();
    id v6 = NSStringFromSelector(sel_mergeablePreferredViewSize);
    [(ICAttachment *)self willChangeValueForKey:v6];
    [(ICAttachment *)self setPrimitiveValue:v8 forKey:v6];
    [(ICAttachment *)self didChangeValueForKey:v6];
    id v7 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentDidChangePreferredSizeNotification"];
  }
}

void __46__ICAttachment_setMergeablePreferredViewSize___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"ICAttachmentWillChangePreferredSizeNotification" object:0];
}

+ (id)mergeableWallClockValueKeyPaths
{
  if (mergeableWallClockValueKeyPaths_onceToken != -1) {
    dispatch_once(&mergeableWallClockValueKeyPaths_onceToken, &__block_literal_global_418);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  BOOL v3 = objc_msgSendSuper2(&v6, sel_mergeableWallClockValueKeyPaths);
  id v4 = [v3 setByAddingObjectsFromSet:mergeableWallClockValueKeyPaths_ourSet];

  return v4;
}

void __47__ICAttachment_mergeableWallClockValueKeyPaths__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  NSStringFromSelector(sel_mergeablePreferredViewSize);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 setWithObject:v3];
  id v2 = (void *)mergeableWallClockValueKeyPaths_ourSet;
  mergeableWallClockValueKeyPaths_ourSet = v1;
}

- (void)inlineFormFillingBannerWasDismissedByUser
{
  id v3 = [(ICCloudSyncingObject *)self currentReplicaID];
  id v4 = [v3 UUIDString];

  [(ICAttachment *)self inlineFormFillingBannerWasDismissedByDeviceIdentifier:v4];
}

- (void)inlineFormFillingBannerWasDismissedByDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__ICAttachment_inlineFormFillingBannerWasDismissedByDeviceIdentifier___block_invoke;
  void v6[3] = &unk_1E64A9460;
  id v7 = v4;
  id v5 = v4;
  [(ICAttachment *)self updateAttachmentMetadataWithBlock:v6];
}

void __70__ICAttachment_inlineFormFillingBannerWasDismissedByDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"inline_form_dismissal_count_by_device"];
  id v10 = (id)[v4 mutableCopy];

  id v5 = v10;
  if (!v10)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = v5;
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v6) {
    id v7 = (void *)v6;
  }
  else {
    id v7 = &unk_1F1F62AD8;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v7, "unsignedIntValue") + 1);
  [v11 setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];
  id v9 = (void *)[v11 copy];
  [v3 setObject:v9 forKeyedSubscript:@"inline_form_dismissal_count_by_device"];
}

- (BOOL)shouldShowInlineFormFillingBanner
{
  return [(ICAttachment *)self inlineFormFillingBannerDismissalCountForDevice] < 3;
}

- (unint64_t)inlineFormFillingBannerDismissalCountForDevice
{
  id v3 = [(ICCloudSyncingObject *)self currentReplicaID];
  id v4 = [v3 UUIDString];

  unint64_t v5 = [(ICAttachment *)self inlineFormFillingBannerDismissalCountForDeviceIdentifier:v4];
  return v5;
}

- (unint64_t)inlineFormFillingBannerDismissalCountForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICAttachment *)self inlineFormFillingDismissalCountForAllDevices];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:v4];
    id v8 = v7;
    if (v7) {
      unint64_t v9 = [v7 unsignedIntValue];
    }
    else {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)inlineFormFillingDismissalCountForAllDevices
{
  objc_opt_class();
  id v3 = [(ICAttachment *)self metadata];
  id v4 = [v3 objectForKeyedSubscript:@"inline_form_dismissal_count_by_device"];
  unint64_t v5 = ICDynamicCast();

  return v5;
}

- (id)cryptoStrategyProtocol
{
  return &unk_1F1F66350;
}

- (id)parentEncryptableObject
{
  id v3 = [(ICAttachment *)self note];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ICAttachment *)self account];
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)isEncryptableKeyBinaryData:(id)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!isEncryptableKeyBinaryData__keys)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = NSStringFromSelector(sel_mergeableData);
    v16[0] = v6;
    id v7 = NSStringFromSelector(sel_markupModelData);
    v16[1] = v7;
    id v8 = NSStringFromSelector(sel_linkPresentationArchivedMetadata);
    v16[2] = v8;
    unint64_t v9 = NSStringFromSelector(sel_synapseData);
    v16[3] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
    uint64_t v11 = [v5 setWithArray:v10];
    BOOL v12 = (void *)isEncryptableKeyBinaryData__keys;
    isEncryptableKeyBinaryData__keys = v11;
  }
  v15.receiver = self;
  v15.super_class = (Class)ICAttachment;
  if ([(ICCloudSyncingObject *)&v15 isEncryptableKeyBinaryData:v4]) {
    char v13 = 1;
  }
  else {
    char v13 = [(id)isEncryptableKeyBinaryData__keys containsObject:v4];
  }

  return v13;
}

- (void)deserializeAndMergeValues:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v9 deserializeAndMergeValues:a3];
  id v4 = [(ICAttachment *)self typeUTI];
  if ([v4 isEqualToString:@"com.apple.notes.gallery"])
  {
  }
  else
  {
    id v5 = [(ICAttachment *)self parentAttachment];
    uint64_t v6 = [v5 typeUTI];
    char v7 = [v6 isEqualToString:@"com.apple.notes.gallery"];

    if ((v7 & 1) == 0) {
      id v8 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentDidLoadNotification"];
    }
  }
}

- (id)mergeDecryptedValue:(id)a3 withOldValue:(id)a4 forKey:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(ICCloudSyncingObject *)self needsToLoadDecryptedValues]
    || (NSStringFromSelector(sel_mergeableData),
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v10 isEqualToString:v11],
        v11,
        !v12))
  {
    v21.receiver = self;
    v21.super_class = (Class)ICAttachment;
    uint64_t v15 = [(ICCloudSyncingObject *)&v21 mergeDecryptedValue:v8 withOldValue:v9 forKey:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      id v14 = [(ICAttachment *)self attachmentModel];
      [v14 mergeWithMergeableData:v13];
    }
    else
    {
      id v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = [(ICAttachment *)self className];
        os_log_t v18 = [(ICAttachment *)self identifier];
        *(_DWORD *)buf = 138412802;
        id v23 = v10;
        __int16 v24 = 2112;
        uint64_t v25 = v17;
        __int16 v26 = 2112;
        char v27 = v18;
        _os_log_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_INFO, "Trying to merge %@ for %@ (%@), but the data isn't NSData", buf, 0x20u);
      }
    }
    uint64_t v15 = [(ICAttachment *)self mergeableData];
  }
  id v19 = (void *)v15;

  return v19;
}

- (void)persistPendingChanges
{
  id v3 = [(ICAttachment *)self note];
  id v4 = [v3 modificationDate];

  id v5 = [(ICAttachment *)self attachmentModel];
  [v5 persistPendingChanges];

  [(ICAttachment *)self saveMergeableDataIfNeeded];
  if (v4)
  {
    uint64_t v6 = [(ICAttachment *)self note];
    char v7 = [v6 modificationDate];
    char v8 = [v7 isEqual:v4];

    if ((v8 & 1) == 0)
    {
      id v9 = [(ICAttachment *)self note];
      [v9 setModificationDate:v4];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v10 persistPendingChanges];
}

- (void)clearDecryptedData
{
  if (objc_opt_respondsToSelector()) {
    [(ICAttachment *)self setCachedImage:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v3 clearDecryptedData];
}

+ (BOOL)isTypeUTISupportedInExtensions:(id)a3
{
  return 1;
}

+ (BOOL)isPathExtensionSupportedForPasswordProtectedNotes:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithFilenameExtension:");
  id v5 = [v4 identifier];

  LOBYTE(a1) = [a1 isTypeUTISupportedForPasswordProtectedNotes:v5];
  return (char)a1;
}

- (BOOL)hasCroppingQuad
{
  id v2 = [(ICAttachment *)self attachmentModel];
  char v3 = [v2 shouldCropImage];

  return v3;
}

- (void)setPreferredViewSize:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [ICTTMergeableWallClockValue alloc];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithShort:v3];
  objc_super v10 = [(ICTTMergeableWallClockValue *)v5 initWithValue:v6 timestamp:0];

  char v7 = NSStringFromSelector(sel_preferredViewSize);
  [(ICAttachment *)self willChangeValueForKey:v7];

  char v8 = [(ICTTMergeableWallClockValue *)v10 serialize];
  [(ICAttachment *)self setMergeablePreferredViewSize:v8];

  id v9 = NSStringFromSelector(sel_preferredViewSize);
  [(ICAttachment *)self didChangeValueForKey:v9];

  [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"set a new preferred view size"];
}

- (void)resetPreferredViewSizeIfNecessary
{
  uint64_t v3 = [(ICAttachment *)self mergeablePreferredViewSize];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = [ICTTMergeableWallClockValue alloc];
    uint64_t v6 = [(ICAttachment *)self mergeablePreferredViewSize];
    id v14 = [(ICTTMergeableWallClockValue *)v5 initWithData:v6];

    char v7 = v14;
  }
  else
  {
    char v7 = 0;
  }
  uint64_t v15 = v7;
  char v8 = [(ICTTMergeableWallClockValue *)v7 value];

  if (v8)
  {
    id v9 = [[ICTTMergeableWallClockValue alloc] initWithValue:0 timestamp:0];

    objc_super v10 = NSStringFromSelector(sel_preferredViewSize);
    [(ICAttachment *)self willChangeValueForKey:v10];

    uint64_t v11 = [(ICTTMergeableWallClockValue *)v9 serialize];
    [(ICAttachment *)self setMergeablePreferredViewSize:v11];

    [(ICCloudSyncingObject *)self updateUserSpecificChangeCountWithReason:@"User reset preferredViewSize"];
    int v12 = NSStringFromSelector(sel_preferredViewSize);
    [(ICAttachment *)self didChangeValueForKey:v12];

    id v13 = v9;
  }
  else
  {
    id v13 = v15;
  }
}

+ (id)keyPathsForValuesAffectingParentCloudObject
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"parentAttachment.note", 0);
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  id v2 = objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingIsSharedViaICloud);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"self.parentAttachment.note"];
  [v3 addObject:@"self.parentAttachment.note.isSharedViaICloud"];
  [v3 addObject:@"self.note"];
  [v3 addObject:@"self.note.isSharedViaICloud"];
  return v3;
}

- (id)childCloudObjectsForMinimumSupportedVersionPropagation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(ICAttachment *)self subAttachments];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    uint64_t v6 = [(ICAttachment *)self media];

    if (v6)
    {
      char v7 = [(ICAttachment *)self subAttachments];
      char v8 = [v7 allObjects];
      [v3 addObjectsFromArray:v8];

LABEL_7:
      objc_super v10 = [(ICAttachment *)self media];
      [v3 addObject:v10];
      goto LABEL_8;
    }
  }
  id v9 = [(ICAttachment *)self subAttachments];

  if (!v9)
  {
    int v12 = [(ICAttachment *)self media];

    if (!v12) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  objc_super v10 = [(ICAttachment *)self subAttachments];
  uint64_t v11 = [v10 allObjects];
  [v3 addObjectsFromArray:v11];

LABEL_8:
LABEL_9:
  id v13 = [(ICAttachment *)self inlineAttachments];

  if (v13)
  {
    id v14 = [(ICAttachment *)self inlineAttachments];
    uint64_t v15 = [v14 allObjects];
    [v3 addObjectsFromArray:v15];
  }
  if ([v3 count]) {
    id v16 = (void *)[v3 copy];
  }
  else {
    id v16 = 0;
  }

  return v16;
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(ICAttachment *)self markedForDeletion];
  v7.receiver = self;
  v7.super_class = (Class)ICAttachment;
  [(ICCloudSyncingObject *)&v7 setMarkedForDeletion:v3];
  if (!v5 && v3)
  {
    uint64_t v6 = [(ICAttachment *)self paperBundleModel];
    [v6 removeStrokesFromStyleInventory];
  }
}

- (void)markForDeletion
{
  if (([(ICAttachment *)self markedForDeletion] & 1) == 0)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"ICAttachmentWillBeDeletedNotification" object:self];

    v7.receiver = self;
    v7.super_class = (Class)ICAttachment;
    [(ICCloudSyncingObject *)&v7 markForDeletion];
    uint64_t v4 = [(ICAttachment *)self media];
    [v4 markForDeletion];

    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"ICAttachmentWasDeletedNotification" object:self];

    if (objc_opt_respondsToSelector()) {
      [(ICAttachment *)self notifyDocCamFrameworkAttachmentWasDeleted];
    }
    [(ICAttachment *)self setHandwritingSummary:0];
    [(ICAttachment *)self setAdditionalIndexableText:0];
    uint64_t v6 = [(ICCloudSyncingObject *)self modificationDate];
    [(ICAttachment *)self setModificationDate:v6];
  }
}

- (void)unmarkForDeletion
{
  if ([(ICAttachment *)self markedForDeletion])
  {
    v6.receiver = self;
    v6.super_class = (Class)ICAttachment;
    [(ICCloudSyncingObject *)&v6 unmarkForDeletion];
    BOOL v3 = [(ICAttachment *)self media];
    [v3 unmarkForDeletion];

    uint64_t v4 = [(ICCloudSyncingObject *)self modificationDate];
    [(ICAttachment *)self setModificationDate:v4];

    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"ICAttachmentWasUndeletedNotification" object:self];
  }
}

- (id)previewItemURL
{
  id v2 = [(ICAttachment *)self attachmentModel];
  BOOL v3 = [v2 previewItemURL];

  return v3;
}

- (id)previewItemTitle
{
  id v2 = [(ICAttachment *)self attachmentModel];
  BOOL v3 = [v2 previewItemTitle];

  return v3;
}

- (BOOL)supportsQuickLook
{
  id v2 = [(ICAttachment *)self attachmentModel];
  char v3 = [v2 supportsQuickLook];

  return v3;
}

- (void)attachmentDidChange
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "No note set for attachment %@", v1, 0xCu);
}

- (BOOL)locationNeedsUpdate
{
  if ([(ICAttachment *)self markedForDeletion])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v4 = [(ICAttachment *)self location];
    if (v4 || [(ICAttachment *)self checkedForLocation])
    {
      int v5 = [(ICAttachment *)self location];
      if (v5)
      {
        objc_super v6 = [(ICAttachment *)self location];
        if ([v6 placeUpdated])
        {
          LOBYTE(v3) = 0;
        }
        else
        {
          objc_super v7 = [(ICAttachment *)self location];
          int v3 = [v7 updatingPlace] ^ 1;
        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)ic_loggingValues
{
  v12.receiver = self;
  v12.super_class = (Class)ICAttachment;
  int v3 = [(ICCloudSyncingObject *)&v12 ic_loggingValues];
  uint64_t v4 = (void *)[v3 mutableCopy];

  int v5 = [(ICAttachment *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__ICAttachment_ic_loggingValues__block_invoke;
  v10[3] = &unk_1E64A4218;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  [v5 performBlockAndWait:v10];

  objc_super v7 = v11;
  id v8 = v6;

  return v8;
}

void __32__ICAttachment_ic_loggingValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) media];
  int v3 = [v2 identifier];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) media];
    int v5 = [v4 identifier];
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:@"media"];
  }
  uint64_t v6 = [*(id *)(a1 + 32) typeUTI];
  objc_super v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"nil";
  }
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:@"type"];

  id v9 = [*(id *)(a1 + 32) note];
  uint64_t v10 = [v9 identifier];
  id v11 = (void *)v10;
  if (v10) {
    objc_super v12 = (__CFString *)v10;
  }
  else {
    objc_super v12 = @"nil";
  }
  [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"note"];

  uint64_t v13 = [*(id *)(a1 + 32) creationDate];
  id v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = @"nil";
  }
  [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:@"creationDate"];

  uint64_t v16 = [*(id *)(a1 + 32) modificationDate];
  int v17 = (void *)v16;
  if (v16) {
    os_log_t v18 = (__CFString *)v16;
  }
  else {
    os_log_t v18 = @"nil";
  }
  [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:@"modificationDate"];

  id v19 = [*(id *)(a1 + 32) subAttachments];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    objc_super v21 = [*(id *)(a1 + 32) subAttachments];
    id v22 = [v21 allObjects];
    id v23 = [v22 valueForKey:@"recordName"];
    [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"subAttachments"];
  }
  __int16 v24 = [*(id *)(a1 + 32) inlineAttachments];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    __int16 v26 = [*(id *)(a1 + 32) inlineAttachments];
    char v27 = [v26 allObjects];
    uint64_t v28 = [v27 valueForKey:@"recordName"];
    [*(id *)(a1 + 40) setObject:v28 forKeyedSubscript:@"attachments"];
  }
  char v29 = [*(id *)(a1 + 32) noteUsingTitleForNoteTitle];

  if (v29)
  {
    id v31 = [*(id *)(a1 + 32) noteUsingTitleForNoteTitle];
    id v30 = [v31 identifier];
    [*(id *)(a1 + 40) setObject:v30 forKeyedSubscript:@"noteUsingTitleForNoteTitle"];
  }
}

- (NSString)accessibilityDescriptionForType
{
  int v3 = [(ICAttachment *)self attachmentType];
  uint64_t v4 = 0;
  switch(v3)
  {
    case 2:
      uint64_t v4 = [(ICAttachment *)self _accessibilityDescriptionForGenericType];
      break;
    case 3:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"image";
      goto LABEL_11;
    case 4:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"audio";
      goto LABEL_11;
    case 5:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"movie";
      goto LABEL_11;
    case 6:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"PDF";
      goto LABEL_11;
    case 7:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"map";
      goto LABEL_11;
    case 8:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"web link";
      goto LABEL_11;
    case 9:
    case 10:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"drawing";
      goto LABEL_11;
    case 12:
      int v5 = (void *)MEMORY[0x1E4F83770];
      uint64_t v6 = @"table";
LABEL_11:
      uint64_t v4 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
      break;
    default:
      break;
  }
  return (NSString *)v4;
}

- (id)_accessibilityDescriptionForGenericType
{
  uint64_t v2 = (void *)MEMORY[0x1E4F442D8];
  int v3 = [(ICAttachment *)self typeUTI];
  uint64_t v4 = [v2 typeWithIdentifier:v3];
  int v5 = [v4 localizedDescription];

  if ([v5 length])
  {
    uint64_t v6 = NSString;
    objc_super v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"file, %@", @"file, %@", 0, 1 value table allowSiri];
    id v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"file" value:@"file" table:0 allowSiri:1];
  }

  return v8;
}

- (BOOL)isSettingMergeableData
{
  return self->settingMergeableData;
}

- (void)setSettingMergeableData:(BOOL)a3
{
  self->settingMergeableData = a3;
}

- (ICAssetGenerationManager)fallbackImageGenerationManager
{
  return self->_fallbackImageGenerationManager;
}

- (ICAssetGenerationManager)fallbackPDFGenerationManager
{
  return self->_fallbackPDFGenerationManager;
}

- (BOOL)suppressesFileDeletion
{
  return self->suppressesFileDeletion;
}

- (void)setSuppressesFileDeletion:(BOOL)a3
{
  self->suppressesFileDeletion = a3;
}

- (void)setURL:(id)a3
{
}

+ (void)deleteAttachment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int v5 = ICCheckedDynamicCast();
  uint64_t v6 = v5;
  if (v5)
  {
    objc_super v7 = [v5 attachmentModel];
    [v7 willMarkAttachmentForDeletion];

    id v8 = [v6 attachmentModel];
    [v8 deleteChildAttachments];

    id v9 = [v6 media];
    +[ICMedia deleteMedia:v9];

    [v6 deleteAttachmentPreviewImages];
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  objc_msgSendSuper2(&v10, sel_deleteAttachment_, v4);
}

+ (void)undeleteAttachment:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  id v3 = a3;
  objc_msgSendSuper2(&v7, sel_undeleteAttachment_, v3);
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();

  if (v4)
  {
    int v5 = objc_msgSend(v4, "media", v7.receiver, v7.super_class);
    +[ICMedia undeleteMedia:v5];

    [v4 undeleteAttachmentPreviewImages];
    uint64_t v6 = [v4 attachmentModel];
    [v6 undeleteChildAttachments];
  }
}

+ (void)purgeAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"ICAttachmentWillBeDeletedNotification" object:v7];

    int v5 = [v7 managedObjectContext];
    [v5 deleteObject:v7];

    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"ICAttachmentWasDeletedNotification" object:v7];

    if (objc_opt_respondsToSelector()) {
      [v7 notifyDocCamFrameworkAttachmentWasDeleted];
    }
  }
}

+ (id)allAttachmentsInContext:(id)a3
{
  return (id)[a1 attachmentsMatchingPredicate:0 context:a3];
}

+ (void)enumerateAttachmentsInContext:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 usingBlock:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v14 = a3;
  id v12 = a7;
  if (v9)
  {
    uint64_t v13 = [a1 predicateForVisibleAttachmentsInContext:v14];
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v13, 0, 0, v14, a4, v8, v12);
}

+ (id)attachmentTypeUTIsToHideFromAttachmentBrowser
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.notes.sketch";
  v4[1] = @"com.apple.notes.table";
  v4[2] = @"com.apple.drawing";
  v4[3] = @"com.apple.drawing.2";
  v4[4] = @"com.apple.paper";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

+ (id)predicateForAttachmentBrowserWithContext:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ICAttachment_Management__predicateForAttachmentBrowserWithContext___block_invoke;
  v9[3] = &unk_1E64A6458;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = predicateForAttachmentBrowserWithContext__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&predicateForAttachmentBrowserWithContext__onceToken, v9);
  }
  id v7 = (id)predicateForAttachmentBrowserWithContext__predicate;

  return v7;
}

void __69__ICAttachment_Management__predicateForAttachmentBrowserWithContext___block_invoke(uint64_t a1)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) predicateForPasswordProtected:0];
  v10[0] = v2;
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 40) attachmentTypeUTIsToHideFromAttachmentBrowser];
  uint64_t v5 = [v3 predicateWithFormat:@"NOT (typeUTI in %@)", v4];
  v10[1] = v5;
  id v6 = [*(id *)(a1 + 40) predicateForVisibleAttachmentsInContext:*(void *)(a1 + 32)];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  uint64_t v8 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  BOOL v9 = (void *)predicateForAttachmentBrowserWithContext__predicate;
  predicateForAttachmentBrowserWithContext__predicate = v8;
}

+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3
{
  return +[ICUnsupportedObjectPredicateHelper predicateForSupportedAttachmentsInContext:a3];
}

+ (id)predicateForSearchableAttachmentsInContext:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __71__ICAttachment_Management__predicateForSearchableAttachmentsInContext___block_invoke;
  id v14 = &__block_descriptor_40_e5_v8__0l;
  id v15 = a1;
  uint64_t v4 = predicateForSearchableAttachmentsInContext__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&predicateForSearchableAttachmentsInContext__onceToken, &v11);
  }
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = objc_msgSend(a1, "predicateForUnsupportedAttachmentsInContext:", v5, v11, v12, v13, v14, v15, predicateForSearchableAttachmentsInContext__predicate);

  v16[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  BOOL v9 = [v6 andPredicateWithSubpredicates:v8];

  return v9;
}

void __71__ICAttachment_Management__predicateForSearchableAttachmentsInContext___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) predicateForVisibleObjects];
  v7[0] = v2;
  id v3 = [*(id *)(a1 + 32) predicateForPasswordProtected:0];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  uint64_t v5 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
  id v6 = (void *)predicateForSearchableAttachmentsInContext__predicate;
  predicateForSearchableAttachmentsInContext__predicate = v5;
}

+ (id)predicateForVisibleAttachmentsWithTypeUTI:(id)a3 inContext:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  uint64_t v8 = [v6 predicateWithFormat:@"typeUTI == %@", a3];
  BOOL v9 = [a1 predicateForVisibleAttachmentsInContext:v7];

  id v10 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v8;
  v14[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v12 = [v10 andPredicateWithSubpredicates:v11];

  return v12;
}

+ (id)predicateForInlineDrawing
{
  if (predicateForInlineDrawing_onceToken != -1) {
    dispatch_once(&predicateForInlineDrawing_onceToken, &__block_literal_global_990);
  }
  uint64_t v2 = (void *)predicateForInlineDrawing_predicate;
  return v2;
}

void __53__ICAttachment_Management__predicateForInlineDrawing__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"typeUTI == %@ || typeUTI == %@", @"com.apple.drawing.2", @"com.apple.drawing"];
  uint64_t v1 = (void *)predicateForInlineDrawing_predicate;
  predicateForInlineDrawing_predicate = v0;
}

+ (id)newFetchRequestForAttachments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ICAttachment"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"modificationDate" ascending:0];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 setSortDescriptors:v4];

  return v2;
}

+ (unint64_t)countOfAttachmentsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[a1 newFetchRequestForAttachments];
  [v8 setPredicate:v7];

  unint64_t v9 = [v6 countForFetchRequest:v8 error:0];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)recursivelyAddSubAttachments:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(ICAttachment *)self subAttachments];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v4 addObject:v11];
        [v11 recursivelyAddSubAttachments:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

+ (id)fallbackImageUTI
{
  return (id)[(id)*MEMORY[0x1E4F44460] identifier];
}

+ (id)fallbackImageContainerURLForIdentifier:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = [a4 fallbackImageDirectoryURL];
  uint64_t v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:1];

  return v7;
}

+ (id)fallbackImageFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = [a4 fallbackImageDirectoryURL];
  uint64_t v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:0];

  uint64_t v8 = [v7 URLByAppendingPathExtension:@"jpg"];

  return v8;
}

+ (id)fallbackImageEncryptedFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  id v4 = [a1 fallbackImageFallbackURLForIdentifier:a3 account:a4];
  id v5 = [v4 URLByAppendingPathExtension:@"encrypted"];

  return v5;
}

- (id)fallbackImageURL
{
  id v3 = [(ICAttachment *)self account];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(ICAttachment *)self note];
    uint64_t v7 = [v6 account];
    uint64_t v8 = v7;
    if (v7)
    {
      id v5 = v7;
    }
    else
    {
      uint64_t v9 = [(ICAttachment *)self note];
      id v10 = [v9 folder];
      id v5 = [v10 account];
    }
  }

  uint64_t v11 = [(ICAttachment *)self identifier];

  long long v12 = 0;
  if (v11 && v5)
  {
    long long v13 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];
    long long v14 = [v13 generationURL];

    if (v14)
    {
      long long v15 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];
      uint64_t v16 = [v15 generationURL];
      uint64_t v17 = [v16 URLByAppendingPathComponent:@"FallbackImage" isDirectory:0];

      os_log_t v18 = [(id)objc_opt_class() fallbackImageUTI];
      id v19 = [v18 pathExtension];
      long long v12 = [v17 URLByAppendingPathExtension:v19];
    }
    else
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v17 = [(ICAttachment *)self identifier];
      long long v12 = [v20 fallbackImageFallbackURLForIdentifier:v17 account:v5];
    }
  }
  return v12;
}

- (id)fallbackImageEncryptedURL
{
  uint64_t v2 = [(ICAttachment *)self fallbackImageURL];
  id v3 = [v2 URLByAppendingPathExtension:@"encrypted"];

  return v3;
}

- (BOOL)hasFallbackImage
{
  if ([(ICAttachment *)self isPasswordProtected]) {
    [(ICAttachment *)self fallbackImageEncryptedURL];
  }
  else {
  id v3 = [(ICAttachment *)self fallbackImageURL];
  }
  char v4 = objc_msgSend(v3, "ic_isReachable");

  return v4;
}

- (id)fallbackImageData
{
  if ([(ICAttachment *)self isPasswordProtected])
  {
    id v3 = [(ICCloudSyncingObject *)self cryptoStrategy];
    char v4 = [v3 decryptedFallbackImageData];
  }
  else
  {
    id v5 = [(ICAttachment *)self fallbackImageURL];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v7 = [(ICAttachment *)self fallbackImageURL];
      char v4 = [v6 dataWithContentsOfURL:v7];
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(Management) fallbackImageData](self);
      }

      char v4 = 0;
    }
  }
  return v4;
}

- (BOOL)writeFallbackImageData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    uint64_t v7 = objc_msgSend(v4, "ic_sha256");
    int v19 = 138413058;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    __int16 v23 = 2080;
    id v22 = v7;
    __int16 v24 = "-[ICAttachment(Management) writeFallbackImageData:]";
    __int16 v25 = 1024;
    int v26 = 2712;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Writing fallback image data… {attachment: %@, data.sha256: %@}%s:%d", (uint8_t *)&v19, 0x26u);
  }
  uint64_t v8 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];

  if (v8)
  {
    uint64_t v9 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];
    char v10 = [v9 beginGeneration];

    if (v10)
    {
      if ([(ICAttachment *)self isPasswordProtected])
      {
        uint64_t v11 = [(ICCloudSyncingObject *)self cryptoStrategy];
        char v12 = [v11 writeEncryptedFallbackImageData:v4];

        if ((v12 & 1) == 0)
        {
LABEL_18:
          os_log_t v13 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];
          [v13 rollbackGeneration];
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v16 = [(ICAttachment *)self fallbackImageURL];

        if (v16)
        {
          uint64_t v17 = [(ICAttachment *)self fallbackImageURL];
          int v18 = [v4 writeToURL:v17 atomically:1];

          if (!v18) {
            goto LABEL_18;
          }
        }
      }
      os_log_t v13 = [(ICAttachment(Management) *)self fallbackImageGenerationManager];
      char v14 = [v13 commitGeneration];
      goto LABEL_14;
    }
    os_log_t v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(Management) writeFallbackImageData:](self);
    }
  }
  else
  {
    os_log_t v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(Management) writeFallbackImageData:](self);
    }
  }

LABEL_13:
  char v14 = 0;
LABEL_14:

  return v14;
}

+ (id)fallbackPDFUTI
{
  return (id)[(id)*MEMORY[0x1E4F44450] identifier];
}

+ (id)fallbackPDFContainerURLForIdentifier:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = [a4 fallbackPDFDirectoryURL];
  uint64_t v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:1];

  return v7;
}

+ (id)fallbackPDFFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 fallbackPDFDirectoryURL];
  uint64_t v8 = [v7 URLByAppendingPathComponent:v6 isDirectory:0];

  uint64_t v9 = [a1 fallbackPDFUTI];
  char v10 = [v9 pathExtension];
  uint64_t v11 = [v8 URLByAppendingPathExtension:v10];

  return v11;
}

+ (id)fallbackPDFEncryptedFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  id v4 = [a1 fallbackPDFFallbackURLForIdentifier:a3 account:a4];
  id v5 = [v4 URLByAppendingPathExtension:@"encrypted"];

  return v5;
}

- (id)fallbackPDFURL
{
  id v3 = [(ICAttachment *)self account];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(ICAttachment *)self note];
    uint64_t v7 = [v6 account];
    uint64_t v8 = v7;
    if (v7)
    {
      id v5 = v7;
    }
    else
    {
      uint64_t v9 = [(ICAttachment *)self note];
      char v10 = [v9 folder];
      id v5 = [v10 account];
    }
  }

  uint64_t v11 = [(ICAttachment *)self identifier];

  char v12 = 0;
  if (v11 && v5)
  {
    os_log_t v13 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];
    char v14 = [v13 generationURL];

    if (v14)
    {
      long long v15 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];
      uint64_t v16 = [v15 generationURL];
      uint64_t v17 = [v16 URLByAppendingPathComponent:@"FallbackPDF" isDirectory:0];

      int v18 = [(id)objc_opt_class() fallbackPDFUTI];
      int v19 = [v18 pathExtension];
      char v12 = [v17 URLByAppendingPathExtension:v19];
    }
    else
    {
      uint64_t v20 = objc_opt_class();
      uint64_t v17 = [(ICAttachment *)self identifier];
      char v12 = [v20 fallbackPDFFallbackURLForIdentifier:v17 account:v5];
    }
  }
  return v12;
}

- (id)fallbackPDFEncryptedURL
{
  uint64_t v2 = [(ICAttachment *)self fallbackPDFURL];
  id v3 = [v2 URLByAppendingPathExtension:@"encrypted"];

  return v3;
}

- (BOOL)hasFallbackPDF
{
  if ([(ICAttachment *)self isPasswordProtected]) {
    [(ICAttachment *)self fallbackPDFEncryptedURL];
  }
  else {
  id v3 = [(ICAttachment *)self fallbackPDFURL];
  }
  char v4 = objc_msgSend(v3, "ic_isReachable");

  return v4;
}

- (id)fallbackPDFData
{
  if ([(ICAttachment *)self isPasswordProtected])
  {
    id v3 = [(ICCloudSyncingObject *)self cryptoStrategy];
    char v4 = [v3 decryptedFallbackPDFData];
  }
  else
  {
    id v5 = [(ICAttachment *)self fallbackPDFURL];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v7 = [(ICAttachment *)self fallbackPDFURL];
      char v4 = [v6 dataWithContentsOfURL:v7];
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(Management) fallbackPDFData](self);
      }

      char v4 = 0;
    }
  }
  return v4;
}

- (BOOL)writeFallbackPDFData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(ICCloudSyncingObject *)self shortLoggingDescription];
    uint64_t v7 = objc_msgSend(v4, "ic_sha256");
    int v19 = 138413058;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    __int16 v23 = 2080;
    id v22 = v7;
    __int16 v24 = "-[ICAttachment(Management) writeFallbackPDFData:]";
    __int16 v25 = 1024;
    int v26 = 2820;
    _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEFAULT, "Writing fallback PDF data… {attachment: %@, data.sha256: %@}%s:%d", (uint8_t *)&v19, 0x26u);
  }
  uint64_t v8 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];

  if (v8)
  {
    uint64_t v9 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];
    char v10 = [v9 beginGeneration];

    if (v10)
    {
      if ([(ICAttachment *)self isPasswordProtected])
      {
        uint64_t v11 = [(ICCloudSyncingObject *)self cryptoStrategy];
        char v12 = [v11 writeEncryptedFallbackPDFData:v4];

        if ((v12 & 1) == 0)
        {
LABEL_18:
          os_log_t v13 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];
          [v13 rollbackGeneration];
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v16 = [(ICAttachment *)self fallbackPDFURL];

        if (v16)
        {
          uint64_t v17 = [(ICAttachment *)self fallbackPDFURL];
          int v18 = [v4 writeToURL:v17 atomically:1];

          if (!v18) {
            goto LABEL_18;
          }
        }
      }
      os_log_t v13 = [(ICAttachment(Management) *)self fallbackPDFGenerationManager];
      char v14 = [v13 commitGeneration];
      goto LABEL_14;
    }
    os_log_t v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(Management) writeFallbackPDFData:](self);
    }
  }
  else
  {
    os_log_t v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(Management) writeFallbackPDFData:](self);
    }
  }

LABEL_13:
  char v14 = 0;
LABEL_14:

  return v14;
}

- (id)paperBundleURL
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__55;
  uint64_t v11 = __Block_byref_object_dispose__55;
  id v12 = 0;
  id v3 = [(ICAttachment *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __42__ICAttachment_Management__paperBundleURL__block_invoke;
  void v6[3] = &unk_1E64A4528;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__ICAttachment_Management__paperBundleURL__block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) identifier];
  id v4 = [*(id *)(a1 + 32) note];
  id v5 = [v4 account];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v1 = [*(id *)(a1 + 32) note];
    uint64_t v2 = [v1 folder];
    id v6 = [v2 account];
  }
  uint64_t v7 = +[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:v10 inAccount:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!v5)
  {
  }
}

- (id)paperBundleDatabaseSubdirectoryURL
{
  uint64_t v2 = [(ICAttachment *)self paperBundleURL];
  id v3 = +[ICSystemPaperDocument databaseDirectoryAt:v2];

  return v3;
}

- (id)paperBundleAssetsSubdirectoryURL
{
  uint64_t v2 = [(ICAttachment *)self paperBundleURL];
  id v3 = +[ICSystemPaperDocument assetsDirectoryAt:v2];

  return v3;
}

+ (id)temporaryPaperBundleURLForIdentifier:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
LABEL_3:
      uint64_t v7 = [v6 systemPaperTemporaryDirectoryURL];
      uint64_t v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:1];

      uint64_t v9 = [v8 URLByAppendingPathExtension:@"bundle"];

      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((account) != nil)", "+[ICAttachment(Management) temporaryPaperBundleURLForIdentifier:account:]", 1, 0, @"Expected non-nil value for '%s'", "account");
    if (v5) {
      goto LABEL_3;
    }
  }
  id v10 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[ICAttachment(Management) temporaryPaperBundleURLForIdentifier:account:](v10);
  }

  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (id)paperCoherenceContextURL
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__55;
  uint64_t v11 = __Block_byref_object_dispose__55;
  id v12 = 0;
  id v3 = [(ICAttachment *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __52__ICAttachment_Management__paperCoherenceContextURL__block_invoke;
  void v6[3] = &unk_1E64A4528;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__ICAttachment_Management__paperCoherenceContextURL__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) note];
  uint64_t v3 = [v2 paperCoherenceContextURL];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(a1 + 32) isPasswordProtected])
  {
    id v6 = [*(id *)(a1 + 32) identifier];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) URLByDeletingLastPathComponent];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v15 = [*(id *)(a1 + 32) identifier];
      uint64_t v12 = [v11 URLByAppendingPathComponent:v15 isDirectory:1];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      char v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
}

- (id)temporaryPaperBundleURL
{
  if ([(ICAttachment *)self attachmentType] == 6
    || [(ICAttachment *)self attachmentType] == 11)
  {
    uint64_t v3 = [(ICAttachment *)self identifier];
    uint64_t v4 = [(ICAttachment *)self note];
    id v5 = [v4 account];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = [(ICAttachment *)self note];
      uint64_t v9 = [v8 folder];
      id v7 = [v9 account];
    }
    if ([v3 length])
    {
      if (v7) {
        goto LABEL_8;
      }
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"identifier.length" functionName:"-[ICAttachment(Management) temporaryPaperBundleURL]" simulateCrash:1 showAlert:1 format:@"identifier is empty"];
      if (v7)
      {
LABEL_8:
        if (v3)
        {
          id v10 = [(id)objc_opt_class() temporaryPaperBundleURLForIdentifier:v3 account:v7];
LABEL_15:

          goto LABEL_17;
        }
LABEL_12:
        uint64_t v11 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[ICAttachment(Management) temporaryPaperBundleURL]();
        }

        id v10 = 0;
        goto LABEL_15;
      }
    }
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"account" functionName:"-[ICAttachment(Management) temporaryPaperBundleURL]" simulateCrash:1 showAlert:1 format:@"account is nil"];
    goto LABEL_12;
  }
  id v10 = 0;
LABEL_17:
  return v10;
}

- (void)removeTemporaryPaperBundle
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ICAttachment *)self temporaryPaperBundleURL];
  if (v3)
  {
    uint64_t v15 = 0;
    v16[0] = &v15;
    v16[1] = 0x3032000000;
    v16[2] = __Block_byref_object_copy__55;
    void v16[3] = __Block_byref_object_dispose__55;
    id v17 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    id v6 = (id *)(v16[0] + 40);
    id v5 = *(void **)(v16[0] + 40);
    void v9[5] = &v15;
    obuint64_t j = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__ICAttachment_Management__removeTemporaryPaperBundle__block_invoke;
    v9[3] = &unk_1E64A4FE0;
    void v9[4] = &v11;
    [v4 coordinateWritingItemAtURL:v3 options:1 error:&obj byAccessor:v9];
    objc_storeStrong(v6, obj);
    if (!*((unsigned char *)v12 + 24))
    {
      id v7 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [(ICCloudSyncingObject *)self shortLoggingDescription];
        [(ICAttachment(Management) *)v8 removeTemporaryPaperBundle];
      }
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
}

void __54__ICAttachment_Management__removeTemporaryPaperBundle__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v6 + 40);
  char v7 = [v5 removeItemAtURL:v4 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
}

- (void)addLocationIfNeeded
{
  uint64_t v3 = [(ICAttachment *)self location];
  if (!v3)
  {
    if ([(ICAttachment *)self checkedForLocation]) {
      return;
    }
    [(ICAttachment *)self setCheckedForLocation:1];
    id v4 = [(ICAttachment *)self attachmentModel];
    [v4 addLocation];
    uint64_t v3 = v4;
  }
}

- (id)addLocationWithLatitude:(double)a3 longitude:(double)a4
{
  id v7 = +[ICAttachmentLocation newAttachmentLocationForAttachment:self];
  [(ICAttachment *)self setLocation:v7];

  uint64_t v8 = [(ICAttachment *)self location];
  [v8 setLatitude:a3];

  uint64_t v9 = [(ICAttachment *)self location];
  [v9 setLongitude:a4];

  return (id)[(ICAttachment *)self location];
}

- (void)regenerateTitle
{
}

- (void)regenerateTitleWithInferredTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachment *)self userTitle];

  if (!v5)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    __int16 v21 = __Block_byref_object_copy__55;
    id v22 = __Block_byref_object_dispose__55;
    id v23 = v4;
    if (!v19[5] && [(ICAttachment *)self attachmentType] == 11)
    {
      objc_opt_class();
      uint64_t v6 = [(ICAttachment *)self attachmentModel];
      id v7 = ICDynamicCast();

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__ICAttachment_Management__regenerateTitleWithInferredTitle___block_invoke;
      v17[3] = &unk_1E64A94D0;
      v17[4] = &v18;
      [v7 enumerateSubAttachmentsWithBlock:v17];
    }
    if (v19[5]
      || (+[ICAttachment defaultTitleForAttachmentType:[(ICAttachment *)self attachmentType]], v8 = objc_claimAutoreleasedReturnValue(), uint64_t v9 = (void *)v19[5], v19[5] = v8, v9, v19[5]))
    {
      id v10 = [(ICAttachment *)self title];
      char v11 = [v10 isEqualToString:v19[5]];

      if ((v11 & 1) == 0)
      {
        [(ICAttachment *)self setTitle:v19[5]];
        [(ICCloudSyncingObject *)self updateChangeCountWithReason:@"Regenerated attachment title"];
        uint64_t v12 = [(ICAttachment *)self note];
        int v13 = [v12 regenerateTitle:1 snippet:1];

        if (v13)
        {
          char v14 = [(ICAttachment *)self note];
          [v14 markShareDirtyIfNeededWithReason:@"Regenerated attachment title"];

          uint64_t v15 = [(ICAttachment *)self note];
          [v15 updateChangeCountWithReason:@"Regenerated attachment title"];
        }
        uint64_t v16 = [(ICAttachment *)self managedObjectContext];
        objc_msgSend(v16, "ic_save");
      }
    }
    _Block_object_dispose(&v18, 8);
  }
}

void __61__ICAttachment_Management__regenerateTitleWithInferredTitle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [a2 title];
  uint64_t v8 = v7;
  if (v7)
  {
    obuint64_t j = v7;
    uint64_t v9 = [v7 length];
    uint64_t v8 = obj;
    if (v9)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
      uint64_t v8 = obj;
      *a5 = 1;
    }
  }
}

- (void)updatePlaceInLocationIfNeededHandler:(id)a3
{
  id v4 = a3;
  [(ICAttachment *)self addLocationIfNeeded];
  id v5 = [(ICAttachment *)self location];
  uint64_t v6 = v5;
  if (!v5 || ([v5 placeUpdated] & 1) != 0 || (objc_msgSend(v6, "updatingPlace") & 1) != 0)
  {
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  else
  {
    id v7 = [(ICAttachment *)self managedObjectContext];
    [v6 setUpdatingPlace:1];
    uint64_t v8 = +[ICLocationContext sharedContext];
    [v6 latitude];
    double v10 = v9;
    [v6 longitude];
    double v12 = v11;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke;
    void v14[3] = &unk_1E64A94F8;
    id v15 = v7;
    id v16 = v6;
    id v17 = self;
    id v18 = v4;
    id v13 = v7;
    [v8 lookupPlaceAtLatitude:v14 longitude:v10 handler:v12];
  }
}

void __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke_2;
  v11[3] = &unk_1E64A8188;
  id v12 = v6;
  id v7 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  uint64_t v8 = *(void **)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 48);
  id v16 = v8;
  id v9 = v5;
  id v10 = v6;
  [v7 performBlock:v11];
}

uint64_t __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setPlacemark:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setPlaceUpdated:1];
    [*(id *)(a1 + 56) updateChangeCountWithReason:@"Updated placemark"];
  }
  [*(id *)(a1 + 40) setUpdatingPlace:0];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)noteWillMoveToRecentlyDeletedFolder
{
  id v2 = [(ICAttachment *)self paperBundleModel];
  [v2 removeStrokesFromStyleInventory];
}

- (id)addInlineAttachmentWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachment *)self note];
  id v6 = +[ICBaseAttachment newAttachmentWithIdentifier:v4 note:v5];

  [(ICAttachment *)self addInlineAttachmentsObject:v6];
  id v7 = [(ICAttachment *)self note];
  [v7 addInlineAttachmentsObject:v6];

  return v6;
}

- (void)updateAfterMediaChange
{
  id v2 = [(ICAttachment *)self attachmentModel];
  [v2 updateFileBasedAttributes];
}

- (id)addMediaWithData:(id)a3 filename:(id)a4
{
  return [(ICAttachment *)self addMediaWithData:a3 filename:a4 updateFileBasedAttributes:1];
}

- (id)addMediaWithData:(id)a3 filename:(id)a4 updateFileBasedAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v10 = 0;
  id v7 = +[ICMedia newMediaWithAttachment:self forData:a3 filename:a4 error:&v10];
  if (v10) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v5;
  }
  if (!v8) {
    [(ICAttachment *)self updateAfterMediaChange];
  }
  [(ICAttachment *)self setMedia:v7];
  [v7 setAttachment:self];
  return v7;
}

- (id)addMediaWithFileWrapper:(id)a3
{
  uint64_t v6 = 0;
  id v4 = +[ICMedia newMediaWithAttachment:self forFileWrapper:a3 error:&v6];
  if (!v6) {
    [(ICAttachment *)self updateAfterMediaChange];
  }
  [(ICAttachment *)self setMedia:v4];
  [v4 setAttachment:self];
  return v4;
}

- (id)addMediaWithURL:(id)a3
{
  return [(ICAttachment *)self addMediaWithURL:a3 updateFileBasedAttributes:1];
}

- (id)addMediaWithURL:(id)a3 updateFileBasedAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v9 = 0;
  id v6 = +[ICMedia newMediaWithAttachment:self forURL:a3 error:&v9];
  if (v9) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v4;
  }
  if (!v7) {
    [(ICAttachment *)self updateAfterMediaChange];
  }
  [(ICAttachment *)self setMedia:v6];
  [v6 setAttachment:self];
  return v6;
}

- (BOOL)hasAnyPNGPreviewImageFiles
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ICAttachment *)self previewImages];
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) hasAnyPNGPreviewImageFiles])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)deleteAttachmentPreviewImages
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(ICAttachment *)self previewImages];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) markForDeletion];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentPreviewImagesDidUpdateNotification"];
}

- (void)undeleteAttachmentPreviewImages
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(ICAttachment *)self previewImages];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) unmarkForDeletion];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)purgeAttachmentPreviewImages
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(ICAttachment *)self previewImages];
  uint64_t v4 = (void *)[v3 copy];

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
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        [(ICAttachment *)self removePreviewImagesObject:v9];
        long long v10 = [(ICAttachment *)self managedObjectContext];
        [v10 deleteObject:v9];

        long long v11 = [(ICAttachment *)self attachmentModel];
        LODWORD(v10) = [v11 requiresPostProcessing];

        if (v10)
        {
          [(ICAttachment *)self setOcrSummary:0];
          [(ICAttachment *)self setImageClassificationSummary:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)invalidateAttachmentPreviewImages
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ICAttachment *)self previewImages];
  uint64_t v3 = (void *)[v2 copy];

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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateImage];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)checkPreviewImagesIntegrity
{
  if (checkPreviewImagesIntegrity_onceToken != -1) {
    dispatch_once(&checkPreviewImagesIntegrity_onceToken, &__block_literal_global_1112);
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  id v3 = (id)checkPreviewImagesIntegrity_sCheckedAttachments;
  objc_sync_enter(v3);
  uint64_t v4 = checkPreviewImagesIntegrity_sCheckedAttachments;
  uint64_t v5 = [(ICAttachment *)self objectID];
  LOBYTE(v4) = [(id)v4 containsObject:v5];

  if (v4)
  {
    objc_sync_exit(v3);
  }
  else
  {
    uint64_t v7 = (void *)checkPreviewImagesIntegrity_sCheckedAttachments;
    long long v8 = [(ICAttachment *)self objectID];
    [v7 addObject:v8];

    objc_sync_exit(v3);
    long long v9 = [(ICAttachment *)self managedObjectContext];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_2;
    v18[3] = &unk_1E64A44A8;
    v18[4] = self;
    v18[5] = &v19;
    [v9 performBlockAndWait:v18];

    if (*((unsigned char *)v20 + 24))
    {
      int v6 = 1;
      goto LABEL_8;
    }
    long long v12 = [(ICAttachment *)self managedObjectContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3;
    v17[3] = &unk_1E64A4240;
    v17[4] = self;
    [v12 performBlockAndWait:v17];

    uint64_t v13 = +[ICNoteContext sharedContext];
    int v14 = [v13 hasContextOptions:32];

    if (v14)
    {
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_1114;
      void v16[3] = &unk_1E64A4240;
      void v16[4] = self;
      dispatch_after(v15, MEMORY[0x1E4F14428], v16);
    }
  }
  int v6 = *((unsigned __int8 *)v20 + 24);
LABEL_8:
  BOOL v10 = v6 != 0;
  _Block_object_dispose(&v19, 8);
  return v10;
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = (void *)checkPreviewImagesIntegrity_sCheckedAttachments;
  checkPreviewImagesIntegrity_sCheckedAttachments = (uint64_t)v0;
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "previewImages", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v7 imageIsWriting] & 1) == 0 && (objc_msgSend(v7, "imageIsValid") & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) purgeAttachmentPreviewImages];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) managedObjectContext];
    id v7 = 0;
    [v4 save:&v7];
    id v5 = v7;

    if (v5)
    {
      int v6 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3_cold_1();
      }
    }
  }
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_1114(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = [*(id *)(a1 + 32) objectID];
  [v3 postNotificationName:@"ICAttachmentNeedsPreviewGenerationNotification" object:v2];
}

- (void)loadLinkPreviewForSynapseItem:(id)a3
{
  id v4 = a3;
  id v5 = [[ICSynapseLinkPreviewLoadingOperation alloc] initWithSynapseItem:v4];
  loadOperation = self->_loadOperation;
  self->_loadOperation = v5;

  id v7 = [(ICAttachment *)self ic_permanentObjectID];
  long long v8 = self->_loadOperation;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke;
  v11[3] = &unk_1E64A4500;
  id v12 = v4;
  id v13 = v7;
  int v14 = self;
  id v9 = v7;
  id v10 = v4;
  [(ICSynapseLinkPreviewLoadingOperation *)v8 loadPreviewWithCompletionBlock:v11];
}

void __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v12 = 0;
  id v3 = [v2 dataRepresentationWithError:&v12];
  id v4 = v12;
  if (v4)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "-[ICAttachment(Previews) loadLinkPreviewForSynapseItem:]_block_invoke", 1, 0, @"Couldn't serialize SYContentItem to NSData. Error: %@", v4 functionName simulateCrash showAlert format];
  }
  else
  {
    id v5 = +[ICNoteContext sharedContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke_2;
    v8[3] = &unk_1E64A9520;
    id v9 = *(id *)(a1 + 40);
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = v7;
    [v5 performBackgroundTask:v8];
  }
}

void __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[ICAttachment ic_existingObjectWithID:v3 context:v4];
  [v5 setSynapseData:*(void *)(a1 + 40)];
  objc_msgSend(v4, "ic_save");

  objc_msgSend(*(id *)(a1 + 48), "ic_postNotificationOnMainThreadWithName:", @"ICAttachmentDidLoadNotification");
}

- (id)updateAttachmentPreviewImageWithImageData:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8 sendNotification:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v11 = a7;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  id v18 = [(ICAttachment *)self attachmentPreviewImageCreatingIfNecessaryWithWidth:a6 height:v11 scale:a8 appearanceType:width scaleWhenDrawing:height metadata:a5];
  uint64_t v19 = v18;
  if (v18)
  {
    [v18 setScaleWhenDrawing:v11];
    int v20 = objc_msgSend(v19, "setImageData:withSize:scale:appearanceType:", v17, a6, width, height, a5);
    if (v20 && v9)
    {
      id v21 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentPreviewImagesDidUpdateNotification"];
    }
    else if ((v20 & 1) == 0)
    {
      char v22 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(Previews) updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:](v19);
      }

      [(ICAttachment *)self removePreviewImagesObject:v19];
      id v23 = [v19 managedObjectContext];
      [v23 deleteObject:v19];

      uint64_t v19 = 0;
    }
  }

  return v19;
}

- (id)updateAttachmentPreviewImageWithImageSrc:(CGImageSource *)a3 maxDimension:(double)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8 sendNotification:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a7;
  id v16 = a8;
  CFDictionaryRef v17 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  CFDictionaryRef v18 = v17;
  if (v17)
  {
    uint64_t v19 = [(__CFDictionary *)v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    uint64_t v20 = [(__CFDictionary *)v18 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    id v21 = (void *)v20;
    if (v19) {
      BOOL v22 = v20 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22)
    {
      id v23 = 0;
    }
    else
    {
      BOOL v35 = v9;
      [v19 floatValue];
      float v25 = v24;
      double v26 = v24;
      [v21 floatValue];
      double v28 = v27;
      if (v25 >= v27) {
        double v29 = v26;
      }
      else {
        double v29 = v27;
      }
      id v23 = [(ICAttachment *)self attachmentPreviewImageCreatingIfNecessaryWithWidth:a6 height:v10 scale:v16 appearanceType:round(a4 / v29 * v26) scaleWhenDrawing:round(a4 / v29 * v28) metadata:a5];
      CFRetain(a3);
      id v30 = [(ICAttachment *)self attachmentModel];
      id v31 = [v30 previewImageTypeUTI];
      char v32 = [v23 setScaledImageFromImageSrc:a3 typeUTI:v31];

      CFRelease(a3);
      if (v32)
      {
        if (v35) {
          id v33 = (id)[(ICAttachment *)self ic_postNotificationOnMainThreadAfterSaveWithName:@"ICAttachmentPreviewImagesDidUpdateNotification"];
        }
      }
      else
      {
        [(ICAttachment *)self removePreviewImagesObject:v23];
      }
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)attachmentPreviewImageCreatingIfNecessaryWithWidth:(double)a3 height:(double)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__55;
  char v32 = __Block_byref_object_dispose__55;
  id v33 = 0;
  [(ICAttachment *)self checkPreviewImagesIntegrity];
  dispatch_time_t v15 = [(ICAttachment *)self managedObjectContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __131__ICAttachment_Previews__attachmentPreviewImageCreatingIfNecessaryWithWidth_height_scale_appearanceType_scaleWhenDrawing_metadata___block_invoke;
  v20[3] = &unk_1E64A9548;
  double v23 = a5;
  double v24 = a3;
  double v25 = a4;
  unint64_t v26 = a6;
  v20[4] = self;
  BOOL v22 = &v28;
  BOOL v27 = a7;
  id v16 = v14;
  id v21 = v16;
  [v15 performBlockAndWait:v20];

  CFDictionaryRef v17 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    double v35 = a3;
    __int16 v36 = 2048;
    double v37 = a4;
    __int16 v38 = 2048;
    long long v39 = self;
    _os_log_debug_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_DEBUG, "Update preview image %.0fx%.0f 0x%p", buf, 0x20u);
  }

  id v18 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __131__ICAttachment_Previews__attachmentPreviewImageCreatingIfNecessaryWithWidth_height_scale_appearanceType_scaleWhenDrawing_metadata___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  uint64_t v3 = [*(id *)(a1 + 32) previewImages];

  if (v3)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "previewImages", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(v4);
          }
          long long v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v8 scale];
          if (v9 == *(double *)(a1 + 56))
          {
            [v8 width];
            if (v10 == *(double *)(a1 + 64))
            {
              [v8 height];
              if (v11 == *(double *)(a1 + 72) && *(void *)(a1 + 80) == (int)[v8 appearanceType]) {
                objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
              }
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v5);
    }
  }
  id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v12)
  {
    id v13 = [*(id *)(a1 + 32) identifier];
    id v14 = +[ICAttachmentPreviewImage identifierForContentIdentifier:v13 scale:*(void *)(a1 + 80) width:*(double *)(a1 + 56) height:*(double *)(a1 + 64) appearanceType:*(double *)(a1 + 72)];

    dispatch_time_t v15 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v16 = +[ICAttachmentPreviewImage attachmentPreviewImageWithIdentifier:v14 inContext:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v19)
    {
      uint64_t v20 = [v19 attachment];
      BOOL v21 = v20 == *(void **)(a1 + 32);

      if (v21)
      {
LABEL_23:

        id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        goto LABEL_24;
      }
      BOOL v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v22)
      {
        double v23 = [v22 attachment];
        BOOL v24 = v23 == 0;

        if (v24)
        {
          double v25 = [*(id *)(a1 + 32) managedObjectContext];
          [v25 deleteObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        }
      }
    }
    id v26 = +[ICAttachmentPreviewImage newAttachmentPreviewImageWithIdentifier:v14 attachment:*(void *)(a1 + 32)];
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    [*(id *)(a1 + 32) addPreviewImagesObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setWidth:*(double *)(a1 + 64)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setHeight:*(double *)(a1 + 72)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setScale:*(double *)(a1 + 56)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setScaleWhenDrawing:*(unsigned __int8 *)(a1 + 88)];
    if ([*(id *)(a1 + 32) isPasswordProtected])
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setIsPasswordProtected:1];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) initializeCryptoProperties];
    }
    goto LABEL_23;
  }
LABEL_24:
  [v12 setMetadata:*(void *)(a1 + 40)];
  objc_sync_exit(v2);
}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4
{
  return -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:", 0, a3.width, a3.height, a4);
}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5
{
  return -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", a5, 0, a3.width, a3.height, a4);
}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5 requireAppearance:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  id v12 = -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:", a5, 1, 1);
  if (!v12)
  {
    id v12 = -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:", a5, 0, v6, width, height, a4);
  }
  return v12;
}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5 matchScale:(BOOL)a6 matchAppearance:(BOOL)a7
{
  BOOL v56 = a7;
  BOOL v7 = a6;
  double v9 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (a4 <= 0.0)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"scale > 0." functionName:"-[ICAttachment(Previews) attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:]" simulateCrash:1 showAlert:0 format:@"Passing invalid scale to attachmentPreviewImageWithMinSize"];
    double v9 = 1.0;
  }
  int v13 = [(ICAttachment *)self attachmentType];
  [(ICAttachment *)self checkPreviewImagesIntegrity];
  if (v7) {
    double v14 = 1.0;
  }
  else {
    double v14 = v9;
  }
  dispatch_time_t v15 = [(ICAttachment *)self previewImages];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    id v50 = 0;
    uint64_t v19 = 0;
    goto LABEL_62;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = [(ICAttachment *)self previewImages];
  uint64_t v17 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (!v17)
  {
    char v57 = 0;
    uint64_t v19 = 0;
    goto LABEL_61;
  }
  uint64_t v18 = v17;
  double v54 = v9;
  id v55 = self;
  char v57 = 0;
  uint64_t v19 = 0;
  double v20 = width * v14;
  double v21 = height * v14;
  double v23 = *MEMORY[0x1E4F1DB30];
  double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v24 = *(void *)v62;
  double v59 = v22;
  double v60 = *MEMORY[0x1E4F1DB30];
  do
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v62 != v24) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(void **)(*((void *)&v61 + 1) + 8 * v25);
      [v26 width];
      double v28 = v27;
      [v26 height];
      double v30 = v29;
      if (v13 == 8 && (v28 > v60 || v29 > v59))
      {
        id v32 = v26;

        char v57 = v32;
        double v59 = v30;
        double v60 = v28;
      }
      if (!v7)
      {
        [v26 scale];
        double v28 = v28 * v33;
        [v26 scale];
        double v30 = v30 * v34;
      }
      BOOL v35 = v23 >= v28;
      if (v22 >= v30) {
        BOOL v35 = 1;
      }
      int v36 = !v35;
      BOOL v37 = v28 >= v20;
      if (v30 < v21) {
        BOOL v37 = 0;
      }
      int v38 = v37 && v35;
      if (v22 < v21) {
        int v38 = v36;
      }
      if (v23 >= v20) {
        int v39 = v38;
      }
      else {
        int v39 = v36;
      }
      if (v28 < v20 * 0.95 || v30 < v21 * 0.95) {
        int v41 = [v26 scaleWhenDrawing] ^ 1;
      }
      else {
        LOBYTE(v41) = 0;
      }
      if ((int)[v26 appearanceType] == a5)
      {
        if (v19) {
          int v42 = v39;
        }
        else {
          int v42 = 1;
        }
        if (v42 != 1) {
          goto LABEL_50;
        }
      }
      else
      {
        int v43 = [(ICAttachment *)v55 previewsSupportMultipleAppearances] && v56;
        if (v19) {
          char v44 = v39;
        }
        else {
          char v44 = 1;
        }
        if (v43 == 1 || (v44 & 1) == 0) {
          goto LABEL_50;
        }
      }
      if (!v7 || ([v26 scale], v45 == 0.0))
      {
        if (v41) {
          goto LABEL_50;
        }
LABEL_49:
        id v46 = v26;

        double v23 = v28;
        double v22 = v30;
        uint64_t v19 = v46;
        goto LABEL_50;
      }
      [v26 scale];
      if (v47 == v54) {
        char v48 = v41;
      }
      else {
        char v48 = 1;
      }
      if ((v48 & 1) == 0) {
        goto LABEL_49;
      }
LABEL_50:
      ++v25;
    }
    while (v18 != v25);
    uint64_t v49 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    uint64_t v18 = v49;
  }
  while (v49);
LABEL_61:

  id v50 = v57;
LABEL_62:
  if (v13 == 8) {
    uint64_t v51 = v50;
  }
  else {
    uint64_t v51 = v19;
  }
  id v52 = v51;

  return v52;
}

- (id)drawingModel
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachment *)self attachmentModel];
  id v4 = ICDynamicCast();

  return v4;
}

- (id)paperBundleModel
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachment *)self attachmentModel];
  id v4 = ICDynamicCast();

  return v4;
}

- (id)systemPaperModel
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachment *)self attachmentModel];
  id v4 = ICDynamicCast();

  return v4;
}

- (id)galleryModel
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachment *)self attachmentModel];
  id v4 = ICDynamicCast();

  return v4;
}

- (id)inlineDrawingModel
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachment *)self attachmentModel];
  id v4 = ICDynamicCast();

  return v4;
}

- (id)tableModel
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachment *)self attachmentModel];
  id v4 = ICDynamicCast();

  return v4;
}

- (id)audioModel
{
  objc_opt_class();
  uint64_t v3 = [(ICAttachment *)self attachmentModel];
  id v4 = ICDynamicCast();

  return v4;
}

- (NSString)description
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__55;
  double v11 = __Block_byref_object_dispose__55;
  id v12 = 0;
  uint64_t v3 = [(ICAttachment *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __37__ICAttachment_Previews__description__block_invoke;
  void v6[3] = &unk_1E64A4528;
  void v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __37__ICAttachment_Previews__description__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)ICAttachment;
  uint64_t v2 = objc_msgSendSuper2(&v5, sel_description);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  ICAttachment.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);
}

+ (void)attachmentIdentifiersForAccount:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error fetching attachment identifiers for %@: %@", v4, v5, v6, v7, v8);
}

- (void)setNote:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = [v1 identifier];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint8_t v8 = v4;
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Setting note (%@) on attachment (%@)", (uint8_t *)&v5, 0x16u);
}

- (void)setTypeUTI:(void *)a1 resetToIntrinsicNotesVersion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "attachmentModel was already created when typeUTI was set for: %@", v4, v5, v6, v7, v8);
}

void __31__ICAttachment_attachmentModel__block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Faulted drawing attachment with existing attachment model: %@", v4, v5, v6, v7, v8);
}

void __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Error moving fallback %@ %@");
}

void __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Error creating fallback %@ directory %@");
}

- (void)metadata
{
  OUTLINED_FUNCTION_12();
  os_log_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error decoding attachment metadata {attachment: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)setMetadata:.cold.1()
{
  OUTLINED_FUNCTION_12();
  os_log_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error decoding attachment metadata — not setting {attachment: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)metadataData
{
  OUTLINED_FUNCTION_12();
  os_log_t v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error encoding attachment metadata {attachment: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error saving attachment after purging preview images %@", v1, 0xCu);
}

@end