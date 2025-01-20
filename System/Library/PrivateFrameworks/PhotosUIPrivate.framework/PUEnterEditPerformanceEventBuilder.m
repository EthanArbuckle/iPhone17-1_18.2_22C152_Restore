@interface PUEnterEditPerformanceEventBuilder
- (BOOL)isEditingWithRaw;
- (BOOL)isFirstSinceBoot;
- (BOOL)isFirstSinceLaunch;
- (PUEditableAsset)asset;
- (double)autoCalcDuration;
- (double)enterEditDuration;
- (double)resourceCheckingDuration;
- (double)resourceDownloadDuration;
- (double)resourceLoadingDuration;
- (id)buildEvent;
- (void)setAsset:(id)a3;
- (void)setAutoCalcDuration:(double)a3;
- (void)setEditingWithRaw:(BOOL)a3;
- (void)setEnterEditDuration:(double)a3;
- (void)setFirstSinceBoot:(BOOL)a3;
- (void)setFirstSinceLaunch:(BOOL)a3;
- (void)setResourceCheckingDuration:(double)a3;
- (void)setResourceDownloadDuration:(double)a3;
- (void)setResourceLoadingDuration:(double)a3;
@end

@implementation PUEnterEditPerformanceEventBuilder

- (void).cxx_destruct
{
}

- (void)setAutoCalcDuration:(double)a3
{
  self->_autoCalcDuration = a3;
}

- (double)autoCalcDuration
{
  return self->_autoCalcDuration;
}

- (void)setResourceLoadingDuration:(double)a3
{
  self->_resourceLoadingDuration = a3;
}

- (double)resourceLoadingDuration
{
  return self->_resourceLoadingDuration;
}

- (void)setResourceDownloadDuration:(double)a3
{
  self->_resourceDownloadDuration = a3;
}

- (double)resourceDownloadDuration
{
  return self->_resourceDownloadDuration;
}

- (void)setResourceCheckingDuration:(double)a3
{
  self->_resourceCheckingDuration = a3;
}

- (double)resourceCheckingDuration
{
  return self->_resourceCheckingDuration;
}

- (void)setEnterEditDuration:(double)a3
{
  self->_enterEditDuration = a3;
}

- (double)enterEditDuration
{
  return self->_enterEditDuration;
}

- (void)setEditingWithRaw:(BOOL)a3
{
  self->_editingWithRaw = a3;
}

- (BOOL)isEditingWithRaw
{
  return self->_editingWithRaw;
}

- (void)setFirstSinceLaunch:(BOOL)a3
{
  self->_firstSinceLaunch = a3;
}

- (BOOL)isFirstSinceLaunch
{
  return self->_firstSinceLaunch;
}

- (void)setFirstSinceBoot:(BOOL)a3
{
  self->_firstSinceBoot = a3;
}

- (BOOL)isFirstSinceBoot
{
  return self->_firstSinceBoot;
}

