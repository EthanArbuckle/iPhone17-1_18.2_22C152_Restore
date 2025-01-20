@interface OTAccountMetadataClassC
+ (Class)tlkSharesForVouchedIdentityType;
- (BOOL)hasAltDSID;
- (BOOL)hasAttemptedJoin;
- (BOOL)hasCdpState;
- (BOOL)hasEpoch;
- (BOOL)hasIcloudAccountState;
- (BOOL)hasIsInheritedAccount;
- (BOOL)hasLastHealthCheckup;
- (BOOL)hasOldPeerID;
- (BOOL)hasPeerID;
- (BOOL)hasSecureElementIdentity;
- (BOOL)hasSendingMetricsPermitted;
- (BOOL)hasSyncingPolicy;
- (BOOL)hasTrustState;
- (BOOL)hasVoucher;
- (BOOL)hasVoucherSignature;
- (BOOL)hasWarmedEscrowCache;
- (BOOL)hasWarnedTooManyPeers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInheritedAccount;
- (BOOL)readFrom:(id)a3;
- (BOOL)warmedEscrowCache;
- (BOOL)warnedTooManyPeers;
- (NSData)secureElementIdentity;
- (NSData)syncingPolicy;
- (NSData)voucher;
- (NSData)voucherSignature;
- (NSMutableArray)tlkSharesForVouchedIdentitys;
- (NSString)altDSID;
- (NSString)oldPeerID;
- (NSString)peerID;
- (id)attemptedJoinAsString:(int)a3;
- (id)cdpStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)icloudAccountStateAsString:(int)a3;
- (id)sendingMetricsPermittedAsString:(int)a3;
- (id)tlkSharesForVouchedIdentityAtIndex:(unint64_t)a3;
- (id)trustStateAsString:(int)a3;
- (int)StringAsAttemptedJoin:(id)a3;
- (int)StringAsCdpState:(id)a3;
- (int)StringAsIcloudAccountState:(id)a3;
- (int)StringAsSendingMetricsPermitted:(id)a3;
- (int)StringAsTrustState:(id)a3;
- (int)attemptedJoin;
- (int)cdpState;
- (int)icloudAccountState;
- (int)sendingMetricsPermitted;
- (int)trustState;
- (int64_t)epoch;
- (unint64_t)hash;
- (unint64_t)lastHealthCheckup;
- (unint64_t)tlkSharesForVouchedIdentitysCount;
- (void)addTlkSharesForVouchedIdentity:(id)a3;
- (void)clearTlkSharesForVouchedIdentitys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAttemptedJoin:(int)a3;
- (void)setCdpState:(int)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setHasAttemptedJoin:(BOOL)a3;
- (void)setHasCdpState:(BOOL)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)setHasIcloudAccountState:(BOOL)a3;
- (void)setHasIsInheritedAccount:(BOOL)a3;
- (void)setHasLastHealthCheckup:(BOOL)a3;
- (void)setHasSendingMetricsPermitted:(BOOL)a3;
- (void)setHasTrustState:(BOOL)a3;
- (void)setHasWarmedEscrowCache:(BOOL)a3;
- (void)setHasWarnedTooManyPeers:(BOOL)a3;
- (void)setIcloudAccountState:(int)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
- (void)setLastHealthCheckup:(unint64_t)a3;
- (void)setOldPeerID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSecureElementIdentity:(id)a3;
- (void)setSendingMetricsPermitted:(int)a3;
- (void)setSyncingPolicy:(id)a3;
- (void)setTlkSharesForVouchedIdentitys:(id)a3;
- (void)setTrustState:(int)a3;
- (void)setVoucher:(id)a3;
- (void)setVoucherSignature:(id)a3;
- (void)setWarmedEscrowCache:(BOOL)a3;
- (void)setWarnedTooManyPeers:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAccountMetadataClassC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucherSignature, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_tlkSharesForVouchedIdentitys, 0);
  objc_storeStrong((id *)&self->_syncingPolicy, 0);
  objc_storeStrong((id *)&self->_secureElementIdentity, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_oldPeerID, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)setOldPeerID:(id)a3
{
}

- (NSString)oldPeerID
{
  return self->_oldPeerID;
}

