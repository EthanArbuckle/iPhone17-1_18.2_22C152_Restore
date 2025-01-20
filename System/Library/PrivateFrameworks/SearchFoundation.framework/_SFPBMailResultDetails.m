@interface _SFPBMailResultDetails
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBMailResultDetails)initWithDictionary:(id)a3;
- (_SFPBMailResultDetails)initWithFacade:(id)a3;
- (_SFPBMailResultDetails)initWithJSON:(id)a3;
- (float)suggestionScore;
- (id)dictionaryRepresentation;
- (int)dataSources;
- (int)skgMegadomeSpotlightIndexEntries;
- (unint64_t)hash;
- (void)setDataSources:(int)a3;
- (void)setSkgMegadomeSpotlightIndexEntries:(int)a3;
- (void)setSuggestionScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMailResultDetails

- (_SFPBMailResultDetails)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBMailResultDetails *)self init];
  if (v5)
  {
    if ([v4 hasDataSources]) {
      -[_SFPBMailResultDetails setDataSources:](v5, "setDataSources:", [v4 dataSources]);
    }
    v6 = [v4 suggestionScore];

    if (v6)
    {
      v7 = [v4 suggestionScore];
      [v7 floatValue];
      -[_SFPBMailResultDetails setSuggestionScore:](v5, "setSuggestionScore:");
    }
    v8 = [v4 skgMegadomeSpotlightIndexEntries];

    if (v8)
    {
      v9 = [v4 skgMegadomeSpotlightIndexEntries];
      -[_SFPBMailResultDetails setSkgMegadomeSpotlightIndexEntries:](v5, "setSkgMegadomeSpotlightIndexEntries:", [v9 intValue]);
    }
    v10 = v5;
  }

  return v5;
}

- (int)skgMegadomeSpotlightIndexEntries
{
  return self->_skgMegadomeSpotlightIndexEntries;
}

- (float)suggestionScore
{
  return self->_suggestionScore;
}

- (int)dataSources
{
  return self->_dataSources;
}

- (_SFPBMailResultDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBMailResultDetails;
  v5 = [(_SFPBMailResultDetails *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"dataSources"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMailResultDetails setDataSources:](v5, "setDataSources:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"suggestionScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[_SFPBMailResultDetails setSuggestionScore:](v5, "setSuggestionScore:");
    }
    v8 = [v4 objectForKeyedSubscript:@"skgMegadomeSpotlightIndexEntries"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMailResultDetails setSkgMegadomeSpotlightIndexEntries:](v5, "setSkgMegadomeSpotlightIndexEntries:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBMailResultDetails)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMailResultDetails *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMailResultDetails *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_dataSources)
  {
    uint64_t v4 = [(_SFPBMailResultDetails *)self dataSources];
    if (v4 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2F070[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"dataSources"];
  }
  if (self->_skgMegadomeSpotlightIndexEntries)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBMailResultDetails skgMegadomeSpotlightIndexEntries](self, "skgMegadomeSpotlightIndexEntries"));
    [v3 setObject:v6 forKeyedSubscript:@"skgMegadomeSpotlightIndexEntries"];
  }
  if (self->_suggestionScore != 0.0)
  {
    uint64_t v7 = NSNumber;
    [(_SFPBMailResultDetails *)self suggestionScore];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"suggestionScore"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t dataSources = self->_dataSources;
  float suggestionScore = self->_suggestionScore;
  BOOL v5 = suggestionScore < 0.0;
  if (suggestionScore == 0.0)
  {
    unint64_t v10 = 0;
  }
  else
  {
    double v6 = suggestionScore;
    double v7 = -v6;
    if (!v5) {
      double v7 = v6;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v10 += (unint64_t)v9;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  return v10 ^ (2654435761 * dataSources) ^ (2654435761 * self->_skgMegadomeSpotlightIndexEntries);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int dataSources = self->_dataSources, dataSources == [v4 dataSources])
    && (float suggestionScore = self->_suggestionScore, [v4 suggestionScore], suggestionScore == v7))
  {
    int skgMegadomeSpotlightIndexEntries = self->_skgMegadomeSpotlightIndexEntries;
    BOOL v8 = skgMegadomeSpotlightIndexEntries == [v4 skgMegadomeSpotlightIndexEntries];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_SFPBMailResultDetails *)self dataSources]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBMailResultDetails *)self suggestionScore];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  int v5 = [(_SFPBMailResultDetails *)self skgMegadomeSpotlightIndexEntries];
  double v6 = v7;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    double v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMailResultDetailsReadFrom(self, (uint64_t)a3, v3);
}

- (void)setSkgMegadomeSpotlightIndexEntries:(int)a3
{
  self->_int skgMegadomeSpotlightIndexEntries = a3;
}

- (void)setSuggestionScore:(float)a3
{
  self->_float suggestionScore = a3;
}

- (void)setDataSources:(int)a3
{
  self->_int dataSources = a3;
}

@end