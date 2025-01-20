@interface VIService
+ (unint64_t)parseFlowCacheVersion;
- (BOOL)isEligibleForEncryptedSearchWithCachedResults:(id)a3;
- (CGSize)targetImageSizeForInputImageSize:(CGSize)a3;
- (VIService)init;
- (VIService)initWithNetworkTimeoutInterval:(int64_t)a3;
- (VIService)initWithTrialOverrideType:(id)a3 namespaces:(id)a4 factors:(id)a5 values:(id)a6;
- (id)detectWithImage:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5;
- (id)detectorModelDescriptions;
- (id)encryptedSearchWithParsedVisualQuery:(id)a3 completion:(id)a4;
- (id)encryptedSearchWithParsedVisualQuery:(id)a3 domain:(id)a4 completion:(id)a5;
- (id)experimentalSearchWithParsedVisualQuery:(id)a3 completion:(id)a4;
- (id)generateCachedResultsWithDetectorOutputs:(id)a3 imageSize:(CGSize)a4 orientation:(unsigned int)a5 normalizedRegionOfInterest:(CGRect)a6;
- (id)getEncryptedSearchDomainsWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5;
- (id)lookupTextWithQuery:(id)a3 completion:(id)a4;
- (id)newStreamingSession;
- (id)ontologyGraph;
- (id)parseCameraFrameWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5;
- (id)parseCameraFrameWithVisualQuery:(id)a3 completion:(id)a4;
- (id)parseWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5;
- (id)parseWithVisualQuery:(id)a3 completion:(id)a4;
- (id)pegasusPayloadWithParsedVisualQuery:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)refineRegionsWithRequest:(id)a3 error:(id *)a4;
- (id)searchCameraFrameWithParsedVisualQuery:(id)a3 completion:(id)a4;
- (id)searchWithParsedVisualQuery:(id)a3 completion:(id)a4;
- (id)searchWithVisualQuery:(id)a3 completion:(id)a4;
- (id)submitUserFeedback:(id)a3 completion:(id)a4;
- (void)clearCacheWithOption:(int64_t)a3;
@end

@implementation VIService

- (VIService)init
{
  v8.receiver = self;
  v8.super_class = (Class)VIService;
  v2 = [(VIService *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    compatService = v2->_compatService;
    v2->_compatService = (_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible *)v3;

    uint64_t v5 = objc_opt_new();
    textLookupFlow = v2->_textLookupFlow;
    v2->_textLookupFlow = (_TtC18VisualIntelligence26VITextLookupFlowCompatible *)v5;
  }
  return v2;
}

- (VIService)initWithNetworkTimeoutInterval:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VIService;
  v4 = [(VIService *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [[_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible alloc] initWithTimeoutInterval:a3];
    compatService = v4->_compatService;
    v4->_compatService = v5;

    uint64_t v7 = objc_opt_new();
    textLookupFlow = v4->_textLookupFlow;
    v4->_textLookupFlow = (_TtC18VisualIntelligence26VITextLookupFlowCompatible *)v7;
  }
  return v4;
}

- (VIService)initWithTrialOverrideType:(id)a3 namespaces:(id)a4 factors:(id)a5 values:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VIService;
  v14 = [(VIService *)&v20 init];
  if (v14)
  {
    v15 = [[_TtC18VisualIntelligence35VisualIntelligenceServiceCompatible alloc] initWithOverrideTrialTypes:v10 namespaces:v11 factors:v12 values:v13];
    compatService = v14->_compatService;
    v14->_compatService = v15;

    uint64_t v17 = objc_opt_new();
    textLookupFlow = v14->_textLookupFlow;
    v14->_textLookupFlow = (_TtC18VisualIntelligence26VITextLookupFlowCompatible *)v17;
  }
  return v14;
}

- (CGSize)targetImageSizeForInputImageSize:(CGSize)a3
{
  -[VisualIntelligenceServiceCompatible targetImageSizeWithInputImageSize:](self->_compatService, "targetImageSizeWithInputImageSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)parseWithVisualQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    compatService = self->_compatService;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__VIService_parseWithVisualQuery_completion___block_invoke;
    v13[3] = &unk_1E6CB18F0;
    id v14 = v7;
    id v10 = [(VisualIntelligenceServiceCompatible *)compatService parseWithVisualQuery:v6 completion:v13];
  }
  else
  {
    if (v7)
    {
      id v11 = _VIServiceNilInputError();
      ((void (**)(void, void, void *))v8)[2](v8, 0, v11);
    }
    id v10 = 0;
  }

  return v10;
}

