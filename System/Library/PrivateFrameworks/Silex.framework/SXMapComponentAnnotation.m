@interface SXMapComponentAnnotation
- (SXMapComponentAnnotation)initWithMapItem:(id)a3;
- (SXMapItem)mapItem;
@end

@implementation SXMapComponentAnnotation

- (SXMapComponentAnnotation)initWithMapItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXMapComponentAnnotation;
  v6 = [(MKPointAnnotation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    [(MKPointAnnotation *)v7 setRepresentation:2];
    [v5 coordinate];
    -[MKPointAnnotation setCoordinate:](v7, "setCoordinate:");
    v8 = [v5 label];
    [(MKShape *)v7 setTitle:v8];
  }
  return v7;
}

- (SXMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
}

@end