@interface CarLoadingGuidanceSign
- (CarLoadingGuidanceSign)initWithDestination:(unint64_t)a3;
@end

@implementation CarLoadingGuidanceSign

- (CarLoadingGuidanceSign)initWithDestination:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CarLoadingGuidanceSign;
  v3 = [(CarSpinnerGuidanceSign *)&v7 initWithDestination:a3];
  if (v3)
  {
    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"Loading... [CarPlay]" value:@"localized string not found" table:0];
    [(CarSpinnerGuidanceSign *)v3 setPrimaryString:v5];
  }
  return v3;
}

@end