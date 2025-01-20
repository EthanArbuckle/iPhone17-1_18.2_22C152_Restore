@interface PKApplicationMessageContentView_State
- (PKApplicationMessageContentView_State)init;
@end

@implementation PKApplicationMessageContentView_State

- (PKApplicationMessageContentView_State)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_iconImageTintColor, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end