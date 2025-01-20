@interface NTKCBuildNumberComplicationEntryModel
+ (id)modelWithBuildNum:(id)a3;
- (id)entryForComplicationFamily:(int64_t)a3;
@end

@implementation NTKCBuildNumberComplicationEntryModel

+ (id)modelWithBuildNum:(id)a3
{
  v3 = (NSString *)a3;
  v4 = objc_alloc_init(NTKCBuildNumberComplicationEntryModel);
  buildNum = v4->buildNum;
  v4->buildNum = v3;
  v6 = v3;

  prefixString = v4->prefixString;
  v4->prefixString = (NSString *)@"Phone";

  v8 = [MEMORY[0x1E4F1C9C8] date];

  [(NTKTimelineEntryModel *)v4 setEntryDate:v8];
  return v4;
}

- (id)entryForComplicationFamily:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F19AB0] textProviderWithText:self->prefixString];
  v6 = [MEMORY[0x1E4F19AB0] textProviderWithText:self->buildNum];
  v7 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v8 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v5 body1TextProvider:v6];
      goto LABEL_12;
    case 3:
      v9 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@ %@", v5, v6];
      uint64_t v10 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v9];
      goto LABEL_6;
    case 8:
      uint64_t v8 = [MEMORY[0x1E4F19880] templateWithInnerTextProvider:v6 outerTextProvider:v5];
      goto LABEL_12;
    case 9:
      v11 = [(NTKCBuildNumberComplicationEntryModel *)self entryForComplicationFamily:10];
      v9 = [v11 complicationTemplate];

      uint64_t v10 = [MEMORY[0x1E4F197B8] templateWithCircularTemplate:v9];
LABEL_6:
      v12 = (void *)v10;

      if (!v12) {
        goto LABEL_7;
      }
      goto LABEL_13;
    case 10:
      v13 = (void *)MEMORY[0x1E4F19828];
      goto LABEL_11;
    case 11:
      uint64_t v8 = [MEMORY[0x1E4F19930] templateWithHeaderTextProvider:v5 bodyTextProvider:v6];
      goto LABEL_12;
    case 12:
      v13 = (void *)MEMORY[0x1E4F198F8];
LABEL_11:
      uint64_t v8 = [v13 templateWithLine1TextProvider:v5 line2TextProvider:v6];
LABEL_12:
      v12 = (void *)v8;
      if (v8)
      {
LABEL_13:
        v14 = (void *)MEMORY[0x1E4F19A10];
        v15 = [(NTKTimelineEntryModel *)self entryDate];
        v7 = [v14 entryWithDate:v15 complicationTemplate:v12];
      }
      else
      {
LABEL_7:
        v7 = 0;
      }
      break;
    default:
      break;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->buildNum, 0);
  objc_storeStrong((id *)&self->prefixString, 0);
}

@end