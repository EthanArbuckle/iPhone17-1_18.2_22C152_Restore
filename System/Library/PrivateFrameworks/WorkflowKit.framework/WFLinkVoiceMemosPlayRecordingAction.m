@interface WFLinkVoiceMemosPlayRecordingAction
- (id)entityParameterName;
- (id)localizedCategoryWithContext:(id)a3;
- (id)overrideLabelsByParameter;
@end

@implementation WFLinkVoiceMemosPlayRecordingAction

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"VoiceMemosSubcategoryRecordings", @"Recordings");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)overrideLabelsByParameter
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFLinkVoiceMemosPlayRecordingAction *)self entityParameterName];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [(WFLinkEntityAction *)self entityName];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(WFLinkEntityAction *)self entityName];
      v8 = [v7 key];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        v10 = [(WFLinkVoiceMemosPlayRecordingAction *)self entityParameterName];
        v14 = v10;
        v11 = [(WFLinkEntityAction *)self entityName];
        v15[0] = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v12 = 0;
LABEL_7:
  return v12;
}

- (id)entityParameterName
{
  return @"entity";
}

@end