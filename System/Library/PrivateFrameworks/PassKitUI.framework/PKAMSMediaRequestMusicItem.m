@interface PKAMSMediaRequestMusicItem
- (NSArray)musicIDs;
- (PKAMSMediaRequestMusicItem)initWithType:(unint64_t)a3 musicIDs:(id)a4 artworkConfiguration:(id)a5;
@end

@implementation PKAMSMediaRequestMusicItem

- (PKAMSMediaRequestMusicItem)initWithType:(unint64_t)a3 musicIDs:(id)a4 artworkConfiguration:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 count])
  {
    v15.receiver = self;
    v15.super_class = (Class)PKAMSMediaRequestMusicItem;
    v11 = [(PKAMSMediaRequest *)&v15 _initWithType:a3 artworkConfiguration:v10];
    v12 = v11;
    if (v11) {
      objc_storeStrong(v11 + 3, a4);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSArray)musicIDs
{
  return self->_musicIDs;
}

- (void).cxx_destruct
{
}

@end