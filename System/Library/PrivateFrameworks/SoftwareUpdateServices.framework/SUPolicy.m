@interface SUPolicy
- (BOOL)allowExpensiveNetwork;
- (BOOL)allowsCellular;
- (BOOL)discretionary;
- (BOOL)requiresPowerPluggedIn;
- (BOOL)skipPhase;
- (NSDictionary)additionalOptions;
- (id)_stringForBool:(BOOL)a3;
- (id)description;
- (int)downloadTimeoutSecs;
@end

@implementation SUPolicy

- (BOOL)discretionary
{
  return 0;
}

- (BOOL)allowsCellular
{
  return 1;
}

- (BOOL)allowExpensiveNetwork
{
  return 1;
}

- (BOOL)requiresPowerPluggedIn
{
  return 0;
}

- (int)downloadTimeoutSecs
{
  return -1;
}

- (BOOL)skipPhase
{
  return 0;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(SUPolicy *)self _stringForBool:[(SUPolicy *)self discretionary]];
  v5 = [(SUPolicy *)self _stringForBool:[(SUPolicy *)self allowsCellular]];
  v6 = [(SUPolicy *)self _stringForBool:[(SUPolicy *)self requiresPowerPluggedIn]];
  v7 = [v3 stringWithFormat:@"\n            discretionary: %@\n            allowsCellular: %@\n            requiresPowerPluggedIn: %@\n            downloadTimeoutSecs: %d", v4, v5, v6, -[SUPolicy downloadTimeoutSecs](self, "downloadTimeoutSecs")];

  return v7;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void).cxx_destruct
{
}

@end