@interface PKPaymentWebServiceContext(NanoPassKit)
- (id)npkPossiblyOverriddenPeerPaymentServiceURL;
@end

@implementation PKPaymentWebServiceContext(NanoPassKit)

- (id)npkPossiblyOverriddenPeerPaymentServiceURL
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v1 = [a1 peerPaymentServiceURL];
  v2 = PKPeerPaymentServiceOverrideURL();
  if (v2)
  {
    v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        v9 = v2;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Using overridden peer payment service url '%@' for registration.", (uint8_t *)&v8, 0xCu);
      }
    }
    id v6 = v2;

    v1 = v6;
  }

  return v1;
}

@end