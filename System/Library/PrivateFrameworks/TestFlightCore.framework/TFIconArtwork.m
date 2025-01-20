@interface TFIconArtwork
- (NSString)urlTemplate;
- (TFIconArtwork)initWithUrlTemplate:(id)a3;
@end

@implementation TFIconArtwork

- (TFIconArtwork)initWithUrlTemplate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TFIconArtwork;
  v6 = [(TFIconArtwork *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_urlTemplate, a3);
  }

  return v7;
}

- (NSString)urlTemplate
{
  return self->_urlTemplate;
}

- (void).cxx_destruct
{
}

@end