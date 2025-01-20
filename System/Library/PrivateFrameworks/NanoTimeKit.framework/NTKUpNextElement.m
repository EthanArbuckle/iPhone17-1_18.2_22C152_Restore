@interface NTKUpNextElement
+ (id)elementWithREElement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)elementIdentifier;
- (NTKUpNextElement)initWithREElement:(id)a3;
- (REElement)element;
- (id)description;
- (unint64_t)hash;
- (void)setElement:(id)a3;
@end

@implementation NTKUpNextElement

+ (id)elementWithREElement:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithREElement:v4];

  return v5;
}

- (NTKUpNextElement)initWithREElement:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKUpNextElement;
  v6 = [(NTKUpNextElement *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_element, a3);
    v8 = [v5 identifier];
    uint64_t v9 = [v8 copy];
    elementIdentifier = v7->_elementIdentifier;
    v7->_elementIdentifier = (NSString *)v9;
  }
  return v7;
}

- (void)setElement:(id)a3
{
  id v5 = (REElement *)a3;
  p_element = (uint64_t *)&self->_element;
  if (self->_element != v5)
  {
    v7 = [(NTKUpNextElement *)self elementIdentifier];
    v8 = [(REElement *)v5 identifier];
    char v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      v10 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        [(NTKUpNextElement *)p_element setElement:v10];
      }
    }
    objc_storeStrong((id *)p_element, a3);
  }
}

- (unint64_t)hash
{
  v2 = [(NTKUpNextElement *)self elementIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 elementIdentifier];
    v6 = [(NTKUpNextElement *)self elementIdentifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(NTKUpNextElement *)self elementIdentifier];
  id v5 = [v3 stringWithFormat:@"<Wrapped %p: %@>", self, v4];

  return v5;
}

- (REElement)element
{
  return self->_element;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

- (void)setElement:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_FAULT, "Assigning an incorrect element (%@) to the wrapper %@", (uint8_t *)&v4, 0x16u);
}

@end