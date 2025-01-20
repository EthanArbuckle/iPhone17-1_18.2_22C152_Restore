@interface MKMapItem
- (NSString)wc_localityName;
- (NSString)wc_weatherDisplayName;
- (NSString)wc_weatherLocationName;
@end

@implementation MKMapItem

- (NSString)wc_localityName
{
  v3 = [(MKMapItem *)self placemark];
  v4 = [(MKMapItem *)v3 locality];
  id v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(MKMapItem *)v3 locality];
  }
  else
  {
    v7 = [(MKMapItem *)v3 name];
    id v8 = [v7 length];

    if (v8) {
      v9 = v3;
    }
    else {
      v9 = self;
    }
    uint64_t v6 = [(MKMapItem *)v9 name];
  }
  v10 = (void *)v6;

  return (NSString *)v10;
}

- (NSString)wc_weatherDisplayName
{
  v3 = [(MKMapItem *)self _weatherDisplayName];
  id v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(MKMapItem *)self _weatherDisplayName];
LABEL_3:
    uint64_t v6 = (void *)v5;
    goto LABEL_6;
  }
  v7 = [(MKMapItem *)self placemark];
  id v8 = [v7 name];
  id v9 = [v8 length];

  if (!v9)
  {
    uint64_t v5 = [(MKMapItem *)self name];
    goto LABEL_3;
  }
  v10 = [(MKMapItem *)self placemark];
  uint64_t v6 = [v10 name];

LABEL_6:

  return (NSString *)v6;
}

- (NSString)wc_weatherLocationName
{
  return (NSString *)[(MKMapItem *)self _weatherLocationName];
}

@end