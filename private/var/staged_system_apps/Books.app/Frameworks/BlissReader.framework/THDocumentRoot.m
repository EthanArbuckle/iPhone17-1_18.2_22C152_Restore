@interface THDocumentRoot
+ (void)p_populateParagraphStyle:(id)a3;
- (AEAnnotationProvider)suppliedAnnotationProvider;
- (BOOL)hasThumbnailImageForAbsolutePageIndex:(unint64_t)a3;
- (BOOL)incrementBackgroundReaderCount;
- (BOOL)isClosing;
- (BOOL)isCorrupt;
- (BOOL)isEPUB;
- (BOOL)isPortraitOnlyBook;
- (BOOL)isStoreBook;
- (BOOL)loadEquationFontsIfNeeded;
- (BOOL)readStructureFromURL:(id)a3 error:(id *)a4;
- (BOOL)readStructureFromURL:(id)a3 updateOnly:(BOOL)a4 error:(id *)a5;
- (BOOL)shouldHyphenate;
- (BOOL)updateStructureFromURL:(id)a3 error:(id *)a4;
- (CGImage)thumbnailImageForAbsolutePageIndex:(unint64_t)a3;
- (EQKitEnvironment)equationEnvironment;
- (NSDictionary)bookMetadata;
- (NSManagedObjectContext)moc;
- (NSOperationQueue)contentLoadOperationQueue;
- (NSString)applePubDocId;
- (NSString)docVersion;
- (NSString)libraryDatabaseKey;
- (NSString)storeItemID;
- (NSString)yearFromReleaseDate;
- (NSURL)modelURL;
- (NSURL)zipPackage;
- (THAnnotationSearchIndex)annotationSearchIndex;
- (THAnnotationStorageController)annotationController;
- (THBookCoverDescription)bookCoverDescription;
- (THBookDescription)bookDescription;
- (THBookUserDefaults)bookUserDefaults;
- (THBookspotHistoryStack)bookspotHistoryStack;
- (THDocumentNavigationModel)navigationModel;
- (THDocumentProperties)properties;
- (THDocumentRoot)initWithContext:(id)a3;
- (THGlossaryController)glossaryController;
- (THModelGlossary)glossary;
- (THModelNode)rootNode;
- (THModelSearchIndex)searchIndex;
- (THPageSpotHistory)pagespotHistory;
- (THReflowablePaginationController)reflowablePaginationController;
- (THSearchController)searchController;
- (THTOCModel)tocModel;
- (THTetheringConnection)tetheringConnection;
- (THThemeProvider)themeProvider;
- (THUserDataManager)userDataManager;
- (TSSStylesheet)stylesheet;
- (_NSRange)storageRangeForAnnotation:(id)a3;
- (id)activityItemProvider;
- (id)activityItemProviderWithAnnotation:(id)a3;
- (id)activityItemProviderWithAnnotations:(id)a3;
- (id)anchorForCFIString:(id)a3 coarsenIfNeeded:(BOOL)a4;
- (id)anchorForNthInstance:(unint64_t)a3 ofSearchString:(id)a4 afterCFIString:(id)a5 coarsenIfNeeded:(BOOL)a6;
- (id)annotationsUpdatedForSharing:(id)a3;
- (id)contentNodeForCfi:(id)a3 error:(id *)a4;
- (id)firstLessonOfChapter:(id)a3;
- (id)kpfDocumentBaseResourcePath;
- (id)linkForNavigationUnitIndex:(unint64_t)a3;
- (id)modelLinkWithItemPath:(id)a3 dirPath:(id)a4 fragment:(id)a5;
- (id)modelStorageAnchorForAnnotation:(id)a3;
- (id)modelStorageAnchorForCfi:(id)a3 error:(id *)a4;
- (id)modelStorageAnchorForCfi:(id)a3 shallow:(BOOL)a4 error:(id *)a5;
- (id)newTemporaryReviewDataMOC;
- (id)newTemporateReviewResponseMOC;
- (id)p_activityItemPropertySource;
- (id)p_fetchResponseForQuestionID:(id)a3 moc:(id)a4;
- (id)p_fetchReviewWidgetDataForWidgetID:(id)a3 moc:(id)a4;
- (id)p_responseEntityWithMOC:(id)a3;
- (id)p_reviewEntityWithMOC:(id)a3;
- (id)p_reviewWidgetDataForResponse:(id)a3;
- (id)pageNumberStringForAnnotation:(id)a3;
- (id)pageNumberStringForLocation:(id)a3;
- (id)responseForQuestionID:(id)a3;
- (id)responseForQuestionID:(id)a3 temporaryMOC:(id)a4;
- (id)reviewWidgetDataForWidgetID:(id)a3;
- (id)reviewWidgetDataForWidgetID:(id)a3 temporaryMOC:(id)a4;
- (id)searchModel;
- (id)sectionNumberStringForLocation:(id)a3;
- (id)sectionTitleStringForAnnotation:(id)a3;
- (id)sectionTitleStringForLocation:(id)a3;
- (id)storageForAnnotation:(id)a3;
- (id)storageForCFI:(id)a3;
- (id)storageWithHighlightTextForAnnotation:(id)a3;
- (id)theme;
- (id)viewController;
- (unint64_t)absolutePageIndexForAnnotation:(id)a3;
- (unint64_t)absolutePageIndexForCFI:(id)a3;
- (unint64_t)absolutePageIndexForLocation:(id)a3;
- (unint64_t)absolutePageIndexForStorageAnchor:(id)a3;
- (unint64_t)writingDirection;
- (void)cancelApplePubRead;
- (void)commitUserDataChanges;
- (void)dealloc;
- (void)decrementBackgroundReaderCount;
- (void)documentDidLoad;
- (void)mutateResponse:(id)a3 block:(id)a4;
- (void)mutateReviewWidgetData:(id)a3 block:(id)a4;
- (void)p_initializeFields;
- (void)p_setupAnnotationControllerForBook:(id)a3;
- (void)removeResponse:(id)a3;
- (void)removeResponseForQuestionID:(id)a3;
- (void)removeReviewWidgetData:(id)a3;
- (void)removeReviewWidgetDataForWidgetID:(id)a3;
- (void)resetWithDictionaryRepresentation:(id)a3;
- (void)setAnnotationController:(id)a3;
- (void)setAnnotationSearchIndex:(id)a3;
- (void)setApplePubDocId:(id)a3;
- (void)setBookCoverDescription:(id)a3;
- (void)setBookDescription:(id)a3;
- (void)setGlossary:(id)a3;
- (void)setIsCorrupt:(BOOL)a3;
- (void)setLibraryDatabaseKey:(id)a3;
- (void)setNavigationModel:(id)a3;
- (void)setPagespotHistory:(id)a3;
- (void)setProperties:(id)a3;
- (void)setReflowablePaginationController:(id)a3;
- (void)setRootNode:(id)a3;
- (void)setSearchIndex:(id)a3;
- (void)setSearchModel:(id)a3;
- (void)setSuppliedAnnotationProvider:(id)a3;
- (void)setTetheringConnection:(id)a3;
- (void)setThemeProvider:(id)a3;
- (void)setTocModel:(id)a3;
- (void)setUserDataManager:(id)a3;
- (void)setZipPackage:(id)a3;
- (void)teardown;
- (void)willClose;
@end

@implementation THDocumentRoot

- (NSManagedObjectContext)moc
{
  return self->mMOC;
}

- (THModelNode)rootNode
{
  return self->mRootNode;
}

- (void)setRootNode:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mRootNode = (THModelNode *)a3;
}

- (THDocumentProperties)properties
{
  return self->mProperties;
}

- (void)setProperties:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mProperties = (THDocumentProperties *)a3;
}

- (NSString)applePubDocId
{
  return self->mApplePubDocId;
}

- (void)setApplePubDocId:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mApplePubDocId = v5;
}

- (THTOCModel)tocModel
{
  return self->mTOCModel;
}

- (void)setTocModel:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mTOCModel = (THTOCModel *)a3;
}

- (id)searchModel
{
  return self->mSearchModel;
}

- (void)setSearchModel:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mSearchModel = (THSearchModel *)a3;
}

