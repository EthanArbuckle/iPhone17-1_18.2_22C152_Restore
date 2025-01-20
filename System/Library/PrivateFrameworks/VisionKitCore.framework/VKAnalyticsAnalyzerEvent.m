@interface VKAnalyticsAnalyzerEvent
- (CGSize)imageSize;
- (NSError)error;
- (VKAnalysisExecutionDurations)durations;
- (VKAnalyticsAnalyzerEvent)initWithExecutionDurations:(id)a3 request:(id)a4 analysis:(id)a5 customIdentifier:(id)a6 error:(id)a7;
- (double)madDocumentDuration;
- (double)madMRCDuration;
- (double)madRoundTripAnalysisDuration;
- (double)madVisualSearchDuration;
- (double)mrcParseDuration;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)ddCount;
- (int64_t)lineCount;
- (int64_t)mrcCount;
- (int64_t)textLength;
- (int64_t)type;
- (int64_t)visualSearchCount;
- (unint64_t)analysisTypes;
- (unint64_t)imageSource;
- (unint64_t)requestSource;
- (unint64_t)requestType;
- (void)setAnalysisTypes:(unint64_t)a3;
- (void)setDdCount:(int64_t)a3;
- (void)setDurations:(id)a3;
- (void)setError:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setLineCount:(int64_t)a3;
- (void)setMrcCount:(int64_t)a3;
- (void)setRequestSource:(unint64_t)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setTextLength:(int64_t)a3;
- (void)setVisualSearchCount:(int64_t)a3;
@end

@implementation VKAnalyticsAnalyzerEvent

- (VKAnalyticsAnalyzerEvent)initWithExecutionDurations:(id)a3 request:(id)a4 analysis:(id)a5 customIdentifier:(id)a6 error:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)VKAnalyticsAnalyzerEvent;
  v17 = [(VKAnalyticsEvent *)&v30 initWithCustomIdentifier:a6];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_durations, a3);
    v18->_analysisTypes = [v14 analysisTypes];
    v18->_requestType = [v14 requestType];
    v18->_requestSource = [v14 imageSource];
    [v14 imageSize];
    v18->_imageSize.width = v19;
    v18->_imageSize.height = v20;
    v21 = [v15 imageAnalysisResult];
    v22 = [v21 allLineQuads];
    v18->_lineCount = [v22 count];

    v23 = [v15 imageAnalysisResult];
    v24 = [v23 text];
    v18->_textLength = [v24 length];

    v25 = [v23 textDataDetectorElements];
    v18->_ddCount = [v25 count];

    v26 = [v23 mrcDataDetectorElements];
    v18->_mrcCount = [v26 count];

    v27 = [v23 visualSearchResult];
    v28 = [v27 resultItems];
    v18->_visualSearchCount = [v28 count];

    objc_storeStrong((id *)&v18->_error, a7);
  }

  return v18;
}

- (double)madRoundTripAnalysisDuration
{
  v2 = [(VKAnalyticsAnalyzerEvent *)self durations];
  [v2 madRoundTripAnalysisDuration];
  VKMReplaceIfNan();
  double v4 = v3;

  return v4;
}

- (double)madDocumentDuration
{
  v2 = [(VKAnalyticsAnalyzerEvent *)self durations];
  [v2 madDocumentDuration];
  VKMReplaceIfNan();
  double v4 = v3;

  return v4;
}

- (double)madMRCDuration
{
  v2 = [(VKAnalyticsAnalyzerEvent *)self durations];
  [v2 madMRCDuration];
  VKMReplaceIfNan();
  double v4 = v3;

  return v4;
}

- (double)madVisualSearchDuration
{
  v2 = [(VKAnalyticsAnalyzerEvent *)self durations];
  [v2 madVisualSearchDuration];
  VKMReplaceIfNan();
  double v4 = v3;

  return v4;
}

- (double)mrcParseDuration
{
  v2 = [(VKAnalyticsAnalyzerEvent *)self durations];
  [v2 mrcParseDuration];
  VKMReplaceIfNan();
  double v4 = v3;

  return v4;
}

- (id)eventKey
{
  return @"StaticImageAnalysisCompleted";
}

- (int64_t)type
{
  return 1;
}

