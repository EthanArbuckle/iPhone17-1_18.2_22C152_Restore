@interface TwoLinesSharedTripSummaryOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (SharedTripSummary)sharedTripSummary;
- (TwoLinesSharedTripSummaryOutlineCellModel)initWithSharedTripSummary:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5;
- (id)accessoryModels;
- (id)homeDragAndDropObject;
- (unint64_t)hash;
@end

@implementation TwoLinesSharedTripSummaryOutlineCellModel

- (id)homeDragAndDropObject
{
  return 0;
}

- (TwoLinesSharedTripSummaryOutlineCellModel)initWithSharedTripSummary:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D35094;
  v16[3] = &unk_1013228D8;
  objc_copyWeak(&v17, &location);
  v15.receiver = self;
  v15.super_class = (Class)TwoLinesSharedTripSummaryOutlineCellModel;
  v12 = [(TwoLinesBasicOutlineCellModel *)&v15 initWithBackgroundModel:v11 contentModelBlock:v16];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sharedTripSummary, a3);
    objc_storeStrong((id *)&v13->_accessoryModels, a4);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

- (unint64_t)hash
{
  return (unint64_t)[(SharedTripSummary *)self->_sharedTripSummary hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLinesSharedTripSummaryOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)TwoLinesSharedTripSummaryOutlineCellModel;
    if ([(TwoLinesBasicOutlineCellModel *)&v13 isEqual:v6])
    {
      v7 = [(TwoLinesSharedTripSummaryOutlineCellModel *)v6 sharedTripSummary];
      v8 = v7;
      if (v7 == self->_sharedTripSummary || -[SharedTripSummary isEqual:](v7, "isEqual:"))
      {
        id v9 = [(TwoLinesSharedTripSummaryOutlineCellModel *)v6 accessoryModels];
        id v10 = v9;
        if (v9 == self->_accessoryModels) {
          unsigned __int8 v11 = 1;
        }
        else {
          unsigned __int8 v11 = -[NSArray isEqual:](v9, "isEqual:");
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
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)accessoryModels
{
  return self->_accessoryModels;
}

- (SharedTripSummary)sharedTripSummary
{
  return self->_sharedTripSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTripSummary, 0);

  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end