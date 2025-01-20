@interface TUISymbolImageBox
+ (int64_t)scaleFromString:(id)a3;
+ (int64_t)weightFromString:(id)a3 withDefault:(int64_t)a4;
+ (unint64_t)renderingModeFromString:(id)a3;
- (BOOL)baseline;
- (BOOL)hflipForRTL;
- (Class)layoutClass;
- (NSArray)colors;
- (NSString)blendMode;
- (NSString)name;
- (TUISymbolImageBox)init;
- (UIEdgeInsets)insets;
- (double)fontSize;
- (int64_t)scale;
- (int64_t)weight;
- (unint64_t)renderingMode;
- (void)setBaseline:(BOOL)a3;
- (void)setBlendMode:(id)a3;
- (void)setColors:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setHflipForRTL:(BOOL)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setName:(id)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setScale:(int64_t)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation TUISymbolImageBox

- (TUISymbolImageBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUISymbolImageBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    *(unsigned char *)&result->_flags = 0;
  }
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (void)setBaseline:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)baseline
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setHflipForRTL:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hflipForRTL
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

+ (int64_t)scaleFromString:(id)a3
{
  id v3 = a3;
  if (qword_2DF7F8 != -1) {
    dispatch_once(&qword_2DF7F8, &stru_256438);
  }
  v4 = [(id)qword_2DF7F0 objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    id v6 = [v4 unsignedIntegerValue];
  }
  else {
    id v6 = &def_141F14 + 2;
  }

  return (int64_t)v6;
}

+ (int64_t)weightFromString:(id)a3 withDefault:(int64_t)a4
{
  id v5 = a3;
  if (qword_2DF808 != -1) {
    dispatch_once(&qword_2DF808, &stru_256458);
  }
  id v6 = [(id)qword_2DF800 objectForKeyedSubscript:v5];
  v7 = v6;
  if (v6) {
    a4 = (int64_t)[v6 unsignedIntegerValue];
  }

  return a4;
}

+ (unint64_t)renderingModeFromString:(id)a3
{
  id v3 = a3;
  if (qword_2DF818 != -1) {
    dispatch_once(&qword_2DF818, &stru_256478);
  }
  v4 = [(id)qword_2DF810 objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    id v6 = [v4 unsignedIntegerValue];
  }
  else {
    id v6 = 0;
  }

  return (unint64_t)v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)scale
{
  return self->_scale;
}

- (void)setScale:(int64_t)a3
{
  self->_scale = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(id)a3
{
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(unint64_t)a3
{
  self->_renderingMode = a3;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_blendMode, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end