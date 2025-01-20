@interface PIPerspectiveAutoCalculator
+ (void)requestVisionCleanUp;
+ (void)undoOrientation:(int64_t)a3 forPitch:(double *)a4 yaw:(double *)a5 angle:(double *)a6;
- (BOOL)canGenerateNewCropRect:(id *)a3;
- (BOOL)debugFilesEnabled;
- (BOOL)disableOnFrontFacingCameraImages;
- (BOOL)disableOnPanos;
- (BOOL)hasFrontFacingCameraDimentions:(id)a3;
- (BOOL)isFrontFacingCameraImage:(id)a3 pixelSize:(id)a4;
- (BOOL)passesBuildingCheck:(id *)a3;
- (BOOL)passesConfidenceCheck:(id)a3 error:(id *)a4;
- (BOOL)passesFaceCheck:(id *)a3;
- (BOOL)passesImagePropertiesCheck:(id *)a3;
- (BOOL)passesMinimumCorrectionCheck:(id)a3 error:(id *)a4;
- (BOOL)shouldRunBuildingCheck;
- (CIImage)debugLineDetectionImage;
- (NSMutableDictionary)debugDiagnostics;
- (NSNumber)maxAutoAngle;
- (NSNumber)maxAutoPitch;
- (NSNumber)maxAutoYaw;
- (NSString)debugFilesPrefix;
- (PIFaceObservationCache)faceObservationCache;
- (PIPerspectiveAutoCalculator)initWithComposition:(id)a3;
- (double)angleSeedDegreesCCW;
- (double)maxFaceSize;
- (double)minimumAngleCorrection;
- (double)minimumConfidence;
- (double)minimumPitchCorrection;
- (double)minimumPitchCorrectionArea;
- (double)minimumYawCorrection;
- (double)minimumYawCorrectionArea;
- (float)getSizeOfAllFaces:(id)a3;
- (id)perspectiveErrorFromCoreImage:(id)a3;
- (id)primaryImageProperties:(id *)a3;
- (id)wrapAsUnexpectedError:(id)a3;
- (void)addMethodDiagnostics:(id)a3 details:(id)a4;
- (void)addMethodResultToDiagnostics:(id)a3 error:(id)a4 setYawPitchError:(BOOL)a5;
- (void)setAngleSeedDegreesCCW:(double)a3;
- (void)setDebugFilesEnabled:(BOOL)a3;
- (void)setDebugFilesPrefix:(id)a3;
- (void)setDebugLineDetectionImage:(id)a3;
- (void)setDisableOnFrontFacingCameraImages:(BOOL)a3;
- (void)setDisableOnPanos:(BOOL)a3;
- (void)setFaceObservationCache:(id)a3;
- (void)setMaxAutoAngle:(id)a3;
- (void)setMaxAutoPitch:(id)a3;
- (void)setMaxAutoYaw:(id)a3;
- (void)setMaxFaceSize:(double)a3;
- (void)setMinimumAngleCorrection:(double)a3;
- (void)setMinimumConfidence:(double)a3;
- (void)setMinimumPitchCorrection:(double)a3;
- (void)setMinimumPitchCorrectionArea:(double)a3;
- (void)setMinimumYawCorrection:(double)a3;
- (void)setMinimumYawCorrectionArea:(double)a3;
- (void)setShouldRunBuildingCheck:(BOOL)a3;
- (void)submit:(id)a3;
- (void)submitVerified:(id)a3;
- (void)writeDebugDiagnosticsToDisk;
@end

@implementation PIPerspectiveAutoCalculator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLineDetectionImage, 0);
  objc_storeStrong((id *)&self->_debugDiagnostics, 0);
  objc_storeStrong((id *)&self->_debugFilesPrefix, 0);
  objc_storeStrong((id *)&self->_maxAutoAngle, 0);
  objc_storeStrong((id *)&self->_maxAutoPitch, 0);
  objc_storeStrong((id *)&self->_maxAutoYaw, 0);
  objc_storeStrong((id *)&self->_faceObservationCache, 0);
}

- (void)setDebugLineDetectionImage:(id)a3
{
}

- (CIImage)debugLineDetectionImage
{
  return self->_debugLineDetectionImage;
}

- (NSMutableDictionary)debugDiagnostics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)setDebugFilesPrefix:(id)a3
{
}

- (NSString)debugFilesPrefix
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDebugFilesEnabled:(BOOL)a3
{
  self->_debugFilesEnabled = a3;
}

- (BOOL)debugFilesEnabled
{
  return self->_debugFilesEnabled;
}

- (void)setAngleSeedDegreesCCW:(double)a3
{
  self->_angleSeedDegreesCCW = a3;
}

- (double)angleSeedDegreesCCW
{
  return self->_angleSeedDegreesCCW;
}

- (void)setShouldRunBuildingCheck:(BOOL)a3
{
  self->_shouldRunBuildingCheck = a3;
}

- (BOOL)shouldRunBuildingCheck
{
  return self->_shouldRunBuildingCheck;
}

- (void)setDisableOnFrontFacingCameraImages:(BOOL)a3
{
  self->_disableOnFrontFacingCameraImages = a3;
}

- (BOOL)disableOnFrontFacingCameraImages
{
  return self->_disableOnFrontFacingCameraImages;
}

- (void)setDisableOnPanos:(BOOL)a3
{
  self->_disableOnPanos = a3;
}

- (BOOL)disableOnPanos
{
  return self->_disableOnPanos;
}

- (void)setMinimumYawCorrectionArea:(double)a3
{
  self->_minimumYawCorrectionArea = a3;
}

- (double)minimumYawCorrectionArea
{
  return self->_minimumYawCorrectionArea;
}

- (void)setMinimumPitchCorrectionArea:(double)a3
{
  self->_minimumPitchCorrectionArea = a3;
}

- (double)minimumPitchCorrectionArea
{
  return self->_minimumPitchCorrectionArea;
}

- (void)setMaxFaceSize:(double)a3
{
  self->_maxFaceSize = a3;
}

