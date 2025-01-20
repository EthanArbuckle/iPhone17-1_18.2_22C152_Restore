@interface UIPrintInfo
+ (UIPrintInfo)printInfo;
+ (UIPrintInfo)printInfoWithDictionary:(NSDictionary *)dictionary;
- (BOOL)flipHorizontal;
- (BOOL)imagePDFAnnotations;
- (BOOL)nUpActive;
- (BOOL)pdfAnnotationsAvailable;
- (BOOL)scaleDownOnly;
- (BOOL)scaleToFit;
- (BOOL)scaleUp;
- (NSArray)appliedPresetsList;
- (NSArray)nUpRowsColumns;
- (NSArray)pageRanges;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)jobPreset;
- (NSString)finishingTemplate;
- (NSString)inputSlot;
- (NSString)jobAccountID;
- (NSString)jobName;
- (NSString)mediaType;
- (NSString)outputBin;
- (NSString)pageStackOrder;
- (NSString)pdfPassword;
- (NSString)printerID;
- (UIPrintInfo)init;
- (UIPrintInfo)initWithCoder:(NSCoder *)coder;
- (UIPrintInfoDuplex)duplex;
- (UIPrintInfoOrientation)orientation;
- (UIPrintInfoOutputType)outputType;
- (UIPrintPaper)printPaper;
- (UIPrinter)currentPrinter;
- (double)scalingFactor;
- (id)_createPrintSettingsForPrinter:(id)a3;
- (id)_initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bookletStyle;
- (int64_t)borderType;
- (int64_t)coat;
- (int64_t)copies;
- (int64_t)finishingOption;
- (int64_t)fold;
- (int64_t)laminate;
- (int64_t)nUpLayoutDirection;
- (int64_t)numNUpColumns;
- (int64_t)numNUpRows;
- (int64_t)pageCount;
- (int64_t)punch;
- (int64_t)quality;
- (int64_t)staple;
- (int64_t)trim;
- (void)_updateWithPrinter:(id)a3;
- (void)applyPreset:(id)a3;
- (void)clearPreset:(id)a3 origPrintInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)resetToDefaultSettings:(id)a3;
- (void)setAppliedPresetsList:(id)a3;
- (void)setBookletStyle:(int64_t)a3;
- (void)setBorderType:(int64_t)a3;
- (void)setCoat:(int64_t)a3;
- (void)setCopies:(int64_t)a3;
- (void)setCurrentPrinter:(id)a3;
- (void)setDuplex:(UIPrintInfoDuplex)duplex;
- (void)setFinishingOption:(int64_t)a3;
- (void)setFinishingTemplate:(id)a3;
- (void)setFlipHorizontal:(BOOL)a3;
- (void)setFold:(int64_t)a3;
- (void)setImagePDFAnnotations:(BOOL)a3;
- (void)setInputSlot:(id)a3;
- (void)setJobAccountID:(id)a3;
- (void)setJobName:(NSString *)jobName;
- (void)setJobPreset:(id)a3;
- (void)setLaminate:(int64_t)a3;
- (void)setMediaType:(id)a3;
- (void)setNUpLayoutDirection:(int64_t)a3;
- (void)setNUpRowsColumns:(id)a3;
- (void)setOrientation:(UIPrintInfoOrientation)orientation;
- (void)setOutputBin:(id)a3;
- (void)setOutputType:(UIPrintInfoOutputType)outputType;
- (void)setPageCount:(int64_t)a3;
- (void)setPageRanges:(id)a3;
- (void)setPageStackOrder:(id)a3;
- (void)setPdfAnnotationsAvailable:(BOOL)a3;
- (void)setPdfPassword:(id)a3;
- (void)setPrintPaper:(id)a3;
- (void)setPrinterID:(NSString *)printerID;
- (void)setPunch:(int64_t)a3;
- (void)setQuality:(int64_t)a3;
- (void)setScaleDownOnly:(BOOL)a3;
- (void)setScaleToFit:(BOOL)a3;
- (void)setScaleUp:(BOOL)a3;
- (void)setScalingFactor:(double)a3;
- (void)setStaple:(int64_t)a3;
- (void)setTrim:(int64_t)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation UIPrintInfo

+ (UIPrintInfo)printInfo
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithDictionary:0];
  return (UIPrintInfo *)v2;
}

+ (UIPrintInfo)printInfoWithDictionary:(NSDictionary *)dictionary
{
  v4 = dictionary;
  v5 = (void *)[objc_alloc((Class)a1) _initWithDictionary:v4];

  return (UIPrintInfo *)v5;
}

- (UIPrintInfo)init
{
  return 0;
}

