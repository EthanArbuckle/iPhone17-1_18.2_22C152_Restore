@interface PFXMargins
+ (const)paddingPropertyNames;
+ (void)initialize;
+ (void)loadMarginsForEntry:(id)a3 entryMediaState:(id)a4;
+ (void)mapMarginsForEntry:(id)a3 to:(id)a4 inList:(BOOL)a5;
@end

@implementation PFXMargins

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    operator new();
  }
}

+ (const)paddingPropertyNames
{
  return (const $7CD0A2DAA6FEE0E813DE24BAD448BB2F *)qword_5736F0;
}

+ (void)loadMarginsForEntry:(id)a3 entryMediaState:(id)a4
{
  [a4 parentFontSize:a3];
  double v6 = v5;
  [a4 blockWidth];
  double v8 = v7;
  double v25 = -65536.0;
  double v26 = -65536.0;
  double v23 = -65536.0;
  double v24 = -65536.0;
  double v21 = -65536.0;
  double v22 = -65536.0;
  double v19 = -65536.0;
  double v20 = -65536.0;
  id v9 = [a4 propertySet];
  +[PFSMargins mapMarginStyleProperty:v9 propertyNames:qword_5736F0 left:&v26 top:&v24 right:&v25 bottom:&v23 parentFontSize:v6 percentageBasis:v8];
  [a4 leftPadding];
  [a4 setLeftPadding:v10 - v26];
  [a4 rightPadding];
  [a4 setRightPadding:v11 - v25];
  [a4 paddingBefore];
  [a4 setPaddingBefore:v12 + v24];
  [a4 paddingAfter];
  [a4 setPaddingAfter:v13 + v23];
  id v14 = [a4 propertySet];
  +[PFSMargins mapMarginStyleProperty:v14 propertyNames:qword_5736F8 left:&v21 top:&v22 right:&v19 bottom:&v20 parentFontSize:v6 percentageBasis:v8];
  if (v22 > 0.0)
  {
    [a4 marginBefore:v22];
    [a4 setMarginBefore:v15 + v22];
  }
  if (v21 > 0.0)
  {
    [a4 leftMargin:v21];
    [a4 setLeftMargin:v16 + v21];
  }
  if (v20 > 0.0)
  {
    [a4 marginAfter:v20];
    [a4 setMarginAfter:v17 + v20];
  }
  if (v19 > 0.0)
  {
    [a4 rightMargin:v19];
    [a4 setRightMargin:v18 + v19];
  }
}

+ (void)mapMarginsForEntry:(id)a3 to:(id)a4 inList:(BOOL)a5
{
  id v8 = [a3 currentEntryMediaState];
  [a1 loadMarginsForEntry:a3 entryMediaState:v8];
  [v8 leftMargin];
  double v10 = v9;
  [v8 rightMargin];
  double v12 = v11;
  id v13 = [v8 ancestorParagraphStyle];
  if (v13)
  {
    double v15 = v13;
    if ([v13 definesProperty:81])
    {
      [v15 floatValueForProperty:81];
      double v10 = v10 + v16;
    }
    if ([v15 definesProperty:82])
    {
      [v15 floatValueForProperty:82];
      double v14 = v17;
      double v12 = v12 + v14;
    }
  }
  *(float *)&double v14 = v10;
  [a4 setFloatValue:81 forProperty:v14];
  *(float *)&double v18 = v12;
  [a4 setFloatValue:82 forProperty:v18];
  [v8 marginBefore];
  *(float *)&double v19 = v19;
  [a4 setFloatValue:87 forProperty:v19];
  [v8 marginAfter];
  *(float *)&double v20 = v20;

  [a4 setFloatValue:88 forProperty:v20];
}

@end