@interface RelatedSearchSuggestionOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (NSString)_maps_diffableDataSourceIdentifier;
- (RelatedSearchSuggestion)suggestion;
- (RelatedSearchSuggestionOutlineCellDelegate)delegate;
- (RelatedSearchSuggestionOutlineCellModel)initWithRelatedSuggestion:(id)a3 delegate:(id)a4;
- (UICollectionViewCellRegistration)cellRegistration;
- (unint64_t)hash;
@end

@implementation RelatedSearchSuggestionOutlineCellModel

- (RelatedSearchSuggestionOutlineCellModel)initWithRelatedSuggestion:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RelatedSearchSuggestionOutlineCellModel;
  v9 = [(RelatedSearchSuggestionOutlineCellModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)[(RelatedSearchSuggestion *)self->_suggestion hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RelatedSearchSuggestionOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(RelatedSearchSuggestionOutlineCellModel *)v6 suggestion];
    id v8 = v7;
    if (v7 == self->_suggestion || -[RelatedSearchSuggestion isEqual:](v7, "isEqual:"))
    {
      id v9 = [(RelatedSearchSuggestionOutlineCellModel *)v6 delegate];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (v9 == WeakRetained) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = [v9 isEqual:WeakRetained];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)@"RelatedSearchSuggestion";
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[RelatedSearchSuggestionOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(RelatedSearchSuggestionOutlineCellModel *)self isEqual:a3];
}

- (RelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (RelatedSearchSuggestionOutlineCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RelatedSearchSuggestionOutlineCellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end