- (BOOL)warnedTooManyPeers
{
  return self->_warnedTooManyPeers;
}

- (BOOL)warmedEscrowCache
{
  return self->_warmedEscrowCache;
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (void)setSecureElementIdentity:(id)a3
{
}

- (NSData)secureElementIdentity
{
  return self->_secureElementIdentity;
}

- (void)setTlkSharesForVouchedIdentitys:(id)a3
{
}

- (NSMutableArray)tlkSharesForVouchedIdentitys
{
  return self->_tlkSharesForVouchedIdentitys;
}

- (void)setVoucherSignature:(id)a3
{
}

- (NSData)voucherSignature
{
  return self->_voucherSignature;
}

- (void)setVoucher:(id)a3
{
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setSyncingPolicy:(id)a3
{
}

- (NSData)syncingPolicy
{
  return self->_syncingPolicy;
}

- (unint64_t)lastHealthCheckup
{
  return self->_lastHealthCheckup;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[OTAccountMetadataClassC setPeerID:](self, "setPeerID:");
  }
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x10) != 0)
  {
    self->_icloudAccountState = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 62);
  }
  if (v5)
  {
    self->_epoch = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[OTAccountMetadataClassC setAltDSID:](self, "setAltDSID:");
  }
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x40) != 0)
  {
    self->_trustState = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 62);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_39;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_lastHealthCheckup = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_39:
  self->_attemptedJoin = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 62) & 8) != 0)
  {
LABEL_13:
    self->_cdpState = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_14:
  if (*((void *)v4 + 10)) {
    -[OTAccountMetadataClassC setSyncingPolicy:](self, "setSyncingPolicy:");
  }
  if (*((void *)v4 + 13)) {
    -[OTAccountMetadataClassC setVoucher:](self, "setVoucher:");
  }
  if (*((void *)v4 + 14)) {
    -[OTAccountMetadataClassC setVoucherSignature:](self, "setVoucherSignature:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 11);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[OTAccountMetadataClassC addTlkSharesForVouchedIdentity:](self, "addTlkSharesForVouchedIdentity:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 8)) {
    -[OTAccountMetadataClassC setSecureElementIdentity:](self, "setSecureElementIdentity:");
  }
  __int16 v12 = *((_WORD *)v4 + 62);
  if ((v12 & 0x80) != 0)
  {
    self->_isInheritedAccount = *((unsigned char *)v4 + 120);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v12 = *((_WORD *)v4 + 62);
    if ((v12 & 0x100) == 0)
    {
LABEL_31:
      if ((v12 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_43;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_31;
  }
  self->_warmedEscrowCache = *((unsigned char *)v4 + 121);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v12 = *((_WORD *)v4 + 62);
  if ((v12 & 0x200) == 0)
  {
LABEL_32:
    if ((v12 & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_43:
  self->_warnedTooManyPeers = *((unsigned char *)v4 + 122);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 62) & 0x20) != 0)
  {
LABEL_33:
    self->_sendingMetricsPermitted = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_34:
  if (*((void *)v4 + 6)) {
    -[OTAccountMetadataClassC setOldPeerID:](self, "setOldPeerID:");
  }
}

- (unint64_t)hash
{
  NSUInteger v23 = [(NSString *)self->_peerID hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v22 = 2654435761 * self->_icloudAccountState;
    if (has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if (has)
    {
LABEL_3:
      uint64_t v21 = 2654435761 * self->_epoch;
      goto LABEL_6;
    }
  }
  uint64_t v21 = 0;
LABEL_6:
  NSUInteger v20 = [(NSString *)self->_altDSID hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x40) != 0)
  {
    uint64_t v19 = 2654435761 * self->_trustState;
    if ((v4 & 2) != 0)
    {
LABEL_8:
      unint64_t v5 = 2654435761u * self->_lastHealthCheckup;
      if ((v4 & 4) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v6 = 0;
      if ((v4 & 8) != 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((v4 & 2) != 0) {
      goto LABEL_8;
    }
  }
  unint64_t v5 = 0;
  if ((v4 & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v6 = 2654435761 * self->_attemptedJoin;
  if ((v4 & 8) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_cdpState;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
LABEL_15:
  unint64_t v8 = (unint64_t)[(NSData *)self->_syncingPolicy hash];
  unint64_t v9 = (unint64_t)[(NSData *)self->_voucher hash];
  unint64_t v10 = (unint64_t)[(NSData *)self->_voucherSignature hash];
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_tlkSharesForVouchedIdentitys hash];
  unint64_t v12 = (unint64_t)[(NSData *)self->_secureElementIdentity hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    uint64_t v14 = 2654435761 * self->_isInheritedAccount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_17:
      uint64_t v15 = 2654435761 * self->_warmedEscrowCache;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v16 = 0;
      if ((v13 & 0x20) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v17 = 0;
      return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_oldPeerID hash];
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_17;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_warnedTooManyPeers;
  if ((v13 & 0x20) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v17 = 2654435761 * self->_sendingMetricsPermitted;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_oldPeerID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_78;
  }
  peerID = self->_peerID;
  if ((unint64_t)peerID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](peerID, "isEqual:")) {
      goto LABEL_78;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_icloudAccountState != *((_DWORD *)v4 + 10)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_epoch != *((void *)v4 + 1)) {
      goto LABEL_78;
    }
  }
  else if (v7)
  {
    goto LABEL_78;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](altDSID, "isEqual:")) {
      goto LABEL_78;
    }
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)v4 + 62);
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_trustState != *((_DWORD *)v4 + 24)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lastHealthCheckup != *((void *)v4 + 2)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_attemptedJoin != *((_DWORD *)v4 + 8)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_cdpState != *((_DWORD *)v4 + 9)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_78;
  }
  syncingPolicy = self->_syncingPolicy;
  if ((unint64_t)syncingPolicy | *((void *)v4 + 10)
    && !-[NSData isEqual:](syncingPolicy, "isEqual:"))
  {
    goto LABEL_78;
  }
  voucher = self->_voucher;
  if ((unint64_t)voucher | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](voucher, "isEqual:")) {
      goto LABEL_78;
    }
  }
  voucherSignature = self->_voucherSignature;
  if ((unint64_t)voucherSignature | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](voucherSignature, "isEqual:")) {
      goto LABEL_78;
    }
  }
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  if ((unint64_t)tlkSharesForVouchedIdentitys | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](tlkSharesForVouchedIdentitys, "isEqual:")) {
      goto LABEL_78;
    }
  }
  secureElementIdentity = self->_secureElementIdentity;
  if ((unint64_t)secureElementIdentity | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](secureElementIdentity, "isEqual:")) {
      goto LABEL_78;
    }
  }
  __int16 v14 = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 62);
  if ((v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0) {
      goto LABEL_78;
    }
    if (self->_isInheritedAccount)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_78;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0) {
      goto LABEL_78;
    }
    if (self->_warmedEscrowCache)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) != 0)
    {
      if (self->_warnedTooManyPeers)
      {
        if (!*((unsigned char *)v4 + 122)) {
          goto LABEL_78;
        }
        goto LABEL_71;
      }
      if (!*((unsigned char *)v4 + 122)) {
        goto LABEL_71;
      }
    }
