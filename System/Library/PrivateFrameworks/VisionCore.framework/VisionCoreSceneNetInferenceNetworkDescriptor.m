@interface VisionCoreSceneNetInferenceNetworkDescriptor
+ (BOOL)_getAnalyzerName:(id *)a3 ANESpecificAnalyzerName:(id *)a4 specifier:(id *)a5 forModel:(unint64_t)a6 objDetNet:(BOOL)a7 sliderNet:(BOOL)a8 error:(id *)a9;
+ (BOOL)supportsSecureCoding;
+ (id)descriptorForModel:(unint64_t)a3 requireObjDetNet:(BOOL)a4 requireSliderNet:(BOOL)a5 error:(id *)a6;
+ (id)sceneNetObjDetNetSliderNetV3AndReturnError:(id *)a3;
+ (id)sceneNetV3AndReturnError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldInitializeAdditionalModelHeads;
- (NSString)aestheticsAttributesBlobName;
- (NSString)aestheticsScoresBlobName;
- (NSString)analyzerName;
- (NSString)entityNetLabelsBlobName;
- (NSString)fingerprintsOutputBlobName;
- (NSString)inputImageBlobName;
- (NSString)objectDetectorCoordinatesOutputBlobName;
- (NSString)objectDetectorOutputBlobBaseName;
- (NSString)objectDetectorScoresOutputBlobName;
- (NSString)saliencyAHeatMapBlobName;
- (NSString)saliencyOHeatMapBlobName;
- (NSString)sceneClassificationLabelsBlobName;
- (NSString)sceneRepresentationBlobName;
- (NSString)sliderNetBlobNamePrefix;
- (NSURL)aestheticsLabelsFileURL;
- (NSURL)entityNetLabelsFileURL;
- (NSURL)entityNetOperatingPointsFileURL;
- (NSURL)fingerprintsHasherFileURL;
- (NSURL)objectDetectorLabelsFileURL;
- (NSURL)pca256FileURL;
- (NSURL)sceneLabelRelationshipsFileURL;
- (NSURL)sceneLabelsFileURL;
- (NSURL)sceneOperatingPointsFileURL;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)cityNatureCustomClassifierDescriptor;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)junkHierarchicalCustomClassifierDescriptor;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)junkLeafCustomClassifierDescriptor;
- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)potentialLandmarksCustomClassifierDescriptor;
- (VisionCoreSceneNetInferenceNetworkDescriptor)initWithCoder:(id)a3;
- (VisionCoreTensorDescriptor)sceneLabelConfidencesOutput;
- (VisionCoreTensorDescriptor)sceneprintOutput;
- (id)ANESpecificURL;
- (id)_newCustomClassifierDescriptorWithModelName:(id)a3 labelsFileName:(id)a4 inputBlobName:(id)a5 outputBlobName:(id)a6 error:(id *)a7;
- (unint64_t)hash;
- (unint64_t)model;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreSceneNetInferenceNetworkDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_potentialLandmarksCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_junkHierarchicalCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_junkLeafCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_fingerprintsOutputBlobName, 0);
  objc_storeStrong((id *)&self->_fingerprintsHasherFileName, 0);
  objc_storeStrong((id *)&self->_sliderNetBlobNamePrefix, 0);
  objc_storeStrong((id *)&self->_objectDetectorCoordinatesOutputBlobName, 0);
  objc_storeStrong((id *)&self->_objectDetectorScoresOutputBlobName, 0);
  objc_storeStrong((id *)&self->_objectDetectorOutputBlobBaseName, 0);
  objc_storeStrong((id *)&self->_objectDetectorLabelsFileName, 0);
  objc_storeStrong((id *)&self->_saliencyOHeatMapBlobName, 0);
  objc_storeStrong((id *)&self->_saliencyAHeatMapBlobName, 0);
  objc_storeStrong((id *)&self->_aestheticsAttributesBlobName, 0);
  objc_storeStrong((id *)&self->_aestheticsScoresBlobName, 0);
  objc_storeStrong((id *)&self->_aestheticsLabelsFileName, 0);
  objc_storeStrong((id *)&self->_pca256FileName, 0);
  objc_storeStrong((id *)&self->_entityNetOperatingPointsFileName, 0);
  objc_storeStrong((id *)&self->_entityNetLabelsBlobName, 0);
  objc_storeStrong((id *)&self->_entityNetLabelsFileName, 0);
  objc_storeStrong((id *)&self->_sceneOperatingPointsFileName, 0);
  objc_storeStrong((id *)&self->_sceneClassificationLabelsBlobName, 0);
  objc_storeStrong((id *)&self->_sceneRepresentationBlobName, 0);
  objc_storeStrong((id *)&self->_sceneLabelRelationshipsFileName, 0);
  objc_storeStrong((id *)&self->_sceneLabelsFileName, 0);
  objc_storeStrong((id *)&self->_inputImageBlobName, 0);
  objc_storeStrong((id *)&self->_aneSpecificModelURL, 0);
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)cityNatureCustomClassifierDescriptor
{
  return self->_cityNatureCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor
{
  return self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor
{
  return self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)potentialLandmarksCustomClassifierDescriptor
{
  return self->_potentialLandmarksCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor
{
  return self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)junkHierarchicalCustomClassifierDescriptor
{
  return self->_junkHierarchicalCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)junkLeafCustomClassifierDescriptor
{
  return self->_junkLeafCustomClassifierDescriptor;
}

- (NSString)fingerprintsOutputBlobName
{
  return self->_fingerprintsOutputBlobName;
}

- (NSString)objectDetectorCoordinatesOutputBlobName
{
  return self->_objectDetectorCoordinatesOutputBlobName;
}

- (NSString)objectDetectorScoresOutputBlobName
{
  return self->_objectDetectorScoresOutputBlobName;
}

- (NSString)objectDetectorOutputBlobBaseName
{
  return self->_objectDetectorOutputBlobBaseName;
}

- (BOOL)shouldInitializeAdditionalModelHeads
{
  return self->_shouldInitializeAdditionalModelHeads;
}

- (NSString)sliderNetBlobNamePrefix
{
  return self->_sliderNetBlobNamePrefix;
}

- (NSString)saliencyOHeatMapBlobName
{
  return self->_saliencyOHeatMapBlobName;
}

- (NSString)saliencyAHeatMapBlobName
{
  return self->_saliencyAHeatMapBlobName;
}

- (NSString)aestheticsAttributesBlobName
{
  return self->_aestheticsAttributesBlobName;
}

- (NSString)aestheticsScoresBlobName
{
  return self->_aestheticsScoresBlobName;
}

- (NSString)entityNetLabelsBlobName
{
  return self->_entityNetLabelsBlobName;
}

- (NSString)sceneClassificationLabelsBlobName
{
  return self->_sceneClassificationLabelsBlobName;
}

- (NSString)sceneRepresentationBlobName
{
  return self->_sceneRepresentationBlobName;
}

- (NSString)inputImageBlobName
{
  return self->_inputImageBlobName;
}

- (unint64_t)model
{
  return self->_model;
}

- (VisionCoreSceneNetInferenceNetworkDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
  v5 = [(VisionCoreInferenceNetworkDescriptor *)&v61 initWithCoder:v4];
  if (v5)
  {
    v5->_model = [v4 decodeIntegerForKey:@"model"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"inputImageBlobName"];
    inputImageBlobName = v5->_inputImageBlobName;
    v5->_inputImageBlobName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"sceneLabelsFileName"];
    sceneLabelsFileName = v5->_sceneLabelsFileName;
    v5->_sceneLabelsFileName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"sceneLabelRelationshipsFileName"];
    sceneLabelRelationshipsFileName = v5->_sceneLabelRelationshipsFileName;
    v5->_sceneLabelRelationshipsFileName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:v6 forKey:@"sceneRepresentationBlobName"];
    sceneRepresentationBlobName = v5->_sceneRepresentationBlobName;
    v5->_sceneRepresentationBlobName = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:v6 forKey:@"sceneClassificationLabelsBlobName"];
    sceneClassificationLabelsBlobName = v5->_sceneClassificationLabelsBlobName;
    v5->_sceneClassificationLabelsBlobName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:v6 forKey:@"sceneOperatingPointsFileName"];
    sceneOperatingPointsFileName = v5->_sceneOperatingPointsFileName;
    v5->_sceneOperatingPointsFileName = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:v6 forKey:@"pca256FileName"];
    pca256FileName = v5->_pca256FileName;
    v5->_pca256FileName = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:v6 forKey:@"aestheticsLabelsFileName"];
    aestheticsLabelsFileName = v5->_aestheticsLabelsFileName;
    v5->_aestheticsLabelsFileName = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:v6 forKey:@"aestheticsScoresBlobName"];
    aestheticsScoresBlobName = v5->_aestheticsScoresBlobName;
    v5->_aestheticsScoresBlobName = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:v6 forKey:@"aestheticsAttributesBlobName"];
    aestheticsAttributesBlobName = v5->_aestheticsAttributesBlobName;
    v5->_aestheticsAttributesBlobName = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:v6 forKey:@"saliencyAHeatMapBlobName"];
    saliencyAHeatMapBlobName = v5->_saliencyAHeatMapBlobName;
    v5->_saliencyAHeatMapBlobName = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:v6 forKey:@"saliencyOHeatMapBlobName"];
    saliencyOHeatMapBlobName = v5->_saliencyOHeatMapBlobName;
    v5->_saliencyOHeatMapBlobName = (NSString *)v29;

    v5->_shouldInitializeAdditionalModelHeads = [v4 decodeBoolForKey:@"shouldInitializeAdditionalModelHeads"];
    uint64_t v31 = [v4 decodeObjectOfClass:v6 forKey:@"objectDetectorLabelsFileName"];
    objectDetectorLabelsFileName = v5->_objectDetectorLabelsFileName;
    v5->_objectDetectorLabelsFileName = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:v6 forKey:@"objectDetectorOutputBlobBaseName"];
    objectDetectorOutputBlobBaseName = v5->_objectDetectorOutputBlobBaseName;
    v5->_objectDetectorOutputBlobBaseName = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:v6 forKey:@"objectDetectorScoresOutputBlobName"];
    objectDetectorScoresOutputBlobName = v5->_objectDetectorScoresOutputBlobName;
    v5->_objectDetectorScoresOutputBlobName = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:v6 forKey:@"objectDetectorCoordinatesOutputBlobName"];
    objectDetectorCoordinatesOutputBlobName = v5->_objectDetectorCoordinatesOutputBlobName;
    v5->_objectDetectorCoordinatesOutputBlobName = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:v6 forKey:@"sliderNetBlobNamePrefix"];
    sliderNetBlobNamePrefix = v5->_sliderNetBlobNamePrefix;
    v5->_sliderNetBlobNamePrefix = (NSString *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:v6 forKey:@"fingerprintsHasherFileName"];
    fingerprintsHasherFileName = v5->_fingerprintsHasherFileName;
    v5->_fingerprintsHasherFileName = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:v6 forKey:@"fingerprintsOutputBlobName"];
    fingerprintsOutputBlobName = v5->_fingerprintsOutputBlobName;
    v5->_fingerprintsOutputBlobName = (NSString *)v43;

    uint64_t v45 = objc_opt_class();
    uint64_t v46 = [v4 decodeObjectOfClass:v45 forKey:@"junkLeaf"];
    junkLeafCustomClassifierDescriptor = v5->_junkLeafCustomClassifierDescriptor;
    v5->_junkLeafCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:v45 forKey:@"junkHierarchical"];
    junkHierarchicalCustomClassifierDescriptor = v5->_junkHierarchicalCustomClassifierDescriptor;
    v5->_junkHierarchicalCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:v45 forKey:@"VNVYvzEtX1JlUdu8xx5qhDI"];
    VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor = v5->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor;
    v5->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:v45 forKey:@"potentialLandmark"];
    potentialLandmarksCustomClassifierDescriptor = v5->_potentialLandmarksCustomClassifierDescriptor;
    v5->_potentialLandmarksCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:v45 forKey:@"VN5kJNH3eYuyaLxNpZr5Z7zi"];
    VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor = v5->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor;
    v5->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:v45 forKey:@"VNdGg5skzXHSAENO6T3enHE"];
    VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor = v5->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor;
    v5->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:v45 forKey:@"cityNature"];
    cityNatureCustomClassifierDescriptor = v5->_cityNatureCustomClassifierDescriptor;
    v5->_cityNatureCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v58;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
  id v4 = a3;
  [(VisionCoreInferenceNetworkDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_model, @"model", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_inputImageBlobName forKey:@"inputImageBlobName"];
  [v4 encodeObject:self->_sceneLabelsFileName forKey:@"sceneLabelsFileName"];
  [v4 encodeObject:self->_sceneLabelRelationshipsFileName forKey:@"sceneLabelRelationshipsFileName"];
  [v4 encodeObject:self->_sceneRepresentationBlobName forKey:@"sceneRepresentationBlobName"];
  [v4 encodeObject:self->_sceneClassificationLabelsBlobName forKey:@"sceneClassificationLabelsBlobName"];
  [v4 encodeObject:self->_sceneOperatingPointsFileName forKey:@"sceneOperatingPointsFileName"];
  [v4 encodeObject:self->_pca256FileName forKey:@"pca256FileName"];
  [v4 encodeObject:self->_aestheticsLabelsFileName forKey:@"aestheticsLabelsFileName"];
  [v4 encodeObject:self->_aestheticsScoresBlobName forKey:@"aestheticsScoresBlobName"];
  [v4 encodeObject:self->_aestheticsAttributesBlobName forKey:@"aestheticsAttributesBlobName"];
  [v4 encodeObject:self->_saliencyAHeatMapBlobName forKey:@"saliencyAHeatMapBlobName"];
  [v4 encodeObject:self->_saliencyOHeatMapBlobName forKey:@"saliencyOHeatMapBlobName"];
  [v4 encodeBool:self->_shouldInitializeAdditionalModelHeads forKey:@"shouldInitializeAdditionalModelHeads"];
  [v4 encodeObject:self->_objectDetectorLabelsFileName forKey:@"objectDetectorLabelsFileName"];
  [v4 encodeObject:self->_objectDetectorOutputBlobBaseName forKey:@"objectDetectorOutputBlobBaseName"];
  [v4 encodeObject:self->_objectDetectorScoresOutputBlobName forKey:@"objectDetectorScoresOutputBlobName"];
  [v4 encodeObject:self->_objectDetectorCoordinatesOutputBlobName forKey:@"objectDetectorCoordinatesOutputBlobName"];
  [v4 encodeObject:self->_sliderNetBlobNamePrefix forKey:@"sliderNetBlobNamePrefix"];
  [v4 encodeObject:self->_fingerprintsHasherFileName forKey:@"fingerprintsHasherFileName"];
  [v4 encodeObject:self->_fingerprintsOutputBlobName forKey:@"fingerprintsOutputBlobName"];
  [v4 encodeObject:self->_junkLeafCustomClassifierDescriptor forKey:@"junkLeaf"];
  [v4 encodeObject:self->_junkHierarchicalCustomClassifierDescriptor forKey:@"junkHierarchical"];
  [v4 encodeObject:self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor forKey:@"VNVYvzEtX1JlUdu8xx5qhDI"];
  [v4 encodeObject:self->_potentialLandmarksCustomClassifierDescriptor forKey:@"potentialLandmark"];
  [v4 encodeObject:self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor forKey:@"VN5kJNH3eYuyaLxNpZr5Z7zi"];
  [v4 encodeObject:self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor forKey:@"VNdGg5skzXHSAENO6T3enHE"];
  [v4 encodeObject:self->_cityNatureCustomClassifierDescriptor forKey:@"cityNature"];
}

