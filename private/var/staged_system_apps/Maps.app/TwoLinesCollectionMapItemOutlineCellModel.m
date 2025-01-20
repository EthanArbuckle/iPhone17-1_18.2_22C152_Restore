@interface TwoLinesCollectionMapItemOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (GEOLocation)currentLocation;
- (MKMapItem)mapItem;
- (TwoLinesCollectionMapItemOutlineCellModel)initWithMapItem:(id)a3 currentLocation:(id)a4 distanceUnit:(int64_t)a5 backgroundModel:(id)a6;
- (id)homeActionObject;
- (int64_t)distanceUnit;
- (unint64_t)hash;
@end

@implementation TwoLinesCollectionMapItemOutlineCellModel

- (id)homeActionObject
{
  v2 = [(TwoLinesCollectionMapItemOutlineCellModel *)self mapItem];
  v3 = [v2 _geoMapItem];

  return v3;
}

- (TwoLinesCollectionMapItemOutlineCellModel)initWithMapItem:(id)a3 currentLocation:(id)a4 distanceUnit:(int64_t)a5 backgroundModel:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100D35B08;
  v19[3] = &unk_101322900;
  id v13 = v11;
  id v20 = v13;
  id v14 = v12;
  id v21 = v14;
  v18.receiver = self;
  v18.super_class = (Class)TwoLinesCollectionMapItemOutlineCellModel;
  v15 = [(TwoLinesBasicOutlineCellModel *)&v18 initWithBackgroundModel:a6 contentModelBlock:v19];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mapItem, a3);
    objc_storeStrong((id *)&v16->_currentLocation, a4);
    v16->_distanceUnit = a5;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(MKMapItem *)self->_mapItem hash];
  unint64_t v4 = (unint64_t)[(GEOLocation *)self->_currentLocation hash] ^ v3;
  return v4 ^ [(SidebarOutlineCellBackgroundModel *)self->super._backgroundModel hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TwoLinesCollectionMapItemOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)TwoLinesCollectionMapItemOutlineCellModel;
    if ([(TwoLinesBasicOutlineCellModel *)&v13 isEqual:v6])
    {
      v7 = [(TwoLinesCollectionMapItemOutlineCellModel *)v6 mapItem];
      v8 = v7;
      if (v7 == self->_mapItem || -[MKMapItem isEqual:](v7, "isEqual:"))
      {
        v9 = [(TwoLinesCollectionMapItemOutlineCellModel *)v6 currentLocation];
        v10 = v9;
        BOOL v11 = (v9 == self->_currentLocation || -[GEOLocation isEqual:](v9, "isEqual:"))
           && [(TwoLinesCollectionMapItemOutlineCellModel *)v6 distanceUnit] == self->_distanceUnit;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (int64_t)distanceUnit
{
  return self->_distanceUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end