- (NSURL)zipPackage
{
  return self->mZipPackage;
}

- (void)setZipPackage:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mZipPackage = (NSURL *)a3;
}

- (THModelGlossary)glossary
{
  return self->mGlossary;
}

- (void)setGlossary:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mGlossary = (THModelGlossary *)a3;
}

- (THModelSearchIndex)searchIndex
{
  return self->mSearchIndex;
}

- (void)setSearchIndex:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mSearchIndex = (THModelSearchIndex *)a3;
}

- (THAnnotationSearchIndex)annotationSearchIndex
{
  return self->mAnnotationSearchIndex;
}

- (void)setAnnotationSearchIndex:(id)a3
{
  [(THDocumentRoot *)self willModify];
  id v5 = a3;

  self->mAnnotationSearchIndex = (THAnnotationSearchIndex *)a3;
}

- (BOOL)isEPUB
{
  return [(THBookDescription *)self->mBookDescription isEpub];
}

+ (void)p_populateParagraphStyle:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_22CD8;
  v3[3] = &unk_4574B8;
  v3[4] = a3;
  [+[TSWPParagraphStyle properties] enumeratePropertiesUsingBlock:v3];
}

- (THDocumentRoot)initWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)THDocumentRoot;
  v3 = [(THDocumentRoot *)&v8 initWithContext:a3];
  if (v3)
  {
    v3->mStylesheet = [objc_alloc((Class)TSSStylesheet) initWithContext:[v3 context] canCullStyles:0];
    id v4 = +[TSWPParagraphStyle defaultStyleWithContext:[(THDocumentRoot *)v3 context]];
    [objc_opt_class() p_populateParagraphStyle:v4];
    [(TSSStylesheet *)v3->mStylesheet addStyle:v4 withIdentifier:TSWPDefaultParagraphStyleIdentifier];
    id v5 = +[TSWPListStyle defaultStyleWithContext:[(THDocumentRoot *)v3 context]];
    [(TSSStylesheet *)v3->mStylesheet addStyle:v5 withIdentifier:TSWPDefaultListStyleIdentifier];
    id v6 = +[TSWPColumnStyle defaultStyleWithContext:[(THDocumentRoot *)v3 context]];
    [(TSSStylesheet *)v3->mStylesheet addStyle:v6 withIdentifier:TSWPDefaultColumnStyleIdentifier];
    +[TSTTableStyleNetwork createStylesInStylesheet:v3->mStylesheet presetIndex:0 colors:0 alternate:0];
    v3->mProperties = [[THDocumentProperties alloc] initWithContext:[(THDocumentRoot *)v3 context]];
    v3->mTOCModel = [[THTOCModel alloc] initWithContext:[(THDocumentRoot *)v3 context]];
    v3->mSearchModel = [[THSearchModel alloc] initWithContext:[(THDocumentRoot *)v3 context]];
    v3->mApplePubDocId = (NSString *)@"0/0/0";
    v3->mLibraryDatabaseKey = (NSString *)&stru_46D7E8;
    v3->mCancelled = 0;
    v3->mBackgroundReaderCount = 0;
    v3->mGlossary = [[THModelGlossary alloc] initWithContext:[(THDocumentRoot *)v3 context] documentRoot:v3];
    v3->mSearchIndex = [(THSearchIndex *)[THModelSearchIndex alloc] initWithContext:[(THDocumentRoot *)v3 context]];
    v3->mAnnotationSearchIndex = [(THSearchIndex *)[THAnnotationSearchIndex alloc] initWithContext:[(THDocumentRoot *)v3 context]];
    v3->mEquationEnvironment = 0;
    [(THDocumentRoot *)v3 p_initializeFields];
    v3->_pagespotHistory = objc_alloc_init(THPageSpotHistory);
  }
  return v3;
}

- (void)teardown
{
  [(THSearchController *)[(THDocumentRoot *)self searchController] documentWillDealloc];
  [(THDocumentRoot *)self setNavigationModel:0];
  [(THDocumentRoot *)self setTetheringConnection:0];
  [(THDocumentRoot *)self setAnnotationController:0];
  [(THPageSpotHistory *)self->_pagespotHistory setDelegate:0];

  self->_pagespotHistory = 0;
  self->_themeProvider = 0;

  self->mRootNode = 0;
  self->mProperties = 0;

  self->mStylesheet = 0;
  self->mTOCModel = 0;

  self->mSearchModel = 0;
  self->mLibraryDatabaseKey = 0;

  self->mStoreItemID = 0;
  self->mBackgroundReaderCountCondition = 0;

  self->mBookDescription = 0;
  self->mBookCoverDescription = 0;

  self->mZipPackage = 0;
  self->mGlossary = 0;

  self->mSearchIndex = 0;
  self->mAnnotationSearchIndex = 0;

  self->mEquationEnvironment = 0;
  self->mContentLoadOperationQueue = 0;

  self->mBookUserDefaults = 0;
  self->mSuppliedAnnotationProvider = 0;
  if ([(NSManagedObjectContext *)[(THDocumentRoot *)self moc] hasChanges]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot teardown]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"] lineNumber:206 description:@"User Data managed object context has uncommitted changes.";
  }

  self->mMOC = 0;
  self->mUserDataManager = 0;

  self->mGlossaryController = 0;
  self->mSearchController = 0;
  mOpfXmlDoc = self->mOpfXmlDoc;
  if (mOpfXmlDoc)
  {
    xmlFreeDoc(mOpfXmlDoc);
    self->mOpfXmlDoc = 0;
  }
}

- (void)dealloc
{
  [(THDocumentRoot *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)THDocumentRoot;
  [(THDocumentRoot *)&v3 dealloc];
}

- (void)p_initializeFields
{
  self->mBackgroundReaderCountCondition = (NSCondition *)objc_alloc_init((Class)NSCondition);
  self->mContentLoadOperationQueue = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
}

- (unint64_t)writingDirection
{
  return 1;
}

- (id)theme
{
  return 0;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)willClose
{
  self->mClosing = 1;
  [(THAnnotationStorageController *)[(THDocumentRoot *)self annotationController] teardown];
  [(THDocumentRoot *)self setAnnotationController:0];
  objc_super v3 = [(THDocumentRoot *)self searchController];
  if (![(THSearchController *)v3 indexLoaded]) {
    [(THSearchController *)v3 cancelLoadIndex];
  }
  [(NSOperationQueue *)self->mContentLoadOperationQueue cancelAllOperations];
  [(NSOperationQueue *)self->mContentLoadOperationQueue waitUntilAllOperationsAreFinished];
  +[THWWebRep enumerateSubdomainsOfHost:[(THBookDescription *)[(THDocumentRoot *)self bookDescription] annotationID] usingBlock:&stru_4574F8];
  +[PFDURLProtocol unregisterHost:[(THBookDescription *)[(THDocumentRoot *)self bookDescription] annotationID]];
  [+[PFDContextManager sharedInstance] removeContextForArchive:[(NSURL *)[(THDocumentRoot *)self zipPackage] path]];
  v4.receiver = self;
  v4.super_class = (Class)THDocumentRoot;
  [(THDocumentRoot *)&v4 willClose];
}

- (BOOL)shouldHyphenate
{
  return [(THBookDescription *)self->mBookDescription autoHyphenate];
}

- (THBookspotHistoryStack)bookspotHistoryStack
{
  return (THBookspotHistoryStack *)self->_pagespotHistory;
}

- (void)resetWithDictionaryRepresentation:(id)a3
{
}

- (unint64_t)absolutePageIndexForStorageAnchor:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [a3 contentNode];
  if ([(THDocumentRoot *)self reflowablePaginationController])
  {
    id v6 = [(THReflowablePaginationController *)[(THDocumentRoot *)self reflowablePaginationController] paginationResultForContentNode:v5];
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6)
    {
      objc_super v8 = v6;
      if ([v6 firstPageIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v9 = [v8 relativePageIndexForStorageAnchor:a3];
        id v10 = [v8 firstPageIndex];
        if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
          id v11 = 0;
        }
        else {
          id v11 = v9;
        }
        return (unint64_t)v11 + (void)v10;
      }
    }
    return v7;
  }
  id v12 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)self context]];
  objc_opt_class();
  [v5 infoForNodeUniqueID:[a3 storageUID] forPresentationType:v12];
  id v13 = [v5 relativePageIndexForCharacterIndex:[a3 range] forInfo:TSUDynamicCast()];
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return v7;
  }

  return (unint64_t)[v5 absolutePageIndexForRelativePageIndex:v13 forPresentationType:v12];
}