LABEL_78:
    unsigned __int8 v17 = 0;
    goto LABEL_79;
  }
  if ((*((_WORD *)v4 + 62) & 0x200) != 0) {
    goto LABEL_78;
  }
LABEL_71:
  if ((v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_sendingMetricsPermitted != *((_DWORD *)v4 + 18)) {
      goto LABEL_78;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  oldPeerID = self->_oldPeerID;
  if ((unint64_t)oldPeerID | *((void *)v4 + 6)) {
    unsigned __int8 v17 = -[NSString isEqual:](oldPeerID, "isEqual:");
  }
  else {
    unsigned __int8 v17 = 1;
  }
LABEL_79:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_peerID copyWithZone:a3];
  __int16 v7 = (void *)v5[7];
  v5[7] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_icloudAccountState;
    *((_WORD *)v5 + 62) |= 0x10u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    v5[1] = self->_epoch;
    *((_WORD *)v5 + 62) |= 1u;
  }
  id v9 = [(NSString *)self->_altDSID copyWithZone:a3];
  unint64_t v10 = (void *)v5[3];
  v5[3] = v9;

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_trustState;
    *((_WORD *)v5 + 62) |= 0x40u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_7:
      if ((v11 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_7;
  }
  v5[2] = self->_lastHealthCheckup;
  *((_WORD *)v5 + 62) |= 2u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_8:
    if ((v11 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_25:
  *((_DWORD *)v5 + 8) = self->_attemptedJoin;
  *((_WORD *)v5 + 62) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 9) = self->_cdpState;
    *((_WORD *)v5 + 62) |= 8u;
  }
LABEL_10:
  id v12 = [(NSData *)self->_syncingPolicy copyWithZone:a3];
  __int16 v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = [(NSData *)self->_voucher copyWithZone:a3];
  __int16 v15 = (void *)v5[13];
  v5[13] = v14;

  id v16 = [(NSData *)self->_voucherSignature copyWithZone:a3];
  unsigned __int8 v17 = (void *)v5[14];
  v5[14] = v16;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v18 = self->_tlkSharesForVouchedIdentitys;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [[*(id *)(*((void *)&v30 + 1) + 8 * i) copyWithZone:a3];
        [v5 addTlkSharesForVouchedIdentity:v23];
      }
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v20);
  }

  id v24 = [(NSData *)self->_secureElementIdentity copyWithZone:a3];
  v25 = (void *)v5[8];
  v5[8] = v24;

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    *((unsigned char *)v5 + 120) = self->_isInheritedAccount;
    *((_WORD *)v5 + 62) |= 0x80u;
    __int16 v26 = (__int16)self->_has;
    if ((v26 & 0x100) == 0)
    {
LABEL_19:
      if ((v26 & 0x200) == 0) {
        goto LABEL_20;
      }
LABEL_29:
      *((unsigned char *)v5 + 122) = self->_warnedTooManyPeers;
      *((_WORD *)v5 + 62) |= 0x200u;
      if ((*(_WORD *)&self->_has & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  *((unsigned char *)v5 + 121) = self->_warmedEscrowCache;
  *((_WORD *)v5 + 62) |= 0x100u;
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x200) != 0) {
    goto LABEL_29;
  }
LABEL_20:
  if ((v26 & 0x20) != 0)
  {
LABEL_21:
    *((_DWORD *)v5 + 18) = self->_sendingMetricsPermitted;
    *((_WORD *)v5 + 62) |= 0x20u;
  }
LABEL_22:
  id v27 = -[NSString copyWithZone:](self->_oldPeerID, "copyWithZone:", a3, (void)v30);
  v28 = (void *)v5[6];
  v5[6] = v27;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_peerID)
  {
    [v4 setPeerID:];
    id v4 = v13;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_icloudAccountState;
    *((_WORD *)v4 + 62) |= 0x10u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_epoch;
    *((_WORD *)v4 + 62) |= 1u;
  }
  if (self->_altDSID)
  {
    [v13 setAltDSID:];
    id v4 = v13;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_trustState;
    *((_WORD *)v4 + 62) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_38;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 2) = self->_lastHealthCheckup;
  *((_WORD *)v4 + 62) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_38:
  *((_DWORD *)v4 + 8) = self->_attemptedJoin;
  *((_WORD *)v4 + 62) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_cdpState;
    *((_WORD *)v4 + 62) |= 8u;
  }
