@interface NSCoder(PKPath)
- (double)decodeCGPointForKey:()PKPath;
- (double)decodeCGSizeForKey:()PKPath;
- (double)decodeCGVectorForKey:()PKPath;
- (void)encodeCGPoint:()PKPath forKey:;
- (void)encodeCGSize:()PKPath forKey:;
- (void)encodeCGVector:()PKPath forKey:;
@end

@implementation NSCoder(PKPath)

- (void)encodeCGPoint:()PKPath forKey:
{
  id v9 = a5;
  v8 = [NSString stringWithFormat:@"{%g, %g}", *(void *)&a2, *(void *)&a3];
  [a1 encodeObject:v8 forKey:v9];
}

- (void)encodeCGVector:()PKPath forKey:
{
  id v9 = a5;
  v8 = [NSString stringWithFormat:@"{%g, %g}", *(void *)&a2, *(void *)&a3];
  [a1 encodeObject:v8 forKey:v9];
}

- (void)encodeCGSize:()PKPath forKey:
{
  id v9 = a5;
  v8 = [NSString stringWithFormat:@"{%g, %g}", *(void *)&a2, *(void *)&a3];
  [a1 encodeObject:v8 forKey:v9];
}

- (double)decodeCGPointForKey:()PKPath
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  v6 = v5;
  if (v5) {
    double v7 = PKCGPointFromString(v5);
  }
  else {
    double v7 = *MEMORY[0x263F00148];
  }

  return v7;
}

- (double)decodeCGVectorForKey:()PKPath
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  v6 = v5;
  if (v5)
  {
    double v7 = v5;
    if ((unint64_t)[(__CFString *)v7 length] < 5)
    {
      double DoubleValue = 0.0;
    }
    else
    {
      CFStringRef v12 = 0;
      CFStringRef str = 0;
      double DoubleValue = 0.0;
      if (PKSplitBracesAndComma(v7, &str, &v12))
      {
        CFStringRef v9 = str;
        double DoubleValue = CFStringGetDoubleValue(str);
        CFStringRef v10 = v12;
        CFStringGetDoubleValue(v12);
        CFRelease(v9);
        CFRelease(v10);
      }
    }
  }
  else
  {
    double DoubleValue = 0.0;
  }

  return DoubleValue;
}

- (double)decodeCGSizeForKey:()PKPath
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  v6 = v5;
  if (v5)
  {
    double v7 = v5;
    double DoubleValue = *MEMORY[0x263F001B0];
    if ((unint64_t)[(__CFString *)v7 length] >= 5)
    {
      CFStringRef v12 = 0;
      CFStringRef str = 0;
      if (PKSplitBracesAndComma(v7, &str, &v12))
      {
        CFStringRef v9 = str;
        double DoubleValue = CFStringGetDoubleValue(str);
        CFStringRef v10 = v12;
        CFStringGetDoubleValue(v12);
        CFRelease(v9);
        CFRelease(v10);
      }
    }
  }
  else
  {
    double DoubleValue = *MEMORY[0x263F001B0];
  }

  return DoubleValue;
}

@end