- (id)_initWithDictionary:(id)a3
{
  v109[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)UIPrintInfo;
  v5 = [(UIPrintInfo *)&v108 init];
  if (!v5) {
    goto LABEL_82;
  }
  v6 = (NSString *)CopyDictionaryString(v4, @"UIPrintInfoPrinterIDKey", 0);
  printerID = v5->_printerID;
  v5->_printerID = v6;

  v8 = GetDefaultJobName();
  v9 = (NSString *)CopyDictionaryString(v4, @"UIPrintInfoJobNameKey", v8);
  jobName = v5->_jobName;
  v5->_jobName = v9;

  id v11 = v4;
  v12 = v11;
  if (v11
    && ([v11 objectForKey:@"UIPrintInfoOutputTypeKey"],
        (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = v13;
    int64_t v15 = (int)[v13 intValue];
  }
  else
  {
    int64_t v15 = 0;
  }

  v5->_outputType = v15;
  id v16 = v12;
  v17 = v16;
  if (v12
    && ([v16 objectForKey:@"UIPrintInfoOrientationKey"],
        (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = v18;
    int64_t v20 = (int)[v18 intValue];
  }
  else
  {
    int64_t v20 = 0;
  }

  v5->_orientation = v20;
  int64_t v21 = (v5->_outputType & 0xFFFFFFFFFFFFFFFDLL) != 1;
  id v22 = v17;
  v23 = v22;
  if (v12)
  {
    v24 = [v22 objectForKey:@"UIPrintInfoDuplexKey"];
    if (v24)
    {
      v25 = v24;
      int64_t v21 = (int)[v24 intValue];
    }
    v5->_duplex = v21;
    v26 = [v23 objectForKey:@"UIPrintInfoCopiesKey"];
    if (v26)
    {
      v27 = v26;
      uint64_t v28 = (int)[v26 intValue];

      goto LABEL_17;
    }
  }
  else
  {
    v5->_duplex = v21;
  }
  uint64_t v28 = 1;
LABEL_17:

  v5->_copies = v28;
  id v29 = v23;
  v30 = v29;
  if (v12)
  {
    v31 = [v29 objectForKey:@"UIPrintInfoScaleUpKey"];
    if (v31)
    {
      v32 = v31;
      char v33 = [v31 BOOLValue];
    }
    else
    {
      char v33 = 0;
    }

    v5->_scaleUp = v33;
    v35 = [v30 objectForKey:@"UIPrintInfoStapleKey"];
    if (v35)
    {
      v36 = v35;
      int64_t v34 = (int)[v35 intValue];
    }
    else
    {
      int64_t v34 = 0;
    }
  }
  else
  {
    int64_t v34 = 0;
    v5->_scaleUp = 0;
  }

  v5->_staple = v34;
  id v37 = v30;
  v38 = v37;
  if (v12)
  {
    v39 = [v37 objectForKey:@"UIPrintInfoPunchKey"];
    if (v39)
    {
      v40 = v39;
      int64_t v41 = (int)[v39 intValue];
    }
    else
    {
      int64_t v41 = 0;
    }

    v5->_punch = v41;
    v43 = [v38 objectForKey:@"UIPrintInfoFoldKey"];
    if (v43)
    {
      v44 = v43;
      int64_t v42 = (int)[v43 intValue];
    }
    else
    {
      int64_t v42 = 0;
    }
  }
  else
  {
    int64_t v42 = 0;
    v5->_punch = 0;
  }

  v5->_fold = v42;
  id v45 = v38;
  v46 = v45;
  if (!v12)
  {
    v5->_imagePDFAnnotations = 0;
LABEL_40:
    uint64_t v52 = 4;
    goto LABEL_41;
  }
  v47 = [v45 objectForKey:@"UIPrintInfoImageAnnotationsKey"];
  if (v47)
  {
    v48 = v47;
    char v49 = [v47 BOOLValue];
  }
  else
  {
    char v49 = 0;
  }

  v5->_imagePDFAnnotations = v49;
  v50 = [v46 objectForKey:@"UIPrintInfoQualityKey"];
  if (!v50) {
    goto LABEL_40;
  }
  v51 = v50;
  uint64_t v52 = (int)[v50 intValue];

LABEL_41:
  v5->_quality = v52;
  id v53 = v46;
  v54 = v53;
  if (v12)
  {
    v55 = [v53 objectForKey:@"UIPrintInfoCoatKey"];
    if (v55)
    {
      v56 = v55;
      int64_t v57 = (int)[v55 intValue];
    }
    else
    {
      int64_t v57 = 0;
    }

    v5->_coat = v57;
    v59 = [v54 objectForKey:@"UIPrintInfoLaminateKey"];
    if (v59)
    {
      v60 = v59;
      int64_t v58 = (int)[v59 intValue];
    }
    else
    {
      int64_t v58 = 0;
    }
  }
  else
  {
    int64_t v58 = 0;
    v5->_coat = 0;
  }

  v5->_laminate = v58;
  id v61 = v54;
  v62 = v61;
  if (v12
    && ([v61 objectForKey:@"UIPrintInfoTrimKey"],
        (v63 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v64 = v63;
    int64_t v65 = (int)[v63 intValue];
  }
  else
  {
    int64_t v65 = 0;
  }

  v5->_trim = v65;
  v66 = (NSString *)CopyDictionaryString(v62, @"UIPrintInfoFinishingTemplateKey", 0);
  finishingTemplate = v5->_finishingTemplate;
  v5->_finishingTemplate = v66;

  v68 = (NSString *)CopyDictionaryString(v62, @"UIPrintInfoOutputBinKey", 0);
  outputBin = v5->_outputBin;
  v5->_outputBin = v68;

  v70 = (NSString *)CopyDictionaryString(v62, @"UIPrintInfoPageStackOrderKey", 0);
  pageStackOrder = v5->_pageStackOrder;
  v5->_pageStackOrder = v70;

  v72 = (NSString *)CopyDictionaryString(v62, @"UIPrintInfoInputSlotKey", 0);
  inputSlot = v5->_inputSlot;
  v5->_inputSlot = v72;

  v74 = (NSString *)CopyDictionaryString(v62, @"UIPrintInfoMediaTypeKey", 0);
  mediaType = v5->_mediaType;
  v5->_mediaType = v74;

  if (v12)
  {
    uint64_t v76 = [v62 objectForKey:@"UIPrintInfoJobPresetKey"];
  }
  else
  {
    uint64_t v76 = 0;
  }
  jobPreset = v5->_jobPreset;
  v5->_jobPreset = (NSDictionary *)v76;

  v78 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
  v109[0] = v78;
  v79 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
  v109[1] = v79;
  id v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
  if (v12)
  {
    v81 = [v62 objectForKey:@"UIPrintInfoNUpRowsColumnsKey"];
  }
  else
  {
    v81 = 0;
  }
  if (v81) {
    v82 = v81;
  }
  else {
    v82 = v80;
  }
  v83 = v82;

  nUpRowsColumns = v5->_nUpRowsColumns;
  v5->_nUpRowsColumns = v83;

  id v85 = v62;
  v86 = v85;
  if (v12)
  {
    v87 = [v85 objectForKey:@"UIPrintInfoLayoutDirectionKey"];
    if (v87)
    {
      v88 = v87;
      int64_t v89 = (int)[v87 intValue];
    }
    else
    {
      int64_t v89 = 0;
    }

    v5->_nUpLayoutDirection = v89;
    v91 = [v86 objectForKey:@"UIPrintInfoBorderTypeKey"];
    if (v91)
    {
      v92 = v91;
      int64_t v90 = (int)[v91 intValue];
    }
    else
    {
      int64_t v90 = 0;
    }
  }
  else
  {
    int64_t v90 = 0;
    v5->_nUpLayoutDirection = 0;
  }

  v5->_borderType = v90;
  id v93 = v86;
  v94 = v93;
  if (v12)
  {
    v95 = [v93 objectForKey:@"UIPrintInfoBookletStyleKey"];
    if (v95)
    {
      v96 = v95;
      int64_t v97 = (int)[v95 intValue];
    }
    else
    {
      int64_t v97 = 0;
    }

    v5->_bookletStyle = v97;
    v99 = [v94 objectForKey:@"UIPrintInfoFipHorizontalKey"];
    if (v99)
    {
      v100 = v99;
      char v98 = [v99 BOOLValue];
    }
    else
    {
      char v98 = 0;
    }
  }
  else
  {
    char v98 = 0;
    v5->_bookletStyle = 0;
  }

  v5->_flipHorizontal = v98;
  id v101 = v94;
  v102 = v101;
  double v103 = 1.0;
  if (v12)
  {
    v104 = [v101 objectForKey:@"UIPrintInfoScalingFactorKey"];
    if (v104)
    {
      v105 = v104;
      [v104 floatValue];
      double v103 = v106;
    }
  }

  v5->_scalingFactor = v103;
LABEL_82:

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uint64_t v5 = (self->_outputType & 0xFFFFFFFFFFFFFFFDLL) != 1;
  printerID = self->_printerID;
  if (printerID) {
    [v3 setObject:printerID forKey:@"UIPrintInfoPrinterIDKey"];
  }
  jobName = self->_jobName;
  if (jobName) {
    [v4 setObject:jobName forKey:@"UIPrintInfoJobNameKey"];
  }
  if (self->_outputType)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v8 forKey:@"UIPrintInfoOutputTypeKey"];
  }
  if (self->_orientation)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v9 forKey:@"UIPrintInfoOrientationKey"];
  }
  if (self->_duplex != v5)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v10 forKey:@"UIPrintInfoDuplexKey"];
  }
  if (self->_copies != 1)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v11 forKey:@"UIPrintInfoCopiesKey"];
  }
  if (self->_scaleUp)
  {
    v12 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v4 setObject:v12 forKey:@"UIPrintInfoScaleUpKey"];
  }
  if (self->_staple)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v13 forKey:@"UIPrintInfoStapleKey"];
  }
  if (self->_punch)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v14 forKey:@"UIPrintInfoPunchKey"];
  }
  if (self->_fold)
  {
    int64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v15 forKey:@"UIPrintInfoFoldKey"];
  }
  if (self->_imagePDFAnnotations)
  {
    id v16 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v4 setObject:v16 forKey:@"UIPrintInfoImageAnnotationsKey"];
  }
  if (self->_quality != 4)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v17 forKey:@"UIPrintInfoQualityKey"];
  }
  if (self->_coat)
  {
    v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v18 forKey:@"UIPrintInfoCoatKey"];
  }
  if (self->_laminate)
  {
    v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v19 forKey:@"UIPrintInfoLaminateKey"];
  }
  if (self->_trim)
  {
    int64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v20 forKey:@"UIPrintInfoTrimKey"];
  }
  finishingTemplate = self->_finishingTemplate;
  if (finishingTemplate) {
    [v4 setObject:finishingTemplate forKey:@"UIPrintInfoFinishingTemplateKey"];
  }
  outputBin = self->_outputBin;
  if (outputBin) {
    [v4 setObject:outputBin forKey:@"UIPrintInfoOutputBinKey"];
  }
  pageStackOrder = self->_pageStackOrder;
  if (pageStackOrder) {
    [v4 setObject:pageStackOrder forKey:@"UIPrintInfoPageStackOrderKey"];
  }
  inputSlot = self->_inputSlot;
  if (inputSlot) {
    [v4 setObject:inputSlot forKey:@"UIPrintInfoInputSlotKey"];
  }
  mediaType = self->_mediaType;
  if (mediaType) {
    [v4 setObject:mediaType forKey:@"UIPrintInfoMediaTypeKey"];
  }
  jobPreset = self->_jobPreset;
  if (jobPreset) {
    [v4 setObject:jobPreset forKey:@"UIPrintInfoJobPresetKey"];
  }
  nUpRowsColumns = self->_nUpRowsColumns;
  if (nUpRowsColumns) {
    [v4 setObject:nUpRowsColumns forKey:@"UIPrintInfoNUpRowsColumnsKey"];
  }
  if (self->_nUpLayoutDirection)
  {
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v28 forKey:@"UIPrintInfoLayoutDirectionKey"];
  }
  if (self->_borderType)
  {
    id v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v29 forKey:@"UIPrintInfoBorderTypeKey"];
  }
  if (self->_bookletStyle)
  {
    v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v4 setObject:v30 forKey:@"UIPrintInfoBookletStyleKey"];
  }
  if (self->_flipHorizontal)
  {
    v31 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v4 setObject:v31 forKey:@"UIPrintInfoFipHorizontalKey"];
  }
  if (self->_scalingFactor != 1.0)
  {
    v32 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    [v4 setObject:v32 forKey:@"UIPrintInfoScalingFactorKey"];
  }
  return (NSDictionary *)v4;
}