- (unint64_t)absolutePageIndexForLocation:(id)a3
{
  id v5 = [a3 pageIndex];
  if (![(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub]) {
    return (unint64_t)v5;
  }
  id v6 = +[THModelStorageAnchor storageAnchorWithContentNode:pageLocation:](THModelStorageAnchor, "storageAnchorWithContentNode:pageLocation:", -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](self, "navigationModel"), "contentNodeForGUID:", [a3 contentNodeGUID]), a3);

  return [(THDocumentRoot *)self absolutePageIndexForStorageAnchor:v6];
}

- (id)kpfDocumentBaseResourcePath
{
  v2 = [(THAsset *)[(THBookDescription *)[(THDocumentRoot *)self bookDescription] asset] url];

  return [(NSURL *)v2 path];
}

- (id)pageNumberStringForLocation:(id)a3
{
  unint64_t v4 = [(THDocumentRoot *)self absolutePageIndexForLocation:a3];
  id v5 = +[THPresentationType paginatedPresentationTypeInContext:[(THModelNode *)[(THDocumentRoot *)self rootNode] context]];
  id v6 = [(THDocumentRoot *)self navigationModel];

  return [(THDocumentNavigationModel *)v6 pageNumberStringForAbsolutePageIndex:v4 forPresentationType:v5];
}

- (id)sectionTitleStringForLocation:(id)a3
{
  id v5 = [a3 pageIndex];
  if ([(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub]) {
    id v5 = -[THDocumentRoot absolutePageIndexForStorageAnchor:](self, "absolutePageIndexForStorageAnchor:", +[THModelStorageAnchor storageAnchorWithContentNode:pageLocation:](THModelStorageAnchor, "storageAnchorWithContentNode:pageLocation:", -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](self, "navigationModel"), "contentNodeForGUID:", [a3 contentNodeGUID]), a3));
  }
  id v6 = +[THPresentationType paginatedPresentationTypeInContext:[(THModelNode *)[(THDocumentRoot *)self rootNode] context]];
  unint64_t v7 = [(THDocumentRoot *)self navigationModel];

  return [(THDocumentNavigationModel *)v7 minorSnippetForAbsolutePageIndex:v5 withDocumentRoot:self forPresentationType:v6];
}

- (id)sectionNumberStringForLocation:(id)a3
{
  id result = -[THDocumentNavigationModel navigationUnitContainingContentNode:](-[THDocumentRoot navigationModel](self, "navigationModel"), "navigationUnitContainingContentNode:", -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](self, "navigationModel"), "contentNodeForGUID:", [a3 contentNodeGUID]));
  if (result)
  {
    id v5 = result;
    id v6 = [(THDocumentRoot *)self navigationModel];
    return [(THDocumentNavigationModel *)v6 sectionIdentifierForNavigationUnit:v5];
  }
  return result;
}

- (CGImage)thumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot thumbnailImageForAbsolutePageIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:403 description:@"Invalid index."];
    return 0;
  }
  id v5 = +[THPresentationType paginatedPresentationTypeInContext:[(THModelNode *)[(THDocumentRoot *)self rootNode] context]];
  id v6 = [(THDocumentNavigationModel *)[(THDocumentRoot *)self navigationModel] navigationUnitContainingContentNode:[(THModelNode *)[(THDocumentRoot *)self rootNode] contentNodeForRelativePageIndex:a3 forPresentationType:v5]];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  id v8 = [v6 relativePageIndexForAbsolutePageIndex:a3 forPresentationType:v5];
  unint64_t v9 = [(NSArray *)[(THDocumentNavigationModel *)[(THDocumentRoot *)self navigationModel] navigationUnits] indexOfObject:v7];
  if (v9 >= [(NSArray *)[(THDocumentNavigationModel *)[(THDocumentRoot *)self navigationModel] navigationUnits] count])return 0; {
  id v10 = objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](-[THTOCModel tiles](-[THDocumentRoot tocModel](self, "tocModel"), "tiles"), "objectAtIndex:", v9), "tinyThumbs"), "objectAtIndex:", v8);
  }

  return (CGImage *)+[TSDBitmapImageProvider temporaryCGImageForImageData:v10];
}

- (BOOL)hasThumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  return ![(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub];
}

- (NSString)docVersion
{
  v2 = [(THDocumentRoot *)self bookDescription];
  if (![(THBookDescription *)v2 authoredVersion] || ![(THBookDescription *)v2 timestamp]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot docVersion]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:445 description:@"Building a model version string befor initializing all of: authoredVersion, timestamp."];
  }
  if ([(THBookDescription *)v2 timestamp]
    && [(NSString *)[(THBookDescription *)v2 timestamp] length])
  {
    if ([(THBookDescription *)v2 authoredVersion]
      && [(NSString *)[(THBookDescription *)v2 authoredVersion] length])
    {
      return [(NSString *)[(THBookDescription *)v2 authoredVersion] stringByAppendingFormat:@"@%@", [(THBookDescription *)v2 timestamp]];
    }
    else
    {
      unint64_t v4 = [(THBookDescription *)v2 timestamp];
      return (NSString *)[@"@" stringByAppendingString:v4];
    }
  }
  else if ([(THBookDescription *)v2 authoredVersion] {
         && [(NSString *)[(THBookDescription *)v2 authoredVersion] length])
  }
  {
    return [(THBookDescription *)v2 authoredVersion];
  }
  else
  {
    return (NSString *)@"0";
  }
}

- (NSURL)modelURL
{
  objc_super v3 = [(THDocumentRoot *)self bookDescription];
  if (![(THBookDescription *)v3 isbn]
    || ![(THBookDescription *)v3 uniquifier]
    || ![(THBookDescription *)v3 authoredVersion]
    || ![(THBookDescription *)v3 timestamp])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot modelURL]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:466 description:@"Building a model URL before initializing all of: isbn, uniquifier, authoredVersion, timestamp"];
  }
  if ([(THBookDescription *)v3 isbn]) {
    CFStringRef v4 = [(THBookDescription *)v3 isbn];
  }
  else {
    CFStringRef v4 = @"0";
  }
  if ([(THBookDescription *)v3 uniquifier]) {
    CFStringRef v5 = [(THBookDescription *)v3 uniquifier];
  }
  else {
    CFStringRef v5 = @"0";
  }
  id v6 = +[NSString stringWithFormat:@"apub:///%@/%@/%@", v4, v5, [(THDocumentRoot *)self docVersion]];

  return +[NSURL URLWithString:v6];
}

- (BOOL)isPortraitOnlyBook
{
  v2 = [(THDocumentProperties *)[(THDocumentRoot *)self properties] chapterBrowserPagePresentationType];
  [(THPresentationType *)v2 pageSize];
  double v4 = v3;
  [(THPresentationType *)v2 pageSize];
  return v4 > v5;
}

- (BOOL)isStoreBook
{
  return [(THDocumentRoot *)self storeItemID] != 0;
}

