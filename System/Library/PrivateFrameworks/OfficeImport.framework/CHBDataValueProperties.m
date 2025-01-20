@interface CHBDataValueProperties
+ (Class)chbDataValuePropertiesClassWithState:(id)a3;
+ (id)chdDataValueProperties;
+ (id)chdDataValuePropertiesFrom:(const XlChartSeriesFormat *)a3 state:(id)a4;
+ (id)chdDataValuePropertiesFromState:(id)a3;
+ (id)readFrom:(const XlChartSeriesFormat *)a3 state:(id)a4;
@end

@implementation CHBDataValueProperties

+ (id)readFrom:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = [a1 chdDataValuePropertiesFrom:a3 state:v6];
    [v7 setDataValueIndex:a3->var9];
    XlChartBinaryReader::setDataPointFormat((uint64_t *)[v6 xlReader], a3->var12, LOWORD(a3->var9));
    v8 = +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:a3 state:v6];
    [v7 setGraphicProperties:v8];

    v9 = +[CHBMarker readFrom:a3 state:v6];
    [v7 setMarker:v9];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)chdDataValuePropertiesFrom:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  v5 = (void *)[a1 chbDataValuePropertiesClassWithState:a4];
  id v6 = [v5 chdDataValueProperties];
  [v5 read:v6 from:a3];
  return v6;
}

+ (Class)chbDataValuePropertiesClassWithState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 xlCurrentPlot];
  if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 16))(v4) != 2) {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
  v5 = objc_opt_class();

  return (Class)v5;
}

+ (id)chdDataValueProperties
{
  v2 = objc_alloc_init(CHDDataValueProperties);
  return v2;
}

+ (id)chdDataValuePropertiesFromState:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a1, "chbDataValuePropertiesClassWithState:", v4), "chdDataValueProperties");

  return v5;
}

@end