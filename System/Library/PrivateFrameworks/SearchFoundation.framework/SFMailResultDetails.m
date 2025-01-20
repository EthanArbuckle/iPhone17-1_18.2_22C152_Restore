@interface SFMailResultDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDataSources;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)skgMegadomeSpotlightIndexEntries;
- (NSNumber)suggestionScore;
- (SFMailResultDetails)initWithCoder:(id)a3;
- (SFMailResultDetails)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)dataSources;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDataSources:(int)a3;
- (void)setSkgMegadomeSpotlightIndexEntries:(id)a3;
- (void)setSuggestionScore:(id)a3;
@end

@implementation SFMailResultDetails

- (SFMailResultDetails)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFMailResultDetails;
  v5 = [(SFMailResultDetails *)&v12 init];
  if (v5)
  {
    if ([v4 dataSources]) {
      -[SFMailResultDetails setDataSources:](v5, "setDataSources:", [v4 dataSources]);
    }
    [v4 suggestionScore];
    if (v6 != 0.0)
    {
      v7 = NSNumber;
      [v4 suggestionScore];
      v8 = objc_msgSend(v7, "numberWithFloat:");
      [(SFMailResultDetails *)v5 setSuggestionScore:v8];
    }
    if ([v4 skgMegadomeSpotlightIndexEntries])
    {
      v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "skgMegadomeSpotlightIndexEntries"));
      [(SFMailResultDetails *)v5 setSkgMegadomeSpotlightIndexEntries:v9];
    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skgMegadomeSpotlightIndexEntries, 0);
  objc_storeStrong((id *)&self->_suggestionScore, 0);
}

- (void)setSkgMegadomeSpotlightIndexEntries:(id)a3
{
}

- (NSNumber)skgMegadomeSpotlightIndexEntries
{
  return self->_skgMegadomeSpotlightIndexEntries;
}

- (void)setSuggestionScore:(id)a3
{
}

- (NSNumber)suggestionScore
{
  return self->_suggestionScore;
}

- (int)dataSources
{
  return self->_dataSources;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SFMailResultDetails *)self dataSources];
  id v4 = [(SFMailResultDetails *)self suggestionScore];
  uint64_t v5 = [v4 hash] ^ v3;
  float v6 = [(SFMailResultDetails *)self skgMegadomeSpotlightIndexEntries];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFMailResultDetails *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if ([(SFMailResultDetails *)v5 isMemberOfClass:objc_opt_class()])
    {
      float v6 = v5;
      int v7 = [(SFMailResultDetails *)self dataSources];
      if (v7 != [(SFMailResultDetails *)v6 dataSources])
      {
        char v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v8 = [(SFMailResultDetails *)self suggestionScore];
      v9 = [(SFMailResultDetails *)v6 suggestionScore];
      if ((v8 == 0) == (v9 != 0))
      {
        char v12 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v10 = [(SFMailResultDetails *)self suggestionScore];
      if (v10)
      {
        uint64_t v3 = [(SFMailResultDetails *)self suggestionScore];
        v11 = [(SFMailResultDetails *)v6 suggestionScore];
        if (![v3 isEqual:v11])
        {
          char v12 = 0;
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
        v22 = v11;
      }
      v13 = [(SFMailResultDetails *)self skgMegadomeSpotlightIndexEntries];
      v14 = [(SFMailResultDetails *)v6 skgMegadomeSpotlightIndexEntries];
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        char v12 = 0;
      }
      else
      {
        uint64_t v16 = [(SFMailResultDetails *)self skgMegadomeSpotlightIndexEntries];
        if (v16)
        {
          v17 = (void *)v16;
          v20 = [(SFMailResultDetails *)self skgMegadomeSpotlightIndexEntries];
          [(SFMailResultDetails *)v6 skgMegadomeSpotlightIndexEntries];
          v18 = v21 = v3;
          char v12 = [v20 isEqual:v18];

          uint64_t v3 = v21;
        }
        else
        {

          char v12 = 1;
        }
      }
      v11 = v22;
      if (!v10) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    char v12 = 0;
  }
LABEL_23:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDataSources:", -[SFMailResultDetails dataSources](self, "dataSources"));
  uint64_t v5 = [(SFMailResultDetails *)self suggestionScore];
  float v6 = (void *)[v5 copy];
  [v4 setSuggestionScore:v6];

  int v7 = [(SFMailResultDetails *)self skgMegadomeSpotlightIndexEntries];
  v8 = (void *)[v7 copy];
  [v4 setSkgMegadomeSpotlightIndexEntries:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMailResultDetails alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMailResultDetails *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMailResultDetails alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMailResultDetails *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  float v6 = [[_SFPBMailResultDetails alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBMailResultDetails *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFMailResultDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  float v6 = [[_SFPBMailResultDetails alloc] initWithData:v5];
  int v7 = [(SFMailResultDetails *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasDataSources
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDataSources:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataSources = a3;
}

@end