- (void)setAsset:(id)a3
{
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (id)buildEvent
{
  v57[15] = *MEMORY[0x1E4F143B8];
  [(PUEnterEditPerformanceEventBuilder *)self enterEditDuration];
  double v4 = v3;
  [(PUEnterEditPerformanceEventBuilder *)self resourceCheckingDuration];
  double v6 = v5;
  [(PUEnterEditPerformanceEventBuilder *)self resourceDownloadDuration];
  double v8 = v6 + v7;
  [(PUEnterEditPerformanceEventBuilder *)self autoCalcDuration];
  double v10 = v8 + v9;
  v56[0] = @"assetAge";
  v55 = [(PUEnterEditPerformanceEventBuilder *)self asset];
  uint64_t v11 = [v55 creationDate];
  v12 = [MEMORY[0x1E4F1C9C8] date];
  v54 = (void *)v11;
  [v12 timeIntervalSinceDate:v11];
  if (v13 <= 0.0)
  {
    v14 = @"future";
  }
  else if (v13 >= 3600.0)
  {
    if (v13 >= 86400.0)
    {
      if (v13 >= 604800.0)
      {
        if (v13 >= 2592000.0) {
          v14 = @"longer";
        }
        else {
          v14 = @"month";
        }
      }
      else
      {
        v14 = @"week";
      }
    }
    else
    {
      v14 = @"day";
    }
  }
  else
  {
    v14 = @"hour";
  }
  double v15 = v4 - v10;

  v53 = v14;
  v57[0] = v53;
  v56[1] = @"assetDuration";
  v16 = NSNumber;
  v52 = [(PUEnterEditPerformanceEventBuilder *)self asset];
  [v52 duration];
  v51 = objc_msgSend(v16, "numberWithDouble:");
  v57[1] = v51;
  v56[2] = @"assetPixelCount";
  v17 = NSNumber;
  v50 = [(PUEnterEditPerformanceEventBuilder *)self asset];
  uint64_t v18 = [v50 pixelWidth];
  v49 = [(PUEnterEditPerformanceEventBuilder *)self asset];
  v48 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v49, "pixelHeight") * v18);
  v57[2] = v48;
  v56[3] = @"assetSubtypes";
  BOOL v47 = [(PUEnterEditPerformanceEventBuilder *)self isEditingWithRaw];
  if (v47)
  {
    v19 = @"raw";
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F38EB8];
    v40 = [(PUEnterEditPerformanceEventBuilder *)self asset];
    objc_msgSend(v20, "descriptionForMediaSubtypes:", objc_msgSend(v40, "mediaSubtypes"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v41 = v19;
  v57[3] = v19;
  v56[4] = @"assetType";
  v21 = (void *)MEMORY[0x1E4F38EB8];
  v46 = [(PUEnterEditPerformanceEventBuilder *)self asset];
  v45 = objc_msgSend(v21, "descriptionForMediaType:", objc_msgSend(v46, "mediaType"));
  v57[4] = v45;
  v56[5] = @"autoCalcDuration";
  v22 = NSNumber;
  [(PUEnterEditPerformanceEventBuilder *)self autoCalcDuration];
  v44 = objc_msgSend(v22, "numberWithDouble:");
  v57[5] = v44;
  v56[6] = @"bundleIdentifier";
  v43 = [MEMORY[0x1E4F28B50] mainBundle];
  v42 = [v43 bundleIdentifier];
  v57[6] = v42;
  v56[7] = @"iCPLEnabled";
  v23 = NSNumber;
  v24 = [(PUEnterEditPerformanceEventBuilder *)self asset];
  v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "isCloudPhotoLibraryEnabled"));
  v57[7] = v25;
  v56[8] = @"isFirstSinceBoot";
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[PUEnterEditPerformanceEventBuilder isFirstSinceBoot](self, "isFirstSinceBoot"));
  v57[8] = v26;
  v56[9] = @"isFirstSinceLaunch";
  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[PUEnterEditPerformanceEventBuilder isFirstSinceLaunch](self, "isFirstSinceLaunch"));
  v57[9] = v27;
  v56[10] = @"neededToDownload";
  v28 = NSNumber;
  [(PUEnterEditPerformanceEventBuilder *)self resourceDownloadDuration];
  v30 = [v28 numberWithInt:v29 > 0.0];
  v57[10] = v30;
  v56[11] = @"otherDuration";
  v31 = [NSNumber numberWithDouble:v15];
  v57[11] = v31;
  v56[12] = @"resourceCheckingDuration";
  v32 = NSNumber;
  [(PUEnterEditPerformanceEventBuilder *)self resourceCheckingDuration];
  v33 = objc_msgSend(v32, "numberWithDouble:");
  v57[12] = v33;
  v56[13] = @"resourceDownloadDuration";
  v34 = NSNumber;
  [(PUEnterEditPerformanceEventBuilder *)self resourceDownloadDuration];
  v35 = objc_msgSend(v34, "numberWithDouble:");
  v57[13] = v35;
  v56[14] = @"totalDuration";
  v36 = NSNumber;
  [(PUEnterEditPerformanceEventBuilder *)self enterEditDuration];
  v37 = objc_msgSend(v36, "numberWithDouble:");
  v57[14] = v37;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:15];

  if (!v47)
  {
  }
  return v38;
}

@end