@interface TSDTextPosition
+ (id)textPositionWithCharIndex:(unint64_t)a3;
+ (id)textPositionWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6;
- (BOOL)endOfLineAffinity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredStart;
- (TSDTextPosition)initWithCharIndex:(unint64_t)a3;
- (TSDTextPosition)initWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6;
- (float)preferredPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (int)distanceFromPosition:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)charIndex;
@end

@implementation TSDTextPosition

+ (id)textPositionWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = a5;
  v12 = (void *)[v10 initWithCharIndex:a3 eolAffinity:v8 preferredPosition:v6 isPreferredStart:v11];

  return v12;
}

+ (id)textPositionWithCharIndex:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCharIndex:a3];

  return v3;
}

- (TSDTextPosition)initWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)TSDTextPosition;
  result = [(TSDTextPosition *)&v11 init];
  if (result)
  {
    result->_charIndex = a3;
    result->_eolAffinity = a4;
    result->_preferredPosition = a5;
    result->_isPreferredStart = a6;
  }
  return result;
}

- (TSDTextPosition)initWithCharIndex:(unint64_t)a3
{
  LODWORD(v3) = 2143289344;
  return [(TSDTextPosition *)self initWithCharIndex:a3 eolAffinity:0 preferredPosition:1 isPreferredStart:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t charIndex = self->_charIndex;
  BOOL eolAffinity = self->_eolAffinity;
  *(float *)&double v7 = self->_preferredPosition;
  BOOL isPreferredStart = self->_isPreferredStart;

  return (id)[v4 initWithCharIndex:charIndex eolAffinity:eolAffinity preferredPosition:isPreferredStart isPreferredStart:v7];
}

- (int64_t)compare:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDTextPosition compare:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextPosition.m"), 66, @"bad text position");
  }
  unint64_t v7 = [v4 charIndex];
  unint64_t charIndex = self->_charIndex;
  if (charIndex == v7)
  {
    int eolAffinity = self->_eolAffinity;
    if (eolAffinity == [v4 endOfLineAffinity])
    {
      return 0;
    }
    else if (self->_eolAffinity)
    {
      return 1;
    }
    else
    {
      return -1;
    }
  }
  else if (charIndex > v7)
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4) {
    LOBYTE(v4) = self->_charIndex == *(void *)(v4 + 8) && self->_eolAffinity == *(unsigned __int8 *)(v4 + 16);
  }
  return v4;
}

- (int)distanceFromPosition:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDTextPosition distanceFromPosition:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextPosition.m"), 107, @"bad text position");
  }
  int charIndex = self->_charIndex;
  return charIndex - [v4 charIndex];
}

- (unint64_t)charIndex
{
  return self->_charIndex;
}

- (BOOL)endOfLineAffinity
{
  return self->_eolAffinity;
}

- (float)preferredPosition
{
  return self->_preferredPosition;
}

- (BOOL)isPreferredStart
{
  return self->_isPreferredStart;
}

@end