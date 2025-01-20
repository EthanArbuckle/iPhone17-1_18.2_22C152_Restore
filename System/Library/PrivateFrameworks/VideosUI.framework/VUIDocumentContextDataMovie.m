@interface VUIDocumentContextDataMovie
- (BOOL)isEqual:(id)a3;
- (NSString)movieID;
- (VUIDocumentContextDataMovie)initWithMovieID:(id)a3;
- (id)jsonData;
@end

@implementation VUIDocumentContextDataMovie

- (VUIDocumentContextDataMovie)initWithMovieID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentContextDataMovie;
  v6 = [(VUIDocumentContextDataMovie *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_movieID, a3);
  }

  return v7;
}

- (id)jsonData
{
  v6[2] = *MEMORY[0x1E4F143B8];
  movieID = self->_movieID;
  v5[0] = @"id";
  v5[1] = @"type";
  v6[0] = movieID;
  v6[1] = @"Movie";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(VUIDocumentContextDataMovie *)self movieID];
    v7 = [v5 movieID];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)movieID
{
  return self->_movieID;
}

- (void).cxx_destruct
{
}

@end