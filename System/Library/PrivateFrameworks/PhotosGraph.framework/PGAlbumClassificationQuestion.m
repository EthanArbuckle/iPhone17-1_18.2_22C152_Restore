@interface PGAlbumClassificationQuestion
- (PGAlbumClassificationQuestion)initWithAlbumUUID:(id)a3 localFactoryScore:(double)a4;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGAlbumClassificationQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

- (unsigned)state
{
  return self->_state;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (unsigned)entityType
{
  return 6;
}

- (unsigned)displayType
{
  return 8;
}

- (unsigned)type
{
  return 24;
}

- (PGAlbumClassificationQuestion)initWithAlbumUUID:(id)a3 localFactoryScore:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGAlbumClassificationQuestion;
  v8 = [(PGAlbumClassificationQuestion *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_entityIdentifier, a3);
    v9->_state = 0;
    v9->_localFactoryScore = a4;
    additionalInfo = v9->_additionalInfo;
    v9->_additionalInfo = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v9;
}

@end