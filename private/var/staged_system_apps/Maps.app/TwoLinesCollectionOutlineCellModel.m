@interface TwoLinesCollectionOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (CollectionHandler)collection;
- (TwoLinesCollectionOutlineCellModel)initWithCollection:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5 actionModel:(id)a6;
- (id)accessoryModels;
- (id)actionModel;
- (unint64_t)hash;
@end

@implementation TwoLinesCollectionOutlineCellModel

- (TwoLinesCollectionOutlineCellModel)initWithCollection:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5 actionModel:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100D353FC;
  v19[3] = &unk_1013228B0;
  id v14 = v11;
  id v20 = v14;
  v18.receiver = self;
  v18.super_class = (Class)TwoLinesCollectionOutlineCellModel;
  v15 = [(TwoLinesBasicOutlineCellModel *)&v18 initWithBackgroundModel:a5 contentModelBlock:v19];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_collection, a3);
    objc_storeStrong((id *)&v16->_accessoryModels, a4);
    objc_storeStrong((id *)&v16->_actionModel, a6);
  }

  return v16;
}

- (unint64_t)hash
{
  return (unint64_t)[(CollectionHandler *)self->_collection hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLinesCollectionOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)TwoLinesCollectionOutlineCellModel;
    if ([(TwoLinesBasicOutlineCellModel *)&v15 isEqual:v6])
    {
      v7 = [(TwoLinesCollectionOutlineCellModel *)v6 collection];
      v8 = v7;
      if (v7 == self->_collection || -[CollectionHandler isEqual:](v7, "isEqual:"))
      {
        v9 = [(TwoLinesCollectionOutlineCellModel *)v6 accessoryModels];
        v10 = v9;
        if (v9 == self->_accessoryModels || -[NSArray isEqual:](v9, "isEqual:"))
        {
          id v11 = [(TwoLinesCollectionOutlineCellModel *)v6 actionModel];
          id v12 = v11;
          if (v11 == self->_actionModel) {
            unsigned __int8 v13 = 1;
          }
          else {
            unsigned __int8 v13 = -[TwoLinesOutlineCellActionModel isEqual:](v11, "isEqual:");
          }
        }
        else
        {
          unsigned __int8 v13 = 0;
        }
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)accessoryModels
{
  return self->_accessoryModels;
}

- (id)actionModel
{
  return self->_actionModel;
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_actionModel, 0);

  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end