- (double)maxFaceSize
{
  return self->_maxFaceSize;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_minimumConfidence = a3;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumAngleCorrection:(double)a3
{
  self->_minimumAngleCorrection = a3;
}

- (double)minimumAngleCorrection
{
  return self->_minimumAngleCorrection;
}

- (void)setMinimumYawCorrection:(double)a3
{
  self->_minimumYawCorrection = a3;
}

- (double)minimumYawCorrection
{
  return self->_minimumYawCorrection;
}

- (void)setMinimumPitchCorrection:(double)a3
{
  self->_minimumPitchCorrection = a3;
}

- (double)minimumPitchCorrection
{
  return self->_minimumPitchCorrection;
}

- (void)setMaxAutoAngle:(id)a3
{
}

- (NSNumber)maxAutoAngle
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMaxAutoPitch:(id)a3
{
}

- (NSNumber)maxAutoPitch
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMaxAutoYaw:(id)a3
{
}

- (NSNumber)maxAutoYaw
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFaceObservationCache:(id)a3
{
}

- (PIFaceObservationCache)faceObservationCache
{
  return self->_faceObservationCache;
}

- (void)submitVerified:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v47 = NUAssertLogger_10928();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v66 = v48;
      _os_log_error_impl(&dword_1A9680000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v49 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v51 = NUAssertLogger_10928();
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v55 = dispatch_get_specific(*v49);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v55;
        __int16 v67 = 2114;
        v68 = v59;
        _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v52)
    {
      v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v54;
      _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = (void (**)(void, void))v4;
  id v63 = 0;
  BOOL v6 = [(PIPerspectiveAutoCalculator *)self canGenerateNewCropRect:&v63];
  id v7 = v63;
  [(PIPerspectiveAutoCalculator *)self addMethodResultToDiagnostics:@"canGenerateNewCropRect" error:v7 setYawPitchError:1];
  if (!v6 || v7)
  {
    [(PIPerspectiveAutoCalculator *)self writeDebugDiagnosticsToDisk];
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
    ((void (**)(void, id))v5)[2](v5, v8);
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = NSNumber;
    [MEMORY[0x1E4F7A418] defaultFocalLength];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    [v8 setObject:v10 forKeyedSubscript:@"focalLength"];

    [v8 setObject:@"v2" forKeyedSubscript:@"version"];
    v11 = [(PIPerspectiveAutoCalculator *)self maxAutoPitch];

    if (v11)
    {
      v12 = NSNumber;
      v13 = [(PIPerspectiveAutoCalculator *)self maxAutoPitch];
      [v13 floatValue];
      v15 = [v12 numberWithDouble:v14 * 3.14159265 / 180.0];
      [v8 setObject:v15 forKeyedSubscript:@"pitchLimit"];
    }
    v16 = [(PIPerspectiveAutoCalculator *)self maxAutoYaw];

    if (v16)
    {
      v17 = NSNumber;
      v18 = [(PIPerspectiveAutoCalculator *)self maxAutoYaw];
      [v18 floatValue];
      v20 = [v17 numberWithDouble:v19 * 3.14159265 / 180.0];
      [v8 setObject:v20 forKeyedSubscript:@"yawLimit"];
    }
    v21 = [(PIPerspectiveAutoCalculator *)self maxAutoAngle];

    if (v21)
    {
      v22 = NSNumber;
      v23 = [(PIPerspectiveAutoCalculator *)self maxAutoAngle];
      [v23 floatValue];
      v25 = [v22 numberWithDouble:v24 * 3.14159265 / 180.0];
      [v8 setObject:v25 forKeyedSubscript:@"rollLimit"];
    }
    v26 = NSNumber;
    [(PIPerspectiveAutoCalculator *)self minimumPitchCorrectionArea];
    v27 = objc_msgSend(v26, "numberWithDouble:");
    [v8 setObject:v27 forKeyedSubscript:@"minimumPitchCorrectionArea"];

    v28 = NSNumber;
    [(PIPerspectiveAutoCalculator *)self minimumYawCorrectionArea];
    v29 = objc_msgSend(v28, "numberWithDouble:");
    [v8 setObject:v29 forKeyedSubscript:@"minimumYawCorrectionArea"];

    v30 = NSString;
    v31 = [(PIPerspectiveAutoCalculator *)self maxAutoPitch];
    v32 = [v30 stringWithFormat:@"%@", v31];
    v33 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    [v33 setObject:v32 forKeyedSubscript:@"pitchLimit"];

    v34 = NSString;
    v35 = [(PIPerspectiveAutoCalculator *)self maxAutoYaw];
    v36 = [v34 stringWithFormat:@"%@", v35];
    v37 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    [v37 setObject:v36 forKeyedSubscript:@"yawLimit"];

    v38 = NSString;
    v39 = [(PIPerspectiveAutoCalculator *)self maxAutoAngle];
    v40 = [v38 stringWithFormat:@"%@", v39];
    v41 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    [v41 setObject:v40 forKeyedSubscript:@"rollLimit"];

    v42 = (void *)[objc_alloc(MEMORY[0x1E4F7A4D8]) initWithRequest:self dataExtractor:@"CIAutoPerspective" options:v8];
    v43 = +[PIPipelineFilters exifOrientationAndCropStraightenOnly];
    v64 = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    [v42 setPipelineFilters:v44];

    v45 = [MEMORY[0x1E4F7A478] oneToOneScalePolicy];
    [v42 setScalePolicy:v45];

    [v42 setSampleMode:3];
    v46 = [(NURenderRequest *)self responseQueue];
    [v42 setResponseQueue:v46];

    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __46__PIPerspectiveAutoCalculator_submitVerified___block_invoke;
    v60[3] = &unk_1E5D81180;
    v60[4] = self;
    id v61 = 0;
    v62 = v5;
    [v42 submit:v60];
  }
}

void __46__PIPerspectiveAutoCalculator_submitVerified___block_invoke(uint64_t a1, void *a2)
{
  id v70 = 0;
  v3 = [a2 result:&v70];
  id v4 = v70;
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v6 = [v3 data];
    double v68 = 0.0;
    double v69 = 0.0;
    id v66 = 0;
    double v67 = 0.0;
    int v7 = [*(id *)(a1 + 32) passesConfidenceCheck:v6 error:&v66];
    id v8 = v66;

    [*(id *)(a1 + 32) addMethodResultToDiagnostics:@"passesConfidenceCheck" error:v8 setYawPitchError:1];
    v9 = *(void **)(a1 + 32);
    id v65 = 0;
    int v10 = [v9 passesMinimumCorrectionCheck:v6 error:&v65];
    id v11 = v65;

    [*(id *)(a1 + 32) addMethodResultToDiagnostics:@"passesMinimumCorrectionCheck" error:v11 setYawPitchError:1];
    if (v7 && v10)
    {
      v12 = [v6 objectForKeyedSubscript:@"pitchExpandTopDegrees"];
      [v12 doubleValue];
      double v68 = v13;

      float v14 = [v6 objectForKeyedSubscript:@"yawExpandLeftDegrees"];
      [v14 doubleValue];
      double v69 = v15;

      v16 = [v6 objectForKeyedSubscript:@"rollAngleInDegreesCW"];
      [v16 doubleValue];
      double v67 = v17;
    }
    if ([*(id *)(a1 + 32) debugFilesEnabled])
    {
      v18 = [v6 objectForKeyedSubscript:@"debugImage"];
      float v19 = [MEMORY[0x1E4F1CA98] null];
      char v20 = [v18 isEqual:v19];

      if ((v20 & 1) == 0)
      {
        v21 = [v6 objectForKeyedSubscript:@"debugImage"];
        [*(id *)(a1 + 32) setDebugLineDetectionImage:v21];
      }
      v22 = [v6 objectForKeyedSubscript:@"pitchCorrectionAreaCoverage"];
      v23 = [MEMORY[0x1E4F1CA98] null];
      char v24 = [v22 isEqual:v23];

      if ((v24 & 1) == 0)
      {
        v25 = [v6 objectForKeyedSubscript:@"pitchCorrectionAreaCoverage"];
        v26 = [*(id *)(a1 + 32) debugDiagnostics];
        [v26 setObject:v25 forKeyedSubscript:@"pitchCorrectionAreaCoverage"];
      }
      v27 = [v6 objectForKeyedSubscript:@"yawCorrectionAreaCoverage"];
      v28 = [MEMORY[0x1E4F1CA98] null];
      char v29 = [v27 isEqual:v28];

      if ((v29 & 1) == 0)
      {
        v30 = [v6 objectForKeyedSubscript:@"yawCorrectionAreaCoverage"];
        v31 = [*(id *)(a1 + 32) debugDiagnostics];
        [v31 setObject:v30 forKeyedSubscript:@"yawCorrectionAreaCoverage"];
      }
      v32 = [v6 objectForKeyedSubscript:@"ciPitchError"];
      char v33 = [v32 isEqual:&unk_1F0009B60];

      if ((v33 & 1) == 0)
      {
        v34 = *(void **)(a1 + 32);
        v35 = [v6 objectForKeyedSubscript:@"ciPitchError"];
        v36 = [v34 perspectiveErrorFromCoreImage:v35];
        v37 = [v36 description];
        v38 = [*(id *)(a1 + 32) debugDiagnostics];
        [v38 setObject:v37 forKeyedSubscript:@"pitchError"];
      }
      v39 = [v6 objectForKeyedSubscript:@"ciYawError"];
      char v40 = [v39 isEqual:&unk_1F0009B60];

      if ((v40 & 1) == 0)
      {
        v41 = *(void **)(a1 + 32);
        v42 = [v6 objectForKeyedSubscript:@"ciYawError"];
        v43 = [v41 perspectiveErrorFromCoreImage:v42];
        v44 = [v43 description];
        v45 = [*(id *)(a1 + 32) debugDiagnostics];
        [v45 setObject:v44 forKeyedSubscript:@"yawError"];
      }
    }
    v46 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithRequest:*(void *)(a1 + 32)];
    [v46 setName:@"PIPerspectiveAutoCalculator-getPrimaryOrientation"];
    id v64 = 0;
    v47 = [v46 submitSynchronous:&v64];
    id v4 = v64;

    if (v47)
    {
      v48 = [v47 properties];
      +[PIPerspectiveAutoCalculator undoOrientation:forPitch:yaw:angle:](PIPerspectiveAutoCalculator, "undoOrientation:forPitch:yaw:angle:", [v48 orientation], &v68, &v69, &v67);

      id v63 = v47;
      v49 = [NSNumber numberWithDouble:-v68];
      [v5 setObject:v49 forKeyedSubscript:@"pitch"];

      v50 = [NSNumber numberWithDouble:-v69];
      [v5 setObject:v50 forKeyedSubscript:@"yaw"];

      v51 = NSNumber;
      double v52 = v67;
      [*(id *)(a1 + 32) angleSeedDegreesCCW];
      v54 = [v51 numberWithDouble:v53 - v52];
      [v5 setObject:v54 forKeyedSubscript:@"angle"];

      v55 = [v5 objectForKeyedSubscript:@"pitch"];
      [*(id *)(a1 + 32) debugDiagnostics];
      id v57 = v56 = v3;
      [v57 setObject:v55 forKeyedSubscript:@"pitch"];

      v58 = [v5 objectForKeyedSubscript:@"yaw"];
      v59 = [*(id *)(a1 + 32) debugDiagnostics];
      [v59 setObject:v58 forKeyedSubscript:@"yaw"];

      v60 = [v5 objectForKeyedSubscript:@"angle"];
      id v61 = [*(id *)(a1 + 32) debugDiagnostics];
      [v61 setObject:v60 forKeyedSubscript:@"angle"];

      v3 = v56;
      v47 = v63;
      v62 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v5];
    }
    else
    {
      v62 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
      [*(id *)(a1 + 32) addMethodResultToDiagnostics:@"submitVerified" error:v4 setYawPitchError:1];
    }
    [*(id *)(a1 + 32) writeDebugDiagnosticsToDisk];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v62 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
    [*(id *)(a1 + 32) addMethodResultToDiagnostics:@"submitVerified" error:*(void *)(a1 + 40) setYawPitchError:1];
    [*(id *)(a1 + 32) writeDebugDiagnosticsToDisk];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)passesMinimumCorrectionCheck:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v26 = NUAssertLogger_10928();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v42 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v30 = NUAssertLogger_10928();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        __int16 v43 = 2114;
        v44 = v38;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v42 = v33;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  int v7 = v6;
  id v8 = [v6 objectForKeyedSubscript:@"pitchExpandTopDegrees"];
  [v8 doubleValue];
  double v10 = v9;

  id v11 = [v7 objectForKeyedSubscript:@"yawExpandLeftDegrees"];
  [v11 doubleValue];
  double v13 = v12;

  float v14 = [v7 objectForKeyedSubscript:@"rollAngleInDegreesCW"];
  [v14 doubleValue];
  double v16 = v15;

  BOOL v17 = fabs(v10) >= self->_minimumPitchCorrection
     || fabs(v13) >= self->_minimumYawCorrection
     || fabs(v16) >= self->_minimumAngleCorrection;
  v39[0] = @"minimumPitchCorrection";
  v18 = NSNumber;
  [(PIPerspectiveAutoCalculator *)self minimumPitchCorrection];
  float v19 = objc_msgSend(v18, "numberWithDouble:");
  v40[0] = v19;
  v39[1] = @"minimumYawCorrection";
  char v20 = NSNumber;
  [(PIPerspectiveAutoCalculator *)self minimumYawCorrection];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  v40[1] = v21;
  v39[2] = @"minimumAngleCorrection";
  v22 = NSNumber;
  [(PIPerspectiveAutoCalculator *)self minimumAngleCorrection];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  v40[2] = v23;
  char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  [(PIPerspectiveAutoCalculator *)self addMethodDiagnostics:@"passesMinimumCorrectionCheck" details:v24];

  if (!v17)
  {
    *a4 = [MEMORY[0x1E4F7A438] errorWithCode:4 reason:PIPerspectiveErrorLessThanMinimumCorrection object:0 underlyingError:0];
  }

  return v17;
}

