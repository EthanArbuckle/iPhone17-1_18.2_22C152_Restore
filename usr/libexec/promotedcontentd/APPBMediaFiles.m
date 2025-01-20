@interface APPBMediaFiles
+ (Class)mediaAssetsType;
+ (id)options;
- (BOOL)hasDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)mediaAssets;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mediaAssetsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mediaAssetsCount;
- (void)addMediaAssets:(id)a3;
- (void)clearMediaAssets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setMediaAssets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBMediaFiles

+ (id)options
{
  if (qword_100289828 != -1) {
    dispatch_once(&qword_100289828, &stru_100235040);
  }
  v2 = (void *)qword_100289820;

  return v2;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearMediaAssets
{
}

- (void)addMediaAssets:(id)a3
{
  id v4 = a3;
  mediaAssets = self->_mediaAssets;
  id v8 = v4;
  if (!mediaAssets)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_mediaAssets;
    self->_mediaAssets = v6;

    id v4 = v8;
    mediaAssets = self->_mediaAssets;
  }
  [(NSMutableArray *)mediaAssets addObject:v4];
}

- (unint64_t)mediaAssetsCount
{
  return (unint64_t)[(NSMutableArray *)self->_mediaAssets count];
}

- (id)mediaAssetsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_mediaAssets objectAtIndex:a3];
}

+ (Class)mediaAssetsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBMediaFiles;
  v3 = [(APPBMediaFiles *)&v7 description];
  id v4 = [(APPBMediaFiles *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v4 forKey:@"duration"];
  }
  if ([(NSMutableArray *)self->_mediaAssets count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_mediaAssets, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_mediaAssets;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation:v13];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"mediaAssets"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMediaFilesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_mediaAssets;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_duration;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v9 = v4;
  if ([(APPBMediaFiles *)self mediaAssetsCount])
  {
    [v9 clearMediaAssets];
    unint64_t v5 = [(APPBMediaFiles *)self mediaAssetsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(APPBMediaFiles *)self mediaAssetsAtIndex:i];
        [v9 addMediaAssets:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v5 + 1) = *(void *)&self->_duration;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_mediaAssets;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addMediaAssets:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_duration != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  mediaAssets = self->_mediaAssets;
  if ((unint64_t)mediaAssets | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[NSMutableArray isEqual:](mediaAssets, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double duration = self->_duration;
    double v5 = -duration;
    if (duration >= 0.0) {
      double v5 = self->_duration;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return (unint64_t)[(NSMutableArray *)self->_mediaAssets hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_double duration = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[APPBMediaFiles addMediaAssets:](self, "addMediaAssets:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (double)duration
{
  return self->_duration;
}

- (NSMutableArray)mediaAssets
{
  return self->_mediaAssets;
}

- (void)setMediaAssets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end