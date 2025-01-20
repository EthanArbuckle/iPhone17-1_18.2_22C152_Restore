@interface MRGetVolumeMutedResultMessage
- (BOOL)isMuted;
- (MRGetVolumeMutedResultMessage)initWithMuted:(BOOL)a3;
- (unint64_t)type;
@end

@implementation MRGetVolumeMutedResultMessage

- (MRGetVolumeMutedResultMessage)initWithMuted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRGetVolumeMutedResultMessage;
  v4 = [(MRProtocolMessage *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(_MRGetVolumeMutedResultMessageProtobuf);
    [(_MRGetVolumeMutedResultMessageProtobuf *)v5 setIsMuted:v3];
    [(MRProtocolMessage *)v4 setUnderlyingCodableMessage:v5];
  }
  return v4;
}

- (unint64_t)type
{
  return 127;
}

- (BOOL)isMuted
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 isMuted];

  return v3;
}

@end