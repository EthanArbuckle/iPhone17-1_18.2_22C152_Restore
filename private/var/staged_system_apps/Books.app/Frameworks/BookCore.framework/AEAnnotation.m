@interface AEAnnotation
+ (BOOL)isBKBookmarkCreatorIdentifier:(id)a3;
+ (BOOL)isSelectedTextRepeatedInRepresentativeTextForAnnotation:(id)a3;
+ (BOOL)isValidForDeserialization:(id)a3;
+ (BOOL)mergeAnnotation:(id)a3 withServerAnnotation:(id)a4 moc:(id)a5;
+ (BOOL)mergeServerAnnotations:(id)a3 forAssetID:(id)a4 intoMoc:(id)a5;
+ (id)_dictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 map:(id)a4 inManagedObjectContext:(id)a5;
+ (id)aeAnnotationDictionaryRepresentationsForAnnotations:(id)a3;
+ (id)annotatedAttributedStringForAnnotation:(id)a3;
+ (id)annotatedAttributedStringForAnnotation:(id)a3 withPossibleLength:(unint64_t)a4;
+ (id)annotatedAttributedStringWithString:(id)a3 annotationStyle:(int)a4 range:(_NSRange)a5;
+ (id)annotationAssetIDFromDictionaryRepresentation:(id)a3;
+ (id)annotationCreatorIdentifierFromDictionaryRepresentation:(id)a3;
+ (id)annotationIncludingDeletedWithUUID:(id)a3 assetID:(id)a4 inManagedObjectContext:(id)a5;
+ (id)annotationUuidFromDictionaryRepresentation:(id)a3;
+ (id)annotationsForAssetID:(id)a3 includingDeleted:(BOOL)a4 inManagedObjectContext:(id)a5;
+ (id)annotationsForPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (id)annotationsIncludingDeletedWithUUIDInList:(id)a3 assetID:(id)a4 inManagedObjectContext:(id)a5;
+ (id)annotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4 inManagedObjectContext:(id)a5;
+ (id)bookmarkColorFromAnnotationStyle:(int)a3;
+ (id)bookmarkTypeFromAnnotationType:(int)a3;
+ (id)clauseForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6;
+ (id)compatibleDictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (id)contextAwareSelectedTextFromAnnotation:(id)a3;
+ (id)dateKeysForDictionaryRepresentation;
+ (id)deletedFlagFromDictionaryRepresentation:(id)a3;
+ (id)dictionaryRepresentationsForAnnotations:(id)a3;
+ (id)dictionaryResultsForAnnotationsWithPredicate:(id)a3 properties:(id)a4 propertyNamesMap:(id)a5 inManagedObjectContext:(id)a6;
+ (id)dictionaryResultsForAssetsWithPredicate:(id)a3 properties:(id)a4 inManagedObjectContext:(id)a5;
+ (id)fetchRequest;
+ (id)globalAnnotationForAssetID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)globalAnnotationTypeValues;
+ (id)insertAnnotationWithAssetID:(id)a3 creatorIdentifier:(id)a4 annotationUuid:(id)a5 intoManagedObjectContext:(id)a6;
+ (id)lastModificationFromDictionaryRepresentation:(id)a3;
+ (id)lettersForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6;
+ (id)maxAnnotationVersionForAssetsWithPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (id)maxExpressionDescriptionForProperty:(id)a3 expressionName:(id)a4;
+ (id)maxModificationDateColumnName;
+ (id)maxModificationDateExpressionDescription;
+ (id)maxModificationDateForAllAnnotationsInManagedObjectContext:(id)a3;
+ (id)maxModificationDateForAssetsWithPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (id)maxUserModificationDateExpressionDescription;
+ (id)modernDictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4;
+ (id)optimizedRepresentativeTextForSerialization:(id)a3 selectedText:(id)a4;
+ (id)optimizedSelectedTextForSerialization:(id)a3;
+ (id)optionalKeysForDictionaryRepresentation;
+ (id)predicateForAllAnnotationsIncludingDeleted:(BOOL)a3;
+ (id)predicateForAnnotationIncludingDeletedWithUUID:(id)a3 assetID:(id)a4;
+ (id)predicateForAnnotationWithUUID:(id)a3;
+ (id)predicateForAnnotationsIncludingDeletedWithUUIDInList:(id)a3;
+ (id)predicateForAnnotationsIncludingDeletedWithUUIDInList:(id)a3 assetID:(id)a4;
+ (id)predicateForAnnotationsIncludingDeletedWithUUIDNotInList:(id)a3;
+ (id)predicateForAnnotationsIncludingDeletedWithUserModificationDate;
+ (id)predicateForAnnotationsWithAssetID:(id)a3 includingDeleted:(BOOL)a4;
+ (id)predicateForAnnotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4;
+ (id)predicateForAnnotationsWithLocation:(id)a3 includingDeleted:(BOOL)a4;
+ (id)predicateForGlobalAnnotationWithAssetID:(id)a3;
+ (id)predicateForGlobalAnnotations;
+ (id)predicateForGlobalAnnotationsIncludingDeletedMissingReadingProgressHighWaterMark;
+ (id)predicateForGlobalAnnotationsWithAssetIDs:(id)a3;
+ (id)predicateForNonGlobalAnnotationsIncludingDeleted;
+ (id)predicateForPageBookmarksWithAssetID:(id)a3;
+ (id)predicateForRangeAnnotationsWithAssetID:(id)a3;
+ (id)predicateForUserAnnotationsWithAssetID:(id)a3 includingDeleted:(BOOL)a4;
+ (id)predicateForUserAnnotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4;
+ (id)requiredKeysForDictionaryRepresentation;
+ (id)userAnnotationTypeValues;
+ (id)wordsForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6;
+ (int)annotationStyleFromBookmarkColor:(id)a3;
+ (int)annotationTypeFromBookmarkType:(id)a3;
+ (int)annotationTypeFromDictionaryRepresentation:(id)a3;
- (AEAnnotationManagedObjectContext)managedObjectContext;
- (BOOL)annotationDeleted;
- (BOOL)annotationHasNote;
- (BOOL)annotationIsBookmark;
- (BOOL)annotationIsUnderline;
- (BOOL)avoidSync;
- (BOOL)bumpAnnotationVersionToMinimumVersion:(id)a3;
- (BOOL)hasReadingProgress;
- (BOOL)hasReadingProgressHighWaterMark;
- (BOOL)isAnnotationDeleted;
- (BOOL)isValidForSerialization;
- (BOOL)spineIndexUpdated;
- (BOOL)updateReadingProgressAndBumpHighWaterMarkToProgress:(float)a3;
- (BOOL)usesLegacySerializationMethod;
- (BOOL)validateConsistency:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSDate)locationModificationDate;
- (NSDate)userModificationDate;
- (NSNumber)annotationStyleNumber;
- (NSNumber)annotationTypeNumber;
- (NSString)annotationVersion;
- (NSString)assetVersion;
- (NSString)attachments;
- (NSString)chapterTitle;
- (NSString)description;
- (NSString)physicalPageNumber;
- (NSString)redactedAnnotationLocation;
- (_NSRange)annotationSelectedTextRange;
- (float)readingProgress;
- (float)readingProgressHighWaterMark;
- (id)aeAnnotationDictionaryRepresentation;
- (id)annotatedAttributedString;
- (id)bkBookmarkDeserializeLocationDataFromDictionary:(id)a3 trustedSource:(BOOL)a4;
- (id)doesSerializeAs_iBooks;
- (id)iBooks_dictionaryRepresentation;
- (id)validateAnnotationUuid;
- (int)annotationStyle;
- (int)annotationType;
- (void)aeAnnotationDeserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4;
- (void)awakeFromInsert;
- (void)clearAvoidSync;
- (void)deserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4;
- (void)iBooks_deserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4;
- (void)setAnnotationCreationDate:(id)a3;
- (void)setAnnotationDeleted:(BOOL)a3;
- (void)setAnnotationIsUnderline:(BOOL)a3;
- (void)setAnnotationLocation:(id)a3;
- (void)setAnnotationNote:(id)a3;
- (void)setAnnotationRepresentativeText:(id)a3;
- (void)setAnnotationSelectedText:(id)a3;
- (void)setAnnotationSelectedTextRange:(_NSRange)a3;
- (void)setAnnotationStyle:(int)a3;
- (void)setAnnotationType:(int)a3;
- (void)setAnnotationVersion:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setAvoidSync;
- (void)setChapterTitle:(id)a3;
- (void)setFutureProofing10:(id)a3;
- (void)setFutureProofing11:(id)a3;
- (void)setFutureProofing12:(id)a3;
- (void)setFutureProofing1:(id)a3;
- (void)setFutureProofing2:(id)a3;
- (void)setFutureProofing3:(id)a3;
- (void)setFutureProofing4:(id)a3;
- (void)setFutureProofing5:(id)a3;
- (void)setFutureProofing6:(id)a3;
- (void)setFutureProofing7:(id)a3;
- (void)setFutureProofing8:(id)a3;
- (void)setFutureProofing9:(id)a3;
- (void)setLocationModificationDate:(id)a3;
- (void)setPhysicalPageNumber:(id)a3;
- (void)setPlAbsolutePhysicalLocation:(id)a3;
- (void)setPlLocationRangeEnd:(id)a3;
- (void)setPlLocationRangeStart:(id)a3;
- (void)setPlStorageUUID:(id)a3;
- (void)setPlUserData:(id)a3;
- (void)setReadingProgress:(float)a3;
- (void)setReadingProgressHighWaterMark:(float)a3;
- (void)setSpineIndexUpdated:(BOOL)a3;
- (void)setUserModificationDate:(id)a3;
- (void)updateSystemAndLocationModificationDates;
- (void)updateSystemAndUserModificationDates;
- (void)updateSystemModificationDate;
- (void)updateUserModificationDate;
@end

@implementation AEAnnotation

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 awakeFromInsert];
  id v3 = [objc_alloc((Class)NSNumber) initWithInt:2];
  [(AEAnnotation *)self setPrimitiveValue:v3 forKey:@"annotationType"];
  v4 = +[NSDate date];
  [(AEAnnotation *)self setPrimitiveValue:v4 forKey:@"annotationCreationDate"];
  [(AEAnnotation *)self setPrimitiveValue:v4 forKey:@"annotationModificationDate"];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"AEAnnotation"];
}

+ (id)predicateForAnnotationWithUUID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationDeleted == 0 AND annotationUuid == %@ AND annotationType != %d", a3, 3];
}

+ (id)predicateForAnnotationIncludingDeletedWithUUID:(id)a3 assetID:(id)a4
{
  if (a4) {
    +[NSPredicate predicateWithFormat:@"annotationAssetID == %@ AND annotationUuid == %@", a4, a3];
  }
  else {
  v4 = +[NSPredicate predicateWithFormat:@"annotationUuid == %@ AND annotationType != %d ", a3, 3];
  }

  return v4;
}

+ (id)predicateForAnnotationsIncludingDeletedWithUUIDInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationUuid IN %@", a3];
}

+ (id)predicateForAnnotationsIncludingDeletedWithUUIDInList:(id)a3 assetID:(id)a4
{
  if (a4) {
    +[NSPredicate predicateWithFormat:@"annotationUuid IN %@ AND annotationAssetID == %@", a3, a4];
  }
  else {
  v4 = +[NSPredicate predicateWithFormat:@"annotationUuid IN %@ AND annotationType != %d", a3, 3];
  }

  return v4;
}

+ (id)predicateForAnnotationsIncludingDeletedWithUUIDNotInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"NOT (annotationUuid IN %@)", a3];
}

+ (id)predicateForAllAnnotationsIncludingDeleted:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:@"(1 == %d OR annotationDeleted == 0)", a3];
}

+ (id)predicateForAnnotationsWithAssetID:(id)a3 includingDeleted:(BOOL)a4
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID == %@ AND (1 == %d OR annotationDeleted == 0)", a3, a4];
}

