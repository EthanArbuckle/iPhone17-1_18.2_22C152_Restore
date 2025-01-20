@interface RestaurantReservationConfirmationViewControllerSection
- (NSString)sectionText;
- (NSString)sectionTitle;
- (void)setSectionText:(id)a3;
- (void)setSectionTitle:(id)a3;
@end

@implementation RestaurantReservationConfirmationViewControllerSection

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (NSString)sectionText
{
  return self->_sectionText;
}

- (void)setSectionText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionText, 0);

  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end