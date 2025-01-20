@interface _PASImmutableDomainSelection
- (BOOL)containsDomain:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqualToDomainSelection:(id)a3;
- (id)_initWithNonOverlappingDomainSet:(id)a3;
- (id)allDomains;
@end

@implementation _PASImmutableDomainSelection

- (id)allDomains
{
  return self->_domains;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)_initWithNonOverlappingDomainSet:(id)a3
{
  id v6 = a3;
  v7 = [(_PASDomainSelection *)self init];
  if (v7)
  {
    if (![v6 count])
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:v7 file:@"_PASDomainSelection.m" lineNumber:224 description:@"_PASImmutableDomainSelection shouldn't be instantiated with zero domains"];
    }
    objc_storeStrong((id *)&v7->_domains, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqualToDomainSelection:(id)a3
{
  id v4 = a3;
  if (v4 && (unint64_t v5 = -[_PASDomainSelection count](self, "count"), v5 == [v4 count]))
  {
    domains = self->_domains;
    v7 = [v4 allDomains];
    char v8 = [(NSSet *)domains isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)containsDomain:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1A62450A0]();
  if ([(NSSet *)self->_domains containsObject:v4])
  {
    BOOL v6 = 1;
  }
  else
  {
    while (1)
    {
      uint64_t v7 = [v4 rangeOfString:@"." options:6];
      BOOL v6 = v8 != 0;
      if (!v8) {
        break;
      }
      uint64_t v9 = [v4 substringToIndex:v7];

      unint64_t v5 = (void *)MEMORY[0x1A62450A0]();
      id v4 = (id)v9;
      if ([(NSSet *)self->_domains containsObject:v9])
      {
        BOOL v6 = 1;
        id v4 = (id)v9;
        break;
      }
    }
  }

  return v6;
}

@end