+ (id)predicateForAnnotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID IN %@ AND (1 == %d OR annotationDeleted == 0)", a3, a4];
}

+ (id)predicateForGlobalAnnotations
{
  return +[NSPredicate predicateWithFormat:@"annotationType == %d AND annotationDeleted == 0", 3];
}

+ (id)predicateForGlobalAnnotationWithAssetID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID == %@ AND annotationType == %d AND annotationDeleted == 0", a3, 3];
}

+ (id)predicateForGlobalAnnotationsWithAssetIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID IN %@ AND annotationType == %d AND annotationDeleted == 0", a3, 3];
}

+ (id)predicateForUserAnnotationsWithAssetID:(id)a3 includingDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [a1 userAnnotationTypeValues];
  v8 = (void *)v7;
  if (v4) {
    CFStringRef v9 = @"annotationAssetID == %@ AND annotationType IN %@";
  }
  else {
    CFStringRef v9 = @"annotationAssetID == %@ AND annotationType IN %@ AND annotationDeleted == 0";
  }
  v10 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v9, v6, v7);

  return v10;
}

+ (id)predicateForUserAnnotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [a1 userAnnotationTypeValues];
  v8 = +[NSPredicate predicateWithFormat:@"annotationAssetID IN (%@) AND annotationType IN (%@) and (1 == %d OR annotationDeleted == 0)", v6, v7, v4];

  return v8;
}

+ (id)predicateForPageBookmarksWithAssetID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0", a3, 1];
}

+ (id)predicateForRangeAnnotationsWithAssetID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"annotationAssetID ==[n] %@ AND annotationType == %d AND annotationDeleted == 0 AND plLocationRangeStart >= 0", a3, 2];
}

+ (id)predicateForAnnotationsWithLocation:(id)a3 includingDeleted:(BOOL)a4
{
  return +[NSPredicate predicateWithFormat:@"annotationLocation = %@ AND (1 == %d OR annotationDeleted == 0)", a3, a4];
}

+ (id)predicateForAnnotationsIncludingDeletedWithUserModificationDate
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL", @"futureProofing6"];
}

+ (id)predicateForGlobalAnnotationsIncludingDeletedMissingReadingProgressHighWaterMark
{
  return +[NSPredicate predicateWithFormat:@"%K == NULL AND %K == %d", @"futureProofing8", @"annotationType", 3];
}

+ (id)predicateForNonGlobalAnnotationsIncludingDeleted
{
  return +[NSPredicate predicateWithFormat:@"%K != %d", @"annotationType", 3];
}

+ (id)annotationsForPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  return [a4 entity:@"AEAnnotation" withPredicate:a3 sortBy:@"annotationCreationDate" ascending:1 fetchLimit:0];
}

+ (id)dictionaryResultsForAssetsWithPredicate:(id)a3 properties:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v11 = objc_alloc_init((Class)NSFetchRequest);
    v12 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v9];
    [v11 setEntity:v12];
    [v11 setResultType:2];
    [v11 setPropertiesToFetch:v8];
    [v11 setReturnsDistinctResults:1];
    [v11 setPredicate:v7];
    uint64_t v15 = 0;
    v13 = [v9 executeFetchRequest:v11 error:&v15];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)annotationIncludingDeletedWithUUID:(id)a3 assetID:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a5;
  id v9 = [a1 predicateForAnnotationIncludingDeletedWithUUID:a3 assetID:a4];
  v10 = [a1 annotationsForPredicate:v9 inManagedObjectContext:v8];

  id v11 = [v10 lastObject];

  return v11;
}

+ (id)annotationsForAssetID:(id)a3 includingDeleted:(BOOL)a4 inManagedObjectContext:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a1 predicateForAnnotationsWithAssetID:a3 includingDeleted:v5];
  v10 = [a1 annotationsForPredicate:v9 inManagedObjectContext:v8];

  return v10;
}

+ (id)annotationsWithAssetIDInList:(id)a3 includingDeleted:(BOOL)a4 inManagedObjectContext:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a1 predicateForAnnotationsWithAssetIDInList:a3 includingDeleted:v5];
  v10 = [a1 annotationsForPredicate:v9 inManagedObjectContext:v8];

  return v10;
}

+ (id)annotationsIncludingDeletedWithUUIDInList:(id)a3 assetID:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a5;
  id v9 = [a1 predicateForAnnotationsIncludingDeletedWithUUIDInList:a3 assetID:a4];
  v10 = [a1 annotationsForPredicate:v9 inManagedObjectContext:v8];

  return v10;
}

+ (id)globalAnnotationForAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = [a1 predicateForGlobalAnnotationWithAssetID:a3];
  id v8 = [a1 annotationsForPredicate:v7 inManagedObjectContext:v6];

  id v9 = [v8 lastObject];

  return v9;
}

+ (id)maxModificationDateColumnName
{
  return @"maxModificationDate";
}

+ (id)maxExpressionDescriptionForProperty:(id)a3 expressionName:(id)a4
{
  id v5 = a4;
  id v6 = +[NSExpression expressionForKeyPath:a3];
  id v7 = +[NSArray arrayWithObject:v6];
  id v8 = +[NSExpression expressionForFunction:@"max:" arguments:v7];

  id v9 = objc_alloc_init((Class)NSExpressionDescription);
  [v9 setName:v5];

  [v9 setExpression:v8];

  return v9;
}

+ (id)maxModificationDateExpressionDescription
{
  id v3 = [a1 maxModificationDateColumnName];
  BOOL v4 = [a1 maxExpressionDescriptionForProperty:@"annotationModificationDate" expressionName:v3];

  [v4 setExpressionResultType:900];

  return v4;
}

+ (id)maxUserModificationDateExpressionDescription
{
  id v3 = [a1 maxModificationDateColumnName];
  BOOL v4 = [a1 maxExpressionDescriptionForProperty:@"futureProofing6" expressionName:v3];

  [v4 setExpressionResultType:900];

  return v4;
}

+ (id)maxModificationDateForAssetsWithPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = +[AEAnnotation maxModificationDateColumnName];
    uint64_t v8 = +[AEAnnotation maxModificationDateExpressionDescription];
    id v9 = objc_alloc_init((Class)NSFetchRequest);
    v24 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v6];
    [v9 setEntity:];
    [v9 setResultType:2];
    v10 = +[NSArray arrayWithObjects:@"annotationAssetID", @"annotationModificationDate", 0];
    [v9 setPropertiesToGroupBy:v10];

    v25 = (void *)v8;
    id v11 = +[NSArray arrayWithObjects:v8, @"annotationAssetID", 0];
    [v9 setPropertiesToFetch:v11];

    [v9 setReturnsDistinctResults:1];
    id v28 = v5;
    [v9 setPredicate:v5];
    id v33 = 0;
    id v27 = v6;
    v12 = [v6 executeFetchRequest:v9 error:&v33];
    id v23 = v33;
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v20 = [v19 valueForKey:v7];
          v21 = [v19 valueForKey:@"annotationAssetID"];
          [v13 setValue:v20 forKey:v21];
        }
        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v16);
    }

    id v6 = v27;
    id v5 = v28;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)maxAnnotationVersionForAssetsWithPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    long long v29 = [a1 maxExpressionDescriptionForProperty:@"futureProofing2" expressionName:@"futureProofing2"];
    [v29 setExpressionResultType:700];
    id v10 = objc_alloc_init((Class)NSFetchRequest);
    id v28 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v7];
    [v10 setEntity:];
    [v10 setResultType:2];
    [v10 setReturnsDistinctResults:1];
    [v10 setPredicate:v6];
    id v11 = +[NSArray arrayWithObjects:@"annotationAssetID", @"futureProofing2", 0];
    [v10 setPropertiesToGroupBy:v11];

    v12 = +[NSArray arrayWithObjects:@"annotationAssetID", @"futureProofing2", 0];
    [v10 setPropertiesToFetch:v12];

    id v34 = 0;
    id v13 = [v7 executeFetchRequest:v10 error:&v34];
    id v14 = (char *)v34;
    if (v13)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = v13;
      id v16 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
      if (v16)
      {
        id v17 = v16;
        v24 = v14;
        v25 = v13;
        v26 = v8;
        id v27 = v6;
        uint64_t v18 = *(void *)v31;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v21 = [v20 valueForKey:@"annotationAssetID"];
            if (v21) {
              [v9 setObject:v20 forKey:v21];
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
        }
        while (v17);
        uint64_t v8 = v26;
        id v6 = v27;
        id v14 = v24;
        id v13 = v25;
      }
    }
    else
    {
      v22 = BCIMLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "+[AEAnnotation maxAnnotationVersionForAssetsWithPredicate:inManagedObjectContext:]";
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotation.m";
        __int16 v39 = 1024;
        int v40 = 404;
        _os_log_impl(&def_7D91C, v22, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      id v15 = BCIMLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v14;
        _os_log_impl(&def_7D91C, v15, OS_LOG_TYPE_INFO, "@\"Failed to fetch annotations {%@}\"", buf, 0xCu);
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)maxModificationDateForAllAnnotationsInManagedObjectContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[AEAnnotation maxModificationDateExpressionDescription];
  id v5 = +[NSPredicate predicateWithValue:1];
  id v6 = +[NSArray arrayWithObject:v4];
  id v7 = +[AEAnnotation dictionaryResultsForAssetsWithPredicate:v5 properties:v6 inManagedObjectContext:v3];

  uint64_t v8 = [v7 lastObject];

  id v9 = +[AEAnnotation maxModificationDateColumnName];
  id v10 = [v8 objectForKey:v9];

  return v10;
}

+ (id)insertAnnotationWithAssetID:(id)a3 creatorIdentifier:(id)a4 annotationUuid:(id)a5 intoManagedObjectContext:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v10 newByClass:objc_opt_class()];

  [v13 setAnnotationCreatorIdentifier:v11];
  [v13 setAnnotationAssetID:v12];

  if (v9)
  {
    [v13 setAnnotationUuid:v9];
  }
  else
  {
    id v14 = +[NSString UUID];
    [v13 setAnnotationUuid:v14];
  }

  return v13;
}

- (AEAnnotationManagedObjectContext)managedObjectContext
{
  v4.receiver = self;
  v4.super_class = (Class)AEAnnotation;
  v2 = [(AEAnnotation *)&v4 managedObjectContext];

  return (AEAnnotationManagedObjectContext *)v2;
}

+ (id)optimizedSelectedTextForSerialization:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 0x1389)
  {
    uint64_t v4 = [v3 substringWithRange:0, 5000];

    id v3 = (id)v4;
  }

  return v3;
}

+ (id)optimizedRepresentativeTextForSerialization:(id)a3 selectedText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 length] > 0x1388 || objc_msgSend(v5, "isEqualToString:", v6))
  {

    id v5 = 0;
  }

  return v5;
}

- (void)updateSystemModificationDate
{
  id v3 = +[NSDate date];
  [(AEAnnotation *)self setAnnotationModificationDate:v3];
}

- (void)updateUserModificationDate
{
  id v3 = +[NSDate date];
  [(AEAnnotation *)self setUserModificationDate:v3];
}

- (void)updateSystemAndUserModificationDates
{
  id v3 = +[NSDate date];
  [(AEAnnotation *)self setAnnotationModificationDate:v3];
  [(AEAnnotation *)self setUserModificationDate:v3];
}

- (void)updateSystemAndLocationModificationDates
{
  id v3 = +[NSDate date];
  [(AEAnnotation *)self setAnnotationModificationDate:v3];
  [(AEAnnotation *)self setLocationModificationDate:v3];
}

+ (id)globalAnnotationTypeValues
{
  v2 = +[NSNumber numberWithInt:3];
  id v3 = +[NSArray arrayWithObject:v2];

  return v3;
}

+ (id)userAnnotationTypeValues
{
  v2 = +[NSNumber numberWithInt:1];
  id v3 = +[NSNumber numberWithInt:2];
  uint64_t v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, 0);

  return v4;
}

