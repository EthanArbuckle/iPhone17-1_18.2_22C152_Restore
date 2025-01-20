@interface OABContent
+ (void)readFromContainer:(id)a3 toDrawable:(id)a4 state:(id)a5;
+ (void)readFromContentObject:(id)a3 content:(EshContent *)a4 toDrawable:(id)a5 state:(id)a6;
+ (void)readFromContentObject:(id)a3 toDrawable:(id)a4 state:(id)a5;
@end

@implementation OABContent

+ (void)readFromContainer:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v14 eshGroup];
  if (v10) {
    uint64_t v11 = v10 + 272;
  }
  else {
    uint64_t v11 = 0;
  }
  if (!v10)
  {
    v12 = [NSString stringWithUTF8String:"+[OABContent readFromContainer:toDrawable:state:]"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Binary/Mapper/OABContent.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 39, 0, "invalid nil value for '%{public}s'", "srcContentPtr");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [a1 readFromContentObject:v14 content:v11 toDrawable:v8 state:v9];
}

+ (void)readFromContentObject:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (const void *)[v14 eshObject];
  if (!v10
  {
    v12 = objc_msgSend(NSString, "stringWithUTF8String:", "+[OABContent readFromContentObject:toDrawable:state:]", v11);
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Binary/Mapper/OABContent.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 49, 0, "invalid nil value for '%{public}s'", "srcContentPtr");

    +[OITSUAssertionHandler logBacktraceThrottled];
    uint64_t v11 = 0;
  }
  [a1 readFromContentObject:v14 content:v11 toDrawable:v8 state:v9];
}

+ (void)readFromContentObject:(id)a3 content:(EshContent *)a4 toDrawable:(id)a5 state:(id)a6
{
  id v29 = a3;
  id v9 = a5;
  id v31 = a6;
  __n128 v32 = 0uLL;
  uint64_t v10 = (*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
  *(void *)&double v11 = EshContentProperties::getBounds(v10, &v32).n128_u64[0];
  int v13 = v32.n128_u32[0];
  int v12 = v32.n128_i32[1];
  unsigned __int32 v14 = v32.n128_u32[2];
  unsigned __int32 v15 = v32.n128_u32[3];
  v16 = objc_msgSend(v9, "drawableProperties", v11);
  v17 = objc_alloc_init(OADOrientedBounds);
  [v16 setOrientedBounds:v17];
  v18 = (EshContentLocks *)(*((uint64_t (**)(EshContent *))a4->var0 + 4))(a4);
  if (EshContentLocks::isAspectRatioSet(v18)) {
    [v16 setAspectRatioLocked:EshContentLocks::getAspectRatio(v18)];
  }
  HIDWORD(v19) = HIDWORD(v33);
  *(float *)&double v19 = v33;
  -[OADOrientedBounds setRotation:](v17, "setRotation:", v19, v29);
  [(OADOrientedBounds *)v17 setFlipX:v34];
  [(OADOrientedBounds *)v17 setFlipY:v35];
  [(OADOrientedBounds *)v17 rotation];
  BOOL v20 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  double v21 = (double)v13;
  double v22 = (double)v12;
  double v23 = (double)(int)(v14 - v13);
  double v24 = (double)(int)(v15 - v12);
  if (v20) {
    double v21 = NSTransposedRectWithSameCenter(v21, v22, v23, v24);
  }
  -[OADOrientedBounds setBounds:](v17, "setBounds:", v21, v22, v23, v24);
  v25 = (EshContentProperties *)(*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
  if (EshContentProperties::isWrdInlineSet(v25))
  {
    v26 = (EshContentProperties *)(*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
    [v16 setWrdInline:EshContentProperties::getWrdInline(v26)];
  }
  v27 = (EshContentProperties *)(*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
  uint64_t ShapeID = EshContentProperties::getShapeID(v27);
  [v31 setDrawable:v9 forShapeId:ShapeID];
  [v31 setContentObject:v30 forId:ShapeID];
  [v9 setId:ShapeID];
}

@end