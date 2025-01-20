@interface REMDistributedEvaluationCollectionOptions
+ (BOOL)supportsSecureCoding;
+ (id)_attachmentURLFromFilenameWithKey:(id)a3 inJSONRepresentation:(id)a4 attachmentURLs:(id)a5 error:(id *)a6;
+ (id)optionsFromJSONRepresentation:(id)a3 attachmentURLs:(id)a4 error:(id *)a5;
+ (id)optionsWithDefaultValues;
+ (id)optionsWithEverythingOff;
- (BOOL)includeAccountType;
- (BOOL)includeAlarmDates;
- (BOOL)includeAttachmentUTIs;
- (BOOL)includeDates;
- (BOOL)includeDayOfWeek;
- (BOOL)includeIsFlagged;
- (BOOL)includeListGroupInfo;
- (BOOL)includeListNameFuzzedEmbeddings;
- (BOOL)includeListNames;
- (BOOL)includeLocationInfo;
- (BOOL)includePriority;
- (BOOL)includeRecurrenceInfo;
- (BOOL)includeRemindMeWhenMessagingInfo;
- (BOOL)includeReminderTitleCategoryFilteredStopWords;
- (BOOL)includeReminderTitleCategorySentence2Vec;
- (BOOL)includeReminderTitleCategoryUniversalGrammar;
- (BOOL)includeReminderTitleFuzzedEmbeddings;
- (BOOL)includeReminderTitleSaltedHash;
- (BOOL)includeReminderTitles;
- (BOOL)includeSubtaskInfo;
- (BOOL)includeSystemLanguage;
- (BOOL)includeSystemTimezone;
- (BOOL)includeUserActivityInfo;
- (BOOL)relevantWordTagsIncludeOtherWord;
- (NSURL)reminderTitleCategoryEmbeddingURL;
- (REMDistributedEvaluationCollectionOptions)initWithCoder:(id)a3;
- (double)reminderTitleCategoryDistanceTolerance;
- (id)_init;
- (id)description;
- (unint64_t)creationDateWithinDays;
- (unint64_t)dateResolutionInSeconds;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDateWithinDays:(unint64_t)a3;
- (void)setDateResolutionInSeconds:(unint64_t)a3;
- (void)setIncludeAccountType:(BOOL)a3;
- (void)setIncludeAlarmDates:(BOOL)a3;
- (void)setIncludeAttachmentUTIs:(BOOL)a3;
- (void)setIncludeDates:(BOOL)a3;
- (void)setIncludeDayOfWeek:(BOOL)a3;
- (void)setIncludeIsFlagged:(BOOL)a3;
- (void)setIncludeListGroupInfo:(BOOL)a3;
- (void)setIncludeListNameFuzzedEmbeddings:(BOOL)a3;
- (void)setIncludeListNames:(BOOL)a3;
- (void)setIncludeLocationInfo:(BOOL)a3;
- (void)setIncludePriority:(BOOL)a3;
- (void)setIncludeRecurrenceInfo:(BOOL)a3;
- (void)setIncludeRemindMeWhenMessagingInfo:(BOOL)a3;
- (void)setIncludeReminderTitleCategoryFilteredStopWords:(BOOL)a3;
- (void)setIncludeReminderTitleCategorySentence2Vec:(BOOL)a3;
- (void)setIncludeReminderTitleCategoryUniversalGrammar:(BOOL)a3;
- (void)setIncludeReminderTitleFuzzedEmbeddings:(BOOL)a3;
- (void)setIncludeReminderTitleSaltedHash:(BOOL)a3;
- (void)setIncludeReminderTitles:(BOOL)a3;
- (void)setIncludeSubtaskInfo:(BOOL)a3;
- (void)setIncludeSystemLanguage:(BOOL)a3;
- (void)setIncludeSystemTimezone:(BOOL)a3;
- (void)setIncludeUserActivityInfo:(BOOL)a3;
- (void)setRelevantWordTagsIncludeOtherWord:(BOOL)a3;
- (void)setReminderTitleCategoryDistanceTolerance:(double)a3;
- (void)setReminderTitleCategoryEmbeddingURL:(id)a3;
@end

@implementation REMDistributedEvaluationCollectionOptions