- (BOOL)passesConfidenceCheck:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v22 = NUAssertLogger_10928();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    char v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v26 = NUAssertLogger_10928();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v30 = dispatch_get_specific(*v24);
        BOOL v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        char v33 = [v31 callStackSymbols];
        v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v30;
        __int16 v39 = 2114;
        char v40 = v34;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v29 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  int v7 = v6;
  id v8 = [v6 objectForKeyedSubscript:@"confidence"];
  double v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    [(PIPerspectiveAutoCalculator *)self addMethodDiagnostics:@"passesConfidenceCheck" details:&unk_1F000AD78];
LABEL_6:
    BOOL v20 = 1;
    goto LABEL_7;
  }
  id v11 = [v7 objectForKeyedSubscript:@"confidence"];
  [v11 doubleValue];
  double v13 = v12;

  [(PIPerspectiveAutoCalculator *)self minimumConfidence];
  double v15 = v14;
  v35[0] = @"confidence";
  double v16 = [NSNumber numberWithDouble:v13];
  v35[1] = @"minConfidence";
  v36[0] = v16;
  BOOL v17 = NSNumber;
  [(PIPerspectiveAutoCalculator *)self minimumConfidence];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v36[1] = v18;
  float v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [(PIPerspectiveAutoCalculator *)self addMethodDiagnostics:@"passesConfidenceCheck" details:v19];

  if (v13 >= v15) {
    goto LABEL_6;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:4 reason:PIPerspectiveErrorConfidenceTooLow object:0 underlyingError:0];
  BOOL v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v20;
}

