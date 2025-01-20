@interface PFXColumnStyle
+ (BOOL)propertiesHaveColumnStyle:(id)a3;
+ (BOOL)propertiesHaveInset:(id)a3;
+ (id)createColumnsWithPropertySet:(id)a3 columnCount:(unint64_t)a4 readerState:(id)a5;
+ (id)createColumnsWithPropertySet:(id)a3 readerState:(id)a4;
+ (id)createPaddingWithPropertySet:(id)a3 readerState:(id)a4;
+ (unint64_t)getColumnCountFromPropertySet:(id)a3 maximumColumnCount:(unint64_t)a4;
+ (unsigned)mapVerticalAlignmentWithPropertySet:(id)a3;
@end

@implementation PFXColumnStyle

+ (unsigned)mapVerticalAlignmentWithPropertySet:(id)a3
{
  id v3 = [a3 valueForProperty:"vertical-align"];
  if (v3)
  {
    id v4 = [v3 lastObject];
    if ([v4 type] == &stru_108)
    {
      id v5 = [v4 value];
      if ([v5 isEqualToString:@"middle"])
      {
        LODWORD(v3) = 1;
      }
      else if ([v5 isEqualToString:@"bottom"])
      {
        LODWORD(v3) = 2;
      }
      else if ([v5 isEqualToString:@"justify"])
      {
        LODWORD(v3) = 3;
      }
      else
      {
        LODWORD(v3) = 0;
      }
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

+ (unint64_t)getColumnCountFromPropertySet:(id)a3 maximumColumnCount:(unint64_t)a4
{
  id v5 = [a3 valueForProperty:PFXPropNmApplePubColumnCount[0]];
  if (!v5) {
    return 1;
  }
  id v6 = [v5 lastObject];
  if ([v6 type] != &stru_108.addr) {
    return 1;
  }
  unint64_t result = (unint64_t)[v6 value].integerValue;
  if (result >= a4) {
    return a4;
  }
  return result;
}

+ (id)createColumnsWithPropertySet:(id)a3 columnCount:(unint64_t)a4 readerState:(id)a5
{
  bzero(v25, 0x50uLL);
  bzero(v24, 0x48uLL);
  id v8 = [a3 valueForProperty:PFXPropNmApplePubColumnGap[0]];
  double v9 = 0.0;
  if (v8)
  {
    v10 = v8;
    id v11 = [v8 count];
    unint64_t v12 = (unint64_t)v11 >= a4 - 1 ? a4 - 1 : (unint64_t)v11;
    if (v12)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        +[PFXStyleUtilities percentageWidthInPair:readerState:](PFXStyleUtilities, "percentageWidthInPair:readerState:", [v10 objectAtIndex:i], a5);
        if (v9 + v14 > 0.75) {
          double v14 = 0.75 - v9;
        }
        *(double *)&v24[i] = v14;
        double v9 = v9 + v14;
      }
      double v9 = v9 + 0.0;
    }
  }
  id v15 = [a3 valueForProperty:PFXPropNmApplePubColumnWidth[0]];
  v16 = v15;
  if (v15)
  {
    id v17 = [v15 count];
    if ((unint64_t)v17 >= a4) {
      unint64_t v18 = a4;
    }
    else {
      unint64_t v18 = (unint64_t)v17;
    }
    if (v18)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        +[PFXStyleUtilities percentageWidthInPair:readerState:](PFXStyleUtilities, "percentageWidthInPair:readerState:", [v16 objectAtIndex:j], a5);
        if (v9 + v20 > 1.0) {
          double v20 = 1.0 - v9;
        }
        v25[j] = v20;
        double v9 = v9 + v20;
      }
    }
    double v21 = 1.0 - v9;
    if (1.0 - v9 > 0.0)
    {
      v25[a4 - 1] = v21 + v25[a4 - 1];
      double v9 = v9 + v21;
    }
  }
  id v22 = objc_alloc((Class)TSWPColumns);
  if (v9 <= 1.0) {
    return [v22 initWithColumnCount:a4 equalWidth:v16 == 0 widthArray:v25 gapArray:v24];
  }

  return [v22 initWithColumnCount:a4];
}

+ (BOOL)propertiesHaveColumnStyle:(id)a3
{
  return [a3 valueForProperty:PFXPropNmApplePubColumnCount[0]] != 0;
}

+ (id)createColumnsWithPropertySet:(id)a3 readerState:(id)a4
{
  if (!objc_msgSend(a1, "propertiesHaveColumnStyle:")
    || (id v7 = [a1 getColumnCountFromPropertySet:a3 maximumColumnCount:10], (unint64_t)v7 < 2)
    || (id result = [a1 createColumnsWithPropertySet:a3 columnCount:v7 readerState:a4]) == 0)
  {
    id v9 = objc_alloc((Class)TSWPColumns);
    return [v9 initWithColumnCount:1];
  }
  return result;
}

+ (BOOL)propertiesHaveInset:(id)a3
{
  return [a3 valueForProperty:"padding"]
      || [a3 valueForProperty:"padding-top"]
      || [a3 valueForProperty:"padding-bottom"]
      || [a3 valueForProperty:"padding-left"]
      || [a3 valueForProperty:"padding-right"] != 0;
}

+ (id)createPaddingWithPropertySet:(id)a3 readerState:(id)a4
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (objc_msgSend(a1, "propertiesHaveInset:"))
  {
    id v10 = [a3 valueForProperty:"padding"];
    if (v10)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v10 lastObject], a4);
      double v9 = v11;
    }
    id v12 = [a3 valueForProperty:"padding-top"];
    double v6 = v9;
    if (v12)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v12 lastObject], a4);
      double v6 = v13;
    }
    id v14 = [a3 valueForProperty:"padding-bottom"];
    double v7 = v9;
    if (v14)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v14 lastObject], a4);
      double v7 = v15;
    }
    id v16 = [a3 valueForProperty:"padding-left"];
    double v8 = v9;
    if (v16)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v16 lastObject], a4);
      double v8 = v17;
    }
    id v18 = [a3 valueForProperty:"padding-right"];
    if (v18)
    {
      +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v18 lastObject], a4);
      double v9 = v19;
    }
  }
  id v20 = objc_alloc((Class)TSWPPadding);

  return [v20 initWithTopInset:v6 leftInset:v8 bottomInset:v7 rightInset:v9];
}

@end