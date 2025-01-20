@interface FCSubscribedTags
- (FCSubscribedTags)initWithSubscribedTags:(id)a3 mutedTags:(id)a4 autoFavoriteTags:(id)a5 groupableTags:(id)a6;
- (NSArray)autoFavoriteTags;
- (NSArray)groupableTags;
- (NSArray)mutedTags;
- (NSArray)subscribedTags;
- (void)setAutoFavoriteTags:(id)a3;
- (void)setGroupableTags:(id)a3;
- (void)setMutedTags:(id)a3;
- (void)setSubscribedTags:(id)a3;
@end

@implementation FCSubscribedTags

- (FCSubscribedTags)initWithSubscribedTags:(id)a3 mutedTags:(id)a4 autoFavoriteTags:(id)a5 groupableTags:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FCSubscribedTags;
  v14 = [(FCSubscribedTags *)&v22 init];
  v15 = v14;
  if (v14)
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
    if (v10) {
      id v17 = v10;
    }
    else {
      id v17 = (id)MEMORY[0x1E4F1CBF0];
    }
    [(FCSubscribedTags *)v14 setSubscribedTags:v17];
    if (v11) {
      id v18 = v11;
    }
    else {
      id v18 = v16;
    }
    [(FCSubscribedTags *)v15 setMutedTags:v18];
    if (v12) {
      id v19 = v12;
    }
    else {
      id v19 = v16;
    }
    [(FCSubscribedTags *)v15 setAutoFavoriteTags:v19];
    if (v13) {
      id v20 = v13;
    }
    else {
      id v20 = v16;
    }
    [(FCSubscribedTags *)v15 setGroupableTags:v20];
  }

  return v15;
}

- (void)setSubscribedTags:(id)a3
{
}

- (void)setMutedTags:(id)a3
{
}

- (void)setGroupableTags:(id)a3
{
}

- (void)setAutoFavoriteTags:(id)a3
{
}

- (NSArray)subscribedTags
{
  return self->_subscribedTags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupableTags, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTags, 0);
  objc_storeStrong((id *)&self->_mutedTags, 0);
  objc_storeStrong((id *)&self->_subscribedTags, 0);
}

- (NSArray)mutedTags
{
  return self->_mutedTags;
}

- (NSArray)autoFavoriteTags
{
  return self->_autoFavoriteTags;
}

- (NSArray)groupableTags
{
  return self->_groupableTags;
}

@end