- (id)coreAnalyticsDictionary
{
  v38[19] = *MEMORY[0x1E4F143B8];
  v37[0] = @"madAnalysisDuration";
  double v3 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self madRoundTripAnalysisDuration];
  v36 = objc_msgSend(v3, "numberWithDouble:");
  v38[0] = v36;
  v37[1] = @"visionExecutionTimeInternal";
  double v4 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self madDocumentDuration];
  v35 = objc_msgSend(v4, "numberWithDouble:");
  v38[1] = v35;
  v37[2] = @"mrcDuration";
  v5 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self madMRCDuration];
  v34 = objc_msgSend(v5, "numberWithDouble:");
  v38[2] = v34;
  v37[3] = @"vsDuration";
  v6 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self madVisualSearchDuration];
  v33 = objc_msgSend(v6, "numberWithDouble:");
  v38[3] = v33;
  v37[4] = @"mrcParseDuration";
  v7 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self mrcParseDuration];
  v32 = objc_msgSend(v7, "numberWithDouble:");
  v38[4] = v32;
  v37[5] = @"analysisTypes";
  v31 = VKMUIStringForAnalysisTypes([(VKAnalyticsAnalyzerEvent *)self analysisTypes]);
  v38[5] = v31;
  v37[6] = @"imageSizeWidth";
  v8 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self imageSize];
  objc_super v30 = objc_msgSend(v8, "numberWithDouble:");
  v38[6] = v30;
  v37[7] = @"imageSizeHeight";
  v9 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self imageSize];
  v29 = [v9 numberWithDouble:v10];
  v38[7] = v29;
  v37[8] = @"imageAspectRatio";
  v11 = NSNumber;
  [(VKAnalyticsAnalyzerEvent *)self imageSize];
  v28 = objc_msgSend(v11, "numberWithDouble:", VKMAspectRatio(v12, v13));
  v38[8] = v28;
  v37[9] = @"requestType";
  v27 = VKMUIStringForAnalyzerRequestType([(VKAnalyticsAnalyzerEvent *)self requestType]);
  v38[9] = v27;
  v37[10] = @"requestSource";
  v26 = VKMUIStringForAnalyzerRequestSource([(VKAnalyticsAnalyzerEvent *)self requestSource]);
  v38[10] = v26;
  v37[11] = @"textLength";
  id v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsAnalyzerEvent textLength](self, "textLength"));
  v38[11] = v14;
  v37[12] = @"lineCount";
  id v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsAnalyzerEvent lineCount](self, "lineCount"));
  v38[12] = v15;
  v37[13] = @"ddCount";
  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsAnalyzerEvent ddCount](self, "ddCount"));
  v38[13] = v16;
  v37[14] = @"mrcCount";
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsAnalyzerEvent mrcCount](self, "mrcCount"));
  v38[14] = v17;
  v37[15] = @"vsCount";
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsAnalyzerEvent visualSearchCount](self, "visualSearchCount"));
  v38[15] = v18;
  v37[16] = @"bundleIdentifier";
  CGFloat v19 = [(VKAnalyticsEvent *)self bundleIdentifier];
  v38[16] = v19;
  v37[17] = @"automatedTest";
  CGFloat v20 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v38[17] = v20;
  v37[18] = @"hadError";
  v21 = NSNumber;
  v22 = [(VKAnalyticsAnalyzerEvent *)self error];
  v23 = [v21 numberWithInt:v22 != 0];
  v38[18] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:19];

  return v24;
}

- (id)description
{
  v27 = NSString;
  v28.receiver = self;
  v28.super_class = (Class)VKAnalyticsAnalyzerEvent;
  v26 = [(VKAnalyticsAnalyzerEvent *)&v28 description];
  [(VKAnalyticsAnalyzerEvent *)self madRoundTripAnalysisDuration];
  uint64_t v4 = v3;
  [(VKAnalyticsAnalyzerEvent *)self madDocumentDuration];
  uint64_t v6 = v5;
  [(VKAnalyticsAnalyzerEvent *)self madVisualSearchDuration];
  uint64_t v8 = v7;
  [(VKAnalyticsAnalyzerEvent *)self madMRCDuration];
  uint64_t v10 = v9;
  [(VKAnalyticsAnalyzerEvent *)self mrcParseDuration];
  uint64_t v12 = v11;
  v25 = VKMUIStringForAnalysisTypes(self->_analysisTypes);
  v24 = VKMUIStringForAnalyzerRequestType(self->_requestType);
  double v13 = VKMUIStringForAnalyzerRequestSource(self->_requestSource);
  id v14 = VKMUIStringForSize(self->_imageSize.width, self->_imageSize.height);
  int64_t textLength = self->_textLength;
  int64_t lineCount = self->_lineCount;
  int64_t ddCount = self->_ddCount;
  int64_t mrcCount = self->_mrcCount;
  int64_t visualSearchCount = self->_visualSearchCount;
  CGFloat v20 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  v21 = [(VKAnalyticsEvent *)self bundleIdentifier];
  objc_msgSend(v27, "stringWithFormat:", @"%@ \n madRoundTripAnalysisDuration: %f \n madDocumentDuration: %f \n madVisualSearchDuration: %f \n madMRCDuration: %f \n mrcParseDuration: %f \n analysisTypes: %@ \n requestType: %@ \n requestSource: %@ \n imageSize: %@ \n textLength: %ld \n lineCount: %ld \n ddCount: %ld \n mrcCount: %ld \n visualSearchCount: %ld \n automatedTest: %@ \n bundleIdentifier: %@ \n error: %@ ", v26, v4, v6, v8, v10, v12, v25, v24, v13, v14, textLength, lineCount, ddCount, mrcCount, visualSearchCount, v20,
    v21,
  v22 = self->_error);

  return v22;
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  self->_analysisTypes = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (unint64_t)imageSource
{
  return self->_imageSource;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (int64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(int64_t)a3
{
  self->_int64_t textLength = a3;
}

- (int64_t)lineCount
{
  return self->_lineCount;
}

- (void)setLineCount:(int64_t)a3
{
  self->_int64_t lineCount = a3;
}

- (int64_t)ddCount
{
  return self->_ddCount;
}

- (void)setDdCount:(int64_t)a3
{
  self->_int64_t ddCount = a3;
}

- (int64_t)mrcCount
{
  return self->_mrcCount;
}

- (void)setMrcCount:(int64_t)a3
{
  self->_int64_t mrcCount = a3;
}

- (int64_t)visualSearchCount
{
  return self->_visualSearchCount;
}

- (void)setVisualSearchCount:(int64_t)a3
{
  self->_int64_t visualSearchCount = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VKAnalysisExecutionDurations)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
}

- (unint64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unint64_t)a3
{
  self->_requestSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end