- (UIPrintInfo)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  uint64_t v5 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoPrinterIDKey"];
  printerID = self->_printerID;
  self->_printerID = v5;

  v7 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoJobNameKey"];
  jobName = self->_jobName;
  self->_jobName = v7;

  self->_outputType = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoOutputTypeKey"];
  self->_orientation = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoOrientationKey"];
  self->_duplex = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoDuplexKey"];
  self->_copies = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoCopiesKey"];
  self->_scaleUp = [(NSCoder *)v4 decodeBoolForKey:@"UIPrintInfoScaleUpKey"];
  self->_staple = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoStapleKey"];
  self->_punch = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoPunchKey"];
  self->_fold = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoFoldKey"];
  self->_imagePDFAnnotations = [(NSCoder *)v4 decodeBoolForKey:@"UIPrintInfoImageAnnotationsKey"];
  self->_quality = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoQualityKey"];
  self->_coat = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoCoatKey"];
  self->_laminate = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoLaminateKey"];
  self->_trim = [(NSCoder *)v4 decodeIntForKey:@"UIPrintInfoTrimKey"];
  v9 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoFinishingTemplateKey"];
  finishingTemplate = self->_finishingTemplate;
  self->_finishingTemplate = v9;

  id v11 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoOutputBinKey"];
  outputBin = self->_outputBin;
  self->_outputBin = v11;

  v13 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoPageStackOrderKey"];
  pageStackOrder = self->_pageStackOrder;
  self->_pageStackOrder = v13;

  int64_t v15 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoInputSlotKey"];
  inputSlot = self->_inputSlot;
  self->_inputSlot = v15;

  v17 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoMediaTypeKey"];
  mediaType = self->_mediaType;
  self->_mediaType = v17;

  v19 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoJobPresetKey"];
  jobPreset = self->_jobPreset;
  self->_jobPreset = v19;

  int64_t v21 = [(NSCoder *)v4 decodeObjectForKey:@"UIPrintInfoNUpRowsColumnsKey"];
  nUpRowsColumns = self->_nUpRowsColumns;
  self->_nUpRowsColumns = v21;

  self->_nUpLayoutDirection = [(NSCoder *)v4 decodeIntegerForKey:@"UIPrintInfoLayoutDirectionKey"];
  self->_borderType = [(NSCoder *)v4 decodeIntegerForKey:@"UIPrintInfoBorderTypeKey"];
  self->_bookletStyle = [(NSCoder *)v4 decodeIntegerForKey:@"UIPrintInfoBookletStyleKey"];
  self->_flipHorizontal = [(NSCoder *)v4 decodeBoolForKey:@"UIPrintInfoFipHorizontalKey"];
  [(NSCoder *)v4 decodeFloatForKey:@"UIPrintInfoScalingFactorKey"];
  float v24 = v23;

  self->_scalingFactor = v24;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  printerID = self->_printerID;
  id v29 = v4;
  if (printerID)
  {
    [v4 encodeObject:printerID forKey:@"UIPrintInfoPrinterIDKey"];
    id v4 = v29;
  }
  jobName = self->_jobName;
  if (jobName)
  {
    [v29 encodeObject:jobName forKey:@"UIPrintInfoJobNameKey"];
    id v4 = v29;
  }
  int64_t outputType = self->_outputType;
  if (outputType)
  {
    [v29 encodeInt:outputType forKey:@"UIPrintInfoOutputTypeKey"];
    id v4 = v29;
  }
  int64_t orientation = self->_orientation;
  if (orientation)
  {
    [v29 encodeInt:orientation forKey:@"UIPrintInfoOrientationKey"];
    id v4 = v29;
  }
  int64_t duplex = self->_duplex;
  if (duplex)
  {
    [v29 encodeInt:duplex forKey:@"UIPrintInfoDuplexKey"];
    id v4 = v29;
  }
  int64_t copies = self->_copies;
  if (copies)
  {
    [v29 encodeInt:copies forKey:@"UIPrintInfoCopiesKey"];
    id v4 = v29;
  }
  if (self->_scaleUp)
  {
    [v29 encodeBool:1 forKey:@"UIPrintInfoScaleUpKey"];
    id v4 = v29;
  }
  int64_t staple = self->_staple;
  if (staple)
  {
    [v29 encodeInt:staple forKey:@"UIPrintInfoStapleKey"];
    id v4 = v29;
  }
  int64_t punch = self->_punch;
  if (punch)
  {
    [v29 encodeInt:punch forKey:@"UIPrintInfoPunchKey"];
    id v4 = v29;
  }
  int64_t fold = self->_fold;
  if (fold)
  {
    [v29 encodeInt:fold forKey:@"UIPrintInfoFoldKey"];
    id v4 = v29;
  }
  if (self->_imagePDFAnnotations)
  {
    [v29 encodeBool:1 forKey:@"UIPrintInfoImageAnnotationsKey"];
    id v4 = v29;
  }
  int64_t quality = self->_quality;
  if (quality != 4)
  {
    [v29 encodeInt:quality forKey:@"UIPrintInfoQualityKey"];
    id v4 = v29;
  }
  int64_t coat = self->_coat;
  if (coat)
  {
    [v29 encodeInt:coat forKey:@"UIPrintInfoCoatKey"];
    id v4 = v29;
  }
  int64_t laminate = self->_laminate;
  if (laminate)
  {
    [v29 encodeInt:laminate forKey:@"UIPrintInfoLaminateKey"];
    id v4 = v29;
  }
  int64_t trim = self->_trim;
  if (trim)
  {
    [v29 encodeInt:trim forKey:@"UIPrintInfoTrimKey"];
    id v4 = v29;
  }
  finishingTemplate = self->_finishingTemplate;
  if (finishingTemplate)
  {
    [v29 encodeObject:finishingTemplate forKey:@"UIPrintInfoFinishingTemplateKey"];
    id v4 = v29;
  }
  outputBin = self->_outputBin;
  if (outputBin)
  {
    [v29 encodeObject:outputBin forKey:@"UIPrintInfoOutputBinKey"];
    id v4 = v29;
  }
  pageStackOrder = self->_pageStackOrder;
  if (pageStackOrder)
  {
    [v29 encodeObject:pageStackOrder forKey:@"UIPrintInfoPageStackOrderKey"];
    id v4 = v29;
  }
  inputSlot = self->_inputSlot;
  if (inputSlot)
  {
    [v29 encodeObject:inputSlot forKey:@"UIPrintInfoInputSlotKey"];
    id v4 = v29;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    [v29 encodeObject:mediaType forKey:@"UIPrintInfoMediaTypeKey"];
    id v4 = v29;
  }
  jobPreset = self->_jobPreset;
  if (jobPreset)
  {
    [v29 encodeObject:jobPreset forKey:@"UIPrintInfoJobPresetKey"];
    id v4 = v29;
  }
  nUpRowsColumns = self->_nUpRowsColumns;
  if (nUpRowsColumns)
  {
    [v29 encodeObject:nUpRowsColumns forKey:@"UIPrintInfoNUpRowsColumnsKey"];
    id v4 = v29;
  }
  int64_t nUpLayoutDirection = self->_nUpLayoutDirection;
  if (nUpLayoutDirection)
  {
    [v29 encodeInteger:nUpLayoutDirection forKey:@"UIPrintInfoLayoutDirectionKey"];
    id v4 = v29;
  }
  int64_t borderType = self->_borderType;
  if (borderType)
  {
    [v29 encodeInteger:borderType forKey:@"UIPrintInfoBorderTypeKey"];
    id v4 = v29;
  }
  int64_t bookletStyle = self->_bookletStyle;
  if (bookletStyle)
  {
    [v29 encodeInteger:bookletStyle forKey:@"UIPrintInfoBookletStyleKey"];
    id v4 = v29;
  }
  if (self->_flipHorizontal)
  {
    [v29 encodeBool:1 forKey:@"UIPrintInfoFipHorizontalKey"];
    id v4 = v29;
  }
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != 1.0)
  {
    *(float *)&double scalingFactor = scalingFactor;
    [v29 encodeFloat:@"UIPrintInfoScalingFactorKey" forKey:scalingFactor];
    id v4 = v29;
  }
}

