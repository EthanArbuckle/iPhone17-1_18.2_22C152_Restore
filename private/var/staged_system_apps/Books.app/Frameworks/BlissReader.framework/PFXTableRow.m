@interface PFXTableRow
+ (void)ensureMinimumNumberOfRows:(unsigned __int16)a3 withState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXTableRow

+ (void)ensureMinimumNumberOfRows:(unsigned __int16)a3 withState:(id)a4
{
  unsigned int v4 = a3;
  id v5 = [a4 currentTableReader];
  id v6 = [v5 tableModel];
  if ([v6 numberOfRows] < v4)
  {
    [v6 numberOfRows];
    [v6 numberOfRows];
    TSTTableInsertRows();
  }

  [v5 ensureStrokeMatricesMatchModel];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "propertySet");
  id v5 = [a3 currentTableReader];
  id v6 = v5;
  if (v5)
  {
    [v5 startRow];
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v4, "valueForProperty:", "height"), "lastObject"), "value"), "doubleValue");
    [v6 height];
    objc_msgSend(v6, "setNumberOfRows:", (unsigned __int16)((unsigned __int16)objc_msgSend(v6, "numberOfRows") + 1));
    +[PFXTableRow ensureMinimumNumberOfRows:withState:](PFXTableRow, "ensureMinimumNumberOfRows:withState:", [v6 numberOfRows], a3);
    [v6 tableModel];
    [v6 numberOfRows];
    TSTTableSetHeightOfRow();
  }
  return v6 != 0;
}

- (void)mapEndElementWithState:(id)a3
{
  id v3 = [a3 currentTableReader];

  [v3 endRow];
}

@end