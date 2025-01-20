@interface FCTagRelationships
- (FCTagRelationships)initWithRelatedChannelsForOnboarding:(id)a3;
- (NSArray)relatedChannelsForOnboarding;
@end

@implementation FCTagRelationships

- (FCTagRelationships)initWithRelatedChannelsForOnboarding:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCTagRelationships;
  v5 = [(FCTagRelationships *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    relatedChannelsForOnboarding = v5->_relatedChannelsForOnboarding;
    v5->_relatedChannelsForOnboarding = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)relatedChannelsForOnboarding
{
  return self->_relatedChannelsForOnboarding;
}

- (void).cxx_destruct
{
}

@end