uint64_t __45__VIService_parseWithVisualQuery_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)parseWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void, void))v10;
  if (v8)
  {
    compatService = self->_compatService;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__VIService_parseWithVisualQuery_cachedResults_completion___block_invoke;
    v16[3] = &unk_1E6CB1918;
    id v17 = v10;
    id v13 = [(VisualIntelligenceServiceCompatible *)compatService parseCachedWithVisualQuery:v8 cachedResults:v9 completion:v16];
  }
  else
  {
    if (v10)
    {
      id v14 = _VIServiceNilInputError();
      ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v14);
    }
    id v13 = 0;
  }

  return v13;
}

uint64_t __59__VIService_parseWithVisualQuery_cachedResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)searchWithParsedVisualQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    compatService = self->_compatService;
    id v10 = [v6 image];
    id v11 = [v6 visualUnderstanding];
    id v12 = [v6 queryContext];
    id v13 = [(VisualIntelligenceServiceCompatible *)compatService searchWithImage:v10 visualUnderstanding:v11 queryContext:v12 completion:v8];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = +[VISearchResult empty];
    id v11 = _VIServiceNilInputError();
    ((void (**)(void, void *, void *))v8)[2](v8, v10, v11);
    id v13 = 0;
    goto LABEL_5;
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (id)detectorModelDescriptions
{
  return [(VisualIntelligenceServiceCompatible *)self->_compatService detectorModelDescriptions];
}

- (id)generateCachedResultsWithDetectorOutputs:(id)a3 imageSize:(CGSize)a4 orientation:(unsigned int)a5 normalizedRegionOfInterest:(CGRect)a6
{
  return -[VisualIntelligenceServiceCompatible generateCachedResultsWithDetectorOutputs:imageSize:imageOrientation:normalizedRegionOfInterest:](self->_compatService, "generateCachedResultsWithDetectorOutputs:imageSize:imageOrientation:normalizedRegionOfInterest:", a3, *(void *)&a5, a4.width, a4.height, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (id)parseCameraFrameWithVisualQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    compatService = self->_compatService;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__VIService_parseCameraFrameWithVisualQuery_completion___block_invoke;
    v13[3] = &unk_1E6CB18F0;
    id v14 = v7;
    id v10 = [(VisualIntelligenceServiceCompatible *)compatService parseCameraFrameWithVisualQuery:v6 completion:v13];
  }
  else
  {
    if (v7)
    {
      id v11 = _VIServiceNilInputError();
      ((void (**)(void, void, void *))v8)[2](v8, 0, v11);
    }
    id v10 = 0;
  }

  return v10;
}

uint64_t __56__VIService_parseCameraFrameWithVisualQuery_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)parseCameraFrameWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void, void))v10;
  if (v8)
  {
    compatService = self->_compatService;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__VIService_parseCameraFrameWithVisualQuery_cachedResults_completion___block_invoke;
    v16[3] = &unk_1E6CB1918;
    id v17 = v10;
    id v13 = [(VisualIntelligenceServiceCompatible *)compatService parseCameraFrameCachedWithVisualQuery:v8 cachedResults:v9 completion:v16];
  }
  else
  {
    if (v10)
    {
      id v14 = _VIServiceNilInputError();
      ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v14);
    }
    id v13 = 0;
  }

  return v13;
}

uint64_t __70__VIService_parseCameraFrameWithVisualQuery_cachedResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)searchCameraFrameWithParsedVisualQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    compatService = self->_compatService;
    id v10 = [v6 image];
    id v11 = [v6 visualUnderstanding];
    id v12 = [v6 queryContext];
    id v13 = [(VisualIntelligenceServiceCompatible *)compatService searchCameraFrameWithImage:v10 visualUnderstanding:v11 queryContext:v12 completion:v8];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = +[VISearchResult empty];
    id v11 = _VIServiceNilInputError();
    ((void (**)(void, void *, void *))v8)[2](v8, v10, v11);
    id v13 = 0;
    goto LABEL_5;
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (id)experimentalSearchWithParsedVisualQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    compatService = self->_compatService;
    id v10 = [v6 image];
    id v11 = [v6 visualUnderstanding];
    id v12 = [v6 queryContext];
    id v13 = [(VisualIntelligenceServiceCompatible *)compatService experimentalSearchWithImage:v10 visualUnderstanding:v11 queryContext:v12 completion:v8];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = +[VISearchResult empty];
    id v11 = _VIServiceNilInputError();
    ((void (**)(void, void *, void *))v8)[2](v8, v10, v11);
    id v13 = 0;
    goto LABEL_5;
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (id)encryptedSearchWithParsedVisualQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    compatService = self->_compatService;
    id v10 = [v6 image];
    id v11 = [v6 visualUnderstanding];
    id v12 = [v6 queryContext];
    id v13 = [(VisualIntelligenceServiceCompatible *)compatService encryptedSearchWithImage:v10 visualUnderstanding:v11 queryContext:v12 completion:v8];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    id v10 = +[VISearchResult empty];
    id v11 = _VIServiceNilInputError();
    ((void (**)(void, void *, void *))v8)[2](v8, v10, v11);
    id v13 = 0;
    goto LABEL_5;
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (id)encryptedSearchWithParsedVisualQuery:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    compatService = self->_compatService;
    id v13 = [v8 image];
    id v14 = [v8 visualUnderstanding];
    v15 = [v8 queryContext];
    v16 = [(VisualIntelligenceServiceCompatible *)compatService encryptedSearchWithImage:v13 visualUnderstanding:v14 queryContext:v15 domain:v9 completion:v11];

