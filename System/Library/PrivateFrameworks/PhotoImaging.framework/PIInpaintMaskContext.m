@interface PIInpaintMaskContext
+ (id)_createSubjectMaskFromBuffer:(id)a3 digest:(id)a4 ciContext:(id)a5 fullImageSize:(id)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoKeyFrameTime;
- ($FD18CD26FAB5729647810B74E671536E)fullImageExtent;
- (CIContext)ciContext;
- (NSArray)detectedFaces;
- (NSString)assetIdentifier;
- (NSString)requestID;
- (NUDigest)subjectMaskDigest;
- (NUVisionInstanceSegmentationResult)segmentationResult;
- (PIInpaintMask)subjectMask;
- (PIInpaintMaskContext)initWithSegmentationResult:(id)a3 composition:(id)a4 subjectMaskBuffer:(id)a5 detectedFaces:(id)a6 fullImageExtent:(id *)a7 assetIdentifier:(id)a8 requestID:(id)a9 initialSensitivityScore:(double)a10 livePhotoKeyFrameTime:(id *)a11;
- (double)initialSensitivityScore;
- (id)_foregroundOperationsFromComposition:(id)a3 subjectMaskBuffer:(id)a4;
- (id)debugDescription;
- (id)subjectMaskDigestForComposition:(id)a3 subjectMaskBuffer:(id)a4;
- (void)_resetForComposition:(id)a3 requestID:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)_updatePropertiesFromContext:(id)a3;
- (void)setLivePhotoKeyFrameTime:(id *)a3;
- (void)setSubjectMask:(id)a3;
- (void)setSubjectMaskDigest:(id)a3;
- (void)updateSubjectMaskBufferIfNeededForComposition:(id)a3 digest:(id)a4 completionQueue:(id)a5 completion:(id)a6;
@end

@implementation PIInpaintMaskContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ciContext, 0);
  objc_storeStrong((id *)&self->_subjectMaskDigest, 0);
  objc_storeStrong((id *)&self->_subjectMask, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
  objc_storeStrong((id *)&self->_segmentationResult, 0);
}

- (void)setLivePhotoKeyFrameTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoKeyFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoKeyFrameTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoKeyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (CIContext)ciContext
{
  return self->_ciContext;
}

- (void)setSubjectMaskDigest:(id)a3
{
}

- (NUDigest)subjectMaskDigest
{
  return (NUDigest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubjectMask:(id)a3
{
}

- (PIInpaintMask)subjectMask
{
  return (PIInpaintMask *)objc_getProperty(self, a2, 48, 1);
}

- (double)initialSensitivityScore
{
  return self->_initialSensitivityScore;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- ($FD18CD26FAB5729647810B74E671536E)fullImageExtent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[3].var1;
  retstr->var0 = self[3].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- (NSArray)detectedFaces
{
  return self->_detectedFaces;
}

- (NUVisionInstanceSegmentationResult)segmentationResult
{
  return self->_segmentationResult;
}

- (void)_updatePropertiesFromContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 segmentationResult];
  segmentationResult = self->_segmentationResult;
  self->_segmentationResult = v5;

  v7 = [v4 subjectMask];
  subjectMask = self->_subjectMask;
  self->_subjectMask = v7;

  v9 = [v4 subjectMaskDigest];
  subjectMaskDigest = self->_subjectMaskDigest;
  self->_subjectMaskDigest = v9;

  v11 = [v4 detectedFaces];
  detectedFaces = self->_detectedFaces;
  self->_detectedFaces = v11;

  if (v4)
  {
    [v4 fullImageExtent];
  }
  else
  {
    $86B46DF249C2B4242DBB096758D29184 v17 = ($86B46DF249C2B4242DBB096758D29184)0;
    $5BB7312FFE32F1AB3F1F5957C99A58B3 v19 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)0;
  }
  self->_fullImageExtent.origin = v17;
  self->_fullImageExtent.size = v19;
  objc_msgSend(v4, "assetIdentifier", v17, v19.width);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetIdentifier = self->_assetIdentifier;
  self->_assetIdentifier = v13;

  if (v4)
  {
    [v4 livePhotoKeyFrameTime];
  }
  else
  {
    long long v18 = 0uLL;
    int64_t v20 = 0;
  }
  *(_OWORD *)&self->_livePhotoKeyFrameTime.value = v18;
  self->_livePhotoKeyFrameTime.epoch = v20;
  objc_msgSend(v4, "ciContext", v18, v20);
  v15 = (CIContext *)objc_claimAutoreleasedReturnValue();
  ciContext = self->_ciContext;
  self->_ciContext = v15;
}

