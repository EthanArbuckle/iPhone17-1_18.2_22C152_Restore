@interface NTPBSuggestionsFeedback
+ (Class)gradesType;
- (BOOL)hasFeedback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)grades;
- (NSString)feedback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gradesAtIndex:(unint64_t)a3;
- (unint64_t)gradesCount;
- (unint64_t)hash;
- (void)addGrades:(id)a3;
- (void)clearGrades;
- (void)mergeFrom:(id)a3;
- (void)setFeedback:(id)a3;
- (void)setGrades:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSuggestionsFeedback

- (void)clearGrades
{
}

- (void)addGrades:(id)a3
{
  id v4 = a3;
  grades = self->_grades;
  id v8 = v4;
  if (!grades)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_grades;
    self->_grades = v6;

    id v4 = v8;
    grades = self->_grades;
  }
  [(NSMutableArray *)grades addObject:v4];
}

- (unint64_t)gradesCount
{
  return [(NSMutableArray *)self->_grades count];
}

- (id)gradesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_grades objectAtIndex:a3];
}

+ (Class)gradesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeedback
{
  return self->_feedback != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSuggestionsFeedback;
  id v4 = [(NTPBSuggestionsFeedback *)&v8 description];
  v5 = [(NTPBSuggestionsFeedback *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_grades count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_grades, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_grades;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"grades"];
  }
  feedback = self->_feedback;
  if (feedback) {
    [v3 setObject:feedback forKey:@"feedback"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSuggestionsFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_grades;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_feedback) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_grades;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addGrades:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_feedback copyWithZone:a3];
  long long v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((grades = self->_grades, !((unint64_t)grades | v4[2]))
     || -[NSMutableArray isEqual:](grades, "isEqual:")))
  {
    feedback = self->_feedback;
    if ((unint64_t)feedback | v4[1]) {
      char v7 = -[NSString isEqual:](feedback, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_grades hash];
  return [(NSString *)self->_feedback hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NTPBSuggestionsFeedback addGrades:](self, "addGrades:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[1]) {
    -[NTPBSuggestionsFeedback setFeedback:](self, "setFeedback:");
  }
}

- (NSMutableArray)grades
{
  return self->_grades;
}

- (void)setGrades:(id)a3
{
}

- (NSString)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grades, 0);

  objc_storeStrong((id *)&self->_feedback, 0);
}

@end