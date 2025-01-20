@interface ActivitySharingFriendDetailPaletteDateProvider
- (NSDate)currentSelectedDate;
- (void)setCurrentSelectedDate:(id)a3;
- (void)setWithCurrentSelectedDate:(id)a3 caller:(id)a4;
@end

@implementation ActivitySharingFriendDetailPaletteDateProvider

- (NSDate)currentSelectedDate
{
  return (NSDate *)*(id *)self->currentSelectedDate;
}

- (void)setCurrentSelectedDate:(id)a3
{
  id v4 = *(id *)self->currentSelectedDate;
  *(void *)self->currentSelectedDate = a3;
  id v3 = a3;
}

- (void)setWithCurrentSelectedDate:(id)a3 caller:(id)a4
{
  id v5 = *(id *)self->currentSelectedDate;
  *(void *)self->currentSelectedDate = a3;
  id v4 = a3;
}

@end