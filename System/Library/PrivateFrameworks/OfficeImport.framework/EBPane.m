@interface EBPane
+ (void)readXlPaneFrom:(XlSheetPresentation *)a3 state:(id)a4;
+ (void)writePaneForSheet:(id)a3 toXlSheetPresentation:(XlSheetPresentation *)a4 xlWindow2:(XlWindow2 *)a5;
@end

@implementation EBPane

+ (void)readXlPaneFrom:(XlSheetPresentation *)a3 state:(id)a4
{
  id v5 = a4;
  var3 = a3->var3;
  if (var3)
  {
    id v12 = v5;
    v7 = +[EDPane pane];
    [v7 setActivePane:*((unsigned int *)var3 + 6)];
    LOWORD(v8) = *((_WORD *)var3 + 8);
    [v7 setXSplitPosition:(double)v8];
    LOWORD(v9) = *((_WORD *)var3 + 9);
    [v7 setYSplitPosition:(double)v9];
    v10 = +[EDReference referenceWithFirstRow:*((unsigned __int16 *)var3 + 10) lastRow:*((unsigned __int16 *)var3 + 10) firstColumn:*((unsigned __int16 *)var3 + 11) lastColumn:*((unsigned __int16 *)var3 + 11)];
    [v7 setTopLeftCell:v10];

    v11 = [v12 edSheet];
    [v11 setPane:v7];

    id v5 = v12;
  }
}

+ (void)writePaneForSheet:(id)a3 toXlSheetPresentation:(XlSheetPresentation *)a4 xlWindow2:(XlWindow2 *)a5
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 pane];
    if (objc_claimAutoreleasedReturnValue()) {
      operator new();
    }
  }
}

@end