- (void)setAnnotationStyle:(int)a3
{
  if (a3 == 6) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = a3;
  }
  +[NSNumber numberWithBool:a3 == 6];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = +[NSNumber numberWithInt:v4];
  id v6 = [(AEAnnotation *)self primitiveValueForKey:@"annotationIsUnderline"];
  id v7 = [(AEAnnotation *)self primitiveValueForKey:@"annotationStyle"];
  uint64_t v8 = v7;
  if (v6 != v16)
  {
    unsigned __int8 v9 = [v6 isEqual:];
    unsigned __int8 v10 = v9;
    if (v8 == v5)
    {
      if (v9) {
        goto LABEL_18;
      }
      [(AEAnnotation *)self willChangeValueForKey:@"annotationIsUnderline"];
    }
    else
    {
      unsigned __int8 v11 = [v8 isEqual:v5];
      unsigned __int8 v12 = v11;
      if (v10)
      {
        if (v11) {
          goto LABEL_18;
        }
        goto LABEL_11;
      }
      [(AEAnnotation *)self willChangeValueForKey:@"annotationIsUnderline"];
      if ((v12 & 1) == 0)
      {
        CFStringRef v13 = @"annotationStyle";
        [(AEAnnotation *)self willChangeValueForKey:@"annotationStyle"];
        [(AEAnnotation *)self setPrimitiveValue:v16 forKey:@"annotationIsUnderline"];
        [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"annotationStyle"];
        [(AEAnnotation *)self didChangeValueForKey:@"annotationIsUnderline"];
        goto LABEL_17;
      }
    }
    CFStringRef v13 = @"annotationIsUnderline";
    id v14 = self;
    id v15 = v16;
    goto LABEL_16;
  }
  if (v7 != v5 && ([v7 isEqual:v5] & 1) == 0)
  {
LABEL_11:
    CFStringRef v13 = @"annotationStyle";
    [(AEAnnotation *)self willChangeValueForKey:@"annotationStyle"];
    id v14 = self;
    id v15 = v5;
LABEL_16:
    [(AEAnnotation *)v14 setPrimitiveValue:v15 forKey:v13];
LABEL_17:
    [(AEAnnotation *)self didChangeValueForKey:v13];
    [(AEAnnotation *)self updateSystemAndUserModificationDates];
  }
LABEL_18:
}

- (int)annotationStyle
{
  if ([(AEAnnotation *)self annotationIsUnderline]) {
    return 6;
  }
  [(AEAnnotation *)self willAccessValueForKey:@"annotationStyle"];
  uint64_t v4 = [(AEAnnotation *)self primitiveValueForKey:@"annotationStyle"];
  int v5 = [v4 intValue];

  [(AEAnnotation *)self didAccessValueForKey:@"annotationStyle"];
  return v5;
}

- (void)setAnnotationType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(AEAnnotation *)self primitiveValueForKey:@"annotationType"];
  id v5 = +[NSNumber numberWithInt:v3];
  if (v6 != v5 && ([v6 isEqual:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"annotationType"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"annotationType"];
    [(AEAnnotation *)self didChangeValueForKey:@"annotationType"];
    [(AEAnnotation *)self updateSystemAndUserModificationDates];
  }
}

- (int)annotationType
{
  [(AEAnnotation *)self willAccessValueForKey:@"annotationType"];
  uint64_t v3 = [(AEAnnotation *)self primitiveValueForKey:@"annotationType"];
  int v4 = [v3 intValue];

  [(AEAnnotation *)self didAccessValueForKey:@"annotationType"];
  return v4;
}

- (void)setAnnotationCreationDate:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"annotationCreationDate"];
  [(AEAnnotation *)self setPrimitiveValue:v4 forKey:@"annotationCreationDate"];

  [(AEAnnotation *)self didChangeValueForKey:@"annotationCreationDate"];
}

- (BOOL)annotationDeleted
{
  [(AEAnnotation *)self willAccessValueForKey:@"annotationDeleted"];
  uint64_t v3 = [(AEAnnotation *)self primitiveValueForKey:@"annotationDeleted"];
  unsigned __int8 v4 = [v3 BOOLValue];

  [(AEAnnotation *)self didAccessValueForKey:@"annotationDeleted"];
  return v4;
}

- (void)setAnnotationDeleted:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(AEAnnotation *)self primitiveValueForKey:@"annotationDeleted"];
  id v5 = +[NSNumber numberWithBool:v3];
  if (v6 != v5 && ([v6 isEqual:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"annotationDeleted"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"annotationDeleted"];
    [(AEAnnotation *)self didChangeValueForKey:@"annotationDeleted"];
    [(AEAnnotation *)self updateSystemAndUserModificationDates];
  }
}

- (BOOL)isAnnotationDeleted
{
  return [(AEAnnotation *)self annotationDeleted];
}

- (BOOL)annotationIsUnderline
{
  [(AEAnnotation *)self willAccessValueForKey:@"annotationIsUnderline"];
  BOOL v3 = [(AEAnnotation *)self primitiveValueForKey:@"annotationIsUnderline"];
  unsigned __int8 v4 = [v3 BOOLValue];

  [(AEAnnotation *)self didAccessValueForKey:@"annotationIsUnderline"];
  return v4;
}

- (void)setAnnotationIsUnderline:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(AEAnnotation *)self primitiveValueForKey:@"annotationIsUnderline"];
  id v5 = +[NSNumber numberWithBool:v3];
  if (v6 != v5 && ([v6 isEqual:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"annotationIsUnderline"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"annotationIsUnderline"];
    [(AEAnnotation *)self didChangeValueForKey:@"annotationIsUnderline"];
    [(AEAnnotation *)self updateSystemAndUserModificationDates];
  }
}

- (void)setAnnotationLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"annotationLocation"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"annotationLocation"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"annotationLocation"];
    [(AEAnnotation *)self didChangeValueForKey:@"annotationLocation"];
    [(AEAnnotation *)self updateSystemAndLocationModificationDates];
  }
}

- (NSString)redactedAnnotationLocation
{
  v2 = [(AEAnnotation *)self annotationLocation];
  BOOL v3 = [v2 bc_redactedCFIString];

  return (NSString *)v3;
}

- (BOOL)annotationHasNote
{
  v2 = [(AEAnnotation *)self annotationNote];
  BOOL v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (BOOL)annotationIsBookmark
{
  if ([(AEAnnotation *)self annotationType] == 1) {
    return ![(AEAnnotation *)self annotationHasNote];
  }
  else {
    return 0;
  }
}

- (void)setAnnotationNote:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"annotationNote"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(AEAnnotation *)self updateSystemAndUserModificationDates];
    [(AEAnnotation *)self willChangeValueForKey:@"annotationNote"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"annotationNote"];
    [(AEAnnotation *)self didChangeValueForKey:@"annotationNote"];
  }
}

- (void)setAnnotationRepresentativeText:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"annotationRepresentativeText"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"annotationRepresentativeText"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"annotationRepresentativeText"];
    [(AEAnnotation *)self didChangeValueForKey:@"annotationRepresentativeText"];
    [(AEAnnotation *)self updateSystemModificationDate];
  }
}

- (void)setAnnotationSelectedText:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"annotationSelectedText"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"annotationSelectedText"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"annotationSelectedText"];
    [(AEAnnotation *)self didChangeValueForKey:@"annotationSelectedText"];
    [(AEAnnotation *)self updateSystemModificationDate];
  }
}

- (void)setPlLocationRangeStart:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"plLocationRangeStart"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqual:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"plLocationRangeStart"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"plLocationRangeStart"];
    [(AEAnnotation *)self didChangeValueForKey:@"plLocationRangeStart"];
    [(AEAnnotation *)self updateSystemAndLocationModificationDates];
  }
}

- (void)setPlLocationRangeEnd:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"plLocationRangeEnd"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqual:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"plLocationRangeEnd"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"plLocationRangeEnd"];
    [(AEAnnotation *)self didChangeValueForKey:@"plLocationRangeEnd"];
    [(AEAnnotation *)self updateSystemAndLocationModificationDates];
  }
}

- (void)setPlAbsolutePhysicalLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"plAbsolutePhysicalLocation"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqual:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"plAbsolutePhysicalLocation"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"plAbsolutePhysicalLocation"];
    [(AEAnnotation *)self didChangeValueForKey:@"plAbsolutePhysicalLocation"];
    [(AEAnnotation *)self updateSystemAndLocationModificationDates];
  }
}

- (void)setPlStorageUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"plStorageUUID"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"plStorageUUID"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"plStorageUUID"];
    [(AEAnnotation *)self didChangeValueForKey:@"plStorageUUID"];
    [(AEAnnotation *)self updateSystemAndLocationModificationDates];
  }
}

- (void)setPlUserData:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"plUserData"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqual:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"plUserData"];
    v7.receiver = self;
    v7.super_class = (Class)AEAnnotation;
    [(AEAnnotation *)&v7 setPrimitiveValue:v4 forKey:@"plUserData"];
    [(AEAnnotation *)self didChangeValueForKey:@"plUserData"];
    [(AEAnnotation *)self updateSystemAndLocationModificationDates];
  }
}

- (void)setPhysicalPageNumber:(id)a3
{
  id v5 = a3;
  id v4 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing1"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing1"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing1"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing1"];
    [(AEAnnotation *)self updateSystemAndLocationModificationDates];
  }
}

- (NSString)physicalPageNumber
{
  return (NSString *)[(AEAnnotation *)self primitiveValueForKey:@"futureProofing1"];
}

- (void)setAnnotationVersion:(id)a3
{
  id v5 = a3;
  id v4 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing2"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing2"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing2"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing2"];
    [(AEAnnotation *)self updateSystemModificationDate];
  }
}

- (NSString)annotationVersion
{
  return (NSString *)[(AEAnnotation *)self primitiveValueForKey:@"futureProofing2"];
}

- (void)setAssetVersion:(id)a3
{
  id v5 = a3;
  id v4 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing3"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing3"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing3"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing3"];
    [(AEAnnotation *)self updateSystemModificationDate];
  }
}

- (NSString)assetVersion
{
  return (NSString *)[(AEAnnotation *)self primitiveValueForKey:@"futureProofing3"];
}

- (void)setAttachments:(id)a3
{
  id v5 = a3;
  id v4 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing4"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing4"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing4"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing4"];
    [(AEAnnotation *)self updateSystemModificationDate];
  }
}

- (NSString)attachments
{
  return (NSString *)[(AEAnnotation *)self primitiveValueForKey:@"futureProofing4"];
}

- (void)setChapterTitle:(id)a3
{
  id v5 = a3;
  id v4 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing5"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing5"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing5"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing5"];
    [(AEAnnotation *)self updateSystemModificationDate];
  }
}

- (NSString)chapterTitle
{
  return (NSString *)[(AEAnnotation *)self primitiveValueForKey:@"futureProofing5"];
}

- (void)setUserModificationDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    id v5 = +[NSString stringWithFormat:@"%f", v4];
  }
  else
  {
    id v5 = 0;
  }
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing6"];
  [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing6"];
  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing6"];
}

