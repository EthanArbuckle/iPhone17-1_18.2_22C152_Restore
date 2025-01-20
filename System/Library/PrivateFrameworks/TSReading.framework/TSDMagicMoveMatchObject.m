@interface TSDMagicMoveMatchObject
+ (id)matchObjectWithRep:(id)a3 position:(CGPoint)a4;
+ (id)matchObjectWithTextRep:(id)a3 position:(CGPoint)a4 stringValue:(id)a5 stringRange:(_NSRange)a6;
- (BOOL)conflictsWithMatchObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)position;
- (NSMutableDictionary)attributes;
- (NSString)name;
- (NSString)stringValue;
- (TSDMagicMoveMatchObject)init;
- (TSDMagicMoveMatchObject)initWithRep:(id)a3 position:(CGPoint)a4 stringValue:(id)a5 stringRange:(_NSRange)a6;
- (TSDRep)rep;
- (_NSRange)stringRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)zOrder;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAttributes:(id)a3;
- (void)setName:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRep:(id)a3;
- (void)setStringRange:(_NSRange)a3;
- (void)setStringValue:(id)a3;
- (void)setZOrder:(int64_t)a3;
@end

@implementation TSDMagicMoveMatchObject

- (TSDMagicMoveMatchObject)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDMagicMoveMatchObject init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 621, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSDMagicMoveMatchObject init]"), 0 reason userInfo]);
}

- (TSDMagicMoveMatchObject)initWithRep:(id)a3 position:(CGPoint)a4 stringValue:(id)a5 stringRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  double y = a4.y;
  double x = a4.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDMagicMoveMatchObject;
  v12 = [(TSDMagicMoveMatchObject *)&v17 init];
  v13 = v12;
  if (v12)
  {
    [(TSDMagicMoveMatchObject *)v12 setRep:a3];
    -[TSDMagicMoveMatchObject setPosition:](v13, "setPosition:", x, y);
    [(TSDMagicMoveMatchObject *)v13 setStringValue:a5];
    -[TSDMagicMoveMatchObject setStringRange:](v13, "setStringRange:", location, length);
    -[TSDMagicMoveMatchObject setZOrder:](v13, "setZOrder:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "canvas"), "allRepsOrdered"), "indexOfObject:", a3));
    if ([(TSDMagicMoveMatchObject *)v13 zOrder] >= 10000)
    {
      v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"-[TSDMagicMoveMatchObject initWithRep:position:stringValue:stringRange:]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 634, @"zOrder is too large (%ld > 10000)", -[TSDMagicMoveMatchObject zOrder](v13, "zOrder"));
    }
  }
  return v13;
}

+ (id)matchObjectWithRep:(id)a3 position:(CGPoint)a4
{
  return +[TSDMagicMoveMatchObject matchObjectWithTextRep:position:stringValue:stringRange:](TSDMagicMoveMatchObject, "matchObjectWithTextRep:position:stringValue:stringRange:", a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0, a4.x, a4.y);
}

