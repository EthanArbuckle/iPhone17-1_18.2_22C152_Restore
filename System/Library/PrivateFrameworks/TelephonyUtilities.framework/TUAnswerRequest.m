@interface TUAnswerRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)allowBluetoothAnswerWithoutDowngrade;
- (BOOL)downgradeToAudio;
- (BOOL)pauseVideoToStart;
- (BOOL)screeningDueToUserInteraction;
- (BOOL)sendToScreening;
- (BOOL)wantsHoldMusic;
- (CGSize)localLandscapeAspectRatio;
- (CGSize)localPortraitAspectRatio;
- (IDSDestination)endpointIDSDestination;
- (NSDate)dateAnswered;
- (NSString)description;
- (NSString)endpointRapportEffectiveIdentifier;
- (NSString)endpointRapportMediaSystemIdentifier;
- (NSString)sourceIdentifier;
- (NSString)uniqueProxyIdentifier;
- (TUAnswerRequest)init;
- (TUAnswerRequest)initWithCall:(id)a3;
- (TUAnswerRequest)initWithCoder:(id)a3;
- (TUAnswerRequest)initWithUniqueProxyIdentifier:(id)a3;
- (int64_t)behavior;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowBluetoothAnswerWithoutDowngrade:(BOOL)a3;
- (void)setBehavior:(int64_t)a3;
- (void)setDateAnswered:(id)a3;
- (void)setDowngradeToAudio:(BOOL)a3;
- (void)setEndpointIDSDestination:(id)a3;
- (void)setEndpointRapportEffectiveIdentifier:(id)a3;
- (void)setEndpointRapportMediaSystemIdentifier:(id)a3;
- (void)setLocalLandscapeAspectRatio:(CGSize)a3;
- (void)setLocalPortraitAspectRatio:(CGSize)a3;
- (void)setPauseVideoToStart:(BOOL)a3;
- (void)setScreeningDueToUserInteraction:(BOOL)a3;
- (void)setSendToScreening:(BOOL)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setUniqueProxyIdentifier:(id)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
@end

@implementation TUAnswerRequest

- (TUAnswerRequest)initWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUAnswerRequest;
  v5 = [(TUAnswerRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uniqueProxyIdentifier = v5->_uniqueProxyIdentifier;
    v5->_uniqueProxyIdentifier = (NSString *)v6;
  }
  return v5;
}

- (TUAnswerRequest)initWithCall:(id)a3
{
  id v4 = [a3 uniqueProxyIdentifier];
  v5 = [(TUAnswerRequest *)self initWithUniqueProxyIdentifier:v4];

  return v5;
}

