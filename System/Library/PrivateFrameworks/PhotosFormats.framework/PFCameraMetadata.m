@interface PFCameraMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)horizonLinePresent;
- (NSArray)contactIDsInProximity;
- (NSArray)detectedCatBodies;
- (NSArray)detectedDogBodies;
- (NSArray)detectedHumanBodies;
- (NSArray)detectedHumanFaces;
- (NSArray)detectedSalientObjects;
- (NSArray)faceObservations;
- (NSArray)foodAndDrinkObservations;
- (NSArray)junkImageClassificationObservations;
- (NSArray)semanticDevelopmentGatingObservations;
- (NSArray)torsoprints;
- (NSData)JSONDebugDescription;
- (NSDictionary)smartCamInfo;
- (NSString)captureFolderPath;
- (PFCameraMetadata)initWithCoder:(id)a3;
- (PFCameraMetadata)initWithJunkImageClassificationObservations:(id)a3 imageAestheticsObservation:(id)a4 saliencyObservation:(id)a5 scenePrintObservation:(id)a6 detectedObjectsInfoHumanFaces:(id)a7 detectedObjectsInfoHumanBodies:(id)a8 detectedObjectsInfoCatBodies:(id)a9 detectedObjectsInfoDogBodies:(id)a10 detectedObjectsSalientObjects:(id)a11 smartCamInfo:(id)a12 stitchConfidence:(unint64_t)a13 horizonLinePresent:(BOOL)a14 horizonLineAngleInDegrees:(float)a15 captureFolderPath:(id)a16 semanticDevelopmentGatingObservations:(id)a17 faceObservations:(id)a18 torsoprints:(id)a19 foodAndDrinkObservations:(id)a20 semanticEnhanceScene:(int64_t)a21 contactIDsInProximity:(id)a22 sharedLibraryMode:(int64_t)a23;
- (PFCameraMetadata)initWithSpatialOverCapturePrivateClientMetadata:(id)a3;
- (VNImageAestheticsObservation)imageAestheticsObservation;
- (VNSaliencyImageObservation)saliencyObservation;
- (VNSceneObservation)scenePrintObservation;
- (double)semanticEnhanceSceneConfidence;
- (float)horizonLineAngleInDegrees;
- (int64_t)semanticEnhanceScene;
- (int64_t)sharedLibraryMode;
- (unint64_t)stitchConfidence;
- (void)encodeWithCoder:(id)a3;
- (void)setSemanticEnhanceScene:(int64_t)a3;
- (void)setSemanticEnhanceSceneConfidence:(double)a3;
@end

@implementation PFCameraMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);
  objc_storeStrong((id *)&self->_captureFolderPath, 0);
  objc_storeStrong((id *)&self->_foodAndDrinkObservations, 0);
  objc_storeStrong((id *)&self->_torsoprints, 0);
  objc_storeStrong((id *)&self->_faceObservations, 0);
  objc_storeStrong((id *)&self->_semanticDevelopmentGatingObservations, 0);
  objc_storeStrong((id *)&self->_detectedSalientObjects, 0);
  objc_storeStrong((id *)&self->_detectedDogBodies, 0);
  objc_storeStrong((id *)&self->_detectedCatBodies, 0);
  objc_storeStrong((id *)&self->_detectedHumanBodies, 0);
  objc_storeStrong((id *)&self->_detectedHumanFaces, 0);
  objc_storeStrong((id *)&self->_smartCamInfo, 0);
  objc_storeStrong((id *)&self->_scenePrintObservation, 0);
  objc_storeStrong((id *)&self->_saliencyObservation, 0);
  objc_storeStrong((id *)&self->_imageAestheticsObservation, 0);

  objc_storeStrong((id *)&self->_junkImageClassificationObservations, 0);
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (NSArray)contactIDsInProximity
{
  return self->_contactIDsInProximity;
}

- (NSString)captureFolderPath
{
  return self->_captureFolderPath;
}

- (void)setSemanticEnhanceSceneConfidence:(double)a3
{
  self->_semanticEnhanceSceneConfidence = a3;
}

- (double)semanticEnhanceSceneConfidence
{
  return self->_semanticEnhanceSceneConfidence;
}

- (void)setSemanticEnhanceScene:(int64_t)a3
{
  self->_semanticEnhanceScene = a3;
}

- (int64_t)semanticEnhanceScene
{
  return self->_semanticEnhanceScene;
}

- (NSArray)foodAndDrinkObservations
{
  return self->_foodAndDrinkObservations;
}

- (NSArray)torsoprints
{
  return self->_torsoprints;
}

- (NSArray)faceObservations
{
  return self->_faceObservations;
}