LABEL_5:
    goto LABEL_6;
  }
  if (v10)
  {
    id v13 = +[VISearchResult empty];
    id v14 = _VIServiceNilInputError();
    ((void (**)(void, void *, void *))v11)[2](v11, v13, v14);
    v16 = 0;
    goto LABEL_5;
  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)isEligibleForEncryptedSearchWithCachedResults:(id)a3
{
  return !a3
      || -[VisualIntelligenceServiceCompatible isEligibleForEncryptedSearchWithCachedResults:](self->_compatService, "isEligibleForEncryptedSearchWithCachedResults:");
}

- (id)getEncryptedSearchDomainsWithVisualQuery:(id)a3 cachedResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void, void))v10;
  if (v8)
  {
    compatService = self->_compatService;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__VIService_getEncryptedSearchDomainsWithVisualQuery_cachedResults_completion___block_invoke;
    v16[3] = &unk_1E6CB1940;
    id v17 = v10;
    id v13 = [(VisualIntelligenceServiceCompatible *)compatService getEncryptedSearchDomainsWithVisualQuery:v8 cachedResults:v9 completion:v16];
  }
  else
  {
    if (v10)
    {
      id v14 = _VIServiceNilInputError();
      ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v14);
    }
    id v13 = 0;
  }

  return v13;
}

uint64_t __79__VIService_getEncryptedSearchDomainsWithVisualQuery_cachedResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)searchWithVisualQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    id v9 = [(VisualIntelligenceServiceCompatible *)self->_compatService searchWithVisualQuery:v6 completion:v7];
  }
  else
  {
    if (v7)
    {
      id v10 = +[VISearchResult empty];
      id v11 = _VIServiceNilInputError();
      ((void (**)(void, void *, void *))v8)[2](v8, v10, v11);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)pegasusPayloadWithParsedVisualQuery:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    compatService = self->_compatService;
    id v11 = [v8 image];
    id v12 = [v9 visualUnderstanding];
    id v13 = [v9 queryContext];
    id v14 = [(VisualIntelligenceServiceCompatible *)compatService pegasusPayloadDataWithImage:v11 visualUnderstanding:v12 queryContext:v13 options:a4 error:a5];
  }
  else if (a5)
  {
    _VIServiceNilInputError();
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)lookupTextWithQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    id v9 = [(VITextLookupFlowCompatible *)self->_textLookupFlow lookupTextWithQuery:v6 completion:v7];
  }
  else
  {
    if (v7)
    {
      id v10 = _VIServiceNilInputError();
      ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)submitUserFeedback:(id)a3 completion:(id)a4
{
  return [(VisualIntelligenceServiceCompatible *)self->_compatService submitUserFeedbackWithUserFeedback:a3 completion:a4];
}

- (id)ontologyGraph
{
  double v3 = [VIOntologyGraph alloc];
  double v4 = [(VisualIntelligenceServiceCompatible *)self->_compatService ontologyGraph];
  uint64_t v5 = [(VIOntologyGraph *)v3 initWithOntologyGraph:v4];

  return v5;
}

- (id)detectWithImage:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  return -[VisualIntelligenceServiceCompatible detectWithImage:regionOfInterest:error:](self->_compatService, "detectWithImage:regionOfInterest:error:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)clearCacheWithOption:(int64_t)a3
{
}

+ (unint64_t)parseFlowCacheVersion
{
  return +[VisualIntelligenceServiceCompatible parseFlowCacheVersion];
}

- (id)newStreamingSession
{
  double v3 = [VIStreamingSession alloc];
  compatService = self->_compatService;
  return [(VIStreamingSession *)v3 initWithCompatService:compatService];
}

- (id)refineRegionsWithRequest:(id)a3 error:(id *)a4
{
  return [(VisualIntelligenceServiceCompatible *)self->_compatService refineRegionsWithRequest:a3 error:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLookupFlow, 0);
  objc_storeStrong((id *)&self->_compatService, 0);
}

@end