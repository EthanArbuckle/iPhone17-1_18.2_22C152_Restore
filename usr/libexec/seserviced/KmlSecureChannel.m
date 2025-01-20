@interface KmlSecureChannel
- (KmlSecureChannel)init;
@end

@implementation KmlSecureChannel

- (KmlSecureChannel)init
{
  v6.receiver = self;
  v6.super_class = (Class)KmlSecureChannel;
  v2 = [(KmlSecureChannel *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithLength:16];
    macChainingValue = v2->_macChainingValue;
    v2->_macChainingValue = v3;

    v2->_commandCounter = 1;
    *(_WORD *)&v2->_ignoreHeaderAndStatusWordInMacCalculation = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pakeResult, 0);
  objc_storeStrong((id *)&self->_pakeClient, 0);
  objc_storeStrong((id *)&self->_macChainingValue, 0);
  objc_storeStrong((id *)&self->_bleOOBMasterKey, 0);
  objc_storeStrong((id *)&self->_bleIntroKey, 0);
  objc_storeStrong((id *)&self->_responseMacKey, 0);
  objc_storeStrong((id *)&self->_commandMacKey, 0);
  objc_storeStrong((id *)&self->_payloadKey, 0);
  objc_storeStrong((id *)&self->_longTermKey, 0);
  objc_storeStrong((id *)&self->_secureChannelKey, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_sharedSecret, 0);
}

@end