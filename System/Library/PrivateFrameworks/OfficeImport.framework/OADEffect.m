@interface OADEffect
- (BOOL)isEqual:(id)a3;
- (OADEffect)initWithType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)type;
- (unint64_t)hash;
@end

@implementation OADEffect

- (OADEffect)initWithType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADEffect;
  result = [(OADEffect *)&v5 init];
  if (result) {
    result->mType = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->mType == v4[2];

  return v6;
}

- (int)type
{
  return self->mType;
}

- (unint64_t)hash
{
  return self->mType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = [NSString stringWithUTF8String:"-[OADEffect copyWithZone:]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADEffect.mm"];
  uint64_t v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  +[OITSUAssertionHandler handleFailureInFunction:v3, v4, 27, 0, "Abstract method not overridden by %@", v6 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v7 = (void *)MEMORY[0x263EFF940];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"Abstract method not overridden by %@: %s", v10, "-[OADEffect copyWithZone:]"];
  id v12 = [v7 exceptionWithName:*MEMORY[0x263EFF498] reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADEffect;
  v2 = [(OADEffect *)&v4 description];
  return v2;
}

@end