+ (id)optionsWithDefaultValues
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  [v2 setIncludeListNames:0];
  [v2 setIncludeReminderTitles:0];
  [v2 setIncludeListNameFuzzedEmbeddings:0];
  [v2 setIncludeReminderTitleFuzzedEmbeddings:0];
  [v2 setIncludeSystemLanguage:0];
  [v2 setIncludeSystemTimezone:0];
  [v2 setIncludeAccountType:0];
  [v2 setIncludeListGroupInfo:0];
  [v2 setIncludeReminderTitleSaltedHash:0];
  [v2 setIncludeDayOfWeek:0];
  [v2 setIncludeDates:0];
  [v2 setIncludeRecurrenceInfo:0];
  [v2 setIncludeLocationInfo:0];
  [v2 setIncludeAttachmentUTIs:0];
  [v2 setIncludeRemindMeWhenMessagingInfo:0];
  [v2 setIncludeAlarmDates:0];
  [v2 setIncludeSubtaskInfo:0];
  [v2 setIncludeUserActivityInfo:0];
  [v2 setIncludeIsFlagged:0];
  [v2 setIncludePriority:0];
  [v2 setRelevantWordTagsIncludeOtherWord:0];
  [v2 setDateResolutionInSeconds:10];
  [v2 setCreationDateWithinDays:0];
  [v2 setReminderTitleCategoryEmbeddingURL:0];
  [v2 setIncludeReminderTitleCategorySentence2Vec:0];
  [v2 setIncludeReminderTitleCategoryUniversalGrammar:0];
  [v2 setIncludeReminderTitleCategoryFilteredStopWords:0];
  [v2 setReminderTitleCategoryDistanceTolerance:1.0];

  return v2;
}

+ (id)optionsWithEverythingOff
{
  v2 = (void *)[objc_alloc((Class)a1) _init];

  return v2;
}

+ (id)optionsFromJSONRepresentation:(id)a3 attachmentURLs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 objectForKey:@"reminderTitleCategoryEmbeddingFilename"];

  if (v10)
  {
    v11 = [a1 _attachmentURLFromFilenameWithKey:@"reminderTitleCategoryEmbeddingFilename" inJSONRepresentation:v8 attachmentURLs:v9 error:a5];
    if (!v11)
    {
      v12 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = [a1 optionsWithDefaultValues];
  objc_msgSend(v12, "setIncludeListNames:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeListNames", objc_msgSend(v12, "includeListNames")));
  objc_msgSend(v12, "setIncludeListNameFuzzedEmbeddings:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeListNameFuzzedEmbeddings", objc_msgSend(v12, "includeListNameFuzzedEmbeddings")));
  objc_msgSend(v12, "setIncludeReminderTitles:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeReminderTitles", objc_msgSend(v12, "includeReminderTitles")));
  objc_msgSend(v12, "setIncludeReminderTitleFuzzedEmbeddings:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeReminderTitleFuzzedEmbeddings", objc_msgSend(v12, "includeReminderTitleFuzzedEmbeddings")));
  objc_msgSend(v12, "setIncludeSystemLanguage:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeSystemLanguage", objc_msgSend(v12, "includeSystemLanguage")));
  objc_msgSend(v12, "setIncludeSystemTimezone:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeSystemTimezone", objc_msgSend(v12, "includeSystemTimezone")));
  objc_msgSend(v12, "setIncludeAccountType:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeAccountType", objc_msgSend(v12, "includeAccountType")));
  objc_msgSend(v12, "setIncludeListGroupInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeListGroupInfo", objc_msgSend(v12, "includeListGroupInfo")));
  objc_msgSend(v12, "setIncludeReminderTitleSaltedHash:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeReminderTitleSaltedHash", objc_msgSend(v12, "includeReminderTitleSaltedHash")));
  objc_msgSend(v12, "setIncludeDates:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeDates", objc_msgSend(v12, "includeDates")));
  objc_msgSend(v12, "setIncludeRecurrenceInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeRecurrenceInfo", objc_msgSend(v12, "includeRecurrenceInfo")));
  objc_msgSend(v12, "setIncludeLocationInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeLocationInfo", objc_msgSend(v12, "includeLocationInfo")));
  objc_msgSend(v12, "setIncludeAttachmentUTIs:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeAttachmentUTIs", objc_msgSend(v12, "includeAttachmentUTIs")));
  objc_msgSend(v12, "setIncludeRemindMeWhenMessagingInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeRemindMeWhenMessagingInfo", objc_msgSend(v12, "includeRemindMeWhenMessagingInfo")));
  objc_msgSend(v12, "setIncludeAlarmDates:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeAlarmDates", objc_msgSend(v12, "includeAlarmDates")));
  objc_msgSend(v12, "setIncludeSubtaskInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeSubtaskInfo", objc_msgSend(v12, "includeSubtaskInfo")));
  objc_msgSend(v12, "setIncludeUserActivityInfo:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeUserActivityInfo", objc_msgSend(v12, "includeUserActivityInfo")));
  objc_msgSend(v12, "setIncludeIsFlagged:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeIsFlagged", objc_msgSend(v12, "includeIsFlagged")));
  objc_msgSend(v12, "setIncludePriority:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includePriority", objc_msgSend(v12, "includePriority")));
  objc_msgSend(v12, "setRelevantWordTagsIncludeOtherWord:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"relevantWordTagsIncludeOtherWord", objc_msgSend(v12, "relevantWordTagsIncludeOtherWord")));
  objc_msgSend(v12, "setDateResolutionInSeconds:", objc_msgSend(v8, "remdes_nsuintegerForKey:defaultValue:", @"dateResolutionInSeconds", 10));
  objc_msgSend(v12, "setIncludeReminderTitleCategoryFilteredStopWords:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeReminderTitleCategoryFilteredStopWords", objc_msgSend(v12, "includeReminderTitleCategoryFilteredStopWords")));
  objc_msgSend(v12, "setIncludeReminderTitleCategoryUniversalGrammar:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeReminderTitleCategoryUniversalGrammar", objc_msgSend(v12, "includeReminderTitleCategoryUniversalGrammar")));
  objc_msgSend(v12, "setIncludeReminderTitleCategorySentence2Vec:", objc_msgSend(v8, "remdes_BOOLForKey:defaultValue:", @"includeReminderTitleCategorySentence2Vec", objc_msgSend(v12, "includeReminderTitleCategorySentence2Vec")));
  objc_msgSend(v8, "remdes_doubleForKey:defaultValue:", @"reminderTitleCategoryDistanceTolerance", 1.0);
  objc_msgSend(v12, "setReminderTitleCategoryDistanceTolerance:");
  [v12 setReminderTitleCategoryEmbeddingURL:v11];

