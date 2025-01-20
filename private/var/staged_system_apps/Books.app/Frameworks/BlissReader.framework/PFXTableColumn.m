@interface PFXTableColumn
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFXTableColumn

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "propertySet"), "valueForProperty:", "width"), "lastObject"), "value"), "doubleValue");
  id v4 = [a3 currentTableReader];
  v5 = v4;
  if (v4)
  {
    [v4 width];
    [v5 setNumberOfColumns:((unsigned __int16)([v5 numberOfColumns]) + 1)];
    id v6 = [v5 tableModel];
    unsigned int v7 = [v5 numberOfColumns];
    if (v7 > [v6 numberOfColumns])
    {
      [v6 numberOfColumns];
      TSTTableInsertColumns();
    }
    [v6 numberOfColumns];
    TSTTableSetWidthOfColumn();
  }
  return v5 != 0;
}

@end