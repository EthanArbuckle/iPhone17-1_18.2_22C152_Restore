@interface PKPaymentHardwareStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)_canMakeLocalPaymentsNeedingSecureIntent:(BOOL)a3;
- (BOOL)_isDemoModeActive;
- (BOOL)canDecryptBAAEncryptedData;
- (BOOL)canMakeLocalPayments;
- (BOOL)canMakePayments;
- (BOOL)canMakeRemotePayments;
- (BOOL)canMakeVirtualCardPayments;
- (BOOL)hasRemoteDevices;
- (BOOL)hasSecureElement;
- (BOOL)isInFailForward;
- (BOOL)isSRD;
- (PKPaymentHardwareStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCanDecryptBAAEncryptedData:(BOOL)a3;
- (void)setCanMakeRemotePayments:(BOOL)a3;
- (void)setHasRemoteDevices:(BOOL)a3;
- (void)setHasSecureElement:(BOOL)a3;
- (void)setInFailForward:(BOOL)a3;
- (void)setIsSRD:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentHardwareStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentHardwareStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentHardwareStatus;
  v5 = [(PKPaymentHardwareStatus *)&v7 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_hasSecureElement = [v4 decodeBoolForKey:@"hasSecureElement"];
    v5->_hasRemoteDevices = [v4 decodeBoolForKey:@"hasRemoteDevices"];
    v5->_canMakeRemotePayments = [v4 decodeBoolForKey:@"canMakeRemotePayments"];
    v5->_isSRD = [v4 decodeBoolForKey:@"isSRD"];
    v5->_inFailForward = [v4 decodeBoolForKey:@"inFailForward"];
  }

  return v5;
}

- (id)description
{
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p> type:%d; canMakeLocalPayments:%d; canMakeRemotePayments:%d; hasSecureElement:%d; hasRemoteDevices:%d; isSRD:%d; ",
    objc_opt_class(),
    self,
    self->_type,
    [(PKPaymentHardwareStatus *)self canMakeLocalPayments],
    self->_canMakeRemotePayments,
    self->_hasSecureElement,
    self->_hasRemoteDevices,
  v3 = self->_isSRD);
  objc_msgSend(v3, "appendFormat:", @"inFailForward:%d; ", self->_inFailForward);
  [v3 appendString:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeBool:self->_hasSecureElement forKey:@"hasSecureElement"];
  [v5 encodeBool:self->_hasRemoteDevices forKey:@"hasRemoteDevices"];
  [v5 encodeBool:self->_canMakeRemotePayments forKey:@"canMakeRemotePayments"];
  [v5 encodeBool:self->_isSRD forKey:@"isSRD"];
  [v5 encodeBool:self->_inFailForward forKey:@"inFailForward"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKPaymentHardwareStatus allocWithZone:a3] init];
  *((void *)result + 2) = self->_type;
  *((unsigned char *)result + 8) = self->_hasSecureElement;
  *((unsigned char *)result + 9) = self->_hasRemoteDevices;
  *((unsigned char *)result + 11) = self->_canMakeRemotePayments;
  *((unsigned char *)result + 12) = self->_isSRD;
  *((unsigned char *)result + 10) = self->_inFailForward;
  return result;
}

- (BOOL)canMakePayments
{
  if ([(PKPaymentHardwareStatus *)self canMakeLocalPayments]) {
    return 1;
  }
  return [(PKPaymentHardwareStatus *)self canMakeRemotePayments];
}

- (BOOL)canMakeVirtualCardPayments
{
  return [(PKPaymentHardwareStatus *)self _canMakeLocalPaymentsNeedingSecureIntent:0];
}

- (BOOL)canMakeLocalPayments
{
  return [(PKPaymentHardwareStatus *)self _canMakeLocalPaymentsNeedingSecureIntent:1];
}

- (BOOL)_canMakeLocalPaymentsNeedingSecureIntent:(BOOL)a3
{
  return self->_hasSecureElement && !self->_inFailForward && !self->_isSRD;
}

- (BOOL)_isDemoModeActive
{
  if (PKHandsOnDemoModeEnabled()) {
    return 1;
  }
  return PKUIOnlyDemoModeEnabled();
}

- (BOOL)canDecryptBAAEncryptedData
{
  return self->_hasSecureElement && !self->_inFailForward;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (BOOL)hasSecureElement
{
  return self->_hasSecureElement;
}

- (void)setHasSecureElement:(BOOL)a3
{
  self->_hasSecureElement = a3;
}

- (BOOL)hasRemoteDevices
{
  return self->_hasRemoteDevices;
}

- (void)setHasRemoteDevices:(BOOL)a3
{
  self->_hasRemoteDevices = a3;
}

- (BOOL)isInFailForward
{
  return self->_inFailForward;
}

- (void)setInFailForward:(BOOL)a3
{
  self->_inFailForward = a3;
}

- (BOOL)canMakeRemotePayments
{
  return self->_canMakeRemotePayments;
}

- (void)setCanMakeRemotePayments:(BOOL)a3
{
  self->_canMakeRemotePayments = a3;
}

- (BOOL)isSRD
{
  return self->_isSRD;
}

- (void)setIsSRD:(BOOL)a3
{
  self->_isSRD = a3;
}

- (void)setCanDecryptBAAEncryptedData:(BOOL)a3
{
  self->_canDecryptBAAEncryptedData = a3;
}

@end