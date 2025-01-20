@interface PLPhotoAnalysisPersonSuggestion
- (BOOL)confirmed;
- (NSString)keyFaceLocalIdentifier;
- (NSString)personLocalIdentifier;
- (PLPhotoAnalysisPersonSuggestion)initWithSuggestionDictionary:(id)a3;
- (double)similarityScore;
- (id)description;
- (id)suggestionDictionaryRepresentation;
- (int64_t)keyFaceClusterSequenceNumber;
- (int64_t)personFaceCount;
@end

@implementation PLPhotoAnalysisPersonSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyFaceLocalIdentifier, 0);
}

- (double)similarityScore
{
  return self->_similarityScore;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (int64_t)personFaceCount
{
  return self->_personFaceCount;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (NSString)keyFaceLocalIdentifier
{
  return self->_keyFaceLocalIdentifier;
}

- (int64_t)keyFaceClusterSequenceNumber
{
  return self->_keyFaceClusterSequenceNumber;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLPhotoAnalysisPersonSuggestion;
  v4 = [(PLPhotoAnalysisPersonSuggestion *)&v8 description];
  v5 = [(PLPhotoAnalysisPersonSuggestion *)self suggestionDictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)suggestionDictionaryRepresentation
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"faceCSN";
  v3 = [NSNumber numberWithInteger:self->_keyFaceClusterSequenceNumber];
  keyFaceLocalIdentifier = self->_keyFaceLocalIdentifier;
  personLocalIdentifier = self->_personLocalIdentifier;
  v11[0] = v3;
  v11[1] = keyFaceLocalIdentifier;
  v10[1] = @"faceIdentifier";
  v10[2] = @"personIdentifier";
  v11[2] = personLocalIdentifier;
  v10[3] = @"personFaceCount";
  v6 = [NSNumber numberWithInteger:self->_personFaceCount];
  v11[3] = v6;
  v10[4] = @"confirmed";
  v7 = [NSNumber numberWithBool:self->_confirmed];
  v11[4] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (PLPhotoAnalysisPersonSuggestion)initWithSuggestionDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLPhotoAnalysisPersonSuggestion;
  v5 = [(PLPhotoAnalysisPersonSuggestion *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"faceCSN"];
    v7 = [v4 objectForKeyedSubscript:@"faceIdentifier"];
    objc_super v8 = [v4 objectForKeyedSubscript:@"personIdentifier"];
    v9 = [v4 objectForKeyedSubscript:@"personFaceCount"];
    v10 = [v4 objectForKeyedSubscript:@"confirmed"];
    v11 = [v4 objectForKeyedSubscript:@"similarityScore"];
    if (v6 && v7 && v8 && v10 && v9)
    {
      v5->_keyFaceClusterSequenceNumber = [v6 integerValue];
      uint64_t v12 = [v7 copy];
      keyFaceLocalIdentifier = v5->_keyFaceLocalIdentifier;
      v5->_keyFaceLocalIdentifier = (NSString *)v12;

      uint64_t v14 = [v8 copy];
      personLocalIdentifier = v5->_personLocalIdentifier;
      v5->_personLocalIdentifier = (NSString *)v14;

      v5->_personFaceCount = [v9 integerValue];
      v5->_confirmed = [v10 BOOLValue];
      if (v11) {
        [v11 doubleValue];
      }
      else {
        double v16 = 0.0;
      }
      v5->_similarityScore = v16;
    }
    else
    {

      v5 = 0;
    }
  }
  return v5;
}

@end