- (TUAnswerRequest)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"TUAnswerRequest.m", 39, @"%s is unavailable, use a designated initializer instead", "-[TUAnswerRequest init]" object file lineNumber description];

  return 0;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUAnswerRequest *)self uniqueProxyIdentifier];
  [v3 appendFormat:@" uniqueProxyIdentifier=%@", v4];

  [(TUAnswerRequest *)self localLandscapeAspectRatio];
  v5 = NSStringFromSize(v19);
  [v3 appendFormat:@" localLandscapeAspectRatio=%@", v5];

  [(TUAnswerRequest *)self localPortraitAspectRatio];
  uint64_t v6 = NSStringFromSize(v20);
  [v3 appendFormat:@" localPortraitAspectRatio=%@", v6];

  v7 = [(TUAnswerRequest *)self dateAnswered];
  [v3 appendFormat:@" dateAnswered=%@", v7];

  v8 = [(TUAnswerRequest *)self sourceIdentifier];

  if (v8)
  {
    objc_super v9 = [(TUAnswerRequest *)self sourceIdentifier];
    [v3 appendFormat:@" sourceIdentifier=%@", v9];
  }
  v10 = [(TUAnswerRequest *)self endpointIDSDestination];

  if (v10)
  {
    v11 = [(TUAnswerRequest *)self endpointIDSDestination];
    [v3 appendFormat:@" endpointIDSDestination=%@", v11];
  }
  v12 = [(TUAnswerRequest *)self endpointRapportMediaSystemIdentifier];

  if (v12)
  {
    v13 = [(TUAnswerRequest *)self endpointRapportMediaSystemIdentifier];
    [v3 appendFormat:@" endpointRapportMediaSystemIdentifier=%@", v13];
  }
  v14 = [(TUAnswerRequest *)self endpointRapportEffectiveIdentifier];

  if (v14)
  {
    v15 = [(TUAnswerRequest *)self endpointRapportEffectiveIdentifier];
    [v3 appendFormat:@" endpointRapportEffectiveIdentifier=%@", v15];
  }
  if ([(TUAnswerRequest *)self downgradeToAudio]) {
    objc_msgSend(v3, "appendFormat:", @" downgradeToAudio=%d", -[TUAnswerRequest downgradeToAudio](self, "downgradeToAudio"));
  }
  if ([(TUAnswerRequest *)self wantsHoldMusic]) {
    objc_msgSend(v3, "appendFormat:", @" wantsHoldMusic=%d", -[TUAnswerRequest wantsHoldMusic](self, "wantsHoldMusic"));
  }
  if ([(TUAnswerRequest *)self pauseVideoToStart]) {
    objc_msgSend(v3, "appendFormat:", @" pauseVideoToStart=%d", -[TUAnswerRequest pauseVideoToStart](self, "pauseVideoToStart"));
  }
  if ([(TUAnswerRequest *)self allowBluetoothAnswerWithoutDowngrade]) {
    objc_msgSend(v3, "appendFormat:", @" allowBluetoothAnswerWithoutDowngrade=%d", -[TUAnswerRequest allowBluetoothAnswerWithoutDowngrade](self, "allowBluetoothAnswerWithoutDowngrade"));
  }
  if ([(TUAnswerRequest *)self sendToScreening]) {
    objc_msgSend(v3, "appendFormat:", @" sendToScreening=%d", -[TUAnswerRequest sendToScreening](self, "sendToScreening"));
  }
  if ([(TUAnswerRequest *)self screeningDueToUserInteraction]) {
    objc_msgSend(v3, "appendFormat:", @" screeningDueToUserInteraction=%d", -[TUAnswerRequest screeningDueToUserInteraction](self, "screeningDueToUserInteraction"));
  }
  if ([(TUAnswerRequest *)self behavior]) {
    objc_msgSend(v3, "appendFormat:", @" behavior=%ld", -[TUAnswerRequest behavior](self, "behavior"));
  }
  [v3 appendString:@">"];
  v16 = (void *)[v3 copy];

  return (NSString *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUAnswerRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_uniqueProxyIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  v8 = [(TUAnswerRequest *)self initWithUniqueProxyIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_sourceIdentifier);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    sourceIdentifier = v8->_sourceIdentifier;
    v8->_sourceIdentifier = (NSString *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_endpointIDSDestination);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    endpointIDSDestination = v8->_endpointIDSDestination;
    v8->_endpointIDSDestination = (IDSDestination *)v15;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_endpointRapportMediaSystemIdentifier);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    endpointRapportMediaSystemIdentifier = v8->_endpointRapportMediaSystemIdentifier;
    v8->_endpointRapportMediaSystemIdentifier = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_endpointRapportEffectiveIdentifier);
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    endpointRapportEffectiveIdentifier = v8->_endpointRapportEffectiveIdentifier;
    v8->_endpointRapportEffectiveIdentifier = (NSString *)v23;

    v25 = NSStringFromSelector(sel_wantsHoldMusic);
    v8->_wantsHoldMusic = [v4 decodeBoolForKey:v25];

    v26 = NSStringFromSelector(sel_sendToScreening);
    v8->_sendToScreening = [v4 decodeBoolForKey:v26];

    v27 = NSStringFromSelector(sel_screeningDueToUserInteraction);
    v8->_screeningDueToUserInteraction = [v4 decodeBoolForKey:v27];

    v28 = NSStringFromSelector(sel_pauseVideoToStart);
    v8->_pauseVideoToStart = [v4 decodeBoolForKey:v28];

    v29 = NSStringFromSelector(sel_downgradeToAudio);
    v8->_downgradeToAudio = [v4 decodeBoolForKey:v29];

    v30 = NSStringFromSelector(sel_behavior);
    v8->_behavior = [v4 decodeIntegerForKey:v30];

    v31 = NSStringFromSelector(sel_localLandscapeAspectRatio);
    [v4 decodeSizeForKey:v31];
    v8->_localLandscapeAspectRatio.width = v32;
    v8->_localLandscapeAspectRatio.height = v33;

    v34 = NSStringFromSelector(sel_localPortraitAspectRatio);
    [v4 decodeSizeForKey:v34];
    v8->_localPortraitAspectRatio.width = v35;
    v8->_localPortraitAspectRatio.height = v36;

    uint64_t v37 = objc_opt_class();
    v38 = NSStringFromSelector(sel_dateAnswered);
    uint64_t v39 = [v4 decodeObjectOfClass:v37 forKey:v38];
    dateAnswered = v8->_dateAnswered;
    v8->_dateAnswered = (NSDate *)v39;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUAnswerRequest *)self uniqueProxyIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_uniqueProxyIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUAnswerRequest *)self sourceIdentifier];
  v8 = NSStringFromSelector(sel_sourceIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(TUAnswerRequest *)self endpointIDSDestination];
  v10 = NSStringFromSelector(sel_endpointIDSDestination);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(TUAnswerRequest *)self endpointRapportMediaSystemIdentifier];
  v12 = NSStringFromSelector(sel_endpointRapportMediaSystemIdentifier);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(TUAnswerRequest *)self endpointRapportEffectiveIdentifier];
  v14 = NSStringFromSelector(sel_endpointRapportEffectiveIdentifier);
  [v4 encodeObject:v13 forKey:v14];

  BOOL v15 = [(TUAnswerRequest *)self wantsHoldMusic];
  v16 = NSStringFromSelector(sel_wantsHoldMusic);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(TUAnswerRequest *)self sendToScreening];
  v18 = NSStringFromSelector(sel_sendToScreening);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(TUAnswerRequest *)self screeningDueToUserInteraction];
  NSSize v20 = NSStringFromSelector(sel_screeningDueToUserInteraction);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(TUAnswerRequest *)self pauseVideoToStart];
  v22 = NSStringFromSelector(sel_pauseVideoToStart);
  [v4 encodeBool:v21 forKey:v22];

  BOOL v23 = [(TUAnswerRequest *)self downgradeToAudio];
  v24 = NSStringFromSelector(sel_downgradeToAudio);
  [v4 encodeBool:v23 forKey:v24];

  int64_t v25 = [(TUAnswerRequest *)self behavior];
  v26 = NSStringFromSelector(sel_behavior);
  [v4 encodeInteger:v25 forKey:v26];

  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  v29 = NSStringFromSelector(sel_localLandscapeAspectRatio);
  objc_msgSend(v4, "encodeSize:forKey:", v29, width, height);

  double v30 = self->_localPortraitAspectRatio.width;
  double v31 = self->_localPortraitAspectRatio.height;
  CGFloat v32 = NSStringFromSelector(sel_localPortraitAspectRatio);
  objc_msgSend(v4, "encodeSize:forKey:", v32, v30, v31);

  dateAnswered = self->_dateAnswered;
  NSStringFromSelector(sel_dateAnswered);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:dateAnswered forKey:v34];
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
}

