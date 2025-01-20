@interface PCSKeyClient
- (BOOL)circle;
- (BOOL)iCDP;
- (BOOL)isNewWatch;
- (NSData)lastHash;
- (NSDate)firstSync;
- (NSDate)lastSeen;
- (NSDate)lastSent;
- (NSString)buildVersion;
- (NSString)name;
- (NSString)uuid;
- (PCSKeyClient)initWithName:(id)a3 values:(id)a4 dsid:(id)a5;
- (id)getValues:(id)a3;
- (int)failures;
- (int64_t)numberHandshakes;
- (int64_t)protocolVersion;
- (void)setBuildVersion:(id)a3;
- (void)setCircle:(BOOL)a3;
- (void)setFailures:(int)a3;
- (void)setFirstSync:(id)a3;
- (void)setICDP:(BOOL)a3;
- (void)setIsNewWatch:(BOOL)a3;
- (void)setLastHash:(id)a3;
- (void)setLastSeen:(id)a3;
- (void)setLastSent:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberHandshakes:(int64_t)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)updateWithValues:(id)a3 dsid:(id)a4;
@end

@implementation PCSKeyClient

- (PCSKeyClient)initWithName:(id)a3 values:(id)a4 dsid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)PCSKeyClient;
    v11 = [(PCSKeyClient *)&v15 init];
    v12 = v11;
    if (v11)
    {
      [(PCSKeyClient *)v11 setUuid:v8];
      if (v9) {
        [(PCSKeyClient *)v12 updateWithValues:v9 dsid:v10];
      }
      else {
        [(PCSKeyClient *)v12 setIsNewWatch:1];
      }
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)updateWithValues:(id)a3 dsid:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = [v22 objectForKeyedSubscript:@"lastSeen"];
  [(PCSKeyClient *)self setLastSeen:v7];

  id v8 = [v22 objectForKeyedSubscript:@"lastHash"];
  [(PCSKeyClient *)self setLastHash:v8];

  id v9 = [v22 objectForKeyedSubscript:@"name"];
  [(PCSKeyClient *)self setName:v9];

  id v10 = [v22 objectForKeyedSubscript:@"lastSent"];
  [(PCSKeyClient *)self setLastSent:v10];

  v11 = [v22 objectForKeyedSubscript:@"failures"];
  -[PCSKeyClient setFailures:](self, "setFailures:", [v11 intValue]);

  v12 = [v22 objectForKeyedSubscript:@"numberHandshakes"];
  -[PCSKeyClient setNumberHandshakes:](self, "setNumberHandshakes:", [v12 longValue]);

  v13 = [v22 objectForKeyedSubscript:@"buildVersion"];
  [(PCSKeyClient *)self setBuildVersion:v13];

  v14 = [v22 objectForKeyedSubscript:@"firstSync"];
  [(PCSKeyClient *)self setFirstSync:v14];

  objc_super v15 = [v22 objectForKeyedSubscript:@"protocol"];
  -[PCSKeyClient setProtocolVersion:](self, "setProtocolVersion:", [v15 longValue]);

  if (v6
    && ([v22 objectForKeyedSubscript:@"dsid"],
        v16 = objc_claimAutoreleasedReturnValue(),
        unsigned int v17 = [v16 isEqualToString:v6],
        v16,
        v17))
  {
    v18 = [v22 objectForKeyedSubscript:@"iCDP2"];
    -[PCSKeyClient setICDP:](self, "setICDP:", [v18 BOOLValue]);

    v19 = [v22 objectForKeyedSubscript:@"circle2"];
    -[PCSKeyClient setCircle:](self, "setCircle:", [v19 BOOLValue]);

    uint64_t v20 = [v22 objectForKeyedSubscript:@"firstSync"];
  }
  else
  {
    [(PCSKeyClient *)self setICDP:0];
    [(PCSKeyClient *)self setCircle:0];
    uint64_t v20 = +[NSDate date];
  }
  v21 = (void *)v20;
  [(PCSKeyClient *)self setFirstSync:v20];
}

