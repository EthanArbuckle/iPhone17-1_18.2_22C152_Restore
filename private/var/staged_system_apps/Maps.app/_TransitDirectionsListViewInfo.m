@interface _TransitDirectionsListViewInfo
+ (_TransitDirectionsListViewInfo)infoWithStepView:(id)a3 atIndexPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSIndexPath)indexPath;
- (TransitDirectionsStepView)stepView;
- (id)description;
- (unint64_t)hash;
@end

@implementation _TransitDirectionsListViewInfo

+ (_TransitDirectionsListViewInfo)infoWithStepView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[1];
  v8[1] = v6;
  id v10 = v6;

  v11 = (void *)v8[2];
  v8[2] = v7;

  return (_TransitDirectionsListViewInfo *)v8;
}

- (unint64_t)hash
{
  v2 = [(_TransitDirectionsListViewInfo *)self indexPath];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    uint64_t v8 = [(_TransitDirectionsListViewInfo *)self indexPath];
    uint64_t v9 = [v7 indexPath];
    if (v8 | v9) {
      unsigned __int8 v6 = [(id)v8 isEqual:v9];
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)_TransitDirectionsListViewInfo;
  id v3 = [(_TransitDirectionsListViewInfo *)&v13 description];
  id v4 = [(_TransitDirectionsListViewInfo *)self indexPath];
  id v5 = [v4 section];
  unsigned __int8 v6 = [(_TransitDirectionsListViewInfo *)self indexPath];
  id v7 = [v6 item];
  uint64_t v8 = [(_TransitDirectionsListViewInfo *)self stepView];
  uint64_t v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  v11 = +[NSString stringWithFormat:@"%@ (%ld-%ld: %@)", v3, v5, v7, v10];

  return v11;
}

- (TransitDirectionsStepView)stepView
{
  return self->_stepView;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_stepView, 0);
}

@end