@interface SAWeatherLocationAddCompleted
+ (id)locationAddCompleted;
+ (id)locationAddCompletedWithError:(id)a3;
+ (id)locationAddCompletedWithWeatherLocationId:(id)a3;
- (BOOL)requiresResponse;
- (NSString)error;
- (NSURL)weatherLocationId;
- (SAWeatherLocationAddCompleted)initWithError:(id)a3;
- (SAWeatherLocationAddCompleted)initWithWeatherLocationId:(id)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setError:(id)a3;
- (void)setWeatherLocationId:(id)a3;
@end

@implementation SAWeatherLocationAddCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"LocationAddCompleted";
}

+ (id)locationAddCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)locationAddCompletedWithError:(id)a3
{
  id v3 = a3;
  v4 = [[SAWeatherLocationAddCompleted alloc] initWithError:v3];

  return v4;
}

+ (id)locationAddCompletedWithWeatherLocationId:(id)a3
{
  id v3 = a3;
  v4 = [[SAWeatherLocationAddCompleted alloc] initWithWeatherLocationId:v3];

  return v4;
}

- (SAWeatherLocationAddCompleted)initWithError:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAWeatherLocationAddCompleted *)v5 setError:v4];
  }

  return v6;
}

- (SAWeatherLocationAddCompleted)initWithWeatherLocationId:(id)a3
{
  id v4 = a3;
  v5 = [(AceObject *)self init];
  v6 = v5;
  if (v5) {
    [(SAWeatherLocationAddCompleted *)v5 setWeatherLocationId:v4];
  }

  return v6;
}

- (NSString)error
{
  return (NSString *)[(AceObject *)self propertyForKey:@"error"];
}

- (void)setError:(id)a3
{
}

- (NSURL)weatherLocationId
{
  return (NSURL *)AceObjectURLForProperty(self, @"weatherLocationId");
}

- (void)setWeatherLocationId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end