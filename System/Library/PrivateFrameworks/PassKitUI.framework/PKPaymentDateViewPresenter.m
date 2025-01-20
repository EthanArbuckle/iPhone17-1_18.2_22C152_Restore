@interface PKPaymentDateViewPresenter
+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7;
@end

@implementation PKPaymentDateViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  BOOL v7 = a5;
  id v26 = a3;
  id v9 = a4;
  [v26 setShowsDisclosure:0];
  [v26 setSelectionStyle:0];
  [v26 setShowsSeparator:v7];
  id v10 = v9;
  uint64_t v11 = [v10 paymentFrequency];
  if (qword_1EB545D50 != -1) {
    dispatch_once(&qword_1EB545D50, &__block_literal_global_232);
  }
  v12 = (void *)_MergedGlobals_693;
  v13 = [v10 paymentTimeZone];
  [v12 setTimeZone:v13];

  v14 = (void *)_MergedGlobals_693;
  v15 = [v10 paymentDate];
  v16 = [v14 stringFromDate:v15];

  switch(v11)
  {
    case 0:
    case 1:
    case 3:
      v17 = 0;
      v18 = 0;
      v19 = &stru_1EF1B5B50;
      break;
    case 2:
      v17 = PKLocalizedFeatureString();
      v20 = v16;
      goto LABEL_16;
    case 4:
      goto LABEL_9;
    case 5:
      goto LABEL_8;
    case 6:
      v18 = PKLocalizedFeatureString();
      if (!v18)
      {
LABEL_8:
        v18 = PKLocalizedFeatureString();
        if (!v18)
        {
LABEL_9:
          v18 = PKLocalizedFeatureString();
        }
      }
      v21 = PKLocalizedFeatureString();
      v22 = PKStringWithValidatedFormat();
      v17 = PKLocalizedFeatureString();
      v19 = [NSString stringWithFormat:@"%@\n(%@)", v18, v22];

      if (v17) {
        goto LABEL_11;
      }
      break;
    case 7:
      v17 = PKLocalizedFeatureString();
      PKLocalizedFeatureString();
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v19 = v20;
      v18 = 0;
      if (!v17) {
        break;
      }
LABEL_11:
      v23 = objc_msgSend(v17, "pk_uppercaseAttributedString");
      [v26 setLabel:v23];

      [v26 setAccessibilityLabel:v17];
      break;
    default:
      v17 = 0;
      v19 = 0;
      v18 = 0;
      break;
  }
  v24 = [(__CFString *)v19 pk_uppercaseAttributedString];
  v25 = [v26 addValue:v24 type:0];

  [v25 setNumberOfLines:2];
}

uint64_t __106__PKPaymentDateViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_693;
  _MergedGlobals_693 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_693;

  return [v2 setLocalizedDateFormatFromTemplate:@"MMM d, yyyy"];
}

@end