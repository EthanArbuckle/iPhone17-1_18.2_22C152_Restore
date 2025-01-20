@interface ICAttachmentBrickMapAnnotationV2
- (CLLocationCoordinate2D)coordinate;
- (ICAttachmentBrickMapAnnotationV2)initWithAttachment:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICAttachmentBrickMapAnnotationV2

- (ICAttachmentBrickMapAnnotationV2)initWithAttachment:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICAttachmentBrickMapAnnotationV2;
  v5 = [(ICAttachmentBrickMapAnnotationV2 *)&v17 init];
  if (!v5)
  {
LABEL_4:
    v10 = v5;
    goto LABEL_6;
  }
  uint64_t v6 = [v4 title];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  uint64_t v8 = [v4 summary];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v8;

  v10 = [v4 location];

  if (v10)
  {
    v11 = [v4 location];
    [v11 latitude];
    CLLocationDegrees v13 = v12;
    v14 = [v4 location];
    [v14 longitude];
    v5->_coordinate = CLLocationCoordinate2DMake(v13, v15);

    if (!CLLocationCoordinate2DIsValid(v5->_coordinate))
    {
      v10 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end