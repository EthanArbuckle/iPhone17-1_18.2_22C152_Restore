@interface PXAudioRequestOptions
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkAccessAllowed;
- (PXAudioAssetEntryPoint)entryPoint;
- (PXAudioRequestOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)intent;
- (unint64_t)hash;
- (void)setEntryPoint:(id)a3;
- (void)setFadeOutDuration:(id *)a3;
- (void)setIntent:(int64_t)a3;
- (void)setMaximumDuration:(id *)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setPreferredDuration:(id *)a3;
@end

@implementation PXAudioRequestOptions

- (void).cxx_destruct
{
}

- (void)setEntryPoint:(id)a3
{
}

- (PXAudioAssetEntryPoint)entryPoint
{
  return self->_entryPoint;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)networkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setMaximumDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maximumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maximumDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setFadeOutDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_fadeOutDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fadeOutDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setPreferredDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_preferredDuration.epoch = a3->var3;
  *(_OWORD *)&self->_preferredDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (unint64_t)hash
{
  $95D729B680665BEAEFA1D6FCA8238556 preferredDuration = self->_preferredDuration;
  unint64_t v3 = self->_networkAccessAllowed | (32 * (unint64_t)CMTimeGetSeconds((CMTime *)&preferredDuration));
  uint64_t v4 = v3 ^ [(PXAudioAssetEntryPoint *)self->_entryPoint hash];
  $95D729B680665BEAEFA1D6FCA8238556 preferredDuration = self->_fadeOutDuration;
  unint64_t Seconds = (unint64_t)CMTimeGetSeconds((CMTime *)&preferredDuration);
  $95D729B680665BEAEFA1D6FCA8238556 preferredDuration = self->_maximumDuration;
  return v4 ^ (32 * (Seconds ^ (unint64_t)CMTimeGetSeconds((CMTime *)&preferredDuration))) ^ self->_intent;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PXAudioRequestOptions *)self preferredDuration];
    if (v5) {
      [v5 preferredDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    if (CMTimeCompare(&time1, &time2)
      || (int v7 = [(PXAudioRequestOptions *)self networkAccessAllowed],
          v7 != [v5 networkAccessAllowed])
      || (int64_t v8 = -[PXAudioRequestOptions intent](self, "intent"), v8 != [v5 intent]))
    {
      BOOL v6 = 0;
LABEL_13:

      goto LABEL_14;
    }
    id v9 = [(PXAudioRequestOptions *)self entryPoint];
    id v10 = [v5 entryPoint];
    if (v9 == v10)
    {
    }
    else
    {
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_20;
      }
    }
    [(PXAudioRequestOptions *)self fadeOutDuration];
    if (v5) {
      [v5 fadeOutDuration];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    if (!CMTimeCompare(&v16, &v15))
    {
      [(PXAudioRequestOptions *)self maximumDuration];
      if (v5) {
        [v5 maximumDuration];
      }
      else {
        memset(&v13, 0, sizeof(v13));
      }
      BOOL v6 = CMTimeCompare(&v14, &v13) == 0;
      goto LABEL_25;
    }
LABEL_20:
    BOOL v6 = 0;
LABEL_25:

    goto LABEL_13;
  }
  BOOL v6 = 0;
LABEL_14:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PXAudioRequestOptions);
  [(PXAudioRequestOptions *)self preferredDuration];
  long long v15 = v17;
  uint64_t v16 = v18;
  [(PXAudioRequestOptions *)v4 setPreferredDuration:&v15];
  [(PXAudioRequestOptions *)v4 setNetworkAccessAllowed:[(PXAudioRequestOptions *)self networkAccessAllowed]];
  [(PXAudioRequestOptions *)v4 setIntent:[(PXAudioRequestOptions *)self intent]];
  id v5 = [(PXAudioRequestOptions *)self entryPoint];
  [(PXAudioRequestOptions *)v4 setEntryPoint:v5];

  [(PXAudioRequestOptions *)self fadeOutDuration];
  long long v11 = v13;
  uint64_t v12 = v14;
  [(PXAudioRequestOptions *)v4 setFadeOutDuration:&v11];
  [(PXAudioRequestOptions *)self maximumDuration];
  long long v7 = v9;
  uint64_t v8 = v10;
  [(PXAudioRequestOptions *)v4 setMaximumDuration:&v7];
  return v4;
}

- (PXAudioRequestOptions)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXAudioRequestOptions;
  result = [(PXAudioRequestOptions *)&v4 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_preferredDuration.value = *MEMORY[0x1E4F1F9F8];
    result->_preferredDuration.epoch = *(void *)(v3 + 16);
    result->_networkAccessAllowed = 1;
  }
  return result;
}

@end