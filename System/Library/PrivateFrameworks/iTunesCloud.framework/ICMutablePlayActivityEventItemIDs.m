@interface ICMutablePlayActivityEventItemIDs
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCloudID:(unint64_t)a3;
- (void)setEquivalencySourceAdamID:(int64_t)a3;
- (void)setLyricsID:(id)a3;
- (void)setPurchasedAdamID:(int64_t)a3;
- (void)setRadioAdamID:(int64_t)a3;
- (void)setReportingAdamID:(int64_t)a3;
- (void)setSubscriptionAdamID:(int64_t)a3;
@end

@implementation ICMutablePlayActivityEventItemIDs

- (void)setSubscriptionAdamID:(int64_t)a3
{
  self->super._subscriptionAdamID = a3;
}

- (void)setReportingAdamID:(int64_t)a3
{
  self->super._reportingAdamID = a3;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  self->super._equivalencySourceAdamID = a3;
}

- (void)setRadioAdamID:(int64_t)a3
{
  self->super._radioAdamID = a3;
}

- (void)setPurchasedAdamID:(int64_t)a3
{
  self->super._purchasedAdamID = a3;
}

- (void)setLyricsID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  lyricsID = self->super._lyricsID;
  self->super._lyricsID = v4;

  MEMORY[0x1F41817F8](v4, lyricsID);
}

- (void)setCloudID:(unint64_t)a3
{
  self->super._cloudID = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(ICPlayActivityEventItemIDs *)self _copyWithClass:v4];
}

@end