- (NSString)storeItemID
{
  id result = self->mStoreItemID;
  if (!result)
  {
    id result = [[-[NSDictionary objectForKey:](-[THDocumentRoot bookMetadata](self, "bookMetadata"), "objectForKey:", @"itemId") stringValue];
    self->mStoreItemID = result;
  }
  return result;
}

- (NSDictionary)bookMetadata
{
  v2 = [(NSURL *)[(THBookDescription *)[(THDocumentRoot *)self bookDescription] bookBundleUrl] URLByAppendingPathComponent:@"iTunesMetadata.plist"];

  return +[NSDictionary dictionaryWithContentsOfURL:v2];
}

- (NSString)yearFromReleaseDate
{
  [(NSDictionary *)[(THDocumentRoot *)self bookMetadata] objectForKey:@"releaseDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    uint64_t v2 = TSUDynamicCast();
    id v3 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [v3 setTimeZone:TSUGetGMTTimeZone()];
    double v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", objc_msgSend(objc_msgSend(v3, "components:fromDate:", 4, v2), "year"));

    return v4;
  }
  else
  {
    objc_opt_class();
    id v6 = (void *)TSUDynamicCast();
    if ((unint64_t)[v6 length] < 4)
    {
      return 0;
    }
    else
    {
      return (NSString *)[v6 substringToIndex:4];
    }
  }
}

- (BOOL)loadEquationFontsIfNeeded
{
  if (![NSFileManager fileExistsAtPath:[NSFileManager defaultManager] fileExistsAtPath:[self urlForDocRelativePath:@"OPS/assets/images/equation-1.png"]])return 1; {
  id v3 = [(THDocumentRoot *)self equationEnvironment];
  }

  return [(EQKitEnvironment *)v3 fontsLoaded];
}

- (EQKitEnvironment)equationEnvironment
{
  objc_sync_enter(self);
  if (!self->mEquationEnvironment)
  {
    if (-[THDocumentProperties equationEnvironmentEntry](-[THDocumentRoot properties](self, "properties"), "equationEnvironmentEntry")&& (v3 = objc_msgSend(-[THBookDescription dataForDocRelativePath:context:](-[THDocumentRoot bookDescription](self, "bookDescription"), "dataForDocRelativePath:context:", -[THDocumentProperties equationEnvironmentEntry](-[THDocumentRoot properties](self, "properties"), "equationEnvironmentEntry"), 0), "NSData")) != 0&& (id v4 = +[EQKitEnvironment environmentFromData:](EQKitEnvironment, "environmentFromData:", v3)) != 0)
    {
      double v5 = (EQKitEnvironment *)v4;
      self->mEquationEnvironment = v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    else if (!self->mEquationEnvironment)
    {
LABEL_8:
      self->mEquationEnvironment = (EQKitEnvironment *)+[EQKitEnvironment defaultEnvironment];
    }
  }
  objc_sync_exit(self);
  return self->mEquationEnvironment;
}

- (void)documentDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)THDocumentRoot;
  [(THDocumentRoot *)&v8 documentDidLoad];
  id v3 = [(THAsset *)[(THBookDescription *)[(THDocumentRoot *)self bookDescription] asset] assetID];
  if (self->mBookUserDefaults) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:585 description:@"expected nil value for '%s'", "mBookUserDefaults"];
  }
  self->mBookUserDefaults = [[THBookUserDefaults alloc] initWithBookID:v3];
  if (self->mNavigationModel) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot documentDidLoad]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"] lineNumber:588 description:@"expected nil value for '%s'", "mNavigationModel"];
  }
  self->mNavigationModel = [[THDocumentNavigationModel alloc] initWithDocumentRoot:self navigationUnitsNodes:0];
  if (self->mGlossaryController) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:591 description:@"expected nil value for '%s'", "mGlossaryController"];
  }
  self->mGlossaryController = [[THGlossaryController alloc] initWithModel:[(THDocumentRoot *)self glossary] documentRoot:self];
  if (self->mSearchController) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot documentDidLoad]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"] lineNumber:594 description:@"expected nil value for '%s'", "mSearchController"];
  }
  self->mSearchController = [[THSearchController alloc] initWithDocumentRoot:self];
  if (self->mUserDataManager) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot documentDidLoad]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"] lineNumber:597 description:@"expected nil value for '%s'", "mUserDataManager"];
  }
  id v4 = [[THUserDataManager alloc] initWithBookDescription:[(THDocumentRoot *)self bookDescription]];
  self->mUserDataManager = v4;
  if (!v4) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot documentDidLoad]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"] lineNumber:599 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"mUserDataManager"];
  }
  if (self->mMOC) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THDocumentRoot documentDidLoad]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"] lineNumber:601 description:@"expected nil value for '%s'", "mMOC"];
  }
  double v5 = [(THUserDataManager *)self->mUserDataManager newManagedObjectContext];
  self->mMOC = v5;
  if (!v5) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot documentDidLoad]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"] lineNumber:603 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"mMOC"];
  }
  if ([(THDocumentRoot *)self annotationController]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:605 description:@"expected nil value for '%s'", "self.annotationController"];
  }
  [(THDocumentRoot *)self p_setupAnnotationControllerForBook:[(THDocumentRoot *)self bookDescription]];
  [(THAnnotationStorageController *)[(THDocumentRoot *)self annotationController] rescueDanglingAnnotationsWithDocumentRoot:self];
  +[PFDURLProtocol registerHost:[(THBookDescription *)[(THDocumentRoot *)self bookDescription] annotationID] bookRootURL:[(THBookDescription *)[(THDocumentRoot *)self bookDescription] bookBundleUrl] withDRMContext:[(THBookDescription *)[(THDocumentRoot *)self bookDescription] drmContext]];
  id v6 = [(THBookDescription *)[(THDocumentRoot *)self bookDescription] drmContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24698;
  v7[3] = &unk_457520;
  v7[4] = [(THBookDescription *)[(THDocumentRoot *)self bookDescription] bookBundleUrl];
  v7[5] = v6;
  +[THWWebRep enumerateSubdomainsOfHost:[(THBookDescription *)[(THDocumentRoot *)self bookDescription] annotationID] usingBlock:v7];
  [+[BEDocumentExternalLoadApprovalCache sharedInstance] removeCachedDisapprovalForBookID:v3];
}

- (id)firstLessonOfChapter:(id)a3
{
  objc_opt_class();
  [a3 nodeAtIndex:0];
  id v4 = (void *)TSUDynamicCast();
  if (!v4) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot firstLessonOfChapter:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:627 description:@"Expecting chapter child node to be a content node"];
  }
  return v4;
}

- (id)linkForNavigationUnitIndex:(unint64_t)a3
{
  id v4 = [(THDocumentRoot *)self navigationModel];

  return [(THDocumentNavigationModel *)v4 linkForNavigationUnitIndex:a3];
}

- (void)p_setupAnnotationControllerForBook:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "asset"), "assetID");
  id v6 = objc_msgSend(objc_msgSend(a3, "asset"), "url");
  if (![(THDocumentRoot *)self properties]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot p_setupAnnotationControllerForBook:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:721 description:@"expected to access document properties but it is nil"];
  }
  id v7 = [(THDocumentProperties *)[(THDocumentRoot *)self properties] bookVersion];
  objc_super v8 = +[THAnnotationSerializationManager annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:](THAnnotationSerializationManager, "annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", v5, v6, -[THBookVersion versionString](v7, "versionString"), [a3 contextDirectoryPath], [a3 asset] isManagedBook);
  if (![(THDocumentRoot *)self suppliedAnnotationProvider]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot p_setupAnnotationControllerForBook:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm") lineNumber:726 description:@"expected annotationProvider to have been supplied"];
  }
  unint64_t v9 = [(THDocumentRoot *)self suppliedAnnotationProvider];
  id v10 = [[THAnnotationController alloc] initWithAnnotationProvider:v9 documentNavigationModel:[(THDocumentRoot *)self navigationModel]];
  if ((-[THAnnotationSerializationManager isAssetOfflineWithAssetID:](v8, "isAssetOfflineWithAssetID:", v5) & 1) != 0|| (-[THAnnotationSerializationManager takeBookOfflineIfManagedWithAnnotationProvider:assetID:](v8, "takeBookOfflineIfManagedWithAnnotationProvider:assetID:", v9, v5) & 1) != 0|| -[THAnnotationSerializationManager wentOfflineAfterHandleAnnotationProvider:willEncounterAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:copyIfGoingOffline:](v8, "wentOfflineAfterHandleAnnotationProvider:willEncounterAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:copyIfGoingOffline:", v9, -[THAnnotationController maxAnnotationAssetVersion](v10, "maxAnnotationAssetVersion"), v7, v5, objc_msgSend(objc_msgSend(a3, "asset"), "url"), 0))
  {
    id v11 = [[THAnnotationController alloc] initWithAnnotationProvider:[(THAnnotationSerializationManager *)v8 annotationProviderForOfflineDBWithAssetID:v5] documentNavigationModel:[(THDocumentRoot *)self navigationModel]];
    id v12 = &dword_0 + 1;
    [(THAnnotationController *)v11 setAnnotationsReadEnabled:1];
    if (![(THDocumentProperties *)[(THDocumentRoot *)self properties] isPreview]) {
      id v12 = objc_msgSend(objc_msgSend(a3, "asset"), "isManagedBook");
    }
    [(THAnnotationController *)v11 setAnnotationsWriteEnabled:v12];
    [(THAnnotationController *)v10 teardown];
  }
  else
  {
    id v11 = v10;
  }
  [(THDocumentRoot *)self setAnnotationController:v11];
  id v13 = [(THBookVersion *)v7 versionString];

  [(THAnnotationSerializationManager *)v8 removeOfflineDBFilesWithAssetID:v5 exceptBookVersionString:v13];
}

