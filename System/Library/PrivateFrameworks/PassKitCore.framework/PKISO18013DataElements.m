@interface PKISO18013DataElements
+ (BOOL)supportsSecureCoding;
- (NSDictionary)elements;
- (PKISO18013DataElements)initWithCoder:(id)a3;
- (PKISO18013DataElements)initWithElements:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKISO18013DataElements

- (PKISO18013DataElements)initWithElements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKISO18013DataElements;
  v6 = [(PKISO18013DataElements *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_elements, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKISO18013DataElements)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKISO18013DataElements;
  id v5 = [(PKISO18013DataElements *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"elements"];
    elements = v5->_elements;
    v5->_elements = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)elements
{
  return self->_elements;
}

- (void).cxx_destruct
{
}

@end