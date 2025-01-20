@interface FMDRequestAccessoryLocations
- (BOOL)canReplace:(id)a3;
- (FMDRequestAccessoryLocations)initWithAccount:(id)a3 accessoryLocations:(id)a4;
- (NSArray)accessoryLocations;
- (id)requestBody;
- (id)urlTemplateType;
- (void)setAccessoryLocations:(id)a3;
@end

@implementation FMDRequestAccessoryLocations

- (FMDRequestAccessoryLocations)initWithAccount:(id)a3 accessoryLocations:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMDRequestAccessoryLocations;
  v7 = [(FMDRequest *)&v10 initWithAccount:a3];
  v8 = v7;
  if (v7) {
    [(FMDRequestAccessoryLocations *)v7 setAccessoryLocations:v6];
  }

  return v8;
}

- (id)urlTemplateType
{
  return @"lastKnownLocation";
}

- (id)requestBody
{
  v6.receiver = self;
  v6.super_class = (Class)FMDRequestAccessoryLocations;
  v3 = [(FMDRequest *)&v6 requestBody];
  v4 = [(FMDRequestAccessoryLocations *)self accessoryLocations];
  [v3 fm_safeSetObject:v4 forKey:@"locations"];

  return v3;
}

- (BOOL)canReplace:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)accessoryLocations
{
  return self->_accessoryLocations;
}

- (void)setAccessoryLocations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end