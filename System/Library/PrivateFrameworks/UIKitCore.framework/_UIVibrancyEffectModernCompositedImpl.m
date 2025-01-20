@interface _UIVibrancyEffectModernCompositedImpl
- (BOOL)isEqual:(id)a3;
- (_UIVibrancyEffectModernCompositedImpl)initWithCompositingMode:(int64_t)a3 compositingColor:(id)a4;
- (id)implementationReplacingTintColor:(id)a3;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIVibrancyEffectModernCompositedImpl

- (_UIVibrancyEffectModernCompositedImpl)initWithCompositingMode:(int64_t)a3 compositingColor:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIVibrancyEffectModernCompositedImpl;
  v8 = [(_UIVibrancyEffectModernCompositedImpl *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_compositingMode = a3;
    uint64_t v10 = _UICompositingFilterForMode(a3);
    filterType = v9->_filterType;
    v9->_filterType = (NSString *)v10;

    if (v9->_filterType)
    {
      if (v7)
      {
LABEL_4:
        v12 = (void *)[v7 copy];
LABEL_7:
        v14 = v12;
        objc_storeStrong((id *)&v9->_compositingColor, v12);

        goto LABEL_8;
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"UIVibrancyEffect.m", 757, @"Invalid compositing mode %li", a3);

      if (v7) {
        goto LABEL_4;
      }
    }
    v12 = +[UIColor whiteColor];
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (id)implementationReplacingTintColor:(id)a3
{
  id v4 = a3;
  compositingColor = self->_compositingColor;
  v6 = (UIColor *)v4;
  id v7 = compositingColor;
  if (v7 == v6)
  {

    goto LABEL_7;
  }
  v8 = v7;
  if (v6 && v7)
  {
    BOOL v9 = [(UIColor *)v6 isEqual:v7];

    if (!v9) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v10 = self;
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v10 = [[_UIVibrancyEffectModernCompositedImpl alloc] initWithCompositingMode:self->_compositingMode compositingColor:v6];
LABEL_10:
  v11 = v10;

  return v11;
}

- (unint64_t)hash
{
  return self->_compositingMode;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = (id *)v4;
    v6 = v5;
    if (v5[1] == self->_compositingMode)
    {
      compositingColor = self->_compositingColor;
      v8 = (UIColor *)v5[3];
      BOOL v9 = compositingColor;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
        char v12 = 1;
      }
      else
      {
        if (v8) {
          BOOL v11 = v9 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11) {
          char v12 = 0;
        }
        else {
          char v12 = [(UIColor *)v8 isEqual:v9];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t compositingMode = self->_compositingMode;
  id v5 = a3;
  [v5 encodeInteger:compositingMode forKey:@"UIVibrancyCompositedType"];
  [v5 encodeObject:self->_compositingColor forKey:@"UIVibrancyEffectCompositingColor"];
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6 = a3;
  v8 = objc_alloc_init(_UICompositingEffectViewEntry);
  [(_UICompositingEffectViewEntry *)v8 setFilterType:self->_filterType];
  [v6 addViewEffect:v8];
  id v7 = objc_alloc_init(_UITintColorViewEntry);
  [(_UITintColorViewEntry *)v7 setTintColor:self->_compositingColor];
  [v6 addViewEffect:v7];
  [v6 setTextShouldRenderWithTintColor:1];
}

- (void)appendDescriptionTo:(id)a3
{
  int64_t compositingMode = self->_compositingMode;
  id v5 = a3;
  _UICompositingModeName(compositingMode);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@" compositingMode=%@ compositingColor=%@", v6, self->_compositingColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingColor, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end