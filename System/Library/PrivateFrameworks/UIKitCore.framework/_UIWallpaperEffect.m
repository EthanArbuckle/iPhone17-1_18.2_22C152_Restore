@interface _UIWallpaperEffect
+ (id)wallpaperEffectWithStyle:(int64_t)a3;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)_initWithStyle:(int64_t)a3;
- (id)description;
- (int64_t)_expectedUsage;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
@end

@implementation _UIWallpaperEffect

+ (id)wallpaperEffectWithStyle:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) _initWithStyle:a3];
  return v3;
}

- (id)_initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIWallpaperEffect;
  v4 = [(_UIWallpaperEffect *)&v8 init];
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 0:
        v4 = +[UIColor systemBackgroundColor];
        break;
      case 1:
        v4 = +[UIColor secondarySystemBackgroundColor];
        break;
      case 2:
        v4 = +[UIColor tertiarySystemBackgroundColor];
        break;
      case 3:
        v4 = +[UIColor systemGroupedBackgroundColor];
        break;
      case 4:
        v4 = +[UIColor secondarySystemGroupedBackgroundColor];
        break;
      case 5:
        v4 = +[UIColor tertiarySystemGroupedBackgroundColor];
        break;
      default:
        break;
    }
    color = v5->_color;
    v5->_color = (UIColor *)v4;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIWallpaperEffect *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
LABEL_7:
    char v7 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    char v7 = 0;
    goto LABEL_8;
  }
  color = self->_color;
  if (color == v5->_color) {
    goto LABEL_7;
  }
  char v7 = -[UIColor isEqual:](color, "isEqual:");
LABEL_8:

  return v7;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  if (self->_color)
  {
    id v6 = a3;
    char v7 = objc_alloc_init(_UIWallpaperEffectEntry);
    [(_UIWallpaperEffectEntry *)v7 setBackgroundColor:self->_color];
    [v6 addUnderlay:v7];
  }
}

- (int64_t)_expectedUsage
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWallpaperEffect;
  v3 = [(_UIWallpaperEffect *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" color=%@", self->_color];

  return v4;
}

- (void).cxx_destruct
{
}

@end