- (NSDate)userModificationDate
{
  v2 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing6"];
  if ([v2 length])
  {
    [v2 doubleValue];
    BOOL v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

- (_NSRange)annotationSelectedTextRange
{
  v2 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing7"];
  BOOL v3 = v2;
  if (v2)
  {
    NSRange v4 = NSRangeFromString(v2);
    NSUInteger location = v4.location;
    NSUInteger length = v4.length;
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v7 = location;
  NSUInteger v8 = length;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)setAnnotationSelectedTextRange:(_NSRange)a3
{
  NSStringFromRange(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing7"];
  if (v4 != v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing7"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing7"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing7"];
    [(AEAnnotation *)self updateSystemModificationDate];
  }
}

- (float)readingProgressHighWaterMark
{
  v2 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing8"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  float v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v4 bc_clampedToUnitIntervalOrNegativeOne];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v8 stringValue];
  id v6 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing8"];
  NSUInteger v7 = v6;
  if (v6 != v5 && ([v6 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing8"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing8"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing8"];
  }
}

- (float)readingProgress
{
  v2 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing10"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setReadingProgress:(float)a3
{
  float v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v4 bc_assertClampedToUnitInterval];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v8 stringValue];
  id v6 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing10"];
  NSUInteger v7 = v6;
  if (v6 != v5 && ([v6 isEqualToString:v5] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing10"];
    [(AEAnnotation *)self setPrimitiveValue:v5 forKey:@"futureProofing10"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing10"];
  }
}

- (BOOL)spineIndexUpdated
{
  v2 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing9"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSpineIndexUpdated:(BOOL)a3
{
  id v7 = +[NSNumber numberWithBool:a3];
  float v4 = [v7 stringValue];
  id v5 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing9"];
  id v6 = v5;
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing9"];
    [(AEAnnotation *)self setPrimitiveValue:v4 forKey:@"futureProofing9"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing9"];
  }
}

- (void)setLocationModificationDate:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceReferenceDate];
    id v6 = +[NSString stringWithFormat:@"%f", v5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing11"];
  id v8 = v7;
  if (v7 != v6 && ([v7 isEqual:v6] & 1) == 0)
  {
    [(AEAnnotation *)self willChangeValueForKey:@"futureProofing6"];
    [(AEAnnotation *)self setPrimitiveValue:v6 forKey:@"futureProofing11"];
    [(AEAnnotation *)self didChangeValueForKey:@"futureProofing6"];
  }
}

- (NSDate)locationModificationDate
{
  v2 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing11"];
  if ([v2 length])
  {
    [v2 doubleValue];
    unsigned __int8 v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setAvoidSync
{
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing12"];
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v3 setPrimitiveValue:@"avoidSync" forKey:@"futureProofing12"];
  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing12"];
}

- (void)clearAvoidSync
{
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing12"];
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v3 setPrimitiveValue:0 forKey:@"futureProofing12"];
  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing12"];
}

- (BOOL)avoidSync
{
  v2 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing12"];
  unsigned __int8 v3 = [v2 isEqualToString:@"avoidSync"];

  return v3;
}

- (void)setFutureProofing1:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing1"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing1"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing1"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing2:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing2"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing2"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing2"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing3:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing3"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing3"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing3"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing4:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing4"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing4"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing4"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing5:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing5"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing5"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing5"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing6:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing6"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing6"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing6"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing7:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing7"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing7"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing7"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing8:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing8"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing8"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing8"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing9:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing9"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing9"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing9"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing10:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing10"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing10"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing10"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing11:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing11"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing11"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing11"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (void)setFutureProofing12:(id)a3
{
  id v4 = a3;
  [(AEAnnotation *)self willChangeValueForKey:@"futureProofing12"];
  v5.receiver = self;
  v5.super_class = (Class)AEAnnotation;
  [(AEAnnotation *)&v5 setPrimitiveValue:v4 forKey:@"futureProofing12"];

  [(AEAnnotation *)self didChangeValueForKey:@"futureProofing12"];
  [(AEAnnotation *)self updateSystemModificationDate];
}

- (BOOL)bumpAnnotationVersionToMinimumVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAnnotation *)self annotationVersion];
  id v6 = v5;
  if (v5 && (v5 == v4 || [v5 compare:v4 options:64] != (id)-1))
  {
    BOOL v7 = 0;
  }
  else
  {
    [(AEAnnotation *)self setAnnotationVersion:v4];
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)updateReadingProgressAndBumpHighWaterMarkToProgress:(float)a3
{
  BCFloatAssertUnitIntervalClamp(a3);
  float v5 = v4;
  -[AEAnnotation setReadingProgress:](self, "setReadingProgress:");
  if ([(AEAnnotation *)self hasReadingProgressHighWaterMark])
  {
    [(AEAnnotation *)self readingProgressHighWaterMark];
    if (v5 <= *(float *)&v6) {
      return 0;
    }
  }
  *(float *)&double v6 = v5;
  [(AEAnnotation *)self setReadingProgressHighWaterMark:v6];
  return 1;
}

- (BOOL)hasReadingProgressHighWaterMark
{
  v2 = [(AEAnnotation *)self valueForKey:@"futureProofing8"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasReadingProgress
{
  v2 = [(AEAnnotation *)self valueForKey:@"futureProofing10"];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)annotatedAttributedStringWithString:(id)a3 annotationStyle:(int)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8];

  id v10 = [objc_alloc((Class)NSNumber) initWithInt:v7];
  [v9 addAttribute:@"kAEAnnotationStyleAttributeName" value:v10 range:location, length];

  return v9;
}

- (id)annotatedAttributedString
{
  return +[AEAnnotation annotatedAttributedStringForAnnotation:self withPossibleLength:-1];
}

+ (id)annotatedAttributedStringForAnnotation:(id)a3 withPossibleLength:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 annotationRepresentativeText];
  id v8 = [v7 flattenedAnnotationString];

  id v9 = [v6 annotationSelectedText];
  id v10 = [v9 flattenedAnnotationString];

  if ((unint64_t)[v10 length] >= a4
    || +[AEAnnotation isSelectedTextRepeatedInRepresentativeTextForAnnotation:v6])
  {
    id v11 = v10;
    long long v29 = 0;
    id v30 = [v11 length];
    goto LABEL_17;
  }
  id v12 = v8;
  CFStringRef v13 = (char *)[v12 rangeOfString:v10];
  long long v29 = v13;
  id v30 = v14;
  if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = v10;
LABEL_15:
    id v11 = v15;
    goto LABEL_16;
  }
  if (&v13[(void)v14] <= (char *)a4)
  {
    id v15 = v12;
    goto LABEL_15;
  }
  if (!v12)
  {
    id v16 = 0;
LABEL_26:
    id v11 = v10;

    id v28 = [v11 length];
    long long v29 = 0;
    id v30 = v28;
    goto LABEL_16;
  }
  id v16 = +[AEAnnotation clauseForSelectedTextForAnnotation:v6 inSentence:v12 possibleLength:a4 highlightedRange:&v29];
  if (!v16)
  {
    id v16 = [a1 wordsForSelectedTextForAnnotation:v6 inSentence:v12 possibleLength:a4 highlightedRange:&v29];
    if (!v16)
    {
      id v16 = [a1 lettersForSelectedTextForAnnotation:v6 inSentence:v12 possibleLength:a4 highlightedRange:&v29];
    }
  }
  if (!v16 || v29 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_26;
  }
  id v17 = IMCommonCoreBundle();
  uint64_t v18 = [v17 localizedStringForKey:@"\\U2026" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  v19 = (char *)[v18 length];
  long long v29 = &v19[(void)v29];
  id v11 = [v18 stringByAppendingString:v16];

LABEL_16:
LABEL_17:
  if (objc_msgSend(v11, "length", v29))
  {
    if (v11)
    {
LABEL_19:
      v20 = [v11 stringByReplacingOccurrencesOfString:@"\r" withString:@"\n" v29];

      v21 = objc_opt_class();
      id v22 = [v6 annotationStyle];
      id v23 = [v21 annotatedAttributedStringWithString:v20 annotationStyle:v22 range:v29 v30];
      goto LABEL_22;
    }
  }
  else
  {
    v24 = [v6 annotationRepresentativeText];

    id v25 = [v24 length];
    long long v29 = 0;
    id v30 = v25;
    id v11 = v24;
    if (v24) {
      goto LABEL_19;
    }
  }
  v20 = 0;
  id v23 = 0;
LABEL_22:
  id v26 = v23;

  return v26;
}

+ (id)annotatedAttributedStringForAnnotation:(id)a3
{
  id v3 = a3;
  float v4 = [v3 annotationSelectedText];
  float v5 = [v4 flattenedAnnotationString];

  id v6 = [v5 length];
  if ([v5 length])
  {
    if (v5)
    {
LABEL_3:
      uint64_t v7 = [v5 stringByReplacingOccurrencesOfString:@"\r" withString:@"\n"];

      id v8 = [objc_opt_class() annotatedAttributedStringWithString:v7 annotationStyle:[v3 annotationStyle] range:0 v6];
      goto LABEL_6;
    }
  }
  else
  {
    id v9 = [v3 annotationRepresentativeText];

    id v6 = [v9 length];
    float v5 = v9;
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  id v8 = 0;
LABEL_6:

  return v8;
}

+ (BOOL)isSelectedTextRepeatedInRepresentativeTextForAnnotation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 annotationRepresentativeText];
  if (v4
    && (float v5 = (void *)v4,
        [v3 annotationSelectedText],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = [v3 annotationRepresentativeText];
    id v8 = [v3 annotationSelectedText];
    id v9 = [v3 annotationRepresentativeText];
    v13.NSUInteger length = (CFIndex)[v9 length];
    v13.NSUInteger location = 0;
    CFArrayRef Results = CFStringCreateArrayWithFindResults(0, v7, v8, v13, 0);

    char v11 = (unint64_t)[(__CFArray *)Results count] > 1;
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

+ (id)clauseForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6
{
  id v9 = a3;
  id v10 = a4;
  NSUInteger location = a6->location;
  NSUInteger length = a6->length;
  CFRange v13 = +[NSCharacterSet punctuationCharacterSet];
  id v14 = 0;
  unint64_t v15 = length + location;
  unint64_t v16 = v15;
  while ((unint64_t)v14 < v15)
  {
    id v17 = [v10 rangeOfCharacterFromSet:v13 options:0 range:v14];
    id v14 = &v17[v18];
    unint64_t v16 = v15 - (void)&v17[v18];
    if (v16 <= a5)
    {
      v19 = [v10 substringWithRange:v14, [v10 length] - v14];
      goto LABEL_6;
    }
  }
  v19 = 0;
LABEL_6:
  v20 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v21 = [v19 stringByTrimmingCharactersInSet:v20];

  if (v21)
  {
    id v22 = [v9 annotationSelectedText];
    a6->NSUInteger location = (NSUInteger)[v21 rangeOfString:v22];
    a6->NSUInteger length = v23;
  }

  return v21;
}

+ (id)wordsForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_D31BC;
  long long v31 = sub_D31CC;
  id v32 = 0;
  NSUInteger location = a6->location;
  NSUInteger length = a6->length;
  NSUInteger v13 = length + a6->location;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_D31D4;
  v21[3] = &unk_2C8B20;
  NSUInteger v25 = length;
  unint64_t v26 = a5;
  NSUInteger v23 = &v27;
  NSUInteger v24 = location;
  id v14 = v10;
  id v22 = v14;
  [v14 enumerateSubstringsInRange:0 options:3 usingBlock:v21];
  unint64_t v15 = (void *)v28[5];
  unint64_t v16 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v17 = [v15 stringByTrimmingCharactersInSet:v16];

  if (v17)
  {
    uint64_t v18 = [v9 annotationSelectedText];
    a6->NSUInteger location = (NSUInteger)[v17 rangeOfString:v18];
    a6->NSUInteger length = v19;
  }
  _Block_object_dispose(&v27, 8);

  return v17;
}

+ (id)lettersForSelectedTextForAnnotation:(id)a3 inSentence:(id)a4 possibleLength:(unint64_t)a5 highlightedRange:(_NSRange *)a6
{
  id v9 = a3;
  id v10 = a4;
  NSUInteger v11 = a6->length + a6->location;
  NSUInteger v12 = v11 - a5;
  NSUInteger v13 = (char *)[v10 length];
  BOOL v14 = v11 >= a5;
  NSUInteger v15 = v11 - a5;
  if (v15 != 0 && v14 && (unint64_t v16 = v13, v13 <= [v10 length]))
  {
    id v17 = [v10 substringWithRange:v15, &v16[-v12]];
  }
  else
  {
    id v17 = 0;
  }
  uint64_t v18 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  NSUInteger v19 = [v17 stringByTrimmingCharactersInSet:v18];

  if (v19)
  {
    v20 = [v9 annotationSelectedText];
    a6->NSUInteger location = (NSUInteger)[v19 rangeOfString:v20];
    a6->NSUInteger length = v21;
  }

  return v19;
}

+ (id)contextAwareSelectedTextFromAnnotation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 annotationRepresentativeText];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = (uint64_t)[v3 annotationSelectedTextRange];
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || ![v4 length])
  {
    id v9 = [v3 annotationSelectedText];
    if ([v4 length]
      && ([v9 isEqualToString:v4] & 1) == 0
      && objc_msgSend(v4, "ae_occurrenceCountOfString:", v9) == (char *)&def_7D91C + 1)
    {
      uint64_t v5 = (uint64_t)[v4 rangeOfString:v9];
      uint64_t v7 = v10;
      id v8 = 0;
    }
    else
    {
      id v8 = v9;
    }
  }
  else
  {
    id v8 = 0;
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && !v8)
  {
    NSUInteger v11 = IMCommonCoreBundle();
    NSUInteger v12 = [v11 localizedStringForKey:@"\\U2026" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    [v4 substringWithRange:v5, v7];
    uint64_t v23 = 0;
    NSUInteger v24 = &v23;
    uint64_t v25 = 0x3032000000;
    unint64_t v26 = sub_D31BC;
    uint64_t v27 = sub_D31CC;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v28 = v13;
    id v14 = [v13 length];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_D3630;
    v17[3] = &unk_2C8B70;
    uint64_t v21 = v5;
    uint64_t v22 = v7;
    id v18 = v4;
    id v15 = v12;
    id v19 = v15;
    v20 = &v23;
    [v13 enumerateSubstringsInRange:0 options:4 usingBlock:v17];
    id v8 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }

  return v8;
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AEAnnotation;
  unsigned __int8 v5 = -[AEAnnotation validateForInsert:](&v7, "validateForInsert:");
  return v5 & [(AEAnnotation *)self validateConsistency:a3];
}

- (BOOL)validateForUpdate:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AEAnnotation;
  unsigned __int8 v5 = -[AEAnnotation validateForUpdate:](&v7, "validateForUpdate:");
  return v5 & [(AEAnnotation *)self validateConsistency:a3];
}

- (BOOL)validateConsistency:(id *)a3
{
  unsigned __int8 v5 = [(AEAnnotation *)self annotationLocation];
  if ([v5 length]) {
    goto LABEL_4;
  }
  uint64_t v6 = [(AEAnnotation *)self plUserData];
  if ([v6 length])
  {

LABEL_4:
    return 1;
  }
  unsigned __int8 v8 = [(AEAnnotation *)self isAnnotationDeleted];

  if (v8) {
    return 1;
  }
  id v9 = BCIMLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1ED5E4(self, v9);
  }

  if (!a3) {
    return 0;
  }
  id v10 = +[NSError errorWithDomain:@"AEAnnotationErrorDomain" code:1000 userInfo:0];
  BOOL result = 0;
  *a3 = v10;
  return result;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v27 = NSStringFromClass(v3);
  v36 = [(AEAnnotation *)self annotationAssetID];
  v38 = [(AEAnnotation *)self annotationCreationDate];
  unint64_t v26 = [(AEAnnotation *)self annotationCreatorIdentifier];
  unsigned int v25 = [(AEAnnotation *)self isAnnotationDeleted];
  unsigned int v24 = [(AEAnnotation *)self annotationIsUnderline];
  __int16 v37 = [(AEAnnotation *)self annotationLocation];
  v35 = [(AEAnnotation *)self annotationModificationDate];
  uint64_t v23 = [(AEAnnotation *)self annotationNote];
  id v34 = [(AEAnnotation *)self annotationRepresentativeText];
  uint64_t v22 = [(AEAnnotation *)self annotationSelectedText];
  uint64_t v21 = [(AEAnnotation *)self annotationStyle];
  uint64_t v20 = [(AEAnnotation *)self annotationType];
  long long v33 = [(AEAnnotation *)self annotationUuid];
  id v32 = [(AEAnnotation *)self physicalPageNumber];
  id v19 = [(AEAnnotation *)self annotationVersion];
  long long v31 = [(AEAnnotation *)self assetVersion];
  id v30 = [(AEAnnotation *)self attachments];
  uint64_t v29 = [(AEAnnotation *)self chapterTitle];
  id v18 = [(AEAnnotation *)self userModificationDate];
  id v17 = [(AEAnnotation *)self annotationModificationDate];
  uint64_t v4 = [(AEAnnotation *)self primitiveValueForKey:@"futureProofing7"];
  [(AEAnnotation *)self readingProgressHighWaterMark];
  double v6 = v5;
  unsigned int v14 = [(AEAnnotation *)self spineIndexUpdated];
  [(AEAnnotation *)self readingProgress];
  double v8 = v7;
  unint64_t v16 = [(AEAnnotation *)self locationModificationDate];
  id v15 = [(AEAnnotation *)self plAbsolutePhysicalLocation];
  id v9 = [(AEAnnotation *)self plLocationRangeEnd];
  id v10 = [(AEAnnotation *)self plLocationRangeStart];
  NSUInteger v11 = [(AEAnnotation *)self plStorageUUID];
  NSUInteger v12 = [(AEAnnotation *)self plUserData];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@:%p\n    assetID = %@;\n    creationDate = %@;\n    creatorIdentifier = %@;\n    deleted = %d;\n    isUnderline = %d;\n    cfiLocation = %@;\n    modificationDate = %@;\n    note = %@;\n    representativeText = %@;\n    selectedText = %@;\n    style = %d;\n    type = %d;\n    uuid = %@;\n    physicalPageNumber = %@;\n    annotationVersion = %@;\n    assetVersion = %@;\n    attachments = %@;\n    chapterTitle = %@;\n    userModificationDate = %@;\n    annotationModificationDate = %@;\n    selectedTextRange = %@;\n    readingProgressHighWaterMark = %f;\n    spineIndexUpdated = %d;\n    readingProgress = %f;\n    locationModificationDate = %@;\n    plAbsolutePhysicalLocation = %@;\n    plLocationRangeEnd = %@;\n    plLocationRangeStart = %@;\n    plStorageUUID = %@;\n    plUserData = %@;\n>",
    v27,
    self,
    v36,
    v38,
    v26,
    v25,
    v24,
    v37,
    v35,
    v23,
    v34,
    v22,
    v21,
    v20,
    v33,
    v32,
    v19,
    v31,
    v30,
    v29,
    v18,
    v17,
    v4,
    *(void *)&v6,
    v14,
    *(void *)&v8,
    v16,
    v15,
    v9,
    v10,
    v11,
  id v28 = v12);

  return (NSString *)v28;
}

