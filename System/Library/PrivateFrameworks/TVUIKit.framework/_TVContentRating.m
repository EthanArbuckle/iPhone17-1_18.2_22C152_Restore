@interface _TVContentRating
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContent;
- (NSString)ratingDescription;
- (NSString)ratingLabel;
- (NSString)ratingSystemString;
- (NSString)stringRepresentation;
- (_TVContentRating)init;
- (_TVContentRating)initWithRatingSystem:(int64_t)a3 explicitContent:(BOOL)a4;
- (_TVContentRating)initWithRatingSystem:(int64_t)a3 ratingLabel:(id)a4 rank:(unint64_t)a5 ratingDescription:(id)a6;
- (_TVContentRating)initWithRatingSystemString:(id)a3 ratingLabel:(id)a4 rank:(unint64_t)a5 ratingDescription:(id)a6;
- (_TVContentRating)initWithStringRepresentation:(id)a3;
- (id)description;
- (int64_t)ratingSystem;
- (int64_t)ratingSystemKind;
- (unint64_t)hash;
- (unint64_t)rank;
@end

@implementation _TVContentRating

+ (id)new
{
  return 0;
}

- (_TVContentRating)init
{
  return 0;
}

- (_TVContentRating)initWithRatingSystem:(int64_t)a3 ratingLabel:(id)a4 rank:(unint64_t)a5 ratingDescription:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_TVContentRating;
  v12 = [(_TVContentRating *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_ratingSystem = a3;
    uint64_t v14 = [v10 copy];
    ratingLabel = v13->_ratingLabel;
    v13->_ratingLabel = (NSString *)v14;

    v13->_rank = a5;
    uint64_t v16 = [v11 copy];
    ratingDescription = v13->_ratingDescription;
    v13->_ratingDescription = (NSString *)v16;
  }
  return v13;
}

- (_TVContentRating)initWithRatingSystemString:(id)a3 ratingLabel:(id)a4 rank:(unint64_t)a5 ratingDescription:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = [(_TVContentRating *)self initWithRatingSystem:+[_TVContentRatingSystemUtilities ratingSystemForString:a3] ratingLabel:v11 rank:a5 ratingDescription:v10];

  return v12;
}

- (_TVContentRating)initWithRatingSystem:(int64_t)a3 explicitContent:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 200;
  }
  else {
    uint64_t v4 = 0;
  }
  return [(_TVContentRating *)self initWithRatingSystem:a3 ratingLabel:0 rank:v4 ratingDescription:0];
}

- (_TVContentRating)initWithStringRepresentation:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  v6 = [v4 characterSetWithCharactersInString:@"|"];
  v7 = [v5 componentsSeparatedByCharactersInSet:v6];

  v8 = (void *)[v7 count];
  if (v8)
  {
    v9 = [v7 objectAtIndex:0];
    if (v8 == (void *)1)
    {
      uint64_t v10 = 0;
      id v11 = 0;
      goto LABEL_9;
    }
    id v11 = [v7 objectAtIndex:1];
    if ((unint64_t)v8 < 3)
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    v12 = [v7 objectAtIndex:2];
    uint64_t v10 = [v12 integerValue];

    if (v8 == (void *)3)
    {
LABEL_9:
      v8 = 0;
      goto LABEL_10;
    }
    v8 = [v7 objectAtIndex:3];
  }
  else
  {
    uint64_t v10 = 0;
    v9 = 0;
    id v11 = 0;
  }
LABEL_10:
  v13 = [(_TVContentRating *)self initWithRatingSystemString:v9 ratingLabel:v11 rank:v10 ratingDescription:v8];

  return v13;
}

- (int64_t)ratingSystemKind
{
  int64_t v2 = [(_TVContentRating *)self ratingSystem];
  return +[_TVContentRatingSystemUtilities ratingSystemKindForRatingSystem:v2];
}

- (NSString)ratingSystemString
{
  int64_t v2 = [(_TVContentRating *)self ratingSystem];
  return (NSString *)+[_TVContentRatingSystemUtilities stringForRatingSystem:v2];
}

