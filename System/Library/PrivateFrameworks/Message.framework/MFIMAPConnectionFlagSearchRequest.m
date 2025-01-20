@interface MFIMAPConnectionFlagSearchRequest
+ (id)requestWithMask:(unint64_t)a3 searchTerms:(id)a4 positiveMatch:(BOOL)a5;
- (BOOL)isPositiveMatch;
- (MFIMAPConnectionFlagSearchRequest)initWithMask:(unint64_t)a3 searchTerms:(id)a4 positiveMatch:(BOOL)a5;
- (NSArray)searchTerms;
- (unint64_t)mask;
@end

@implementation MFIMAPConnectionFlagSearchRequest

+ (id)requestWithMask:(unint64_t)a3 searchTerms:(id)a4 positiveMatch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = (void *)[objc_alloc((Class)a1) initWithMask:a3 searchTerms:v8 positiveMatch:v5];

  return v9;
}

- (MFIMAPConnectionFlagSearchRequest)initWithMask:(unint64_t)a3 searchTerms:(id)a4 positiveMatch:(BOOL)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFIMAPConnectionFlagSearchRequest;
  v9 = [(MFIMAPConnectionFlagSearchRequest *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_mask = a3;
    v9->_isPositiveMatch = a5;
    uint64_t v11 = [v8 copy];
    searchTerms = v10->_searchTerms;
    v10->_searchTerms = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (unint64_t)mask
{
  return self->_mask;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (BOOL)isPositiveMatch
{
  return self->_isPositiveMatch;
}

- (void).cxx_destruct
{
}

@end