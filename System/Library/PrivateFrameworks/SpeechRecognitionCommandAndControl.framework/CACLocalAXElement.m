@interface CACLocalAXElement
- (id)description;
- (id)localElement;
- (void)setLocalElement:(id)a3;
@end

@implementation CACLocalAXElement

- (id)description
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(CACLocalAXElement *)self localElement];
  if (v7)
  {
    v2 = [(CACLocalAXElement *)self localElement];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = @"none";
  }
  v10 = [(CACLocalAXElement *)self localElement];
  v11 = [v4 stringWithFormat:@"<%@: %p> - <%@: %p>", v6, self, v9, v10];

  if (v7)
  {
  }
  return v11;
}

- (id)localElement
{
  return self->_localElement;
}

- (void)setLocalElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end