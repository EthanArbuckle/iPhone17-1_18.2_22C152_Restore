@interface NFVASReader
@end

@implementation NFVASReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagNonce, 0);
  objc_storeStrong((id *)&self->_tagApplicationVersion, 0);
  objc_storeStrong((id *)&self->_tagApplicationName, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);

  objc_storeStrong((id *)&self->_tag, 0);
}

@end