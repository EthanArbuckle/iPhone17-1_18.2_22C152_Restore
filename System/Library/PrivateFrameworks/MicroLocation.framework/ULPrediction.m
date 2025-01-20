@interface ULPrediction
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSArray)confidenceReasons;
- (NSArray)places;
- (NSDate)time;
- (NSError)error;
- (NSUUID)requestIdentifier;
- (ULPrediction)init;
- (ULPrediction)initWithCoder:(id)a3;
- (ULPrediction)initWithPlaces:(id)a3 error:(id)a4 requestIdentifier:(id)a5 time:(id)a6 confidence:(unint64_t)a7 confidenceReasons:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)confidence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(unint64_t)a3;
- (void)setConfidenceReasons:(id)a3;
- (void)setError:(id)a3;
- (void)setPlaces:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation ULPrediction

- (ULPrediction)initWithPlaces:(id)a3 error:(id)a4 requestIdentifier:(id)a5 time:(id)a6 confidence:(unint64_t)a7 confidenceReasons:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)ULPrediction;
  v19 = [(ULPrediction *)&v23 init];
  v20 = v19;
  if (v19)
  {
    [(ULPrediction *)v19 setPlaces:v14];
    [(ULPrediction *)v20 setError:v15];
    [(ULPrediction *)v20 setRequestIdentifier:v16];
    [(ULPrediction *)v20 setTime:v17];
    [(ULPrediction *)v20 setConfidence:a7];
    [(ULPrediction *)v20 setConfidenceReasons:v18];
    v21 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v17 = objc_alloc((Class)objc_opt_class());
  id v18 = [(ULPrediction *)self places];
  v5 = (void *)[v18 copyWithZone:a3];
  v6 = [(ULPrediction *)self error];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(ULPrediction *)self requestIdentifier];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = [(ULPrediction *)self time];
  v11 = (void *)[v10 copyWithZone:a3];
  unint64_t v12 = [(ULPrediction *)self confidence];
  v13 = [(ULPrediction *)self confidenceReasons];
  id v14 = (void *)[v13 copyWithZone:a3];
  id v15 = (void *)[v17 initWithPlaces:v5 error:v7 requestIdentifier:v9 time:v11 confidence:v12 confidenceReasons:v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  places = self->_places;
  id v6 = a3;
  [v6 encodeObject:places forKey:@"places"];
  [v6 encodeObject:self->_error forKey:@"error"];
  [v6 encodeObject:self->_requestIdentifier forKey:@"requestIdentifier"];
  [v6 encodeObject:self->_time forKey:@"time"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_confidence];
  [v6 encodeObject:v5 forKey:@"confidence"];

  [v6 encodeObject:self->_confidenceReasons forKey:@"confidenceReasons"];
}

- (ULPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ULPrediction;
  v5 = [(ULPrediction *)&v26 init];
  if (v5)
  {
    id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"places"];
    if (v6)
    {
      uint64_t v7 = self;

      places = v5->_places;
      v5->_places = (NSArray *)v7;

      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
      uint64_t v10 = self;

      error = v5->_error;
      v5->_error = (NSError *)v10;

      unint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
      uint64_t v13 = self;

      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSUUID *)v13;

      id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
      uint64_t v16 = self;

      id v17 = v5->_error;
      v5->_error = (NSError *)v16;

      id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
      uint64_t v19 = self;

      time = v5->_time;
      v5->_time = (NSDate *)v19;

      v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confidence"];
      id v6 = v21;
      if (v21)
      {
        uint64_t v22 = [(ULPrediction *)v21 unsignedIntegerValue];

        v5->_confidence = v22;
        id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"confidenceReasons"];
        if (v6)
        {
          uint64_t v23 = self;

          confidenceReasons = v5->_confidenceReasons;
          v5->_confidenceReasons = (NSArray *)v23;

          id v6 = v5;
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", places: %@", self->_places];
  [v6 appendFormat:@", error: %@", self->_error];
  [v6 appendFormat:@", requestIdentifier: %@", self->_requestIdentifier];
  [v6 appendFormat:@", time: %@", self->_time];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_confidence];
  [v6 appendFormat:@", confidence: %@", v7];

  [v6 appendFormat:@", confidenceReasons: %@", self->_confidenceReasons];
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(ULPrediction *)self places];
    uint64_t v7 = [v5 places];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      v9 = [(ULPrediction *)self places];
      uint64_t v10 = [v5 places];

      if (v9 != v10) {
        goto LABEL_21;
      }
    }
    v11 = [(ULPrediction *)self error];
    unint64_t v12 = [v5 error];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      uint64_t v13 = [(ULPrediction *)self error];
      id v14 = [v5 error];

      if (v13 != v14) {
        goto LABEL_21;
      }
    }
    id v15 = [(ULPrediction *)self requestIdentifier];
    uint64_t v16 = [v5 requestIdentifier];
    if ([v15 isEqual:v16])
    {
    }
    else
    {
      id v17 = [(ULPrediction *)self requestIdentifier];
      id v18 = [v5 requestIdentifier];

      if (v17 != v18) {
        goto LABEL_21;
      }
    }
    uint64_t v19 = [(ULPrediction *)self time];
    v20 = [v5 time];
    if ([v19 isEqual:v20])
    {
    }
    else
    {
      v21 = [(ULPrediction *)self time];
      uint64_t v22 = [v5 time];

      if (v21 != v22) {
        goto LABEL_21;
      }
    }
    uint64_t v23 = [(ULPrediction *)self error];
    v24 = [v5 error];
    if ([v23 isEqual:v24])
    {
    }
    else
    {
      v25 = [(ULPrediction *)self error];
      objc_super v26 = [v5 error];

      if (v25 != v26) {
        goto LABEL_21;
      }
    }
    unint64_t v27 = [(ULPrediction *)self confidence];
    if (v27 == [v5 confidence])
    {
      v28 = [(ULPrediction *)self confidenceReasons];
      v29 = [v5 confidenceReasons];
      if ([v28 isEqual:v29])
      {

        char v8 = 1;
      }
      else
      {
        v31 = [(ULPrediction *)self confidenceReasons];
        v32 = [v5 confidenceReasons];
        BOOL v33 = v31 != v32;

        char v8 = !v33;
      }
      goto LABEL_22;
    }
LABEL_21:
    char v8 = 0;
LABEL_22:

    goto LABEL_23;
  }
  char v8 = 0;
LABEL_23:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_places hash];
  uint64_t v4 = [(NSError *)self->_error hash] ^ v3;
  uint64_t v5 = [(NSUUID *)self->_requestIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_time hash];
  unint64_t v7 = [(NSError *)self->_error hash] ^ self->_confidence;
  return v6 ^ v7 ^ [(NSArray *)self->_confidenceReasons hash];
}

- (ULPrediction)init
{
}

+ (id)new
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSArray)confidenceReasons
{
  return self->_confidenceReasons;
}

- (void)setConfidenceReasons:(id)a3
{
}

- (NSArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_confidenceReasons, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end