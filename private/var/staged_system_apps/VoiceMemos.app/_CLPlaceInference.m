@interface _CLPlaceInference
+ (void)initialize;
- (CLLocation)location;
- (NSString)preferredName;
@end

@implementation _CLPlaceInference

+ (void)initialize
{
  v2 = (void *)qword_10026A818;
  qword_10026A818 = (uint64_t)&off_10022D910;
}

- (CLLocation)location
{
  return (CLLocation *)[(_CLPlaceInference *)self referenceLocation];
}

- (NSString)preferredName
{
  v3 = [(_CLPlaceInference *)self placemark];
  v4 = [v3 name];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  id v7 = [(_CLPlaceInference *)self userType];
  if (v7)
  {
    id v6 = [(id)qword_10026A818 objectAtIndexedSubscript:v7];
    goto LABEL_5;
  }
  v10 = [v3 subThoroughfare];
  uint64_t v11 = [v3 thoroughfare];
  v12 = (void *)v11;
  v8 = 0;
  if (v10 && v11)
  {
    v8 = +[NSString stringWithFormat:@"%@ %@", v10, v11];
  }

LABEL_6:

  return (NSString *)v8;
}

@end