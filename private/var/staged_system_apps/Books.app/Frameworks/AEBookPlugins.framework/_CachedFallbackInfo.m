@interface _CachedFallbackInfo
+ (id)cachedFallbackInfo;
- (NSArray)fallbacks;
- (NSString)fontFamily;
- (NSString)language;
- (UIFont)font;
- (void)setFallbacks:(id)a3;
- (void)setFont:(id)a3;
- (void)setFontFamily:(id)a3;
- (void)setLanguage:(id)a3;
@end

@implementation _CachedFallbackInfo

+ (id)cachedFallbackInfo
{
  if (qword_22B610 != -1) {
    dispatch_once(&qword_22B610, &stru_1DD110);
  }
  v2 = (void *)qword_22B608;

  return v2;
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (void)setFontFamily:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSArray)fallbacks
{
  return self->_fallbacks;
}

- (void)setFallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbacks, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_fontFamily, 0);
}

@end