LABEL_6:

  return v12;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)REMDistributedEvaluationCollectionOptions;
  id result = [(REMDistributedEvaluationCollectionOptions *)&v3 init];
  if (result) {
    *((void *)result + 4) = 0x3FF0000000000000;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDistributedEvaluationCollectionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMDistributedEvaluationCollectionOptions *)self _init];
  if (v5)
  {
    -[REMDistributedEvaluationCollectionOptions setIncludeListNames:](v5, "setIncludeListNames:", [v4 decodeBoolForKey:@"includeListNames"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeListNameFuzzedEmbeddings:](v5, "setIncludeListNameFuzzedEmbeddings:", [v4 decodeBoolForKey:@"includeListNameFuzzedEmbeddings"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitles:](v5, "setIncludeReminderTitles:", [v4 decodeBoolForKey:@"includeReminderTitles"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleFuzzedEmbeddings:](v5, "setIncludeReminderTitleFuzzedEmbeddings:", [v4 decodeBoolForKey:@"includeReminderTitleFuzzedEmbeddings"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeSystemLanguage:](v5, "setIncludeSystemLanguage:", [v4 decodeBoolForKey:@"includeSystemLanguage"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeSystemTimezone:](v5, "setIncludeSystemTimezone:", [v4 decodeBoolForKey:@"includeSystemTimezone"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeAccountType:](v5, "setIncludeAccountType:", [v4 decodeBoolForKey:@"includeAccountType"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeListGroupInfo:](v5, "setIncludeListGroupInfo:", [v4 decodeBoolForKey:@"includeListGroupInfo"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleSaltedHash:](v5, "setIncludeReminderTitleSaltedHash:", [v4 decodeBoolForKey:@"includeReminderTitleSaltedHash"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeDates:](v5, "setIncludeDates:", [v4 decodeBoolForKey:@"includeDates"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeRecurrenceInfo:](v5, "setIncludeRecurrenceInfo:", [v4 decodeBoolForKey:@"includeRecurrenceInfo"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeLocationInfo:](v5, "setIncludeLocationInfo:", [v4 decodeBoolForKey:@"includeLocationInfo"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeAttachmentUTIs:](v5, "setIncludeAttachmentUTIs:", [v4 decodeBoolForKey:@"includeAttachmentUTIs"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeRemindMeWhenMessagingInfo:](v5, "setIncludeRemindMeWhenMessagingInfo:", [v4 decodeBoolForKey:@"includeRemindMeWhenMessagingInfo"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeAlarmDates:](v5, "setIncludeAlarmDates:", [v4 decodeBoolForKey:@"includeAlarmDates"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeSubtaskInfo:](v5, "setIncludeSubtaskInfo:", [v4 decodeBoolForKey:@"includeSubtaskInfo"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeUserActivityInfo:](v5, "setIncludeUserActivityInfo:", [v4 decodeBoolForKey:@"includeUserActivityInfo"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeIsFlagged:](v5, "setIncludeIsFlagged:", [v4 decodeBoolForKey:@"includeIsFlagged"]);
    -[REMDistributedEvaluationCollectionOptions setIncludePriority:](v5, "setIncludePriority:", [v4 decodeBoolForKey:@"includePriority"]);
    -[REMDistributedEvaluationCollectionOptions setRelevantWordTagsIncludeOtherWord:](v5, "setRelevantWordTagsIncludeOtherWord:", [v4 decodeBoolForKey:@"relevantWordTagsIncludeOtherWord"]);
    -[REMDistributedEvaluationCollectionOptions setDateResolutionInSeconds:](v5, "setDateResolutionInSeconds:", [v4 decodeIntegerForKey:@"dateResolutionInSeconds"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleCategoryFilteredStopWords:](v5, "setIncludeReminderTitleCategoryFilteredStopWords:", [v4 decodeBoolForKey:@"includeReminderTitleCategoryFilteredStopWords"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleCategoryUniversalGrammar:](v5, "setIncludeReminderTitleCategoryUniversalGrammar:", [v4 decodeBoolForKey:@"includeReminderTitleCategoryUniversalGrammar"]);
    -[REMDistributedEvaluationCollectionOptions setIncludeReminderTitleCategorySentence2Vec:](v5, "setIncludeReminderTitleCategorySentence2Vec:", [v4 decodeBoolForKey:@"includeReminderTitleCategorySentence2Vec"]);
    [v4 decodeDoubleForKey:@"reminderTitleCategoryDistanceTolerance"];
    -[REMDistributedEvaluationCollectionOptions setReminderTitleCategoryDistanceTolerance:](v5, "setReminderTitleCategoryDistanceTolerance:");
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderTitleCategoryEmbeddingURL"];
    v7 = v6;
    if (v6)
    {
      id v8 = [v6 url];
      [(REMDistributedEvaluationCollectionOptions *)v5 setReminderTitleCategoryEmbeddingURL:v8];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeListNames](self, "includeListNames"), @"includeListNames");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeListNameFuzzedEmbeddings](self, "includeListNameFuzzedEmbeddings"), @"includeListNameFuzzedEmbeddings");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitles](self, "includeReminderTitles"), @"includeReminderTitles");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleFuzzedEmbeddings](self, "includeReminderTitleFuzzedEmbeddings"), @"includeReminderTitleFuzzedEmbeddings");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeSystemLanguage](self, "includeSystemLanguage"), @"includeSystemLanguage");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeSystemTimezone](self, "includeSystemTimezone"), @"includeSystemTimezone");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeAccountType](self, "includeAccountType"), @"includeAccountType");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeListGroupInfo](self, "includeListGroupInfo"), @"includeListGroupInfo");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleSaltedHash](self, "includeReminderTitleSaltedHash"), @"includeReminderTitleSaltedHash");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeDates](self, "includeDates"), @"includeDates");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeRecurrenceInfo](self, "includeRecurrenceInfo"), @"includeRecurrenceInfo");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeLocationInfo](self, "includeLocationInfo"), @"includeLocationInfo");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeAttachmentUTIs](self, "includeAttachmentUTIs"), @"includeAttachmentUTIs");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeRemindMeWhenMessagingInfo](self, "includeRemindMeWhenMessagingInfo"), @"includeRemindMeWhenMessagingInfo");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeAlarmDates](self, "includeAlarmDates"), @"includeAlarmDates");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeSubtaskInfo](self, "includeSubtaskInfo"), @"includeSubtaskInfo");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeUserActivityInfo](self, "includeUserActivityInfo"), @"includeUserActivityInfo");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeIsFlagged](self, "includeIsFlagged"), @"includeIsFlagged");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includePriority](self, "includePriority"), @"includePriority");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions relevantWordTagsIncludeOtherWord](self, "relevantWordTagsIncludeOtherWord"), @"relevantWordTagsIncludeOtherWord");
  objc_msgSend(v8, "encodeInteger:forKey:", -[REMDistributedEvaluationCollectionOptions dateResolutionInSeconds](self, "dateResolutionInSeconds"), @"dateResolutionInSeconds");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryFilteredStopWords](self, "includeReminderTitleCategoryFilteredStopWords"), @"includeReminderTitleCategoryFilteredStopWords");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryUniversalGrammar](self, "includeReminderTitleCategoryUniversalGrammar"), @"includeReminderTitleCategoryUniversalGrammar");
  objc_msgSend(v8, "encodeBool:forKey:", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategorySentence2Vec](self, "includeReminderTitleCategorySentence2Vec"), @"includeReminderTitleCategorySentence2Vec");
  id v4 = [(REMDistributedEvaluationCollectionOptions *)self reminderTitleCategoryEmbeddingURL];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28FF8]);
    v6 = [(REMDistributedEvaluationCollectionOptions *)self reminderTitleCategoryEmbeddingURL];
    v7 = (void *)[v5 initWithURL:v6 readonly:1];

    [v8 encodeObject:v7 forKey:@"reminderTitleCategoryEmbeddingURL"];
  }
  [(REMDistributedEvaluationCollectionOptions *)self reminderTitleCategoryDistanceTolerance];
  objc_msgSend(v8, "encodeDouble:forKey:", @"reminderTitleCategoryDistanceTolerance");
}

