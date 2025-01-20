@interface ATXLocationManagerKnownLOIs
+ (BOOL)supportsSecureCoding;
- (ATXLocationManagerKnownLOIs)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXLocationManagerKnownLOIs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  Home = self->Home;
  id v5 = a3;
  [v5 encodeObject:Home forKey:@"Home"];
  [v5 encodeObject:self->Work forKey:@"Work"];
  [v5 encodeObject:self->School forKey:@"School"];
  [v5 encodeObject:self->Gym forKey:@"Gym"];
}

- (ATXLocationManagerKnownLOIs)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXLocationManagerKnownLOIs;
  id v5 = [(ATXLocationManagerKnownLOIs *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Home"];
    Home = v5->Home;
    v5->Home = (CLLocation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Work"];
    Work = v5->Work;
    v5->Work = (CLLocation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"School"];
    School = v5->School;
    v5->School = (CLLocation *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Gym"];
    Gym = v5->Gym;
    v5->Gym = (CLLocation *)v12;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->Gym, 0);
  objc_storeStrong((id *)&self->School, 0);
  objc_storeStrong((id *)&self->Work, 0);

  objc_storeStrong((id *)&self->Home, 0);
}

@end