- (AEAnnotationProvider)suppliedAnnotationProvider
{
  return self->mSuppliedAnnotationProvider;
}

- (void)setSuppliedAnnotationProvider:(id)a3
{
}

- (THAnnotationStorageController)annotationController
{
  return self->mAnnotationController;
}

- (void)setAnnotationController:(id)a3
{
}

- (THDocumentNavigationModel)navigationModel
{
  return self->mNavigationModel;
}

- (void)setNavigationModel:(id)a3
{
}

- (THTetheringConnection)tetheringConnection
{
  return self->mTetheringConnection;
}

- (void)setTetheringConnection:(id)a3
{
}

- (THUserDataManager)userDataManager
{
  return self->mUserDataManager;
}

- (void)setUserDataManager:(id)a3
{
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (THSearchController)searchController
{
  return self->mSearchController;
}

- (THBookDescription)bookDescription
{
  return self->mBookDescription;
}

- (void)setBookDescription:(id)a3
{
}

- (THBookCoverDescription)bookCoverDescription
{
  return self->mBookCoverDescription;
}

- (void)setBookCoverDescription:(id)a3
{
}

- (NSString)libraryDatabaseKey
{
  return self->mLibraryDatabaseKey;
}

- (void)setLibraryDatabaseKey:(id)a3
{
}

- (NSOperationQueue)contentLoadOperationQueue
{
  return self->mContentLoadOperationQueue;
}

- (BOOL)isCorrupt
{
  return self->mIsCorrupt;
}

- (void)setIsCorrupt:(BOOL)a3
{
  self->mIsCorrupt = a3;
}

- (BOOL)isClosing
{
  return self->mClosing;
}

- (THBookUserDefaults)bookUserDefaults
{
  return self->mBookUserDefaults;
}

- (THThemeProvider)themeProvider
{
  return self->_themeProvider;
}

- (void)setThemeProvider:(id)a3
{
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
  self->_reflowablePaginationController = (THReflowablePaginationController *)a3;
}

- (THPageSpotHistory)pagespotHistory
{
  return self->_pagespotHistory;
}

- (void)setPagespotHistory:(id)a3
{
}

- (void)mutateReviewWidgetData:(id)a3 block:(id)a4
{
  if (a4) {
    (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  }
  [a3 setModificationDate:[NSDate date]];

  [(THDocumentRoot *)self commitUserDataChanges];
}

- (void)removeReviewWidgetData:(id)a3
{
  [(NSManagedObjectContext *)[(THDocumentRoot *)self moc] deleteObject:a3];

  [(THDocumentRoot *)self commitUserDataChanges];
}

- (void)removeReviewWidgetDataForWidgetID:(id)a3
{
  id v4 = [(THDocumentRoot *)self p_fetchReviewWidgetDataForWidgetID:a3 moc:[(THDocumentRoot *)self moc]];

  [(THDocumentRoot *)self removeReviewWidgetData:v4];
}

- (id)p_reviewEntityWithMOC:(id)a3
{
  if (a3)
  {
    id v4 = kTSWReviewWidgetDataEntityName;
    return +[NSEntityDescription entityForName:v4 inManagedObjectContext:a3];
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_reviewEntityWithMOC:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m") lineNumber:51 description:@"invalid nil value for '%s'", "moc"];
    return 0;
  }
}

- (id)reviewWidgetDataForWidgetID:(id)a3
{
  return [(THDocumentRoot *)self reviewWidgetDataForWidgetID:a3 temporaryMOC:0];
}

- (id)reviewWidgetDataForWidgetID:(id)a3 temporaryMOC:(id)a4
{
  if (a4)
  {
    return -[THDocumentRoot p_fetchReviewWidgetDataForWidgetID:moc:](self, "p_fetchReviewWidgetDataForWidgetID:moc:");
  }
  else
  {
    id v7 = [(THDocumentRoot *)self p_fetchReviewWidgetDataForWidgetID:a3 moc:[(THDocumentRoot *)self moc]];
    if (!v7)
    {
      objc_super v8 = [(THDocumentRoot *)self moc];
      id v9 = [(THDocumentRoot *)self p_reviewEntityWithMOC:v8];
      if (v8 && v9)
      {
        id v7 = [[TSWReviewWidgetData alloc] initWithEntity:v9 insertIntoManagedObjectContext:v8];
        [(TSWReviewWidgetData *)v7 setUniqueID:a3];
        id v10 = +[NSDate date];
        [(TSWReviewWidgetData *)v7 setCreationDate:v10];
        [(TSWReviewWidgetData *)v7 setModificationDate:v10];
        [(THDocumentRoot *)self commitUserDataChanges];
      }
      else
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) reviewWidgetDataForWidgetID:temporaryMOC:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m") lineNumber:82 description:@"Failed to save review widget data."];
        return 0;
      }
    }
    return v7;
  }
}

- (id)newTemporaryReviewDataMOC
{
  uint64_t v2 = [(THDocumentRoot *)self userDataManager];

  return [(THUserDataManager *)v2 newManagedObjectContext];
}

- (id)p_fetchReviewWidgetDataForWidgetID:(id)a3 moc:(id)a4
{
  if (!a4)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m") lineNumber:100 description:@"invalid nil value for '%s'", "moc"];
    if (a3) {
      return 0;
    }
LABEL_10:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m") lineNumber:101 description:@"invalid nil value for '%s'", "widgetID"];
    return 0;
  }
  if (!a3) {
    goto LABEL_10;
  }
  id v7 = objc_alloc_init((Class)NSFetchRequest);
  [v7 setEntity:[self p_reviewEntityWithMOC:a4]];
  [v7 setPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"uniqueID LIKE %@", a3)];
  uint64_t v13 = 0;
  id v8 = [a4 executeFetchRequest:v7 error:&v13];
  if (!v8)
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m"];
    [v9 handleFailureInFunction:v10, v11, 111, @"Error fetching results: %@ Error: %@", v7, v13 file lineNumber description];
  }

  id result = [v8 count];
  if (result)
  {
    if ([v8 count] != (char *)&dword_0 + 1) {
      [TSUAssertionHandler currentHandler].handleFailureInFunction:[NSString stringWithUTF8String:@"-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m"] lineNumber:115 description:@"Retrieved multiple sets of metadata for widgetID %@.  See <rdar://problem/10669561>." a3];
    }
    objc_opt_class();
    [v8 objectAtIndex:0];
    return (id)TSUDynamicCast();
  }
  return result;
}

- (id)p_reviewWidgetDataForResponse:(id)a3
{
  return 0;
}

- (void)mutateResponse:(id)a3 block:(id)a4
{
  if (a4) {
    (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  }
  [a3 setModificationDate:[NSDate date]];
  [(THDocumentRoot *)self mutateReviewWidgetData:[(THDocumentRoot *)self p_reviewWidgetDataForResponse:a3] block:0];

  [(THDocumentRoot *)self commitUserDataChanges];
}

- (void)removeResponse:(id)a3
{
  [(NSManagedObjectContext *)[(THDocumentRoot *)self moc] deleteObject:a3];

  [(THDocumentRoot *)self commitUserDataChanges];
}

- (void)removeResponseForQuestionID:(id)a3
{
  id v4 = [(THDocumentRoot *)self p_fetchResponseForQuestionID:a3 moc:[(THDocumentRoot *)self moc]];
  if (v4)
  {
    [(THDocumentRoot *)self removeResponse:v4];
  }
}

- (id)p_responseEntityWithMOC:(id)a3
{
  if (a3)
  {
    id v4 = kTSWReviewResponseEntityName;
    return +[NSEntityDescription entityForName:v4 inManagedObjectContext:a3];
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewResponseController) p_responseEntityWithMOC:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m") lineNumber:69 description:@"invalid nil value for '%s'", "moc"];
    return 0;
  }
}

