@interface _UIMaterial
+ (id)materialForSystemColorName:(id)a3;
+ (id)vibrancyEffectWithA:(double)a1 B:(double)a2 C:(double)a3 D:(double)a4 E:(double)a5 F:(double)a6;
- (BOOL)isVibrant;
- (NSArray)backgroundEffects;
- (NSArray)contentEffects;
- (_UIMaterial)initWithVibrancy:(int64_t)a3 forBlurEffectStyle:(int64_t)a4;
- (id)description;
- (id)initWithBlur:(id *)a1;
- (id)initWithVisualEffect:(void *)a1;
@end

@implementation _UIMaterial

- (BOOL)isVibrant
{
  return self->_vibrant;
}

+ (id)materialForSystemColorName:(id)a3
{
  id v3 = a3;
  self;
  if (qword_1EB25DE90 != -1) {
    dispatch_once(&qword_1EB25DE90, &__block_literal_global_1762);
  }
  id v4 = (id)qword_1EB25DE88;
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (id)initWithBlur:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = +[UIBlurEffect effectWithStyle:a2];
    v2 = -[_UIMaterial initWithVisualEffect:](v2, v3);
  }
  return v2;
}

- (id)initWithVisualEffect:(void *)a1
{
  id v3 = a2;
  v8.receiver = a1;
  v8.super_class = (Class)_UIMaterial;
  id v4 = (id *)objc_msgSendSuper2(&v8, sel_init);
  if (v4)
  {
    id obj = 0;
    id v7 = 0;
    _UIVisualEffectViewUpgradeLegacyEffect(v3, &v7, &obj);
    objc_storeStrong(v4 + 3, obj);
    objc_storeStrong(v4 + 2, v7);
  }
  return v4;
}

+ (id)vibrancyEffectWithA:(double)a1 B:(double)a2 C:(double)a3 D:(double)a4 E:(double)a5 F:(double)a6
{
  self;
  float v12 = a1 / 100.0;
  float v13 = a2 / 100.0;
  float v14 = a3 / 100.0;
  float v15 = a4 / 100.0;
  float v16 = a5 / 100.0;
  float v29 = v12;
  long long v28 = xmmword_186B974A0;
  float v31 = v13;
  long long v30 = xmmword_186B975D0;
  float v33 = v14;
  long long v32 = xmmword_186B975E0;
  long long v20 = xmmword_186B974A0;
  long long v34 = xmmword_186B975F0;
  int v35 = 0;
  float v21 = v15;
  long long v22 = xmmword_186B975D0;
  float v23 = v16;
  long long v24 = xmmword_186B975E0;
  float v17 = a6 / 100.0;
  float v25 = v17;
  long long v26 = xmmword_186B975F0;
  int v27 = 0;
  v18 = +[UIVibrancyEffect _vibrantEffectWithLightCAColorMatrix:&v28 darkCAColorMatrix:&v20 alpha:1.0];
  return v18;
}

- (_UIMaterial)initWithVibrancy:(int64_t)a3 forBlurEffectStyle:(int64_t)a4
{
  v6 = +[UIBlurEffect effectWithStyle:a4];
  id v7 = +[UIVibrancyEffect effectForBlurEffect:v6 style:a3];

  if (self)
  {
    objc_super v8 = (_UIMaterial *)-[_UIMaterial initWithVisualEffect:](self, v7);
    self = v8;
    if (v8) {
      v8->_vibrant = 1;
    }
  }

  return self;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_UIMaterial *)self contentEffects];
  id v7 = [(_UIMaterial *)self backgroundEffects];
  objc_super v8 = [v3 stringWithFormat:@"<%@: %p; contentEffects: %@, backgroundEffects: %@>", v5, self, v6, v7];

  return v8;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (NSArray)contentEffects
{
  return self->_contentEffects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
}

@end