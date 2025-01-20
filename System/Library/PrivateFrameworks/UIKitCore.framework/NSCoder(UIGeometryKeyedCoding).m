@interface NSCoder(UIGeometryKeyedCoding)
- (double)decodeCGPointForKey:()UIGeometryKeyedCoding;
- (double)decodeCGRectForKey:()UIGeometryKeyedCoding;
- (double)decodeCGSizeForKey:()UIGeometryKeyedCoding;
- (double)decodeCGVectorForKey:()UIGeometryKeyedCoding;
- (double)decodeDirectionalEdgeInsetsForKey:()UIGeometryKeyedCoding;
- (double)decodeUIEdgeInsetsForKey:()UIGeometryKeyedCoding;
- (double)decodeUIOffsetForKey:()UIGeometryKeyedCoding;
- (void)decodeCGAffineTransformForKey:()UIGeometryKeyedCoding;
- (void)encodeCGAffineTransform:()UIGeometryKeyedCoding forKey:;
- (void)encodeCGPoint:()UIGeometryKeyedCoding forKey:;
- (void)encodeCGRect:()UIGeometryKeyedCoding forKey:;
- (void)encodeCGSize:()UIGeometryKeyedCoding forKey:;
- (void)encodeCGVector:()UIGeometryKeyedCoding forKey:;
- (void)encodeDirectionalEdgeInsets:()UIGeometryKeyedCoding forKey:;
- (void)encodeUIEdgeInsets:()UIGeometryKeyedCoding forKey:;
- (void)encodeUIOffset:()UIGeometryKeyedCoding forKey:;
@end

@implementation NSCoder(UIGeometryKeyedCoding)

- (double)decodeDirectionalEdgeInsetsForKey:()UIGeometryKeyedCoding
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    *(void *)&double v6 = (unint64_t)NSDirectionalEdgeInsetsFromString(v5);
  }
  else {
    double v6 = 0.0;
  }

  return v6;
}

- (void)encodeCGRect:()UIGeometryKeyedCoding forKey:
{
  id v12 = a7;
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  NSStringFromCGRect(v15);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v13 forKey:v12];
}

- (void)encodeCGSize:()UIGeometryKeyedCoding forKey:
{
  id v8 = a5;
  v11.width = a2;
  v11.height = a3;
  NSStringFromCGSize(v11);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v9 forKey:v8];
}

- (double)decodeUIEdgeInsetsForKey:()UIGeometryKeyedCoding
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    *(void *)&double v6 = (unint64_t)UIEdgeInsetsFromString(v5);
  }
  else {
    double v6 = 0.0;
  }

  return v6;
}

- (void)encodeCGPoint:()UIGeometryKeyedCoding forKey:
{
  id v8 = a5;
  v11.x = a2;
  v11.y = a3;
  NSStringFromCGPoint(v11);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v9 forKey:v8];
}

- (void)encodeCGVector:()UIGeometryKeyedCoding forKey:
{
  id v8 = a5;
  v11.dx = a2;
  v11.dy = a3;
  NSStringFromCGVector(v11);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v9 forKey:v8];
}

- (void)encodeCGAffineTransform:()UIGeometryKeyedCoding forKey:
{
  long long v5 = a3[1];
  *(_OWORD *)&transform.a = *a3;
  *(_OWORD *)&transform.c = v5;
  *(_OWORD *)&transform.tx = a3[2];
  id v6 = a4;
  NSStringFromCGAffineTransform(&transform);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v7 forKey:v6];
}

- (void)encodeUIEdgeInsets:()UIGeometryKeyedCoding forKey:
{
  id v12 = a7;
  v15.top = a2;
  v15.left = a3;
  v15.bottom = a4;
  v15.right = a5;
  NSStringFromUIEdgeInsets(v15);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v13 forKey:v12];
}

- (void)encodeDirectionalEdgeInsets:()UIGeometryKeyedCoding forKey:
{
  id v12 = a7;
  v15.top = a2;
  v15.leading = a3;
  v15.bottom = a4;
  v15.trailing = a5;
  NSStringFromDirectionalEdgeInsets(v15);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v13 forKey:v12];
}

- (void)encodeUIOffset:()UIGeometryKeyedCoding forKey:
{
  id v8 = a5;
  v11.horizontal = a2;
  v11.vertical = a3;
  NSStringFromUIOffset(v11);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [a1 encodeObject:v9 forKey:v8];
}

- (double)decodeCGPointForKey:()UIGeometryKeyedCoding
{
  id v4 = a3;
  long long v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    *(void *)&double v6 = *(_OWORD *)&CGPointFromString(v5);
  }
  else {
    double v6 = *MEMORY[0x1E4F1DAD8];
  }

  return v6;
}

- (double)decodeCGVectorForKey:()UIGeometryKeyedCoding
{
  id v4 = a3;
  long long v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    *(void *)&double v6 = *(_OWORD *)&CGVectorFromString(v5);
  }
  else {
    double v6 = 0.0;
  }

  return v6;
}

- (double)decodeCGSizeForKey:()UIGeometryKeyedCoding
{
  id v4 = a3;
  long long v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    *(void *)&double v6 = *(_OWORD *)&CGSizeFromString(v5);
  }
  else {
    double v6 = *MEMORY[0x1E4F1DB30];
  }

  return v6;
}

- (double)decodeCGRectForKey:()UIGeometryKeyedCoding
{
  id v4 = a3;
  long long v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    *(void *)&double v6 = (unint64_t)CGRectFromString(v5);
  }
  else {
    double v6 = *MEMORY[0x1E4F1DB28];
  }

  return v6;
}

- (void)decodeCGAffineTransformForKey:()UIGeometryKeyedCoding
{
  id v5 = a2;
  string = [a1 decodeObjectOfClass:objc_opt_class() forKey:v5];

  double v6 = string;
  if (string)
  {
    CGAffineTransformFromString((CGAffineTransform *)a3, string);
    double v6 = string;
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(a3 + 16) = v8;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v7 + 32);
  }
}

- (double)decodeUIOffsetForKey:()UIGeometryKeyedCoding
{
  id v4 = a3;
  id v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  if (v5) {
    *(void *)&double v6 = *(_OWORD *)&UIOffsetFromString(v5);
  }
  else {
    double v6 = 0.0;
  }

  return v6;
}

@end