- (NSNumber)annotationStyleNumber
{
  uint64_t v2 = [(AEAnnotation *)self annotationStyle];

  return +[NSNumber numberWithInt:v2];
}

- (NSNumber)annotationTypeNumber
{
  uint64_t v2 = [(AEAnnotation *)self annotationType];

  return +[NSNumber numberWithInt:v2];
}

+ (BOOL)mergeAnnotation:(id)a3 withServerAnnotation:(id)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(id)objc_opt_class() lastModificationFromDictionaryRepresentation:v8];
  id v11 = [v10 unsignedLongLongValue];

  NSUInteger v12 = [v7 annotationModificationDate];
  [v12 timeIntervalSince1970];
  unint64_t v14 = (unint64_t)v13;

  id v15 = [(id)objc_opt_class() annotationAssetIDFromDictionaryRepresentation:v8];
  if ((unint64_t)v11 < v14)
  {
    unint64_t v16 = BKMobileCloudSyncAnnotationsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v29 = 138413058;
      id v30 = v15;
      __int16 v31 = 1024;
      *(_DWORD *)id v32 = v14;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v11;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = v14 - v11;
      _os_log_impl(&def_7D91C, v16, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Client: %d; Server: %d; (%d) client > server, not merging",
        (uint8_t *)&v29,
        0x1Eu);
    }

    goto LABEL_23;
  }
  id v17 = BKMobileCloudSyncAnnotationsLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v11 == (id)v14)
  {
    if (v18)
    {
      int v29 = 138413058;
      id v30 = v15;
      __int16 v31 = 1024;
      *(_DWORD *)id v32 = v11;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v11;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = 0;
      _os_log_impl(&def_7D91C, v17, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Client: %d; Server: %d; (%d) client == server, not merging",
        (uint8_t *)&v29,
        0x1Eu);
    }

    goto LABEL_23;
  }
  if (v18)
  {
    int v29 = 138413058;
    id v30 = v15;
    __int16 v31 = 1024;
    *(_DWORD *)id v32 = v14;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v11;
    LOWORD(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 2) = v14 - v11;
    _os_log_impl(&def_7D91C, v17, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Client: %d; Server: %d; (%d) ... MERGING ANNOTATION",
      (uint8_t *)&v29,
      0x1Eu);
  }

  if (!v7)
  {
    id v19 = [(id)objc_opt_class() annotationCreatorIdentifierFromDictionaryRepresentation:v8];
    uint64_t v20 = [(id)objc_opt_class() annotationAssetIDFromDictionaryRepresentation:v8];
    id v7 = +[AEAnnotation insertAnnotationWithAssetID:v20 creatorIdentifier:v19 annotationUuid:0 intoManagedObjectContext:v9];
    uint64_t v21 = BKMobileCloudSyncAnnotationsLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [v7 annotationUuid];
      int v29 = 138412546;
      id v30 = v20;
      __int16 v31 = 2112;
      *(void *)id v32 = v22;
      _os_log_impl(&def_7D91C, v21, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Creating new Annotation: %@", (uint8_t *)&v29, 0x16u);
    }
    goto LABEL_17;
  }
  id v19 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = [v7 annotationUuid];
    int v29 = 138412546;
    id v30 = v15;
    __int16 v31 = 2112;
    *(void *)id v32 = v20;
    _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Updating existing Annotation: %@", (uint8_t *)&v29, 0x16u);
LABEL_17:
  }
  uint64_t v23 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    unsigned int v24 = [v7 redactedAnnotationLocation];
    unsigned int v25 = [v7 plUserData];
    unint64_t v26 = [v25 description];
    int v29 = 138412802;
    id v30 = v15;
    __int16 v31 = 2114;
    *(void *)id v32 = v24;
    *(_WORD *)&v32[8] = 2114;
    long long v33 = v26;
    _os_log_impl(&def_7D91C, v23, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ annotation.annotationLocation=%{public}@ annotation.plUserData=%{public}@", (uint8_t *)&v29, 0x20u);
  }
  uint64_t v27 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    int v29 = 138412546;
    id v30 = v15;
    __int16 v31 = 2114;
    *(void *)id v32 = v8;
    _os_log_impl(&def_7D91C, v27, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ dictionary=%{public}@", (uint8_t *)&v29, 0x16u);
  }

  [v7 deserializeFromDictionary:v8 trustedSource:0];
LABEL_23:

  return (unint64_t)v11 < v14;
}

