@interface APAdRequestParameters
+ (BOOL)supportsSecureCoding;
- (APAdRequestParameters)initWithCoder:(id)a3;
- (APAdRequestParameters)initWithContext:(id)a3 bundleID:(id)a4 identifier:(id)a5 placement:(int64_t)a6 completionHandler:(id)a7;
- (APContext)context;
- (NSString)bundleID;
- (NSUUID)identifier;
- (double)timestamp;
- (id)completionHandler;
- (int64_t)placementType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APAdRequestParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APAdRequestParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APAdRequestParameters;
  v5 = [(APAdRequestParameters *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    context = v5->_context;
    v5->_context = (APContext *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    v5->_placementType = (int64_t)[v4 decodeIntegerForKey:@"placementType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(APAdRequestParameters *)self context];
  [v7 encodeObject:v4 forKey:@"context"];

  v5 = [(APAdRequestParameters *)self identifier];
  [v7 encodeObject:v5 forKey:@"identifier"];

  [v7 encodeInteger:-[APAdRequestParameters placementType](self, "placementType") forKey:@"placementType"];
  uint64_t v6 = [(APAdRequestParameters *)self bundleID];
  [v7 encodeObject:v6 forKey:@"bundleID"];

  [(APAdRequestParameters *)self timestamp];
  [v7 encodeDouble:@"timestamp"];
}

- (APAdRequestParameters)initWithContext:(id)a3 bundleID:(id)a4 identifier:(id)a5 placement:(int64_t)a6 completionHandler:(id)a7
{
  double v12 = (APContext *)a3;
  v13 = (NSString *)a4;
  objc_super v14 = (NSUUID *)a5;
  v26.receiver = self;
  v26.super_class = (Class)APAdRequestParameters;
  id v15 = a7;
  v16 = [(APAdRequestParameters *)&v26 init];
  context = v16->_context;
  v16->_context = v12;
  v18 = v12;

  bundleID = v16->_bundleID;
  v16->_bundleID = v13;
  v20 = v13;

  identifier = v16->_identifier;
  v16->_identifier = v14;
  v22 = v14;

  v16->_placementType = a6;
  id v23 = objc_retainBlock(v15);

  id completionHandler = v16->_completionHandler;
  v16->_id completionHandler = v23;

  v16->_timestamp = CFAbsoluteTimeGetCurrent();
  return v16;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (APContext)context
{
  return self->_context;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)placementType
{
  return self->_placementType;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end