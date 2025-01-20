@interface KmlCommandHandler
@end

@implementation KmlCommandHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_keyConfig, 0);
  objc_storeStrong((id *)&self->_pairingPassword, 0);
  objc_storeStrong((id *)&self->_secureChannel, 0);

  objc_storeStrong((id *)&self->_expectedCommands, 0);
}

@end