+ (BOOL)mergeServerAnnotations:(id)a3 forAssetID:(id)a4 intoMoc:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v36 = a5;
  id v9 = BKMobileCloudSyncAnnotationsLog();
  id v33 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
    *(_DWORD *)buf = 138412546;
    id v46 = v33;
    __int16 v47 = 2112;
    v48 = v10;
    _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Merging {%@} serverAnnotations", buf, 0x16u);

    id v8 = v33;
  }

  id v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  +[AEAnnotation annotationsForAssetID:v8 includingDeleted:1 inManagedObjectContext:v36];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(obj);
        }
        unint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v17 = [v16 annotationUuid];
        [v11 setObject:v16 forKey:v17];
      }
      id v13 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v13);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v34 = v7;
  id v18 = [v34 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v18)
  {
    id v20 = v18;
    int v21 = 0;
    uint64_t v22 = *(void *)v38;
    *(void *)&long long v19 = 138412802;
    long long v32 = v19;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v34);
        }
        unsigned int v24 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        if (+[AEAnnotation isValidForDeserialization:](AEAnnotation, "isValidForDeserialization:", v24, v32))
        {
          unsigned int v25 = [(id)objc_opt_class() annotationTypeFromDictionaryRepresentation:v24];
          unint64_t v26 = objc_opt_class();
          if (v25 == 3)
          {
            uint64_t v27 = [v26 globalAnnotationForAssetID:v8 inManagedObjectContext:v36];
            id v28 = BKMobileCloudSyncAnnotationsLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              int v29 = [(id)objc_opt_class() annotationUuidFromDictionaryRepresentation:v24];
              id v30 = [v27 annotationUuid];
              *(_DWORD *)buf = v32;
              id v46 = v33;
              __int16 v47 = 2112;
              v48 = v29;
              __int16 v49 = 2112;
              v50 = v30;
              _os_log_impl(&def_7D91C, v28, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Found Global Annotation -- Server: %@\nLocal: %@", buf, 0x20u);

              id v8 = v33;
            }
          }
          else
          {
            id v28 = [v26 annotationUuidFromDictionaryRepresentation:v24];
            uint64_t v27 = [v11 objectForKey:v28];
          }

          v21 |= +[AEAnnotation mergeAnnotation:v27 withServerAnnotation:v24 moc:v36];
        }
        else
        {
          uint64_t v27 = BKMobileCloudSyncAnnotationsLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v46 = v8;
            __int16 v47 = 2112;
            v48 = v24;
            _os_log_impl(&def_7D91C, v27, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ Annotation not valid for deserialization: %@", buf, 0x16u);
          }
        }
      }
      id v20 = [v34 countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v20);
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21 & 1;
}

- (BOOL)usesLegacySerializationMethod
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(AEAnnotation *)self performSelector:"doesSerializeAs_iBooks"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)aeAnnotationDictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  +[AEAnnotation requiredKeysForDictionaryRepresentation];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v9 = [(AEAnnotation *)self valueForKey:v8];
        if (v9)
        {
          id v10 = +[NSNull null];

          if (v9 != v10) {
            [v3 setObject:v9 forKey:v8];
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v5);
  }
  +[AEAnnotation dateKeysForDictionaryRepresentation];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v29 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v29);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
        unint64_t v16 = [(AEAnnotation *)self valueForKey:v15];
        if (v16)
        {
          id v17 = +[NSNull null];

          if (v16 != v17)
          {
            [v16 timeIntervalSince1970];
            long long v19 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v18];
            [v3 setObject:v19 forKey:v15];
          }
        }
      }
      id v12 = [v29 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v12);
  }
  if (![(AEAnnotation *)self isAnnotationDeleted])
  {
    id v20 = +[AEAnnotation optionalKeysForDictionaryRepresentation];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = [v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * (void)k);
          unint64_t v26 = [(AEAnnotation *)self valueForKey:v25];
          if (v26)
          {
            uint64_t v27 = +[NSNull null];

            if (v26 != v27) {
              [v3 setObject:v26 forKey:v25];
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v22);
    }
  }

  return v3;
}

+ (id)dictionaryRepresentationsForAnnotations:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "isValidForSerialization", (void)v13))
          {
            id v11 = [v10 dictionaryRepresentation];
            [v4 addObject:v11];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

+ (id)_dictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 map:(id)a4 inManagedObjectContext:(id)a5
{
  id v28 = a5;
  id v8 = a4;
  id v26 = a3;
  id v9 = [a1 dateKeysForDictionaryRepresentation];
  id v10 = [a1 requiredKeysForDictionaryRepresentation];
  id v11 = [a1 optionalKeysForDictionaryRepresentation];
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v9, "count")+ (void)objc_msgSend(v10, "count")+ (unint64_t)objc_msgSend(v11, "count"));
  [v12 addObjectsFromArray:v9];
  [v12 addObjectsFromArray:v10];
  uint64_t v27 = v11;
  [v12 addObjectsFromArray:v11];
  long long v13 = +[AEAnnotation predicateForAllAnnotationsIncludingDeleted:0];
  long long v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v13, v26, 0);
  long long v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v14];

  long long v16 = [a1 dictionaryResultsForAnnotationsWithPredicate:v15 properties:v12 propertyNamesMap:v8 inManagedObjectContext:v28];

  id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:(char *)[v9 count] + [v10 count]];
  [v17 addObjectsFromArray:v9];
  [v17 addObjectsFromArray:v10];
  double v18 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -(double)+[IMUserDataCull maxDeletedAge]);
  long long v19 = +[NSPredicate predicateWithFormat:@"%K == YES && %K > %@", @"annotationDeleted", @"annotationModificationDate", v18];

  id v20 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, v26, 0);

  id v21 = +[NSCompoundPredicate andPredicateWithSubpredicates:v20];

  id v22 = [a1 dictionaryResultsForAnnotationsWithPredicate:v21 properties:v17 propertyNamesMap:v8 inManagedObjectContext:v28];

  id v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v16, "count") + (void)objc_msgSend(v22, "count"));
  unsigned int v24 = v23;
  if (v16) {
    [v23 addObjectsFromArray:v16];
  }
  if (v22) {
    [v24 addObjectsFromArray:v22];
  }

  return v24;
}

+ (id)modernDictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  return [a1 _dictionaryRepresentationForAnnotationsMatchingPredicate:a3 map:0 inManagedObjectContext:a4];
}

+ (id)compatibleDictionaryRepresentationForAnnotationsMatchingPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v38 = a4;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:@"bookDatabaseKey" forKey:@"annotationAssetID"];
  [v4 setObject:@"date" forKey:@"annotationCreationDate"];
  [v4 setObject:@"lastModification" forKey:@"annotationModificationDate"];
  [v4 setObject:@"deletedFlag" forKey:@"annotationDeleted"];
  [v4 setObject:@"highlightColor" forKey:@"annotationStyle"];
  [v4 setObject:@"ordinal" forKey:@"plLocationRangeStart"];
  [v4 setObject:@"serverSyncUniqueId" forKey:@"annotationUuid"];
  [v4 setObject:@"text" forKey:@"annotationSelectedText"];
  [v4 setObject:@"textualContext" forKey:@"annotationRepresentativeText"];
  [v4 setObject:@"annotation" forKey:@"annotationNote"];
  [v4 setObject:@"locationBPlist" forKey:@"plUserData"];
  id v5 = +[NSNull null];
  [v4 setObject:v5 forKey:@"annotationCreatorIdentifier"];

  id v6 = +[NSNull null];
  [v4 setObject:v6 forKey:@"plAbsolutePhysicalLocation"];

  id v7 = +[NSNull null];
  [v4 setObject:v7 forKey:@"plLocationRangeEnd"];

  id v8 = +[NSNull null];
  [v4 setObject:v8 forKey:@"futureProofing1"];

  id v9 = +[NSNull null];
  [v4 setObject:v9 forKey:@"futureProofing2"];

  id v10 = +[NSNull null];
  [v4 setObject:v10 forKey:@"futureProofing3"];

  id v11 = +[NSNull null];
  [v4 setObject:v11 forKey:@"futureProofing4"];

  id v12 = +[NSNull null];
  [v4 setObject:v12 forKey:@"futureProofing5"];

  long long v13 = +[NSNull null];
  [v4 setObject:v13 forKey:@"futureProofing6"];

  long long v14 = +[NSNull null];
  [v4 setObject:v14 forKey:@"futureProofing7"];

  long long v15 = +[NSNull null];
  [v4 setObject:v15 forKey:@"futureProofing8"];

  long long v16 = +[NSNull null];
  [v4 setObject:v16 forKey:@"futureProofing9"];

  id v17 = +[NSNull null];
  [v4 setObject:v17 forKey:@"futureProofing10"];

  double v18 = +[NSNull null];
  [v4 setObject:v18 forKey:@"futureProofing11"];

  long long v19 = +[NSNull null];
  [v4 setObject:v19 forKey:@"futureProofing12"];

  id v20 = +[NSExpression expressionForKeyPath:@"annotationType"];
  id v21 = +[NSNumber numberWithInteger:1];
  id v22 = +[NSExpression expressionForConstantValue:v21];

  id v23 = +[NSNumber numberWithInteger:3];
  unsigned int v24 = +[NSExpression expressionForConstantValue:v23];

  uint64_t v25 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v24, 0);
  id v26 = +[NSExpression expressionForFunction:@"add:to:" arguments:v25];

  uint64_t v27 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v26, v24, 0);
  id v28 = +[NSExpression expressionForFunction:@"modulus:by:" arguments:v27];

  id v29 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v22, 0);
  id v30 = +[NSExpression expressionForFunction:@"add:to:" arguments:v29];

  id v31 = objc_alloc_init((Class)NSExpressionDescription);
  [v31 setName:@"type"];
  [v31 setExpression:v30];
  [v4 setObject:v31 forKey:@"annotationType"];

  long long v32 = +[NSPredicate predicateWithFormat:@"(%K == nil || %K == %@ || %K == %@) && (%K <= %@ || %K == nil)", @"annotationCreatorIdentifier", @"annotationCreatorIdentifier", @"com~apple~iBooks", @"annotationCreatorIdentifier", @"com.apple.iBooks", @"futureProofing2", @"2", @"futureProofing2"];
  long long v33 = +[NSPredicate predicateWithFormat:@"(%K != nil && %K != %@ && %K != %@) || %K > %@", @"annotationCreatorIdentifier", @"annotationCreatorIdentifier", @"com~apple~iBooks", @"annotationCreatorIdentifier", @"com.apple.iBook", @"futureProofing2", @"2"];
  long long v34 = [a1 _dictionaryRepresentationForAnnotationsMatchingPredicate:v32 map:v4 inManagedObjectContext:v38];
  long long v35 = [a1 _dictionaryRepresentationForAnnotationsMatchingPredicate:v33 map:0 inManagedObjectContext:v38];

  long long v36 = +[NSMutableArray arrayWithCapacity:][v34 count] + [v35 count];
  [v36 addObjectsFromArray:v34];
  [v36 addObjectsFromArray:v35];

  return v36;
}

