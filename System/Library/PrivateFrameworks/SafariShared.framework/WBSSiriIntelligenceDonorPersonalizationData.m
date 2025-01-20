@interface WBSSiriIntelligenceDonorPersonalizationData
- (NSString)searchQuery;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)position;
- (void)clearData;
- (void)setPosition:(unint64_t)a3;
- (void)setSearchQuery:(id)a3;
@end

@implementation WBSSiriIntelligenceDonorPersonalizationData

- (void)clearData
{
  [(WBSSiriIntelligenceDonorPersonalizationData *)self setSearchQuery:0];
  [(WBSSiriIntelligenceDonorPersonalizationData *)self setPosition:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSearchQuery:self->_searchQuery];
  [v4 setPosition:self->_position];
  return v4;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
}

@end