- (void)updateWithDictionary:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__UIPrintInfo_updateWithDictionary___block_invoke;
  v3[3] = &unk_1E6DA1B78;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __36__UIPrintInfo_updateWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v9 isEqual:@"UIPrintInfoOutputTypeKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setOutputType:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoOrientationKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setOrientation:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoDuplexKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setDuplex:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoCopiesKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setCopies:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoScaleUpKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setScaleUp:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoImageAnnotationsKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setImagePDFAnnotations:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoQualityKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setQuality:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoStapleKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setStaple:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoPunchKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setPunch:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoFoldKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setFold:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoCoatKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setCoat:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoLaminateKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setLaminate:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoTrimKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setTrim:", (int)objc_msgSend(v5, "intValue"));
    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoFinishingTemplateKey"])
  {
    v6 = [v5 stringValue];
    [*(id *)(a1 + 32) setFinishingTemplate:v6];
LABEL_39:

    goto LABEL_40;
  }
  if ([v9 isEqual:@"UIPrintInfoOutputBinKey"])
  {
    v6 = [v5 stringValue];
    [*(id *)(a1 + 32) setOutputBin:v6];
    goto LABEL_39;
  }
  if ([v9 isEqual:@"UIPrintInfoPageStackOrderKey"])
  {
    v6 = [v5 stringValue];
    [*(id *)(a1 + 32) setPageStackOrder:v6];
    goto LABEL_39;
  }
  if ([v9 isEqual:@"UIPrintInfoInputSlotKey"])
  {
    v6 = [v5 stringValue];
    [*(id *)(a1 + 32) setInputSlot:v6];
    goto LABEL_39;
  }
  if ([v9 isEqual:@"UIPrintInfoMediaTypeKey"])
  {
    v6 = [v5 stringValue];
    [*(id *)(a1 + 32) setMediaType:v6];
    goto LABEL_39;
  }
  if ([v9 isEqual:@"UIPrintInfoJobPresetKey"])
  {
    [*(id *)(a1 + 32) setJobPreset:v5];
    v7 = *(void **)(a1 + 32);
    v6 = [v7 jobPreset];
    [v7 applyPreset:v6];
    goto LABEL_39;
  }
  if ([v9 isEqual:@"UIPrintInfoNUpRowsColumnsKey"])
  {
    [*(id *)(a1 + 32) setNUpRowsColumns:v5];
  }
  else if ([v9 isEqual:@"UIPrintInfoLayoutDirectionKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setNUpLayoutDirection:", objc_msgSend(v5, "integerValue"));
  }
  else if ([v9 isEqual:@"UIPrintInfoBorderTypeKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setBorderType:", objc_msgSend(v5, "integerValue"));
  }
  else if ([v9 isEqual:@"UIPrintInfoBookletStyleKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setBookletStyle:", objc_msgSend(v5, "integerValue"));
  }
  else if ([v9 isEqual:@"UIPrintInfoFipHorizontalKey"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setFlipHorizontal:", objc_msgSend(v5, "BOOLValue"));
  }
  else if ([v9 isEqual:@"UIPrintInfoScalingFactorKey"])
  {
    [v5 floatValue];
    [*(id *)(a1 + 32) setScalingFactor:v8];
  }
LABEL_40:
}

- (void)resetToDefaultSettings:(id)a3
{
  id v4 = a3;
  [(UIPrintInfo *)self setJobPreset:0];
  [(UIPrintInfo *)self setAppliedPresetsList:0];
  -[UIPrintInfo setFinishingOption:](self, "setFinishingOption:", [v4 finishingOption]);
  id v5 = [v4 finishingTemplate];
  [(UIPrintInfo *)self setFinishingTemplate:v5];

  -[UIPrintInfo setStaple:](self, "setStaple:", [v4 staple]);
  -[UIPrintInfo setPunch:](self, "setPunch:", [v4 punch]);
  -[UIPrintInfo setFold:](self, "setFold:", [v4 fold]);
  -[UIPrintInfo setLaminate:](self, "setLaminate:", [v4 laminate]);
  -[UIPrintInfo setCoat:](self, "setCoat:", [v4 coat]);
  -[UIPrintInfo setTrim:](self, "setTrim:", [v4 trim]);
  v6 = [v4 pageStackOrder];
  [(UIPrintInfo *)self setPageStackOrder:v6];

  v7 = [v4 outputBin];

  [(UIPrintInfo *)self setOutputBin:v7];
  id v9 = [(UIPrintInfo *)self currentPrinter];
  float v8 = [v9 _internalPrinter];
  [(UIPrintInfo *)self _updateWithPrinter:v8];
}

- (void)applyPreset:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [a3 objectForKey:*MEMORY[0x1E4F933D0]];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v43 = long long v53 = 0u;
  id obj = [v43 allKeys];
  uint64_t v44 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v44)
  {
    uint64_t v4 = *(void *)v51;
    uint64_t v5 = *MEMORY[0x1E4F93320];
    uint64_t v45 = *MEMORY[0x1E4F93428];
    uint64_t v41 = *MEMORY[0x1E4F93478];
    uint64_t v6 = *MEMORY[0x1E4F933B0];
    uint64_t v7 = *MEMORY[0x1E4F93310];
    uint64_t v32 = *MEMORY[0x1E4F933C8];
    uint64_t v8 = *MEMORY[0x1E4F933C0];
    uint64_t v36 = *MEMORY[0x1E4F93420];
    uint64_t v34 = *MEMORY[0x1E4F93418];
    uint64_t v39 = *MEMORY[0x1E4F93328];
    uint64_t v35 = *MEMORY[0x1E4F93338];
    uint64_t v37 = *(void *)v51;
    uint64_t v38 = *MEMORY[0x1E4F93330];
    uint64_t v42 = *MEMORY[0x1E4F933B0];
    uint64_t v33 = *MEMORY[0x1E4F93320];
    uint64_t v31 = *MEMORY[0x1E4F933C0];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v51 != v4) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
        if ([v10 isEqualToString:v5])
        {
          id v11 = [v43 objectForKey:v5];
          if ((([v11 isEqualToString:v39] & 1) != 0
             || [v11 isEqualToString:v35])
            && [(UIPrintInfo *)self duplex] == UIPrintInfoDuplexNone)
          {
            uint64_t v12 = 1;
LABEL_21:
            [(UIPrintInfo *)self setDuplex:v12];
          }
          else if ([v11 isEqualToString:v38])
          {
            uint64_t v12 = 0;
            goto LABEL_21;
          }
LABEL_57:

          uint64_t v6 = v42;
          goto LABEL_58;
        }
        if (([v10 isEqualToString:v45] & 1) != 0
          || [v10 isEqualToString:v41])
        {
          if ([v10 isEqualToString:v41])
          {
            v13 = [v43 objectForKey:v41];
            uint64_t v14 = [v13 integerValue];

            uint64_t v6 = v42;
            uint64_t v15 = v14;
            uint64_t v4 = v37;
            [(UIPrintInfo *)self setQuality:v15];
          }
          if ([v10 isEqualToString:v45])
          {
            id v11 = [v43 objectForKey:v45];
            if ([v11 containsString:v36] && -[UIPrintInfo quality](self, "quality") == 4)
            {
              uint64_t v16 = 2;
            }
            else if ([v11 isEqualToString:v34] {
                   && [(UIPrintInfo *)self quality] == 5)
            }
            {
              uint64_t v16 = 1;
            }
            else if ([v11 containsString:v36] {
                   && [(UIPrintInfo *)self quality] == 5)
            }
            {
              uint64_t v16 = 3;
            }
            else
            {
              uint64_t v16 = 0;
            }
            [(UIPrintInfo *)self setOutputType:v16];
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        if ([v10 isEqualToString:v6])
        {
          v17 = arrayForKey(v43, v6);
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v54 count:16];
          if (!v18) {
            goto LABEL_51;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v47;
          while (1)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v47 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = [*(id *)(*((void *)&v46 + 1) + 8 * i) integerValue];
              if (v22 > 15)
              {
                char v23 = v22 - 16;
                if ((unint64_t)(v22 - 16) <= 0x3F)
                {
                  if (((1 << v23) & 0xC00033030) != 0) {
                    goto LABEL_44;
                  }
                  if (((1 << v23) & 0xCCC0000000000000) != 0) {
                    goto LABEL_48;
                  }
                  if (v22 == 16)
                  {
                    [(UIPrintInfo *)self setLaminate:16];
                    continue;
                  }
                }
                if ((unint64_t)(v22 - 90) < 0xB)
                {
                  -[UIPrintInfo setFold:](self, "setFold:");
                  continue;
                }
                if ((unint64_t)(v22 - 82) < 2)
                {
LABEL_48:
                  [(UIPrintInfo *)self setPunch:v22];
                  continue;
                }
              }
              else if (v22 > 7)
              {
                if (v22 == 8)
                {
LABEL_44:
                  [(UIPrintInfo *)self setStaple:v22];
                  continue;
                }
                if (v22 == 15) {
                  -[UIPrintInfo setCoat:](self, "setCoat:");
                }
              }
              else
              {
                if (v22 == 4) {
                  goto LABEL_44;
                }
                if (v22 == 5) {
                  goto LABEL_48;
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (!v19)
            {
LABEL_51:
              [(UIPrintInfo *)self setFinishingOption:2];

              uint64_t v4 = v37;
              uint64_t v6 = v42;
              goto LABEL_64;
            }
          }
        }
        if ([v10 isEqualToString:v7])
        {
          float v24 = [v43 objectForKey:v7];
          uint64_t v25 = [v24 integerValue];

          uint64_t v4 = v37;
          uint64_t v26 = v25;
          uint64_t v6 = v42;
          [(UIPrintInfo *)self setCopies:v26];
LABEL_64:
          uint64_t v5 = v33;
          goto LABEL_58;
        }
        if ([v10 isEqualToString:v32])
        {
          v27 = [v43 objectForKey:v32];
          [(UIPrintInfo *)self setMediaType:v27];

          uint64_t v4 = v37;
          goto LABEL_64;
        }
        uint64_t v5 = v33;
        if ([v10 isEqualToString:v8])
        {
          uint64_t v8 = v31;
          uint64_t v28 = [v43 objectForKey:v31];
          [(UIPrintInfo *)self setInputSlot:v28];
        }
        else if ([v10 isEqual:@"UIPrintInfoNUpRowsColumnsKey"])
        {
          uint64_t v28 = [v43 objectForKey:@"UIPrintInfoNUpRowsColumnsKey"];
          [(UIPrintInfo *)self setNUpRowsColumns:v28];
        }
        else if ([v10 isEqual:@"UIPrintInfoLayoutDirectionKey"])
        {
          uint64_t v28 = [v43 objectForKey:@"UIPrintInfoLayoutDirectionKey"];
          -[UIPrintInfo setNUpLayoutDirection:](self, "setNUpLayoutDirection:", [v28 integerValue]);
        }
        else if ([v10 isEqual:@"UIPrintInfoBorderTypeKey"])
        {
          uint64_t v28 = [v43 objectForKey:@"UIPrintInfoBorderTypeKey"];
          -[UIPrintInfo setBorderType:](self, "setBorderType:", [v28 integerValue]);
        }
        else if ([v10 isEqual:@"UIPrintInfoBookletStyleKey"])
        {
          uint64_t v28 = [v43 objectForKey:@"UIPrintInfoBookletStyleKey"];
          -[UIPrintInfo setBookletStyle:](self, "setBookletStyle:", [v28 integerValue]);
        }
        else if ([v10 isEqual:@"UIPrintInfoFipHorizontalKey"])
        {
          uint64_t v28 = [v43 objectForKey:@"UIPrintInfoFipHorizontalKey"];
          -[UIPrintInfo setFlipHorizontal:](self, "setFlipHorizontal:", [v28 BOOLValue]);
        }
        else
        {
          if (![v10 isEqual:@"UIPrintInfoScalingFactorKey"]) {
            goto LABEL_58;
          }
          uint64_t v28 = [v43 objectForKey:@"UIPrintInfoScalingFactorKey"];
          [v28 floatValue];
          [(UIPrintInfo *)self setScalingFactor:v29];
        }

        uint64_t v4 = v37;
LABEL_58:
        ++v9;
      }
      while (v9 != v44);
      uint64_t v30 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      uint64_t v44 = v30;
    }
    while (v30);
  }
}

