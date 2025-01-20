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
  v23.receiver = self;
  v23.super_class = (Class)MOEventStateOfMind;
  id v5 = [(MOEventStateOfMind *)&v23 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"reflectiveInterval"];
    v5->_double reflectiveInterval = v6;
    [v4 decodeDoubleForKey:@"valence"];
    v5->_valence = v7;
    uint64_t v8 = [v4 decodeDoubleForKey:@"valenceClassification"];
    v5->_valenceClassification = v9;
    v10 = (void *)MEMORY[0x1D26065F0](v8);
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"labels"];
    labels = v5->_labels;
    v5->_labels = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1D26065F0]();
    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"domains"];
    domains = v5->_domains;
    v5->_domains = (NSArray *)v20;
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
  v2 = (void *)[[NSString alloc] initWithFormat:@"valence, %f", *(void *)&self->_valence];
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