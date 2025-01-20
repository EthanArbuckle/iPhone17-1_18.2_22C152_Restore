@interface BSUISeriesStackImageBox
- (Class)layoutClass;
- (NSArray)coverFilters;
- (NSArray)coverURLStrings;
- (void)setCoverFilters:(id)a3;
- (void)setCoverURLStrings:(id)a3;
@end

@implementation BSUISeriesStackImageBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSArray)coverFilters
{
  return self->_coverFilters;
}

- (void)setCoverFilters:(id)a3
{
}

- (NSArray)coverURLStrings
{
  return self->_coverURLStrings;
}

- (void)setCoverURLStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverURLStrings, 0);

  objc_storeStrong((id *)&self->_coverFilters, 0);
}

@end