+ (id)aeAnnotationDictionaryRepresentationsForAnnotations:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "isValidForSerialization", (void)v13))
          {
            id v11 = [v10 aeAnnotationDictionaryRepresentation];
            [v4 addObject:v11];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

+ (id)dictionaryResultsForAnnotationsWithPredicate:(id)a3 properties:(id)a4 propertyNamesMap:(id)a5 inManagedObjectContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = v13;
  if (v13)
  {
    v58 = v13;
    id v59 = v10;
    id v57 = v11;
    id v15 = [v11 mutableCopy];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = [a1 dateKeysForDictionaryRepresentation];
    id v16 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    v63 = v15;
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v72;
      do
      {
        long long v19 = 0;
        id v60 = v17;
        do
        {
          if (*(void *)v72 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v19);
          id v21 = [v15 indexOfObject:v20];
          if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v22 = v21;
            id v23 = +[NSExpression expressionForKeyPath:v20];
            unsigned int v24 = +[NSNumber numberWithDouble:978307200.0];
            uint64_t v25 = +[NSExpression expressionForConstantValue:v24];

            id v26 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, v25, 0);
            uint64_t v27 = +[NSExpression expressionForFunction:@"add:to:" arguments:v26];

            id v28 = v20;
            id v29 = [v12 objectForKey:v28];
            objc_opt_class();
            id v30 = v12;
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              uint64_t v32 = [v30 objectForKey:v28];

              id v28 = (id)v32;
            }
            id v12 = v30;
            id v33 = objc_alloc_init((Class)NSExpressionDescription);
            [v33 setName:v28];
            [v33 setExpression:v27];
            [v33 setExpressionResultType:300];
            id v15 = v63;
            [v63 replaceObjectAtIndex:v22 withObject:v33];

            id v17 = v60;
          }
          long long v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      }
      while (v17);
    }

    id v10 = v59;
    if ([v12 count])
    {
      v56 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v58];
      [v56 propertiesByName];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_171A30;
      v69[3] = &unk_2CA9F0;
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      id v70 = v55;
      long long v34 = objc_retainBlock(v69);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v61 = v12;
      id v35 = v12;
      id v36 = [v35 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v66;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v66 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            id v41 = [v15 indexOfObject:v40];
            if (v41 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              id v42 = v41;
              long long v43 = [v35 objectForKey:v40];
              long long v44 = +[NSNull null];
              unsigned int v45 = [v43 isEqual:v44];

              if (v45)
              {
                [v63 removeObjectAtIndex:v42];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v46 = +[NSExpression expressionForKeyPath:v40];
                  id v47 = objc_alloc_init((Class)NSExpressionDescription);
                  [v47 setName:v43];
                  [v47 setExpression:v46];
                  [v47 setExpressionResultType:((uint64_t (*)(void *, uint64_t))v34[2])(v34, v40)];
                  [v63 replaceObjectAtIndex:v42 withObject:v47];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v48 = v43;
                    if (![v48 expressionResultType]) {
                      [v48 setExpressionResultType:((uint64_t (*)(void *, uint64_t))v34[2])(v34, v40)];
                    }
                    [v63 replaceObjectAtIndex:v42 withObject:v48];
                  }
                  else
                  {
                    [v63 replaceObjectAtIndex:v42 withObject:v43];
                  }
                }
              }

              id v15 = v63;
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }
        while (v37);
      }

      id v10 = v59;
      id v12 = v61;
    }
    id v50 = objc_alloc_init((Class)NSFetchRequest);
    v51 = v15;
    long long v14 = v58;
    v52 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v58];
    [v50 setEntity:v52];
    [v50 setResultType:2];
    [v50 setPropertiesToFetch:v51];
    [v50 setPredicate:v10];
    uint64_t v64 = 0;
    v53 = [v58 executeFetchRequest:v50 error:&v64];

    id v11 = v57;
  }
  else
  {
    v53 = 0;
  }

  return v53;
}

- (BOOL)isValidForSerialization
{
  if (![(AEAnnotation *)self isAnnotationDeleted]) {
    return 1;
  }
  id v3 = [(AEAnnotation *)self annotationModificationDate];
  [v3 timeIntervalSince1970];
  unint64_t v5 = (unint64_t)v4;

  if (+[IMUserDataCull isTimestampNewerThanMaxDeletedAge:v5])
  {
    return 1;
  }
  id v7 = BCIMLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [(AEAnnotation *)self annotationAssetID];
    id v9 = [(AEAnnotation *)self annotationUuid];
    id v10 = +[NSDate date];
    [v10 timeIntervalSince1970];
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2048;
    unint64_t v17 = (unint64_t)((v11 - (double)v5) / 86400.0);
    _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "MZBookKeeper isValidForSerialization assetID=%@ [%@] [Deleted %llu days ago]", (uint8_t *)&v12, 0x20u);
  }
  return 0;
}

- (void)deserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  id v17 = a3;
  BOOL v16 = a4;
  id v7 = [(id)objc_opt_class() annotationCreatorIdentifierFromDictionaryRepresentation:v17];
  uint64_t v8 = [v17 objectForKey:@"bookDatabaseKey"];
  if (![(id)objc_opt_class() isBKBookmarkCreatorIdentifier:v7]
    || ![v8 length])
  {
    id v9 = v7;
LABEL_8:
    id v10 = "aeAnnotationDeserializeFromDictionary:trustedSource:";
    goto LABEL_9;
  }
  id v9 = @"com~apple~iBooks";

  id v10 = "iBooks_deserializeFromDictionary:trustedSource:";
  if (!"iBooks_deserializeFromDictionary:trustedSource:") {
    goto LABEL_8;
  }
  char v11 = objc_opt_respondsToSelector();
  if ("iBooks_deserializeFromDictionary:trustedSource:" == a2 || (v11 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_9:
  int v12 = [(AEAnnotation *)self methodSignatureForSelector:v10];
  id v13 = +[NSInvocation invocationWithMethodSignature:v12];
  [v13 setSelector:v10];
  [v13 setArgument:&v17 atIndex:2];
  [v13 setArgument:&v16 atIndex:3];
  [v13 invokeWithTarget:self];
  __int16 v14 = [(AEAnnotation *)self annotationCreatorIdentifier];
  unsigned __int8 v15 = [v14 isEqualToString:v9];

  if ((v15 & 1) == 0) {
    [(AEAnnotation *)self setAnnotationCreatorIdentifier:v9];
  }
}

- (void)aeAnnotationDeserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  id v5 = a3;
  uint64_t v38 = -[AEAnnotation valueForKey:](self, "valueForKey:");

  +[AEAnnotation requiredKeysForDictionaryRepresentation];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        char v11 = [v5 valueForKey:v10];
        if (!v11
          || (+[NSNull null],
              int v12 = objc_claimAutoreleasedReturnValue(),
              v12,
              v11 == v12))
        {
          id v13 = self;
          __int16 v14 = 0;
        }
        else
        {
          id v13 = self;
          __int16 v14 = v11;
        }
        [(AEAnnotation *)v13 setValue:v14 forKey:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v7);
  }
  if (![(AEAnnotation *)self isAnnotationDeleted])
  {
    unsigned __int8 v15 = +[AEAnnotation optionalKeysForDictionaryRepresentation];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
          id v21 = [v5 valueForKey:v20];
          if (v21)
          {
            id v22 = +[NSNull null];

            if (v21 != v22) {
              [(AEAnnotation *)self setValue:v21 forKey:v20];
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v17);
    }
  }
  id v23 = +[AEAnnotation dateKeysForDictionaryRepresentation];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v24 = [v23 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * (void)k);
        id v29 = [v5 valueForKey:v28];
        if (v29)
        {
          id v30 = +[NSNull null];

          if (v29 != v30)
          {
            id v31 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v29 unsignedLongLongValue]);
            [(AEAnnotation *)self setValue:v31 forKey:v28];
          }
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v25);
  }
  if (!v38)
  {
    id v33 = [(AEAnnotation *)self annotationModificationDate];
    [(AEAnnotation *)self setUserModificationDate:v33];
    goto LABEL_44;
  }
  uint64_t v32 = [v5 valueForKey:@"futureProofing6"];

  if (v32)
  {
    id v33 = [v5 valueForKey:@"futureProofing6"];
    if ([v33 length])
    {
      [v33 doubleValue];
      uint64_t v34 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
LABEL_41:
      id v36 = (void *)v34;
      if (v34) {
        [(AEAnnotation *)self setUserModificationDate:v34];
      }
    }
LABEL_44:

    goto LABEL_45;
  }
  id v35 = [v5 valueForKey:@"annotationModificationDate"];

  if (v35)
  {
    id v33 = [v5 valueForKey:@"annotationModificationDate"];
    uint64_t v34 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v33 unsignedLongLongValue]);
    goto LABEL_41;
  }
LABEL_45:
  id v37 = [(AEAnnotation *)self annotationModificationDate];
  [(AEAnnotation *)self setLocationModificationDate:v37];
}

+ (BOOL)isValidForDeserialization:(id)a3
{
  id v4 = a3;
  id v5 = [a1 deletedFlagFromDictionaryRepresentation:v4];
  if (![v5 BOOLValue])
  {
    objc_opt_class();
    __int16 v14 = [v4 objectForKeyedSubscript:@"locationBPlist"];
    unsigned __int8 v15 = BUDynamicCast();
    if (![v15 length])
    {
      objc_opt_class();
      id v16 = [v4 objectForKeyedSubscript:@"plUserData"];
      id v17 = BUDynamicCast();
      if (![v17 length])
      {
        objc_opt_class();
        uint64_t v18 = [v4 objectForKeyedSubscript:@"annotationLocation"];
        long long v19 = BUDynamicCast();
        if (![v19 length])
        {
          id v21 = [a1 deletedFlagFromDictionaryRepresentation:v4];
          unsigned __int8 v22 = [v21 BOOLValue];

          if ((v22 & 1) == 0)
          {
            uint64_t v8 = BCIMLog();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              sub_1F0584((uint64_t)a1, (uint64_t)v4, v8);
            }
            goto LABEL_5;
          }
LABEL_12:
          BOOL v13 = 1;
          goto LABEL_13;
        }
      }
    }

    goto LABEL_12;
  }
  id v6 = [a1 lastModificationFromDictionaryRepresentation:v4];
  id v7 = [v6 unsignedLongLongValue];

  if (+[IMUserDataCull isTimestampNewerThanMaxDeletedAge:v7])
  {
    goto LABEL_12;
  }
  uint64_t v8 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(id)objc_opt_class() annotationAssetIDFromDictionaryRepresentation:v4];
    uint64_t v10 = [(id)objc_opt_class() annotationUuidFromDictionaryRepresentation:v4];
    char v11 = +[NSDate date];
    [v11 timeIntervalSince1970];
    *(_DWORD *)buf = 138412802;
    id v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v10;
    __int16 v27 = 2048;
    unint64_t v28 = (unint64_t)((v12 - (double)(unint64_t)v7) / 86400.0);
    _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "MZBookKeeper annotation merge assetID=%@ [%@] [Deleted %llu days ago]", buf, 0x20u);
  }
LABEL_5:

  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (id)iBooks_dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(AEAnnotation *)self annotationAssetID];

  if (v4)
  {
    id v5 = [(AEAnnotation *)self annotationAssetID];
    [v3 setObject:v5 forKey:@"bookDatabaseKey"];
  }
  id v6 = [(AEAnnotation *)self annotationCreationDate];

  if (v6)
  {
    id v7 = [(AEAnnotation *)self annotationCreationDate];
    [v7 timeIntervalSince1970];
    id v9 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v8];
    [v3 setObject:v9 forKey:@"date"];
  }
  uint64_t v10 = [(AEAnnotation *)self plLocationRangeStart];

  if (!v10)
  {
    char v11 = +[NSNumber numberWithInt:0];
    [(AEAnnotation *)self setPlLocationRangeStart:v11];
  }
  double v12 = [(AEAnnotation *)self plLocationRangeStart];

  if (v12)
  {
    BOOL v13 = [(AEAnnotation *)self plLocationRangeStart];
    [v3 setObject:v13 forKey:@"ordinal"];
  }
  __int16 v14 = [objc_opt_class() bookmarkTypeFromAnnotationType:[self annotationType]];
  if (v14) {
    [v3 setObject:v14 forKey:@"type"];
  }
  unsigned __int8 v15 = [(AEAnnotation *)self annotationModificationDate];

  if (!v15)
  {
    id v16 = [(AEAnnotation *)self annotationCreationDate];
    [(AEAnnotation *)self setAnnotationModificationDate:v16];
  }
  id v17 = [(AEAnnotation *)self annotationModificationDate];

  if (v17)
  {
    uint64_t v18 = [(AEAnnotation *)self annotationModificationDate];
    [v18 timeIntervalSince1970];
    uint64_t v20 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v19];
    [v3 setObject:v20 forKey:@"lastModification"];
  }
  id v21 = [(AEAnnotation *)self userModificationDate];

  if (v21)
  {
    unsigned __int8 v22 = [(AEAnnotation *)self userModificationDate];
    [v22 timeIntervalSince1970];
    id v24 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v23];
    [v3 setObject:v24 forKey:@"lastUserModification"];
  }
  if (![(AEAnnotation *)self isAnnotationDeleted])
  {
    __int16 v25 = [objc_opt_class() bookmarkColorFromAnnotationStyle:[self annotationStyle]];
    if (v25) {
      [v3 setObject:v25 forKey:@"highlightColor"];
    }
    uint64_t v26 = +[NSNumber numberWithBool:[(AEAnnotation *)self annotationIsUnderline]];
    [v3 setObject:v26 forKey:@"annotationIsUnderline"];

    __int16 v27 = [(AEAnnotation *)self plUserData];

    if (v27)
    {
      unint64_t v28 = [(AEAnnotation *)self plUserData];
      [v3 setObject:v28 forKey:@"locationBPlist"];
    }
    id v29 = [(AEAnnotation *)self annotationSelectedText];
    id v30 = [(id)objc_opt_class() optimizedSelectedTextForSerialization:v29];

    id v31 = [(AEAnnotation *)self annotationRepresentativeText];
    uint64_t v32 = [(id)objc_opt_class() optimizedRepresentativeTextForSerialization:v31 selectedText:v30];

    if (v32)
    {
      if (!v30)
      {
LABEL_25:
        if (v32) {
          [v3 setObject:v32 forKey:@"textualContext"];
        }

        goto LABEL_28;
      }
    }
    else
    {
      if ([(AEAnnotation *)self annotationType] == 2) {
        uint64_t v32 = &stru_2CE418;
      }
      else {
        uint64_t v32 = 0;
      }
      if (!v30) {
        goto LABEL_25;
      }
    }
    [v3 setObject:v30 forKey:@"text"];
    goto LABEL_25;
  }
