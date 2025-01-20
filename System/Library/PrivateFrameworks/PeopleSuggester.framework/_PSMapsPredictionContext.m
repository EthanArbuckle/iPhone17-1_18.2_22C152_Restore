@interface _PSMapsPredictionContext
+ (BOOL)supportsSecureCoding;
- (NSArray)seedContactIdentifiers;
- (NSDate)suggestionDate;
- (NSString)bundleID;
- (NSString)navigationEndLocationId;
- (NSString)navigationStartLocationId;
- (_PSMapsPredictionContext)init;
- (_PSMapsPredictionContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setNavigationEndLocationId:(id)a3;
- (void)setNavigationStartLocationId:(id)a3;
- (void)setSeedContactIdentifiers:(id)a3;
- (void)setSuggestionDate:(id)a3;
@end

@implementation _PSMapsPredictionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSMapsPredictionContext)init
{
  v10.receiver = self;
  v10.super_class = (Class)_PSMapsPredictionContext;
  v2 = [(_PSMapsPredictionContext *)&v10 init];
  v3 = v2;
  if (v2)
  {
    suggestionDate = v2->_suggestionDate;
    v2->_suggestionDate = 0;

    bundleID = v3->_bundleID;
    v3->_bundleID = 0;

    navigationStartLocationId = v3->_navigationStartLocationId;
    v3->_navigationStartLocationId = 0;

    navigationEndLocationId = v3->_navigationEndLocationId;
    v3->_navigationEndLocationId = 0;

    seedContactIdentifiers = v3->_seedContactIdentifiers;
    v3->_seedContactIdentifiers = 0;
  }
  return v3;
}

- (NSDate)suggestionDate
{
  suggestionDate = self->_suggestionDate;
  if (!suggestionDate)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    v5 = self->_suggestionDate;
    self->_suggestionDate = v4;

    suggestionDate = self->_suggestionDate;
  }

  return suggestionDate;
}

- (_PSMapsPredictionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_PSMapsPredictionContext;
  v5 = [(_PSMapsPredictionContext *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionDate"];
    suggestionDate = v5->_suggestionDate;
    v5->_suggestionDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"navigationStartLocationId"];
    navigationStartLocationId = v5->_navigationStartLocationId;
    v5->_navigationStartLocationId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"navigationEndLocationId"];
    navigationEndLocationId = v5->_navigationEndLocationId;
    v5->_navigationEndLocationId = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"seedContactIdentifiers"];
    seedContactIdentifiers = v5->_seedContactIdentifiers;
    v5->_seedContactIdentifiers = (NSArray *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  suggestionDate = self->_suggestionDate;
  id v5 = a3;
  [v5 encodeObject:suggestionDate forKey:@"suggestionDate"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_navigationStartLocationId forKey:@"navigationStartLocationId"];
  [v5 encodeObject:self->_navigationEndLocationId forKey:@"navigationEndLocationId"];
  [v5 encodeObject:self->_seedContactIdentifiers forKey:@"seedContactIdentifiers"];
}

- (void)setSuggestionDate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)navigationStartLocationId
{
  return self->_navigationStartLocationId;
}

- (void)setNavigationStartLocationId:(id)a3
{
}

- (NSString)navigationEndLocationId
{
  return self->_navigationEndLocationId;
}

- (void)setNavigationEndLocationId:(id)a3
{
}

- (NSArray)seedContactIdentifiers
{
  return self->_seedContactIdentifiers;
}

- (void)setSeedContactIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_navigationEndLocationId, 0);
  objc_storeStrong((id *)&self->_navigationStartLocationId, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_suggestionDate, 0);
}

@end