- (void)clearPreset:(id)a3 origPrintInfo:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v39 = [a3 objectForKey:*MEMORY[0x1E4F933D0]];
  -[UIPrintInfo setCopies:](self, "setCopies:", [v6 copies]);
  uint64_t v7 = [v6 pageRanges];
  [(UIPrintInfo *)self setPageRanges:v7];

  uint64_t v8 = [(UIPrintInfo *)self currentPrinter];
  if ([v8 supportsDuplex]) {
    uint64_t v9 = [v6 duplex];
  }
  else {
    uint64_t v9 = 0;
  }
  [(UIPrintInfo *)self setDuplex:v9];

  -[UIPrintInfo setOutputType:](self, "setOutputType:", [v6 outputType]);
  v10 = [v6 printPaper];
  [(UIPrintInfo *)self setPrintPaper:v10];

  -[UIPrintInfo setOrientation:](self, "setOrientation:", [v6 orientation]);
  [v6 scalingFactor];
  -[UIPrintInfo setScalingFactor:](self, "setScalingFactor:");
  -[UIPrintInfo setImagePDFAnnotations:](self, "setImagePDFAnnotations:", [v6 imagePDFAnnotations]);
  id v11 = [v6 inputSlot];
  [(UIPrintInfo *)self setInputSlot:v11];

  uint64_t v12 = [v6 mediaType];
  [(UIPrintInfo *)self setMediaType:v12];

  -[UIPrintInfo setQuality:](self, "setQuality:", [v6 quality]);
  [(UIPrintInfo *)self setNUpRowsColumns:0];
  [(UIPrintInfo *)self setNUpLayoutDirection:0];
  [(UIPrintInfo *)self setBorderType:0];
  [(UIPrintInfo *)self setBookletStyle:0];
  [(UIPrintInfo *)self setFlipHorizontal:0];
  -[UIPrintInfo setFinishingOption:](self, "setFinishingOption:", [v6 finishingOption]);
  v13 = [v6 finishingTemplate];
  [(UIPrintInfo *)self setFinishingTemplate:v13];

  -[UIPrintInfo setStaple:](self, "setStaple:", [v6 staple]);
  -[UIPrintInfo setPunch:](self, "setPunch:", [v6 punch]);
  -[UIPrintInfo setFold:](self, "setFold:", [v6 fold]);
  -[UIPrintInfo setLaminate:](self, "setLaminate:", [v6 laminate]);
  -[UIPrintInfo setCoat:](self, "setCoat:", [v6 coat]);
  -[UIPrintInfo setTrim:](self, "setTrim:", [v6 trim]);
  uint64_t v14 = [v6 pageStackOrder];
  [(UIPrintInfo *)self setPageStackOrder:v14];

  uint64_t v15 = [v6 outputBin];
  [(UIPrintInfo *)self setOutputBin:v15];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v16 = [v39 allKeys];
  uint64_t v43 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v43)
  {
    uint64_t v17 = *(void *)v49;
    uint64_t v18 = *MEMORY[0x1E4F93320];
    uint64_t v42 = *MEMORY[0x1E4F93428];
    uint64_t v41 = *MEMORY[0x1E4F93478];
    uint64_t v19 = *MEMORY[0x1E4F933B0];
    uint64_t v36 = *MEMORY[0x1E4F93310];
    uint64_t v34 = *MEMORY[0x1E4F933C0];
    uint64_t v35 = *MEMORY[0x1E4F933C8];
    uint64_t v37 = *(void *)v49;
    uint64_t v38 = v16;
    uint64_t v40 = *MEMORY[0x1E4F93320];
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v16);
        }
        int64_t v21 = *(void **)(*((void *)&v48 + 1) + 8 * v20);
        if (objc_msgSend(v21, "isEqualToString:", v18, v34))
        {
          uint64_t v22 = [(UIPrintInfo *)self currentPrinter];
          if ([v22 supportsDuplex]) {
            uint64_t v23 = [v6 duplex];
          }
          else {
            uint64_t v23 = 0;
          }
          [(UIPrintInfo *)self setDuplex:v23];
          goto LABEL_16;
        }
        if ([v21 isEqualToString:v42])
        {
          -[UIPrintInfo setOutputType:](self, "setOutputType:", [v6 outputType]);
          goto LABEL_17;
        }
        if ([v21 isEqualToString:v41])
        {
          -[UIPrintInfo setQuality:](self, "setQuality:", [v6 quality]);
          goto LABEL_17;
        }
        if ([v21 isEqualToString:v19])
        {
          float v24 = arrayForKey(v39, v19);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (!v25) {
            goto LABEL_47;
          }
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v45;
          while (1)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v45 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = [*(id *)(*((void *)&v44 + 1) + 8 * i) integerValue];
              if (v29 > 15)
              {
                char v30 = v29 - 16;
                if ((unint64_t)(v29 - 16) <= 0x3F)
                {
                  if (((1 << v30) & 0xC00033030) != 0) {
                    goto LABEL_40;
                  }
                  if (((1 << v30) & 0xCCC0000000000000) != 0) {
                    goto LABEL_44;
                  }
                  if (v29 == 16)
                  {
                    -[UIPrintInfo setLaminate:](self, "setLaminate:", [v6 laminate]);
                    continue;
                  }
                }
                if ((unint64_t)(v29 - 90) < 0xB)
                {
                  -[UIPrintInfo setFold:](self, "setFold:", [v6 fold]);
                  continue;
                }
                if ((unint64_t)(v29 - 82) < 2)
                {
LABEL_44:
                  -[UIPrintInfo setPunch:](self, "setPunch:", [v6 punch]);
                  continue;
                }
              }
              else if (v29 > 7)
              {
                if (v29 == 8)
                {
LABEL_40:
                  -[UIPrintInfo setStaple:](self, "setStaple:", [v6 staple]);
                  continue;
                }
                if (v29 == 15) {
                  -[UIPrintInfo setCoat:](self, "setCoat:", [v6 coat]);
                }
              }
              else
              {
                if (v29 == 4) {
                  goto LABEL_40;
                }
                if (v29 == 5) {
                  goto LABEL_44;
                }
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (!v26)
            {
LABEL_47:
              [(UIPrintInfo *)self setFinishingOption:2];

              uint64_t v17 = v37;
              uint64_t v16 = v38;
              goto LABEL_52;
            }
          }
        }
        if ([v21 isEqualToString:v36])
        {
          -[UIPrintInfo setCopies:](self, "setCopies:", [v6 copies]);
LABEL_52:
          uint64_t v18 = v40;
          goto LABEL_17;
        }
        if ([v21 isEqualToString:v35])
        {
          uint64_t v31 = [v6 mediaType];
          [(UIPrintInfo *)self setMediaType:v31];

          goto LABEL_52;
        }
        if ([v21 isEqualToString:v34])
        {
          uint64_t v32 = [v6 inputSlot];
          [(UIPrintInfo *)self setInputSlot:v32];

          goto LABEL_52;
        }
        uint64_t v18 = v40;
        if ([v21 isEqual:@"UIPrintInfoNUpRowsColumnsKey"])
        {
          uint64_t v22 = [v6 nUpRowsColumns];
          [(UIPrintInfo *)self setNUpRowsColumns:v22];
LABEL_16:

          goto LABEL_17;
        }
        if ([v21 isEqual:@"UIPrintInfoLayoutDirectionKey"])
        {
          -[UIPrintInfo setNUpLayoutDirection:](self, "setNUpLayoutDirection:", [v6 nUpLayoutDirection]);
        }
        else if ([v21 isEqual:@"UIPrintInfoBorderTypeKey"])
        {
          -[UIPrintInfo setBorderType:](self, "setBorderType:", [v6 borderType]);
        }
        else if ([v21 isEqual:@"UIPrintInfoBookletStyleKey"])
        {
          -[UIPrintInfo setBookletStyle:](self, "setBookletStyle:", [v6 bookletStyle]);
        }
        else if ([v21 isEqual:@"UIPrintInfoFipHorizontalKey"])
        {
          -[UIPrintInfo setFlipHorizontal:](self, "setFlipHorizontal:", [v6 flipHorizontal]);
        }
        else if ([v21 isEqual:@"UIPrintInfoScalingFactorKey"])
        {
          [v6 scalingFactor];
          -[UIPrintInfo setScalingFactor:](self, "setScalingFactor:");
        }
