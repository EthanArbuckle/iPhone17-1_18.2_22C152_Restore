@interface KTOptIOLogState
- (BOOL)optIn;
- (KTOptIOLogState)initWithURI:(id)a3 smtTimestamp:(id)a4 optIn:(BOOL)a5;
- (NSDate)smtTimestamp;
- (NSString)uri;
- (id)description;
- (void)setOptIn:(BOOL)a3;
- (void)setSmtTimestamp:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation KTOptIOLogState

- (KTOptIOLogState)initWithURI:(id)a3 smtTimestamp:(id)a4 optIn:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KTOptIOLogState;
  v10 = [(KTOptIOLogState *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(KTOptIOLogState *)v10 setUri:v8];
    [(KTOptIOLogState *)v11 setSmtTimestamp:v9];
    [(KTOptIOLogState *)v11 setOptIn:v5];
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(KTOptIOLogState *)self uri];
  BOOL v5 = [(KTOptIOLogState *)self smtTimestamp];
  v6 = [v3 stringWithFormat:@"<KTOptIOLogState: %@ smtTimestamp: %@ state: %d>", v4, v5, -[KTOptIOLogState optIn](self, "optIn")];

  return v6;
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUri:(id)a3
{
}

- (NSDate)smtTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSmtTimestamp:(id)a3
{
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smtTimestamp, 0);

  objc_storeStrong((id *)&self->_uri, 0);
}

@end