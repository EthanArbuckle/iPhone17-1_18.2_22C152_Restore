@interface STSISO18013Handler
@end

@implementation STSISO18013Handler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralReaderKey, 0);
  objc_storeStrong((id *)&self->_unifiedAccessEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_unifiedAccessIKM, 0);
  objc_storeStrong((id *)&self->_sessionTranscript, 0);
  objc_destroyWeak((id *)&self->_nfcHandoverSelect);
  objc_destroyWeak((id *)&self->_nfcHandoverRequest);
  objc_destroyWeak((id *)&self->_deviceEngagement);
  objc_storeStrong((id *)&self->_readerCrptyor, 0);
  objc_storeStrong((id *)&self->_dcSession, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end