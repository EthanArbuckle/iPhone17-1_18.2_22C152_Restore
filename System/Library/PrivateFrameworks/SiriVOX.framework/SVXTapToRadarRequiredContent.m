@interface SVXTapToRadarRequiredContent
- (NSNumber)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)displayReason;
- (NSString)error;
- (NSString)radarDescription;
- (NSString)title;
- (NSUUID)requestID;
- (void)setComponentID:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setDisplayReason:(id)a3;
- (void)setError:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SVXTapToRadarRequiredContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayReason, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setDisplayReason:(id)a3
{
}

- (NSString)displayReason
{
  return self->_displayReason;
}

- (void)setComponentID:(id)a3
{
}

- (NSNumber)componentID
{
  return self->_componentID;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setRequestID:(id)a3
{
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)setError:(id)a3
{
}

- (NSString)error
{
  return self->_error;
}

@end