@interface MROriginClientPropertiesMessage
- (MROriginClientPropertiesMessage)initWithLastPlayingDate:(id)a3 devicePlaybackSessionID:(id)a4;
- (NSDate)lastPlayingDate;
- (NSString)devicePlaybackSessionID;
- (unint64_t)type;
@end

@implementation MROriginClientPropertiesMessage

- (MROriginClientPropertiesMessage)initWithLastPlayingDate:(id)a3 devicePlaybackSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MROriginClientPropertiesMessage;
  v8 = [(MRProtocolMessage *)&v11 init];
  if (v8)
  {
    v9 = objc_opt_new();
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(v9, "setLastPlayingTimestamp:");
    [v9 setDevicePlaybackSessionID:v7];
    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v9];
  }
  return v8;
}

- (NSDate)lastPlayingDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  v3 = [(MRProtocolMessage *)self underlyingCodableMessage];
  [v3 lastPlayingTimestamp];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (NSString)devicePlaybackSessionID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 devicePlaybackSessionID];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 105;
}

@end