LABEL_17:
        ++v20;
      }
      while (v20 != v43);
      uint64_t v33 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
      uint64_t v43 = v33;
    }
    while (v33);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(UIPrintInfo *)self dictionaryRepresentation];
  id v6 = (void *)[v4 _initWithDictionary:v5];

  return v6;
}

- (void)_updateWithPrinter:(id)a3
{
  id v24 = a3;
  id v4 = [v24 name];
  uint64_t v5 = (NSString *)[v4 copy];
  printerID = self->_printerID;
  self->_printerID = v5;

  if ([v24 hasPrintInfoSupported])
  {
    uint64_t v7 = [v24 printInfoSupported];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 objectForKey:*MEMORY[0x1E4F93320]];
      char v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  char v10 = 1;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:
  int64_t duplex = self->_duplex;
  if (duplex == 1)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F93338];
  }
  else
  {
    if (duplex != 2) {
      goto LABEL_12;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F93328];
  }
  if (([v9 containsObject:*v12] & 1) == 0) {
    self->_int64_t duplex = 0;
  }
LABEL_12:
  if (v10)
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v13 = [v8 objectForKey:*MEMORY[0x1E4F93378]];
  }
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_staple];
  char v15 = [v13 containsObject:v14];

  if ((v15 & 1) == 0) {
    self->_int64_t staple = 0;
  }
  uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_punch];
  char v17 = [v13 containsObject:v16];

  if ((v17 & 1) == 0) {
    self->_int64_t punch = 0;
  }
  uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_fold];
  char v19 = [v13 containsObject:v18];

  if ((v19 & 1) == 0) {
    self->_int64_t fold = 0;
  }
  uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_coat];
  char v21 = [v13 containsObject:v20];

  if ((v21 & 1) == 0) {
    self->_int64_t coat = 0;
  }
  uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_laminate];
  char v23 = [v13 containsObject:v22];

  if ((v23 & 1) == 0) {
    self->_int64_t laminate = 0;
  }
}

- (id)_createPrintSettingsForPrinter:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F932F0]);
  if (self->_copies >= 1)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v5 setObject:v6 forKey:*MEMORY[0x1E4F93310]];
  }
  if ((self->_outputType | 2) == 3) {
    goto LABEL_4;
  }
  int64_t duplex = self->_duplex;
  if (duplex == 2)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F93328];
  }
  else
  {
    if (duplex != 1)
    {
LABEL_4:
      uint64_t v7 = (void *)MEMORY[0x1E4F93330];
      goto LABEL_5;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F93338];
  }
LABEL_5:
  uint64_t v8 = *MEMORY[0x1E4F93320];
  [v5 setObject:*v7 forKey:*MEMORY[0x1E4F93320]];
  if ([(UIPrintInfo *)self bookletStyle] == 1) {
    [v5 setObject:*MEMORY[0x1E4F93328] forKey:v8];
  }
  int v9 = [(UIPrintInfo *)self numNUpRows];
  int v10 = [(UIPrintInfo *)self numNUpColumns] * v9;
  if (v10 < 2)
  {
    if (self->_orientation != 1) {
      goto LABEL_36;
    }
    char v20 = [v4 hasPrintInfoSupported];
    char v21 = (uint64_t *)MEMORY[0x1E4F933F0];
    if (v20)
    {
      uint64_t v22 = [v4 printInfoSupported];
      uint64_t v23 = *v21;
      id v16 = [v22 objectForKey:v23];
    }
    else
    {
      id v16 = 0;
      uint64_t v23 = *MEMORY[0x1E4F933F0];
    }
    uint64_t v25 = (void *)*MEMORY[0x1E4F93408];
    if ([v16 containsObject:*MEMORY[0x1E4F93408]]) {
      id v19 = v25;
    }
    else {
      id v19 = (id)*MEMORY[0x1E4F933F8];
    }
    uint64_t v18 = v5;
    uint64_t v17 = v23;
  }
  else
  {
    if (((1 << v10) & 0x10210) != 0) {
      id v11 = (id *)MEMORY[0x1E4F93400];
    }
    else {
      id v11 = (id *)MEMORY[0x1E4F933F8];
    }
    if (((1 << v10) & 0x10210) != 0) {
      uint64_t v12 = (id *)MEMORY[0x1E4F933F8];
    }
    else {
      uint64_t v12 = (id *)MEMORY[0x1E4F93400];
    }
    if (v10 <= 0x10) {
      v13 = v11;
    }
    else {
      v13 = (id *)MEMORY[0x1E4F933F8];
    }
    if (v10 <= 0x10) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = (id *)MEMORY[0x1E4F93400];
    }
    if ([(UIPrintInfo *)self orientation]) {
      char v15 = v14;
    }
    else {
      char v15 = v13;
    }
    id v16 = *v15;
    uint64_t v17 = *MEMORY[0x1E4F933F0];
    uint64_t v18 = v5;
    id v19 = v16;
  }
  [v18 setObject:v19 forKey:v17];

LABEL_36:
  NSUInteger v26 = [(NSString *)self->_jobName length];
  uint64_t v27 = (void *)MEMORY[0x1E4F933A0];
  if (v26)
  {
    [v5 setObject:self->_jobName forKey:*MEMORY[0x1E4F933A0]];
  }
  else
  {
    uint64_t v28 = GetDefaultJobName();
    [v5 setObject:v28 forKey:*v27];
  }
  int64_t outputType = self->_outputType;
  switch(outputType)
  {
    case 1:
      uint64_t v31 = (void *)MEMORY[0x1E4F93418];
LABEL_45:
      [v5 setObject:*v31 forKey:*MEMORY[0x1E4F93428]];
      uint64_t v32 = (void *)MEMORY[0x1E4F93470];
      goto LABEL_48;
    case 3:
      uint64_t v31 = (void *)MEMORY[0x1E4F93420];
      goto LABEL_45;
    case 2:
      char v30 = (void *)MEMORY[0x1E4F93420];
      break;
    default:
      char v30 = (void *)MEMORY[0x1E4F93418];
      break;
  }
  [v5 setObject:*v30 forKey:*MEMORY[0x1E4F93428]];
  uint64_t v32 = (void *)MEMORY[0x1E4F93480];