- (id)description
{
  objc_super v3 = +[REMDistributedEvaluationCollectionOptions optionsWithDefaultValues];
  id v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p ", objc_opt_class(), self];
  int v5 = [(REMDistributedEvaluationCollectionOptions *)self includeListNames];
  if (v5 != [v3 includeListNames]) {
    [v4 appendFormat:@"%@:%ld ", @"includeListNames", -[REMDistributedEvaluationCollectionOptions includeListNames](self, "includeListNames")];
  }
  int v6 = [(REMDistributedEvaluationCollectionOptions *)self includeReminderTitles];
  if (v6 != [v3 includeReminderTitles]) {
    [v4 appendFormat:@"%@:%ld ", @"includeReminderTitles", -[REMDistributedEvaluationCollectionOptions includeReminderTitles](self, "includeReminderTitles")];
  }
  int v7 = [(REMDistributedEvaluationCollectionOptions *)self includeSystemLanguage];
  if (v7 != [v3 includeSystemLanguage]) {
    [v4 appendFormat:@"%@:%ld ", @"includeSystemLanguage", -[REMDistributedEvaluationCollectionOptions includeSystemLanguage](self, "includeSystemLanguage")];
  }
  int v8 = [(REMDistributedEvaluationCollectionOptions *)self includeSystemTimezone];
  if (v8 != [v3 includeSystemTimezone]) {
    [v4 appendFormat:@"%@:%ld ", @"includeSystemTimezone", -[REMDistributedEvaluationCollectionOptions includeSystemTimezone](self, "includeSystemTimezone")];
  }
  int v9 = [(REMDistributedEvaluationCollectionOptions *)self includeAccountType];
  if (v9 != [v3 includeAccountType]) {
    [v4 appendFormat:@"%@:%ld ", @"includeAccountType", -[REMDistributedEvaluationCollectionOptions includeAccountType](self, "includeAccountType")];
  }
  int v10 = [(REMDistributedEvaluationCollectionOptions *)self includeListGroupInfo];
  if (v10 != [v3 includeListGroupInfo]) {
    [v4 appendFormat:@"%@:%ld ", @"includeListGroupInfo", -[REMDistributedEvaluationCollectionOptions includeListGroupInfo](self, "includeListGroupInfo")];
  }
  int v11 = [(REMDistributedEvaluationCollectionOptions *)self includeListNameFuzzedEmbeddings];
  if (v11 != [v3 includeListNameFuzzedEmbeddings]) {
    [v4 appendFormat:@"%@:%ld ", @"includeListNameFuzzedEmbeddings", -[REMDistributedEvaluationCollectionOptions includeListNameFuzzedEmbeddings](self, "includeListNameFuzzedEmbeddings")];
  }
  int v12 = [(REMDistributedEvaluationCollectionOptions *)self includeReminderTitleFuzzedEmbeddings];
  if (v12 != [v3 includeReminderTitleFuzzedEmbeddings]) {
    [v4 appendFormat:@"%@:%ld ", @"includeReminderTitleFuzzedEmbeddings", -[REMDistributedEvaluationCollectionOptions includeReminderTitleFuzzedEmbeddings](self, "includeReminderTitleFuzzedEmbeddings")];
  }
  int v13 = [(REMDistributedEvaluationCollectionOptions *)self includeReminderTitleSaltedHash];
  if (v13 != [v3 includeReminderTitleSaltedHash]) {
    [v4 appendFormat:@"%@:%ld ", @"includeReminderTitleSaltedHash", -[REMDistributedEvaluationCollectionOptions includeReminderTitleSaltedHash](self, "includeReminderTitleSaltedHash")];
  }
  int v14 = [(REMDistributedEvaluationCollectionOptions *)self includeDates];
  if (v14 != [v3 includeDates]) {
    [v4 appendFormat:@"%@:%ld ", @"includeDates", -[REMDistributedEvaluationCollectionOptions includeDates](self, "includeDates")];
  }
  int v15 = [(REMDistributedEvaluationCollectionOptions *)self includeRecurrenceInfo];
  if (v15 != [v3 includeRecurrenceInfo]) {
    [v4 appendFormat:@"%@:%ld ", @"includeRecurrenceInfo", -[REMDistributedEvaluationCollectionOptions includeRecurrenceInfo](self, "includeRecurrenceInfo")];
  }
  int v16 = [(REMDistributedEvaluationCollectionOptions *)self includeLocationInfo];
  if (v16 != [v3 includeLocationInfo]) {
    [v4 appendFormat:@"%@:%ld ", @"includeLocationInfo", -[REMDistributedEvaluationCollectionOptions includeLocationInfo](self, "includeLocationInfo")];
  }
  int v17 = [(REMDistributedEvaluationCollectionOptions *)self includeAttachmentUTIs];
  if (v17 != [v3 includeAttachmentUTIs]) {
    [v4 appendFormat:@"%@:%ld ", @"includeAttachmentUTIs", -[REMDistributedEvaluationCollectionOptions includeAttachmentUTIs](self, "includeAttachmentUTIs")];
  }
  int v18 = [(REMDistributedEvaluationCollectionOptions *)self includeRemindMeWhenMessagingInfo];
  if (v18 != [v3 includeRemindMeWhenMessagingInfo]) {
    [v4 appendFormat:@"%@:%ld ", @"includeRemindMeWhenMessagingInfo", -[REMDistributedEvaluationCollectionOptions includeRemindMeWhenMessagingInfo](self, "includeRemindMeWhenMessagingInfo")];
  }
  int v19 = [(REMDistributedEvaluationCollectionOptions *)self includeAlarmDates];
  if (v19 != [v3 includeAlarmDates]) {
    [v4 appendFormat:@"%@:%ld ", @"includeAlarmDates", -[REMDistributedEvaluationCollectionOptions includeAlarmDates](self, "includeAlarmDates")];
  }
  int v20 = [(REMDistributedEvaluationCollectionOptions *)self includeSubtaskInfo];
  if (v20 != [v3 includeSubtaskInfo]) {
    [v4 appendFormat:@"%@:%ld ", @"includeSubtaskInfo", -[REMDistributedEvaluationCollectionOptions includeSubtaskInfo](self, "includeSubtaskInfo")];
  }
  int v21 = [(REMDistributedEvaluationCollectionOptions *)self includeUserActivityInfo];
  if (v21 != [v3 includeUserActivityInfo]) {
    [v4 appendFormat:@"%@:%ld ", @"includeUserActivityInfo", -[REMDistributedEvaluationCollectionOptions includeUserActivityInfo](self, "includeUserActivityInfo")];
  }
  int v22 = [(REMDistributedEvaluationCollectionOptions *)self includeIsFlagged];
  if (v22 != [v3 includeIsFlagged]) {
    [v4 appendFormat:@"%@:%ld ", @"includeIsFlagged", -[REMDistributedEvaluationCollectionOptions includeIsFlagged](self, "includeIsFlagged")];
  }
  int v23 = [(REMDistributedEvaluationCollectionOptions *)self includePriority];
  if (v23 != [v3 includePriority]) {
    [v4 appendFormat:@"%@:%ld ", @"includePriority", -[REMDistributedEvaluationCollectionOptions includePriority](self, "includePriority")];
  }
  int v24 = [(REMDistributedEvaluationCollectionOptions *)self relevantWordTagsIncludeOtherWord];
  if (v24 != [v3 relevantWordTagsIncludeOtherWord]) {
    [v4 appendFormat:@"%@:%ld ", @"relevantWordTagsIncludeOtherWord", -[REMDistributedEvaluationCollectionOptions relevantWordTagsIncludeOtherWord](self, "relevantWordTagsIncludeOtherWord")];
  }
  unint64_t v25 = [(REMDistributedEvaluationCollectionOptions *)self dateResolutionInSeconds];
  if (v25 != [v3 dateResolutionInSeconds]) {
    [v4 appendFormat:@"%@:%ld ", @"dateResolutionInSeconds", -[REMDistributedEvaluationCollectionOptions dateResolutionInSeconds](self, "dateResolutionInSeconds")];
  }
  int v26 = [(REMDistributedEvaluationCollectionOptions *)self includeReminderTitleCategoryFilteredStopWords];
  if (v26 != [v3 includeReminderTitleCategoryFilteredStopWords]) {
    [v4 appendFormat:@"%@:%ld ", @"includeReminderTitleCategoryFilteredStopWords", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryFilteredStopWords](self, "includeReminderTitleCategoryFilteredStopWords")];
  }
  int v27 = [(REMDistributedEvaluationCollectionOptions *)self includeReminderTitleCategoryUniversalGrammar];
  if (v27 != [v3 includeReminderTitleCategoryUniversalGrammar]) {
    [v4 appendFormat:@"%@:%ld ", @"includeReminderTitleCategoryUniversalGrammar", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategoryUniversalGrammar](self, "includeReminderTitleCategoryUniversalGrammar")];
  }
  int v28 = [(REMDistributedEvaluationCollectionOptions *)self includeReminderTitleCategorySentence2Vec];
  if (v28 != [v3 includeReminderTitleCategorySentence2Vec]) {
    [v4 appendFormat:@"%@:%ld ", @"includeReminderTitleCategorySentence2Vec", -[REMDistributedEvaluationCollectionOptions includeReminderTitleCategorySentence2Vec](self, "includeReminderTitleCategorySentence2Vec")];
  }
  [(REMDistributedEvaluationCollectionOptions *)self reminderTitleCategoryDistanceTolerance];
  double v30 = v29;
  [v3 reminderTitleCategoryDistanceTolerance];
  double v32 = v30 - v31;
  if (v32 < 0.0) {
    double v32 = -v32;
  }
  if (v32 > 0.0001)
  {
    [(REMDistributedEvaluationCollectionOptions *)self reminderTitleCategoryDistanceTolerance];
    [v4 appendFormat:@"%@:%.3f ", @"reminderTitleCategoryDistanceTolerance", v33];
  }
  v34 = [(REMDistributedEvaluationCollectionOptions *)self reminderTitleCategoryEmbeddingURL];

  if (v34)
  {
    v35 = [(REMDistributedEvaluationCollectionOptions *)self reminderTitleCategoryEmbeddingURL];
    [v4 appendFormat:@"%@:%@ ", @"reminderTitleCategoryEmbeddingURL", v35];
  }
  [v4 appendString:@">"];

  return v4;
}

