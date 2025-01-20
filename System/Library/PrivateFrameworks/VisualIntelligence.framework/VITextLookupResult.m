@interface VITextLookupResult
- (BOOL)isEqual:(id)a3;
- (NSArray)sections;
- (VITextLookupResult)initWithSections:(id)a3;
- (unint64_t)hash;
@end

@implementation VITextLookupResult

- (VITextLookupResult)initWithSections:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VITextLookupResult;
  v5 = [(VITextLookupResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  sections = self->_sections;
  v13 = objc_msgSend(v11, "sections", v6, v15, v4, v16, v7, v8);
  LOBYTE(sections) = VIObjectIsEqual((unint64_t)sections, (uint64_t)v13);

  return (char)sections;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_sections hash];
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
}

@end