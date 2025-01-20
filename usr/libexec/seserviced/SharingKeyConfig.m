@interface SharingKeyConfig
@end

@implementation SharingKeyConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingPasswordSeed, 0);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_keyConfigInTLVFormatTlv, 0);

  objc_storeStrong((id *)&self->_keyConfigInASN1Tlv, 0);
}

@end