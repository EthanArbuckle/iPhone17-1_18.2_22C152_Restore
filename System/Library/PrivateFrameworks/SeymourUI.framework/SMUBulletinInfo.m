@interface SMUBulletinInfo
- (NSString)imageSymbolName;
- (NSString)message;
- (NSString)title;
- (void)setImageSymbolName:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SMUBulletinInfo

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)imageSymbolName
{
  return self->_imageSymbolName;
}

- (void)setImageSymbolName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSymbolName, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end