- (id)getValues:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [(PCSKeyClient *)self uuid];

  if (v5)
  {
    if (!v4) {
      v4 = &stru_100039C58;
    }
    id v6 = [(PCSKeyClient *)self lastSeen];

    if (!v6)
    {
      v7 = +[NSDate date];
      [(PCSKeyClient *)self setLastSeen:v7];
    }
    id v8 = [(PCSKeyClient *)self lastHash];

    if (!v8)
    {
      id v9 = +[NSData data];
      [(PCSKeyClient *)self setLastHash:v9];
    }
    id v10 = [(PCSKeyClient *)self name];

    if (!v10)
    {
      v11 = [(PCSKeyClient *)self uuid];
      [(PCSKeyClient *)self setName:v11];
    }
    v12 = [(PCSKeyClient *)self buildVersion];

    if (!v12) {
      [(PCSKeyClient *)self setBuildVersion:@"0"];
    }
    v30[0] = @"lastSeen";
    v29 = [(PCSKeyClient *)self lastSeen];
    v31[0] = v29;
    v30[1] = @"lastHash";
    v28 = [(PCSKeyClient *)self lastHash];
    v31[1] = v28;
    v30[2] = @"name";
    v27 = [(PCSKeyClient *)self name];
    v31[2] = v27;
    v30[3] = @"failures";
    v13 = +[NSNumber numberWithInt:[(PCSKeyClient *)self failures]];
    v31[3] = v13;
    v30[4] = @"numberHandshakes";
    v14 = +[NSNumber numberWithLong:[(PCSKeyClient *)self numberHandshakes]];
    v31[4] = v14;
    v30[5] = @"buildVersion";
    objc_super v15 = [(PCSKeyClient *)self buildVersion];
    v31[5] = v15;
    v30[6] = @"protocol";
    v16 = +[NSNumber numberWithLong:[(PCSKeyClient *)self protocolVersion]];
    v31[6] = v16;
    v30[7] = @"iCDP2";
    unsigned int v17 = +[NSNumber numberWithBool:[(PCSKeyClient *)self iCDP]];
    v31[7] = v17;
    v30[8] = @"circle2";
    v18 = +[NSNumber numberWithBool:[(PCSKeyClient *)self circle]];
    v30[9] = @"dsid";
    v31[8] = v18;
    v31[9] = v4;
    v19 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:10];
    uint64_t v20 = [v26 dictionaryWithDictionary:v19];

    v21 = [(PCSKeyClient *)self lastSent];

    if (v21)
    {
      id v22 = [(PCSKeyClient *)self lastSent];
      [v20 setObject:v22 forKey:@"lastSent"];
    }
    v23 = [(PCSKeyClient *)self firstSync];

    if (v23)
    {
      v24 = [(PCSKeyClient *)self firstSync];
      [v20 setObject:v24 forKey:@"firstSync"];
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuildVersion:(id)a3
{
}

- (NSDate)firstSync
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFirstSync:(id)a3
{
}

- (NSDate)lastSeen
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastSeen:(id)a3
{
}

- (NSData)lastHash
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastHash:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
}

- (int)failures
{
  return self->_failures;
}

- (void)setFailures:(int)a3
{
  self->_failures = a3;
}

- (NSDate)lastSent
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastSent:(id)a3
{
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (BOOL)iCDP
{
  return self->_iCDP;
}

- (void)setICDP:(BOOL)a3
{
  self->_iCDP = a3;
}

- (BOOL)circle
{
  return self->_circle;
}

- (void)setCircle:(BOOL)a3
{
  self->_circle = a3;
}

- (BOOL)isNewWatch
{
  return self->_isNewWatch;
}

- (void)setIsNewWatch:(BOOL)a3
{
  self->_isNewWatch = a3;
}

- (int64_t)numberHandshakes
{
  return self->_numberHandshakes;
}

- (void)setNumberHandshakes:(int64_t)a3
{
  self->_numberHandshakes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSent, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastHash, 0);
  objc_storeStrong((id *)&self->_lastSeen, 0);
  objc_storeStrong((id *)&self->_firstSync, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end