- (id)p_fetchResponseForQuestionID:(id)a3 moc:(id)a4
{
  id v7 = objc_alloc_init((Class)NSFetchRequest);
  [v7 setEntity:[self p_responseEntityWithMOC:a4]];
  [v7 setPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"uniqueID LIKE %@", a3)];
  uint64_t v13 = 0;
  id v8 = [a4 executeFetchRequest:v7 error:&v13];
  if (!v8)
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewResponseController) p_fetchResponseForQuestionID:moc:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m"];
    [v9 handleFailureInFunction:v10, v11, 85, @"Error fetching results: %@ Error: %@", v7, v13 file lineNumber description];
  }

  id result = [v8 count];
  if (result)
  {
    if ([v8 count] != (char *)&dword_0 + 1) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot(TSWReviewResponseController) p_fetchResponseForQuestionID:moc:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m"] lineNumber:89 description:@"Retrieved multiple responses for questionID %@.  See <rdar://problem/10669561>." a3];
    }
    objc_opt_class();
    [v8 objectAtIndex:0];
    return (id)TSUDynamicCast();
  }
  return result;
}

- (id)responseForQuestionID:(id)a3
{
  return [(THDocumentRoot *)self responseForQuestionID:a3 temporaryMOC:0];
}

- (id)responseForQuestionID:(id)a3 temporaryMOC:(id)a4
{
  if (a4)
  {
    return -[THDocumentRoot p_fetchResponseForQuestionID:moc:](self, "p_fetchResponseForQuestionID:moc:");
  }
  else
  {
    id v7 = [(THDocumentRoot *)self p_fetchResponseForQuestionID:a3 moc:[(THDocumentRoot *)self moc]];
    if (!v7)
    {
      id v8 = [(THDocumentRoot *)self moc];
      id v9 = [(THDocumentRoot *)self p_responseEntityWithMOC:v8];
      if (v8 && v9)
      {
        id v7 = [[TSWReviewResponse alloc] initWithEntity:v9 insertIntoManagedObjectContext:v8];
        [(TSWReviewResponse *)v7 setUniqueID:a3];
        id v10 = +[NSDate date];
        [(TSWReviewResponse *)v7 setCreationDate:v10];
        [(TSWReviewResponse *)v7 setModificationDate:v10];
        [(THDocumentRoot *)self commitUserDataChanges];
      }
      else
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewResponseController) responseForQuestionID:temporaryMOC:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m") lineNumber:119 description:@"Failed to save review response data."];
        return 0;
      }
    }
    return v7;
  }
}

- (id)newTemporateReviewResponseMOC
{
  uint64_t v2 = [(THDocumentRoot *)self userDataManager];

  return [(THUserDataManager *)v2 newManagedObjectContext];
}

- (void)commitUserDataChanges
{
  uint64_t v5 = 0;
  [(NSManagedObjectContext *)[(THDocumentRoot *)self moc] save:&v5];
  if (v5)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(THUserDataControllerCommon) commitUserDataChanges]");
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_UserDataAdditions.m"];
    [v2 handleFailureInFunction:v3, v4, 23, @"Error saving user data:%@", v5 file lineNumber description];
  }
}

- (id)viewController
{
  id v3 = [+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin") existingBookViewControllerForDocumentRoot:self documentViewController];
  id v4 = v3;
  if (v3 && [v3 documentRoot] != self) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THDocumentRoot(iOS) viewController]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_iOS.m"] lineNumber:25 description:@"There should never be more than one documentRoot"];
  }
  if ([v4 documentRoot] == self) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)modelStorageAnchorForAnnotation:(id)a3
{
  id v4 = [a3 annotationLocation];

  return [(THDocumentRoot *)self modelStorageAnchorForCfi:v4 error:0];
}

- (unint64_t)absolutePageIndexForAnnotation:(id)a3
{
  uint64_t v5 = (void *)TSUProtocolCast();
  if ([(THDocumentRoot *)self reflowablePaginationController])
  {
    id v14 = 0;
    id v6 = -[THDocumentRoot modelStorageAnchorForCfi:error:](self, "modelStorageAnchorForCfi:error:", [a3 annotationLocation], &v14);
    if (!v6)
    {
      id v7 = +[TSUAssertionHandler currentHandler];
      id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(Annotations) absolutePageIndexForAnnotation:]");
      id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_Annotations.m"];
      [v7 handleFailureInFunction:v8, v9, 55, @"failed to lookup anchor for CFI with error: %@", [v14 localizedDescription]];
    }
    return [(THDocumentRoot *)self absolutePageIndexForStorageAnchor:v6];
  }
  else
  {
    id v11 = [v5 annotationAbsolutePhysicalPageIndex];
    if (v5) {
      BOOL v12 = v11 == (id)0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if ([a3 annotationLocation])
      {
        id v13 = [a3 annotationLocation];
        return [(THDocumentRoot *)self absolutePageIndexForCFI:v13];
      }
      else
      {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      return (unint64_t)[v5 annotationAbsolutePhysicalPageIndex];
    }
  }
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  unint64_t v4 = [(THDocumentRoot *)self absolutePageIndexForAnnotation:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = (void *)THBundle();
    return [v5 localizedStringForKey:@"-" value:&stru_46D7E8 table:0];
  }
  else
  {
    unint64_t v7 = v4;
    id v8 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)self context]];
    id v9 = [(THDocumentRoot *)self navigationModel];
    return [(THDocumentNavigationModel *)v9 pageNumberStringForAbsolutePageIndex:v7 forPresentationType:v8];
  }
}

- (id)sectionTitleStringForAnnotation:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(-[THDocumentRoot modelStorageAnchorForAnnotation:](self, "modelStorageAnchorForAnnotation:", a3), "contentNode"), "title");
  unint64_t v4 = +[NSCharacterSet whitespaceCharacterSet];

  return [v3 stringByTrimmingCharactersInSet:v4];
}

- (id)storageForAnnotation:(id)a3
{
  id result = [a3 annotationLocation];
  if (result)
  {
    id v6 = [a3 annotationLocation];
    return [(THDocumentRoot *)self storageForCFI:v6];
  }
  return result;
}

- (_NSRange)storageRangeForAnnotation:(id)a3
{
  id v3 = (void *)TSUProtocolCast();
  if (v3)
  {
    NSUInteger v4 = (NSUInteger)[v3 annotationStorageRange];
  }
  else
  {
    NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v5 = 0;
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)storageWithHighlightTextForAnnotation:(id)a3
{
  id v5 = -[THDocumentRoot storageForAnnotation:](self, "storageForAnnotation:");
  NSUInteger v6 = (NSUInteger)[(THDocumentRoot *)self storageRangeForAnnotation:a3];
  NSUInteger v8 = v7;
  unint64_t v9 = v6 + v7;
  if (v6 + v7 > (unint64_t)[v5 length])
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(Annotations) storageWithHighlightTextForAnnotation:]");
    BOOL v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_Annotations.m"];
    v18.location = v6;
    v18.length = v8;
    [v10 handleFailureInFunction:v11, v12, 135, @"sourceRange %@ not within storage length = %lu", NSStringFromRange(v18), [v5 length]];
  }
  if (v9 > (unint64_t)[v5 length])
  {
    NSUInteger v8 = 0;
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v13 = [THWPStorage alloc];
  id v14 = [(THDocumentRoot *)self context];
  if (!v5 || v6 == 0x7FFFFFFFFFFFFFFFLL) {
    id v15 = -[THWPStorage initTemporaryWithContext:string:](v13, "initTemporaryWithContext:string:", v14, [a3 annotationSelectedText]);
  }
  else {
    id v15 = -[THWPStorage initTemporaryWithContext:storage:range:](v13, "initTemporaryWithContext:storage:range:", v14, v5, v6, v8);
  }
  id v16 = v15;
  [v16 replaceListLabelTypeNumberWithBullet];
  return v16;
}