- (BOOL)isExplicitContent
{
  return [(_TVContentRating *)self ratingSystem] == 1 && self->_rank == 200;
}

- (NSString)stringRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v4 = +[_TVContentRatingSystemUtilities stringForRatingSystem:self->_ratingSystem];
  [v3 appendFormat:@"%@|", v4];

  ratingLabel = (__CFString *)self->_ratingLabel;
  if (!ratingLabel) {
    ratingLabel = &stru_26F2B1FA0;
  }
  [v3 appendFormat:@"%@|", ratingLabel];
  objc_msgSend(v3, "appendFormat:", @"%lu|", self->_rank);
  if (self->_ratingDescription) {
    ratingDescription = (__CFString *)self->_ratingDescription;
  }
  else {
    ratingDescription = &stru_26F2B1FA0;
  }
  [v3 appendString:ratingDescription];
  return (NSString *)v3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_TVContentRating;
  uint64_t v4 = [(_TVContentRating *)&v8 description];
  id v5 = [(_TVContentRating *)self stringRepresentation];
  v6 = [v3 stringWithFormat:@"%@ [%@]", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_TVContentRating *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v19 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        int64_t v7 = [(_TVContentRating *)self ratingSystem];
        if (v7 != [(_TVContentRating *)v6 ratingSystem]) {
          goto LABEL_10;
        }
        unint64_t v8 = [(_TVContentRating *)self rank];
        if (v8 != [(_TVContentRating *)v6 rank]) {
          goto LABEL_10;
        }
        v9 = [(_TVContentRating *)self ratingLabel];
        uint64_t v10 = [(_TVContentRating *)v6 ratingLabel];
        if (v9 == (void *)v10)
        {
        }
        else
        {
          id v11 = (void *)v10;
          uint64_t v12 = [(_TVContentRating *)self ratingLabel];
          if (!v12)
          {
            char v19 = 0;
            goto LABEL_24;
          }
          v13 = (void *)v12;
          uint64_t v14 = [(_TVContentRating *)v6 ratingLabel];
          if (!v14) {
            goto LABEL_18;
          }
          v15 = (void *)v14;
          uint64_t v16 = [(_TVContentRating *)self ratingLabel];
          v17 = [(_TVContentRating *)v6 ratingLabel];
          int v18 = [v16 isEqual:v17];

          if (!v18)
          {
LABEL_10:
            char v19 = 0;
LABEL_25:

            goto LABEL_26;
          }
        }
        v9 = [(_TVContentRating *)self ratingDescription];
        id v11 = [(_TVContentRating *)v6 ratingDescription];
        if (v9 != v11)
        {
          v13 = [(_TVContentRating *)self ratingDescription];
          if (v13)
          {
            v20 = [(_TVContentRating *)v6 ratingDescription];
            if (v20)
            {
              v21 = [(_TVContentRating *)self ratingDescription];
              v22 = [(_TVContentRating *)v6 ratingDescription];
              char v19 = [v21 isEqual:v22];
            }
            else
            {
              char v19 = 0;
            }

            goto LABEL_23;
          }
LABEL_18:
          char v19 = 0;
LABEL_23:

          goto LABEL_24;
        }
        char v19 = 1;
LABEL_24:

        goto LABEL_25;
      }
    }
    char v19 = 0;
  }
LABEL_26:

  return v19;
}

- (unint64_t)hash
{
  int64_t v3 = [(_TVContentRating *)self ratingSystem];
  unint64_t v4 = v3 ^ (2 * [(_TVContentRating *)self rank]);
  id v5 = [(_TVContentRating *)self ratingLabel];
  uint64_t v6 = [v5 hash];

  int64_t v7 = [(_TVContentRating *)self ratingDescription];
  unint64_t v8 = v4 ^ v6 ^ [v7 hash];

  return v8;
}

- (int64_t)ratingSystem
{
  return self->_ratingSystem;
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
}

@end