@interface THGlossaryDividerRep
- (BOOL)directlyManagesLayerContent;
- (void)didUpdateLayer:(id)a3;
- (void)updateLayerGeometryFromLayout:(id)a3;
@end

@implementation THGlossaryDividerRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  -[THGlossaryDividerRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v11, &v8, [THGlossaryDividerRep layout](self, "layout").geometry);
  *((void *)&v12 + 1) = ceil(*((double *)&v12 + 1));
  long long v5 = v8;
  long long v6 = v9;
  long long v7 = v10;
  [(THGlossaryDividerRep *)self antiAliasDefeatLayerFrame:&v11 forTransform:&v5];
  long long v5 = v8;
  long long v6 = v9;
  long long v7 = v10;
  [a3 setIfDifferentFrame:&v5 orTransform:v11, v12];
}

- (void)didUpdateLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryDividerRep;
  -[THGlossaryDividerRep didUpdateLayer:](&v4, "didUpdateLayer:");
  objc_msgSend(a3, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.150000006), "CGColor"));
}

@end