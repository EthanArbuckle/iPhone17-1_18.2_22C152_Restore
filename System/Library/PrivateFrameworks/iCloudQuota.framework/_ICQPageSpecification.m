@interface _ICQPageSpecification
- (BOOL)hasCancelButtonForBack;
- (NSString)pageClassIdentifier;
- (NSString)pageIdentifier;
- (NSString)pageTitle;
- (id)copyWithBindings:(id)a3;
- (id)debugDescription;
- (void)setHasCancelButtonForBack:(BOOL)a3;
- (void)setPageClassIdentifier:(id)a3;
- (void)setPageIdentifier:(id)a3;
- (void)setPageTitle:(id)a3;
@end

@implementation _ICQPageSpecification

- (id)debugDescription
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)_ICQPageSpecification;
  v4 = [(_ICQPageSpecification *)&v12 debugDescription];
  v5 = NSString;
  v6 = [(_ICQPageSpecification *)self pageClassIdentifier];
  v7 = [(_ICQPageSpecification *)self pageIdentifier];
  v8 = [(_ICQPageSpecification *)self pageTitle];
  v9 = [v5 stringWithFormat:@"<%@: %@: %@>", v6, v7, v8];
  v10 = [v3 stringWithFormat:@"%@: %@", v4, v9];

  return v10;
}

- (NSString)pageClassIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyWithBindings:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(_ICQPageSpecification *)(uint64_t)self copyWithBindings:v4];
  }

  return self;
}

- (NSString)pageIdentifier
{
  return self->_pageIdentifier;
}

- (void)setPageIdentifier:(id)a3
{
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
}

- (BOOL)hasCancelButtonForBack
{
  return self->_hasCancelButtonForBack;
}

- (void)setHasCancelButtonForBack:(BOOL)a3
{
  self->_hasCancelButtonForBack = a3;
}

- (void)setPageClassIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageClassIdentifier, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_pageIdentifier, 0);
}

- (void)copyWithBindings:(NSObject *)a3 .cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  int v8 = 138543618;
  v9 = v6;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_1D5851000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ subclass must implement %{public}@", (uint8_t *)&v8, 0x16u);
}

@end