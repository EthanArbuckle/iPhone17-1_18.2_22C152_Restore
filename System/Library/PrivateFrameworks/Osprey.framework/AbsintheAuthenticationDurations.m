@interface AbsintheAuthenticationDurations
- (AbsintheAuthenticationDurations)init;
- (NSMutableDictionary)absintheTimestamps;
- (NSMutableString)connectionMethod;
- (NSNumber)absintheElapsed;
- (NSNumber)createSessionElapsed;
- (NSNumber)getCertificateElapsed;
- (NSNumber)sessionEstablishedElapsed;
- (id)calculateDuration:(id)a3 and:(id)a4;
- (void)reportAbsintheAuthenticationDurations;
- (void)setAbsintheAuthenticationTimestampForKey:(id)a3;
- (void)setAbsintheConnectionMethodWith:(id)a3;
- (void)setAbsintheElapsed:(id)a3;
- (void)setAbsintheTimestamps:(id)a3;
- (void)setConnectionMethod:(id)a3;
- (void)setCreateSessionElapsed:(id)a3;
- (void)setGetCertificateElapsed:(id)a3;
- (void)setSessionEstablishedElapsed:(id)a3;
@end

@implementation AbsintheAuthenticationDurations

- (AbsintheAuthenticationDurations)init
{
  v8.receiver = self;
  v8.super_class = (Class)AbsintheAuthenticationDurations;
  v2 = [(AbsintheAuthenticationDurations *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    absintheTimestamps = v2->_absintheTimestamps;
    v2->_absintheTimestamps = v3;

    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    connectionMethod = v2->_connectionMethod;
    v2->_connectionMethod = v5;
  }
  return v2;
}

- (void)reportAbsintheAuthenticationDurations
{
  v3 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v4 = [v3 objectForKey:@"GetCertificateStart"];
  v5 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v6 = [v5 objectForKey:@"GetCertificateEnd"];
  v7 = [(AbsintheAuthenticationDurations *)self calculateDuration:v4 and:v6];
  [(AbsintheAuthenticationDurations *)self setGetCertificateElapsed:v7];

  objc_super v8 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v9 = [v8 objectForKey:@"CreateSessionStart"];
  v10 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v11 = [v10 objectForKey:@"CreateSessionEnd"];
  v12 = [(AbsintheAuthenticationDurations *)self calculateDuration:v9 and:v11];
  [(AbsintheAuthenticationDurations *)self setCreateSessionElapsed:v12];

  v13 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v14 = [v13 objectForKey:@"SessionEstablishedStart"];
  v15 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v16 = [v15 objectForKey:@"SessionEstablishedEnd"];
  v17 = [(AbsintheAuthenticationDurations *)self calculateDuration:v14 and:v16];
  [(AbsintheAuthenticationDurations *)self setSessionEstablishedElapsed:v17];

  v18 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v19 = [v18 objectForKey:@"GetCertificateStart"];
  v20 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v21 = [v20 objectForKey:@"FinalSignedData"];
  v22 = [(AbsintheAuthenticationDurations *)self calculateDuration:v19 and:v21];
  [(AbsintheAuthenticationDurations *)self setAbsintheElapsed:v22];

  id v23 = +[OspreyAnalytics reporter];
  [v23 reportAbsintheMetrics:self];
}

- (void)setAbsintheAuthenticationTimestampForKey:(id)a3
{
  id v4 = a3;
  v5 = [(AbsintheAuthenticationDurations *)self absintheTimestamps];
  v6 = NSNumber;
  uint64_t v7 = mach_absolute_time();
  objc_super v8 = [v6 numberWithUnsignedLongLong:OspreyMachAbsoluteTimeGetNanoseconds(v7)];
  [v5 setObject:v8 forKey:v4];

  LODWORD(v5) = [v4 isEqualToString:@"FinalSignedData"];
  if (v5)
  {
    v9 = [(AbsintheAuthenticationDurations *)self connectionMethod];

    if (v9)
    {
      [(AbsintheAuthenticationDurations *)self reportAbsintheAuthenticationDurations];
    }
  }
}

- (void)setAbsintheConnectionMethodWith:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(AbsintheAuthenticationDurations *)self setConnectionMethod:v4];
}

- (id)calculateDuration:(id)a3 and:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 longLongValue];
  uint64_t v7 = [v5 longLongValue];

  if ((unint64_t)(v6 - v7) > 0xE8D4A50FFFLL)
  {
    objc_super v8 = &unk_1F1A03650;
  }
  else
  {
    objc_super v8 = objc_msgSend(NSNumber, "numberWithLong:");
  }

  return v8;
}

- (NSMutableDictionary)absintheTimestamps
{
  return self->_absintheTimestamps;
}

- (void)setAbsintheTimestamps:(id)a3
{
}

- (NSMutableString)connectionMethod
{
  return self->_connectionMethod;
}

- (void)setConnectionMethod:(id)a3
{
}

- (NSNumber)getCertificateElapsed
{
  return self->_getCertificateElapsed;
}

- (void)setGetCertificateElapsed:(id)a3
{
}

- (NSNumber)createSessionElapsed
{
  return self->_createSessionElapsed;
}

- (void)setCreateSessionElapsed:(id)a3
{
}

- (NSNumber)sessionEstablishedElapsed
{
  return self->_sessionEstablishedElapsed;
}

- (void)setSessionEstablishedElapsed:(id)a3
{
}

- (NSNumber)absintheElapsed
{
  return self->_absintheElapsed;
}

- (void)setAbsintheElapsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absintheElapsed, 0);
  objc_storeStrong((id *)&self->_sessionEstablishedElapsed, 0);
  objc_storeStrong((id *)&self->_createSessionElapsed, 0);
  objc_storeStrong((id *)&self->_getCertificateElapsed, 0);
  objc_storeStrong((id *)&self->_connectionMethod, 0);

  objc_storeStrong((id *)&self->_absintheTimestamps, 0);
}

@end