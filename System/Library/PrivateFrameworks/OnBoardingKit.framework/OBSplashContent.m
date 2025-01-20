@interface OBSplashContent
- (NSArray)bullets;
- (NSString)text;
- (void)setBullets:(id)a3;
- (void)setText:(id)a3;
@end

@implementation OBSplashContent

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setText:(id)a3
{
}

- (NSArray)bullets
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBullets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bullets, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end