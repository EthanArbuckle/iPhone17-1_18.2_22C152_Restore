@interface PIDebugRect
+ (CIColor)datetimeColor;
+ (CIColor)datetimeSubcolor;
+ (CIColor)faceColor;
+ (CIColor)faceUnionColor;
+ (CIColor)gazeAreaRectColor;
+ (CIColor)inactiveColor;
+ (CIColor)inflatedFaceColor;
+ (CIColor)labelColor;
+ (CIColor)metadataColor;
+ (CIColor)paddedColor;
+ (CIColor)saliencyAcceptableColor;
+ (CIColor)saliencyPreferredColor;
+ (CIColor)settlingEffectColor;
+ (CIColor)smartCropColor;
+ (CIColor)v2CropColor;
+ (CIColor)visibleColor;
+ (id)debugRectWithRect:(CGRect)a3 color:(id)a4 label:(id)a5;
- (CGRect)geometry;
- (CIColor)color;
- (NSString)label;
- (PIDebugRect)init;
- (PIDebugRect)initWithRect:(CGRect)a3 color:(id)a4 label:(id)a5;
@end

@implementation PIDebugRect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (NSString)label
{
  return self->_label;
}

- (CIColor)color
{
  return self->_color;
}

- (CGRect)geometry
{
  double x = self->_geometry.origin.x;
  double y = self->_geometry.origin.y;
  double width = self->_geometry.size.width;
  double height = self->_geometry.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PIDebugRect)initWithRect:(CGRect)a3 color:(id)a4 label:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11 = (CIColor *)a4;
  v19.receiver = self;
  v19.super_class = (Class)PIDebugRect;
  id v12 = a5;
  v13 = [(PIDebugRect *)&v19 init];
  v13->_geometry.origin.CGFloat x = x;
  v13->_geometry.origin.CGFloat y = y;
  v13->_geometry.size.CGFloat width = width;
  v13->_geometry.size.CGFloat height = height;
  color = v13->_color;
  v13->_color = v11;
  v15 = v11;

  uint64_t v16 = objc_msgSend(v12, "copy", v19.receiver, v19.super_class);
  label = v13->_label;
  v13->_label = (NSString *)v16;

  return v13;
}

- (PIDebugRect)init
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = (uint64_t *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E4F7A748];
    v5 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      v6 = NSString;
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = NSStringFromSelector(a2);
      v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_9103);
        }
LABEL_7:
        os_log_t v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E4F29060];
          v15 = v13;
          uint64_t v16 = [v14 callStackSymbols];
          v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_9103);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      v15 = v18;
      v22 = [v20 callStackSymbols];
      v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_9103);
  }
}

+ (id)debugRectWithRect:(CGRect)a3 color:(id)a4 label:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = -[PIDebugRect initWithRect:color:label:]([PIDebugRect alloc], "initWithRect:color:label:", v11, v10, x, y, width, height);

  return v12;
}

+ (CIColor)settlingEffectColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.0 green:1.0 blue:0.5];
}

+ (CIColor)metadataColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0];
}

+ (CIColor)labelColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0];
}

+ (CIColor)faceUnionColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.1 green:0.9 blue:0.2];
}

+ (CIColor)v2CropColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.3 green:0.8 blue:0.4];
}

+ (CIColor)smartCropColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.8 green:0.3 blue:0.1];
}

+ (CIColor)gazeAreaRectColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.3 green:0.2 blue:0.7];
}

+ (CIColor)saliencyAcceptableColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.9 green:0.9 blue:0.2];
}

+ (CIColor)saliencyPreferredColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.2 green:0.9 blue:0.9];
}

+ (CIColor)datetimeSubcolor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.4 green:0.4 blue:0.4];
}

+ (CIColor)datetimeColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.9 green:0.9 blue:0.9];
}

+ (CIColor)inflatedFaceColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.5 green:0.0 blue:0.0];
}

+ (CIColor)faceColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:1.0 green:0.4 blue:0.4];
}

+ (CIColor)paddedColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.5 green:0.5 blue:0.5];
}

+ (CIColor)inactiveColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.5];
}

+ (CIColor)visibleColor
{
  return (CIColor *)[MEMORY[0x1E4F1E008] colorWithRed:0.4 green:0.4 blue:1.0];
}

@end