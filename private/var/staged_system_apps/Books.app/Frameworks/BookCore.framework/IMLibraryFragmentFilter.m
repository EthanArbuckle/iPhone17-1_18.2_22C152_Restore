@interface IMLibraryFragmentFilter
+ ($81054265B03F4417B018A533484DF1B1)fragmentFilterSpecificationForDocumentLength:(SEL)a3 librarySpecification:(int64_t)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)containsDocumentWithIdentifier:(id)a3;
- (IMLibraryFragmentFilter)initWithCoder:(id)a3;
- (IMLibraryFragmentFilter)initWithFilterSpecification:(id *)a3;
- (id)allIdentifiers;
- (id)candidateIdentifiersForQuery:(id)a3;
- (unint64_t)documentCount;
- (void)addDocument:(id)a3 withIdentifier:(id)a4;
- (void)addFilter:(id)a3 withIdentifier:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMLibraryFragmentFilter

- (IMLibraryFragmentFilter)initWithFilterSpecification:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IMLibraryFragmentFilter;
  v4 = [(IMLibraryFragmentFilter *)&v9 init];
  if (v4)
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];
    identifiedDocuments = v4->_identifiedDocuments;
    v4->_identifiedDocuments = (NSMutableDictionary *)v5;

    long long v7 = *(_OWORD *)&a3->var0;
    v4->_specification.windowWidth = a3->var2;
    *(_OWORD *)&v4->_specification.loadFactor = v7;
  }
  return v4;
}

- (void)dealloc
{
  identifiedDocuments = self->_identifiedDocuments;
  self->_identifiedDocuments = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMLibraryFragmentFilter;
  [(IMLibraryFragmentFilter *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_specification = &self->_specification;
  id v5 = a3;
  id v6 = +[NSData dataWithBytes:p_specification length:24];
  [v5 encodeObject:v6 forKey:@"specification"];
  [v5 encodeObject:self->_identifiedDocuments forKey:@"identifiedDocuements"];
}

- (IMLibraryFragmentFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMLibraryFragmentFilter;
  id v5 = [(IMLibraryFragmentFilter *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specification"];
    [v6 getBytes:&v5->_specification length:24];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"identifiedDocuements"];
    identifiedDocuments = v5->_identifiedDocuments;
    v5->_identifiedDocuments = (NSMutableDictionary *)v10;
  }
  return v5;
}

+ ($81054265B03F4417B018A533484DF1B1)fragmentFilterSpecificationForDocumentLength:(SEL)a3 librarySpecification:(int64_t)a4
{
  double var0 = a5->var0;
  retstr->var0.double var0 = a4;
  retstr->var0.var1 = var0;
  *(_OWORD *)&retstr->var0.var2 = *(_OWORD *)&a5->var1;
  return result;
}

- (void)addFilter:(id)a3 withIdentifier:(id)a4
{
}

- (void)addDocument:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = [v6 length];
  if (v8)
  {
    long long v12 = *(_OWORD *)&self->_specification.loadFactor;
    *(void *)&long long v13 = self->_specification.windowWidth;
    [v8 fragmentFilterSpecificationForDocumentLength:v9 librarySpecification:&v12];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  uint64_t v10 = [IMDocumentFragmentFilter alloc];
  long long v12 = v14;
  long long v13 = v15;
  v11 = [(IMDocumentFragmentFilter *)v10 initWithDocument:v6 filterSpecification:&v12];
  [(IMLibraryFragmentFilter *)self addFilter:v11 withIdentifier:v7];
}

- (BOOL)containsDocumentWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_identifiedDocuments objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (unint64_t)documentCount
{
  return (unint64_t)[(NSMutableDictionary *)self->_identifiedDocuments count];
}

- (id)allIdentifiers
{
  return [(NSMutableDictionary *)self->_identifiedDocuments allKeys];
}

- (id)candidateIdentifiersForQuery:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableSet) initWithCapacity:-[NSMutableDictionary count](self->_identifiedDocuments, "count")];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_identifiedDocuments;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = -[NSMutableDictionary objectForKey:](self->_identifiedDocuments, "objectForKey:", v11, (void)v14);
        if ([v12 mightContainFragment:v4]) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end