- (BOOL)canGenerateNewCropRect:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v26 = NUAssertLogger_10928();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      BOOL v27 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v30 = NUAssertLogger_10928();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v31)
      {
        v34 = dispatch_get_specific(*v28);
        v35 = (void *)MEMORY[0x1E4F29060];
        id v36 = v34;
        v37 = [v35 callStackSymbols];
        v38 = [v37 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v34;
        __int16 v42 = 2114;
        __int16 v43 = v38;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v31)
    {
      id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v33;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = [PICompositionController alloc];
  id v6 = [(NURenderRequest *)self composition];
  int v7 = [(PICompositionController *)v5 initWithComposition:v6];

  [(PICompositionController *)v7 removeAdjustmentWithKey:@"cropStraighten"];
  id v8 = [NSNumber numberWithDouble:self->_angleSeedDegreesCCW];
  double v9 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
  [v9 setObject:v8 forKeyedSubscript:@"preseedRoll"];

  if (self->_angleSeedDegreesCCW == 0.0)
  {
    int v10 = [(PICompositionController *)v7 composition];
    [(NURenderRequest *)self setComposition:v10];

    [(PIPerspectiveAutoCalculator *)self addMethodDiagnostics:@"canGenerateNewCropRect" details:&unk_1F000AD50];
    BOOL v11 = 1;
  }
  else
  {
    double v12 = [(PIPerspectiveAutoCalculator *)self primaryImageProperties:a3];
    double v13 = v12;
    BOOL v11 = v12 != 0;
    if (v12)
    {
      [v12 size];
      NUPixelSizeToCGSize();
      double v15 = v14;
      double v17 = v16;
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A418]), "initWithMasterImageSize:", v14, v16);
      objc_msgSend(v18, "setCropRect:", 0.0, 0.0, v15, v17);
      [(PIPerspectiveAutoCalculator *)self angleSeedDegreesCCW];
      [v18 setRollAngle:v19 * 3.14159265 / 180.0 constrainCropRectWithTargetArea:v15 * v17];
      [v18 cropRect];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __54__PIPerspectiveAutoCalculator_canGenerateNewCropRect___block_invoke;
      void v39[3] = &unk_1E5D7FC38;
      v39[5] = v20;
      v39[6] = v21;
      v39[7] = v22;
      v39[8] = v23;
      v39[4] = self;
      [(PICompositionController *)v7 modifyAdjustmentWithKey:@"cropStraighten" modificationBlock:v39];
      char v24 = [(PICompositionController *)v7 composition];
      [(NURenderRequest *)self setComposition:v24];
    }
  }

  return v11;
}

