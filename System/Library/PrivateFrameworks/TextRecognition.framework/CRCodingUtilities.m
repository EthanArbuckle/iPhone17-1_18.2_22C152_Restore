@interface CRCodingUtilities
+ (BOOL)BOOLFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (CGPoint)pointFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (CGRect)rectFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (CGSize)sizeFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (_NSRange)rangeFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (double)cgFloatFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (float)floatFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (id)arrayFromEncodingData:(id)a3 offset:(unint64_t *)a4 objectProviderBlock:(id)a5;
+ (id)ddScannerResultFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (id)encodingDataForBool:(BOOL)a3;
+ (id)encodingDataForCGFloat:(double)a3;
+ (id)encodingDataForCodable:(id)a3;
+ (id)encodingDataForFloat:(float)a3;
+ (id)encodingDataForInteger:(int64_t)a3;
+ (id)encodingDataForPoint:(CGPoint)a3;
+ (id)encodingDataForRange:(_NSRange)a3;
+ (id)encodingDataForRect:(CGRect)a3;
+ (id)encodingDataForSize:(CGSize)a3;
+ (id)encodingDataForUInteger:(unint64_t)a3;
+ (id)objectDataFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (id)stringFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (int64_t)integerFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (unint64_t)unsignedIntegerFromEncodingData:(id)a3 offset:(unint64_t *)a4;
+ (void)appendBool:(BOOL)a3 toData:(id)a4;
+ (void)appendCGFloat:(double)a3 toData:(id)a4;
+ (void)appendCodable:(id)a3 toData:(id)a4;
+ (void)appendFloat:(float)a3 toData:(id)a4;
+ (void)appendInteger:(int64_t)a3 toData:(id)a4;
+ (void)appendPoint:(CGPoint)a3 toData:(id)a4;
+ (void)appendRange:(_NSRange)a3 toData:(id)a4;
+ (void)appendRect:(CGRect)a3 toData:(id)a4;
+ (void)appendSize:(CGSize)a3 toData:(id)a4;
+ (void)appendUInteger:(unint64_t)a3 toData:(id)a4;
@end

@implementation CRCodingUtilities

+ (void)appendCodable:(id)a3 toData:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [a1 appendBool:v8 == 0 toData:v6];
  if (v8)
  {
    v7 = [v8 crCodableDataRepresentation];
    objc_msgSend(a1, "appendUInteger:toData:", objc_msgSend(v7, "length"), v6);
    if (v7) {
      [v6 appendData:v7];
    }
  }
}

+ (void)appendBool:(BOOL)a3 toData:(id)a4
{
  BOOL v4 = a3;
  [a4 appendBytes:&v4 length:1];
}

+ (void)appendInteger:(int64_t)a3 toData:(id)a4
{
  int64_t v4 = a3;
  [a4 appendBytes:&v4 length:8];
}

+ (void)appendUInteger:(unint64_t)a3 toData:(id)a4
{
  unint64_t v4 = a3;
  [a4 appendBytes:&v4 length:8];
}

+ (void)appendFloat:(float)a3 toData:(id)a4
{
  float v4 = a3;
  [a4 appendBytes:&v4 length:4];
}

+ (void)appendCGFloat:(double)a3 toData:(id)a4
{
  double v4 = a3;
  [a4 appendBytes:&v4 length:8];
}

+ (void)appendPoint:(CGPoint)a3 toData:(id)a4
{
  CGPoint v5 = a3;
  id v4 = a4;
  [v4 appendBytes:&v5 length:8];
  objc_msgSend(v4, "appendBytes:length:", &v5.y, 8, *(void *)&v5.x);
}

+ (void)appendSize:(CGSize)a3 toData:(id)a4
{
  CGSize v5 = a3;
  id v4 = a4;
  [v4 appendBytes:&v5 length:8];
  objc_msgSend(v4, "appendBytes:length:", &v5.height, 8, *(void *)&v5.width);
}

+ (void)appendRect:(CGRect)a3 toData:(id)a4
{
  CGRect v5 = a3;
  id v4 = a4;
  [v4 appendBytes:&v5 length:8];
  objc_msgSend(v4, "appendBytes:length:", &v5.origin.y, 8, *(void *)&v5.origin.x);
  [v4 appendBytes:&v5.size length:8];
  [v4 appendBytes:&v5.size.height length:8];
}

+ (void)appendRange:(_NSRange)a3 toData:(id)a4
{
  _NSRange v5 = a3;
  id v4 = a4;
  [v4 appendBytes:&v5 length:8];
  objc_msgSend(v4, "appendBytes:length:", &v5.length, 8, v5.location);
}

+ (id)encodingDataForCodable:(id)a3
{
  id v4 = a3;
  _NSRange v5 = objc_opt_new();
  [a1 appendCodable:v4 toData:v5];

  return v5;
}

+ (id)encodingDataForBool:(BOOL)a3
{
  BOOL v5 = a3;
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:1];
  return v3;
}

+ (id)encodingDataForInteger:(int64_t)a3
{
  int64_t v5 = a3;
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:8];
  return v3;
}

