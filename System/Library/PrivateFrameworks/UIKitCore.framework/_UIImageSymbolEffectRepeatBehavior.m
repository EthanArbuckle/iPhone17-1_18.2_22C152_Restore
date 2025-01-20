@interface _UIImageSymbolEffectRepeatBehavior
+ (BOOL)supportsSecureCoding;
+ (id)_repeatBehaviorWithRepeats:(double)a3;
+ (id)defaultRepeatBehavior;
+ (id)fixedRepeatBehavior:(unint64_t)a3;
+ (id)indefiniteRepeatBehavior;
- (BOOL)_hasCustomRepeatBehavior;
- (BOOL)isEqual:(id)a3;
- (_UIImageSymbolEffectRepeatBehavior)initWithCoder:(id)a3;
- (double)_numberOfRepeats;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIImageSymbolEffectRepeatBehavior

+ (id)_repeatBehaviorWithRepeats:(double)a3
{
  v4 = (double *)objc_opt_new();
  v4[1] = a3;
  return v4;
}

+ (id)defaultRepeatBehavior
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___UIImageSymbolEffectRepeatBehavior_defaultRepeatBehavior__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25BEE0 != -1) {
    dispatch_once(&qword_1EB25BEE0, block);
  }
  v2 = (void *)_MergedGlobals_1_22;
  return v2;
}

+ (id)fixedRepeatBehavior:(unint64_t)a3
{
  return (id)[a1 _repeatBehaviorWithRepeats:(double)a3];
}

+ (id)indefiniteRepeatBehavior
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___UIImageSymbolEffectRepeatBehavior_indefiniteRepeatBehavior__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25BEF0 != -1) {
    dispatch_once(&qword_1EB25BEF0, block);
  }
  v2 = (void *)qword_1EB25BEE8;
  return v2;
}

- (BOOL)_hasCustomRepeatBehavior
{
  return self->_numberOfRepeats > 0.0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIImageSymbolEffectRepeatBehavior *)a3;
  v5 = (double *)v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_numberOfRepeats == v5[1];
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)self->_numberOfRepeats;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_UIImageSymbolEffectRepeatBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() effect];

  if (v5)
  {
    [v4 decodeDoubleForKey:@"numberOfRepeats"];
    *(void *)(v5 + 8) = v6;
  }

  return (_UIImageSymbolEffectRepeatBehavior *)v5;
}

- (double)_numberOfRepeats
{
  return self->_numberOfRepeats;
}

@end