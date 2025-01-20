@interface STMutableStewieStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setStewieActive:(BOOL)a3;
- (void)setStewieConnected:(BOOL)a3;
@end

@implementation STMutableStewieStatusDomainData

- (void)setStewieActive:(BOOL)a3
{
  if (self->super._stewieActive != a3) {
    self->super._stewieActive = a3;
  }
}

- (void)setStewieConnected:(BOOL)a3
{
  if (self->super._stewieConnected != a3) {
    self->super._stewieConnected = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[STStewieStatusDomainData allocWithZone:a3];

  return -[STStewieStatusDomainData initWithData:](v4, self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableData:self];
  }

  return isKindOfClass & 1;
}

@end