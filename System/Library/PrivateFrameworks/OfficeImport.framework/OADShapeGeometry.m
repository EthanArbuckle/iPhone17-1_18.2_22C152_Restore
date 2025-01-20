@interface OADShapeGeometry
- (BOOL)hasAdjustValueAtIndex:(unsigned int)a3;
- (BOOL)isEscher;
- (OADShapeGeometry)init;
- (id)adjustValues;
- (id)description;
- (id)equivalentCustomGeometry;
- (int)adjustValueAtIndex:(unsigned int)a3;
- (int)type;
- (unint64_t)adjustValueCount;
- (void)setAdjustValue:(int)a3 atIndex:(unsigned int)a4;
- (void)setIsEscher:(BOOL)a3;
@end

@implementation OADShapeGeometry

- (OADShapeGeometry)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADShapeGeometry;
  v2 = [(OADShapeGeometry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mAdjustValues = v2->mAdjustValues;
    v2->mAdjustValues = v3;
  }
  return v2;
}

- (void)setIsEscher:(BOOL)a3
{
  self->mIsEscher = a3;
}

- (id)adjustValues
{
  return self->mAdjustValues;
}

- (void)setAdjustValue:(int)a3 atIndex:(unsigned int)a4
{
  id v7 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  objc_super v6 = (void *)[objc_alloc(NSNumber) initWithLong:a3];
  [(NSMutableDictionary *)self->mAdjustValues setObject:v6 forKey:v7];
}

- (BOOL)isEscher
{
  return self->mIsEscher;
}

- (int)adjustValueAtIndex:(unsigned int)a3
{
  v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)self->mAdjustValues objectForKey:v4];
  objc_super v6 = v5;
  if (v5) {
    int v7 = [v5 longValue];
  }
  else {
    int v7 = 0;
  }

  return v7;
}

- (int)type
{
  v2 = [NSString stringWithUTF8String:"-[OADShapeGeometry type]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADShapeGeometry.mm"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 23, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_super v6 = (void *)MEMORY[0x263EFF940];
  int v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"Abstract method not overridden by %@: %s", v9, "-[OADShapeGeometry type]"];
  id v11 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (id)equivalentCustomGeometry
{
  v2 = [NSString stringWithUTF8String:"-[OADShapeGeometry equivalentCustomGeometry]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADShapeGeometry.mm"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 28, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_super v6 = (void *)MEMORY[0x263EFF940];
  int v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"Abstract method not overridden by %@: %s", v9, "-[OADShapeGeometry equivalentCustomGeometry]"];
  id v11 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (BOOL)hasAdjustValueAtIndex:(unsigned int)a3
{
  v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)self->mAdjustValues objectForKey:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (unint64_t)adjustValueCount
{
  return [(NSMutableDictionary *)self->mAdjustValues count];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADShapeGeometry;
  v2 = [(OADShapeGeometry *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end