LABEL_48:
  uint64_t v33 = *MEMORY[0x1E4F93478];
  [v5 setObject:*v32 forKey:*MEMORY[0x1E4F93478]];
  int v34 = [v4 hasPrintInfoSupported];
  uint64_t v35 = (void *)MEMORY[0x1E4F93378];
  if (v34)
  {
    uint64_t v36 = [v4 printInfoSupported];
    id v37 = [v36 objectForKey:*v35];
  }
  else
  {
    id v37 = 0;
  }
  uint64_t v38 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  int64_t staple = self->_staple;
  if (!staple || (self->_outputType | 2) != 2) {
    goto LABEL_89;
  }
  if (staple == 4)
  {
    uint64_t v40 = 4;
    uint64_t v41 = [MEMORY[0x1E4F28ED0] numberWithInteger:4];
    char v42 = [v37 containsObject:v41];

    if (v42) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 20)
  {
    uint64_t v43 = [MEMORY[0x1E4F28ED0] numberWithInteger:20];
    char v44 = [v37 containsObject:v43];

    uint64_t v40 = 20;
    if (v44) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 21)
  {
    long long v45 = [MEMORY[0x1E4F28ED0] numberWithInteger:21];
    char v46 = [v37 containsObject:v45];

    uint64_t v40 = 21;
    if (v46) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 28)
  {
    long long v47 = [MEMORY[0x1E4F28ED0] numberWithInteger:28];
    char v48 = [v37 containsObject:v47];

    uint64_t v40 = 28;
    if (v48) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 29)
  {
    long long v49 = [MEMORY[0x1E4F28ED0] numberWithInteger:29];
    char v50 = [v37 containsObject:v49];

    uint64_t v40 = 29;
    if (v50) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 31)
  {
    long long v51 = [MEMORY[0x1E4F28ED0] numberWithInteger:31];
    char v52 = [v37 containsObject:v51];

    uint64_t v40 = 31;
    if (v52) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 32)
  {
    long long v53 = [MEMORY[0x1E4F28ED0] numberWithInteger:32];
    char v54 = [v37 containsObject:v53];

    uint64_t v40 = 32;
    if (v54) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 33)
  {
    v55 = [MEMORY[0x1E4F28ED0] numberWithInteger:33];
    char v56 = [v37 containsObject:v55];

    uint64_t v40 = 33;
    if (v56) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 35)
  {
    int64_t v57 = [MEMORY[0x1E4F28ED0] numberWithInteger:35];
    char v58 = [v37 containsObject:v57];

    uint64_t v40 = 35;
    if (v58) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 50)
  {
    v59 = [MEMORY[0x1E4F28ED0] numberWithInteger:50];
    char v60 = [v37 containsObject:v59];

    uint64_t v40 = 50;
    if (v60) {
      goto LABEL_88;
    }
    int64_t staple = self->_staple;
  }
  if (staple == 51)
  {
    id v61 = [MEMORY[0x1E4F28ED0] numberWithInteger:51];
    char v62 = [v37 containsObject:v61];

    uint64_t v40 = 51;
    if ((v62 & 1) == 0)
    {
      int64_t staple = self->_staple;
      goto LABEL_86;
    }
LABEL_88:
    int64_t v65 = [MEMORY[0x1E4F28ED0] numberWithInt:v40];
    [v38 addObject:v65];

    goto LABEL_89;
  }
LABEL_86:
  if (staple == 8)
  {
    v63 = [MEMORY[0x1E4F28ED0] numberWithInteger:8];
    int v64 = [v37 containsObject:v63];

    uint64_t v40 = 8;
    if (v64) {
      goto LABEL_88;
    }
  }
LABEL_89:
  int64_t punch = self->_punch;
  if (!punch || (self->_outputType | 2) != 2) {
    goto LABEL_127;
  }
  if (punch == 5)
  {
    uint64_t v67 = 5;
    v68 = [MEMORY[0x1E4F28ED0] numberWithInteger:5];
    char v69 = [v37 containsObject:v68];

    if (v69) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 70)
  {
    v70 = [MEMORY[0x1E4F28ED0] numberWithInteger:70];
    char v71 = [v37 containsObject:v70];

    uint64_t v67 = 70;
    if (v71) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 71)
  {
    v72 = [MEMORY[0x1E4F28ED0] numberWithInteger:71];
    char v73 = [v37 containsObject:v72];

    uint64_t v67 = 71;
    if (v73) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 74)
  {
    v74 = [MEMORY[0x1E4F28ED0] numberWithInteger:74];
    char v75 = [v37 containsObject:v74];

    uint64_t v67 = 74;
    if (v75) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 75)
  {
    uint64_t v76 = [MEMORY[0x1E4F28ED0] numberWithInteger:75];
    char v77 = [v37 containsObject:v76];

    uint64_t v67 = 75;
    if (v77) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 77)
  {
    v78 = [MEMORY[0x1E4F28ED0] numberWithInteger:77];
    char v79 = [v37 containsObject:v78];

    uint64_t v67 = 77;
    if (v79) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 78)
  {
    id v80 = [MEMORY[0x1E4F28ED0] numberWithInteger:78];
    char v81 = [v37 containsObject:v80];

    uint64_t v67 = 78;
    if (v81) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 79)
  {
    v82 = [MEMORY[0x1E4F28ED0] numberWithInteger:79];
    char v83 = [v37 containsObject:v82];

    uint64_t v67 = 79;
    if (v83) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 81)
  {
    v84 = [MEMORY[0x1E4F28ED0] numberWithInteger:81];
    char v85 = [v37 containsObject:v84];

    uint64_t v67 = 81;
    if (v85) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 82)
  {
    v86 = [MEMORY[0x1E4F28ED0] numberWithInteger:82];
    char v87 = [v37 containsObject:v86];

    uint64_t v67 = 82;
    if (v87) {
      goto LABEL_126;
    }
    int64_t punch = self->_punch;
  }
  if (punch == 83)
  {
    v88 = [MEMORY[0x1E4F28ED0] numberWithInteger:83];
    char v89 = [v37 containsObject:v88];

    uint64_t v67 = 83;
    if ((v89 & 1) == 0)
    {
      int64_t punch = self->_punch;
      goto LABEL_124;
    }
LABEL_126:
    v92 = [MEMORY[0x1E4F28ED0] numberWithInt:v67];
    [v38 addObject:v92];

    goto LABEL_127;
  }
LABEL_124:
  if (punch == 85)
  {
    int64_t v90 = [MEMORY[0x1E4F28ED0] numberWithInteger:85];
    int v91 = [v37 containsObject:v90];

    uint64_t v67 = 85;
    if (v91) {
      goto LABEL_126;
    }
  }
LABEL_127:
  int64_t fold = self->_fold;
  if (!fold || (self->_outputType | 2) != 2) {
    goto LABEL_162;
  }
  if (fold == 90)
  {
    uint64_t v94 = 90;
    v95 = [MEMORY[0x1E4F28ED0] numberWithInteger:90];
    char v96 = [v37 containsObject:v95];

    if (v96) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 91)
  {
    int64_t v97 = [MEMORY[0x1E4F28ED0] numberWithInteger:91];
    char v98 = [v37 containsObject:v97];

    uint64_t v94 = 91;
    if (v98) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 92)
  {
    v99 = [MEMORY[0x1E4F28ED0] numberWithInteger:92];
    char v100 = [v37 containsObject:v99];

    uint64_t v94 = 92;
    if (v100) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 93)
  {
    id v101 = [MEMORY[0x1E4F28ED0] numberWithInteger:93];
    char v102 = [v37 containsObject:v101];

    uint64_t v94 = 93;
    if (v102) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 94)
  {
    double v103 = [MEMORY[0x1E4F28ED0] numberWithInteger:94];
    char v104 = [v37 containsObject:v103];

    uint64_t v94 = 94;
    if (v104) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 95)
  {
    v105 = [MEMORY[0x1E4F28ED0] numberWithInteger:95];
    char v106 = [v37 containsObject:v105];

    uint64_t v94 = 95;
    if (v106) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 96)
  {
    v107 = [MEMORY[0x1E4F28ED0] numberWithInteger:96];
    char v108 = [v37 containsObject:v107];

    uint64_t v94 = 96;
    if (v108) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 97)
  {
    v109 = [MEMORY[0x1E4F28ED0] numberWithInteger:97];
    char v110 = [v37 containsObject:v109];

    uint64_t v94 = 97;
    if (v110) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 98)
  {
    v111 = [MEMORY[0x1E4F28ED0] numberWithInteger:98];
    char v112 = [v37 containsObject:v111];

    uint64_t v94 = 98;
    if (v112) {
      goto LABEL_161;
    }
    int64_t fold = self->_fold;
  }
  if (fold == 99)
  {
    v113 = [MEMORY[0x1E4F28ED0] numberWithInteger:99];
    char v114 = [v37 containsObject:v113];

    uint64_t v94 = 99;
    if ((v114 & 1) == 0)
    {
      int64_t fold = self->_fold;
      goto LABEL_159;
    }
LABEL_161:
    v117 = [MEMORY[0x1E4F28ED0] numberWithInt:v94];
    [v38 addObject:v117];

    goto LABEL_162;
  }
LABEL_159:
  if (fold == 100)
  {
    v115 = [MEMORY[0x1E4F28ED0] numberWithInteger:100];
    int v116 = [v37 containsObject:v115];

    uint64_t v94 = 100;
    if (v116) {
      goto LABEL_161;
    }
  }