- (id)annotationsUpdatedForSharing:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  NSUInteger v6 = (char *)[a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      unint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = TSUCheckedProtocolCast();
        if (v10)
        {
          id v11 = [(THAnnotationStorageController *)[(THDocumentRoot *)self annotationController] modifiedAnnotation:v10 withChapterTitle:[(THDocumentRoot *)self sectionTitleStringForAnnotation:v10] physicalPageNumber:[(THDocumentRoot *)self pageNumberStringForAnnotation:v10]];
          if (v11) {
            [v5 addObject:v11];
          }
          else {
            [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(Annotations) annotationsUpdatedForSharing:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_Annotations.m") lineNumber:169 description:@"invalid nil value for '%s'", "updatedAnnotation"];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      NSUInteger v7 = (char *)[a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)activityItemProvider
{
  id v3 = [objc_alloc((Class)AEAssetActivityItemProvider) initWithPropertySource:[self p_activityItemPropertySource]];
  [v3 setCitationsAllowed:[-[THDocumentRoot bookDescription](self, "bookDescription") allowCopy]];
  return v3;
}

- (id)activityItemProviderWithAnnotation:(id)a3
{
  id v4 = [objc_alloc((Class)AEAssetActivityItemProvider) initWithAnnotation:a3 propertySource:[self p_activityItemPropertySource]];
  [v4 setCitationsAllowed:[-[THDocumentRoot bookDescription](self, "bookDescription") allowCopy]];
  return v4;
}

- (id)activityItemProviderWithAnnotations:(id)a3
{
  id v4 = [objc_alloc((Class)AEAssetActivityItemProvider) initWithAnnotations:a3 propertySource:[self p_activityItemPropertySource]];
  [v4 setCitationsAllowed:[-[THDocumentRoot bookDescription](self, "bookDescription") allowCopy]];
  return v4;
}

- (id)p_activityItemPropertySource
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1C73D8;
  v3[3] = &unk_45AE08;
  v3[4] = self;
  return [v3 copy];
}

- (id)modelStorageAnchorForCfi:(id)a3 error:(id *)a4
{
  if (![(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub]
    || (id result = [(THDocumentRoot *)self reflowablePaginationController]) != 0)
  {
    return [(THDocumentRoot *)self modelStorageAnchorForCfi:a3 shallow:0 error:a4];
  }
  return result;
}

- (id)contentNodeForCfi:(id)a3 error:(id *)a4
{
  if (![(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub]
    || (id result = [(THDocumentRoot *)self reflowablePaginationController]) != 0)
  {
    id v8 = [(THDocumentRoot *)self modelStorageAnchorForCfi:a3 shallow:1 error:a4];
    return [v8 contentNode];
  }
  return result;
}

- (id)anchorForCFIString:(id)a3 coarsenIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub])
  {
    NSUInteger v7 = [(THDocumentRoot *)self reflowablePaginationController];
    id result = 0;
    if (!a3 || !v7) {
      return result;
    }
  }
  else if (!a3)
  {
    return 0;
  }
  id result = [(THDocumentRoot *)self modelStorageAnchorForCfi:a3 error:0];
  if (!result && v4)
  {
    unint64_t v9 = +[THSimpleCFI pathStringFromFragment:a3];
    while (1)
    {
      id result = [(__CFString *)v9 length];
      if (!result) {
        break;
      }
      id v10 = [+[THSimpleCFI simpleCFIWithString:v9] parent];
      if (v10)
      {
        unint64_t v9 = (__CFString *)[v10 cfiString];
        id result = [(THDocumentRoot *)self modelStorageAnchorForCfi:+[THSimpleCFI fragmentFromPathString:v9] error:0];
        if (result) {
          return result;
        }
      }
      else
      {
        unint64_t v9 = &stru_46D7E8;
      }
    }
  }
  return result;
}

- (id)anchorForNthInstance:(unint64_t)a3 ofSearchString:(id)a4 afterCFIString:(id)a5 coarsenIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  objc_opt_class();
  [(THDocumentRoot *)self anchorForCFIString:a5 coarsenIfNeeded:v6];
  id v11 = (void *)TSUDynamicCast();
  if (!v11) {
    return 0;
  }
  BOOL v12 = v11;
  if ([v11 contentNode])
  {
    +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)self context]];
    id v13 = [v12 contentNode];
    return [v13 storageAnchorAfterAnchor:v12 forNthInstance:a3 ofSearchString:a4 presentationType:a5];
  }
  if (![v12 glossaryEntry])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(CFI) anchorForNthInstance:ofSearchString:afterCFIString:coarsenIfNeeded:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_CFI.m") lineNumber:98 description:@"expected anchor to contentNode or to glossaryEntry, got %@", v12];
    return 0;
  }
  id v14 = [v12 glossaryEntry];

  return [v14 storageAnchorAfterAnchor:v12 forNthInstance:a3 ofSearchString:a4];
}

- (unint64_t)absolutePageIndexForCFI:(id)a3
{
  if ([(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub]
    && ![(THDocumentRoot *)self reflowablePaginationController])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v10 = 0;
  id v5 = [(THDocumentRoot *)self modelStorageAnchorForCfi:a3 error:&v10];
  if (!v5)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    NSUInteger v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(CFI) absolutePageIndexForCFI:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_CFI.m"];
    [v6 handleFailureInFunction:v7, v8, 113, @"failed to lookup anchor for CFI %@ with error: %@", a3, [v10 localizedDescription]];
  }
  return [(THDocumentRoot *)self absolutePageIndexForStorageAnchor:v5];
}

- (id)storageForCFI:(id)a3
{
  if (![(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub]
    || (id result = [(THDocumentRoot *)self reflowablePaginationController]) != 0)
  {
    id v13 = 0;
    id v6 = [(THDocumentRoot *)self modelStorageAnchorForCfi:a3 error:&v13];
    if (v6)
    {
      NSUInteger v7 = v6;
      id v8 = +[THPresentationType paginatedPresentationTypeInContext:[(THDocumentRoot *)self context]];
      id v9 = [v7 contentNode];
      objc_opt_class();
      [v9 infoForNodeUniqueID:[v7 storageUID] forPresentationType:v8];
      return (id)TSUDynamicCast();
    }
    else
    {
      id v10 = +[TSUAssertionHandler currentHandler];
      id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(CFI) storageForCFI:]");
      BOOL v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_CFI.m"];
      [v10 handleFailureInFunction:v11, v12, 137, @"failed to lookup anchor for CFI with error: %@", [v13 localizedDescription]];
      return 0;
    }
  }
  return result;
}

- (BOOL)incrementBackgroundReaderCount
{
  BOOL mCancelled = self->mCancelled;
  if (!self->mCancelled && !+[NSThread isMainThread])
  {
    [(NSCondition *)self->mBackgroundReaderCountCondition lock];
    ++self->mBackgroundReaderCount;
    [(NSCondition *)self->mBackgroundReaderCountCondition unlock];
  }
  return !mCancelled;
}

- (void)decrementBackgroundReaderCount
{
  if (!+[NSThread isMainThread])
  {
    [(NSCondition *)self->mBackgroundReaderCountCondition lock];
    --self->mBackgroundReaderCount;
    [(NSCondition *)self->mBackgroundReaderCountCondition signal];
    mBackgroundReaderCountCondition = self->mBackgroundReaderCountCondition;
    [(NSCondition *)mBackgroundReaderCountCondition unlock];
  }
}

