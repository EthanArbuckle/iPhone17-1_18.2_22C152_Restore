@interface TFFeedbackFormCellUpdater
- (void)updateCell:(id)a3 displayingEntry:(id)a4 contentDataSource:(id)a5 updateProxy:(id)a6;
@end

@implementation TFFeedbackFormCellUpdater

- (void)updateCell:(id)a3 displayingEntry:(id)a4 contentDataSource:(id)a5 updateProxy:(id)a6
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  [v14 applyContentsOfEntry:v9];
  objc_msgSend(v14, "prepareSeparatorsForCellInSectionLocation:", objc_msgSend(v14, "sectionLocation"));
  switch([v14 displayableDataType])
  {
    case 0:
      v12 = [v9 identifier];
      v13 = [v10 stringForIdentifier:v12];
      [v14 setDisplayedDataString:v13];
      goto LABEL_6;
    case 1:
      v12 = [v9 identifier];
      v13 = [v10 numberForIdentifier:v12];
      [v14 setDisplayedDataNumber:v13];
      goto LABEL_6;
    case 2:
      v12 = [v9 identifier];
      objc_msgSend(v14, "setDisplayedDataGroupInclusionBool:", objc_msgSend(v10, "isGroupWithIdentifierIncluded:", v12));
      goto LABEL_7;
    case 3:
      v12 = [v9 identifier];
      v13 = [v10 imageCollectionForIdentifer:v12];
      [v14 setDisplayedDataImageCollection:v13];
LABEL_6:

LABEL_7:
      break;
    default:
      break;
  }
  [v14 setUpdateProxy:v11];
}

@end