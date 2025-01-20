@interface MOEventStateOfMind
+ (BOOL)supportsSecureCoding;
- (MOEventStateOfMind)initWithCoder:(id)a3;
- (NSArray)domains;
- (NSArray)labels;
- (double)reflectiveInterval;
- (double)valence;
- (double)valenceClassification;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDomains:(id)a3;
- (void)setLabels:(id)a3;
- (void)setReflectiveInterval:(double)a3;
- (void)setValence:(double)a3;
- (void)setValenceClassification:(double)a3;
@end

@implementation MOEventStateOfMind

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double reflectiveInterval = self->_reflectiveInterval;
  id v5 = a3;
  [v5 encodeDouble:@"reflectiveInterval" forKey:reflectiveInterval];
  [v5 encodeDouble:@"valence" forKey:self->_valence];
  [v5 encodeDouble:@"valenceClassification" forKey:self->_valenceClassification];
  [v5 encodeObject:self->_labels forKey:@"labels"];
  [v5 encodeObject:self->_domains forKey:@"domains"];
}

- (MOEventStateOfMind)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MOEventStateOfMind;
  id v5 = [(MOEventStateOfMind *)&v22 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"reflectiveInterval"];
    v5->_double reflectiveInterval = v6;
    [v4 decodeDoubleForKey:@"valence"];
    v5->_valence = v7;
    [v4 decodeDoubleForKey:@"valenceClassification"];
    v5->_valenceClassification = v8;
    id v10 = objc_alloc((Class)NSSet);
    uint64_t v11 = objc_opt_class();
    id v12 = [v10 initWithObjects:v11, objc_opt_class(), 0];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"labels"];
    labels = v5->_labels;
    v5->_labels = (NSArray *)v13;

    id v16 = objc_alloc((Class)NSSet);
    uint64_t v17 = objc_opt_class();
    id v18 = [v16 initWithObjects:v17, objc_opt_class(), 0];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"domains"];
    domains = v5->_domains;
    v5->_domains = (NSArray *)v19;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventStateOfMind);
  v4->_double reflectiveInterval = self->_reflectiveInterval;
  v4->_valenceClassification = self->_valenceClassification;
  v4->_valence = self->_valence;
  objc_storeStrong((id *)&v4->_labels, self->_labels);
  objc_storeStrong((id *)&v4->_domains, self->_domains);
  return v4;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"valence, %f", *(void *)&self->_valence];

  return v2;
}

- (double)reflectiveInterval
{
  return self->_reflectiveInterval;
}

- (void)setReflectiveInterval:(double)a3
{
  self->_double reflectiveInterval = a3;
}

- (double)valence
{
  return self->_valence;
}

- (void)setValence:(double)a3
{
  self->_valence = a3;
}

- (double)valenceClassification
{
  return self->_valenceClassification;
}

- (void)setValenceClassification:(double)a3
{
  self->_valenceClassification = a3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

@end