@interface NTKNitsViewerComplicationEntryModel
+ (id)modelWithNits:(float)a3;
+ (id)tritiumModel;
- (id)entryForComplicationFamily:(int64_t)a3;
@end

@implementation NTKNitsViewerComplicationEntryModel

+ (id)tritiumModel
{
  v2 = objc_alloc_init(NTKNitsViewerComplicationEntryModel);
  v2->_nitsValue = -1.0;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(NTKTimelineEntryModel *)v2 setEntryDate:v3];

  return v2;
}

+ (id)modelWithNits:(float)a3
{
  v4 = objc_alloc_init(NTKNitsViewerComplicationEntryModel);
  v4->_nitsValue = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [(NTKTimelineEntryModel *)v4 setEntryDate:v5];

  return v4;
}

- (id)entryForComplicationFamily:(int64_t)a3
{
  float nitsValue = self->_nitsValue;
  if (nitsValue == -1.0)
  {
    v6 = @"----";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0f", nitsValue);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  switch(a3)
  {
    case 8:
      v7 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"NITS"];
      v8 = [MEMORY[0x1E4F19AB0] textProviderWithText:v6];
      uint64_t v9 = [MEMORY[0x1E4F19880] templateWithInnerTextProvider:v8 outerTextProvider:v7];
      goto LABEL_10;
    case 9:
      v7 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"NITS"];
      v8 = [MEMORY[0x1E4F19AB0] textProviderWithText:v6];
      v11 = [MEMORY[0x1E4F19828] templateWithLine1TextProvider:v7 line2TextProvider:v8];
      v12 = [MEMORY[0x1E4F197B8] templateWithCircularTemplate:v11];
      v13 = (void *)MEMORY[0x1E4F19A10];
      v14 = [(NTKTimelineEntryModel *)self entryDate];
      v10 = [v13 entryWithDate:v14 complicationTemplate:v12];

      goto LABEL_11;
    case 10:
      v7 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"NITS"];
      v8 = [MEMORY[0x1E4F19AB0] textProviderWithText:v6];
      uint64_t v9 = [MEMORY[0x1E4F19828] templateWithLine1TextProvider:v7 line2TextProvider:v8];
      goto LABEL_10;
    case 11:
      v7 = [MEMORY[0x1E4F19AB0] textProviderWithText:@"NITS"];
      v8 = [MEMORY[0x1E4F19AB0] textProviderWithText:v6];
      uint64_t v9 = [MEMORY[0x1E4F19930] templateWithHeaderTextProvider:v7 bodyTextProvider:v8];
LABEL_10:
      v11 = (void *)v9;
      v15 = (void *)MEMORY[0x1E4F19A10];
      v12 = [(NTKTimelineEntryModel *)self entryDate];
      v10 = [v15 entryWithDate:v12 complicationTemplate:v11];
LABEL_11:

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

@end