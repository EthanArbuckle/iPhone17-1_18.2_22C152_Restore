@interface ICMusicSubscriptionLeaseStatus
- (BOOL)hasInflightLeaseAcquisition;
- (BOOL)hasOfflinePlaybackKeys;
- (BOOL)hasOnlinePlaybackKeys;
- (BOOL)hasPendingLeaseAcquisition;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTakenDueToLeasePrevention;
- (BOOL)shouldPlaybackRequireOnlineKeys;
- (ICStoreDialogResponse)stateReasonDialog;
- (NSDictionary)stateReasonDialogMetricsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)leaseState;
- (unint64_t)hash;
- (void)setHasInflightLeaseAcquisition:(BOOL)a3;
- (void)setHasOfflinePlaybackKeys:(BOOL)a3;
- (void)setHasOnlinePlaybackKeys:(BOOL)a3;
- (void)setHasPendingLeaseAcquisition:(BOOL)a3;
- (void)setLeaseState:(int64_t)a3;
- (void)setShouldPlaybackRequireOnlineKeys:(BOOL)a3;
- (void)setStateReasonDialog:(id)a3;
- (void)setStateReasonDialogMetricsDictionary:(id)a3;
- (void)setTakenDueToLeasePrevention:(BOOL)a3;
@end

@implementation ICMusicSubscriptionLeaseStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateReasonDialogMetricsDictionary, 0);

  objc_storeStrong((id *)&self->_stateReasonDialog, 0);
}

- (void)setStateReasonDialogMetricsDictionary:(id)a3
{
}

- (NSDictionary)stateReasonDialogMetricsDictionary
{
  return self->_stateReasonDialogMetricsDictionary;
}

- (void)setStateReasonDialog:(id)a3
{
}

- (ICStoreDialogResponse)stateReasonDialog
{
  return self->_stateReasonDialog;
}

- (void)setLeaseState:(int64_t)a3
{
  self->_leaseState = a3;
}

- (int64_t)leaseState
{
  return self->_leaseState;
}

- (void)setTakenDueToLeasePrevention:(BOOL)a3
{
  self->_takenDueToLeasePrevention = a3;
}

- (BOOL)isTakenDueToLeasePrevention
{
  return self->_takenDueToLeasePrevention;
}

- (void)setHasInflightLeaseAcquisition:(BOOL)a3
{
  self->_hasInflightLeaseAcquisition = a3;
}

- (BOOL)hasInflightLeaseAcquisition
{
  return self->_hasInflightLeaseAcquisition;
}

- (void)setHasPendingLeaseAcquisition:(BOOL)a3
{
  self->_hasPendingLeaseAcquisition = a3;
}

- (BOOL)hasPendingLeaseAcquisition
{
  return self->_hasPendingLeaseAcquisition;
}

- (void)setHasOfflinePlaybackKeys:(BOOL)a3
{
  self->_hasOfflinePlaybackKeys = a3;
}

- (BOOL)hasOfflinePlaybackKeys
{
  return self->_hasOfflinePlaybackKeys;
}

- (void)setHasOnlinePlaybackKeys:(BOOL)a3
{
  self->_hasOnlinePlaybackKeys = a3;
}

- (BOOL)hasOnlinePlaybackKeys
{
  return self->_hasOnlinePlaybackKeys;
}

- (void)setShouldPlaybackRequireOnlineKeys:(BOOL)a3
{
  self->_shouldPlaybackRequireOnlineKeys = a3;
}

