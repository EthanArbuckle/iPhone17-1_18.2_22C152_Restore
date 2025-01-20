@interface KmlMessageToSend
@end

@implementation KmlMessageToSend

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end