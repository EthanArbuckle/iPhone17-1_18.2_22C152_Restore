@interface SVDAssistantEnabledCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDAssistantEnabledCapability)initWithCoder:(id)a3;
- (SVDAssistantEnabledCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsAssistantEnabled;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDAssistantEnabledCapability

- (void).cxx_destruct
{
}

- (SVDAssistantEnabledCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDAssistantEnabledCapability;
  v5 = [(SVDAssistantEnabledCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDAssistantEnabledCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (int64_t)supportsAssistantEnabled
{
  return [(AssistantEnabledCapability *)self->_backing supportsAssistantEnabled];
}

- (SVDAssistantEnabledCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDAssistantEnabledCapability;
  id v4 = [(SVDAssistantEnabledCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability alloc] initWithStatus:a3];
    backing = v4->_backing;
    v4->_backing = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  v3 = +[AssistantEnabledCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end