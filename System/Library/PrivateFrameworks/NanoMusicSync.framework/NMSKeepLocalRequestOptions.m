@interface NMSKeepLocalRequestOptions
- (BOOL)requiresValidation;
- (NMSKeepLocalRequestOptions)init;
- (NSString)cellularBundleIdentifier;
- (double)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)qualityOfService;
- (unint64_t)cellularPolicy;
- (unint64_t)powerPolicy;
- (unint64_t)resolvedConstraints:(unint64_t)a3;
- (void)setCellularBundleIdentifier:(id)a3;
- (void)setCellularPolicy:(unint64_t)a3;
- (void)setPowerPolicy:(unint64_t)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRequiresValidation:(BOOL)a3;
- (void)setTimeout:(double)a3;
@end

@implementation NMSKeepLocalRequestOptions

- (NMSKeepLocalRequestOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)NMSKeepLocalRequestOptions;
  result = [(NMSKeepLocalRequestOptions *)&v3 init];
  if (result)
  {
    result->_requiresValidation = 1;
    result->_qualityOfService = -1;
    result->_timeout = 15.0;
  }
  return result;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)NMSKeepLocalRequestOptions;
  objc_super v3 = [(NMSKeepLocalRequestOptions *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@"requiresValidation:%u, powerPolicy:%lu, cellularPolicy:%lu, qualityOfService:%lu, bundleIdentifier:%@", self->_requiresValidation, self->_powerPolicy, self->_cellularPolicy, self->_qualityOfService, self->_cellularBundleIdentifier];

  return v4;
}

- (unint64_t)resolvedConstraints:(unint64_t)a3
{
  if ([(NMSKeepLocalRequestOptions *)self powerPolicy] == 1)
  {
    a3 &= 0xFFFFFFFFFFFFFFF9;
  }
  else if ([(NMSKeepLocalRequestOptions *)self powerPolicy] == 2)
  {
    a3 |= 4uLL;
  }
  if ([(NMSKeepLocalRequestOptions *)self cellularPolicy] == 1)
  {
    a3 &= ~2uLL;
  }
  else if ([(NMSKeepLocalRequestOptions *)self cellularPolicy] == 2)
  {
    a3 |= 2uLL;
  }
  else if (![(NMSKeepLocalRequestOptions *)self cellularPolicy] {
         && [(NMSKeepLocalRequestOptions *)self powerPolicy] == 2)
  }
  {
    a3 &= ~2uLL;
  }
  return a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_requiresValidation;
    *(void *)(v4 + 24) = self->_powerPolicy;
    *(void *)(v4 + 32) = self->_cellularPolicy;
    *(void *)(v4 + 40) = self->_qualityOfService;
    *(double *)(v4 + 48) = self->_timeout;
    objc_storeStrong((id *)(v4 + 16), self->_cellularBundleIdentifier);
  }
  return v5;
}

- (BOOL)requiresValidation
{
  return self->_requiresValidation;
}

- (void)setRequiresValidation:(BOOL)a3
{
  self->_requiresValidation = a3;
}

- (NSString)cellularBundleIdentifier
{
  return self->_cellularBundleIdentifier;
}

- (void)setCellularBundleIdentifier:(id)a3
{
}

- (unint64_t)powerPolicy
{
  return self->_powerPolicy;
}

- (void)setPowerPolicy:(unint64_t)a3
{
  self->_powerPolicy = a3;
}

- (unint64_t)cellularPolicy
{
  return self->_cellularPolicy;
}

- (void)setCellularPolicy:(unint64_t)a3
{
  self->_cellularPolicy = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
}

@end