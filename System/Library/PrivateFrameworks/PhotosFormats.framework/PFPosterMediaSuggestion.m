@interface PFPosterMediaSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)suggestionUUID;
- (PFPosterMediaSuggestion)initWithAssetUUID:(id)a3 suggestionUUID:(id)a4 suggestionSubtype:(unsigned __int16)a5;
- (PFPosterMediaSuggestion)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)suggestionSubtype;
- (void)encodeWithCoder:(id)a3;
- (void)setSuggestionSubtype:(unsigned __int16)a3;
- (void)setSuggestionUUID:(id)a3;
@end

@implementation PFPosterMediaSuggestion

- (void).cxx_destruct
{
}

- (void)setSuggestionSubtype:(unsigned __int16)a3
{
  self->_suggestionSubtype = a3;
}

- (unsigned)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (void)setSuggestionUUID:(id)a3
{
}

- (NSString)suggestionUUID
{
  return self->_suggestionUUID;
}

- (PFPosterMediaSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFPosterMediaSuggestion;
  v5 = [(PFPosterMedia *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionUUID"];
    suggestionUUID = v5->_suggestionUUID;
    v5->_suggestionUUID = (NSString *)v6;

    v5->_suggestionSubtype = [v4 decodeIntForKey:@"suggestionSubtype"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFPosterMediaSuggestion;
  id v4 = a3;
  [(PFPosterMedia *)&v6 encodeWithCoder:v4];
  v5 = [(PFPosterMediaSuggestion *)self suggestionUUID];
  [v4 encodeObject:v5 forKey:@"suggestionUUID"];

  objc_msgSend(v4, "encodeInt:forKey:", -[PFPosterMediaSuggestion suggestionSubtype](self, "suggestionSubtype"), @"suggestionSubtype");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PFPosterMediaSuggestion *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)PFPosterMediaSuggestion;
      if ([(PFPosterMedia *)&v10 isEqual:v5])
      {
        objc_super v6 = [(PFPosterMediaSuggestion *)self suggestionUUID];
        v7 = [(PFPosterMediaSuggestion *)v5 suggestionUUID];
        if (v6 == v7) {
          char v8 = 1;
        }
        else {
          char v8 = [v6 isEqual:v7];
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PFPosterMediaSuggestion;
  unint64_t v3 = [(PFPosterMedia *)&v7 hash];
  id v4 = [(PFPosterMediaSuggestion *)self suggestionUUID];
  unint64_t v5 = v3 ^ (2 * [v4 hash]);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PFPosterMediaSuggestion;
  id v4 = [(PFPosterMedia *)&v7 copyWithZone:a3];
  unint64_t v5 = [(PFPosterMediaSuggestion *)self suggestionUUID];
  [v4 setSuggestionUUID:v5];

  objc_msgSend(v4, "setSuggestionSubtype:", -[PFPosterMediaSuggestion suggestionSubtype](self, "suggestionSubtype"));
  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)PFPosterMediaSuggestion;
  id v4 = [(PFPosterMedia *)&v8 description];
  unint64_t v5 = [(PFPosterMediaSuggestion *)self suggestionUUID];
  objc_super v6 = objc_msgSend(v3, "initWithFormat:", @"<%@ suggestionUUID: %@; subtype: %hu>",
                 v4,
                 v5,
                 [(PFPosterMediaSuggestion *)self suggestionSubtype]);

  return v6;
}

- (PFPosterMediaSuggestion)initWithAssetUUID:(id)a3 suggestionUUID:(id)a4 suggestionSubtype:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFPosterMediaSuggestion;
  objc_super v10 = [(PFPosterMedia *)&v13 initWithAssetUUID:v8];
  v11 = v10;
  if (v10)
  {
    [(PFPosterMedia *)v10 setMediaType:2];
    [(PFPosterMediaSuggestion *)v11 setSuggestionUUID:v9];
    [(PFPosterMedia *)v11 setSubpath:v8];
    [(PFPosterMediaSuggestion *)v11 setSuggestionSubtype:v5];
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end