- (NSArray)semanticDevelopmentGatingObservations
{
  return self->_semanticDevelopmentGatingObservations;
}

- (float)horizonLineAngleInDegrees
{
  return self->_horizonLineAngleInDegrees;
}

- (BOOL)horizonLinePresent
{
  return self->_horizonLinePresent;
}

- (unint64_t)stitchConfidence
{
  return self->_stitchConfidence;
}

- (NSArray)detectedSalientObjects
{
  return self->_detectedSalientObjects;
}

- (NSArray)detectedDogBodies
{
  return self->_detectedDogBodies;
}

- (NSArray)detectedCatBodies
{
  return self->_detectedCatBodies;
}

- (NSArray)detectedHumanBodies
{
  return self->_detectedHumanBodies;
}

- (NSArray)detectedHumanFaces
{
  return self->_detectedHumanFaces;
}

- (NSDictionary)smartCamInfo
{
  return self->_smartCamInfo;
}

- (VNSceneObservation)scenePrintObservation
{
  return self->_scenePrintObservation;
}

- (VNSaliencyImageObservation)saliencyObservation
{
  return self->_saliencyObservation;
}

- (VNImageAestheticsObservation)imageAestheticsObservation
{
  return self->_imageAestheticsObservation;
}

- (NSArray)junkImageClassificationObservations
{
  return self->_junkImageClassificationObservations;
}

- (PFCameraMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PFCameraMetadata *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"semanticEnhanceScene"];
    v5->_semanticEnhanceScene = [v6 integerValue];

    v7 = [v4 decodeObjectForKey:@"semanticEnhanceSceneConfidence"];
    [v7 floatValue];
    v5->_semanticEnhanceSceneConfidence = v8;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, getVNRecognizedObjectObservationClass(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"foodBoxes"];
    foodAndDrinkObservations = v5->_foodAndDrinkObservations;
    v5->_foodAndDrinkObservations = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, getVNFaceObservationClass(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"faceBoxes"];
    faceObservations = v5->_faceObservations;
    v5->_faceObservations = (NSArray *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t semanticEnhanceScene = self->_semanticEnhanceScene;
  id v9 = a3;
  v6 = [v4 numberWithInteger:semanticEnhanceScene];
  [v9 encodeObject:v6 forKey:@"semanticEnhanceScene"];

  double semanticEnhanceSceneConfidence = self->_semanticEnhanceSceneConfidence;
  *(float *)&double semanticEnhanceSceneConfidence = semanticEnhanceSceneConfidence;
  float v8 = [NSNumber numberWithFloat:semanticEnhanceSceneConfidence];
  [v9 encodeObject:v8 forKey:@"semanticEnhanceSceneConfidence"];

  [v9 encodeObject:self->_foodAndDrinkObservations forKey:@"foodBoxes"];
  [v9 encodeObject:self->_faceObservations forKey:@"faceBoxes"];
}

- (NSData)JSONDebugDescription
{
  v3 = objc_opt_new();
  [v3 addObject:self->_junkImageClassificationObservations forKey:@"junkImageClassificationObservations"];
  [v3 addObject:self->_imageAestheticsObservation forKey:@"imageAestheticsObservation"];
  [v3 addObject:self->_detectedHumanFaces forKey:@"humanFaces"];
  [v3 addObject:self->_detectedHumanBodies forKey:@"humanBodies"];
  [v3 addObject:self->_detectedCatBodies forKey:@"catBodies"];
  [v3 addObject:self->_detectedDogBodies forKey:@"dogBodies"];
  [v3 addObject:self->_detectedSalientObjects forKey:@"salientObjects"];
  [v3 addObject:self->_saliencyObservation forKey:@"saliencyObservation"];
  [v3 addObject:self->_scenePrintObservation forKey:@"scenePrintObservation"];
  [v3 addObject:self->_captureFolderPath forKey:@"captureFolderPath"];
  [v3 addObject:self->_semanticDevelopmentGatingObservations forKey:@"semanticDevelopmentGatingObservations"];
  [v3 addObject:self->_faceObservations forKey:@"faceObservations"];
  [v3 addObject:self->_torsoprints forKey:@"torsoprints"];
  [v3 addObject:self->_foodAndDrinkObservations forKey:@"foodAndDrinkObservations"];
  [v3 addObject:self->_smartCamInfo forKey:@"smartCamInfo"];
  [v3 addObject:self->_contactIDsInProximity forKey:@"contactIDsInProximity"];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_stitchConfidence];
  [v3 addObject:v4 forKey:@"stitchConfidence"];

  v5 = [NSNumber numberWithBool:self->_horizonLinePresent];
  [v3 addObject:v5 forKey:@"horizonLinePresent"];

  *(float *)&double v6 = self->_horizonLineAngleInDegrees;
  v7 = [NSNumber numberWithFloat:v6];
  [v3 addObject:v7 forKey:@"horizonLineAngleInDegrees"];

  float v8 = [NSNumber numberWithInteger:self->_semanticEnhanceScene];
  [v3 addObject:v8 forKey:@"semanticEnhanceScene"];

  id v9 = [NSNumber numberWithInteger:self->_sharedLibraryMode];
  [v3 addObject:v9 forKey:@"sharedLibraryMode"];

  uint64_t v10 = [v3 JSONDebugData];

  return (NSData *)v10;
}