- (BOOL)includeListNames
{
  BOOL v3 = +[REMSystemUtilities isInternalInstall];
  if (v3) {
    LOBYTE(v3) = self->_includeListNames;
  }
  return v3;
}

- (BOOL)includeListNameFuzzedEmbeddings
{
  BOOL v3 = +[REMSystemUtilities isInternalInstall];
  if (v3) {
    LOBYTE(v3) = self->_includeListNameFuzzedEmbeddings;
  }
  return v3;
}

- (BOOL)includeReminderTitles
{
  BOOL v3 = +[REMSystemUtilities isInternalInstall];
  if (v3) {
    LOBYTE(v3) = self->_includeReminderTitles;
  }
  return v3;
}

- (BOOL)includeReminderTitleFuzzedEmbeddings
{
  BOOL v3 = +[REMSystemUtilities isInternalInstall];
  if (v3) {
    LOBYTE(v3) = self->_includeReminderTitleFuzzedEmbeddings;
  }
  return v3;
}

+ (id)_attachmentURLFromFilenameWithKey:(id)a3 inJSONRepresentation:(id)a4 attachmentURLs:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [v10 objectForKey:v9];
  if (!v12)
  {
    int v16 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a6) {
      goto LABEL_22;
    }
    int v23 = [NSString stringWithFormat:@"Unexpected type for fileame {filename: %@, key: %@}", v12, v9];
    *a6 = +[REMError internalErrorWithDebugDescription:v23];

    goto LABEL_21;
  }
  int v28 = a6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v26 = v11;
    id v27 = v10;
    int v16 = 0;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v13);
        }
        int v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v20 = [v19 lastPathComponent];
        int v21 = [v20 isEqualToString:v12];

        if (v21)
        {
          id v22 = v19;

          int v16 = v22;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);

    id v11 = v26;
    id v10 = v27;
    if (!v16) {
      goto LABEL_19;
    }