void __54__PIPerspectiveAutoCalculator_canGenerateNewCropRect___block_invoke(uint64_t a1, void *a2)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  id v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  [*(id *)(a1 + 32) angleSeedDegreesCCW];
  objc_msgSend(v7, "setAngle:");
  [v7 setEnabled:1];

  id v8 = *(void **)(a1 + 32);
  id v32 = @"angle";
  double v9 = NSNumber;
  [v8 angleSeedDegreesCCW];
  int v10 = objc_msgSend(v9, "numberWithDouble:");
  v33[0] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  [v8 addMethodDiagnostics:@"canGenerateNewCropRect" details:v11];

  double v12 = *(void **)(a1 + 32);
  v30 = @"xOrigin";
  double v13 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  BOOL v31 = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  [v12 addMethodDiagnostics:@"canGenerateNewCropRect" details:v14];

  double v15 = *(void **)(a1 + 32);
  v28 = @"yOrigin";
  double v16 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  char v29 = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v15 addMethodDiagnostics:@"canGenerateNewCropRect" details:v17];

  v18 = *(void **)(a1 + 32);
  v26 = @"width";
  double v19 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  BOOL v27 = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v18 addMethodDiagnostics:@"canGenerateNewCropRect" details:v20];

  uint64_t v21 = *(void **)(a1 + 32);
  char v24 = @"height";
  uint64_t v22 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v25 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v21 addMethodDiagnostics:@"canGenerateNewCropRect" details:v23];
}

- (id)primaryImageProperties:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v13 = NUAssertLogger_10928();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v15 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v17 = NUAssertLogger_10928();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        uint64_t v21 = dispatch_get_specific(*v15);
        uint64_t v22 = (void *)MEMORY[0x1E4F29060];
        id v23 = v21;
        char v24 = [v22 callStackSymbols];
        v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        __int16 v29 = 2114;
        v30 = v25;
        _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      double v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = objc_alloc(MEMORY[0x1E4F7A520]);
  double v6 = [(NURenderRequest *)self composition];
  id v7 = (void *)[v5 initWithComposition:v6];

  [v7 setName:@"PIPerspectiveAutoCalculator-primaryImageProperties"];
  id v8 = +[PIPipelineFilters sourceFilter];
  v26 = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v7 setPipelineFilters:v9];

  int v10 = [v7 submitSynchronous:a3];
  BOOL v11 = [v10 properties];

  return v11;
}

- (void)submit:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v21 = NUAssertLogger_10928();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_10928();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        __int16 v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v32 = [v30 callStackSymbols];
        char v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v29;
        __int16 v39 = 2114;
        char v40 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = (void (**)(void, void))v4;
  id v36 = 0;
  BOOL v6 = [(PIPerspectiveAutoCalculator *)self passesImagePropertiesCheck:&v36];
  id v7 = v36;
  [(PIPerspectiveAutoCalculator *)self addMethodResultToDiagnostics:@"passesImagePropertiesCheck" error:v7 setYawPitchError:1];
  if (v6)
  {
    id v35 = 0;
    BOOL v8 = [(PIPerspectiveAutoCalculator *)self passesFaceCheck:&v35];
    id v9 = v35;

    [(PIPerspectiveAutoCalculator *)self addMethodResultToDiagnostics:@"passesFaceCheck" error:v9 setYawPitchError:1];
    if (v8)
    {
      if (![(PIPerspectiveAutoCalculator *)self shouldRunBuildingCheck])
      {
        id v7 = v9;
LABEL_14:
        [(PIPerspectiveAutoCalculator *)self submitVerified:v5];
        goto LABEL_12;
      }
      id v34 = 0;
      BOOL v10 = [(PIPerspectiveAutoCalculator *)self passesBuildingCheck:&v34];
      id v7 = v34;

      [(PIPerspectiveAutoCalculator *)self addMethodResultToDiagnostics:@"passesBuildingCheck" error:v7 setYawPitchError:1];
      if (v10) {
        goto LABEL_14;
      }
    }
    else
    {
      id v7 = v9;
    }
  }
  BOOL v11 = [v7 nonLocalizedFailureReason];
  double v12 = PIPerspectiveErrorUnexpectedRuntimeError;

  if (v11 == v12)
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v7];
  }
  else
  {
    double v13 = objc_opt_new();
    [v13 setObject:&unk_1F000A4C8 forKeyedSubscript:@"pitch"];
    [v13 setObject:&unk_1F000A4C8 forKeyedSubscript:@"yaw"];
    [v13 setObject:&unk_1F000A4C8 forKeyedSubscript:@"angle"];
    double v14 = [v13 objectForKeyedSubscript:@"pitch"];
    double v15 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    [v15 setObject:v14 forKeyedSubscript:@"pitch"];

    double v16 = [v13 objectForKeyedSubscript:@"yaw"];
    double v17 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    [v17 setObject:v16 forKeyedSubscript:@"yaw"];

    BOOL v18 = [v13 objectForKeyedSubscript:@"angle"];
    double v19 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    [v19 setObject:v18 forKeyedSubscript:@"angle"];

    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v13];
  }
  [(PIPerspectiveAutoCalculator *)self writeDebugDiagnosticsToDisk];
  ((void (**)(void, void *))v5)[2](v5, v20);

LABEL_12:
}

