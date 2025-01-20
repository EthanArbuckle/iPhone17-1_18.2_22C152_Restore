@interface SXNeighbouringComponentsPlacementCondition
- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5;
@end

@implementation SXNeighbouringComponentsPlacementCondition

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v5 = a3;
  v6 = [v5 leadingComponent];
  if ([v6 role] == 3)
  {

LABEL_4:
    v9 = [v5 leadingComponent];
    v10 = [v9 classification];
    v11 = [v5 trailingComponent];
    v12 = [v11 classification];
    char v13 = [v10 hasAffiliationWithClassification:v12 forDirection:1];

    v14 = [v5 trailingComponent];
    v15 = [v14 classification];
    v16 = [v5 leadingComponent];
    v17 = [v16 classification];
    char v18 = [v15 hasAffiliationWithClassification:v17 forDirection:0];

    char v19 = (v13 | v18) ^ 1;
    goto LABEL_16;
  }
  v7 = [v5 trailingComponent];
  int v8 = [v7 role];

  if (v8 == 3) {
    goto LABEL_4;
  }
  v20 = [v5 leadingComponent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [v5 trailingComponent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v19 = 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  v23 = [v5 leadingComponent];
  if (v23)
  {
    v24 = [v5 trailingComponent];
    if (v24)
    {
      char v19 = 0;
    }
    else
    {
      v25 = [v5 path];
      char v19 = [v25 count] == 0;
    }
  }
  else
  {
    char v19 = 0;
  }

LABEL_16:
  return v19;
}

@end