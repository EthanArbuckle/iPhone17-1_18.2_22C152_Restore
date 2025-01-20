@interface PKAMSMediaRequest
- (PKAMSMediaRequest)init;
- (PKAMSMediaRequestArtworkConfiguration)artworkConfiguration;
- (PKAMSMediaRequestMusicItem)musicRequest;
- (id)_initWithType:(unint64_t)a3 artworkConfiguration:(id)a4;
- (unint64_t)type;
@end

@implementation PKAMSMediaRequest

- (PKAMSMediaRequest)init
{
  return 0;
}

- (id)_initWithType:(unint64_t)a3 artworkConfiguration:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKAMSMediaRequest;
  v8 = [(PKAMSMediaRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_artworkConfiguration, a4);
  }

  return v9;
}

- (PKAMSMediaRequestMusicItem)musicRequest
{
  if (self->_type > 2) {
    v2 = 0;
  }
  else {
    v2 = self;
  }

  return (PKAMSMediaRequestMusicItem *)v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKAMSMediaRequestArtworkConfiguration)artworkConfiguration
{
  return self->_artworkConfiguration;
}

- (void).cxx_destruct
{
}

@end