+ (id)encodingDataForUInteger:(unint64_t)a3
{
  unint64_t v5 = a3;
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:8];
  return v3;
}

+ (id)encodingDataForFloat:(float)a3
{
  float v5 = a3;
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:4];
  return v3;
}

+ (id)encodingDataForCGFloat:(double)a3
{
  double v5 = a3;
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v5 length:8];
  return v3;
}

+ (id)encodingDataForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = objc_opt_new();
  objc_msgSend(a1, "appendPoint:toData:", v6, x, y);
  return v6;
}

+ (id)encodingDataForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_opt_new();
  objc_msgSend(a1, "appendSize:toData:", v6, width, height);
  return v6;
}

+ (id)encodingDataForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_opt_new();
  objc_msgSend(a1, "appendRect:toData:", v8, x, y, width, height);
  return v8;
}

+ (id)encodingDataForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_opt_new();
  objc_msgSend(a1, "appendRange:toData:", location, length, v6);
  return v6;
}

+ (id)objectDataFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6 = a3;
  if ([a1 BOOLFromEncodingData:v6 offset:a4])
  {
    v7 = 0;
  }
  else
  {
    uint64_t v8 = [a1 unsignedIntegerFromEncodingData:v6 offset:a4];
    unint64_t v9 = *a4;
    unint64_t v10 = [v6 length];
    self;
    v7 = 0;
    if (v9 <= ~v8 && v9 + v8 <= v10)
    {
      v7 = objc_msgSend(v6, "subdataWithRange:", v9, v8);
      *a4 += v8;
    }
  }

  return v7;
}

+ (BOOL)BOOLFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5 = a3;
  char v10 = 0;
  unint64_t v6 = *a4;
  unint64_t v7 = [v5 length];
  self;
  BOOL v8 = 0;
  if (v6 < v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v10, v6, 1);
    ++*a4;
    BOOL v8 = v10 != 0;
  }

  return v8;
}

+ (int64_t)integerFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5 = a3;
  int64_t v11 = 0;
  unint64_t v6 = *a4;
  unint64_t v7 = [v5 length];
  self;
  int64_t v8 = 0;
  if (v6 <= 0xFFFFFFFFFFFFFFF7 && v6 + 8 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 8);
    *a4 += 8;
    int64_t v8 = v11;
  }

  return v8;
}

+ (unint64_t)unsignedIntegerFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5 = a3;
  unint64_t v11 = 0;
  unint64_t v6 = *a4;
  unint64_t v7 = [v5 length];
  self;
  unint64_t v8 = 0;
  if (v6 <= 0xFFFFFFFFFFFFFFF7 && v6 + 8 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 8);
    *a4 += 8;
    unint64_t v8 = v11;
  }

  return v8;
}

+ (float)floatFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5 = a3;
  float v11 = 0.0;
  unint64_t v6 = *a4;
  unint64_t v7 = [v5 length];
  self;
  float v8 = 0.0;
  if (v6 <= 0xFFFFFFFFFFFFFFFBLL && v6 + 4 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 4);
    *a4 += 4;
    float v8 = v11;
  }

  return v8;
}

+ (double)cgFloatFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v5 = a3;
  double v11 = 0.0;
  unint64_t v6 = *a4;
  unint64_t v7 = [v5 length];
  self;
  double v8 = 0.0;
  if (v6 <= 0xFFFFFFFFFFFFFFF7 && v6 + 8 <= v7)
  {
    objc_msgSend(v5, "getBytes:range:", &v11, v6, 8);
    *a4 += 8;
    double v8 = v11;
  }

  return v8;
}

+ (CGPoint)pointFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6 = a3;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v8 = v7;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

+ (CGSize)sizeFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6 = a3;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v8 = v7;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

+ (CGRect)rectFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6 = a3;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v8 = v7;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v10 = v9;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v12 = v11;
  [a1 cgFloatFromEncodingData:v6 offset:a4];
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

+ (_NSRange)rangeFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 unsignedIntegerFromEncodingData:v6 offset:a4];
  uint64_t v8 = [a1 unsignedIntegerFromEncodingData:v6 offset:a4];

  NSUInteger v9 = v7;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

+ (id)ddScannerResultFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v4 = [a1 objectDataFromEncodingData:a3 offset:a4];
  id v5 = [MEMORY[0x1E4F5F150] ddScannerResultWithCRCodableDataRepresentation:v4];

  return v5;
}

+ (id)stringFromEncodingData:(id)a3 offset:(unint64_t *)a4
{
  id v4 = [a1 objectDataFromEncodingData:a3 offset:a4];
  id v5 = (void *)[[NSString alloc] initWithCRCodableDataRepresentation:v4];

  return v5;
}

+ (id)arrayFromEncodingData:(id)a3 offset:(unint64_t *)a4 objectProviderBlock:(id)a5
{
  id v8 = a5;
  NSUInteger v9 = [a1 objectDataFromEncodingData:a3 offset:a4];
  NSUInteger v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithCRCodableDataRepresentation:v9 objectProviderBlock:v8];

  return v10;
}

@end