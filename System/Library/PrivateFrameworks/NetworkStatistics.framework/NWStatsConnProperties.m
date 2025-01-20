@interface NWStatsConnProperties
- (BOOL)hasNetAccess;
- (BOOL)isNonAppInitiated;
- (BOOL)isSilent;
- (BOOL)isTracker;
- (NSData)remoteAddress;
- (NSString)domainAttributedBundleId;
- (NSString)domainName;
- (NSString)domainOwner;
- (NSString)domainTrackerContext;
- (id)description;
- (unsigned)remotePort;
- (void)setDomainAttributedBundleId:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setDomainOwner:(id)a3;
- (void)setDomainTrackerContext:(id)a3;
- (void)setHasNetAccess:(BOOL)a3;
- (void)setIsNonAppInitiated:(BOOL)a3;
- (void)setIsSilent:(BOOL)a3;
- (void)setIsTracker:(BOOL)a3;
- (void)setRemoteAddress:(id)a3;
@end

@implementation NWStatsConnProperties

- (BOOL)isSilent
{
  return self->_isSilent;
}

- (void)setRemoteAddress:(id)a3
{
}

- (void)setIsTracker:(BOOL)a3
{
  self->_isTracker = a3;
}

- (void)setIsSilent:(BOOL)a3
{
  self->_isSilent = a3;
}

- (void)setIsNonAppInitiated:(BOOL)a3
{
  self->_isNonAppInitiated = a3;
}

- (void)setDomainTrackerContext:(id)a3
{
}

- (void)setDomainOwner:(id)a3
{
}

- (void)setDomainName:(id)a3
{
}

- (void)setDomainAttributedBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_domainAttributedBundleId, 0);
  objc_storeStrong((id *)&self->_domainTrackerContext, 0);
  objc_storeStrong((id *)&self->_domainOwner, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"NWStatsConnProperties at %p, isTracker %d, nonAppInit %d silent %d domain %@ owner %@ tracker-context %@ attributed %@ addr %@", self, self->_isTracker, self->_isNonAppInitiated, self->_isSilent, self->_domainName, self->_domainOwner, self->_domainTrackerContext, self->_domainAttributedBundleId, self->_remoteAddress];
  return v2;
}

- (unsigned)remotePort
{
  v2 = [(NWStatsConnProperties *)self remoteAddress];
  v3 = v2;
  if (v2
    && ((id v4 = v2, v5 = [v4 bytes], *(unsigned char *)(v5 + 1) == 2)
     || (uint64_t v5 = [v4 bytes], *(unsigned char *)(v5 + 1) == 30)))
  {
    unsigned int v6 = bswap32(*(unsigned __int16 *)(v5 + 2)) >> 16;
  }
  else
  {
    LOWORD(v6) = 0;
  }

  return v6;
}

- (BOOL)isTracker
{
  return self->_isTracker;
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)domainOwner
{
  return self->_domainOwner;
}

- (NSString)domainTrackerContext
{
  return self->_domainTrackerContext;
}

- (NSString)domainAttributedBundleId
{
  return self->_domainAttributedBundleId;
}

- (NSData)remoteAddress
{
  return self->_remoteAddress;
}

- (BOOL)hasNetAccess
{
  return self->_hasNetAccess;
}

- (void)setHasNetAccess:(BOOL)a3
{
  self->_hasNetAccess = a3;
}

@end