LABEL_14:
  if (self->_syncingPolicy) {
    [v13 setSyncingPolicy:];
  }
  if (self->_voucher) {
    [v13 setVoucher:];
  }
  if (self->_voucherSignature) {
    [v13 setVoucherSignature:];
  }
  if ([(OTAccountMetadataClassC *)self tlkSharesForVouchedIdentitysCount])
  {
    [v13 clearTlkSharesForVouchedIdentitys];
    unint64_t v7 = [(OTAccountMetadataClassC *)self tlkSharesForVouchedIdentitysCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        unint64_t v10 = [(OTAccountMetadataClassC *)self tlkSharesForVouchedIdentityAtIndex:i];
        [v13 addTlkSharesForVouchedIdentity:v10];
      }
    }
  }
  if (self->_secureElementIdentity) {
    [v13 setSecureElementIdentity:];
  }
  __int16 v11 = (__int16)self->_has;
  id v12 = v13;
  if ((v11 & 0x80) != 0)
  {
    *((unsigned char *)v13 + 120) = self->_isInheritedAccount;
    *((_WORD *)v13 + 62) |= 0x80u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x100) == 0)
    {
LABEL_28:
      if ((v11 & 0x200) == 0) {
        goto LABEL_29;
      }
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_28;
  }
  *((unsigned char *)v13 + 121) = self->_warmedEscrowCache;
  *((_WORD *)v13 + 62) |= 0x100u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_29:
    if ((v11 & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_42:
  *((unsigned char *)v13 + 122) = self->_warnedTooManyPeers;
  *((_WORD *)v13 + 62) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_30:
    *((_DWORD *)v13 + 18) = self->_sendingMetricsPermitted;
    *((_WORD *)v13 + 62) |= 0x20u;
  }
LABEL_31:
  if (self->_oldPeerID)
  {
    [v13 setOldPeerID:];
    id v12 = v13;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_peerID) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_altDSID) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_39;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
  if (self->_syncingPolicy) {
    PBDataWriterWriteDataField();
  }
  if (self->_voucher) {
    PBDataWriterWriteDataField();
  }
  if (self->_voucherSignature) {
    PBDataWriterWriteDataField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v7 = self->_tlkSharesForVouchedIdentitys;
  unint64_t v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteDataField();
      }
      id v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if (self->_secureElementIdentity) {
    PBDataWriterWriteDataField();
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x100) == 0)
    {
LABEL_31:
      if ((v12 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteBOOLField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x200) == 0)
  {
LABEL_32:
    if ((v12 & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_33:
  }
    PBDataWriterWriteInt32Field();
LABEL_34:
  if (self->_oldPeerID) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    unint64_t v5 = &selRef_escrowRequest;
    __int16 v6 = &selRef_escrowRequest;
    unint64_t v7 = &selRef_escrowRequest;
    do
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v11 == -1 || v11 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v12 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v11);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v11 + 1;
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v13 = v9++ >= 9;
        if (v13)
        {
          unint64_t v10 = 0;
          int v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
      int v14 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v14 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v16 = PBReaderReadString();
          uint64_t v17 = *((int *)v5 + 628);
          goto LABEL_101;
        case 2u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 0x10u;
          while (2)
          {
            unint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v21 == -1 || v21 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v22 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
              v20 |= (unint64_t)(v22 & 0x7F) << v18;
              if (v22 < 0)
              {
                v18 += 7;
                BOOL v13 = v19++ >= 9;
                if (v13)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_105:
          uint64_t v69 = *((int *)v7 + 630);
          goto LABEL_144;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 1u;
          while (2)
          {
            unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v26 == -1 || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
              v25 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                BOOL v13 = v24++ >= 9;
                if (v13)
                {
                  uint64_t v25 = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v25 = 0;
          }
LABEL_109:
          uint64_t v70 = 8;
          goto LABEL_118;
        case 4u:
          uint64_t v16 = PBReaderReadString();
          uint64_t v17 = 24;
          goto LABEL_101;
        case 5u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 0x40u;
          while (2)
          {
            unint64_t v30 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v30 == -1 || v30 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v30);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
              v20 |= (unint64_t)(v31 & 0x7F) << v28;
              if (v31 < 0)
              {
                v28 += 7;
                BOOL v13 = v29++ >= 9;
                if (v13)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_113:
          uint64_t v69 = 96;
          goto LABEL_144;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v25 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 2u;
          while (2)
          {
            unint64_t v34 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v34 == -1 || v34 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v34);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v34 + 1;
              v25 |= (unint64_t)(v35 & 0x7F) << v32;
              if (v35 < 0)
              {
                v32 += 7;
                BOOL v13 = v33++ >= 9;
                if (v13)
                {
                  uint64_t v25 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v25 = 0;
          }
LABEL_117:
          uint64_t v70 = 16;
LABEL_118:
          *(void *)&self->PBCodable_opaque[v70] = v25;
          continue;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 4u;
          while (2)
          {
            unint64_t v38 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v38 == -1 || v38 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v38);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v38 + 1;
              v20 |= (unint64_t)(v39 & 0x7F) << v36;
              if (v39 < 0)
              {
                v36 += 7;
                BOOL v13 = v37++ >= 9;
                if (v13)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_122:
          uint64_t v69 = 32;
          goto LABEL_144;
        case 8u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 8u;
          while (2)
          {
            unint64_t v42 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v42 == -1 || v42 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
              v20 |= (unint64_t)(v43 & 0x7F) << v40;
              if (v43 < 0)
              {
                v40 += 7;
                BOOL v13 = v41++ >= 9;
                if (v13)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v20) = 0;
          }
LABEL_126:
          uint64_t v69 = 36;
          goto LABEL_144;
        case 0xBu:
          uint64_t v16 = PBReaderReadData();
          uint64_t v17 = 80;
          goto LABEL_101;
        case 0xCu:
          uint64_t v16 = PBReaderReadData();
          uint64_t v17 = 104;
          goto LABEL_101;
        case 0xDu:
          uint64_t v16 = PBReaderReadData();
          uint64_t v17 = 112;
          goto LABEL_101;
        case 0xEu:
          v45 = v6;
          v46 = v7;
          v47 = v5;
          v48 = PBReaderReadData();
          if (v48) {
            [(OTAccountMetadataClassC *)self addTlkSharesForVouchedIdentity:v48];
          }

          unint64_t v5 = v47;
          unint64_t v7 = v46;
          __int16 v6 = v45;
          continue;
        case 0xFu:
          uint64_t v16 = PBReaderReadData();
          uint64_t v17 = 64;
          goto LABEL_101;
        case 0x12u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v51 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 0x80u;
          while (2)
          {
            unint64_t v52 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v52 == -1 || v52 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v52 + 1;
              v51 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v13 = v50++ >= 9;
                if (v13)
                {
                  uint64_t v51 = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v51 = 0;
          }
LABEL_130:
          BOOL v71 = v51 != 0;
          uint64_t v72 = 120;
          goto LABEL_139;
        case 0x13u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 0x100u;
          while (2)
          {
            unint64_t v57 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v57 == -1 || v57 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v57 + 1;
              v56 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                BOOL v13 = v55++ >= 9;
                if (v13)
                {
                  uint64_t v56 = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v56 = 0;
          }
LABEL_134:
          BOOL v71 = v56 != 0;
          uint64_t v72 = 121;
          goto LABEL_139;
        case 0x14u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 0x200u;
          while (2)
          {
            unint64_t v62 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v62 == -1 || v62 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v63 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v62);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v62 + 1;
              v61 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                BOOL v13 = v60++ >= 9;
                if (v13)
                {
                  uint64_t v61 = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v61 = 0;
          }
LABEL_138:
          BOOL v71 = v61 != 0;
          uint64_t v72 = 122;
LABEL_139:
          self->PBCodable_opaque[v72] = v71;
          continue;
        case 0x16u:
          char v64 = 0;
          unsigned int v65 = 0;
          uint64_t v20 = 0;
          *(_WORD *)&self->PBCodable_opaque[*((int *)v6 + 629)] |= 0x20u;
          break;
        case 0x17u:
          uint64_t v16 = PBReaderReadString();
          uint64_t v17 = 48;
LABEL_101:
          v68 = *(void **)&self->PBCodable_opaque[v17];
          *(void *)&self->PBCodable_opaque[v17] = v16;

          continue;
        default:
          int v44 = PBReaderSkipValueWithTag();
          if (!v44) {
            return v44;
          }
          continue;
      }
      while (1)
      {
        unint64_t v66 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v66 == -1 || v66 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v67 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v66);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v66 + 1;
        v20 |= (unint64_t)(v67 & 0x7F) << v64;
        if ((v67 & 0x80) == 0) {
          goto LABEL_141;
        }
        v64 += 7;
        BOOL v13 = v65++ >= 9;
        if (v13)
        {
          LODWORD(v20) = 0;
          goto LABEL_143;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_141:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v20) = 0;
      }
LABEL_143:
      uint64_t v69 = 72;
LABEL_144:
      *(_DWORD *)&self->PBCodable_opaque[v69] = v20;
    }
    while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length));
  }
  LOBYTE(v44) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v44;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  peerID = self->_peerID;
  if (peerID) {
    [v3 setObject:peerID forKey:@"peerID"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t icloudAccountState = self->_icloudAccountState;
    if (icloudAccountState >= 4)
    {
      char v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_icloudAccountState];
    }
    else
    {
      char v8 = *(&off_1000207B8 + icloudAccountState);
    }
    [v4 setObject:v8 forKey:@"icloudAccountState"];

    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    unsigned int v9 = +[NSNumber numberWithLongLong:self->_epoch];
    [v4 setObject:v9 forKey:@"epoch"];
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    [v4 setObject:altDSID forKey:@"altDSID"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    uint64_t trustState = self->_trustState;
    if (trustState >= 3)
    {
      BOOL v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_trustState];
    }
    else
    {
      BOOL v13 = *(&off_1000207D8 + trustState);
    }
    [v4 setObject:v13 forKey:@"trustState"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_14:
      if ((v11 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_14;
  }
  int v14 = +[NSNumber numberWithUnsignedLongLong:self->_lastHealthCheckup];
  [v4 setObject:v14 forKey:@"lastHealthCheckup"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_15:
    if ((v11 & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_22:
  uint64_t attemptedJoin = self->_attemptedJoin;
  if (attemptedJoin >= 3)
  {
    uint64_t v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_attemptedJoin];
  }
  else
  {
    uint64_t v16 = *(&off_1000207F0 + attemptedJoin);
  }
  [v4 setObject:v16 forKey:@"attemptedJoin"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    uint64_t cdpState = self->_cdpState;
    if (cdpState >= 3)
    {
      char v18 = +[NSString stringWithFormat:@"(unknown: %i)", self->_cdpState];
    }
    else
    {
      char v18 = *(&off_100020808 + cdpState);
    }
    [v4 setObject:v18 forKey:@"cdpState"];
  }
LABEL_30:
  syncingPolicy = self->_syncingPolicy;
  if (syncingPolicy) {
    [v4 setObject:syncingPolicy forKey:@"syncingPolicy"];
  }
  voucher = self->_voucher;
  if (voucher) {
    [v4 setObject:voucher forKey:@"voucher"];
  }
  voucherSignature = self->_voucherSignature;
  if (voucherSignature) {
    [v4 setObject:voucherSignature forKey:@"voucherSignature"];
  }
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  if (tlkSharesForVouchedIdentitys) {
    [v4 setObject:tlkSharesForVouchedIdentitys forKey:@"tlkSharesForVouchedIdentity"];
  }
  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity) {
    [v4 setObject:secureElementIdentity forKey:@"secureElementIdentity"];
  }
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x80) != 0)
  {
    uint64_t v25 = +[NSNumber numberWithBool:self->_isInheritedAccount];
    [v4 setObject:v25 forKey:@"isInheritedAccount"];

    __int16 v24 = (__int16)self->_has;
    if ((v24 & 0x100) == 0)
    {
LABEL_42:
      if ((v24 & 0x200) == 0) {
        goto LABEL_43;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_42;
  }
  unint64_t v26 = +[NSNumber numberWithBool:self->_warmedEscrowCache];
  [v4 setObject:v26 forKey:@"warmedEscrowCache"];

  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x200) == 0)
  {
LABEL_43:
    if ((v24 & 0x20) == 0) {
      goto LABEL_52;
    }
    goto LABEL_48;
  }
LABEL_47:
  char v27 = +[NSNumber numberWithBool:self->_warnedTooManyPeers];
  [v4 setObject:v27 forKey:@"warnedTooManyPeers"];

  if ((*(_WORD *)&self->_has & 0x20) == 0) {
    goto LABEL_52;
  }
LABEL_48:
  uint64_t sendingMetricsPermitted = self->_sendingMetricsPermitted;
  if (sendingMetricsPermitted >= 3)
  {
    unsigned int v29 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sendingMetricsPermitted];
  }
  else
  {
    unsigned int v29 = *(&off_100020820 + sendingMetricsPermitted);
  }
  [v4 setObject:v29 forKey:@"sendingMetricsPermitted"];

LABEL_52:
  oldPeerID = self->_oldPeerID;
  if (oldPeerID) {
    [v4 setObject:oldPeerID forKey:@"oldPeerID"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTAccountMetadataClassC;
  v3 = [(OTAccountMetadataClassC *)&v7 description];
  id v4 = [(OTAccountMetadataClassC *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasOldPeerID
{
  return self->_oldPeerID != 0;
}

- (int)StringAsSendingMetricsPermitted:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PERMITTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NOTPERMITTED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)sendingMetricsPermittedAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_100020820 + a3);
  }

  return v3;
}

- (BOOL)hasSendingMetricsPermitted
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasSendingMetricsPermitted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setSendingMetricsPermitted:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_uint64_t sendingMetricsPermitted = a3;
}

- (int)sendingMetricsPermitted
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_sendingMetricsPermitted;
  }
  else {
    return 0;
  }
}

- (BOOL)hasWarnedTooManyPeers
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasWarnedTooManyPeers:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setWarnedTooManyPeers:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_warnedTooManyPeers = a3;
}

- (BOOL)hasWarmedEscrowCache
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasWarmedEscrowCache:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setWarmedEscrowCache:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_warmedEscrowCache = a3;
}

- (BOOL)hasIsInheritedAccount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsInheritedAccount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isInheritedAccount = a3;
}

