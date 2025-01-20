@interface RoutePlanningVehicleSelectionTableViewCell
- (void)setupWithVehicle:(id)a3;
@end

@implementation RoutePlanningVehicleSelectionTableViewCell

- (void)setupWithVehicle:(id)a3
{
  id v4 = a3;
  v5 = [v4 displayName];
  [(UILabel *)self->_textLabel setText:v5];

  id v6 = [v4 licensePlate];

  [(UILabel *)self->_detailTextLabel setText:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextLabel, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end