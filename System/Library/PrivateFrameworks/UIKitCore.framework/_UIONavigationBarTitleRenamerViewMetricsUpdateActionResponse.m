@interface _UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse
- (CGRect)bounds;
- (CGSize)intrinsicContentSize;
- (_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse)initWithRenderID:(unint64_t)a3 contextID:(unsigned int)a4 intrinsicContentSize:(CGSize)a5 bounds:(CGRect)a6 horizontalTextInset:(double)a7;
- (double)horizontalTextInset;
- (unint64_t)sourceLayerRenderId;
- (unsigned)sourceContextId;
@end

@implementation _UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse

- (_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse)initWithRenderID:(unint64_t)a3 contextID:(unsigned int)a4 intrinsicContentSize:(CGSize)a5 bounds:(CGRect)a6 horizontalTextInset:(double)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v12 = a5.height;
  double v13 = a5.width;
  uint64_t v14 = *(void *)&a4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v18 = [NSNumber numberWithUnsignedLongLong:a3];
  [v17 setObject:v18 forSetting:0];

  v19 = [NSNumber numberWithUnsignedInt:v14];
  [v17 setObject:v19 forSetting:1];

  v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v13, v12);
  [v17 setObject:v20 forSetting:2];

  v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  [v17 setObject:v21 forSetting:3];

  v22 = [NSNumber numberWithDouble:a7];
  [v17 setObject:v22 forSetting:4];

  v23 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *)self initWithInfo:v17 error:0];
  return v23;
}

- (unint64_t)sourceLayerRenderId
{
  v2 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *)self info];
  v3 = [v2 objectForSetting:0];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unsigned)sourceContextId
{
  v2 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *)self info];
  v3 = [v2 objectForSetting:1];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *)self info];
  v3 = [v2 objectForSetting:2];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGRect)bounds
{
  v2 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *)self info];
  v3 = [v2 objectForSetting:3];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (double)horizontalTextInset
{
  v2 = [(_UIONavigationBarTitleRenamerViewMetricsUpdateActionResponse *)self info];
  v3 = [v2 objectForSetting:4];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

@end