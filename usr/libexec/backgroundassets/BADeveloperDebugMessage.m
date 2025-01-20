@interface BADeveloperDebugMessage
+ (BOOL)supportsSecureCoding;
- (BADeveloperDebugMessage)init;
- (BADeveloperDebugMessage)initWithCoder:(id)a3;
- (id)archivedRepresentationWithError:(id *)a3;
- (unint64_t)messageVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setMessageVersion:(unint64_t)a3;
@end

@implementation BADeveloperDebugMessage

- (BADeveloperDebugMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BADeveloperDebugMessage;
  v5 = [(BADeveloperDebugMessage *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BAMessageVersion"];
    v5->_messageVersion = (unint64_t)[v6 unsignedIntegerValue];
  }
  return v5;
}

- (BADeveloperDebugMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)BADeveloperDebugMessage;
  result = [(BADeveloperDebugMessage *)&v3 init];
  if (result) {
    result->_messageVersion = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNumber numberWithUnsignedInteger:[(BADeveloperDebugMessage *)self messageVersion]];
  [v4 encodeObject:v5 forKey:@"BAMessageVersion"];
}

- (id)archivedRepresentationWithError:(id *)a3
{
  id v9 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  v6 = v5;
  if (v4)
  {
    id v7 = v4;
  }
  else if (a3)
  {
    *a3 = v5;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(unint64_t)a3
{
  self->_messageVersion = a3;
}

@end