LABEL_15:
    a6 = v16;
    goto LABEL_22;
  }

LABEL_19:
  a6 = v28;
  if (!v28) {
    goto LABEL_22;
  }
  int v24 = [NSString stringWithFormat:@"Did not find url {filename: %@, key: %@, urls: %@}", v12, v9, v13];
  *int v28 = +[REMError internalErrorWithDebugDescription:v24];

LABEL_21:
  a6 = 0;
LABEL_22:

  return a6;
}

- (void)setIncludeListNames:(BOOL)a3
{
  self->_includeListNames = a3;
}

- (void)setIncludeReminderTitles:(BOOL)a3
{
  self->_includeReminderTitles = a3;
}

- (void)setIncludeListNameFuzzedEmbeddings:(BOOL)a3
{
  self->_includeListNameFuzzedEmbeddings = a3;
}

- (void)setIncludeReminderTitleFuzzedEmbeddings:(BOOL)a3
{
  self->_includeReminderTitleFuzzedEmbeddings = a3;
}

- (BOOL)includeSystemLanguage
{
  return self->_includeSystemLanguage;
}

- (void)setIncludeSystemLanguage:(BOOL)a3
{
  self->_includeSystemLanguage = a3;
}

- (BOOL)includeSystemTimezone
{
  return self->_includeSystemTimezone;
}

