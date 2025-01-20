@interface TransitAlightMessage
- (GEOComposedString)detail;
- (GEOComposedString)title;
- (GEOPBTransitArtwork)artwork;
- (NSString)identifier;
- (TransitAlightMessage)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryValue;
- (unint64_t)stepIndex;
- (unint64_t)stopIndex;
- (void)setArtwork:(id)a3;
- (void)setDetail:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setStepIndex:(unint64_t)a3;
- (void)setStopIndex:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation TransitAlightMessage

- (TransitAlightMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TransitAlightMessage;
  v5 = [(IPCMessageObject *)&v23 initWithDictionary:v4];
  if (v5)
  {
    v6 = NSStringFromSelector("identifier");
    uint64_t v7 = [v4 objectForKeyedSubscript:v6];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = NSStringFromSelector("stopIndex");
    v10 = [v4 objectForKeyedSubscript:v9];
    v5->_stopIndex = (unint64_t)[v10 unsignedIntegerValue];

    v11 = NSStringFromSelector("stepIndex");
    v12 = [v4 objectForKeyedSubscript:v11];
    v5->_stepIndex = (unint64_t)[v12 unsignedIntegerValue];

    v13 = NSStringFromSelector("artwork");
    uint64_t v14 = [v4 objectForKeyedSubscript:v13];
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v14;

    v16 = NSStringFromSelector("title");
    uint64_t v17 = [v4 objectForKeyedSubscript:v16];
    title = v5->_title;
    v5->_title = (GEOComposedString *)v17;

    v19 = NSStringFromSelector("detail");
    uint64_t v20 = [v4 objectForKeyedSubscript:v19];
    detail = v5->_detail;
    v5->_detail = (GEOComposedString *)v20;
  }
  return v5;
}

- (id)dictionaryValue
{
  v18.receiver = self;
  v18.super_class = (Class)TransitAlightMessage;
  v3 = [(IPCMessageObject *)&v18 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = [(TransitAlightMessage *)self identifier];
  v6 = NSStringFromSelector("identifier");
  [v4 setObject:v5 forKeyedSubscript:v6];

  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:[(TransitAlightMessage *)self stopIndex]];
  v8 = NSStringFromSelector("stopIndex");
  [v4 setObject:v7 forKeyedSubscript:v8];

  v9 = +[NSNumber numberWithUnsignedInteger:[(TransitAlightMessage *)self stepIndex]];
  v10 = NSStringFromSelector("stepIndex");
  [v4 setObject:v9 forKeyedSubscript:v10];

  v11 = [(TransitAlightMessage *)self artwork];
  v12 = NSStringFromSelector("artwork");
  [v4 setObject:v11 forKeyedSubscript:v12];

  v13 = [(TransitAlightMessage *)self title];
  uint64_t v14 = NSStringFromSelector("title");
  [v4 setObject:v13 forKeyedSubscript:v14];

  v15 = [(TransitAlightMessage *)self detail];
  v16 = NSStringFromSelector("detail");
  [v4 setObject:v15 forKeyedSubscript:v16];

  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(TransitAlightMessage *)self dictionaryValue];
  v5 = +[NSString stringWithFormat:@"<%@:%p> %@", v3, self, v4];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)stopIndex
{
  return self->_stopIndex;
}

- (void)setStopIndex:(unint64_t)a3
{
  self->_stopIndex = a3;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (GEOComposedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (GEOComposedString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end