- (BOOL)passesBuildingCheck:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v21 = NUAssertLogger_10928();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_10928();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        __int16 v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v32 = [v30 callStackSymbols];
        char v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v29;
        __int16 v39 = 2114;
        char v40 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      BOOL v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A3F0]) initWithRequest:self];
  BOOL v6 = +[PIPipelineFilters sourceFilterNoOrientation];
  id v7 = +[PIPipelineFilters applyOrientationFilter];
  v36[0] = v6;
  v36[1] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [v5 setPipelineFilters:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:89401];
  [v5 setScalePolicy:v9];

  [v5 setSampleMode:3];
  BOOL v10 = [(NURenderRequest *)self responseQueue];
  [v5 setResponseQueue:v10];

  [v5 setName:@"PIPerspectiveAutoCalculator-classify"];
  BOOL v11 = [v5 submitGenericSynchronous:a3];
  double v12 = v11;
  if (v11)
  {
    [v11 confidence];
    double v14 = v13;
    v34[0] = @"confidence";
    double v15 = NSNumber;
    [v12 confidence];
    double v16 = objc_msgSend(v15, "numberWithFloat:");
    v34[1] = @"minConfidence";
    v35[0] = v16;
    double v17 = [NSNumber numberWithDouble:0.4];
    v35[1] = v17;
    BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

    [(PIPerspectiveAutoCalculator *)self addMethodDiagnostics:@"passesBuildingCheck" details:v18];
    BOOL v19 = v14 > 0.4;
    if (v14 <= 0.4)
    {
      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:4 reason:PIPerspectiveErrorNoBuildingDetected object:v18 underlyingError:0];
    }
  }
  else
  {
    [(PIPerspectiveAutoCalculator *)self wrapAsUnexpectedError:*a3];
    BOOL v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)passesImagePropertiesCheck:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v28 = NUAssertLogger_10928();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v29;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v30 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v32 = NUAssertLogger_10928();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        id v36 = dispatch_get_specific(*v30);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        __int16 v39 = [v37 callStackSymbols];
        char v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v36;
        __int16 v45 = 2114;
        v46 = v40;
        _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      id v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = v35;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  if (!*(_WORD *)&self->_disableOnPanos) {
    return 1;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F7A520]);
  BOOL v6 = [(NURenderRequest *)self composition];
  id v7 = (void *)[v5 initWithComposition:v6];

  BOOL v8 = [(NURenderRequest *)self responseQueue];
  [v7 setResponseQueue:v8];

  [v7 setName:@"PIPerspectiveAutoCalculator-selfieAndAspectRatioCheck"];
  id v9 = [v7 submitGenericSynchronous:a3];
  BOOL v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 properties];
    float v12 = (float)[v11 size];
    [v11 size];
    float v14 = v12 / (float)v13;
    BOOL v15 = [(PIPerspectiveAutoCalculator *)self disableOnPanos];
    BOOL v16 = v14 <= 2.0;
    if (v14 < 0.5) {
      BOOL v16 = 0;
    }
    char v17 = !v15 || v16;
    if ([(PIPerspectiveAutoCalculator *)self disableOnFrontFacingCameraImages])
    {
      BOOL v19 = [v11 metadata];
      uint64_t v20 = [v11 size];
      int v22 = !-[PIPerspectiveAutoCalculator isFrontFacingCameraImage:pixelSize:](self, "isFrontFacingCameraImage:pixelSize:", v19, v20, v21);
    }
    else
    {
      int v22 = 1;
    }
    char v27 = v17 & v22;
    v41[0] = @"aspectRatio";
    *(float *)&double v18 = v14;
    id v23 = [NSNumber numberWithFloat:v18];
    v41[1] = @"isSelfieCam";
    v42[0] = v23;
    char v24 = [NSNumber numberWithInt:v22 ^ 1u];
    v42[1] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];

    [(PIPerspectiveAutoCalculator *)self addMethodDiagnostics:@"passesImagePropertiesCheck" details:v25];
    if ((v27 & 1) == 0)
    {
      *a3 = [MEMORY[0x1E4F7A438] errorWithCode:4 reason:PIPerspectiveErrorPanoAndFFCNotSupported object:v25 underlyingError:0];
    }
  }
  else
  {
    [(PIPerspectiveAutoCalculator *)self wrapAsUnexpectedError:*a3];
    char v27 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (BOOL)isFrontFacingCameraImage:(id)a3 pixelSize:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v7 = a3;
  BOOL v8 = [v7 objectForKey:*MEMORY[0x1E4F2F800]];
  id v9 = [v8 objectForKey:*MEMORY[0x1E4F2F888]];
  BOOL v10 = [v8 objectForKey:*MEMORY[0x1E4F2F890]];
  BOOL v11 = [v10 lowercaseString];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if ([v9 isEqualToString:@"Apple"]
      && [v11 containsString:@"front"]
      && ([v11 containsString:@"camera"] & 1) != 0)
    {
      goto LABEL_13;
    }
LABEL_16:
    BOOL v16 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = [v7 objectForKey:*MEMORY[0x1E4F2FD40]];
  float v14 = v13;
  if (!v13)
  {
LABEL_15:

    goto LABEL_16;
  }
  BOOL v15 = [v13 objectForKey:*MEMORY[0x1E4F2FD60]];
  if (![v15 isEqualToString:@"Apple"]
    || !-[PIPerspectiveAutoCalculator hasFrontFacingCameraDimentions:](self, "hasFrontFacingCameraDimentions:", var0, var1))
  {

    goto LABEL_15;
  }

LABEL_13:
  BOOL v16 = 1;
LABEL_17:

  return v16;
}

- (BOOL)hasFrontFacingCameraDimentions:(id)a3
{
  if (a3.var0 == 640 && a3.var1 == 480 || a3.var0 == 480 && a3.var1 == 640 || a3.var0 == 1280 && a3.var1 == 960) {
    return 1;
  }
  return a3.var0 == 960 && a3.var1 == 1280;
}

- (BOOL)passesFaceCheck:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v21 = NUAssertLogger_10928();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v23 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v25 = NUAssertLogger_10928();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        __int16 v29 = dispatch_get_specific(*v23);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v32 = [v30 callStackSymbols];
        BOOL v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v29;
        __int16 v38 = 2114;
        __int16 v39 = v33;
        _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      char v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  if (self->_maxFaceSize < 100.0)
  {
    id v5 = +[PIFaceObservationCache faceRequestWithRequest:self];
    BOOL v6 = [(NURenderRequest *)self responseQueue];
    [v5 setResponseQueue:v6];

    [v5 setName:@"PIPerspectiveAutoCalculator-faceCheck"];
    id v7 = [(PIPerspectiveAutoCalculator *)self faceObservationCache];

    if (v7)
    {
      BOOL v8 = [(PIPerspectiveAutoCalculator *)self faceObservationCache];
      id v9 = [v8 submitSynchronous:v5 error:a3];

      if (v9)
      {
LABEL_5:
        BOOL v10 = [v9 faces];
        [(PIPerspectiveAutoCalculator *)self getSizeOfAllFaces:v10];
        float v12 = v11;

        [(PIPerspectiveAutoCalculator *)self maxFaceSize];
        v34[0] = @"faceSize";
        double v14 = v13 / 100.0;
        *(float *)&double v13 = v12;
        BOOL v15 = [NSNumber numberWithFloat:v13];
        v34[1] = @"maxFaceSize";
        v35[0] = v15;
        BOOL v16 = NSNumber;
        [(PIPerspectiveAutoCalculator *)self maxFaceSize];
        char v17 = objc_msgSend(v16, "numberWithDouble:");
        v35[1] = v17;
        double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

        [(PIPerspectiveAutoCalculator *)self addMethodDiagnostics:@"passesFaceCheck" details:v18];
        BOOL v19 = v14 >= v12;
        if (v14 < v12)
        {
          *a3 = [MEMORY[0x1E4F7A438] errorWithCode:4 reason:PIPerspectiveErrorFacesTooLarge object:v18 underlyingError:0];
        }

        goto LABEL_11;
      }
    }
    else
    {
      id v9 = [v5 submitGenericSynchronous:a3];
      if (v9) {
        goto LABEL_5;
      }
    }
    [(PIPerspectiveAutoCalculator *)self wrapAsUnexpectedError:*a3];
    BOOL v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v19;
  }
  return 1;
}