+ (id)matchObjectWithTextRep:(id)a3 position:(CGPoint)a4 stringValue:(id)a5 stringRange:(_NSRange)a6
{
  v6 = -[TSDMagicMoveMatchObject initWithRep:position:stringValue:stringRange:]([TSDMagicMoveMatchObject alloc], "initWithRep:position:stringValue:stringRange:", a3, a5, a6.location, a6.length, a4.x, a4.y);

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveMatchObject;
  [(TSDMagicMoveMatchObject *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TSDMagicMoveMatchObject alloc];
  v5 = [(TSDMagicMoveMatchObject *)self rep];
  [(TSDMagicMoveMatchObject *)self position];
  double v7 = v6;
  double v9 = v8;
  v10 = [(TSDMagicMoveMatchObject *)self stringValue];
  uint64_t v11 = [(TSDMagicMoveMatchObject *)self stringRange];
  v13 = -[TSDMagicMoveMatchObject initWithRep:position:stringValue:stringRange:](v4, "initWithRep:position:stringValue:stringRange:", v5, v10, v11, v12, v7, v9);
  [(TSDMagicMoveMatchObject *)v13 setAttributes:[(TSDMagicMoveMatchObject *)self attributes]];
  [(TSDMagicMoveMatchObject *)v13 setName:[(TSDMagicMoveMatchObject *)self name]];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v5 = objc_opt_class();
  LODWORD(v6) = [v5 isEqual:objc_opt_class()];
  if (v6)
  {
    double v7 = [(TSDMagicMoveMatchObject *)self rep];
    if (v7 != (TSDRep *)[a3 rep])
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    if (!-[TSDMagicMoveMatchObject stringValue](self, "stringValue") || (uint64_t v6 = [a3 stringValue]) != 0)
    {
      if (!-[TSDMagicMoveMatchObject stringValue](self, "stringValue") && [a3 stringValue]) {
        goto LABEL_3;
      }
      if (![(TSDMagicMoveMatchObject *)self stringValue]
        || ![a3 stringValue]
        || (LODWORD(v6) = -[NSString isEqual:](-[TSDMagicMoveMatchObject stringValue](self, "stringValue"), "isEqual:", [a3 stringValue]), v6))
      {
        uint64_t v8 = [(TSDMagicMoveMatchObject *)self stringRange];
        uint64_t v10 = v9;
        LOBYTE(v6) = v8 == [a3 stringRange] && v10 == v11;
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TSDRep *)[(TSDMagicMoveMatchObject *)self rep] hash];
  NSUInteger v4 = [(NSString *)[(TSDMagicMoveMatchObject *)self stringValue] hash] + v3;
  NSUInteger v5 = v4 + 10000 * [(TSDMagicMoveMatchObject *)self stringRange];
  [(TSDMagicMoveMatchObject *)self stringRange];
  return v5 + 1000000 * v6;
}

- (id)description
{
  if ([(TSDMagicMoveMatchObject *)self name])
  {
    uint64_t v3 = [(TSDMagicMoveMatchObject *)self name];
  }
  else
  {
    NSUInteger v4 = [(TSDMagicMoveMatchObject *)self stringValue];
    NSUInteger v5 = NSString;
    [(TSDMagicMoveMatchObject *)self rep];
    uint64_t v6 = [(id)objc_opt_class() description];
    double v7 = [(TSDMagicMoveMatchObject *)self rep];
    if (v4)
    {
      uint64_t v8 = [(TSDMagicMoveMatchObject *)self stringValue];
      v14.NSUInteger location = [(TSDMagicMoveMatchObject *)self stringRange];
      uint64_t v9 = NSStringFromRange(v14);
      [(TSDMagicMoveMatchObject *)self position];
      uint64_t v3 = (NSString *)[v5 stringWithFormat:@"<%@: %p> (\"%@\"", v6, v7, v8, v9, NSStringFromCGPoint(v15)];
    }
    else
    {
      [(TSDMagicMoveMatchObject *)self position];
      uint64_t v3 = (NSString *)[v5 stringWithFormat:@"<%@: %p> @ %@", v6, v7, NSStringFromCGPoint(v16), v11, v12];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDMagicMoveMatchObject;
  return (id)[NSString stringWithFormat:@"%@: %@", -[TSDMagicMoveMatchObject description](&v13, sel_description), v3];
}

- (BOOL)conflictsWithMatchObject:(id)a3
{
  NSUInteger v5 = [(TSDMagicMoveMatchObject *)self rep];
  if (v5 != (TSDRep *)[a3 rep]) {
    return 0;
  }
  if (!-[TSDMagicMoveMatchObject stringValue](self, "stringValue") || ![a3 stringValue]) {
    return 1;
  }
  NSUInteger v7 = [(TSDMagicMoveMatchObject *)self stringRange];
  NSUInteger v9 = v8;
  v12.NSUInteger location = [a3 stringRange];
  v12.NSUInteger length = v10;
  v11.NSUInteger location = v7;
  v11.NSUInteger length = v9;
  return NSIntersectionRange(v11, v12).length != 0;
}

- (TSDRep)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (int64_t)zOrder
{
  return self->_zOrder;
}

- (void)setZOrder:(int64_t)a3
{
  self->_zOrder = a3;
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (_NSRange)stringRange
{
  NSUInteger length = self->_stringRange.length;
  NSUInteger location = self->_stringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStringRange:(_NSRange)a3
{
  self->_stringRange = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end