- (BOOL)readStructureFromURL:(id)a3 updateOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", [a3 path]);
  if ([(PFXArchive *)v9 isValid])
  {
    [(PFXArchive *)v9 setAsset:[(THBookDescription *)[(THDocumentRoot *)self bookDescription] asset]];
    if (v6) {
      unsigned __int8 v10 = +[PFAIDocument updateDocumentRoot:self applePubURL:a3 fromArchive:v9];
    }
    else {
      unsigned __int8 v10 = +[PFAIDocument readDocumentRoot:self applePubURL:a3 fromArchive:v9];
    }
    BOOL v11 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
  if (a5 && !v11)
  {
    BOOL v11 = 0;
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.iWork.Compatibility.ApplePubImport", 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", *(void *)(TCUnknownProblemMessage + 8), NSLocalizedDescriptionKey, 0));
  }

  return v11;
}

- (BOOL)updateStructureFromURL:(id)a3 error:(id *)a4
{
  return [(THDocumentRoot *)self readStructureFromURL:a3 updateOnly:1 error:a4];
}

- (BOOL)readStructureFromURL:(id)a3 error:(id *)a4
{
  NSUInteger v7 = [(THDocumentRoot *)self properties];
  if (v7)
  {
    id v8 = v7;
    id v9 = [(THDocumentRoot *)self bookDescription];
    unsigned int v10 = [(THBookDescription *)v9 orientationLock];
    if ([(THBookDescription *)v9 isEpub])
    {
      [(THDocumentProperties *)v8 setFlowPresentationType:+[THPresentationType flowPresentationTypeInContext:pageSize:](THPresentationType, "flowPresentationTypeInContext:pageSize:", [(THDocumentRoot *)self context], CGSizeZero.width, CGSizeZero.height)];
      [(THDocumentProperties *)v8 setPaginatedPresentationType:+[THPresentationType paginatedPresentationTypeInContext:pageSize:](THPresentationType, "paginatedPresentationTypeInContext:pageSize:", [(THDocumentRoot *)self context], CGSizeZero.width, CGSizeZero.height)];
    }
    else
    {
      id v11 = [(THDocumentRoot *)self context];
      +[THPagePositionController fixedPageSizeForLandscapeOrientation:v10 != 1];
      id v12 = +[THPresentationType paginatedPresentationTypeInContext:pageSize:](THPresentationType, "paginatedPresentationTypeInContext:pageSize:", v11);
      [(THDocumentProperties *)v8 setPaginatedPresentationType:v12];
      [(THDocumentProperties *)v8 setChapterBrowserPagePresentationType:v12];
      if ([(THBookDescription *)v9 orientationLock] != 1
        && [(THBookDescription *)v9 orientationLock] != 2)
      {
        id v13 = [(THDocumentRoot *)self context];
        +[THPagePositionController fixedPageSizeForLandscapeOrientation:0];
        [(THDocumentProperties *)v8 setFlowPresentationType:+[THPresentationType flowPresentationTypeInContext:pageSize:](THPresentationType, "flowPresentationTypeInContext:pageSize:", v13)];
      }
    }
  }

  return [(THDocumentRoot *)self readStructureFromURL:a3 updateOnly:0 error:a4];
}

- (void)cancelApplePubRead
{
  self->BOOL mCancelled = 1;
  [(NSCondition *)self->mBackgroundReaderCountCondition lock];
  if (self->mBackgroundReaderCount >= 1)
  {
    do
      [(NSCondition *)self->mBackgroundReaderCountCondition wait];
    while (self->mBackgroundReaderCount > 0);
  }
  mBackgroundReaderCountCondition = self->mBackgroundReaderCountCondition;

  [(NSCondition *)mBackgroundReaderCountCondition unlock];
}

- (id)modelLinkWithItemPath:(id)a3 dirPath:(id)a4 fragment:(id)a5
{
  id v5 = -[THModelLink initWithPath:fragment:context:]([THModelLink alloc], "initWithPath:fragment:context:", objc_msgSend(objc_msgSend(objc_msgSend(@"/", "stringByAppendingPathComponent:", -[THDocumentRoot applePubDocId](self, "applePubDocId")), "stringByAppendingPathComponent:", objc_msgSend(a4, "stringByDeletingLastPathComponent")), "stringByAppendingPathComponent:", a3), a5, -[THDocumentRoot context](self, "context"));

  return v5;
}

- (id)modelStorageAnchorForCfi:(id)a3 shallow:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (![(THBookDescription *)[(THDocumentRoot *)self bookDescription] isEpub]
    || [(THDocumentRoot *)self reflowablePaginationController])
  {
    id v9 = [[CXNamespace alloc] initWithUri:"http://www.idpf.org/2007/opf"];
    unsigned int v10 = [[THCFIReader alloc] initWithCFI:a3 error:a5];
    if (!v10)
    {
      v19 = 0;
LABEL_35:

      return v19;
    }
    id v11 = v10;
    id v12 = [[PFXArchive alloc] initWithPath:[(NSURL *)[(THDocumentRoot *)self zipPackage] path]];
    if (!v12)
    {
      v19 = 0;
LABEL_34:

      goto LABEL_35;
    }
    id v13 = v12;
    id v14 = +[PFAXPackage opfXmlUriFromPackage:v12];
    if (([v14 hasPrefix:@"/"] & 1) == 0) {
      id v14 = [@"/" stringByAppendingString:v14];
    }
    mOpfXmlDoc = self->mOpfXmlDoc;
    if (mOpfXmlDoc)
    {
LABEL_23:
      uint64_t v30 = 0;
      v21 = +[THCFIReader findRefNodeFromRoot:CXGetRootElement(mOpfXmlDoc) reader:v11 ns:v9 manifest:&v30];
      v19 = 0;
      if (xmlNodeIsText(v21)) {
        goto LABEL_33;
      }
      v22 = +[THCFIReader lookupIDFrom:v21 inManifest:v30 ns:v9];
      if (v22)
      {
        v19 = +[THCFIReader getHrefFromNode:v22 ns:CXNoNamespace];
        if (v19)
        {
          id v23 = [(THDocumentRoot *)self modelLinkWithItemPath:v19 dirPath:v14 fragment:0];
          v24 = [[THDocumentLinkResolver alloc] initWithDocumentRoot:self];
          if (v24)
          {
            v25 = v24;
            id v26 = [(THDocumentLinkResolver *)v24 nodeFromLink:v23];

            if (v26)
            {
              if (v6) {
                v27 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v26, 0, 0, 0);
              }
              else {
                v27 = (THModelStorageAnchor *)[v26 storageAnchorForCfiReader:v11];
              }
              goto LABEL_38;
            }
            id v28 = -[THModelGlossary entryForPath:](self->mGlossary, "entryForPath:", objc_msgSend(objc_msgSend(v14, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v19));
            if (v28)
            {
              v27 = +[THModelStorageAnchor storageAnchorWithGlossaryEntry:storageUID:range:](THModelStorageAnchor, "storageAnchorWithGlossaryEntry:storageUID:range:", v28, 0, 0, 0);
LABEL_38:
              v19 = v27;
              goto LABEL_33;
            }
          }
          goto LABEL_32;
        }
LABEL_33:

        goto LABEL_34;
      }
LABEL_32:
      v19 = 0;
      goto LABEL_33;
    }
    id v16 = [(PFXArchive *)v13 entryWithName:v14];
    if (v16)
    {
      v17 = (_xmlDoc *)[v16 xmlDocument];
      if (v17)
      {
        NSRange v18 = v17;
        objc_sync_enter(self);
        if (self->mOpfXmlDoc) {
          xmlFreeDoc(v18);
        }
        else {
          self->mOpfXmlDoc = v18;
        }
        objc_sync_exit(self);
LABEL_22:
        mOpfXmlDoc = self->mOpfXmlDoc;
        if (!mOpfXmlDoc) {
          goto LABEL_32;
        }
        goto LABEL_23;
      }
      if (!a5) {
        goto LABEL_22;
      }
      v20 = +[NSDictionary dictionaryWithObjectsAndKeys:@"invalid XML in OPF.", NSLocalizedDescriptionKey, 0];
    }
    else
    {
      if (!a5) {
        goto LABEL_22;
      }
      v20 = +[NSDictionary dictionaryWithObjectsAndKeys:@"invalid archive.", NSLocalizedDescriptionKey, 0];
    }
    *a5 = +[NSError errorWithDomain:@"com.apple.iWork.Compatibility.CFIImport" code:0 userInfo:v20];
    goto LABEL_22;
  }
  return 0;
}

@end