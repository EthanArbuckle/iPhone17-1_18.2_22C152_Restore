@interface CRLSmartStroke
+ (CRLSmartStroke)strokeWithName:(id)a3 color:(id)a4 width:(double)a5;
+ (Class)classForName:(id)a3;
- (BOOL)canApplyDirectlyToRepRenderable;
- (BOOL)canDrawWithOtherStroke:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAntialiasDefeat;
- (CRLSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8;
- (CRLSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8 miterLimit:(double)a9;
- (NSString)strokeName;
- (double)deprecatedPatternOffsetDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)i_setDeprecatedPatternOffsetDistance:(double)a3;
- (void)i_setStrokeName:(id)a3;
@end

@implementation CRLSmartStroke

- (NSString)strokeName
{
  return self->mStrokeName;
}

- (void)i_setStrokeName:(id)a3
{
}

- (void)i_setDeprecatedPatternOffsetDistance:(double)a3
{
  self->mDeprecatedPatternOffsetDistance = a3;
}

+ (Class)classForName:(id)a3
{
  id v3 = a3;
  v16[0] = @"Chalk2";
  v16[1] = @"Dry Brush";
  v16[2] = @"Feathered Brush";
  v16[3] = @"Pen";
  v16[4] = @"Pencil";
  v16[5] = @"Crayon";
  v4 = +[NSArray arrayWithObjects:v16 count:6];
  unsigned __int8 v5 = [v4 containsObject:v3];

  if ((v5 & 1) == 0)
  {
    CFStringRef v15 = @"Calligraphy";
    v6 = +[NSArray arrayWithObjects:&v15 count:1];
    unsigned __int8 v7 = [v6 containsObject:v3];

    if ((v7 & 1) == 0)
    {
      int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2988);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108C44C((uint64_t)v3, v8, v9);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E29A8);
      }
      v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSmartStroke classForName:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v11, v12, 64, 0, "Unable to find Smart Stroke class for name: %@", v3 file lineNumber isFatal description];
    }
  }
  v13 = objc_opt_class();

  return (Class)v13;
}

+ (CRLSmartStroke)strokeWithName:(id)a3 color:(id)a4 width:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc((Class)objc_opt_class());
  v10 = +[CRLStrokePattern solidPattern];
  id v11 = [v9 initWithName:v7 color:v8 width:0 cap:0 join:v10 pattern:a5 miterLimit:4.0];

  return (CRLSmartStroke *)v11;
}

- (CRLSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8 miterLimit:(double)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CRLSmartStroke;
  v19 = [(CRLStroke *)&v23 initWithColor:v17 width:a6 cap:a7 join:v18 pattern:a5 miterLimit:a9];
  if (v19)
  {
    v20 = (NSString *)[v16 copy];
    mStrokeName = v19->mStrokeName;
    v19->mStrokeName = v20;
  }
  return v19;
}

- (CRLSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8
{
  return [(CRLSmartStroke *)self initWithName:a3 color:a4 width:a6 cap:a7 join:a8 pattern:a5 miterLimit:4.0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E29C8);
  }
  unsigned __int8 v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    CFStringRef v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 67110402;
    unsigned int v17 = v4;
    __int16 v18 = 2082;
    v19 = "-[CRLSmartStroke copyWithZone:]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm";
    __int16 v22 = 1024;
    int v23 = 103;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@ is an abstract superclass. Subclasses must inherit %@", buf, 0x36u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E29E8);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSmartStroke copyWithZone:]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm"];
  id v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  id v11 = NSStringFromSelector(a2);
  +[CRLAssertionHandler handleFailureInFunction:v7, v8, 103, 0, "%@ is an abstract superclass. Subclasses must inherit %@", v10, v11 file lineNumber isFatal description];

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E2A08);
  }
  unsigned __int8 v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    CFStringRef v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 67110402;
    unsigned int v17 = v4;
    __int16 v18 = 2082;
    v19 = "-[CRLSmartStroke mutableCopyWithZone:]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm";
    __int16 v22 = 1024;
    int v23 = 108;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@ is an abstract superclass. Subclasses must inherit %@", buf, 0x36u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E2A28);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSmartStroke mutableCopyWithZone:]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm"];
  id v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  id v11 = NSStringFromSelector(a2);
  +[CRLAssertionHandler handleFailureInFunction:v7, v8, 108, 0, "%@ is an abstract superclass. Subclasses must inherit %@", v10, v11 file lineNumber isFatal description];

  return 0;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  return ![(CRLStroke *)self shouldRender];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);
  id v7 = v6;
  if (v6
    && ([v6 strokeName],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(CRLSmartStroke *)self strokeName],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLSmartStroke;
    BOOL v11 = [(CRLStroke *)&v13 isEqual:v7];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)canDrawWithOtherStroke:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);
  if (v6) {
    BOOL v7 = [(CRLSmartStroke *)self isEqual:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)CRLSmartStroke;
  unint64_t v3 = [(CRLStroke *)&v5 hash];
  return [(NSString *)self->mStrokeName hash] ^ v3;
}

- (BOOL)shouldAntialiasDefeat
{
  return 0;
}

- (double)deprecatedPatternOffsetDistance
{
  return self->mDeprecatedPatternOffsetDistance;
}

- (void).cxx_destruct
{
}

@end