- (BOOL)hasSecureElementIdentity
{
  return self->_secureElementIdentity != 0;
}

- (id)tlkSharesForVouchedIdentityAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tlkSharesForVouchedIdentitys objectAtIndex:a3];
}

- (unint64_t)tlkSharesForVouchedIdentitysCount
{
  return (unint64_t)[(NSMutableArray *)self->_tlkSharesForVouchedIdentitys count];
}

- (void)addTlkSharesForVouchedIdentity:(id)a3
{
  id v4 = a3;
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  id v8 = v4;
  if (!tlkSharesForVouchedIdentitys)
  {
    __int16 v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_tlkSharesForVouchedIdentitys;
    self->_tlkSharesForVouchedIdentitys = v6;

    id v4 = v8;
    tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  }
  [(NSMutableArray *)tlkSharesForVouchedIdentitys addObject:v4];
}

- (void)clearTlkSharesForVouchedIdentitys
{
}

- (BOOL)hasVoucherSignature
{
  return self->_voucherSignature != 0;
}

- (BOOL)hasVoucher
{
  return self->_voucher != 0;
}

- (BOOL)hasSyncingPolicy
{
  return self->_syncingPolicy != 0;
}

- (int)StringAsCdpState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISABLED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ENABLED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)cdpStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_100020808 + a3);
  }

  return v3;
}

