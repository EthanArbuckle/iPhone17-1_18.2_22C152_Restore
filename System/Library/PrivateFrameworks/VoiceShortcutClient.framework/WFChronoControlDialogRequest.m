@interface WFChronoControlDialogRequest
+ (BOOL)supportsSecureCoding;
- (CHSControlIdentity)controlIdentity;
- (WFChronoControlDialogRequest)initWithCoder:(id)a3;
- (WFChronoControlDialogRequest)initWithControlType:(unint64_t)a3 identity:(id)a4 attribution:(id)a5;
- (unint64_t)controlType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFChronoControlDialogRequest

- (void).cxx_destruct
{
}

- (CHSControlIdentity)controlIdentity
{
  return self->_controlIdentity;
}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFChronoControlDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFChronoControlDialogRequest controlType](self, "controlType", v6.receiver, v6.super_class), @"controlType");
  v5 = [(WFChronoControlDialogRequest *)self controlIdentity];
  [v4 encodeObject:v5 forKey:@"controlIdentity"];
}

- (WFChronoControlDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFChronoControlDialogRequest;
  v5 = [(WFDialogRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_controlType = [v4 decodeIntegerForKey:@"controlType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"controlIdentity"];
    controlIdentity = v5->_controlIdentity;
    v5->_controlIdentity = (CHSControlIdentity *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFChronoControlDialogRequest)initWithControlType:(unint64_t)a3 identity:(id)a4 attribution:(id)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFChronoControlDialogRequest;
  objc_super v10 = [(WFDialogRequest *)&v14 initWithAttribution:a5 prompt:0];
  v11 = v10;
  if (v10)
  {
    v10->_controlType = a3;
    objc_storeStrong((id *)&v10->_controlIdentity, a4);
    v12 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end