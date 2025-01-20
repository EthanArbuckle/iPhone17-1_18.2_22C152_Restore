@interface CHBErrorBar
+ (id)readErrorBarGraphicProperties:(const XlChartSeriesFormat *)a3 forStyleIndex:(unint64_t)a4 state:(id)a5;
+ (int)edErrorBarDirectionFrom:(int)a3;
+ (int)edErrorBarTypeFrom:(int)a3;
+ (int)xlErrorBarSourceFrom:(int)a3;
+ (int)xlErrorBarTypeFrom:(int)a3 direction:(int)a4;
+ (void)readFrom:(void *)a3 toSeries:(id)a4 state:(id)a5;
@end

@implementation CHBErrorBar

+ (void)readFrom:(void *)a3 toSeries:(id)a4 state:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  if (a3)
  {
    v9 = [v17 objectWithKey:(*(unsigned int (**)(void *))(*(void *)a3 + 24))(a3)];
    uint64_t v10 = [a1 edErrorBarDirectionFrom:*((unsigned int *)a3 + 60)];
    if (v10 == 1) {
      [v9 errorBarYAxis];
    }
    else {
    uint64_t v11 = [v9 errorBarXAxis];
    }
    v12 = (void *)v11;
    if (!v11)
    {
      v13 = [v9 chart];
      v12 = +[CHDErrorBar errorBarWithChart:v13];
    }
    objc_msgSend(v12, "setType:", objc_msgSend(a1, "edErrorBarTypeFrom:", *((unsigned int *)a3 + 60)));
    [v12 setDirection:v10];
    [v12 setValueType:*((unsigned int *)a3 + 58)];
    [v12 setNoEndCap:*((unsigned char *)a3 + 236) == 0];
    if ([v12 valueType] == 4 || objc_msgSend(v12, "valueType") == 5)
    {
      uint64_t v14 = *((void *)a3 + 19);
      if (!v14) {
        uint64_t v14 = *((void *)a3 + 20);
      }
      if ([v12 type] == 2)
      {
        v15 = +[CHBData readFrom:v14 state:v8];
        [v12 setPlusValues:v15];
      }
      else
      {
        v15 = +[CHBData readFrom:v14 state:v8];
        [v12 setMinusValues:v15];
      }
    }
    else
    {
      [v12 setValue:*((double *)a3 + 27)];
    }
    if (v11) {
      [v12 setType:0];
    }
    v16 = objc_msgSend(a1, "readErrorBarGraphicProperties:forStyleIndex:state:", objc_msgSend(v8, "defaultFormatForXlSeries:", a3), objc_msgSend(v9, "styleIndex"), v8);
    [v12 setGraphicProperties:v16];

    [v9 setErrorBar:v12];
  }
}

+ (int)edErrorBarDirectionFrom:(int)a3
{
  return (a3 - 3) < 0xFFFFFFFE;
}

+ (int)edErrorBarTypeFrom:(int)a3
{
  if ((a3 & 0xFFFFFFFD) == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)readErrorBarGraphicProperties:(const XlChartSeriesFormat *)a3 forStyleIndex:(unint64_t)a4 state:(id)a5
{
  id v7 = a5;
  id v8 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:a3 state:v7];
  v9 = [v7 autoStyling];
  [v9 resolveGraphicPropertiesOfErrorBar:v8 forSeriesIndex:a4];

  return v8;
}

+ (int)xlErrorBarTypeFrom:(int)a3 direction:(int)a4
{
  if (a4 == 1) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (a4 == 1) {
    int v5 = 3;
  }
  else {
    int v5 = 1;
  }
  if (a3 == 1) {
    return v4;
  }
  else {
    return v5;
  }
}

+ (int)xlErrorBarSourceFrom:(int)a3
{
  if ((a3 - 1) >= 5) {
    return 2;
  }
  else {
    return a3;
  }
}

@end