- (id)ANESpecificURL
{
  aneSpecificModelURL = self->_aneSpecificModelURL;
  if (aneSpecificModelURL)
  {
    v3 = aneSpecificModelURL;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
    v3 = [(VisionCoreEspressoNetworkDescriptor *)&v5 ANESpecificURL];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreSceneNetInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    char v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v34.receiver = self,
          v34.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor,
          [(VisionCoreInferenceNetworkDescriptor *)&v34 isEqual:v4]))
    {
      objc_super v5 = v4;
      if (self->_model != v5->_model) {
        goto LABEL_60;
      }
      inputImageBlobName = self->_inputImageBlobName;
      if (inputImageBlobName != v5->_inputImageBlobName
        && !-[NSString isEqual:](inputImageBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneLabelsFileName = self->_sceneLabelsFileName;
      if (sceneLabelsFileName != v5->_sceneLabelsFileName
        && !-[NSString isEqual:](sceneLabelsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneLabelRelationshipsFileName = self->_sceneLabelRelationshipsFileName;
      if (sceneLabelRelationshipsFileName != v5->_sceneLabelRelationshipsFileName
        && !-[NSString isEqual:](sceneLabelRelationshipsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneRepresentationBlobName = self->_sceneRepresentationBlobName;
      if (sceneRepresentationBlobName != v5->_sceneRepresentationBlobName
        && !-[NSString isEqual:](sceneRepresentationBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneClassificationLabelsBlobName = self->_sceneClassificationLabelsBlobName;
      if (sceneClassificationLabelsBlobName != v5->_sceneClassificationLabelsBlobName
        && !-[NSString isEqual:](sceneClassificationLabelsBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneOperatingPointsFileName = self->_sceneOperatingPointsFileName;
      if (sceneOperatingPointsFileName != v5->_sceneOperatingPointsFileName
        && !-[NSString isEqual:](sceneOperatingPointsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      pca256FileName = self->_pca256FileName;
      if (pca256FileName != v5->_pca256FileName && !-[NSString isEqual:](pca256FileName, "isEqual:")) {
        goto LABEL_60;
      }
      aestheticsLabelsFileName = self->_aestheticsLabelsFileName;
      if (aestheticsLabelsFileName != v5->_aestheticsLabelsFileName
        && !-[NSString isEqual:](aestheticsLabelsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      aestheticsScoresBlobName = self->_aestheticsScoresBlobName;
      if (aestheticsScoresBlobName != v5->_aestheticsScoresBlobName
        && !-[NSString isEqual:](aestheticsScoresBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      aestheticsAttributesBlobName = self->_aestheticsAttributesBlobName;
      if (aestheticsAttributesBlobName != v5->_aestheticsAttributesBlobName
        && !-[NSString isEqual:](aestheticsAttributesBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      saliencyAHeatMapBlobName = self->_saliencyAHeatMapBlobName;
      if (saliencyAHeatMapBlobName != v5->_saliencyAHeatMapBlobName
        && !-[NSString isEqual:](saliencyAHeatMapBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      saliencyOHeatMapBlobName = self->_saliencyOHeatMapBlobName;
      if (saliencyOHeatMapBlobName != v5->_saliencyOHeatMapBlobName
        && !-[NSString isEqual:](saliencyOHeatMapBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      if (self->_shouldInitializeAdditionalModelHeads != v5->_shouldInitializeAdditionalModelHeads) {
        goto LABEL_60;
      }
      objectDetectorLabelsFileName = self->_objectDetectorLabelsFileName;
      if (objectDetectorLabelsFileName != v5->_objectDetectorLabelsFileName
        && !-[NSString isEqual:](objectDetectorLabelsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      objectDetectorOutputBlobBaseName = self->_objectDetectorOutputBlobBaseName;
      if (objectDetectorOutputBlobBaseName != v5->_objectDetectorOutputBlobBaseName
        && !-[NSString isEqual:](objectDetectorOutputBlobBaseName, "isEqual:"))
      {
        goto LABEL_60;
      }
      objectDetectorScoresOutputBlobName = self->_objectDetectorScoresOutputBlobName;
      if (objectDetectorScoresOutputBlobName != v5->_objectDetectorScoresOutputBlobName
        && !-[NSString isEqual:](objectDetectorScoresOutputBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      objectDetectorCoordinatesOutputBlobName = self->_objectDetectorCoordinatesOutputBlobName;
      if (objectDetectorCoordinatesOutputBlobName != v5->_objectDetectorCoordinatesOutputBlobName
        && !-[NSString isEqual:](objectDetectorCoordinatesOutputBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sliderNetBlobNamePrefix = self->_sliderNetBlobNamePrefix;
      if (sliderNetBlobNamePrefix != v5->_sliderNetBlobNamePrefix
        && !-[NSString isEqual:](sliderNetBlobNamePrefix, "isEqual:"))
      {
        goto LABEL_60;
      }
      fingerprintsHasherFileName = self->_fingerprintsHasherFileName;
      if (fingerprintsHasherFileName != v5->_fingerprintsHasherFileName
        && !-[NSString isEqual:](fingerprintsHasherFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      if (((fingerprintsOutputBlobName = self->_fingerprintsOutputBlobName,
             fingerprintsOutputBlobName == v5->_fingerprintsOutputBlobName)
         || -[NSString isEqual:](fingerprintsOutputBlobName, "isEqual:"))
        && ((junkLeafCustomClassifierDescriptor = self->_junkLeafCustomClassifierDescriptor,
             junkLeafCustomClassifierDescriptor == v5->_junkLeafCustomClassifierDescriptor)
         || -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](junkLeafCustomClassifierDescriptor, "isEqual:"))&& ((junkHierarchicalCustomClassifierDescriptor = self->_junkHierarchicalCustomClassifierDescriptor, junkHierarchicalCustomClassifierDescriptor == v5->_junkHierarchicalCustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](junkHierarchicalCustomClassifierDescriptor, "isEqual:"))&& ((VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor = self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor, VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor == v5->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor, "isEqual:"))&& ((potentialLandmarksCustomClassifierDescriptor = self->_potentialLandmarksCustomClassifierDescriptor, potentialLandmarksCustomClassifierDescriptor == v5->_potentialLandmarksCustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](potentialLandmarksCustomClassifierDescriptor, "isEqual:"))&& ((VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor = self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor, VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor == v5->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor)
         || -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor, "isEqual:"))&& ((VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor = self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor, VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor == v5->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor, "isEqual:")))
      {
        cityNatureCustomClassifierDescriptor = self->_cityNatureCustomClassifierDescriptor;
        if (cityNatureCustomClassifierDescriptor == v5->_cityNatureCustomClassifierDescriptor) {
          char v32 = 1;
        }
        else {
          char v32 = -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](cityNatureCustomClassifierDescriptor, "isEqual:");
        }
      }
      else
      {
LABEL_60:
        char v32 = 0;
      }
    }
    else
    {
      char v32 = 0;
    }
  }

  return v32;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
  unint64_t v3 = [(VisionCoreInferenceNetworkDescriptor *)&v5 hash];
  return [(VisionCoreSceneNetInferenceNetworkDescriptor *)self model] ^ v3;
}

- (NSURL)fingerprintsHasherFileURL
{
  unint64_t v3 = objc_opt_class();
  fingerprintsHasherFileName = self->_fingerprintsHasherFileName;
  return (NSURL *)[v3 URLForResourceNamed:fingerprintsHasherFileName error:0];
}

- (NSURL)objectDetectorLabelsFileURL
{
  unint64_t v3 = objc_opt_class();
  objectDetectorLabelsFileName = self->_objectDetectorLabelsFileName;
  return (NSURL *)[v3 URLForResourceNamed:objectDetectorLabelsFileName error:0];
}

- (NSURL)aestheticsLabelsFileURL
{
  unint64_t v3 = objc_opt_class();
  aestheticsLabelsFileName = self->_aestheticsLabelsFileName;
  return (NSURL *)[v3 URLForResourceNamed:aestheticsLabelsFileName error:0];
}

- (NSURL)pca256FileURL
{
  unint64_t v3 = objc_opt_class();
  pca256FileName = self->_pca256FileName;
  return (NSURL *)[v3 URLForResourceNamed:pca256FileName error:0];
}

- (NSURL)entityNetOperatingPointsFileURL
{
  unint64_t v3 = objc_opt_class();
  entityNetOperatingPointsFileName = self->_entityNetOperatingPointsFileName;
  return (NSURL *)[v3 URLForResourceNamed:entityNetOperatingPointsFileName error:0];
}

- (NSURL)entityNetLabelsFileURL
{
  unint64_t v3 = objc_opt_class();
  entityNetLabelsFileName = self->_entityNetLabelsFileName;
  return (NSURL *)[v3 URLForResourceNamed:entityNetLabelsFileName error:0];
}

- (NSURL)sceneOperatingPointsFileURL
{
  unint64_t v3 = objc_opt_class();
  sceneOperatingPointsFileName = self->_sceneOperatingPointsFileName;
  return (NSURL *)[v3 URLForResourceNamed:sceneOperatingPointsFileName error:0];
}

- (NSURL)sceneLabelRelationshipsFileURL
{
  unint64_t v3 = objc_opt_class();
  sceneLabelRelationshipsFileName = self->_sceneLabelRelationshipsFileName;
  return (NSURL *)[v3 URLForResourceNamed:sceneLabelRelationshipsFileName error:0];
}

- (NSURL)sceneLabelsFileURL
{
  unint64_t v3 = objc_opt_class();
  sceneLabelsFileName = self->_sceneLabelsFileName;
  return (NSURL *)[v3 URLForResourceNamed:sceneLabelsFileName error:0];
}

- (NSString)analyzerName
{
  v2 = [(VisionCoreInferenceNetworkDescriptor *)self URL];
  unint64_t v3 = [v2 lastPathComponent];
  id v4 = [v3 stringByDeletingPathExtension];

  return (NSString *)v4;
}

- (VisionCoreTensorDescriptor)sceneLabelConfidencesOutput
{
  unint64_t v3 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self sceneClassificationLabelsBlobName];
  id v4 = [(VisionCoreInferenceNetworkDescriptor *)self outputNamed:v3 error:0];

  return (VisionCoreTensorDescriptor *)v4;
}

- (VisionCoreTensorDescriptor)sceneprintOutput
{
  unint64_t v3 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self sceneRepresentationBlobName];
  id v4 = [(VisionCoreInferenceNetworkDescriptor *)self outputNamed:v3 error:0];

  return (VisionCoreTensorDescriptor *)v4;
}

- (id)_newCustomClassifierDescriptorWithModelName:(id)a3 labelsFileName:(id)a4 inputBlobName:(id)a5 outputBlobName:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  uint64_t v15 = [(id)objc_opt_class() URLForEspressoModelNamed:v14 error:a7];

  if (v15)
  {
    v16 = [(id)objc_opt_class() URLForResourceNamed:v11 error:a7];
    if (v16) {
      uint64_t v17 = [[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor alloc] initWithModelFileURL:v15 labelsFileURL:v16 inputBlobName:v12 outputBlobName:v13];
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sceneNetObjDetNetSliderNetV3AndReturnError:(id *)a3
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetObjDetNetSliderNetV3AndReturnError___block_invoke;
  v9[3] = &__block_descriptor_40_e9__16__0__8l;
  v9[4] = a1;
  id v4 = (void *)MEMORY[0x230F41C60](v9, a2);
  objc_super v5 = +[VisionCoreFrameworkManager sharedManager];
  uint64_t v6 = [v5 inferenceNetworkDescriptorsCache];
  uint64_t v7 = [v6 objectForIdentifier:@"SceneNetObjDetNetSliderNetV3" creationBlock:v4 error:a3];

  return v7;
}

uint64_t __91__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetObjDetNetSliderNetV3AndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) descriptorForModel:1 requireObjDetNet:1 requireSliderNet:1 error:a2];
}

+ (id)sceneNetV3AndReturnError:(id *)a3
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetV3AndReturnError___block_invoke;
  v9[3] = &__block_descriptor_40_e9__16__0__8l;
  v9[4] = a1;
  id v4 = (void *)MEMORY[0x230F41C60](v9, a2);
  objc_super v5 = +[VisionCoreFrameworkManager sharedManager];
  uint64_t v6 = [v5 inferenceNetworkDescriptorsCache];
  uint64_t v7 = [v6 objectForIdentifier:@"SceneNetV3" creationBlock:v4 error:a3];

  return v7;
}

uint64_t __73__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetV3AndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) descriptorForModel:1 requireObjDetNet:0 requireSliderNet:0 error:a2];
}

+ (id)descriptorForModel:(unint64_t)a3 requireObjDetNet:(BOOL)a4 requireSliderNet:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v74 = 0;
  id v72 = 0;
  id v73 = 0;
  int v11 = [a1 _getAnalyzerName:&v74 ANESpecificAnalyzerName:&v73 specifier:&v72 forModel:a3 objDetNet:a4 sliderNet:a5 error:a6];
  id v12 = v74;
  id v13 = v73;
  id v14 = v72;
  id v15 = 0;
  if (v11)
  {
    v16 = [a1 URLForEspressoModelNamed:v12 error:a6];
    if (!v16)
    {
LABEL_5:
      id v15 = 0;
LABEL_32:

      goto LABEL_33;
    }
    if (v13)
    {
      uint64_t v17 = [a1 URLForEspressoModelNamed:v13 error:a6];
      if (!v17) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (a3 != 1)
    {
      if (!a6)
      {
        id v15 = 0;
LABEL_31:

        goto LABEL_32;
      }
      id obj = v17;
      id v69 = v14;
      id v61 = [NSString alloc];
      v62 = NSStringFromVisionCoreSceneNetInferenceNetworkModel(a3);
      v63 = (void *)[v61 initWithFormat:@"%@ is not supported", v62];

      [MEMORY[0x263F087E8] VisionCoreErrorForFailedOperationWithLocalizedDescription:v63];
      id v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

      uint64_t v17 = obj;
      id v14 = v69;
      goto LABEL_31;
    }
    id obj = v17;
    id v69 = v14;
    v67 = v16;
    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v8 || v7)
    {
      v20 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
      [v19 setObject:v20 forKeyedSubscript:@"VisionCoreSceneNetInferenceNetworkHeadIdentifierObjDetNet"];

      [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"slidernet/HighKeyCI"];
      [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"slidernet/ContrastCI"];
      [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"slidernet/WhiteBalanceTempTintCI"];
      [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"slidernet/ColorCastCI"];
      [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"slidernet/ExposureAndBlackPointCI"];
      [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"slidernet/HighlightsCI"];
      [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"slidernet/VibrancyCI"];
      uint64_t v21 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
      [v19 setObject:v21 forKeyedSubscript:@"VisionCoreSceneNetInferenceNetworkHeadIdentifierSliderNet"];
    }
    [v18 setObject:&unk_26DE6FAD0 forKeyedSubscript:@"objectness/map"];
    [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"classification/labels"];
    v22 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
    [v19 setObject:v22 forKeyedSubscript:@"VisionCoreSceneNetInferenceNetworkHeadIdentifierSaliencyO"];

    [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"inner/sceneprint"];
    [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"aesthetics/scores"];
    [v18 setObject:&unk_26DE6FAB8 forKeyedSubscript:@"aesthetics/attributes"];
    [v18 setObject:&unk_26DE6FAD0 forKeyedSubscript:@"saliency/map"];
    uint64_t v23 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
    [v19 setObject:v23 forKeyedSubscript:@"VisionCoreSceneNetInferenceNetworkHeadIdentifierSceneClassification"];

    v24 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
    [v19 setObject:v24 forKeyedSubscript:@"VisionCoreSceneNetInferenceNetworkHeadIdentifierAesthetics"];

    uint64_t v25 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
    [v19 setObject:v25 forKeyedSubscript:@"VisionCoreSceneNetInferenceNetworkHeadIdentifierSaliencyA"];

    id v70 = 0;
    id v71 = 0;
    id v66 = v18;
    LODWORD(v25) = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:&v71 outputTensorDescriptors:&v70 forNetworkModelFileURL:v67 inputBlobName:@"data" pixelFormatType:1111970369 outputBlobNamesWithTypes:v18 confidencesBlobNamesWithLabelsFiles:0 error:a6];
    id v26 = v71;
    id v27 = v70;
    id v15 = 0;
    if (!v25)
    {
LABEL_29:

      v63 = v66;
      v16 = v67;
      goto LABEL_30;
    }
    v28 = v27;
    id v29 = objc_alloc((Class)a1);
    id v65 = v28;
    v30 = [v28 allValues];
    uint64_t v31 = [v29 initWithURL:v67 specifier:v69 networkHeadVersions:v19 inputImage:v26 outputs:v30 confidencesOutput:0];

    if (v31)
    {
      *(void *)(v31 + 64) = 1;
      objc_storeStrong((id *)(v31 + 72), obj);
      *(unsigned char *)(v31 + 200) = v8 || v7;
      char v32 = *(void **)(v31 + 192);
      *(void *)(v31 + 192) = @"objectness/map";

      if (v7)
      {
        uint64_t v33 = *(void **)(v31 + 240);
        *(void *)(v31 + 240) = @"slidernet/";
      }
      objc_super v34 = *(void **)(v31 + 88);
      *(void *)(v31 + 88) = @"scenenet_labels_basic-v8d.csv";

      uint64_t v35 = *(void **)(v31 + 96);
      *(void *)(v31 + 96) = @"scenenet_relationships-v8d.txt";

      v36 = *(void **)(v31 + 112);
      *(void *)(v31 + 112) = @"classification/labels";

      uint64_t v37 = *(void **)(v31 + 120);
      *(void *)(v31 + 120) = @"scenenet_op-v8d.plist";

      v38 = *(void **)(v31 + 208);
      *(void *)(v31 + 208) = @"GXdCvXzGnLp59suJyVSan_labels.txt";

      uint64_t v39 = *(void **)(v31 + 216);
      *(void *)(v31 + 216) = @"detection/concat";

      v40 = *(void **)(v31 + 80);
      *(void *)(v31 + 80) = @"data";

      uint64_t v41 = *(void **)(v31 + 104);
      *(void *)(v31 + 104) = @"inner/sceneprint";

      v42 = *(void **)(v31 + 152);
      *(void *)(v31 + 152) = @"scenenet_sc2.4_sa1.4_ae1.4_r9_opt_int8_pca256.pcadata";

      uint64_t v43 = *(void **)(v31 + 160);
      *(void *)(v31 + 160) = @"scenenet_aesthetic_labels_basic-v8e.txt";

      v44 = *(void **)(v31 + 168);
      *(void *)(v31 + 168) = @"aesthetics/scores";

      uint64_t v45 = *(void **)(v31 + 176);
      *(void *)(v31 + 176) = @"aesthetics/attributes";

      uint64_t v46 = *(void **)(v31 + 184);
      *(void *)(v31 + 184) = @"saliency/map";

      uint64_t v47 = [(id)v31 _newCustomClassifierDescriptorWithModelName:@"junk_leaf.r14.j9.espresso" labelsFileName:@"junk_leaf.labels_basic-v3b.txt" inputBlobName:@"stem/SpatialSqueeze_COPY254" outputBlobName:@"leaf/probabilities" error:a6];
      uint64_t v48 = *(void **)(v31 + 264);
      *(void *)(v31 + 264) = v47;

      if (*(void *)(v31 + 264))
      {
        uint64_t v49 = [(id)v31 _newCustomClassifierDescriptorWithModelName:@"junk_hierarchical.r14.j9.espresso" labelsFileName:@"junk_hierarchical.labels_higher_order-v3b.txt" inputBlobName:@"stem/SpatialSqueeze_COPY254" outputBlobName:@"hierarchical/probabilities" error:a6];
        uint64_t v50 = *(void **)(v31 + 272);
        *(void *)(v31 + 272) = v49;

        if (*(void *)(v31 + 272))
        {
          uint64_t v51 = [(id)v31 _newCustomClassifierDescriptorWithModelName:@"vienna.r14.n4.1.espresso" labelsFileName:@"labels_vienna-v1e.txt" inputBlobName:@"stem/SpatialSqueeze_COPY254" outputBlobName:@"leaf/probabilities" error:a6];
          uint64_t v52 = *(void **)(v31 + 280);
          *(void *)(v31 + 280) = v51;

          if (*(void *)(v31 + 280))
          {
            uint64_t v53 = [(id)v31 _newCustomClassifierDescriptorWithModelName:@"landmarks_gating.r14.l3.espresso" labelsFileName:@"landmarks_gating_labels.txt" inputBlobName:@"stem/SpatialSqueeze_COPY254" outputBlobName:@"labels/probabilities" error:a6];
            uint64_t v54 = *(void **)(v31 + 288);
            *(void *)(v31 + 288) = v53;

            if (*(void *)(v31 + 288))
            {
              uint64_t v55 = [(id)v31 _newCustomClassifierDescriptorWithModelName:@"sg.r14.s4.espresso" labelsFileName:@"sg_labels.txt" inputBlobName:@"stem/SpatialSqueeze_NEW254" outputBlobName:@"hierarchical/probabilities" error:a6];
              uint64_t v56 = *(void **)(v31 + 296);
              *(void *)(v31 + 296) = v55;

              if (*(void *)(v31 + 296))
              {
                uint64_t v57 = [(id)v31 _newCustomClassifierDescriptorWithModelName:@"events_gating.r14.e4.espresso" labelsFileName:@"events_gating_labels_basic-v1c.txt" inputBlobName:@"stem/SpatialSqueeze_COPY254" outputBlobName:@"leaf/probabilities" error:a6];
                uint64_t v58 = *(void **)(v31 + 304);
                *(void *)(v31 + 304) = v57;

                if (*(void *)(v31 + 304))
                {
                  uint64_t v59 = [(id)v31 _newCustomClassifierDescriptorWithModelName:@"d76p746ctq_50001_split.espresso" labelsFileName:@"d76p746ctq_50001.txt" inputBlobName:@"stem/gap/Mean" outputBlobName:@"leaf/probabilities" error:a6];
                  v60 = *(void **)(v31 + 312);
                  *(void *)(v31 + 312) = v59;

                  if (*(void *)(v31 + 312))
                  {
                    id v15 = (id)v31;
LABEL_28:

                    id v27 = v65;
                    goto LABEL_29;
                  }
                }
              }
            }
          }
        }
      }
    }
    else if (a6)
    {
      [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"could not create descriptor"];
      id v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    id v15 = 0;
    goto LABEL_28;
  }
LABEL_33:

  return v15;
}

+ (BOOL)_getAnalyzerName:(id *)a3 ANESpecificAnalyzerName:(id *)a4 specifier:(id *)a5 forModel:(unint64_t)a6 objDetNet:(BOOL)a7 sliderNet:(BOOL)a8 error:(id *)a9
{
  if (a6 == 1)
  {
    v10 = a5;
    if (a4) {
      *a4 = 0;
    }
    if (a7 || a8)
    {
      if (a3) {
        *a3 = @"sn3_all_heads_combined_299_no_softmax.espresso";
      }
      if (a5)
      {
        int v11 = [VisionCoreProcessingDescriptorSpecifier alloc];
        id v12 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
        id v13 = @"VisionCoreInferenceNetworkIdentifierSceneNetObjDetNetSliderNet";
LABEL_15:
        v16 = [(VisionCoreProcessingDescriptorSpecifier *)v11 initWithIdentifier:v13 version:v12];
        goto LABEL_16;
      }
    }
    else
    {
      if (a3) {
        *a3 = @"sn3_4heads_combined_299_no_softmax.espresso";
      }
      if (a5)
      {
        int v11 = [VisionCoreProcessingDescriptorSpecifier alloc];
        id v12 = [[VisionCoreResourceVersion alloc] initWithMajor:3 minor:0 micro:0];
        id v13 = @"VisionCoreInferenceNetworkIdentifierSceneNet";
        goto LABEL_15;
      }
    }
  }
  else
  {
    v10 = a9;
    if (a9)
    {
      id v14 = [NSString alloc];
      id v15 = [NSNumber numberWithUnsignedInteger:a6];
      id v12 = (VisionCoreResourceVersion *)[v14 initWithFormat:@"unsupported model %@", v15];

      v16 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v12];
LABEL_16:
      id *v10 = v16;
    }
  }
  return a6 == 1;
}

@end