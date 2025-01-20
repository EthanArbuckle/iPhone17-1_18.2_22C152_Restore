@interface _UIShareParticipantDetails
+ (BOOL)supportsSecureCoding;
- (NSString)detailText;
- (NSString)participantID;
- (UIColor)participantColor;
- (_UIShareParticipantDetails)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setParticipantColor:(id)a3;
- (void)setParticipantID:(id)a3;
@end

@implementation _UIShareParticipantDetails

- (void)encodeWithCoder:(id)a3
{
  detailText = self->_detailText;
  id v5 = a3;
  [v5 encodeObject:detailText forKey:@"deta"];
  [v5 encodeObject:self->_participantID forKey:@"part"];
  [v5 encodeObject:self->_participantColor forKey:@"colo"];
}

- (_UIShareParticipantDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIShareParticipantDetails;
  id v5 = [(_UIShareParticipantDetails *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deta"];
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"part"];
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colo"];
    participantColor = v5->_participantColor;
    v5->_participantColor = (UIColor *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)participantID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)detailText
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetailText:(id)a3
{
}

- (UIColor)participantColor
{
  return (UIColor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParticipantColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
}

@end