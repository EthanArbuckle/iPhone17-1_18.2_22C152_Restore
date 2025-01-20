@interface BookTextPosition
+ (id)textPositionWithCharIndex:(unint64_t)a3;
+ (id)textPositionWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6;
- (BOOL)endOfLineAffinity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredStart;
- (BookTextPosition)initWithCharIndex:(unint64_t)a3;
- (BookTextPosition)initWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6;
- (float)preferredPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (int)distanceFromPosition:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)charIndex;
@end

@implementation BookTextPosition

+ (id)textPositionWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = objc_alloc((Class)a1);
  *(float *)&double v11 = a5;
  id v12 = [v10 initWithCharIndex:a3 eolAffinity:v8 preferredPosition:v6 isPreferredStart:v11];

  return v12;
}

+ (id)textPositionWithCharIndex:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCharIndex:a3];

  return v3;
}

- (BookTextPosition)initWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)BookTextPosition;
  result = [(BookTextPosition *)&v11 init];
  if (result)
  {
    result->_charIndex = a3;
    result->_eolAffinity = a4;
    result->_preferredPosition = a5;
    result->_isPreferredStart = a6;
  }
  return result;
}

- (BookTextPosition)initWithCharIndex:(unint64_t)a3
{
  LODWORD(v3) = 2143289344;
  return [(BookTextPosition *)self initWithCharIndex:a3 eolAffinity:0 preferredPosition:1 isPreferredStart:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  unint64_t charIndex = self->_charIndex;
  BOOL eolAffinity = self->_eolAffinity;
  *(float *)&double v7 = self->_preferredPosition;
  BOOL isPreferredStart = self->_isPreferredStart;

  return [v4 initWithCharIndex:charIndex eolAffinity:eolAffinity preferredPosition:isPreferredStart isPreferredStart:v7];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = __IMAccessibilityCastAsClass();
  id v6 = [v5 charIndex];
  unint64_t charIndex = self->_charIndex;
  if ((id)charIndex == v6)
  {
    int eolAffinity = self->_eolAffinity;
    if (eolAffinity == [v5 endOfLineAffinity])
    {
      int64_t v9 = 0;
    }
    else if (self->_eolAffinity)
    {
      int64_t v9 = 1;
    }
    else
    {
      int64_t v9 = -1;
    }
  }
  else if (charIndex > (unint64_t)v6)
  {
    int64_t v9 = 1;
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = __IMAccessibilityCastAsClass();
  BOOL v6 = v5 && self->_charIndex == *(void *)(v5 + 8) && self->_eolAffinity == *(unsigned __int8 *)(v5 + 16);

  return v6;
}

- (int)distanceFromPosition:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = __IMAccessibilityCastAsClass();
  LODWORD(self) = self->_charIndex;
  LODWORD(self) = self - [v5 charIndex];

  return (int)self;
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