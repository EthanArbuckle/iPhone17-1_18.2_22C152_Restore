@interface _UIImageSymbolReplaceTransition
+ (BOOL)supportsSecureCoding;
+ (id)transition;
- (BOOL)_isValidAnimationPreset;
- (BOOL)byLayer;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolReplaceTransition)initWithCoder:(id)a3;
- (id)_nsSymbolContentTransitionRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setByLayer:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _UIImageSymbolReplaceTransition

+ (id)transition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIImageSymbolReplaceTransition;
  uint64_t v2 = objc_msgSendSuper2(&v4, sel_transition);
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  return (id)v2;
}

- (BOOL)_isValidAnimationPreset
{
  return 1;
}

- (id)_nsSymbolContentTransitionRepresentation
{
  int64_t style = self->_style;
  if (style == 3)
  {
    uint64_t v4 = [MEMORY[0x1E4F41A60] replaceOffUpTransition];
  }
  else
  {
    if (style == 2) {
      [MEMORY[0x1E4F41A60] replaceUpUpTransition];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4F41A60] replaceDownUpTransition];
    }
  }
  v5 = (void *)v4;
  if ([(_UIImageSymbolReplaceTransition *)self byLayer]) {
    [v5 transitionWithByLayer];
  }
  else {
  v6 = [v5 transitionWithWholeSymbol];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolReplaceTransition;
  BOOL v5 = [(_UIImageSymbolTransition *)&v7 isEqual:v4]
    && self->_style == v4[3]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolReplaceTransition;
  return self->_style ^ [(_UIImageSymbolTransition *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolReplaceTransition;
  id result = [(_UIImageSymbolTransition *)&v5 copyWithZone:a3];
  *((void *)result + 3) = self->_style;
  *((unsigned char *)result + 16) = self->_byLayer;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v5 = a3;
  [v5 encodeInteger:style forKey:@"style"];
  [v5 encodeBool:self->_byLayer forKey:@"byLayer"];
}

- (_UIImageSymbolReplaceTransition)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() effect];

  if (v5)
  {
    v5->_int64_t style = [v4 decodeIntegerForKey:@"style"];
    v5->_byLayer = [v4 decodeBoolForKey:@"byLayer"];
  }

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (BOOL)byLayer
{
  return self->_byLayer;
}

- (void)setByLayer:(BOOL)a3
{
  self->_byLayer = a3;
}

@end