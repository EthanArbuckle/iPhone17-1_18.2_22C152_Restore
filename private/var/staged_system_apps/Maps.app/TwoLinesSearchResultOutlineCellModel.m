@interface TwoLinesSearchResultOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (SearchResult)searchResult;
- (TwoLinesSearchResultOutlineCellModel)initWithSearchResult:(id)a3 backgroundModel:(id)a4;
- (unint64_t)hash;
@end

@implementation TwoLinesSearchResultOutlineCellModel

- (TwoLinesSearchResultOutlineCellModel)initWithSearchResult:(id)a3 backgroundModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100D34800;
  v13[3] = &unk_1013228D8;
  objc_copyWeak(&v14, &location);
  v12.receiver = self;
  v12.super_class = (Class)TwoLinesSearchResultOutlineCellModel;
  v9 = [(TwoLinesBasicOutlineCellModel *)&v12 initWithBackgroundModel:v8 contentModelBlock:v13];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_searchResult, a3);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

- (unint64_t)hash
{
  return [(SearchResult *)self->_searchResult hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLinesSearchResultOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)TwoLinesSearchResultOutlineCellModel;
    if ([(TwoLinesBasicOutlineCellModel *)&v11 isEqual:v6])
    {
      id v7 = [(TwoLinesSearchResultOutlineCellModel *)v6 searchResult];
      id v8 = v7;
      if (v7 == self->_searchResult) {
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = -[SearchResult isEqual:](v7, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void).cxx_destruct
{
}

@end