- (void)setIncludeSystemTimezone:(BOOL)a3
{
  self->_includeSystemTimezone = a3;
}

- (BOOL)includeAccountType
{
  return self->_includeAccountType;
}

- (void)setIncludeAccountType:(BOOL)a3
{
  self->_includeAccountType = a3;
}

- (BOOL)includeListGroupInfo
{
  return self->_includeListGroupInfo;
}

- (void)setIncludeListGroupInfo:(BOOL)a3
{
  self->_includeListGroupInfo = a3;
}

- (BOOL)includeReminderTitleSaltedHash
{
  return self->_includeReminderTitleSaltedHash;
}

- (void)setIncludeReminderTitleSaltedHash:(BOOL)a3
{
  self->_includeReminderTitleSaltedHash = a3;
}

- (BOOL)includeDates
{
  return self->_includeDates;
}

- (void)setIncludeDates:(BOOL)a3
{
  self->_includeDates = a3;
}

- (BOOL)includeDayOfWeek
{
  return self->_includeDayOfWeek;
}

- (void)setIncludeDayOfWeek:(BOOL)a3
{
  self->_includeDayOfWeek = a3;
}

- (BOOL)includeRecurrenceInfo
{
  return self->_includeRecurrenceInfo;
}

- (void)setIncludeRecurrenceInfo:(BOOL)a3
{
  self->_includeRecurrenceInfo = a3;
}

