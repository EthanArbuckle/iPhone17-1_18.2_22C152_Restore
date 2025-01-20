@interface SSVoiceMemosResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
- (NSDate)creationDate;
- (NSNumber)durationInSeconds;
- (NSString)transcription;
- (SSVoiceMemosResultBuilder)initWithResult:(id)a3;
- (id)buildDescriptions;
- (id)buildTitle;
- (void)setCreationDate:(id)a3;
- (void)setDurationInSeconds:(id)a3;
- (void)setTranscription:(id)a3;
@end

@implementation SSVoiceMemosResultBuilder

+ (id)bundleId
{
  return @"com.apple.VoiceMemos";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSVoiceMemosResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSVoiceMemosResultBuilder;
  v5 = [(SSResultBuilder *)&v10 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSVoiceMemosResultBuilder *)v5 setCreationDate:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22D38] withType:objc_opt_class()];
    [(SSVoiceMemosResultBuilder *)v5 setDurationInSeconds:v7];

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F23598] withType:objc_opt_class()];
    [(SSVoiceMemosResultBuilder *)v5 setTranscription:v8];
  }
  return v5;
}

- (id)buildTitle
{
  v3 = [(SSVoiceMemosResultBuilder *)self transcription];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [(SSVoiceMemosResultBuilder *)self transcription];
    v6 = [(SSResultBuilder *)self buildHighlightedTextWithString:v5 includeQuotes:1];

    [v6 setMaxLines:2];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVoiceMemosResultBuilder;
    v6 = [(SSResultBuilder *)&v8 buildTitle];
  }
  return v6;
}

- (id)buildDescriptions
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (SSSnippetModernizationEnabled())
  {
    v3 = objc_opt_new();
    uint64_t v4 = [(SSVoiceMemosResultBuilder *)self transcription];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      v25.receiver = self;
      v25.super_class = (Class)SSVoiceMemosResultBuilder;
      v6 = [(SSResultBuilder *)&v25 buildTitle];
      v7 = [v6 text];
      [v3 addObject:v7];
    }
    objc_super v8 = [(SSVoiceMemosResultBuilder *)self creationDate];

    if (v8)
    {
      v9 = [(SSVoiceMemosResultBuilder *)self creationDate];
      objc_super v10 = +[SSDateFormatManager dynamicMediumStringFromDate:v9];
      [v3 addObject:v10];
    }
    v11 = [(SSVoiceMemosResultBuilder *)self durationInSeconds];

    if (v11)
    {
      v12 = [(SSVoiceMemosResultBuilder *)self durationInSeconds];
      [v12 doubleValue];
      double v14 = round(v13);

      v15 = objc_opt_new();
      v16 = v15;
      if (v14 < 60.0) {
        uint64_t v17 = 192;
      }
      else {
        uint64_t v17 = 224;
      }
      if (v14 < 60.0) {
        uint64_t v18 = 0x10000;
      }
      else {
        uint64_t v18 = 65538;
      }
      [v15 setAllowedUnits:v17];
      [v16 setZeroFormattingBehavior:v18];
      v19 = [v16 stringFromTimeInterval:v14];
      [v3 addObject:v19];
    }
    v20 = [v3 componentsJoinedByString:@" · "];
    if ([v20 length])
    {
      v21 = [MEMORY[0x1E4F9A378] textWithString:v20];
      v26[0] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SSVoiceMemosResultBuilder;
    v22 = [(SSResultBuilder *)&v24 buildDescriptions];
  }
  return v22;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSNumber)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(id)a3
{
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_durationInSeconds, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end