@interface VKTextFrameProcessorConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextFrameProcessorConfiguration:(id)a3;
- (BOOL)isForSingleItem;
- (BOOL)shouldPerformTextDetectionGating;
- (BOOL)usesAlternateLineGrouping;
- (BOOL)usesLanguageDetection;
- (CGPoint)comparisonPoint;
- (NSArray)customWords;
- (NSArray)recognitionLanguages;
- (VKTextFrameProcessorConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)dataType;
- (unint64_t)documentBlockType;
- (void)setComparisonPoint:(CGPoint)a3;
- (void)setCustomWords:(id)a3;
- (void)setDataType:(unint64_t)a3;
- (void)setDocumentBlockType:(unint64_t)a3;
- (void)setIsForSingleItem:(BOOL)a3;
- (void)setRecognitionLanguages:(id)a3;
- (void)setUsesAlternateLineGrouping:(BOOL)a3;
- (void)setUsesLanguageDetection:(BOOL)a3;
@end

@implementation VKTextFrameProcessorConfiguration

- (VKTextFrameProcessorConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)VKTextFrameProcessorConfiguration;
  v2 = [(VKTextFrameProcessorConfiguration *)&v13 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isForSingleItem = 257;
    __asm { FMOV            V0.2D, #0.5 }
    v2->_comparisonPoint = _Q0;
    v2->_usesLanguageDetection = 1;
    recognitionLanguages = v2->_recognitionLanguages;
    v10 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_documentBlockType = 2;
    v2->_recognitionLanguages = v10;

    customWords = v3->_customWords;
    v3->_customWords = v10;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VKTextFrameProcessorConfiguration);
  [(VKTextFrameProcessorConfiguration *)v4 setIsForSingleItem:[(VKTextFrameProcessorConfiguration *)self isForSingleItem]];
  [(VKTextFrameProcessorConfiguration *)v4 setDataType:[(VKTextFrameProcessorConfiguration *)self dataType]];
  [(VKTextFrameProcessorConfiguration *)self comparisonPoint];
  -[VKTextFrameProcessorConfiguration setComparisonPoint:](v4, "setComparisonPoint:");
  [(VKTextFrameProcessorConfiguration *)v4 setUsesAlternateLineGrouping:[(VKTextFrameProcessorConfiguration *)self usesAlternateLineGrouping]];
  [(VKTextFrameProcessorConfiguration *)v4 setUsesLanguageDetection:[(VKTextFrameProcessorConfiguration *)self usesLanguageDetection]];
  [(VKTextFrameProcessorConfiguration *)v4 setDocumentBlockType:[(VKTextFrameProcessorConfiguration *)self documentBlockType]];
  v5 = [(VKTextFrameProcessorConfiguration *)self recognitionLanguages];
  [(VKTextFrameProcessorConfiguration *)v4 setRecognitionLanguages:v5];

  v6 = [(VKTextFrameProcessorConfiguration *)self customWords];
  [(VKTextFrameProcessorConfiguration *)v4 setCustomWords:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VKTextFrameProcessorConfiguration *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = objc_opt_class();
      v6 = VKDynamicCast(v5, (uint64_t)v4);
      BOOL v7 = [(VKTextFrameProcessorConfiguration *)self isEqualToTextFrameProcessorConfiguration:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToTextFrameProcessorConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isForSingleItem];
  if (v5 != [(VKTextFrameProcessorConfiguration *)self isForSingleItem]) {
    goto LABEL_9;
  }
  uint64_t v6 = [v4 dataType];
  if (v6 != [(VKTextFrameProcessorConfiguration *)self dataType]) {
    goto LABEL_9;
  }
  [v4 comparisonPoint];
  double v8 = v7;
  double v10 = v9;
  [(VKTextFrameProcessorConfiguration *)self comparisonPoint];
  if (!VKMNearlyEqualPointsWithThreshold(v8, v10, v11, v12, 0.00001)) {
    goto LABEL_9;
  }
  int v13 = [v4 usesAlternateLineGrouping];
  if (v13 != [(VKTextFrameProcessorConfiguration *)self usesAlternateLineGrouping]) {
    goto LABEL_9;
  }
  int v14 = [v4 usesLanguageDetection];
  if (v14 != [(VKTextFrameProcessorConfiguration *)self usesLanguageDetection]) {
    goto LABEL_9;
  }
  uint64_t v15 = [v4 documentBlockType];
  if (v15 != [(VKTextFrameProcessorConfiguration *)self documentBlockType]) {
    goto LABEL_9;
  }
  v16 = [v4 recognitionLanguages];
  v17 = [(VKTextFrameProcessorConfiguration *)self recognitionLanguages];
  int v18 = [v16 isEqualToArray:v17];

  if (v18)
  {
    v19 = [v4 customWords];
    v20 = [(VKTextFrameProcessorConfiguration *)self customWords];
    char v21 = [v19 isEqualToArray:v20];
  }
  else
  {
LABEL_9:
    char v21 = 0;
  }

  return v21;
}

- (BOOL)shouldPerformTextDetectionGating
{
  BOOL v3 = [(VKTextFrameProcessorConfiguration *)self isForSingleItem];
  if (v3) {
    LOBYTE(v3) = [(VKTextFrameProcessorConfiguration *)self dataType] == 0;
  }
  return v3;
}

- (BOOL)isForSingleItem
{
  return self->_isForSingleItem;
}

- (void)setIsForSingleItem:(BOOL)a3
{
  self->_isForSingleItem = a3;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unint64_t)a3
{
  self->_dataType = a3;
}

- (unint64_t)documentBlockType
{
  return self->_documentBlockType;
}

- (void)setDocumentBlockType:(unint64_t)a3
{
  self->_documentBlockType = a3;
}

- (CGPoint)comparisonPoint
{
  double x = self->_comparisonPoint.x;
  double y = self->_comparisonPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setComparisonPoint:(CGPoint)a3
{
  self->_comparisonPoint = a3;
}

- (BOOL)usesAlternateLineGrouping
{
  return self->_usesAlternateLineGrouping;
}

- (void)setUsesAlternateLineGrouping:(BOOL)a3
{
  self->_usesAlternateLineGrouping = a3;
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (void)setRecognitionLanguages:(id)a3
{
}

- (NSArray)customWords
{
  return self->_customWords;
}

- (void)setCustomWords:(id)a3
{
}

- (BOOL)usesLanguageDetection
{
  return self->_usesLanguageDetection;
}

- (void)setUsesLanguageDetection:(BOOL)a3
{
  self->_usesLanguageDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customWords, 0);
  objc_storeStrong((id *)&self->_recognitionLanguages, 0);
}

@end