- (void)_resetForComposition:(id)a3 requestID:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v8 = a6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PIInpaintMaskContext__resetForComposition_requestID_completionQueue_completion___block_invoke;
  v10[3] = &unk_1E5D7FE48;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  +[PIObjectRemoval createMaskContextForComposition:a3 requestID:0 completionQueue:MEMORY[0x1E4F14428] completion:v10];
}

void __82__PIInpaintMaskContext__resetForComposition_requestID_completionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) _updatePropertiesFromContext:v7];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, uint64_t, id))(v6 + 16))(v6, *(void *)(a1 + 32), 1, v5);
  }
}

- (void)updateSubjectMaskBufferIfNeededForComposition:(id)a3 digest:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(PIInpaintMaskContext *)self subjectMaskDigest];
  v15 = [v14 stringValue];
  v16 = [v11 stringValue];
  char v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    if (v13) {
      (*((void (**)(id, PIInpaintMaskContext *, void, void))v13 + 2))(v13, self, 0, 0);
    }
  }
  else
  {
    [(PIInpaintMaskContext *)self setSubjectMaskDigest:v11];
    long long v18 = +[PIPhotoEditHelper pipelineFiltersForPostInpaintSegmentation];
    [MEMORY[0x1E4F7A648] begin];
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__11870;
    v43[4] = __Block_byref_object_dispose__11871;
    id v44 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__11870;
    v41[4] = __Block_byref_object_dispose__11871;
    id v42 = 0;
    $5BB7312FFE32F1AB3F1F5957C99A58B3 v19 = (void *)[objc_alloc(MEMORY[0x1E4F7A728]) initWithComposition:v10];
    [v19 setPipelineFilters:v18];
    [v19 setResponseQueue:v12];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __104__PIInpaintMaskContext_updateSubjectMaskBufferIfNeededForComposition_digest_completionQueue_completion___block_invoke;
    v40[3] = &unk_1E5D7FDF8;
    v40[4] = v43;
    v40[5] = v41;
    [v19 submit:v40];
    id v26 = v10;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__11870;
    v38[4] = __Block_byref_object_dispose__11871;
    id v39 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__11870;
    v36[4] = __Block_byref_object_dispose__11871;
    id v37 = 0;
    int64_t v20 = +[PIFaceObservationCache faceRequestWithRequest:v19];
    [v20 setPipelineFilters:v18];
    [v20 setResponseQueue:v12];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __104__PIInpaintMaskContext_updateSubjectMaskBufferIfNeededForComposition_digest_completionQueue_completion___block_invoke_2;
    v35[3] = &unk_1E5D7FDF8;
    v35[4] = v38;
    v35[5] = v36;
    [v20 submit:v35];
    v21 = [PIPerfPowerService alloc];
    v22 = +[PIPerfPowerServiceIdentifier genEditIdentifier];
    v23 = [(PIPerfPowerService *)v21 initWithIdentifier:v22 operation:4];

    [(PIPerfPowerService *)v23 beginMeasuring];
    v24 = (void *)MEMORY[0x1E4F7A648];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __104__PIInpaintMaskContext_updateSubjectMaskBufferIfNeededForComposition_digest_completionQueue_completion___block_invoke_3;
    v27[3] = &unk_1E5D7FE20;
    v25 = v23;
    v31 = v43;
    v32 = v41;
    v28 = v25;
    v29 = self;
    id v30 = v13;
    v33 = v38;
    v34 = v36;
    [v24 commitAndNotifyOnQueue:v12 withBlock:v27];

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v43, 8);

    id v10 = v26;
  }
}

