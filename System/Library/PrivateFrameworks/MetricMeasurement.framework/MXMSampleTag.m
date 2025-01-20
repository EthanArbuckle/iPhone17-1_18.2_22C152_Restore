@interface MXMSampleTag
+ (BOOL)supportsSecureCoding;
+ (NSSet)ancestery;
- (BOOL)containsTag:(id)a3;
- (BOOL)isEqualToTag:(id)a3;
- (MXMSampleTag)initWithCoder:(id)a3;
- (MXMSampleTag)initWithComponents:(id)a3;
- (MXMSampleTag)initWithDNString:(id)a3;
- (MXMSampleTag)initWithTaxonomy:(id)a3;
- (MXMSampleTag)parent;
- (NSString)domainNameString;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXMSampleTag

+ (NSSet)ancestery
{
  return 0;
}

- (NSString)domainNameString
{
  v2 = [(NSOrderedSet *)self->_taxonomy array];
  v3 = [v2 componentsJoinedByString:@"."];

  return (NSString *)v3;
}

- (MXMSampleTag)initWithDNString:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"."];
  v5 = [(MXMSampleTag *)self initWithComponents:v4];

  return v5;
}

- (MXMSampleTag)initWithComponents:(id)a3
{
  v4 = [MEMORY[0x263EFF9D8] orderedSetWithArray:a3];
  v5 = [(MXMSampleTag *)self initWithTaxonomy:v4];

  return v5;
}

- (MXMSampleTag)initWithTaxonomy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMSampleTag;
  v6 = [(MXMSampleTag *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taxonomy, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MXMSampleTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXMSampleTag;
  id v5 = [(MXMSampleTag *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_taxonomy"];
    taxonomy = v5->_taxonomy;
    v5->_taxonomy = (NSOrderedSet *)v9;
  }
  return v5;
}

- (id)copy
{
  return [(MXMSampleTag *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)[(NSOrderedSet *)self->_taxonomy copyWithZone:a3];
  uint64_t v7 = (void *)[v5 initWithTaxonomy:v6];

  return v7;
}

- (BOOL)containsTag:(id)a3
{
  return [(NSOrderedSet *)self->_taxonomy isSubsetOfOrderedSet:*((void *)a3 + 1)];
}

- (BOOL)isEqualToTag:(id)a3
{
  id v5 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MXMSampleTag.m", 100, @"Invalid parameter not satisfying: %@", @"[tag isKindOfClass:MXMSampleTag.class]" object file lineNumber description];
  }
  char v6 = [v5[1] isEqualToOrderedSet:self->_taxonomy];

  return v6;
}

- (unint64_t)hash
{
  return [(NSOrderedSet *)self->_taxonomy hash];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  char v6 = [(MXMSampleTag *)self domainNameString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p '%@'>", v5, self, v6];

  return v7;
}

- (MXMSampleTag)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_taxonomy, 0);
}

@end