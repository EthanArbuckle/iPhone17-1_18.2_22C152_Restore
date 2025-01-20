@interface MOContextTimeMetaData
+ (BOOL)supportsSecureCoding;
- (MOContextTimeMetaData)init;
- (MOContextTimeMetaData)initWithCoder:(id)a3;
- (MOContextTimeMetaData)initWithTimeReferenceString:(id)a3;
- (NSString)timeReferenceString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOContextTimeMetaData

- (MOContextTimeMetaData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOContextTimeMetaData;
  return [(MOContextTimeMetaData *)&v3 init];
}

- (MOContextTimeMetaData)initWithTimeReferenceString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextTimeMetaData;
  v6 = [(MOContextTimeMetaData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timeReferenceString, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOContextTimeMetaData alloc];
  id v5 = [(MOContextTimeMetaData *)self timeReferenceString];
  v6 = [(MOContextTimeMetaData *)v4 initWithTimeReferenceString:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MOContextTimeMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeReferenceString"];

  v6 = [(MOContextTimeMetaData *)self initWithTimeReferenceString:v5];
  return v6;
}

- (id)description
{
  v2 = NSString;
  objc_super v3 = [(MOContextTimeMetaData *)self timeReferenceString];
  id v4 = [v3 mask];
  id v5 = [v2 stringWithFormat:@"time string, %@", v4];

  return v5;
}

- (NSString)timeReferenceString
{
  return self->_timeReferenceString;
}

- (void).cxx_destruct
{
}

@end