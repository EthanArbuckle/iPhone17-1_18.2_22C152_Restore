@interface TFFeedbackEntryTypeCellProvider
+ (CGSize)cellSizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6;
+ (Class)cellClassForEntryType:(unint64_t)a3;
+ (id)reuseIdentifierForEntryType:(unint64_t)a3;
@end

@implementation TFFeedbackEntryTypeCellProvider

+ (id)reuseIdentifierForEntryType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"SHORT_TEXT";
  }
  else {
    return off_26468E690[a3 - 1];
  }
}

+ (Class)cellClassForEntryType:(unint64_t)a3
{
  if (a3 <= 3)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

+ (CGSize)cellSizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  switch([v10 type])
  {
    case 0:
      v13 = TFFeedbackFormShortTextCell;
      goto LABEL_6;
    case 1:
      v13 = TFFeedbackFormLongTextCell;
      goto LABEL_6;
    case 2:
      v13 = TFFeedbackFormGroupToggleCell;
      goto LABEL_6;
    case 3:
      v13 = TFFeedbackFormImageCollectionCell;
LABEL_6:
      -[__objc2_class sizeForEntry:dataSource:fittingSize:inTraitEnvironment:](v13, "sizeForEntry:dataSource:fittingSize:inTraitEnvironment:", v10, v11, v12, width, height);
      double height = v14;
      double width = v15;
      break;
    default:
      break;
  }

  double v16 = height;
  double v17 = width;
  result.double height = v17;
  result.double width = v16;
  return result;
}

@end