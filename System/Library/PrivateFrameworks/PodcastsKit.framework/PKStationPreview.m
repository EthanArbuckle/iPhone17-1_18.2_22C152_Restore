@interface PKStationPreview
- (NSString)title;
- (NSString)uuid;
- (PKStationPreview)initWithTitle:(id)a3 uuid:(id)a4;
- (void)setTitle:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PKStationPreview

- (PKStationPreview)initWithTitle:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKStationPreview;
  v8 = [(PKStationPreview *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(PKStationPreview *)v8 setTitle:v6];
    [(PKStationPreview *)v9 setUuid:v7];
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end