- (float)getSizeOfAllFaces:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    double v14 = NUAssertLogger_10928();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "faces != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v33 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v18 = NUAssertLogger_10928();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        int v22 = dispatch_get_specific(*v16);
        id v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        BOOL v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v33 = v22;
        __int16 v34 = 2114;
        id v35 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v33 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v4 = v3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) boundingBox];
        double v8 = v8 + v10 * v11;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
    float v12 = v8;
  }
  else
  {
    float v12 = 0.0;
  }

  return v12;
}

- (void)writeDebugDiagnosticsToDisk
{
  if ([(PIPerspectiveAutoCalculator *)self debugFilesEnabled])
  {
    id v3 = [(NURenderRequest *)self composition];
    id v4 = +[PICaptureDebugUtilities captureDebugDirectoryForComposition:v3];

    if (v4)
    {
      uint64_t v5 = NSString;
      uint64_t v6 = [(PIPerspectiveAutoCalculator *)self debugFilesPrefix];
      uint64_t v7 = [v5 stringWithFormat:@"%@PerspectiveEvaluation-txt.DBG", v6];
      double v8 = [v4 URLByAppendingPathComponent:v7];

      id v9 = NSString;
      double v10 = [(PIPerspectiveAutoCalculator *)self debugFilesPrefix];
      double v11 = [v9 stringWithFormat:@"%@PerspectiveLineDetection-png.DBG", v10];
      float v12 = [v4 URLByAppendingPathComponent:v11];

      double v13 = [(PIPerspectiveAutoCalculator *)self debugFilesPrefix];
      LODWORD(v11) = [v13 isEqualToString:@"Edit"];

      if (v11) {
        int64_t v14 = 6000000000;
      }
      else {
        int64_t v14 = 0;
      }
      dispatch_time_t v15 = dispatch_time(0, v14);
      BOOL v16 = dispatch_get_global_queue(-32768, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__PIPerspectiveAutoCalculator_writeDebugDiagnosticsToDisk__block_invoke;
      block[3] = &unk_1E5D80E00;
      id v20 = v4;
      uint64_t v21 = self;
      id v22 = v12;
      id v23 = v8;
      id v17 = v8;
      id v18 = v12;
      dispatch_after(v15, v16, block);
    }
  }
}

void __58__PIPerspectiveAutoCalculator_writeDebugDiagnosticsToDisk__block_invoke(uint64_t a1)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v20 = 0;
  [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v4 = v20;

  uint64_t v5 = [*(id *)(a1 + 40) debugLineDetectionImage];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1E018];
    uint64_t v7 = *MEMORY[0x1E4F1E208];
    v21[0] = *MEMORY[0x1E4F1E1E0];
    v21[1] = v7;
    v22[0] = MEMORY[0x1E4F1CC28];
    v22[1] = @"PIPerspectiveAutoCalculator-debug";
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v9 = [v6 contextWithOptions:v8];

    double v10 = [*(id *)(a1 + 40) debugLineDetectionImage];
    uint64_t v11 = *MEMORY[0x1E4F1E280];
    float v12 = [MEMORY[0x1E4F7A400] displayP3ColorSpace];
    uint64_t v13 = [v12 CGColorSpace];
    int64_t v14 = [v9 PNGRepresentationOfImage:v10 format:v11 colorSpace:v13 options:MEMORY[0x1E4F1CC08]];

    [v14 writeToURL:*(void *)(a1 + 48) atomically:1];
  }
  dispatch_time_t v15 = (void *)MEMORY[0x1E4F28D90];
  BOOL v16 = [*(id *)(a1 + 40) debugDiagnostics];
  id v19 = v4;
  id v17 = [v15 dataWithJSONObject:v16 options:3 error:&v19];
  id v18 = v19;

  [v17 writeToURL:*(void *)(a1 + 56) atomically:1];
}

- (id)wrapAsUnexpectedError:(id)a3
{
  return (id)[MEMORY[0x1E4F7A438] errorWithCode:7 reason:PIPerspectiveErrorUnexpectedRuntimeError object:0 underlyingError:a3];
}

- (void)addMethodResultToDiagnostics:(id)a3 error:(id)a4 setYawPitchError:(BOOL)a5
{
  BOOL v5 = a5;
  id v34 = a3;
  id v8 = a4;
  id v9 = [NSNumber numberWithInt:v8 == 0];
  double v10 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
  [v10 setObject:v9 forKeyedSubscript:v34];

  if (v8)
  {
    uint64_t v11 = [v8 nonLocalizedFailureReason];

    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F7A438] errorWithCode:7 reason:PIPerspectiveErrorUnexpectedRuntimeError object:0 underlyingError:v8];

      id v8 = (id)v12;
    }
    uint64_t v13 = [v8 nonLocalizedFailureReason];
    int64_t v14 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    dispatch_time_t v15 = [NSString stringWithFormat:@"%@.error", v34];
    [v14 setObject:v13 forKeyedSubscript:v15];

    BOOL v16 = [v8 userInfo];
    uint64_t v17 = *MEMORY[0x1E4F28A50];
    id v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v19 = [v18 description];
    id v20 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
    uint64_t v21 = [NSString stringWithFormat:@"%@.underlyingError", v34];
    [v20 setObject:v19 forKeyedSubscript:v21];

    if (v5)
    {
      id v22 = [v8 nonLocalizedFailureReason];
      id v23 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
      [v23 setObject:v22 forKeyedSubscript:@"pitchError"];

      id v24 = [v8 nonLocalizedFailureReason];
      v25 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
      [v25 setObject:v24 forKeyedSubscript:@"yawError"];

      BOOL v26 = [v8 userInfo];
      long long v27 = [v26 objectForKeyedSubscript:v17];
      long long v28 = [v27 description];
      long long v29 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
      [v29 setObject:v28 forKeyedSubscript:@"pitchError.underlyingError"];

      long long v30 = [v8 userInfo];
      id v31 = [v30 objectForKeyedSubscript:v17];
      id v32 = [v31 description];
      BOOL v33 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
      [v33 setObject:v32 forKeyedSubscript:@"yawError.underlyingError"];
    }
  }
}

