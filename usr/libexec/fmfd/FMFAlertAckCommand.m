@interface FMFAlertAckCommand
- (BOOL)ignoreResponseErrors;
- (BOOL)responseContainsFullModelUpdate;
- (FMFAlertAckCommand)initWithAlertId:(id)a3;
- (NSString)alertId;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setAlertId:(id)a3;
@end

@implementation FMFAlertAckCommand

- (FMFAlertAckCommand)initWithAlertId:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFAlertAckCommand;
  v5 = [(FMFBaseCmd *)&v8 initWithClientSession:0];
  v6 = v5;
  if (v5) {
    [(FMFAlertAckCommand *)v5 setAlertId:v4];
  }

  return v6;
}

- (BOOL)ignoreResponseErrors
{
  return 1;
}

- (BOOL)responseContainsFullModelUpdate
{
  return 0;
}

- (id)pathSuffix
{
  return @"ackAlert";
}

- (id)jsonBodyDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)FMFAlertAckCommand;
  v3 = [(FMFBaseCmd *)&v6 jsonBodyDictionary];
  id v4 = [(FMFAlertAckCommand *)self alertId];
  [v3 setObject:v4 forKey:@"alertId"];

  return v3;
}

- (NSString)alertId
{
  return self->_alertId;
}

- (void)setAlertId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end