@interface TUConversationParticipantPresentationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isInCanvas;
- (CGRect)spatialPosition;
- (NSNumber)prominence;
- (NSNumber)visibility;
- (TUConversationParticipantPresentationContext)initWithCoder:(id)a3;
- (TUConversationParticipantPresentationContext)initWithParticipantIdentifier:(unint64_t)a3 videoQuality:(unint64_t)a4 visibility:(id)a5 prominence:(id)a6 spatialPosition:(CGRect)a7 isInCanvas:(BOOL)a8;
- (id)description;
- (unint64_t)participantIdentifier;
- (unint64_t)videoQuality;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUConversationParticipantPresentationContext

- (TUConversationParticipantPresentationContext)initWithParticipantIdentifier:(unint64_t)a3 videoQuality:(unint64_t)a4 visibility:(id)a5 prominence:(id)a6 spatialPosition:(CGRect)a7 isInCanvas:(BOOL)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationParticipantPresentationContext;
  result = [(TUConversationParticipantPresentationContext *)&v18 init];
  if (result)
  {
    result->_participantIdentifier = a3;
    result->_videoQualitCGFloat y = a4;
    result->_visibilitCGFloat y = (NSNumber *)a5;
    result->_prominence = (NSNumber *)a6;
    result->_spatialPosition.origin.CGFloat x = x;
    result->_spatialPosition.origin.CGFloat y = y;
    result->_spatialPosition.size.CGFloat width = width;
    result->_spatialPosition.size.CGFloat height = height;
    result->_isInCanvas = a8;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" participantIdentifer=%llu", -[TUConversationParticipantPresentationContext participantIdentifier](self, "participantIdentifier"));
  objc_msgSend(v3, "appendFormat:", @" videoQuality=%lu", -[TUConversationParticipantPresentationContext videoQuality](self, "videoQuality"));
  v4 = [(TUConversationParticipantPresentationContext *)self visibility];
  objc_msgSend(v3, "appendFormat:", @" visibility=%lu", objc_msgSend(v4, "integerValue"));

  v5 = [(TUConversationParticipantPresentationContext *)self prominence];
  objc_msgSend(v3, "appendFormat:", @" prominence=%lu", objc_msgSend(v5, "integerValue"));

  [(TUConversationParticipantPresentationContext *)self spatialPosition];
  uint64_t v7 = v6;
  [(TUConversationParticipantPresentationContext *)self spatialPosition];
  uint64_t v9 = v8;
  [(TUConversationParticipantPresentationContext *)self spatialPosition];
  uint64_t v11 = v10;
  [(TUConversationParticipantPresentationContext *)self spatialPosition];
  [v3 appendFormat:@" spatialPosition=(%f, %f, %f, %f)", v7, v9, v11, v12];
  objc_msgSend(v3, "appendFormat:", @" isInCanvas=%d", -[TUConversationParticipantPresentationContext isInCanvas](self, "isInCanvas"));
  [v3 appendString:@">"];
  v13 = (void *)[v3 copy];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipantPresentationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_participantIdentifier);
  uint64_t v6 = [v4 decodeInt64ForKey:v5];

  uint64_t v7 = NSStringFromSelector(sel_videoQuality);
  uint64_t v8 = [v4 decodeIntegerForKey:v7];

  uint64_t v9 = NSStringFromSelector(sel_visibility);
  uint64_t v10 = [v4 decodeObjectForKey:v9];

  uint64_t v11 = NSStringFromSelector(sel_prominence);
  uint64_t v12 = [v4 decodeObjectForKey:v11];

  v13 = NSStringFromSelector(sel_spatialPosition);
  [v4 decodeRectForKey:v13];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v22 = NSStringFromSelector(sel_isInCanvas);
  uint64_t v23 = [v4 decodeBoolForKey:v22];

  v24 = -[TUConversationParticipantPresentationContext initWithParticipantIdentifier:videoQuality:visibility:prominence:spatialPosition:isInCanvas:](self, "initWithParticipantIdentifier:videoQuality:visibility:prominence:spatialPosition:isInCanvas:", v6, v8, v10, v12, v23, v15, v17, v19, v21);
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationParticipantPresentationContext *)self participantIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_participantIdentifier);
  [v4 encodeInt64:v5 forKey:v6];

  unint64_t v7 = [(TUConversationParticipantPresentationContext *)self videoQuality];
  uint64_t v8 = NSStringFromSelector(sel_videoQuality);
  [v4 encodeInteger:v7 forKey:v8];

  uint64_t v9 = [(TUConversationParticipantPresentationContext *)self visibility];
  uint64_t v10 = NSStringFromSelector(sel_visibility);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(TUConversationParticipantPresentationContext *)self prominence];
  uint64_t v12 = NSStringFromSelector(sel_prominence);
  [v4 encodeObject:v11 forKey:v12];

  [(TUConversationParticipantPresentationContext *)self spatialPosition];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = NSStringFromSelector(sel_spatialPosition);
  objc_msgSend(v4, "encodeRect:forKey:", v21, v14, v16, v18, v20);

  BOOL v22 = [(TUConversationParticipantPresentationContext *)self isInCanvas];
  NSStringFromSelector(sel_isInCanvas);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v22 forKey:v23];
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (unint64_t)videoQuality
{
  return self->_videoQuality;
}

- (NSNumber)visibility
{
  return self->_visibility;
}

- (NSNumber)prominence
{
  return self->_prominence;
}

- (CGRect)spatialPosition
{
  double x = self->_spatialPosition.origin.x;
  double y = self->_spatialPosition.origin.y;
  double width = self->_spatialPosition.size.width;
  double height = self->_spatialPosition.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isInCanvas
{
  return self->_isInCanvas;
}

@end