- (void)addMethodDiagnostics:(id)a3 details:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v7 objectForKeyedSubscript:v12];
        int64_t v14 = [(PIPerspectiveAutoCalculator *)self debugDiagnostics];
        dispatch_time_t v15 = [NSString stringWithFormat:@"%@.%@", v6, v12];
        [v14 setObject:v13 forKeyedSubscript:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)perspectiveErrorFromCoreImage:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  if (v3 > 3) {
    id v4 = &PIPerspectiveErrorUnexpectedRuntimeError;
  }
  else {
    id v4 = off_1E5D7FC58[v3];
  }
  BOOL v5 = *v4;
  return v5;
}

- (PIPerspectiveAutoCalculator)initWithComposition:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v12 = NUAssertLogger_10928();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      *(_DWORD *)buf = 138543362;
      long long v27 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v16 = NUAssertLogger_10928();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        id v20 = dispatch_get_specific(*v14);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        id v23 = [v21 callStackSymbols];
        id v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v27 = v20;
        __int16 v28 = 2114;
        long long v29 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      long long v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v27 = v19;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  BOOL v5 = v4;
  v25.receiver = self;
  v25.super_class = (Class)PIPerspectiveAutoCalculator;
  id v6 = [(NURenderRequest *)&v25 initWithComposition:v4];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    debugDiagnostics = v6->_debugDiagnostics;
    v6->_debugDiagnostics = v7;

    debugLineDetectionImage = v6->_debugLineDetectionImage;
    v6->_debugLineDetectionImage = 0;

    v6->_minimumConfidence = 0.6;
    v6->_maxFaceSize = 0.0;
    v6->_disableOnPanos = 1;
    v6->_disableOnFrontFacingCameraImages = 1;
    v6->_angleSeedDegreesCCW = 0.0;
    v6->_debugFilesEnabled = 0;
    debugFilesPrefix = v6->_debugFilesPrefix;
    v6->_debugFilesPrefix = (NSString *)&stru_1EFFD8610;

    v6->_minimumYawCorrection = 0.4;
    v6->_minimumPitchCorrection = 0.4;
    v6->_minimumAngleCorrection = 0.4;
    v6->_shouldRunBuildingCheck = 0;
    v6->_minimumPitchCorrectionArea = 0.25;
    v6->_minimumYawCorrectionArea = 0.25;
  }

  return v6;
}

+ (void)requestVisionCleanUp
{
  v2 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v2, &__block_literal_global_11145);
}

void __51__PIPerspectiveAutoCalculator_requestVisionCleanUp__block_invoke()
{
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_502);
  }
  v0 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_1A9680000, v0, OS_LOG_TYPE_DEFAULT, "Requesting forced cleanup of Vision caches", v3, 2u);
  }
  v1 = [MEMORY[0x1E4F7A448] sharedFactory];
  v2 = [v1 visionSession];
  [v2 releaseCachedResources];
}

+ (void)undoOrientation:(int64_t)a3 forPitch:(double *)a4 yaw:(double *)a5 angle:(double *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    uint64_t v8 = NUAssertLogger_10928();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "pitch != nil");
      uint64_t v9 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v9;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v10 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v12 = NUAssertLogger_10928();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        BOOL v26 = dispatch_get_specific(*v10);
        long long v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v10 = [v27 callStackSymbols];
        long long v29 = [v10 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = (const void **)v26;
        __int16 v41 = 2114;
        __int16 v42 = v29;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v13)
    {
      int64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v10 = [v14 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v10;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v18 = _NUAssertFailHandler();
    goto LABEL_34;
  }
  if (!a5)
  {
    dispatch_time_t v15 = NUAssertLogger_10928();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "yaw != nil");
      long long v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v10 = (const void **)MEMORY[0x1E4F7A308];
    BOOL v17 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v12 = NUAssertLogger_10928();
    int v18 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v17)
    {
      if (v18)
      {
        long long v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v10 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v10;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_36:

      int v23 = _NUAssertFailHandler();
      goto LABEL_37;
    }
LABEL_34:
    if (v18)
    {
      uint64_t v30 = dispatch_get_specific(*v10);
      id v31 = (void *)MEMORY[0x1E4F29060];
      id v32 = v30;
      uint64_t v10 = [v31 callStackSymbols];
      BOOL v33 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = (const void **)v30;
      __int16 v41 = 2114;
      __int16 v42 = v33;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  if (!a6)
  {
    id v20 = NUAssertLogger_10928();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "angle != nil");
      uint64_t v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v10 = (const void **)MEMORY[0x1E4F7A308];
    id v22 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v12 = NUAssertLogger_10928();
    int v23 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
        objc_super v25 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v25;
        _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_39;
    }
LABEL_37:
    if (v23)
    {
      id v34 = dispatch_get_specific(*v10);
      id v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      v37 = [v35 callStackSymbols];
      __int16 v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = (const void **)v34;
      __int16 v41 = 2114;
      __int16 v42 = v38;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_39:

    _NUAssertFailHandler();
  }
  double v6 = *a4;
  double v7 = *a5;
  switch(a3)
  {
    case 2:
      double v6 = -v7;
      goto LABEL_11;
    case 3:
      *a4 = -v6;
      double v6 = -v7;
      goto LABEL_14;
    case 4:
      *a4 = -v6;
      goto LABEL_12;
    case 5:
      *a4 = -v7;
      double v6 = -v6;
      goto LABEL_11;
    case 6:
      *a4 = -v7;
      goto LABEL_14;
    case 7:
      *a4 = v7;
LABEL_11:
      *a5 = v6;
LABEL_12:
      *a6 = -*a6;
      break;
    case 8:
      *a4 = v7;
      double v6 = -v6;
LABEL_14:
      *a5 = v6;
      break;
    default:
      return;
  }
}

@end