@interface PKInAppPaymentEntitlement
- (BOOL)hasMerchantIdentifier:(id)a3;
- (BOOL)hasMerchantIdentifiers;
- (BOOL)ignoreMerchantIdentifiers;
- (PKInAppPaymentEntitlement)initWithToken:(id *)a3;
- (void)_probeEntitlementsWithToken:(id *)a3;
@end

@implementation PKInAppPaymentEntitlement

- (PKInAppPaymentEntitlement)initWithToken:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKInAppPaymentEntitlement;
  v4 = [(PKInAppPaymentEntitlement *)&v9 init];
  v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    [(PKInAppPaymentEntitlement *)v4 _probeEntitlementsWithToken:v8];
  }
  return v5;
}

- (BOOL)hasMerchantIdentifier:(id)a3
{
  return [(NSArray *)self->_merchantIdentifiers containsObject:a3];
}

- (BOOL)hasMerchantIdentifiers
{
  return [(NSArray *)self->_merchantIdentifiers count] != 0;
}

- (void)_probeEntitlementsWithToken:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  long long v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    v7 = v6;
    CFErrorRef error = 0;
    CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.private.in-app-payments", &error);
    CFErrorRef v9 = error;
    if (error)
    {
      v10 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v9;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get entitlements: %@", (uint8_t *)&token, 0xCu);
      }

      CFRelease(error);
    }
    if (v8)
    {
      v11 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(token.val[0]) = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Client has ignore merchant identifiers entitlement", (uint8_t *)&token, 2u);
      }

      CFTypeID v12 = CFGetTypeID(v8);
      BOOL v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v8) != 0;
      self->_ignoreMerchantIdentifiers = v13;
      CFRelease(v8);
    }
    CFTypeRef v14 = SecTaskCopyValueForEntitlement(v7, @"com.apple.developer.in-app-payments", &error);
    CFErrorRef v15 = error;
    if (error)
    {
      v16 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v15;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Failed to get entitlements: %@", (uint8_t *)&token, 0xCu);
      }

      CFRelease(error);
    }
    if (v14)
    {
      CFTypeID v17 = CFGetTypeID(v14);
      if (v17 == CFArrayGetTypeID()) {
        v18 = (void *)v14;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;
      v20 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v19;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Client has merchant identifiers: %@", (uint8_t *)&token, 0xCu);
      }

      v21 = [MEMORY[0x1E4F1CA48] array];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v22 = v19;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v31;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * v26);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v21, "addObject:", v27, (void)v30);
            }
            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v24);
      }

      CFRelease(v14);
      v28 = (NSArray *)[v21 copy];
      merchantIdentifiers = self->_merchantIdentifiers;
      self->_merchantIdentifiers = v28;
    }
    CFRelease(v7);
  }
}

- (BOOL)ignoreMerchantIdentifiers
{
  return self->_ignoreMerchantIdentifiers;
}

- (void).cxx_destruct
{
}

@end