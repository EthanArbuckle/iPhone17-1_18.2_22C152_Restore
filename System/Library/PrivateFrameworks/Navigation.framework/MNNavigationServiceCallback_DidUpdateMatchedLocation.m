@interface MNNavigationServiceCallback_DidUpdateMatchedLocation
+ (BOOL)supportsSecureCoding;
- (MNLocation)location;
- (MNNavigationServiceCallback_DidUpdateMatchedLocation)initWithCoder:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateMatchedLocation

- (unint64_t)type
{
  return 7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateMatchedLocation;
  id v4 = a3;
  [(MNNavigationServiceCallbackParameters *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, @"_location", v5.receiver, v5.super_class);
}

- (MNNavigationServiceCallback_DidUpdateMatchedLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateMatchedLocation;
  objc_super v5 = [(MNNavigationServiceCallbackParameters *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_location"];
    location = v5->_location;
    v5->_location = (MNLocation *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end