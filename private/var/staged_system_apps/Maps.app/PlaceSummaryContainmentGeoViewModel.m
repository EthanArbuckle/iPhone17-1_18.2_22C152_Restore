@interface PlaceSummaryContainmentGeoViewModel
- (NSString)containment;
- (NSString)prefix;
- (PlaceSummaryContainmentGeoViewModel)initWithMapItem:(id)a3;
@end

@implementation PlaceSummaryContainmentGeoViewModel

- (PlaceSummaryContainmentGeoViewModel)initWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MUPlaceHeaderViewModel) initWithMapItem:v4];

  v6 = [v5 enclosingPlaceViewModel];

  v7 = [v6 labelValue];
  if ([v7 length])
  {
  }
  else
  {
    v8 = [v6 tokenValue];
    id v9 = [v8 length];

    if (!v9)
    {
      v15 = 0;
      goto LABEL_7;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PlaceSummaryContainmentGeoViewModel;
  v10 = [(PlaceSummaryContainmentGeoViewModel *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v6 labelValue];
    prefix = v10->_prefix;
    v10->_prefix = (NSString *)v11;

    uint64_t v13 = [v6 tokenValue];
    containment = v10->_containment;
    v10->_containment = (NSString *)v13;
  }
  self = v10;
  v15 = self;
LABEL_7:

  return v15;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSString)containment
{
  return self->_containment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containment, 0);

  objc_storeStrong((id *)&self->_prefix, 0);
}

@end