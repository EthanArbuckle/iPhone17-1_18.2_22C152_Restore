@interface WBOfficeArt
+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 to:(id)a7;
+ (void)setShapeAddress:(const WrdFileShapeAddress *)a3 toDrawable:(id)a4;
@end

@implementation WBOfficeArt

+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 to:(id)a7
{
  id v35 = a3;
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    var4 = a5->var4;
    var5 = a5->var5;
    v16 = [WDCharacterProperties alloc];
    v17 = [v12 document];
    v18 = [(WDCharacterProperties *)v16 initWithDocument:v17];

    v19 = [v12 document];
    +[WBCharacterProperties readFrom:v35 wrdProperties:var4 tracked:var5 document:v19 properties:v18];

    [v13 setProperties:v18];
    [v13 checkForFloating:v12];
    if (a5->var1 == 2) {
      v20 = (WrdFileShapeAddressTable *)[v35 fileShapeAddressHeaderTable];
    }
    else {
      v20 = (WrdFileShapeAddressTable *)[v35 fileShapeAddressTable];
    }
    uint64_t FileShapeAddressByCp = WrdFileShapeAddressTable::getFileShapeAddressByCp(v20, a4);
    WrdFileShapeAddress::WrdFileShapeAddress(&v36, FileShapeAddressByCp);
    v22 = [v35 drawableForShapeId:v36.var2];
    if (v22)
    {
      [v13 setDrawable:v22];
      objc_opt_class();
      v23 = [v22 clientData];
      v24 = [v23 anchor];
      [a1 setShapeAddress:&v36 toDrawable:v22];
      if (([v13 isFloating] & 1) == 0)
      {
        [v24 bounds];
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        v33 = [v22 drawableProperties];
        v34 = [v33 orientedBounds];
        objc_msgSend(v34, "setBounds:", v26, v28, v30, v32);

        [v23 clearAnchor];
      }
    }
  }
}

+ (void)setShapeAddress:(const WrdFileShapeAddress *)a3 toDrawable:(id)a4
{
  id v22 = a4;
  objc_opt_class();
  v5 = [v22 clientData];
  v6 = [v5 anchor];
  v7 = v6;
  if (a3->var7 < 4u) {
    objc_msgSend(v6, "setRelativeHorizontalPosition:");
  }
  if (a3->var8 <= 3u) {
    objc_msgSend(v7, "setRelativeVerticalPosition:");
  }
  if (a3->var9 <= 5u) {
    objc_msgSend(v7, "setTextWrappingMode:");
  }
  if (a3->var10 <= 3u) {
    objc_msgSend(v7, "setTextWrappingModeType:");
  }
  int var3 = a3->var3;
  int var4 = a3->var4;
  int var5 = a3->var5;
  int var6 = a3->var6;
  id v12 = [v22 drawableProperties];
  id v13 = [v12 orientedBounds];
  [v13 rotation];
  BOOL v14 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  double v15 = (float)var3 / 20.0;
  double v16 = (float)var4 / 20.0;
  double v17 = (float)(var5 - var3) / 20.0;
  double v18 = (float)(var6 - var4) / 20.0;

  if (v14)
  {
    double v15 = NSTransposedRectWithSameCenter((float)var3 / 20.0, (float)var4 / 20.0, (float)(var5 - var3) / 20.0, (float)(var6 - var4) / 20.0);
    double v16 = v19;
    double v17 = v20;
    double v18 = v21;
  }
  objc_msgSend(v7, "setBounds:", v15, v16, v17, v18);
}

@end