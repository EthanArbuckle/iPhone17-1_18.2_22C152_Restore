@interface OBSplashBullet
- (NSString)text;
- (OBImage)icon;
- (void)setIcon:(id)a3;
- (void)setText:(id)a3;
@end

@implementation OBSplashBullet

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setText:(id)a3
{
}

- (OBImage)icon
{
  return (OBImage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end