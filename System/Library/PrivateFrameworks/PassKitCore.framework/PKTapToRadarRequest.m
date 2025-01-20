@interface PKTapToRadarRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isServerGenerated;
- (NSString)alertHeader;
- (NSString)alertMessage;
- (NSString)reason;
- (NSString)relatedRadar;
- (PKTapToRadarRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertHeader:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setReason:(id)a3;
- (void)setRelatedRadar:(id)a3;
- (void)setServerGenerated:(BOOL)a3;
@end

@implementation PKTapToRadarRequest

- (PKTapToRadarRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTapToRadarRequest;
  v5 = [(PKTapToRadarRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relatedRadar"];
    relatedRadar = v5->_relatedRadar;
    v5->_relatedRadar = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertHeader"];
    alertHeader = v5->_alertHeader;
    v5->_alertHeader = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertMessage"];
    alertMessage = v5->_alertMessage;
    v5->_alertMessage = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  reason = self->_reason;
  id v5 = a3;
  [v5 encodeObject:reason forKey:@"reason"];
  [v5 encodeObject:self->_relatedRadar forKey:@"relatedRadar"];
  [v5 encodeObject:self->_alertHeader forKey:@"alertHeader"];
  [v5 encodeObject:self->_alertMessage forKey:@"alertMessage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"reason: '%@'; ", self->_reason];
  [v3 appendFormat:@"relatedRadar: '%@'; ", self->_relatedRadar];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (BOOL)isServerGenerated
{
  return self->_serverGenerated;
}

- (void)setServerGenerated:(BOOL)a3
{
  self->_serverGenerated = a3;
}

- (NSString)relatedRadar
{
  return self->_relatedRadar;
}

- (void)setRelatedRadar:(id)a3
{
}

- (NSString)alertHeader
{
  return self->_alertHeader;
}

- (void)setAlertHeader:(id)a3
{
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
  objc_storeStrong((id *)&self->_relatedRadar, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end