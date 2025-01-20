@interface CRLMultipleImporterHelper
- (BOOL)allImportersHaveGivenCompatibilityResponse;
- (CRLMultipleImporterHelper)initWithImporters:(id)a3;
- (NSArray)importers;
- (int64_t)mediaTypeForConversion;
- (int64_t)reasonsForMediaConversion;
- (unint64_t)numberOfImportersRequiringCompatibilityConversion;
- (void)completeImportWithCompatibilityOnAllDevices:(BOOL)a3 allowHEVCContent:(BOOL)a4;
- (void)importer:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6;
- (void)mediaCompatibilityCheckHasBeenHandledForImporter:(id)a3;
@end

@implementation CRLMultipleImporterHelper

- (CRLMultipleImporterHelper)initWithImporters:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLMultipleImporterHelper;
  v5 = [(CRLMultipleImporterHelper *)&v11 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    importers = v5->_importers;
    v5->_importers = v6;

    v8 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v4];
    importersNeedingToRequestMediaCompatibilityRequirement = v5->_importersNeedingToRequestMediaCompatibilityRequirement;
    v5->_importersNeedingToRequestMediaCompatibilityRequirement = v8;
  }
  return v5;
}

- (BOOL)allImportersHaveGivenCompatibilityResponse
{
  return [(NSMutableSet *)self->_importersNeedingToRequestMediaCompatibilityRequirement count] == 0;
}

- (unint64_t)numberOfImportersRequiringCompatibilityConversion
{
  return [(NSMapTable *)self->_mediaCompatibilityRequirementReplyBlocksForImporters count];
}

- (void)importer:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v17 = a3;
  id v10 = a6;
  mediaCompatibilityRequirementReplyBlocksForImporters = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
  if (!mediaCompatibilityRequirementReplyBlocksForImporters)
  {
    v12 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:-[NSArray count](self->_importers, "count")];
    v13 = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
    self->_mediaCompatibilityRequirementReplyBlocksForImporters = v12;

    mediaCompatibilityRequirementReplyBlocksForImporters = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
  }
  id v14 = [v10 copy];
  [(NSMapTable *)mediaCompatibilityRequirementReplyBlocksForImporters setObject:v14 forKey:v17];

  int64_t v15 = sub_10026ABA8(self->_mediaTypesRequestingConversion, a5);
  int64_t v16 = self->_reasonsForMediaConversion | a4;
  self->_mediaTypesRequestingConversion = v15;
  self->_reasonsForMediaConversion = v16;
}

- (void)mediaCompatibilityCheckHasBeenHandledForImporter:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_importersNeedingToRequestMediaCompatibilityRequirement containsObject:v4] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3318);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D280();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3338);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleImporterHelper mediaCompatibilityCheckHasBeenHandledForImporter:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleImporterHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:55 isFatal:0 description:"Importer compatibility check is being handled for an importer not in the list."];
  }
  [(NSMutableSet *)self->_importersNeedingToRequestMediaCompatibilityRequirement removeObject:v4];
}

- (void)completeImportWithCompatibilityOnAllDevices:(BOOL)a3 allowHEVCContent:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(CRLMultipleImporterHelper *)self allImportersHaveGivenCompatibilityResponse])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3358);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D314();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3378);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMultipleImporterHelper completeImportWithCompatibilityOnAllDevices:allowHEVCContent:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMultipleImporterHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:61 isFatal:0 description:"Should not attempt to complete compatibility logic if not all importers have provided a compatibility response!"];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_mediaCompatibilityRequirementReplyBlocksForImporters;
  id v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSMapTable objectForKey:](self->_mediaCompatibilityRequirementReplyBlocksForImporters, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        int64_t v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        v15[2](v15, v5, v4);
      }
      id v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(NSMapTable *)self->_mediaCompatibilityRequirementReplyBlocksForImporters removeAllObjects];
  self->_mediaTypesRequestingConversion = 0;
  self->_reasonsForMediaConversion = 0;
}

- (NSArray)importers
{
  return self->_importers;
}

- (int64_t)mediaTypeForConversion
{
  return self->_mediaTypesRequestingConversion;
}

- (int64_t)reasonsForMediaConversion
{
  return self->_reasonsForMediaConversion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importers, 0);
  objc_storeStrong((id *)&self->_mediaCompatibilityRequirementReplyBlocksForImporters, 0);

  objc_storeStrong((id *)&self->_importersNeedingToRequestMediaCompatibilityRequirement, 0);
}

@end