- (BOOL)hasCdpState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasCdpState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setCdpState:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_uint64_t cdpState = a3;
}

- (int)cdpState
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_cdpState;
  }
  else {
    return 0;
  }
}

- (int)StringAsAttemptedJoin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOTATTEMPTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATTEMPTED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)attemptedJoinAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_1000207F0 + a3);
  }

  return v3;
}

- (BOOL)hasAttemptedJoin
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasAttemptedJoin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setAttemptedJoin:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uint64_t attemptedJoin = a3;
}

- (int)attemptedJoin
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_attemptedJoin;
  }
  else {
    return 0;
  }
}

- (BOOL)hasLastHealthCheckup
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasLastHealthCheckup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setLastHealthCheckup:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_lastHealthCheckup = a3;
}

- (int)StringAsTrustState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNTRUSTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRUSTED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)trustStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_1000207D8 + a3);
  }

  return v3;
}

- (BOOL)hasTrustState
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasTrustState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setTrustState:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_uint64_t trustState = a3;
}

- (int)trustState
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_trustState;
  }
  else {
    return 0;
  }
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (BOOL)hasEpoch
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setEpoch:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (int)StringAsIcloudAccountState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NO_ACCOUNT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_AVAILABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_AVAILABLE_UNUSED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)icloudAccountStateAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_1000207B8 + a3);
  }

  return v3;
}

- (BOOL)hasIcloudAccountState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasIcloudAccountState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setIcloudAccountState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uint64_t icloudAccountState = a3;
}

- (int)icloudAccountState
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_icloudAccountState;
  }
  else {
    return 0;
  }
}

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

+ (Class)tlkSharesForVouchedIdentityType
{
  return (Class)objc_opt_class();
}

@end