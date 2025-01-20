@interface LabelMarkerVenueCardItem
- (BOOL)isVenueItem;
- (LabelMarkerVenueCardItem)init;
- (LabelMarkerVenueCardItem)initWithLabelMarker:(id)a3;
- (VKLabelMarker)venueLabelMarker;
- (unint64_t)venueCardID;
- (unint64_t)venueID;
@end

@implementation LabelMarkerVenueCardItem

- (LabelMarkerVenueCardItem)init
{
  return 0;
}

- (LabelMarkerVenueCardItem)initWithLabelMarker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LabelMarkerVenueCardItem;
  v6 = [(LabelMarkerVenueCardItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_labelMarker, a3);
  }

  return v7;
}

- (VKLabelMarker)venueLabelMarker
{
  return self->_labelMarker;
}

- (BOOL)isVenueItem
{
  return [(LabelMarkerVenueCardItem *)self venueID] != 0;
}

- (unint64_t)venueID
{
  if ([(VKLabelMarker *)self->_labelMarker isCluster])
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    uint64_t v8 = 0;
    objc_super v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    v3 = [(VKLabelMarker *)self->_labelMarker clusterFeatureAnnotations];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100452AF8;
    v7[3] = &unk_1012EAAE8;
    v7[4] = &v12;
    v7[5] = &v8;
    [v3 enumerateObjectsUsingBlock:v7];

    if (*((unsigned char *)v9 + 24)) {
      unint64_t v4 = v13[3];
    }
    else {
      unint64_t v4 = 0;
    }
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v12, 8);
    return v4;
  }
  else
  {
    labelMarker = self->_labelMarker;
    return (unint64_t)[(VKLabelMarker *)labelMarker venueID];
  }
}

- (unint64_t)venueCardID
{
  return (unint64_t)[(VKLabelMarker *)self->_labelMarker businessID];
}

- (void).cxx_destruct
{
}

@end