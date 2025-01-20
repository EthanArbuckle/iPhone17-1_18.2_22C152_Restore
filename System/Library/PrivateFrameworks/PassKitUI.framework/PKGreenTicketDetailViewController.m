@interface PKGreenTicketDetailViewController
- (PKFelicaPassProperties)properties;
- (PKGreenTicketDetailViewController)initWithFelicaProperty:(id)a3;
- (id)titleForLeg:(unint64_t)a3;
- (id)transitTicketDetailTitleForRow:(unint64_t)a3 leg:(unint64_t)a4;
- (id)transitTicketDetailValueForRow:(unint64_t)a3 leg:(unint64_t)a4;
- (int64_t)transitTicketDetailNumberOfRowsForLeg:(unint64_t)a3;
- (unint64_t)numberOfLegs;
@end

@implementation PKGreenTicketDetailViewController

- (PKGreenTicketDetailViewController)initWithFelicaProperty:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKGreenTicketDetailViewController;
  v5 = [(PKTransitTicketDetailViewController *)&v9 initWithTransitTicketDetailDataSource:self];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    properties = v5->_properties;
    v5->_properties = (PKFelicaPassProperties *)v6;
  }
  return v5;
}

- (unint64_t)numberOfLegs
{
  return 1;
}

- (id)titleForLeg:(unint64_t)a3
{
  return 0;
}

- (int64_t)transitTicketDetailNumberOfRowsForLeg:(unint64_t)a3
{
  return 3;
}

- (id)transitTicketDetailTitleForRow:(unint64_t)a3 leg:(unint64_t)a4
{
  if (a3 > 2)
  {
    v5 = 0;
  }
  else
  {
    v5 = PKLocalizedPaymentString(&off_1E59CDE80[a3]->isa);
  }
  return v5;
}

- (id)transitTicketDetailValueForRow:(unint64_t)a3 leg:(unint64_t)a4
{
  uint64_t v6 = [(PKGreenTicketDetailViewController *)self properties];
  v7 = [v6 greenCarValidityStartDate];
  v8 = [v7 date];

  switch(a3)
  {
    case 2uLL:
      v11 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v8 dateStyle:3 timeStyle:0];
      goto LABEL_9;
    case 1uLL:
      objc_super v9 = [(PKGreenTicketDetailViewController *)self properties];
      uint64_t v10 = [v9 greenCarDestinationStation];
      goto LABEL_7;
    case 0uLL:
      objc_super v9 = [(PKGreenTicketDetailViewController *)self properties];
      uint64_t v10 = [v9 greenCarOriginStation];
LABEL_7:
      v11 = (void *)v10;

      goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (PKFelicaPassProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end