void __104__PIInpaintMaskContext_updateSubjectMaskBufferIfNeededForComposition_digest_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __104__PIInpaintMaskContext_updateSubjectMaskBufferIfNeededForComposition_digest_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [a2 result:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __104__PIInpaintMaskContext_updateSubjectMaskBufferIfNeededForComposition_digest_completionQueue_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) endMeasuring];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v2)
  {
    uint64_t v3 = [v2 foregroundInstances];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v6 = [v5 foregroundInstances];
      id v7 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id obj = 0;
      id v8 = (void *)[v5 newMaskForInstances:v6 error:&obj];
      objc_storeStrong(v7, obj);
    }
    else
    {
      id v8 = 0;
    }
    id v11 = [*(id *)(a1 + 40) subjectMaskDigest];
    id v12 = [*(id *)(a1 + 40) ciContext];
    id v13 = *(void **)(a1 + 40);
    if (v13)
    {
      [v13 fullImageExtent];
      uint64_t v15 = *((void *)&v23 + 1);
      uint64_t v14 = v23;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
    }
    v16 = +[PIInpaintMaskContext _createSubjectMaskFromBuffer:digest:ciContext:fullImageSize:](PIInpaintMaskContext, "_createSubjectMaskFromBuffer:digest:ciContext:fullImageSize:", v8, v11, v12, v14, v15, v22, v23);
    [*(id *)(a1 + 40) setSubjectMask:v16];

    char v17 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v17)
    {
      uint64_t v18 = [v17 faces];
      uint64_t v19 = *(void *)(a1 + 40);
      int64_t v20 = *(void **)(v19 + 16);
      *(void *)(v19 + 16) = v18;

      uint64_t result = *(void *)(a1 + 48);
      if (!result) {
        return result;
      }
      v21 = *(uint64_t (**)(void))(result + 16);
    }
    else
    {
      uint64_t result = *(void *)(a1 + 48);
      if (!result) {
        return result;
      }
      v21 = *(uint64_t (**)(void))(result + 16);
    }
    return v21();
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v10 = *(uint64_t (**)(void))(result + 16);
      return v10();
    }
  }
  return result;
}

- (id)debugDescription
{
  v2 = NSString;
  uint64_t v3 = [(PIInpaintMaskContext *)self segmentationResult];
  uint64_t v4 = [v3 instances];
  uint64_t v5 = [v2 stringWithFormat:@"PIInpaintMaskContext with instance segments: %@", v4];

  return v5;
}

