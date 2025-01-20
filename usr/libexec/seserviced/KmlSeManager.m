@interface KmlSeManager
@end

@implementation KmlSeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyIdStr, 0);
  objc_storeStrong((id *)&self->_publicKeyId, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_instanceAttestation, 0);
  objc_storeStrong((id *)&self->_deviceCertificate, 0);
  objc_storeStrong((id *)&self->_endpointId, 0);
  objc_destroyWeak((id *)&self->_seDelegate);
  objc_storeStrong((id *)&self->_seManagerQueue, 0);
  objc_storeStrong((id *)&self->_seManagerError, 0);
  objc_storeStrong((id *)&self->_anonymizedDsid, 0);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_longTermSharedSecret, 0);
  objc_storeStrong((id *)&self->_bleOOBMasterKey, 0);
  objc_storeStrong((id *)&self->_bleIntroKey, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_seSession, 0);
  objc_storeStrong((id *)&self->_trackingRequestData, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);

  objc_storeStrong((id *)&self->_keyConfig, 0);
}

@end