LABEL_28:
  id v33 = +[NSNumber numberWithBool:[(AEAnnotation *)self isAnnotationDeleted]];
  [v3 setObject:v33 forKey:@"deletedFlag"];

  [(AEAnnotation *)self validateAnnotationUuid];
  uint64_t v34 = [(AEAnnotation *)self annotationUuid];
  [v3 setObject:v34 forKey:@"serverSyncUniqueId"];

  id v35 = [(AEAnnotation *)self annotationNote];

  if (v35)
  {
    id v36 = [(AEAnnotation *)self annotationNote];
    [v3 setObject:v36 forKey:@"annotation"];
  }

  return v3;
}

- (id)doesSerializeAs_iBooks
{
  id v3 = [(AEAnnotation *)self annotationCreatorIdentifier];
  unsigned int v4 = [(id)objc_opt_class() isBKBookmarkCreatorIdentifier:v3];
  id v5 = [(AEAnnotation *)self annotationVersion];

  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v5 && v4)
  {
    id v7 = [(AEAnnotation *)self annotationVersion];
    uint64_t v6 = [v7 compare:@"3" options:64] == (id)-1;
  }
  double v8 = +[NSNumber numberWithBool:v6];

  return v8;
}

- (void)iBooks_deserializeFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  BOOL v4 = a4;
  id v34 = a3;
  uint64_t v6 = [(AEAnnotation *)self valueForKey:@"futureProofing6"];

  id v7 = [v34 objectForKey:@"bookDatabaseKey"];
  [(AEAnnotation *)self setAnnotationAssetID:v7];

  double v8 = objc_opt_class();
  id v9 = [v34 objectForKey:@"highlightColor"];
  -[AEAnnotation setAnnotationStyle:](self, "setAnnotationStyle:", [v8 annotationStyleFromBookmarkColor:v9]);

  uint64_t v10 = [v34 valueForKey:@"annotationIsUnderline"];
  -[AEAnnotation setAnnotationIsUnderline:](self, "setAnnotationIsUnderline:", [v10 BOOLValue]);

  char v11 = [v34 objectForKey:@"date"];
  double v12 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v11 unsignedLongLongValue]);
  [(AEAnnotation *)self setAnnotationCreationDate:v12];

  BOOL v13 = [(AEAnnotation *)self bkBookmarkDeserializeLocationDataFromDictionary:v34 trustedSource:v4];
  [(AEAnnotation *)self setPlUserData:v13];

  __int16 v14 = [v34 objectForKey:@"ordinal"];
  [(AEAnnotation *)self setPlLocationRangeStart:v14];

  unsigned __int8 v15 = [v34 objectForKey:@"text"];
  [(AEAnnotation *)self setAnnotationSelectedText:v15];

  id v16 = [v34 objectForKey:@"textualContext"];
  if ([v16 length]) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  [(AEAnnotation *)self setAnnotationRepresentativeText:v17];
  uint64_t v18 = objc_opt_class();
  double v19 = [v34 objectForKey:@"type"];
  -[AEAnnotation setAnnotationType:](self, "setAnnotationType:", [v18 annotationTypeFromBookmarkType:v19]);

  if (![(AEAnnotation *)self annotationStyle]
    && ![(AEAnnotation *)self annotationIsUnderline]
    && [(AEAnnotation *)self annotationType] == 2)
  {
    [(AEAnnotation *)self setAnnotationIsUnderline:1];
  }
  if (![(AEAnnotation *)self annotationType])
  {
    uint64_t v20 = [(AEAnnotation *)self annotationSelectedText];
    if (v20)
    {

      uint64_t v21 = 2;
    }
    else
    {
      unsigned __int8 v22 = [(AEAnnotation *)self annotationRepresentativeText];

      if (v22) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = 3;
      }
    }
    [(AEAnnotation *)self setAnnotationType:v21];
  }
  double v23 = [v34 objectForKey:@"deletedFlag"];
  id v24 = [v23 BOOLValue];

  [(AEAnnotation *)self setAnnotationDeleted:v24];
  __int16 v25 = [v34 objectForKey:@"annotation"];
  [(AEAnnotation *)self setAnnotationNote:v25];

  uint64_t v26 = [v34 objectForKey:@"serverSyncUniqueId"];
  [(AEAnnotation *)self setAnnotationUuid:v26];

  [(AEAnnotation *)self validateAnnotationUuid];
  __int16 v27 = [v34 objectForKey:@"lastModification"];
  unint64_t v28 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v27 unsignedLongLongValue]);
  [(AEAnnotation *)self setAnnotationModificationDate:v28];

  if (!v6)
  {
    id v30 = [(AEAnnotation *)self annotationModificationDate];
    [(AEAnnotation *)self setUserModificationDate:v30];
    goto LABEL_21;
  }
  id v29 = [v34 valueForKey:@"lastUserModification"];

  if (v29)
  {
    id v30 = [v34 objectForKey:@"lastUserModification"];
    id v31 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v30 unsignedLongLongValue]);
LABEL_18:
    [(AEAnnotation *)self setUserModificationDate:v31];
LABEL_19:

LABEL_21:
    goto LABEL_22;
  }
  id v33 = [v34 valueForKey:@"lastModification"];

  if (v33)
  {
    id v30 = [v34 valueForKey:@"lastModification"];
    id v31 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v30 unsignedLongLongValue]);
    if (!v31) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_22:
  uint64_t v32 = [(AEAnnotation *)self annotationModificationDate];
  [(AEAnnotation *)self setLocationModificationDate:v32];
}

- (id)bkBookmarkDeserializeLocationDataFromDictionary:(id)a3 trustedSource:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    [(AEAnnotation *)self preferredDeserializedLocationDataFromDictionary:v6 trustedSource:v4];
  }
  else {
  id v7 = [v6 objectForKey:@"locationBPlist"];
  }

  return v7;
}

+ (int)annotationStyleFromBookmarkColor:(id)a3
{
  int result = [a3 intValue];
  if ((result - 1) >= 5) {
    return 0;
  }
  return result;
}

+ (id)bookmarkColorFromAnnotationStyle:(int)a3
{
  if ((a3 - 1) >= 5) {
    *(void *)&a3 = 0;
  }
  else {
    uint64_t v3 = a3;
  }
  return +[NSNumber numberWithInt:*(void *)&a3];
}

+ (int)annotationTypeFromBookmarkType:(id)a3
{
  unsigned int v3 = [a3 intValue] - 1;
  if (v3 > 2) {
    return 0;
  }
  else {
    return dword_2A2BA0[v3];
  }
}

+ (id)bookmarkTypeFromAnnotationType:(int)a3
{
  if ((a3 - 1) > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = dword_2A2BAC[a3 - 1];
  }
  return +[NSNumber numberWithInt:v3];
}

+ (id)annotationUuidFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKey:@"serverSyncUniqueId"];
  if (![v4 length])
  {
    uint64_t v5 = [v3 objectForKey:@"annotationUuid"];

    BOOL v4 = (void *)v5;
  }

  return v4;
}

+ (id)annotationAssetIDFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKey:@"bookDatabaseKey"];
  if (![v4 length])
  {
    uint64_t v5 = [v3 objectForKey:@"annotationAssetID"];

    BOOL v4 = (void *)v5;
  }

  return v4;
}

+ (id)lastModificationFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKey:@"lastModification"];
  if (!v4)
  {
    BOOL v4 = [v3 objectForKey:@"annotationModificationDate"];
  }

  return v4;
}

+ (id)deletedFlagFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKey:@"deletedFlag"];
  if (!v4)
  {
    BOOL v4 = [v3 objectForKey:@"annotationDeleted"];
  }

  return v4;
}

+ (id)annotationCreatorIdentifierFromDictionaryRepresentation:(id)a3
{
  id v3 = [a3 objectForKey:@"annotationCreatorIdentifier"];
  if (![v3 length])
  {
    BOOL v4 = @"com~apple~iBooks";

    id v3 = v4;
  }

  return v3;
}

+ (int)annotationTypeFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"type"];
  if (v5)
  {
    id v6 = (void *)v5;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      int v8 = 0;
      goto LABEL_7;
    }
    unsigned int v7 = [a1 annotationTypeFromBookmarkType:v6];
  }
  else
  {
    id v6 = [v4 objectForKey:@"annotationType"];
    unsigned int v7 = [v6 intValue];
  }
  int v8 = v7;
LABEL_7:

  return v8;
}

+ (id)requiredKeysForDictionaryRepresentation
{
  return +[NSArray arrayWithObjects:@"annotationUuid", @"annotationAssetID", @"annotationCreatorIdentifier", @"annotationDeleted", @"annotationType", @"annotationNote", @"plLocationRangeStart", 0];
}

+ (id)dateKeysForDictionaryRepresentation
{
  return +[NSArray arrayWithObjects:@"annotationCreationDate", @"annotationModificationDate", 0];
}

+ (id)optionalKeysForDictionaryRepresentation
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"annotationLocation", @"annotationRepresentativeText", @"annotationSelectedText", @"annotationStyle", @"annotationIsUnderline", @"plLocationRangeEnd", @"plAbsolutePhysicalLocation", @"plStorageUUID", @"plUserData", @"futureProofing1", @"futureProofing2", @"futureProofing3", @"futureProofing4", @"futureProofing5", @"futureProofing6", @"futureProofing7", @"futureProofing8",
           @"futureProofing9",
           @"futureProofing10",
           @"futureProofing11",
           @"futureProofing12",
           0);
}

- (id)validateAnnotationUuid
{
  id v3 = [(AEAnnotation *)self annotationUuid];
  if (![v3 length])
  {
    if ([(AEAnnotation *)self annotationType] == 3)
    {
      CFStringRef v4 = @"Reading Location";
    }
    else
    {
      id v5 = [(AEAnnotation *)self plUserData];
      id v6 = (const Bytef *)[v5 bytes];
      unsigned int v7 = [(AEAnnotation *)self plUserData];
      uLong v8 = crc32(0, v6, (uInt)[v7 length]);

      id v9 = [(AEAnnotation *)self annotationCreationDate];
      [v9 timeIntervalSince1970];
      CFStringRef v4 = +[NSString stringWithFormat:@"%d-crc32(%08x)", (int)v10, v8];

      id v3 = v9;
    }

    [(AEAnnotation *)self setAnnotationUuid:v4];
    id v3 = (void *)v4;
  }

  return v3;
}

+ (BOOL)isBKBookmarkCreatorIdentifier:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = v3;
  if (v3 && ([v3 isEqualToString:@"com~apple~iBooks"] & 1) == 0) {
    unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.iBooks"];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

@end