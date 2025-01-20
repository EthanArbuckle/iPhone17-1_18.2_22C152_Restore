@interface MSDKPeerDemoIPDStatus
+ (BOOL)supportsSecureCoding;
- (MSDKPeerDemoIPDStatus)initWithCoder:(id)a3;
- (MSDKPeerDemoIPDStatus)initWithTargetIPD:(double)a3 currentIPD:(double)a4 clipOnState:(unint64_t)a5;
- (double)currentIPD;
- (double)targetIPD;
- (id)description;
- (unint64_t)clipOnState;
- (void)encodeWithCoder:(id)a3;
- (void)setClipOnState:(unint64_t)a3;
- (void)setCurrentIPD:(double)a3;
- (void)setTargetIPD:(double)a3;
@end

@implementation MSDKPeerDemoIPDStatus

- (MSDKPeerDemoIPDStatus)initWithTargetIPD:(double)a3 currentIPD:(double)a4 clipOnState:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoIPDStatus;
  v8 = [(MSDKPeerDemoIPDStatus *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MSDKPeerDemoIPDStatus *)v8 setTargetIPD:a3];
    [(MSDKPeerDemoIPDStatus *)v9 setCurrentIPD:a4];
    [(MSDKPeerDemoIPDStatus *)v9 setClipOnState:a5];
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(MSDKPeerDemoIPDStatus *)self targetIPD];
  uint64_t v7 = v6;
  [(MSDKPeerDemoIPDStatus *)self currentIPD];
  v9 = [v3 stringWithFormat:@"<%@[%p]: TaregtIPD=%f CurrentIPD=%f ClipOnState=%lu>", v5, self, v7, v8, -[MSDKPeerDemoIPDStatus clipOnState](self, "clipOnState")];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoIPDStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoIPDStatus;
  v5 = [(MSDKPeerDemoIPDStatus *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TargetIPD"];
    [v6 doubleValue];
    -[MSDKPeerDemoIPDStatus setTargetIPD:](v5, "setTargetIPD:");

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentIPD"];
    [v7 doubleValue];
    -[MSDKPeerDemoIPDStatus setCurrentIPD:](v5, "setCurrentIPD:");

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClipOnState"];
    [v8 doubleValue];
    [(MSDKPeerDemoIPDStatus *)v5 setClipOnState:(unint64_t)v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  [(MSDKPeerDemoIPDStatus *)self targetIPD];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  [v5 encodeObject:v6 forKey:@"TargetIPD"];

  uint64_t v7 = NSNumber;
  [(MSDKPeerDemoIPDStatus *)self currentIPD];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  [v5 encodeObject:v8 forKey:@"CurrentIPD"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoIPDStatus clipOnState](self, "clipOnState"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v9 forKey:@"ClipOnState"];
}

- (double)targetIPD
{
  return self->_targetIPD;
}

- (void)setTargetIPD:(double)a3
{
  self->_targetIPD = a3;
}

- (double)currentIPD
{
  return self->_currentIPD;
}

- (void)setCurrentIPD:(double)a3
{
  self->_currentIPD = a3;
}

- (unint64_t)clipOnState
{
  return self->_clipOnState;
}

- (void)setClipOnState:(unint64_t)a3
{
  self->_clipOnState = a3;
}

@end