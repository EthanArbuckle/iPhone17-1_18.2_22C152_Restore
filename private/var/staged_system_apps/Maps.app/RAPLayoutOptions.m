@interface RAPLayoutOptions
- (BOOL)isEqual:(id)a3;
- (MKMapItem)reportedMapItem;
- (id)initialLayoutParameters;
- (int64_t)layoutType;
- (void)setLayoutType:(int64_t)a3;
- (void)setReportedMapItem:(id)a3;
@end

@implementation RAPLayoutOptions

- (id)initialLayoutParameters
{
  id v3 = objc_alloc_init((Class)GEORPFeedbackLayoutConfigParameters);
  unint64_t v4 = [(RAPLayoutOptions *)self layoutType];
  if (v4 <= 5) {
    [v3 setFormType:dword_100F72BC0[v4]];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t layoutType = self->_layoutType;
    id v7 = [v5 layoutType];
    id v8 = v7;
    reportedMapItem = self->_reportedMapItem;
    if (reportedMapItem)
    {
      if ((id)layoutType != v7)
      {
        unsigned __int8 v10 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v11 = [v5 reportedMapItem];

      if (v11) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = layoutType == (void)v8;
      }
      unsigned __int8 v10 = v12;
      if (!v11 || (id)layoutType != v8) {
        goto LABEL_16;
      }
      reportedMapItem = self->_reportedMapItem;
    }
    v13 = [v5 reportedMapItem];
    unsigned __int8 v10 = [(MKMapItem *)reportedMapItem isEqual:v13];

    goto LABEL_16;
  }
  unsigned __int8 v10 = 0;
LABEL_17:

  return v10;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_int64_t layoutType = a3;
}

- (MKMapItem)reportedMapItem
{
  return self->_reportedMapItem;
}

- (void)setReportedMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end