- (BOOL)shouldPlaybackRequireOnlineKeys
{
  return self->_shouldPlaybackRequireOnlineKeys;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    v4[2] = self->_leaseState;
    *((unsigned char *)v4 + 11) = self->_hasPendingLeaseAcquisition;
    *((unsigned char *)v4 + 12) = self->_hasInflightLeaseAcquisition;
    *((unsigned char *)v4 + 9) = self->_hasOnlinePlaybackKeys;
    *((unsigned char *)v4 + 10) = self->_hasOfflinePlaybackKeys;
    *((unsigned char *)v4 + 13) = self->_takenDueToLeasePrevention;
    *((unsigned char *)v4 + 8) = self->_shouldPlaybackRequireOnlineKeys;
    objc_storeStrong(v4 + 3, self->_stateReasonDialog);
    objc_storeStrong(v5 + 4, self->_stateReasonDialogMetricsDictionary);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICMusicSubscriptionLeaseStatus *)a3;
  if (v4 == self)
  {
    char v17 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  BOOL shouldPlaybackRequireOnlineKeys = self->_shouldPlaybackRequireOnlineKeys;
  if (shouldPlaybackRequireOnlineKeys != [(ICMusicSubscriptionLeaseStatus *)v4 shouldPlaybackRequireOnlineKeys])goto LABEL_12; {
  BOOL hasOnlinePlaybackKeys = self->_hasOnlinePlaybackKeys;
  }
  if (hasOnlinePlaybackKeys != [(ICMusicSubscriptionLeaseStatus *)v4 hasOnlinePlaybackKeys]) {
    goto LABEL_12;
  }
  BOOL hasOfflinePlaybackKeys = self->_hasOfflinePlaybackKeys;
  if (hasOfflinePlaybackKeys != [(ICMusicSubscriptionLeaseStatus *)v4 hasOfflinePlaybackKeys]) {
    goto LABEL_12;
  }
  BOOL hasPendingLeaseAcquisition = self->_hasPendingLeaseAcquisition;
  if (hasPendingLeaseAcquisition != [(ICMusicSubscriptionLeaseStatus *)v4 hasPendingLeaseAcquisition])goto LABEL_12; {
  BOOL hasInflightLeaseAcquisition = self->_hasInflightLeaseAcquisition;
  }
  if (hasInflightLeaseAcquisition != [(ICMusicSubscriptionLeaseStatus *)v4 hasInflightLeaseAcquisition])goto LABEL_12; {
  BOOL takenDueToLeasePrevention = self->_takenDueToLeasePrevention;
  }
  if (takenDueToLeasePrevention != [(ICMusicSubscriptionLeaseStatus *)v4 isTakenDueToLeasePrevention])goto LABEL_12; {
  int64_t leaseState = self->_leaseState;
  }
  if (leaseState != [(ICMusicSubscriptionLeaseStatus *)v4 leaseState]) {
    goto LABEL_12;
  }
  stateReasonDialog = self->_stateReasonDialog;
  uint64_t v13 = [(ICMusicSubscriptionLeaseStatus *)v4 stateReasonDialog];
  if (stateReasonDialog == (ICStoreDialogResponse *)v13)
  {
  }
  else
  {
    v14 = (void *)v13;
    v15 = self->_stateReasonDialog;
    v16 = [(ICMusicSubscriptionLeaseStatus *)v4 stateReasonDialog];
    LODWORD(v15) = [(ICStoreDialogResponse *)v15 isEqual:v16];

    if (!v15)
    {
LABEL_12:
      char v17 = 0;
      goto LABEL_14;
    }
  }
  stateReasonDialogMetricsDictionary = self->_stateReasonDialogMetricsDictionary;
  v20 = [(ICMusicSubscriptionLeaseStatus *)v4 stateReasonDialogMetricsDictionary];
  if (stateReasonDialogMetricsDictionary == v20)
  {
    char v17 = 1;
  }
  else
  {
    v21 = self->_stateReasonDialogMetricsDictionary;
    v22 = [(ICMusicSubscriptionLeaseStatus *)v4 stateReasonDialogMetricsDictionary];
    char v17 = [(NSDictionary *)v21 isEqualToDictionary:v22];
  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  v2.i32[0] = *(_DWORD *)&self->_hasOnlinePlaybackKeys;
  uint32x4_t v4 = vmovl_u16((uint16x4_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(v2)));
  v5.i64[0] = v4.u32[0];
  v5.i64[1] = v4.u32[1];
  int8x16_t v6 = (int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL);
  v5.i64[0] = v4.u32[2];
  v5.i64[1] = v4.u32[3];
  int8x16_t v7 = vorrq_s8(vbicq_s8((int8x16_t)xmmword_1A3032C00, v6), vbicq_s8((int8x16_t)xmmword_1A3032BF0, (int8x16_t)vshrq_n_s64(vshlq_n_s64(v5, 0x38uLL), 0x38uLL)));
  uint64_t v8 = *(void *)&vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) | (32
                                                                                              * self->_takenDueToLeasePrevention) | self->_shouldPlaybackRequireOnlineKeys;
  int64_t leaseState = self->_leaseState;
  uint64_t v10 = leaseState ^ [(ICStoreDialogResponse *)self->_stateReasonDialog hash];
  return v8 ^ v10 ^ [(NSDictionary *)self->_stateReasonDialogMetricsDictionary hash];
}

- (id)description
{
  v3 = NSString;
  uint32x4_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int8x16_t v6 = (void *)v5;
  if (self->_shouldPlaybackRequireOnlineKeys) {
    int8x16_t v7 = @"YES";
  }
  else {
    int8x16_t v7 = @"NO";
  }
  if (self->_hasOnlinePlaybackKeys) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if (self->_hasOfflinePlaybackKeys) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (self->_hasPendingLeaseAcquisition) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_hasInflightLeaseAcquisition) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if (self->_takenDueToLeasePrevention) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  unint64_t leaseState = self->_leaseState;
  v20 = v3;
  if (leaseState > 2) {
    v14 = 0;
  }
  else {
    v14 = off_1E5AC7F78[leaseState];
  }
  if (self->_stateReasonDialog)
  {
    v15 = v8;
    v16 = v9;
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self->_stateReasonDialog);
    objc_msgSend(v20, "stringWithFormat:", @"<%@ %p shouldPlaybackRequireOnlineKeys: %@; hasOnlinePlaybackKeys: %@; hasOfflinePlaybackKeys: %@; hasPendingLeaseAcquisition: %@, hasInflightLeaseAcquisition: %@, isTakenDueToLeasePrevention:%@, leaseState: %@; stateReasonDialog: %@>",
      v6,
      self,
      v7,
      v15,
      v16,
      v10,
      v11,
      v12,
      v14,
    v18 = v17);
  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", @"<%@ %p shouldPlaybackRequireOnlineKeys: %@; hasOnlinePlaybackKeys: %@; hasOfflinePlaybackKeys: %@; hasPendingLeaseAcquisition: %@, hasInflightLeaseAcquisition: %@, isTakenDueToLeasePrevention:%@, leaseState: %@; stateReasonDialog: %@>",
      v5,
      self,
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v14,
    v18 = 0);
  }

  return v18;
}

@end