- (PIInpaintMaskContext)initWithSegmentationResult:(id)a3 composition:(id)a4 subjectMaskBuffer:(id)a5 detectedFaces:(id)a6 fullImageExtent:(id *)a7 assetIdentifier:(id)a8 requestID:(id)a9 initialSensitivityScore:(double)a10 livePhotoKeyFrameTime:(id *)a11
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  v43.receiver = self;
  v43.super_class = (Class)PIInpaintMaskContext;
  id v23 = a4;
  v24 = [(PIInpaintMaskContext *)&v43 init];
  v25 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v26 = *MEMORY[0x1E4F1E208];
  v44[0] = *MEMORY[0x1E4F1E1E0];
  v44[1] = v26;
  v45[0] = MEMORY[0x1E4F1CC28];
  v45[1] = @"PIInpaintMaskContext";
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
  uint64_t v28 = [v25 contextWithOptions:v27];
  v29 = (void *)*((void *)v24 + 8);
  *((void *)v24 + 8) = v28;

  objc_storeStrong((id *)v24 + 1, a3);
  uint64_t v30 = [v24 subjectMaskDigestForComposition:v23 subjectMaskBuffer:v19];

  v31 = (void *)*((void *)v24 + 7);
  *((void *)v24 + 7) = v30;

  if (v19)
  {
    uint64_t v32 = +[PIInpaintMaskContext _createSubjectMaskFromBuffer:digest:ciContext:fullImageSize:](PIInpaintMaskContext, "_createSubjectMaskFromBuffer:digest:ciContext:fullImageSize:", v19, *((void *)v24 + 7), *((void *)v24 + 8), a7->var1.var0, a7->var1.var1);
    v33 = (void *)*((void *)v24 + 6);
    *((void *)v24 + 6) = v32;
  }
  v34 = (void *)*((void *)v24 + 2);
  *((void *)v24 + 2) = v20;
  id v35 = v20;

  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a7->var1;
  *((_OWORD *)v24 + 6) = a7->var0;
  *(($0AC6E346AE4835514AAA8AC86D8F4844 *)v24 + 7) = var1;
  id v37 = (void *)*((void *)v24 + 3);
  *((void *)v24 + 3) = v21;
  id v38 = v21;

  id v39 = (void *)*((void *)v24 + 4);
  *((void *)v24 + 4) = v22;

  *((double *)v24 + 5) = a10;
  long long v40 = *(_OWORD *)&a11->var0;
  *((void *)v24 + 11) = a11->var3;
  *(_OWORD *)(v24 + 72) = v40;

  return (PIInpaintMaskContext *)v24;
}

- (id)subjectMaskDigestForComposition:(id)a3 subjectMaskBuffer:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F7A428];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [(PIInpaintMaskContext *)self _foregroundOperationsFromComposition:v8 subjectMaskBuffer:v7];

  if ([v10 count]) {
    objc_msgSend(v10, "nu_updateDigest:", v9);
  }

  return v9;
}

- (id)_foregroundOperationsFromComposition:(id)a3 subjectMaskBuffer:(id)a4
{
  if (a4)
  {
    uint64_t v4 = [a3 objectForKeyedSubscript:@"inpaint"];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"operations"];
    uint64_t v6 = PFFilter();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

uint64_t __79__PIInpaintMaskContext__foregroundOperationsFromComposition_subjectMaskBuffer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[PIObjectRemoval _instancesForOperation:v3];
  if ([v4 count])
  {
    uint64_t v5 = [*(id *)(a1 + 32) segmentationResult];
    uint64_t v6 = [v5 foregroundInstances];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__PIInpaintMaskContext__foregroundOperationsFromComposition_subjectMaskBuffer___block_invoke_2;
    v10[3] = &unk_1E5D7FDA8;
    id v11 = v4;
    id v7 = [(PIInpaintOperation *)v6 indexesPassingTest:v10];
    uint64_t v8 = [v7 count] != 0;
  }
  else
  {
    uint64_t v6 = [[PIInpaintOperation alloc] initWithDictionary:v3];
    uint64_t v8 = [(PIInpaintOperation *)v6 hasExclusionMask] ^ 1;
  }

  return v8;
}

uint64_t __79__PIInpaintMaskContext__foregroundOperationsFromComposition_subjectMaskBuffer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2];
}

+ (id)_createSubjectMaskFromBuffer:(id)a3 digest:(id)a4 ciContext:(id)a5 fullImageSize:(id)a6
{
  id v8 = a3;
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F7A560];
    id v10 = a4;
    id v11 = [v9 propertiesForMask:v8 context:a5];
    [v8 size];
    uint64_t v12 = NUScaleMake();
    uint64_t v14 = v13;
    uint64_t v15 = [v10 stringValue];

    v16 = [@"subject-" stringByAppendingString:v15];

    char v17 = [PIInpaintMask alloc];
    if (v11) {
      [v11 bounds];
    }
    else {
      memset(v20, 0, sizeof(v20));
    }
    uint64_t v18 = -[PIInpaintMask initWithBuffer:identifier:extent:scale:](v17, "initWithBuffer:identifier:extent:scale:", v8, v16, v20, v12, v14);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

@end