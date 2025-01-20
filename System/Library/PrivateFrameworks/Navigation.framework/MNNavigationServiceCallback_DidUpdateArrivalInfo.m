@interface MNNavigationServiceCallback_DidUpdateArrivalInfo
+ (BOOL)supportsSecureCoding;
- (MNArrivalInfo)arrivalInfo;
- (MNNavigationServiceCallback_DidUpdateArrivalInfo)initWithCoder:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalInfo:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateArrivalInfo

- (unint64_t)type
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MNNavigationServiceCallback_DidUpdateArrivalInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateArrivalInfo;
  v5 = [(MNNavigationServiceCallbackParameters *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_arrivalInfo"];
    arrivalInfo = v5->_arrivalInfo;
    v5->_arrivalInfo = (MNArrivalInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (void)setArrivalInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end