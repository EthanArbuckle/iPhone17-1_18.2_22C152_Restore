@interface RCEndpointConfig
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSURL)develURL;
- (NSURL)productionURL;
- (NSURL)qaURL;
- (NSURL)stagingURL;
- (NSURL)testURL;
- (RCEndpointConfig)initWithEnvironment:(unint64_t)a3 productionURL:(id)a4 stagingURL:(id)a5 qaURL:(id)a6 develURL:(id)a7 testURL:(id)a8;
- (id)dictionaryRepresentation;
- (id)environmentDescription;
- (unint64_t)environment;
- (unint64_t)hash;
@end

@implementation RCEndpointConfig

- (RCEndpointConfig)initWithEnvironment:(unint64_t)a3 productionURL:(id)a4 stagingURL:(id)a5 qaURL:(id)a6 develURL:(id)a7 testURL:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)RCEndpointConfig;
  v18 = [(RCEndpointConfig *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_environment = a3;
    objc_storeStrong((id *)&v18->_productionURL, a4);
    objc_storeStrong((id *)&v19->_stagingURL, a5);
    objc_storeStrong((id *)&v19->_qaURL, a6);
    objc_storeStrong((id *)&v19->_develURL, a7);
    objc_storeStrong((id *)&v19->_testURL, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(RCEndpointConfig *)self environment];
    if (v6 == [v5 environment])
    {
      v7 = [(RCEndpointConfig *)self productionURL];
      v8 = [v5 productionURL];
      if ([v7 isEqual:v8])
      {
        v9 = [(RCEndpointConfig *)self stagingURL];
        v10 = [v5 stagingURL];
        if ([v9 isEqual:v10])
        {
          v11 = [(RCEndpointConfig *)self qaURL];
          v12 = [v5 qaURL];
          if ([v11 isEqual:v12])
          {
            v13 = [(RCEndpointConfig *)self develURL];
            v19 = [v5 develURL];
            if (objc_msgSend(v13, "isEqual:"))
            {
              id v17 = [(RCEndpointConfig *)self testURL];
              [v5 testURL];
              v14 = v18 = v13;
              char v15 = [v17 isEqual:v14];

              v13 = v18;
            }
            else
            {
              char v15 = 0;
            }
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCEndpointConfig environment](self, "environment"));
  uint64_t v4 = [v3 hash];
  id v5 = [(RCEndpointConfig *)self productionURL];
  uint64_t v6 = [v5 hash];
  v7 = [(RCEndpointConfig *)self stagingURL];
  uint64_t v8 = v6 ^ [v7 hash];
  v9 = [(RCEndpointConfig *)self qaURL];
  uint64_t v10 = v8 ^ [v9 hash];
  v11 = [(RCEndpointConfig *)self develURL];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(RCEndpointConfig *)self testURL];
  unint64_t v14 = v12 ^ [v13 hash] ^ v4;

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(RCEndpointConfig *)self environmentDescription];
  uint64_t v6 = [(RCEndpointConfig *)self productionURL];
  v7 = [(RCEndpointConfig *)self stagingURL];
  uint64_t v8 = [(RCEndpointConfig *)self qaURL];
  v9 = [(RCEndpointConfig *)self develURL];
  uint64_t v10 = [(RCEndpointConfig *)self testURL];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; environment: %@\n productionURL: %@\n stagingURL: %@\n qaURL: %@\n develURL: %@\n testURL: %@\n>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return (NSString *)v11;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCEndpointConfig environment](self, "environment"));
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, @"environment");

  id v5 = [(RCEndpointConfig *)self productionURL];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, @"productionURL");

  uint64_t v6 = [(RCEndpointConfig *)self stagingURL];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, @"stagingURL");

  v7 = [(RCEndpointConfig *)self qaURL];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v7, @"qaURL");

  uint64_t v8 = [(RCEndpointConfig *)self develURL];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v8, @"develURL");

  v9 = [(RCEndpointConfig *)self testURL];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v9, @"testURL");

  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (id)environmentDescription
{
  unint64_t v2 = [(RCEndpointConfig *)self environment];
  if (v2 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5B76D40[v2];
  }
}

- (unint64_t)environment
{
  return self->_environment;
}

- (NSURL)productionURL
{
  return self->_productionURL;
}

- (NSURL)stagingURL
{
  return self->_stagingURL;
}

- (NSURL)qaURL
{
  return self->_qaURL;
}

- (NSURL)develURL
{
  return self->_develURL;
}

- (NSURL)testURL
{
  return self->_testURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testURL, 0);
  objc_storeStrong((id *)&self->_develURL, 0);
  objc_storeStrong((id *)&self->_qaURL, 0);
  objc_storeStrong((id *)&self->_stagingURL, 0);

  objc_storeStrong((id *)&self->_productionURL, 0);
}

@end