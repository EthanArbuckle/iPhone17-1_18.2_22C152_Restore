@interface _MCDLibraryDataSource
- (BOOL)limitedUI;
- (MPModelKind)requestItemKind;
- (MPPropertySet)requestItemProperties;
- (MPPropertySet)requestSectionProperties;
- (NSString)requestLabel;
- (NSString)sortingPreference;
- (_MCDLibraryDataSource)initWithLimitedUI:(BOOL)a3;
- (void)setLimitedUI:(BOOL)a3;
- (void)setSortingPreference:(id)a3;
@end

@implementation _MCDLibraryDataSource

- (_MCDLibraryDataSource)initWithLimitedUI:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MCDLibraryDataSource;
  result = [(_MCDLibraryDataSource *)&v5 init];
  if (result) {
    result->_limitedUI = a3;
  }
  return result;
}

- (MPModelKind)requestItemKind
{
  return 0;
}

- (NSString)requestLabel
{
  return (NSString *)@"Library CarPlay View Controller";
}

- (MPPropertySet)requestItemProperties
{
  return (MPPropertySet *)+[MPPropertySet emptyPropertySet];
}

- (MPPropertySet)requestSectionProperties
{
  uint64_t v5 = MPModelPropertySectionTitle;
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return (MPPropertySet *)v3;
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (void)setLimitedUI:(BOOL)a3
{
  self->_limitedUI = a3;
}

- (NSString)sortingPreference
{
  return self->_sortingPreference;
}

- (void)setSortingPreference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end