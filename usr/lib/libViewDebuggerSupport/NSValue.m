@interface NSValue
- (id)debugHierarchyValueForObjCType_CATransform3D;
- (id)debugHierarchyValueForObjCType_CGAffineTransform;
- (id)debugHierarchyValueForObjCType_CGPoint;
- (id)debugHierarchyValueForObjCType_CGRect;
- (id)debugHierarchyValueForObjCType_CGSize;
- (id)debugHierarchyValueForObjCType_CGVector;
- (id)debugHierarchyValueForObjCType_NSDirectionalEdgeInsets;
- (id)debugHierarchyValueForObjCType_UIEdgeInsets;
- (id)debugHierarchyValueForObjCType_UIOffset;
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation NSValue

- (id)debugHierarchyValueForObjCType_CGVector
{
  [(NSValue *)self CGVectorValue];
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  v4 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  *v4 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0, v4, 2, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);

  return v5;
}

- (id)debugHierarchyValueForObjCType_CGAffineTransform
{
  [(NSValue *)self CGAffineTransformValue];
  uint64_t v2 = +[NSNumber numberWithDouble:0.0];
  v10[0] = v2;
  uint64_t v3 = +[NSNumber numberWithDouble:0.0];
  v10[1] = v3;
  v4 = +[NSNumber numberWithDouble:0.0];
  v10[2] = v4;
  CFArrayRef v5 = +[NSNumber numberWithDouble:0.0];
  v10[3] = v5;
  v6 = +[NSNumber numberWithDouble:0.0];
  v10[4] = v6;
  v7 = +[NSNumber numberWithDouble:0.0];
  v10[5] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v10 count:6];

  return v8;
}

- (id)debugHierarchyValueForObjCType_UIEdgeInsets
{
  [(NSValue *)self UIEdgeInsetsValue];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[0] = v8;
  v9 = +[NSNumber numberWithDouble:v3];
  v14[1] = v9;
  v10 = +[NSNumber numberWithDouble:v5];
  v14[2] = v10;
  v11 = +[NSNumber numberWithDouble:v7];
  v14[3] = v11;
  v12 = +[NSArray arrayWithObjects:v14 count:4];

  return v12;
}

- (id)debugHierarchyValueForObjCType_NSDirectionalEdgeInsets
{
  [(NSValue *)self directionalEdgeInsetsValue];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[0] = v8;
  v9 = +[NSNumber numberWithDouble:v3];
  v14[1] = v9;
  v10 = +[NSNumber numberWithDouble:v5];
  v14[2] = v10;
  v11 = +[NSNumber numberWithDouble:v7];
  v14[3] = v11;
  v12 = +[NSArray arrayWithObjects:v14 count:4];

  return v12;
}

- (id)debugHierarchyValueForObjCType_UIOffset
{
  [(NSValue *)self UIOffsetValue];
  double v3 = v2;
  double v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v8[0] = v4;
  double v5 = +[NSNumber numberWithDouble:v3];
  v8[1] = v5;
  double v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = self;
  }
  else
  {
    double v6 = self;
    double v7 = +[NSString stringWithCString:[(NSValue *)v6 objCType] encoding:4];
    uint64_t v8 = (char *)[v7 rangeOfString:@"="];
    if ([v7 hasPrefix:@"{"]) {
      BOOL v9 = v8 == (char *)0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      uint64_t v10 = [v7 substringWithRange:1, v8 - 1];

      double v7 = (void *)v10;
    }
    v11 = [@"debugHierarchyValueForObjCType_" stringByAppendingString:v7];
    SEL v12 = NSSelectorFromString(v11);
    if (objc_opt_respondsToSelector())
    {
      a4 = [(NSValue *)v6 performSelector:v12];
    }
    else if (a4)
    {
      v13 = +[NSString stringWithFormat:@"Unable to provide DebugHierarchy value for NSValue (%@). Dynamic method look up failed for: -%@.", v7, v11];
      if (v6)
      {
        v14 = +[NSString stringWithFormat:@"%@", v6];
      }
      else
      {
        v14 = &stru_3C770;
      }
      if (v13) {
        v15 = v13;
      }
      else {
        v15 = &stru_3C770;
      }
      v21[0] = @"propertyName";
      v21[1] = @"objectDescription";
      v22[0] = &stru_3C770;
      v22[1] = v14;
      v21[2] = @"errorDescription";
      v22[2] = v15;
      v16 = v15;
      v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
      v18 = +[NSError errorWithDomain:@"DebugHierarchyErrorDomain" code:101 userInfo:v17];

      id v19 = v18;
      *a4 = v19;

      a4 = 0;
    }
  }

  return a4;
}

- (id)debugHierarchyValueForObjCType_CGPoint
{
  [(NSValue *)self CGPointValue];
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  double v4 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  void *v4 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0, v4, 2, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);

  return v5;
}

- (id)debugHierarchyValueForObjCType_CGSize
{
  [(NSValue *)self CGSizeValue];
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  double v4 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
  void *v4 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0, v4, 2, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);

  return v5;
}

- (id)debugHierarchyValueForObjCType_CGRect
{
  [(NSValue *)self CGRectValue];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  double v6 = (const void **)malloc_type_malloc(0x20uLL, 0x6004044C4A2DFuLL);
  for (uint64_t i = 0; i != 4; ++i)
    v6[i] = CFNumberCreate(0, kCFNumberCGFloatType, &v11[i]);
  CFArrayRef v8 = CFArrayCreate(0, v6, 4, &kCFTypeArrayCallBacks);
  for (uint64_t j = 0; j != 4; ++j)
    CFRelease(v6[j]);
  free(v6);

  return v8;
}

- (id)debugHierarchyValueForObjCType_CATransform3D
{
  [(NSValue *)self CATransform3DValue];
  id v19 = +[NSNumber numberWithDouble:v20];
  v36[0] = v19;
  v18 = +[NSNumber numberWithDouble:v21];
  v36[1] = v18;
  v17 = +[NSNumber numberWithDouble:v22];
  v36[2] = v17;
  v16 = +[NSNumber numberWithDouble:v23];
  v36[3] = v16;
  v15 = +[NSNumber numberWithDouble:v24];
  v36[4] = v15;
  v14 = +[NSNumber numberWithDouble:v25];
  v36[5] = v14;
  v13 = +[NSNumber numberWithDouble:v26];
  v36[6] = v13;
  uint64_t v2 = +[NSNumber numberWithDouble:v27];
  v36[7] = v2;
  uint64_t v3 = +[NSNumber numberWithDouble:v28];
  v36[8] = v3;
  uint64_t v4 = +[NSNumber numberWithDouble:v29];
  v36[9] = v4;
  uint64_t v5 = +[NSNumber numberWithDouble:v30];
  v36[10] = v5;
  double v6 = +[NSNumber numberWithDouble:v31];
  v36[11] = v6;
  double v7 = +[NSNumber numberWithDouble:v32];
  v36[12] = v7;
  CFArrayRef v8 = +[NSNumber numberWithDouble:v33];
  v36[13] = v8;
  BOOL v9 = +[NSNumber numberWithDouble:v34];
  v36[14] = v9;
  uint64_t v10 = +[NSNumber numberWithDouble:v35];
  v36[15] = v10;
  v11 = +[NSArray arrayWithObjects:v36 count:16];

  return v11;
}

@end