LABEL_162:
  if (self->_coat)
  {
    v118 = [MEMORY[0x1E4F28ED0] numberWithInt:15];
    [v38 addObject:v118];
  }
  if (self->_laminate)
  {
    v119 = [MEMORY[0x1E4F28ED0] numberWithInt:16];
    [v38 addObject:v119];
  }
  if ([v38 count]) {
    [v5 setObject:v38 forKey:*v35];
  }
  finishingTemplate = self->_finishingTemplate;
  if (finishingTemplate) {
    [v5 setObject:finishingTemplate forKey:*MEMORY[0x1E4F93368]];
  }
  outputBin = self->_outputBin;
  if (outputBin) {
    [v5 setObject:outputBin forKey:*MEMORY[0x1E4F93410]];
  }
  pageStackOrder = self->_pageStackOrder;
  if (pageStackOrder) {
    [v5 setObject:pageStackOrder forKey:*MEMORY[0x1E4F93450]];
  }
  if (self->_jobAccountID && [v4 supportsJobAccountID]) {
    [v5 setObject:self->_jobAccountID forKey:*MEMORY[0x1E4F93398]];
  }
  pdfPassword = self->_pdfPassword;
  if (pdfPassword) {
    [v5 setObject:pdfPassword forKey:*MEMORY[0x1E4F93318]];
  }
  if (self->_imagePDFAnnotations)
  {
    v124 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v5 setObject:v124 forKey:*MEMORY[0x1E4F93308]];
  }
  if (self->_quality != 4)
  {
    v125 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    [v5 setObject:v125 forKey:v33];
  }
  inputSlot = self->_inputSlot;
  if (inputSlot) {
    [v5 setObject:inputSlot forKey:*MEMORY[0x1E4F93388]];
  }
  mediaType = self->_mediaType;
  if (mediaType) {
    [v5 setObject:mediaType forKey:*MEMORY[0x1E4F933E0]];
  }
  jobPreset = self->_jobPreset;
  if (jobPreset) {
    [v5 setObject:jobPreset forKey:*MEMORY[0x1E4F933B8]];
  }
  id v129 = v5;

  return v129;
}

- (int64_t)numNUpRows
{
  v2 = [(UIPrintInfo *)self nUpRowsColumns];
  v3 = [v2 objectAtIndex:0];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (int64_t)numNUpColumns
{
  v2 = [(UIPrintInfo *)self nUpRowsColumns];
  v3 = [v2 objectAtIndex:1];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (BOOL)nUpActive
{
  return [(UIPrintInfo *)self numNUpRows] > 1 || [(UIPrintInfo *)self numNUpColumns] > 1;
}

- (NSString)printerID
{
  return self->_printerID;
}

- (void)setPrinterID:(NSString *)printerID
{
}

- (NSString)jobName
{
  return self->_jobName;
}

- (void)setJobName:(NSString *)jobName
{
}

- (UIPrintInfoOutputType)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(UIPrintInfoOutputType)outputType
{
  self->_int64_t outputType = outputType;
}

- (UIPrintInfoOrientation)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(UIPrintInfoOrientation)orientation
{
  self->_int64_t orientation = orientation;
}

- (UIPrintInfoDuplex)duplex
{
  return self->_duplex;
}

- (void)setDuplex:(UIPrintInfoDuplex)duplex
{
  self->_int64_t duplex = duplex;
}

- (UIPrinter)currentPrinter
{
  return self->_currentPrinter;
}

- (void)setCurrentPrinter:(id)a3
{
}

- (int64_t)copies
{
  return self->_copies;
}

- (void)setCopies:(int64_t)a3
{
  self->_int64_t copies = a3;
}

- (NSDictionary)jobPreset
{
  return self->_jobPreset;
}

- (void)setJobPreset:(id)a3
{
}

- (NSArray)appliedPresetsList
{
  return self->_appliedPresetsList;
}

- (void)setAppliedPresetsList:(id)a3
{
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (NSArray)pageRanges
{
  return self->_pageRanges;
}

- (void)setPageRanges:(id)a3
{
}

- (UIPrintPaper)printPaper
{
  return self->_printPaper;
}

- (void)setPrintPaper:(id)a3
{
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_double scalingFactor = a3;
}

- (BOOL)pdfAnnotationsAvailable
{
  return self->_pdfAnnotationsAvailable;
}

- (void)setPdfAnnotationsAvailable:(BOOL)a3
{
  self->_pdfAnnotationsAvailable = a3;
}

- (NSString)jobAccountID
{
  return self->_jobAccountID;
}

- (void)setJobAccountID:(id)a3
{
}

- (BOOL)scaleToFit
{
  return self->_scaleToFit;
}

- (void)setScaleToFit:(BOOL)a3
{
  self->_scaleToFit = a3;
}

- (BOOL)scaleDownOnly
{
  return self->_scaleDownOnly;
}

- (void)setScaleDownOnly:(BOOL)a3
{
  self->_scaleDownOnly = a3;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSString)inputSlot
{
  return self->_inputSlot;
}

- (void)setInputSlot:(id)a3
{
}

- (int64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(int64_t)a3
{
  self->_int64_t quality = a3;
}

- (NSArray)nUpRowsColumns
{
  return self->_nUpRowsColumns;
}

- (void)setNUpRowsColumns:(id)a3
{
}

- (int64_t)nUpLayoutDirection
{
  return self->_nUpLayoutDirection;
}

- (void)setNUpLayoutDirection:(int64_t)a3
{
  self->_int64_t nUpLayoutDirection = a3;
}

- (int64_t)borderType
{
  return self->_borderType;
}

- (void)setBorderType:(int64_t)a3
{
  self->_int64_t borderType = a3;
}

- (int64_t)bookletStyle
{
  return self->_bookletStyle;
}

- (void)setBookletStyle:(int64_t)a3
{
  self->_int64_t bookletStyle = a3;
}

- (BOOL)flipHorizontal
{
  return self->_flipHorizontal;
}

- (void)setFlipHorizontal:(BOOL)a3
{
  self->_flipHorizontal = a3;
}

- (int64_t)finishingOption
{
  return self->_finishingOption;
}

- (void)setFinishingOption:(int64_t)a3
{
  self->_finishingOption = a3;
}

- (NSString)finishingTemplate
{
  return self->_finishingTemplate;
}

- (void)setFinishingTemplate:(id)a3
{
}

- (int64_t)staple
{
  return self->_staple;
}

- (void)setStaple:(int64_t)a3
{
  self->_int64_t staple = a3;
}

- (int64_t)punch
{
  return self->_punch;
}

- (void)setPunch:(int64_t)a3
{
  self->_int64_t punch = a3;
}

- (int64_t)fold
{
  return self->_fold;
}

- (void)setFold:(int64_t)a3
{
  self->_int64_t fold = a3;
}

- (int64_t)laminate
{
  return self->_laminate;
}

- (void)setLaminate:(int64_t)a3
{
  self->_int64_t laminate = a3;
}

- (int64_t)coat
{
  return self->_coat;
}

- (void)setCoat:(int64_t)a3
{
  self->_int64_t coat = a3;
}

- (int64_t)trim
{
  return self->_trim;
}

- (void)setTrim:(int64_t)a3
{
  self->_int64_t trim = a3;
}

- (NSString)outputBin
{
  return self->_outputBin;
}

- (void)setOutputBin:(id)a3
{
}

- (NSString)pageStackOrder
{
  return self->_pageStackOrder;
}

- (void)setPageStackOrder:(id)a3
{
}

- (BOOL)scaleUp
{
  return self->_scaleUp;
}

- (void)setScaleUp:(BOOL)a3
{
  self->_scaleUp = a3;
}

- (NSString)pdfPassword
{
  return self->_pdfPassword;
}

- (void)setPdfPassword:(id)a3
{
}

- (BOOL)imagePDFAnnotations
{
  return self->_imagePDFAnnotations;
}

- (void)setImagePDFAnnotations:(BOOL)a3
{
  self->_imagePDFAnnotations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfPassword, 0);
  objc_storeStrong((id *)&self->_pageStackOrder, 0);
  objc_storeStrong((id *)&self->_outputBin, 0);
  objc_storeStrong((id *)&self->_finishingTemplate, 0);
  objc_storeStrong((id *)&self->_nUpRowsColumns, 0);
  objc_storeStrong((id *)&self->_inputSlot, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_jobAccountID, 0);
  objc_storeStrong((id *)&self->_printPaper, 0);
  objc_storeStrong((id *)&self->_pageRanges, 0);
  objc_storeStrong((id *)&self->_appliedPresetsList, 0);
  objc_storeStrong((id *)&self->_jobPreset, 0);
  objc_storeStrong((id *)&self->_currentPrinter, 0);
  objc_storeStrong((id *)&self->_jobName, 0);
  objc_storeStrong((id *)&self->_printerID, 0);
}

@end