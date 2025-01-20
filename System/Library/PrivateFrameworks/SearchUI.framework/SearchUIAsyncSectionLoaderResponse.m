@interface SearchUIAsyncSectionLoaderResponse
- (BOOL)animated;
- (BOOL)reconfigureExisting;
- (NSArray)cardSection;
- (void)setAnimated:(BOOL)a3;
- (void)setCardSection:(id)a3;
- (void)setReconfigureExisting:(BOOL)a3;
@end

@implementation SearchUIAsyncSectionLoaderResponse

- (NSArray)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)reconfigureExisting
{
  return self->_reconfigureExisting;
}

- (void)setReconfigureExisting:(BOOL)a3
{
  self->_reconfigureExisting = a3;
}

- (void).cxx_destruct
{
}

@end