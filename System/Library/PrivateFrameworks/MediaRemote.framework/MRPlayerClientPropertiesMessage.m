@interface MRPlayerClientPropertiesMessage
- (MRPlayerClientPropertiesMessage)initWithPlayerPath:(id)a3 lastPlayingDate:(id)a4;
- (MRPlayerPath)playerPath;
- (NSDate)lastPlayingDate;
- (unint64_t)type;
@end

@implementation MRPlayerClientPropertiesMessage

- (MRPlayerClientPropertiesMessage)initWithPlayerPath:(id)a3 lastPlayingDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRPlayerClientPropertiesMessage;
  v8 = [(MRProtocolMessage *)&v12 init];
  if (v8)
  {
    v9 = objc_opt_new();
    [v7 timeIntervalSinceReferenceDate];
    objc_msgSend(v9, "setLastPlayingTimestamp:");
    v10 = [v6 protobuf];
    [v9 setPlayerPath:v10];

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

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  id v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 104;
}

@end