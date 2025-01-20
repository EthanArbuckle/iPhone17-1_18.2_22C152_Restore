@interface SPParsecArchive
+ (BOOL)supportsSecureCoding;
+ (id)archiveBasePath;
+ (id)archivePathForQuery:(id)a3;
+ (void)deleteArchives;
- (BOOL)suggestionsAreBlended;
- (NSArray)corrections;
- (NSArray)resultsSections;
- (NSArray)suggestions;
- (PRSQueryTask)query;
- (SPParsecArchive)initWithCoder:(id)a3;
- (SPParsecArchive)initWithQuery:(id)a3 withResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 suggestionsAreBlended:(BOOL)a7 withStore:(id)a8;
- (SSPlistDataReader)cannedCEPValues;
- (SSPlistDataReader)cepDictionary;
- (_MDPlistContainer)decodeMDPlistContainerWithCoder:(id)a3 forKey:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCannedCEPValues:(id)a3;
- (void)setCepDictionary:(id)a3;
- (void)setCorrections:(id)a3;
- (void)setQuery:(id)a3;
- (void)setResultsSections:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setSuggestionsAreBlended:(BOOL)a3;
@end

@implementation SPParsecArchive

+ (id)archivePathForQuery:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() archiveBasePath];
  v5 = +[NSFileManager defaultManager];
  char v9 = 1;
  if (([v5 fileExistsAtPath:v4 isDirectory:&v9] & 1) == 0 && v9)
  {
    uint64_t v8 = 0;
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v8];
  }
  v6 = [v4 stringByAppendingFormat:@"/%@", v3];

  return v6;
}

+ (void)deleteArchives
{
  id v4 = +[NSFileManager defaultManager];
  id v3 = [a1 archiveBasePath];
  [v4 removeItemAtPath:v3 error:0];
}

+ (id)archiveBasePath
{
  v2 = NSHomeDirectory();
  id v3 = [v2 stringByAppendingString:@"/Library/Spotlight/ParsecArchive"];

  return v3;
}

- (SPParsecArchive)initWithQuery:(id)a3 withResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 suggestionsAreBlended:(BOOL)a7 withStore:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)SPParsecArchive;
  v19 = [(SPParsecArchive *)&v26 init];
  v20 = v19;
  if (v19)
  {
    [(SPParsecArchive *)v19 setQuery:v14];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SPParsecArchive *)v20 setResultsSections:v15];
    }
    objc_storeStrong((id *)&v20->_suggestions, a5);
    objc_storeStrong((id *)&v20->_corrections, a6);
    uint64_t v21 = [v18 cepDictionary];
    cepDictionary = v20->_cepDictionary;
    v20->_cepDictionary = (SSPlistDataReader *)v21;

    uint64_t v23 = [v18 cannedCEPValues];
    cannedCEPValues = v20->_cannedCEPValues;
    v20->_cannedCEPValues = (SSPlistDataReader *)v23;

    v20->_suggestionsAreBlended = a7;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  query = self->_query;
  id v7 = a3;
  [v7 encodeObject:query forKey:@"_query"];
  [v7 encodeObject:self->_resultsSections forKey:@"_resultsSections"];
  [v7 encodeObject:self->_suggestions forKey:@"_suggestions"];
  [v7 encodeObject:self->_corrections forKey:@"_corrections"];
  [(SSPlistDataReader *)self->_cepDictionary container];
  uint64_t Bytes = _MDPlistContainerGetBytes();
  [v7 encodeBytes:Bytes length:_MDPlistContainerGetLength() forKey:@"_cepDictionaryData"];
  [(SSPlistDataReader *)self->_cannedCEPValues container];
  uint64_t v6 = _MDPlistContainerGetBytes();
  [v7 encodeBytes:v6 length:_MDPlistContainerGetLength() forKey:@"_cannedCEPValuesData"];
}

- (_MDPlistContainer)decodeMDPlistContainerWithCoder:(id)a3 forKey:(id)a4
{
  size_t size = 0;
  id v4 = [a3 decodeBytesForKey:a4 returnedLength:&size];
  result = 0;
  if (size) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    result = (_MDPlistContainer *)malloc_type_malloc(size, 0x9B9A549AuLL);
    if (result)
    {
      id v7 = result;
      memcpy(result, v4, size);
      result = (_MDPlistContainer *)_MDPlistContainerCreateWithBytes();
      if (!result)
      {
        free(v7);
        return 0;
      }
    }
  }
  return result;
}

- (SPParsecArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SPParsecArchive;
  v5 = [(SPParsecArchive *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_query"];
    query = v5->_query;
    v5->_query = (PRSQueryTask *)v6;

    uint64_t v8 = objc_opt_class();
    char v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_resultsSections"];
    resultsSections = v5->_resultsSections;
    v5->_resultsSections = (NSArray *)v10;

    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_suggestions"];
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    id v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_corrections"];
    corrections = v5->_corrections;
    v5->_corrections = (NSArray *)v18;

    v20 = [(SPParsecArchive *)v5 decodeMDPlistContainerWithCoder:v4 forKey:@"_cepDictionaryData"];
    uint64_t v21 = (SSPlistDataReader *)[objc_alloc((Class)SSPlistDataReader) initWithPlistContainer:v20];
    cepDictionary = v5->_cepDictionary;
    v5->_cepDictionary = v21;

    if (v20) {
      CFRelease(v20);
    }
    uint64_t v23 = [(SPParsecArchive *)v5 decodeMDPlistContainerWithCoder:v4 forKey:@"_cannedCEPValuesData"];
    v24 = (SSPlistDataReader *)[objc_alloc((Class)SSPlistDataReader) initWithPlistContainer:v23];
    cannedCEPValues = v5->_cannedCEPValues;
    v5->_cannedCEPValues = v24;

    if (v23) {
      CFRelease(v23);
    }
  }

  return v5;
}

- (PRSQueryTask)query
{
  return (PRSQueryTask *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQuery:(id)a3
{
}

- (NSArray)resultsSections
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResultsSections:(id)a3
{
}

- (NSArray)suggestions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSuggestions:(id)a3
{
}

- (NSArray)corrections
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCorrections:(id)a3
{
}

- (SSPlistDataReader)cepDictionary
{
  return (SSPlistDataReader *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCepDictionary:(id)a3
{
}

- (SSPlistDataReader)cannedCEPValues
{
  return (SSPlistDataReader *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCannedCEPValues:(id)a3
{
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cannedCEPValues, 0);
  objc_storeStrong((id *)&self->_cepDictionary, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_resultsSections, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end