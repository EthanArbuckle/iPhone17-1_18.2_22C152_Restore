@interface SRUIFLatencyInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldShow;
- (NSString)latencySummary;
- (NSString)taskIdentifier;
- (SRUIFLatencyInformation)initWithCoder:(id)a3;
- (SRUIFLatencyInformation)initWithLatencySummary:(id)a3 taskIdentifier:(id)a4 shouldShow:(BOOL)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRUIFLatencyInformation

- (SRUIFLatencyInformation)initWithLatencySummary:(id)a3 taskIdentifier:(id)a4 shouldShow:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SRUIFLatencyInformation;
  v10 = [(SRUIFLatencyInformation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    latencySummary = v10->_latencySummary;
    v10->_latencySummary = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    taskIdentifier = v10->_taskIdentifier;
    v10->_taskIdentifier = (NSString *)v13;

    v10->_shouldShow = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  latencySummary = self->_latencySummary;
  id v5 = a3;
  [v5 encodeObject:latencySummary forKey:@"_latencySummary"];
  [v5 encodeObject:self->_taskIdentifier forKey:@"_taskIdentifier"];
  [v5 encodeBool:self->_shouldShow forKey:@"_shouldShow"];
}

- (SRUIFLatencyInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_latencySummary"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_taskIdentifier"];
  uint64_t v7 = [v4 decodeBoolForKey:@"_shouldShow"];

  id v8 = [(SRUIFLatencyInformation *)self initWithLatencySummary:v5 taskIdentifier:v6 shouldShow:v7];
  return v8;
}

- (NSString)latencySummary
{
  return self->_latencySummary;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_latencySummary, 0);
}

@end