- (CGSize)localLandscapeAspectRatio
{
  double width = self->_localLandscapeAspectRatio.width;
  double height = self->_localLandscapeAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (CGSize)localPortraitAspectRatio
{
  double width = self->_localPortraitAspectRatio.width;
  double height = self->_localPortraitAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (IDSDestination)endpointIDSDestination
{
  return self->_endpointIDSDestination;
}

- (void)setEndpointIDSDestination:(id)a3
{
}

- (NSString)endpointRapportMediaSystemIdentifier
{
  return self->_endpointRapportMediaSystemIdentifier;
}

- (void)setEndpointRapportMediaSystemIdentifier:(id)a3
{
}

- (NSString)endpointRapportEffectiveIdentifier
{
  return self->_endpointRapportEffectiveIdentifier;
}

- (void)setEndpointRapportEffectiveIdentifier:(id)a3
{
}

- (BOOL)wantsHoldMusic
{
  return self->_wantsHoldMusic;
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  self->_wantsHoldMusic = a3;
}

- (BOOL)pauseVideoToStart
{
  return self->_pauseVideoToStart;
}

- (void)setPauseVideoToStart:(BOOL)a3
{
  self->_pauseVideoToStart = a3;
}

- (BOOL)downgradeToAudio
{
  return self->_downgradeToAudio;
}

- (void)setDowngradeToAudio:(BOOL)a3
{
  self->_downgradeToAudio = a3;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (BOOL)sendToScreening
{
  return self->_sendToScreening;
}

- (void)setSendToScreening:(BOOL)a3
{
  self->_sendToScreening = a3;
}

- (BOOL)screeningDueToUserInteraction
{
  return self->_screeningDueToUserInteraction;
}

- (void)setScreeningDueToUserInteraction:(BOOL)a3
{
  self->_screeningDueToUserInteraction = a3;
}

- (NSDate)dateAnswered
{
  return self->_dateAnswered;
}

- (void)setDateAnswered:(id)a3
{
}

- (BOOL)allowBluetoothAnswerWithoutDowngrade
{
  return self->_allowBluetoothAnswerWithoutDowngrade;
}

- (void)setAllowBluetoothAnswerWithoutDowngrade:(BOOL)a3
{
  self->_allowBluetoothAnswerWithoutDowngrade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAnswered, 0);
  objc_storeStrong((id *)&self->_endpointRapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRapportMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIDSDestination, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);

  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
}

@end