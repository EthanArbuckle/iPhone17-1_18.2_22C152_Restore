@interface UMDUserManager
@end

@implementation UMDUserManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_volumeHelper, 0);

  objc_storeStrong((id *)&self->_se, 0);
}

@end