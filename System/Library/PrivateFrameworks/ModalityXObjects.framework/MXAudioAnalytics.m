@interface MXAudioAnalytics
+ (Class)acousticFeaturesType;
+ (Class)speechRecognitionFeaturesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)acousticFeatures;
- (NSMutableArray)speechRecognitionFeatures;
- (id)acousticFeaturesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)speechRecognitionFeaturesAtIndex:(unint64_t)a3;
- (unint64_t)acousticFeaturesCount;
- (unint64_t)hash;
- (unint64_t)speechRecognitionFeaturesCount;
- (void)addAcousticFeatures:(id)a3;
- (void)addSpeechRecognitionFeatures:(id)a3;
- (void)clearAcousticFeatures;
- (void)clearSpeechRecognitionFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcousticFeatures:(id)a3;
- (void)setSpeechRecognitionFeatures:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXAudioAnalytics

- (void)clearSpeechRecognitionFeatures
{
}

- (void)addSpeechRecognitionFeatures:(id)a3
{
  id v4 = a3;
  speechRecognitionFeatures = self->_speechRecognitionFeatures;
  id v8 = v4;
  if (!speechRecognitionFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_speechRecognitionFeatures;
    self->_speechRecognitionFeatures = v6;

    id v4 = v8;
    speechRecognitionFeatures = self->_speechRecognitionFeatures;
  }
  [(NSMutableArray *)speechRecognitionFeatures addObject:v4];
}

- (unint64_t)speechRecognitionFeaturesCount
{
  return [(NSMutableArray *)self->_speechRecognitionFeatures count];
}

- (id)speechRecognitionFeaturesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_speechRecognitionFeatures objectAtIndex:a3];
}

+ (Class)speechRecognitionFeaturesType
{
  return (Class)objc_opt_class();
}

- (void)clearAcousticFeatures
{
}

- (void)addAcousticFeatures:(id)a3
{
  id v4 = a3;
  acousticFeatures = self->_acousticFeatures;
  id v8 = v4;
  if (!acousticFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_acousticFeatures;
    self->_acousticFeatures = v6;

    id v4 = v8;
    acousticFeatures = self->_acousticFeatures;
  }
  [(NSMutableArray *)acousticFeatures addObject:v4];
}

- (unint64_t)acousticFeaturesCount
{
  return [(NSMutableArray *)self->_acousticFeatures count];
}

- (id)acousticFeaturesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_acousticFeatures objectAtIndex:a3];
}

+ (Class)acousticFeaturesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXAudioAnalytics;
  id v4 = [(MXAudioAnalytics *)&v8 description];
  v5 = [(MXAudioAnalytics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_speechRecognitionFeatures count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_speechRecognitionFeatures, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_speechRecognitionFeatures;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"speech_recognition_features"];
  }
  if ([(NSMutableArray *)self->_acousticFeatures count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_acousticFeatures, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_acousticFeatures;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"acoustic_features"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXAudioAnalyticsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_speechRecognitionFeatures;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_acousticFeatures;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(MXAudioAnalytics *)self speechRecognitionFeaturesCount])
  {
    [v12 clearSpeechRecognitionFeatures];
    unint64_t v4 = [(MXAudioAnalytics *)self speechRecognitionFeaturesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MXAudioAnalytics *)self speechRecognitionFeaturesAtIndex:i];
        [v12 addSpeechRecognitionFeatures:v7];
      }
    }
  }
  if ([(MXAudioAnalytics *)self acousticFeaturesCount])
  {
    [v12 clearAcousticFeatures];
    unint64_t v8 = [(MXAudioAnalytics *)self acousticFeaturesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(MXAudioAnalytics *)self acousticFeaturesAtIndex:j];
        [v12 addAcousticFeatures:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_speechRecognitionFeatures;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addSpeechRecognitionFeatures:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_acousticFeatures;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addAcousticFeatures:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((speechRecognitionFeatures = self->_speechRecognitionFeatures,
         !((unint64_t)speechRecognitionFeatures | v4[2]))
     || -[NSMutableArray isEqual:](speechRecognitionFeatures, "isEqual:")))
  {
    acousticFeatures = self->_acousticFeatures;
    if ((unint64_t)acousticFeatures | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](acousticFeatures, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_speechRecognitionFeatures hash];
  return [(NSMutableArray *)self->_acousticFeatures hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(MXAudioAnalytics *)self addSpeechRecognitionFeatures:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[MXAudioAnalytics addAcousticFeatures:](self, "addAcousticFeatures:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)speechRecognitionFeatures
{
  return self->_speechRecognitionFeatures;
}

- (void)setSpeechRecognitionFeatures:(id)a3
{
}

- (NSMutableArray)acousticFeatures
{
  return self->_acousticFeatures;
}

- (void)setAcousticFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRecognitionFeatures, 0);

  objc_storeStrong((id *)&self->_acousticFeatures, 0);
}

@end