- (PFCameraMetadata)initWithSpatialOverCapturePrivateClientMetadata:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PFCameraMetadata;
  v5 = [(PFCameraMetadata *)&v10 init];
  if (v5)
  {
    if (objc_opt_respondsToSelector()) {
      unint64_t v6 = [v4 spatialOverCaptureImageStitchingConfidenceScore];
    }
    else {
      unint64_t v6 = 0;
    }
    v5->_stitchConfidence = v6;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5->_horizonLinePresent = 0;
      float v8 = 0.0;
      goto LABEL_9;
    }
    int v7 = [v4 spatialOverCaptureImageHorizonLinePresent];
    v5->_horizonLinePresent = v7;
    if (v7)
    {
      [v4 spatialOverCaptureImageHorizonLineAngleInDegrees];
LABEL_9:
      v5->_horizonLineAngleInDegrees = v8;
    }
  }

  return v5;
}

- (PFCameraMetadata)initWithJunkImageClassificationObservations:(id)a3 imageAestheticsObservation:(id)a4 saliencyObservation:(id)a5 scenePrintObservation:(id)a6 detectedObjectsInfoHumanFaces:(id)a7 detectedObjectsInfoHumanBodies:(id)a8 detectedObjectsInfoCatBodies:(id)a9 detectedObjectsInfoDogBodies:(id)a10 detectedObjectsSalientObjects:(id)a11 smartCamInfo:(id)a12 stitchConfidence:(unint64_t)a13 horizonLinePresent:(BOOL)a14 horizonLineAngleInDegrees:(float)a15 captureFolderPath:(id)a16 semanticDevelopmentGatingObservations:(id)a17 faceObservations:(id)a18 torsoprints:(id)a19 foodAndDrinkObservations:(id)a20 semanticEnhanceScene:(int64_t)a21 contactIDsInProximity:(id)a22 sharedLibraryMode:(int64_t)a23
{
  id v50 = a3;
  id v37 = a4;
  id v49 = a4;
  id v48 = a5;
  id v47 = a6;
  id v46 = a7;
  id v45 = a8;
  id v44 = a9;
  id v43 = a10;
  id v42 = a11;
  id v29 = a12;
  id v30 = a16;
  id v31 = a17;
  id v41 = a18;
  id v40 = a19;
  id v32 = a20;
  id v39 = a22;
  v51.receiver = self;
  v51.super_class = (Class)PFCameraMetadata;
  v33 = [(PFCameraMetadata *)&v51 init];
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_junkImageClassificationObservations, a3);
    objc_storeStrong((id *)&v34->_imageAestheticsObservation, v37);
    objc_storeStrong((id *)&v34->_detectedHumanFaces, a7);
    objc_storeStrong((id *)&v34->_detectedHumanBodies, a8);
    objc_storeStrong((id *)&v34->_detectedCatBodies, a9);
    objc_storeStrong((id *)&v34->_detectedDogBodies, a10);
    objc_storeStrong((id *)&v34->_detectedSalientObjects, a11);
    objc_storeStrong((id *)&v34->_saliencyObservation, a5);
    objc_storeStrong((id *)&v34->_scenePrintObservation, a6);
    objc_storeStrong((id *)&v34->_captureFolderPath, a16);
    objc_storeStrong((id *)&v34->_semanticDevelopmentGatingObservations, a17);
    objc_storeStrong((id *)&v34->_faceObservations, a18);
    objc_storeStrong((id *)&v34->_torsoprints, a19);
    objc_storeStrong((id *)&v34->_foodAndDrinkObservations, a20);
    objc_storeStrong((id *)&v34->_smartCamInfo, a12);
    objc_storeStrong((id *)&v34->_contactIDsInProximity, a22);
    v34->_stitchConfidence = a13;
    v34->_horizonLinePresent = a14;
    v34->_horizonLineAngleInDegrees = a15;
    v34->_int64_t semanticEnhanceScene = a21;
    v34->_sharedLibraryMode = a23;
  }

  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end