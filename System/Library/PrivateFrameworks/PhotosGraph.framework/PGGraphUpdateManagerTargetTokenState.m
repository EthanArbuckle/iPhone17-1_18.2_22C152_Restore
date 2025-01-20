@interface PGGraphUpdateManagerTargetTokenState
- (BOOL)encounteredTargetToken;
- (PGGraphUpdateManagerTargetTokenState)initWithPersistentChangeToken:(id)a3;
- (PHPersistentChangeToken)changeToken;
- (id)description;
- (void)setEncounteredTargetToken:(BOOL)a3;
@end

@implementation PGGraphUpdateManagerTargetTokenState

- (void).cxx_destruct
{
}

- (void)setEncounteredTargetToken:(BOOL)a3
{
  self->_encounteredTargetToken = a3;
}

- (BOOL)encounteredTargetToken
{
  return self->_encounteredTargetToken;
}

- (PHPersistentChangeToken)changeToken
{
  return self->_changeToken;
}

- (id)description
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PGGraphUpdateManagerTargetTokenState encounteredTargetToken](self, "encounteredTargetToken"));
  v5 = [(PGGraphUpdateManagerTargetTokenState *)self changeToken];
  v6 = [v3 stringWithFormat:@"Encountered token state: %@, target token: %@", v4, v5];

  return v6;
}

- (PGGraphUpdateManagerTargetTokenState)initWithPersistentChangeToken:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphUpdateManagerTargetTokenState;
  v5 = [(PGGraphUpdateManagerTargetTokenState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    changeToken = v5->_changeToken;
    v5->_changeToken = (PHPersistentChangeToken *)v6;
  }
  return v5;
}

@end