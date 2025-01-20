@interface ContentViewStyleManagerBookInfo
- (BOOL)respectImageSizeClassIsPrefix;
- (NSString)language;
- (NSString)respectImageSizeClass;
- (void)setLanguage:(id)a3;
- (void)setRespectImageSizeClass:(id)a3;
- (void)setRespectImageSizeClassIsPrefix:(BOOL)a3;
@end

@implementation ContentViewStyleManagerBookInfo

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)respectImageSizeClass
{
  return self->_respectImageSizeClass;
}

- (void)setRespectImageSizeClass:(id)a3
{
}

- (BOOL)respectImageSizeClassIsPrefix
{
  return self->_respectImageSizeClassIsPrefix;
}

- (void)setRespectImageSizeClassIsPrefix:(BOOL)a3
{
  self->_respectImageSizeClassIsPrefix = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_respectImageSizeClass, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end