- (BOOL)includeLocationInfo
{
  return self->_includeLocationInfo;
}

- (void)setIncludeLocationInfo:(BOOL)a3
{
  self->_includeLocationInfo = a3;
}

- (BOOL)includeAttachmentUTIs
{
  return self->_includeAttachmentUTIs;
}

- (void)setIncludeAttachmentUTIs:(BOOL)a3
{
  self->_includeAttachmentUTIs = a3;
}

- (BOOL)includeRemindMeWhenMessagingInfo
{
  return self->_includeRemindMeWhenMessagingInfo;
}

- (void)setIncludeRemindMeWhenMessagingInfo:(BOOL)a3
{
  self->_includeRemindMeWhenMessagingInfo = a3;
}

- (BOOL)includeAlarmDates
{
  return self->_includeAlarmDates;
}

- (void)setIncludeAlarmDates:(BOOL)a3
{
  self->_includeAlarmDates = a3;
}

- (BOOL)includeSubtaskInfo
{
  return self->_includeSubtaskInfo;
}

- (void)setIncludeSubtaskInfo:(BOOL)a3
{
  self->_includeSubtaskInfo = a3;
}

- (BOOL)includeUserActivityInfo
{
  return self->_includeUserActivityInfo;
}

- (void)setIncludeUserActivityInfo:(BOOL)a3
{
  self->_includeUserActivityInfo = a3;
}

- (BOOL)includeIsFlagged
{
  return self->_includeIsFlagged;
}

- (void)setIncludeIsFlagged:(BOOL)a3
{
  self->_includeIsFlagged = a3;
}

- (BOOL)includePriority
{
  return self->_includePriority;
}

- (void)setIncludePriority:(BOOL)a3
{
  self->_includePriority = a3;
}

- (BOOL)relevantWordTagsIncludeOtherWord
{
  return self->_relevantWordTagsIncludeOtherWord;
}

- (void)setRelevantWordTagsIncludeOtherWord:(BOOL)a3
{
  self->_relevantWordTagsIncludeOtherWord = a3;
}

- (BOOL)includeReminderTitleCategoryFilteredStopWords
{
  return self->_includeReminderTitleCategoryFilteredStopWords;
}

- (void)setIncludeReminderTitleCategoryFilteredStopWords:(BOOL)a3
{
  self->_includeReminderTitleCategoryFilteredStopWords = a3;
}

- (BOOL)includeReminderTitleCategoryUniversalGrammar
{
  return self->_includeReminderTitleCategoryUniversalGrammar;
}

- (void)setIncludeReminderTitleCategoryUniversalGrammar:(BOOL)a3
{
  self->_includeReminderTitleCategoryUniversalGrammar = a3;
}

- (BOOL)includeReminderTitleCategorySentence2Vec
{
  return self->_includeReminderTitleCategorySentence2Vec;
}

- (void)setIncludeReminderTitleCategorySentence2Vec:(BOOL)a3
{
  self->_includeReminderTitleCategorySentence2Vec = a3;
}

- (double)reminderTitleCategoryDistanceTolerance
{
  return self->_reminderTitleCategoryDistanceTolerance;
}

- (void)setReminderTitleCategoryDistanceTolerance:(double)a3
{
  self->_reminderTitleCategoryDistanceTolerance = a3;
}

- (NSURL)reminderTitleCategoryEmbeddingURL
{
  return self->_reminderTitleCategoryEmbeddingURL;
}

- (void)setReminderTitleCategoryEmbeddingURL:(id)a3
{
}

- (unint64_t)dateResolutionInSeconds
{
  return self->_dateResolutionInSeconds;
}

- (void)setDateResolutionInSeconds:(unint64_t)a3
{
  self->_dateResolutionInSeconds = a3;
}

- (unint64_t)creationDateWithinDays
{
  return self->_creationDateWithinDays;
}

- (void)setCreationDateWithinDays:(unint64_t)a3
{
  self->_creationDateWithinDays = a3;
}

- (void).cxx_destruct
{
}

@end