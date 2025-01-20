@interface WBSTabGroupUIString
+ (id)accessiblityLabelForTabGroupWithTitle:(id)a3 andTheseTabs:(unint64_t)a4;
+ (id)menuTitleCreateGroupWithTheseTabs:(unint64_t)a3;
+ (id)uniqueTabGroupTitleWithExisting:(id)a3;
@end

@implementation WBSTabGroupUIString

+ (id)uniqueTabGroupTitleWithExisting:(id)a3
{
  id v3 = a3;
  v4 = _WBSLocalizedString();
  if ([v3 containsObject:v4] && objc_msgSend(v3, "count"))
  {
    uint64_t v5 = 1;
    while (1)
    {
      v6 = NSString;
      v7 = _WBSLocalizedString();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (![v3 containsObject:v8]) {
        break;
      }

      if (++v5 > (unint64_t)[v3 count]) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    id v8 = v4;
  }

  return v8;
}

+ (id)menuTitleCreateGroupWithTheseTabs:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v5 = NSString;
    v6 = _WBSLocalizedString();
    id v3 = objc_msgSend(v5, "localizedStringWithFormat:", v6, a3);
  }
  return v3;
}

+ (id)accessiblityLabelForTabGroupWithTitle:(id)a3 andTheseTabs:(unint64_t)a4
{
  uint64_t v5 = NSString;
  id v6 = a3;
  v7 = _WBSLocalizedString();
  id v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6, a4);

  return v8;
}

@end